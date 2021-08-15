Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE58A3EC6BE
	for <lists+linux-watchdog@lfdr.de>; Sun, 15 Aug 2021 04:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhHOCan (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 Aug 2021 22:30:43 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:46128 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229453AbhHOCan (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 Aug 2021 22:30:43 -0400
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17F2FZpU026081;
        Sun, 15 Aug 2021 02:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=iBjtgQ90Lbk2fUblGFAuQMhqgWiZ38a9Qfugw/UyNZ0=;
 b=hG3Kv5JX+V2qS1VYi5wBsMz6zPrQkjKFZrR8bH3Uag/nu1f4v5W+75x1ztmTdf1EuIxQ
 LqI/eOdjdnomUACjCF67WxNewYVZdattfEDK6zs5ydhKRS1oYPnfM5sRW2+QO2ZHIA0t
 //uZhsaEFv311lYipOUx+hDZJYZhgoPHFJkMOE8qMDRdiD/OYB+aspbnrjtM1WVvarPR
 zv0fxeaqgEmr0u1Yqgywm1K6hlAIPjYWhT27mgsbdqEqhVGCUG7qNxnxyrA52lrXpBni
 EIQYn39RwnIZKEMxmPMsy6+gQb2WqC/DuvwdVrtnvB6cN/vKr8G17KJvWOTnlBikFLHI xw== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 3ae71hc9dg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 15 Aug 2021 02:29:59 +0000
Received: from hpnsw-phaguraws.rose.rdlabs.hpecorp.net (unknown [16.93.60.123])
        by g2t2352.austin.hpe.com (Postfix) with ESMTP id 0DA9263;
        Sun, 15 Aug 2021 02:29:58 +0000 (UTC)
From:   Curtis Klein <curtis.klein@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     curtis.klein@hpe.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6] watchdog: Extend watchdog timeout during kernel panic
Date:   Sat, 14 Aug 2021 19:29:58 -0700
Message-Id: <1628994598-30907-1-git-send-email-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-ORIG-GUID: Yc6tYXb1xsImTcS6mhHcoTmjBj1Qskkr
X-Proofpoint-GUID: Yc6tYXb1xsImTcS6mhHcoTmjBj1Qskkr
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-14_09:2021-08-13,2021-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108150013
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: JP Ertola <jp.ertola@hpe.com>

If the watchdog timeout is set such that the crash kernel does not
have time to collect a coredump and the crash kernel is not equipped to
ping the watchdog timer itself, then a kernel coredump will not be
collected before the watchdog fires. This change registers a panic
notifier and callback so the watchdog timeout can be extended if a
kernel panic occurs. This timeout extension would give the crash kernel
enough time to collect a coredump before the CPU resets. The watchdog
timeout is extended if and only if a crash kernel image is loaded in
memory, the watchdog is active at the time of the panic, and the kconfig
setting is set.

A Kconfig option has been added to configure the timeout duration at
compile-time. Default is zero seconds.

Signed-off-by: JP Ertola <jp.ertola@hpe.com>
Co-developed-by: Curtis Klein <curtis.klein@hpe.com>
Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
v6: 
 - Only register panic notifier if wdt_panic_timeout is set. 
 - Exit notifier callback early if watchdog is not active and hw is not running
 - Handle more scenarios where the wdt_panic_timeout is invalid.
 - Unregister notifier in watchdog_dev_unregister.
 - Rework notifier callback flow

v5: Clean up variable names and spacing. Call __watchdog_ping() instead of 
wdd->ops->ping(). Remove notifier_from_errno() as it could cause unintended
behavior in the future if this watchdog extension notifier has its priority
elevated above minimum.
v4: Remove optional callback mechanism alltogether. I agree with Guenter,
not widely used.
v3: Fix logic so timeout extension is not longer than wdd->max_timeout
v2: Remove dead code and comments.

 drivers/watchdog/Kconfig        | 13 +++++++
 drivers/watchdog/watchdog_dev.c | 84 ++++++++++++++++++++++++++++++++++-------
 include/linux/watchdog.h        |  1 +
 3 files changed, 84 insertions(+), 14 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 546dfc1..e7c6230 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -149,6 +149,19 @@ comment "Watchdog Device Drivers"
 
 # Architecture Independent
 
+config DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT
+	int "Default timeout for watchdog timer before crash kernel starts (seconds)"
+	default 0
+	help
+	  This option allows an extended timeout to be used for the watchdog when
+	  the kernel panics and a crash kernel is about to start. This is helpful
+	  when the existing WDT timeout value is less than the time required for
+	  crash kernel to run and the crash kernel is unable to handle the
+	  the watchdog itself. The timeout extension happens last in chain of
+	  kernel panic handler callbacks just in case another panic handler
+	  hangs unexpectedly. When this value is set to 0, the watchdog timeout
+	  will not be changed.
+
 config SOFT_WATCHDOG
 	tristate "Software watchdog"
 	select WATCHDOG_CORE
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab324..68e1281 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -29,20 +29,22 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/cdev.h>		/* For character device */
-#include <linux/errno.h>	/* For the -ENODEV/... values */
-#include <linux/fs.h>		/* For file operations */
-#include <linux/init.h>		/* For __init/__exit/... */
-#include <linux/hrtimer.h>	/* For hrtimers */
-#include <linux/kernel.h>	/* For printk/panic/... */
-#include <linux/kthread.h>	/* For kthread_work */
-#include <linux/miscdevice.h>	/* For handling misc devices */
-#include <linux/module.h>	/* For module stuff/... */
-#include <linux/mutex.h>	/* For mutexes */
-#include <linux/slab.h>		/* For memory functions */
-#include <linux/types.h>	/* For standard types (like size_t) */
-#include <linux/watchdog.h>	/* For watchdog specific items */
-#include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
+#include <linux/cdev.h>		    /* For character device */
+#include <linux/errno.h>	    /* For the -ENODEV/... values */
+#include <linux/fs.h>		    /* For file operations */
+#include <linux/init.h>		    /* For __init/__exit/... */
+#include <linux/hrtimer.h>	    /* For hrtimers */
+#include <linux/kernel.h>	    /* For printk/panic/... */
+#include <linux/kexec.h>	    /* For checking if crash kernel is loaded */
+#include <linux/kthread.h>	    /* For kthread_work */
+#include <linux/miscdevice.h>	    /* For handling misc devices */
+#include <linux/module.h>	    /* For module stuff/... */
+#include <linux/mutex.h>	    /* For mutexes */
+#include <linux/panic_notifier.h>   /* For panic_notifier_list */
+#include <linux/slab.h>		    /* For memory functions */
+#include <linux/types.h>	    /* For standard types (like size_t) */
+#include <linux/watchdog.h>	    /* For watchdog specific items */
+#include <linux/uaccess.h>	    /* For copy_to_user/put_user/... */
 
 #include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
@@ -57,6 +59,9 @@ static struct kthread_worker *watchdog_kworker;
 static bool handle_boot_enabled =
 	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
 
+static unsigned int wdt_panic_timeout =
+	CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT;
+
 static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
 
 static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
@@ -818,6 +823,43 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 	return err;
 }
 
