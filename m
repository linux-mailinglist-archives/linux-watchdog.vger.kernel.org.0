Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35850218297
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jul 2020 10:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgGHIgB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jul 2020 04:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgGHIf7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jul 2020 04:35:59 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985F8C08C5DC
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Jul 2020 01:35:58 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id j18so28896762qvk.1
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jul 2020 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Yc3mqXNPbBr3iDOp2efDPDBdbhAng+8q+AaK37vlDZQ=;
        b=vIkGHYVrpHuqQTyUqybbBRuTBD9cUsxN3/YDagFTbXxaNP/PUt5+QqfX/QNw7X5IeR
         ZFdMvQCnqcguCo8azZp97dd6of/9gosFq3pgVmkPX8FRDSqZO3+4qm0ycFmbJ6LD5nLX
         PE1ljb7aoPMwuL/ZmsnT6c9mWW62R/MqMvpoklLp00YZGAkhqeWJOiGjEhPq4JllNrGh
         aegCTpduB16Saiopx26jHfJs3c3e2CJ4TOgCXAPv/8jdih2WziHBlbMqhTpiOefp8YqI
         RU7tUGw0vIlCO8zrycOmxZ5BlpLkbo2HE9Ih8jb/ak9bUgwMKr1P2tfT241HXEgeSCsj
         K3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Yc3mqXNPbBr3iDOp2efDPDBdbhAng+8q+AaK37vlDZQ=;
        b=Ly9zz5yPARMyZ7JM3Up2PpTWKyTcPIC1KwG6GSj4f4Xi7PeEunb/4jt8UcbOMiFj6C
         6uREgrTogDhk04rUigHaVl6/TNsKhiz3RdUxMjnbF963JKWsN2nKqYHjRQOOnSnbM/xj
         n/XR3D8ml8e9JoII2aHjMDzZJGYNi3p9zCPldwgsadBUAa68JvicByGM5MurId4u5NVv
         bfkcYCT6LnrQJWDhiO630eApmXC0bq4kh4qHowQXsQ+OGcLwNLBnoFMbxDD59OJLGQ1u
         m1i8MfH3OrQYf5awJR7hKvFKvYces1oeaPzRAVaJ9LGRbmQbouorkuwL12b9ORMHSdCD
         9CEQ==
X-Gm-Message-State: AOAM532j7GMu48Gwu9H4UIEyi2g+wIBQ9gvCURaRplhKnw/kbLoH7HmE
        3mxApKUhGg18BkeBTtbpIHc58t4Nj485JA==
X-Google-Smtp-Source: ABdhPJz9BxOYrDjrxYPtk3Dyes0X4EdALlpOfgTRpFUO2s5ga8wilFqmnW/PGnqGPrWDm4u2rvU6e6QtV1/MUA==
X-Received: by 2002:ad4:424a:: with SMTP id l10mr10571155qvq.29.1594197357728;
 Wed, 08 Jul 2020 01:35:57 -0700 (PDT)
Date:   Wed,  8 Jul 2020 16:32:19 +0800
Message-Id: <20200708083218.3157213-1-woodylin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v4] softdog: Add options 'soft_reboot_cmd' and
 'soft_active_on_boot'
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
 drivers/watchdog/softdog.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..7a1096265f18 100644
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
@@ -49,11 +51,34 @@ module_param(soft_panic, int, 0);
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
+
 	module_put(THIS_MODULE);
 	if (soft_noboot) {
 		pr_crit("Triggered - Reboot ignored\n");
@@ -62,6 +87,33 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
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
@@ -145,12 +197,17 @@ static int __init softdog_init(void)
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
+		soft_reboot_cmd ?: "<not set>", soft_active_on_boot);
 
 	return 0;
 }
-- 
2.27.0.383.g050319c2ae-goog

