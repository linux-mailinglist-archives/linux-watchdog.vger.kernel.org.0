Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC56D3AD32A
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jun 2021 21:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhFRTxQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Jun 2021 15:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbhFRTxP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Jun 2021 15:53:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A0BC061767
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Jun 2021 12:51:04 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id d2so15516571ljj.11
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Jun 2021 12:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SXSfZ0yjSVsxn5eRKp0etGkWpRG1f0QQ/H1nKyqZJz0=;
        b=CwQItVsdahafPhOTHmMogTMFf7+NUnLo1por+XzOBH/LH0csLGG5782/VVxCMS+ZHn
         MVMn8q6c+ZxVFsAPoL79OcryTkDl2JxtN50vWi45WEOMoqBGmtPPf9WnvE44cLnJze39
         fFpdJWInV1Pkg38VNiDtbgglrLjG8oSM05cfKnu9Ds3FsIirSDw9wBG+zdwD4jDUNt4w
         er3G7lT33crWuODMlC+nFZoGSWcL7rnKEPivBJHUe3xXgNjsZzLSm2xsZ3wPdY0G1MQA
         A6td3CvITLFPUn7X0jaa5Qp8+C1tvagVU3piXhF18FivnZOif+LE4zKWirdlC+IMCDIk
         VVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SXSfZ0yjSVsxn5eRKp0etGkWpRG1f0QQ/H1nKyqZJz0=;
        b=Xm4m8Rv0AcwI/EC/knDYFTNkYMzMURB4wZgaeDhoCehcNPx6zb6vbFHJgqDqm7tce/
         PSg+Ffjn1shig2mxZKwKLU79p1ucJWg84u6/YJabbYceyFZP6kHETpxYac7kGf5DWxb7
         SpwGnH+jlpnb/GPfPwoYin4rY+o9tFu9PYibMZpYtADYxl1WorMpvpnCERIF4gjnYBVh
         mdbeLJ3Kh3CGqzuI8/mYT3VyzDuy9XLXhQepDJmtuHby2/gM4Nw3ybl72gOcE3rMeIYE
         ObWXLdOzP8TRNubzuGPB/dfNXtr57ZEB9Bz2W43VVIeFNljp/dHIxohMoZE1u/2obXGB
         PtMg==
X-Gm-Message-State: AOAM533mhuHE0NSA/7J94tXdesmhjcfpbCkEKTiG/kE18Sqw7d2obWha
        F/n2fCczrS3wqe0reIx0cIk4Pg==
X-Google-Smtp-Source: ABdhPJyguDxhRVQWnbUso4LtDCyc81qr9r3ZDR8l3tHWgADZYyuaKzyiKBdMvmiZcjyGeHnEjFi+SQ==
X-Received: by 2002:a2e:5850:: with SMTP id x16mr10813908ljd.231.1624045863309;
        Fri, 18 Jun 2021 12:51:03 -0700 (PDT)
Received: from gilgamesh.lab.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id o7sm993221lfu.215.2021.06.18.12.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:51:02 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org
Subject: [PATCH v2 1/2] watchdog: introduce watchdog_dev_suspend/resume
Date:   Fri, 18 Jun 2021 21:50:32 +0200
Message-Id: <20210618195033.3209598-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
References: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog drivers often disable wdog clock during suspend and then
enable it again during resume. Nevertheless the ping worker is still
running and can issue low-level ping while the wdog clock is disabled
causing the system hang. To prevent such condition register pm notifier
in the watchdog core which will call watchdog_dev_suspend/resume and
actually cancel ping worker during suspend and restore it back, if
needed, during resume.

Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
- Instead of using watchdog_dev_suspend/resume directly in wdog drivers
suspend/resume callbacks, register pm notifier in the watchdog core when
new WDOG_NO_PING_ON_SUSPEND status flag is set by the driver. Suggested
by Guenter Roeck <linux@roeck-us.net>.
- Initialize ret variable in watchdog_dev_suspend/resume.
- Drop EXPORT_SYMBOL_GPL for watchdog_dev_suspend/resume since from now
one they are used only by the watchdog core and not by the drivers.
- Commit log was updated accordingly.
---
 drivers/watchdog/watchdog_core.c | 37 +++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/watchdog.h         | 10 +++++++
 3 files changed, 94 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 5df0a22e2cb4..3fe8a7edc252 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -34,6 +34,7 @@
 #include <linux/idr.h>		/* For ida_* macros */
 #include <linux/err.h>		/* For IS_ERR macros */
 #include <linux/of.h>		/* For of_get_timeout_sec */
