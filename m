Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA0C1F7B5F
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jun 2020 18:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgFLQEE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Jun 2020 12:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgFLQED (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Jun 2020 12:04:03 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB94C03E96F
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Jun 2020 09:04:03 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e20so11215904ybc.23
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Jun 2020 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Zabd769hisPnKAoRL06k14JG2j91QkSXZfAHCJ/IdNw=;
        b=OHYVvxt6CEH90t/YNr6gMIcYHhrN0v/wurPqHxg06MNIPvnOLAo3P3TsUr4E9kfL3L
         wOdmF4EPWm24y6VhYd+I5l6DMlLsRymvqfuA0PMdoBdY70prd3Y/jC+PbnjTLURBu4Kp
         dh4qqmk3GB54c/CnRVNdWeMaHKcpp83oAgCaHzEc7oCHHjPM0UnM6ou5wkuW5p3W8n9W
         Yh1Dqr2vw5Qj2UkcG7PPKwrket5Ung+/gnKsJ0L0SgRb6J2GdT+MjrVJEOxQj8zVS0Mc
         k6O7OKjpT/WGMuNmYgg8ZT32piQi7/Qb7WDPGxQHdTHcpfIxe1dj7WsPBctXzlFK4T67
         H38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Zabd769hisPnKAoRL06k14JG2j91QkSXZfAHCJ/IdNw=;
        b=n1Us4I3T339N4bXSGdHs1A2evzKHDqmCfWn87tDochY5djElDzjkVVtxRK1EtsLYbS
         6wdRXQGncXj+uR83JVZ+nkFKP8Jytt637dWlKacwweWCe15kZqEU2BZR7Z/KX+2HIiwA
         cX3X2SXz0iO4fgX2JQTtgDYhoIzJICDT+9XIp/c0CMCaiRdCRs4fE9IKJXx6h6+JlTeC
         8ZQnxyI0Z3CxA/7RrHO2syvklRWtX1/YMNRJlpNTfEpP6a9+/kU9hPUin+Nn/jW8cbs5
         9PsBhwCtIrqT6UHB2Rl6bLHj4jGEdByZLJ3o4cTTwcZd/9V9fH9QUxdgFDWRoFRaIK0g
         B7bA==
X-Gm-Message-State: AOAM530t8UH9fDYBKgm0B0Ad4I7qeDXZoBLL86dtWp0KTGXH2JsvjWgs
        bZn0ZxN9s5jyOOV192rW+RXZn4iKPHkDsg==
X-Google-Smtp-Source: ABdhPJxX9D+1AMlhCw7q/DfNrmm6K+OIxI3FWLDJKRQgOpst8sWv6madQBX4aZoaU42ll+m3ng59VZPv21qfEA==
X-Received: by 2002:a25:324f:: with SMTP id y76mr24542057yby.207.1591977842495;
 Fri, 12 Jun 2020 09:04:02 -0700 (PDT)
Date:   Fri, 12 Jun 2020 23:59:43 +0800
Message-Id: <20200612155942.246816-1-woodylin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2] softdog: Add options 'soft_reboot_target' and 'soft_active_on_boot'
From:   Woody Lin <woodylin@google.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, Woody Lin <woodylin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add module parameters 'soft_reboot_target' and 'soft_active_on_boot' for
customizing softdog configuration; config reboot target by assigning
soft_reboot_target, and set soft_active_on_boot to start up softdog
timer at module initialization stage.

Signed-off-by: Woody Lin <woodylin@google.com>
---
 drivers/watchdog/softdog.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..d267af37e066 100644
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
 
+static char *soft_reboot_target;
+module_param(soft_reboot_target, charp, 0000);
+MODULE_PARM_DESC(soft_reboot_target,
+	"Softdog action, set reboot target (default=emergency)");
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
+	kernel_restart(soft_reboot_target);
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
@@ -62,6 +86,16 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
 		panic("Software Watchdog Timer expired");
 	} else {
 		pr_crit("Initiating system reboot\n");
+		if (!soft_reboot_fired && soft_reboot_target != NULL) {
+			static DECLARE_WORK(reboot_work, reboot_work_fn);
+
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
@@ -145,12 +179,19 @@ static int __init softdog_init(void)
 		softdog_preticktock.function = softdog_pretimeout;
 	}
 
+	if (soft_active_on_boot) {
+		set_bit(WDOG_HW_RUNNING, &softdog_dev.status);
+		set_bit(WDOG_ACTIVE, &softdog_dev.status);
+	}
+
 	ret = watchdog_register_device(&softdog_dev);
 	if (ret)
 		return ret;
 
 	pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
 		soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
+	pr_info("             soft_reboot_target=%s soft_active_on_boot=%d\n",
+		soft_reboot_target, soft_active_on_boot);
 
 	return 0;
 }
-- 
2.27.0.290.gba653c62da-goog