+static int watchdog_panic_notifier(struct notifier_block *nb,
+	unsigned long code, void *data)
+{
+	struct watchdog_device *wdd = container_of(nb, struct watchdog_device, panic_nb);
+	unsigned int timeout = wdt_panic_timeout;
+	int set_timeout_ret, ping_ret;
+
+	if (wdd == NULL || wdt_panic_timeout == 0 || kexec_crash_image == NULL ||
+	    !(watchdog_active(wdd) || watchdog_hw_running(wdd)))
+		return NOTIFY_DONE;
+
+	if (wdd->max_hw_heartbeat_ms && wdd->max_hw_heartbeat_ms < wdt_panic_timeout * 1000)
+		timeout = wdd->max_hw_heartbeat_ms / 1000;
+	else if (watchdog_timeout_invalid(wdd, wdt_panic_timeout))
+		timeout = wdd->max_timeout;
+
+	if (timeout != wdt_panic_timeout)
+		pr_err("watchdog%d: Cannot set specified panic timeout, using %ds.\n",
+			wdd->id, timeout);
+
+	set_timeout_ret = watchdog_set_timeout(wdd, timeout);
+	if (set_timeout_ret)
+		pr_err("watchdog%d: Failed to extend watchdog timeout (%d)\n",
+			wdd->id, set_timeout_ret);
+
+	ping_ret = watchdog_ping(wdd);
+	if (ping_ret)
+		pr_warn("watchdog%d: Failed to ping watchdog (%d)\n",
+			wdd->id, ping_ret);
+
+	if (set_timeout_ret == 0 && ping_ret == 0)
+		pr_info("watchdog%d: Extended watchdog timeout to %d seconds\n",
+			wdd->id, timeout);
+
+	return NOTIFY_DONE;
+}
+
 /*
  *	watchdog_open: open the /dev/watchdog* devices.
  *	@inode: inode of device
@@ -1129,6 +1171,17 @@ int watchdog_dev_register(struct watchdog_device *wdd)
 	if (ret)
 		watchdog_cdev_unregister(wdd);
 
+	if (wdt_panic_timeout) {
+		wdd->panic_nb.priority = INT_MIN; /* Run last */
+		wdd->panic_nb.notifier_call = watchdog_panic_notifier;
+
+		ret = atomic_notifier_chain_register(&panic_notifier_list,
+						     &wdd->panic_nb);
+		if (ret)
+			pr_warn("watchdog%d: Cannot register panic notifier (%d)\n",
+				wdd->id, ret);
+	}
+
 	return ret;
 }
 
@@ -1142,6 +1195,9 @@ int watchdog_dev_register(struct watchdog_device *wdd)
 
 void watchdog_dev_unregister(struct watchdog_device *wdd)
 {
+	if (wdt_panic_timeout)
+		atomic_notifier_chain_unregister(&panic_notifier_list, &wdd->panic_nb);
+
 	watchdog_unregister_pretimeout(wdd);
 	watchdog_cdev_unregister(wdd);
 }
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 9b19e6b..bc7e6e8 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -107,6 +107,7 @@ struct watchdog_device {
 	unsigned int max_hw_heartbeat_ms;
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
+	struct notifier_block panic_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
-- 
2.7.4