+#include <linux/suspend.h>
 
 #include "watchdog_core.h"	/* For watchdog_dev_register/... */
 
@@ -185,6 +186,33 @@ static int watchdog_restart_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+static int watchdog_pm_notifier(struct notifier_block *nb, unsigned long mode,
+				void *data)
+{
+	struct watchdog_device *wdd;
+	int ret = 0;
+
+	wdd = container_of(nb, struct watchdog_device, pm_nb);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = watchdog_dev_suspend(wdd);
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = watchdog_dev_resume(wdd);
+		break;
+	}
+
+	if (ret)
+		return NOTIFY_BAD;
+
+	return NOTIFY_DONE;
+}
+
 /**
  * watchdog_set_restart_priority - Change priority of restart handler
  * @wdd: watchdog device
@@ -292,6 +320,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 				wdd->id, ret);
 	}
 
+	if (test_bit(WDOG_NO_PING_ON_SUSPEND, &wdd->status)) {
+		wdd->pm_nb.notifier_call = watchdog_pm_notifier;
+
+		ret = register_pm_notifier(&wdd->pm_nb);
+		if (ret)
+			pr_warn("watchdog%d: Cannot register pm handler (%d)\n",
+				wdd->id, ret);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a63110..9d1c340a3024 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1219,6 +1219,53 @@ void __exit watchdog_dev_exit(void)
 	kthread_destroy_worker(watchdog_kworker);
 }
 
+int watchdog_dev_suspend(struct watchdog_device *wdd)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+	int ret = 0;
+
+	if (!wdd->wd_data)
+		return -ENODEV;
+
+	/* ping for the last time before suspend */
+	mutex_lock(&wd_data->lock);
+	if (watchdog_worker_should_ping(wd_data))
+		ret = __watchdog_ping(wd_data->wdd);
+	mutex_unlock(&wd_data->lock);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * make sure that watchdog worker will not kick in when the wdog is
+	 * suspended
+	 */
+	hrtimer_cancel(&wd_data->timer);
+	kthread_cancel_work_sync(&wd_data->work);
+
+	return 0;
+}
+
+int watchdog_dev_resume(struct watchdog_device *wdd)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+	int ret = 0;
+
+	if (!wdd->wd_data)
+		return -ENODEV;
+
+	/*
+	 * __watchdog_ping will also retrigger hrtimer and therefore restore the
+	 * ping worker if needed.
+	 */
+	mutex_lock(&wd_data->lock);
+	if (watchdog_worker_should_ping(wd_data))
+		ret = __watchdog_ping(wd_data->wdd);
+	mutex_unlock(&wd_data->lock);
+
+	return ret;
+}
+
 module_param(handle_boot_enabled, bool, 0444);
 MODULE_PARM_DESC(handle_boot_enabled,
 	"Watchdog core auto-updates boot enabled watchdogs before userspace takes over (default="
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 9b19e6bb68b5..99660197a36c 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -107,6 +107,7 @@ struct watchdog_device {
 	unsigned int max_hw_heartbeat_ms;
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
+	struct notifier_block pm_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
@@ -116,6 +117,7 @@ struct watchdog_device {
 #define WDOG_STOP_ON_REBOOT	2	/* Should be stopped on reboot */
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
+#define WDOG_NO_PING_ON_SUSPEND	5	/* Ping worker should be stopped on suspend */
 	struct list_head deferred;
 };
 
@@ -156,6 +158,12 @@ static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd)
 	set_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status);
 }
 
+/* Use the following function to stop the wdog ping worker when suspending */
+static inline void watchdog_stop_ping_on_suspend(struct watchdog_device *wdd)
+{
+	set_bit(WDOG_NO_PING_ON_SUSPEND, &wdd->status);
+}
+
 /* Use the following function to check if a timeout value is invalid */
 static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
 {
@@ -209,6 +217,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
 				  unsigned int timeout_parm, struct device *dev);
 extern int watchdog_register_device(struct watchdog_device *);
 extern void watchdog_unregister_device(struct watchdog_device *);
+int watchdog_dev_suspend(struct watchdog_device *wdd);
+int watchdog_dev_resume(struct watchdog_device *wdd);
 
 int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
 
-- 
2.29.0

