Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FCC36A0AC
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 12:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbhDXKrK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 06:47:10 -0400
Received: from jptosegrel01.sonyericsson.com ([124.215.201.71]:6263 "EHLO
        JPTOSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234863AbhDXKrJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 06:47:09 -0400
From:   Peter Enderborg <peter.enderborg@sony.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, Shakeel Butt <shakeelb@google.com>
CC:     Peter Enderborg <peter.enderborg@sony.com>
Subject: [RFC PATCH] watchdog: Adding softwatchdog
Date:   Sat, 24 Apr 2021 12:25:55 +0200
Message-ID: <20210424102555.28203-2-peter.enderborg@sony.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210424102555.28203-1-peter.enderborg@sony.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Type: text/plain
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0 a=9drRLWArJOlETflmpfiyCA==:117 a=3YhXtTcJ-WEA:10 a=z6gsHLkEAAAA:8 a=RqRXqJRfj2_RYSAdz1oA:9 a=d-OLMTCWyvARjPbQ-enb:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is not a rebooting watchdog. It's function is to take other
actions than a hard reboot. On many complex system there is some
kind of manager that monitor and take action on slow systems.
Android has it's lowmemorykiller (lmkd), desktops has earlyoom.
This watchdog can be used to help monitor to preform some basic
action to keep the monitor running.

It can also be used standalone. This add a policy that is
killing the process with highest oom_score_adj and using
oom functions to it quickly. I think it is a good usecase
for the patch. Memory siuations can be problematic for
software that monitor system, but other prolicys can
should also be possible. Like picking tasks from a memcg, or
specific UID's or what ever is low priority.
---
 drivers/watchdog/Makefile       |   2 +
 drivers/watchdog/softwatchdog.c | 231 ++++++++++++++++++++++++++++++++
 include/uapi/linux/watchdog.h   |   6 +
 mm/oom_kill.c                   |   4 +-
 4 files changed, 241 insertions(+), 2 deletions(-)
 create mode 100644 drivers/watchdog/softwatchdog.c

diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f3a6540e725e..bff8f61fe504 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -221,3 +221,5 @@ obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
 obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
 obj-$(CONFIG_STPMIC1_WATCHDOG) += stpmic1_wdt.o
 obj-$(CONFIG_SL28CPLD_WATCHDOG) += sl28cpld_wdt.o
+
+obj-y += softwatchdog.o
diff --git a/drivers/watchdog/softwatchdog.c b/drivers/watchdog/softwatchdog.c
new file mode 100644
index 000000000000..dd7153092da8
--- /dev/null
+++ b/drivers/watchdog/softwatchdog.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Soft watchdog
+ *  This is a RFC of a watchdog does do not reboot the system.
+ *  Instead it do a pre defined action
+ *
+ *  Author: peter.enderborg@sony.com
+ */
+
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/oom.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/types.h>
+#include <linux/timer.h>
+#include <linux/miscdevice.h>
+#include <linux/watchdog.h>
+#include <linux/notifier.h>
+#include <linux/init.h>
+#include <linux/fs.h>
+
+void wake_oom_reaper(struct task_struct *tsk); /* need to public ... */
+void __oom_kill_process(struct task_struct *victim, const char *message); /* hmm */
+
+static struct timer_list swd_timer;
+static int heartbeat = 500;
+static unsigned long swd_is_open;
+static char expect_close;
+static bool nowayout = WATCHDOG_NOWAYOUT;
+
+/* a example policy doing a process kill by calling
+ *  functions within oom-killer.
+ */
+static int policy_fast_kill_oom_score_adj(void)
+{
+	struct task_struct *tsk;
+	struct task_struct *selected = NULL;
+	int highest = 0;
+
+	rcu_read_lock();
+	for_each_process(tsk) {
+		struct task_struct *candidate;
+
+		if (tsk->flags & PF_KTHREAD)
+			continue;
+
+		/* Ignore task if coredump in progress */
+		if (tsk->mm && tsk->mm->core_state)
+			continue;
+		candidate = find_lock_task_mm(tsk);
+		if (!candidate)
+			continue;
+
+		if (highest < candidate->signal->oom_score_adj) {
+			/* for test dont kill level 0 */
+			highest = candidate->signal->oom_score_adj;
+			selected = candidate;
+			pr_info("new selected %d %d", selected->pid,
+				selected->signal->oom_score_adj);
+		}
+		task_unlock(candidate);
+	}
+	if (selected)
+		get_task_struct(selected);
+
+	rcu_read_unlock();
+	if (selected) {
+		int pid = selected->pid;
+
+		pr_info("swd killing: %d", selected->pid);
+		__oom_kill_process(selected, "swd");
+		return pid;
+	}
+	return 0;
+}
+
+static void swd_ping(void)
+{
+	mod_timer(&swd_timer, jiffies + heartbeat);
+}
+
+static long swd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	int __user *p = argp;
+	int new_heartbeat;
+	int status;
+
+	struct watchdog_info ident = {
+		.options =		WDIOF_SETTIMEOUT|
+					WDIOF_MAGICCLOSE|
+					WDIOF_OOMKILL |
+					WDIOF_AUTOKILL,
+		.identity =		"swd",
+	};
+
+	switch (cmd) {
+	case WDIOC_GETSUPPORT:
+		return copy_to_user(argp, &ident, sizeof(ident)) ? -EFAULT : 0;
+	case WDIOC_GETSTATUS:
+		status = 0;
+		return put_user(status, p);
+	case WDIOC_GETBOOTSTATUS:
+		return put_user(0, p);
+	case WDIOC_KEEPALIVE:
+		swd_ping();
+		return 0;
+	case WDIOC_SETTIMEOUT:
+		if (get_user(new_heartbeat, p))
+			return -EFAULT;
+		heartbeat = new_heartbeat;
+		fallthrough;
+	case WDIOC_GETTIMEOUT:
+		return put_user(heartbeat, p);
+	default:
+		return -ENOTTY;
+	}
+	return -ENOTTY;
+}
+
+static void swd_timer_func(struct timer_list *unused)
+{
+	int res;
+
+	pr_info("swd timer %d\n", heartbeat);
+	res = policy_fast_kill_oom_score_adj();
+	if (res)
+		pr_info("killed %d\n", res);
+
+	mod_timer(&swd_timer, jiffies + heartbeat);
+}
+
+static int swd_start(void)
+{
+	add_timer(&swd_timer);
+	return 0;
+}
+
+static int swd_stop(void)
+{
+	del_timer(&swd_timer);
+	return 0;
+}
+
+static int swd_open(struct inode *inode, struct file *file)
+{
+	if (test_and_set_bit(0, &swd_is_open))
+		return -EBUSY;
+	swd_start();
+	return stream_open(inode, file);
+}
+
+static int swd_release(struct inode *inode, struct file *file)
+{
+	if (expect_close != 42) {
+		swd_stop();
+		clear_bit(0, &swd_is_open);
+	} else {
+		pr_crit("SWD device closed unexpectedly.  SWD will not stop!\n");
+		swd_ping();
+	}
+	expect_close = 0;
+	return 0;
+}
+static ssize_t swd_write(struct file *file, const char __user *buf,
+						size_t count, loff_t *ppos)
+{
+	if (count) {
+		if (!nowayout) {
+			size_t i;
+
+			expect_close = 0;
+			for (i = 0; i != count; i++) {
+				char c;
+
+				if (get_user(c, buf + i))
+					return -EFAULT;
+				if (c == 'V')
+					expect_close = 42;
+			}
+		}
+		swd_ping();
+	}
+	return count;
+}
+
+static const struct file_operations swd_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_llseek,
+	 .write		= swd_write,
+	.unlocked_ioctl	= swd_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.open		= swd_open,
+	.release	= swd_release,
+};
+
+static struct miscdevice swd_miscdev = {
+	.minor	=	WATCHDOG_MINOR,
+	.name	=	"soft-watchdog",
+	.fops	=	&swd_fops,
+};
+
+int __init swd_register(void)
+{
+	int ret;
+
+	pr_info("swd installed with timer");
+	ret = misc_register(&swd_miscdev);
+	timer_setup(&swd_timer, swd_timer_func, 0);
+	return 0;
+}
+
+static int __init swd_init(void)
+{
+	return 0;
+}
+
+static void __exit swd_unload(void)
+{
+	return;
+}
+
+subsys_initcall(swd_register);
+
+module_init(swd_init);
+module_exit(swd_unload);
+
+MODULE_AUTHOR("Peter Enderborg");
+MODULE_DESCRIPTION("Memory software watchdog");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index b15cde5c9054..780987482e2d 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -48,6 +48,12 @@ struct watchdog_info {
 #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
 #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
 					   other external alarm not a reboot */
+#define WDIOF_OOMKILL		0x0800	/* Watchdog trigger process kill as
+					 *  oom kill
+					 */
+#define WDIOF_AUTOKILL		0x1000	/* Watchdog listen to oom notifiy
+					 * and kills with its policy
+					 */
 #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
 
 #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index fa1cf18bac97..a5f7299af9a3 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -658,7 +658,7 @@ static int oom_reaper(void *unused)
 	return 0;
 }
 
-static void wake_oom_reaper(struct task_struct *tsk)
+void wake_oom_reaper(struct task_struct *tsk)
 {
 	/* mm is already queued? */
 	if (test_and_set_bit(MMF_OOM_REAP_QUEUED, &tsk->signal->oom_mm->flags))
@@ -856,7 +856,7 @@ static bool task_will_free_mem(struct task_struct *task)
 	return ret;
 }
 
-static void __oom_kill_process(struct task_struct *victim, const char *message)
+void __oom_kill_process(struct task_struct *victim, const char *message)
 {
 	struct task_struct *p;
 	struct mm_struct *mm;
-- 
2.17.1

