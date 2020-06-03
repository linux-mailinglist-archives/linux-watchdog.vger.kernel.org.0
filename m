Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8131ECDBD
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jun 2020 12:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFCKkr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Jun 2020 06:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgFCKkr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Jun 2020 06:40:47 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A852C08C5C0
        for <linux-watchdog@vger.kernel.org>; Wed,  3 Jun 2020 03:40:47 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id t4so2636304yba.12
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Jun 2020 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Dx8BZCAyOelUut0rl9Q9MMUdQl4nnORmkfsPLfnsf9I=;
        b=mqgtV/eo4BkZHFXXVju/3WABrqnYwuXHGrSz102vmjoxmxHqFFHyQ9a1yN1pIC8KN1
         wDM+RSjgurcfuf6sT4x1Mxxzgnd6OY5HlPZcaJYeBdlmuHfGUyf4/eWjHuF4ULxj9pE9
         u3wHTXd7e4mb680zmVouUfZYkg9FwUuVOm5WdMTdIKC9oCtgjkSRx7TWyiUmHox1thlZ
         /LvSM2TXz7JRrqEaltbg3Lm74U3+7h3f5iztc4ZYJHNcIJVOdZd22SNKWpad70lLHlce
         kqtk1kr6/JFp+f9ykTuurar0kxOCS+jEbvDW1SvZBP7ekq0jL/0vp/0vudM2tlsFeVem
         sr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Dx8BZCAyOelUut0rl9Q9MMUdQl4nnORmkfsPLfnsf9I=;
        b=LJph3tPKGg9vivii6HxSafC1WtnNaw2oH606VoPC0FY151l3c6R3Q47kpkxv9TUBvF
         tmJrSXfsAPTuWn8MuYAJyL3IiyUATcd6Uuwd479cL2BhOuIrGKM8Wr0CQ6zA5mBUY5Xg
         8+Ux5RUH45lUKU1rPY//LXgPv/hTAz/d/iRUdjnJEQ/uOmuNOnpyjKYNXMh5RAml7G3f
         HmfzzOxD2jowCK/2SUqMCj1nrhNDT99JslmhfcEwS29jwAZ559mHtzp1cR4LbBpWZrle
         X05DbRc3DuyGd/LcqdFi18t6TyVKVnEhtRvBpSWsdXjI1P/nJtt81H6vz5EWJ8EEurNo
         jn1g==
X-Gm-Message-State: AOAM530XSjHmTjz/NDEkhwsbAWgGhEnAA7jFUv9vcXlA2QrkLS4Do130
        slFePZqCEJyMbxki9PO8ozc3dOuJM2Glug==
X-Google-Smtp-Source: ABdhPJyoC8t2KMc/aMEktF8cUJY2eR4tlOdFRNKqM99WWDuNN02vdfCr2gf9KKK1yOhvd2wdApd7hw6cxZ+tNQ==
X-Received: by 2002:a25:3203:: with SMTP id y3mr38762116yby.77.1591180846405;
 Wed, 03 Jun 2020 03:40:46 -0700 (PDT)
Date:   Wed,  3 Jun 2020 18:39:24 +0800
Message-Id: <20200603103923.116113-1-woodylin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
Subject: [PATCH] softdog: Add options 'soft_reboot_target' and 'soft_active_on_boot'
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
 drivers/watchdog/softdog.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..f5027acddbbb 100644
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
@@ -49,9 +51,32 @@ module_param(soft_panic, int, 0);
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
+	emergency_restart(); /* Should not reach here */
+	return -EPERM;       /* Should not reach here */
+}
+
+static void reboot_work_fn(struct work_struct *unused)
+{
+	if (IS_ERR(kthread_run(reboot_kthread_fn, NULL, "softdog_reboot")))
+		emergency_restart();
+}
+
 static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
 {
 	module_put(THIS_MODULE);
@@ -62,6 +87,12 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
 		panic("Software Watchdog Timer expired");
 	} else {
 		pr_crit("Initiating system reboot\n");
+		if (soft_reboot_target != NULL) {
+			static DECLARE_WORK(reboot_work, reboot_work_fn);
+
+			schedule_work(&reboot_work);
+			return HRTIMER_NORESTART;
+		}
 		emergency_restart();
 		pr_crit("Reboot didn't ?????\n");
 	}
@@ -145,12 +176,19 @@ static int __init softdog_init(void)
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
2.27.0.rc2.251.g90737beb825-goog

