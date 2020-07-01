Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A293210A00
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 13:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbgGALEa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jul 2020 07:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730202AbgGALE3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jul 2020 07:04:29 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D818FC061755
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jul 2020 04:04:28 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j3so26147558yba.14
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jul 2020 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=t8UIv8OCBdFSlfH8WcuPC7BgMOwuSg0GOer8MWGdwI4=;
        b=GXhjl7JPotLn0ZyLk0+tSraoJOuXZajMMPTu6L26AbxxcyqvK4+OMkqjAGWhmOrDFi
         R7ahpl+B1kU+Jt6+rnVQDEE8LvnyHWCffDCtkpOYd5VdFQzfGsoJh5Y6oCvsmHyQbHp5
         MiVsqtvV6f6mU9N360Gsovy0xwWEEo/STi1Z3ATvp6Mu70vMUvBqPR3M1esowxXZdCYk
         6OAu4EbOE1RV4mFlaYx+g6dyGN6LHMe+Qc9PhRE9+PpV5quvfF6ra+o55hlBCNwsA/0y
         23Mes8j42BWoc3ajOyhIqZfCQH63BOIl9HDTGaRxLuy/amZmRdS2Dpn5Ism5D3HcwdKd
         V/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=t8UIv8OCBdFSlfH8WcuPC7BgMOwuSg0GOer8MWGdwI4=;
        b=E0KcEntMRJe0eU5vyo/yi9FQ0gh0jeLLybXDxh838yMI/ss1xVNGWyrGb7TJ6viXjw
         CRyQIg4lC+455fQcmR7xrU+n6WvcnOEE/pc5BZgRmIYs7Fl8y0CMd8u3G0NU9sdCteZ1
         M5l5i7DH5Gwawzb9mqp1B3QnTdOGHaRof4eII3u0MkQrf8DjqYpmsPTzGHj4hXFc/4D3
         cRyqDSpT0oN8mw2d+Q+5srEc2uXqd+uqe4JgQcrmLw7/2jwQ07FSObSbVRrzs2WdI4XU
         dM2JNN5t3GgzupeXmCD4bq2n8kTG3LqM+u204bfQSD/chX37Lumy5E2kYvim3mahmVid
         TfQQ==
X-Gm-Message-State: AOAM530M0XvqzLPqtZe1PyzIZkIN0eVwxfZDpTybAfC2pJjbFuOa2ch4
        u18eMgfmdg+OCYppZcQzC6Au0/hJQ1fTyg==
X-Google-Smtp-Source: ABdhPJypmVDPxtS/LjlwoJEFxLSnlJ3LmBNDgsfH3leKes7N0MS6dbZGi/yTIWfYZxUu/itRtrpNEFaIV1J3TA==
X-Received: by 2002:a25:be02:: with SMTP id h2mr41751730ybk.315.1593601467846;
 Wed, 01 Jul 2020 04:04:27 -0700 (PDT)
Date:   Wed,  1 Jul 2020 19:03:40 +0800
Message-Id: <20200701110339.2833449-1-woodylin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and 'soft_active_on_boot'
From:   Woody Lin <woodylin@google.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, Woody Lin <woodylin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
customizing softdog configuration; config reboot command by assigning
soft_reboot_cmd, and set soft_active_on_boot to start up softdog
timer at module initialization stage.

Signed-off-by: Woody Lin <woodylin@google.com>
---
 drivers/watchdog/softdog.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..8c8d214b6aa7 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -20,11 +20,13 @@
 #include <linux/hrtimer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/workqueue.h>
 
 #define TIMER_MARGIN	60		/* Default is 60 seconds */
 static unsigned int soft_margin = TIMER_MARGIN;	/* in seconds */
@@ -49,11 +51,33 @@ module_param(soft_panic, int, 0);
 MODULE_PARM_DESC(soft_panic,
 	"Softdog action, set to 1 to panic, 0 to reboot (default=0)");
 
+static char *soft_reboot_cmd;
+module_param(soft_reboot_cmd, charp, 0000);
+MODULE_PARM_DESC(soft_reboot_cmd,
+	"Set reboot command. Emergency reboot takes place if unset");
+
+static bool soft_active_on_boot;
+module_param(soft_active_on_boot, bool, 0000);
+MODULE_PARM_DESC(soft_active_on_boot,
+	"Set to true to active Softdog on boot (default=false)");
+
 static struct hrtimer softdog_ticktock;
 static struct hrtimer softdog_preticktock;
 
+static int reboot_kthread_fn(void *data)
+{
+	kernel_restart(soft_reboot_cmd);
+	return -EPERM; /* Should not reach here */
+}
+
+static void reboot_work_fn(struct work_struct *unused)
+{
+	kthread_run(reboot_kthread_fn, NULL, "softdog_reboot");
+}
+
 static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
 {
+	static bool soft_reboot_fired;
 	module_put(THIS_MODULE);
 	if (soft_noboot) {
 		pr_crit("Triggered - Reboot ignored\n");
@@ -62,6 +86,33 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
 		panic("Software Watchdog Timer expired");
 	} else {
 		pr_crit("Initiating system reboot\n");
+		if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
+			static DECLARE_WORK(reboot_work, reboot_work_fn);
+			/*
+			 * The 'kernel_restart' is a 'might-sleep' operation.
+			 * Also, executing it in system-wide workqueues blocks
+			 * any driver from using the same workqueue in its
+			 * shutdown callback function. Thus, we should execute
+			 * the 'kernel_restart' in a standalone kernel thread.
+			 * But since starting a kernel thread is also a
+			 * 'might-sleep' operation, so the 'reboot_work' is
+			 * required as a launcher of the kernel thread.
+			 *
+			 * After request the reboot, restart the timer to
+			 * schedule an 'emergency_restart' reboot after
+			 * 'TIMER_MARGIN' seconds. It's because if the softdog
+			 * hangs, it might be because of scheduling issues. And
+			 * if that is the case, both 'schedule_work' and
+			 * 'kernel_restart' may possibly be malfunctional at the
+			 * same time.
+			 */
+			soft_reboot_fired = true;
+			schedule_work(&reboot_work);
+			hrtimer_add_expires_ns(timer,
+					(u64)TIMER_MARGIN * NSEC_PER_SEC);
+
+			return HRTIMER_RESTART;
+		}
 		emergency_restart();
 		pr_crit("Reboot didn't ?????\n");
 	}
@@ -145,12 +196,17 @@ static int __init softdog_init(void)
 		softdog_preticktock.function = softdog_pretimeout;
 	}
 
+	if (soft_active_on_boot)
+		softdog_ping(&softdog_dev);
+
 	ret = watchdog_register_device(&softdog_dev);
 	if (ret)
 		return ret;
 
 	pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
 		soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
+	pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
+		soft_reboot_cmd, soft_active_on_boot);
 
 	return 0;
 }
-- 
2.27.0.212.ge8ba1cc988-goog

