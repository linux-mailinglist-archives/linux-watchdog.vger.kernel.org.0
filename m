Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1173A7E4D
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jun 2021 14:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhFOMlW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Jun 2021 08:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhFOMlT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Jun 2021 08:41:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43426C061767
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Jun 2021 05:39:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 131so24863079ljj.3
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Jun 2021 05:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3pEsLcQ/8PBueEyiqA/kBMEdoALnX+fHc+Skgy5Wse4=;
        b=Lo9MxugjizgQOg5AcVDyMzvLOktI70lW6BqlHYqn00ELIrDqv7V6Ov0lEQBnp5sUVD
         MEPCbDZuIh8/nel5c0auOPPLNOU1H5uIjDc5vhxFBss4iCdhMUGN4yXFTkQTjBA5tCqL
         QSweT1vPd5k3r6/wIVz2sAPIKrLLhjUZoy0MdVzBIqa6GfCi7DXrgMbCvsglVKzATE/v
         U2ntj3TKpDWL/fdjmifyV7fEFa9yXls5YSBx9Z7CfljNUaX8KAokcCIBmkJWHmifwOxZ
         Zo5LCFEfPs+mr2AHHq8fv1wP4akbn6uuxYtycGEU+5Q2vfV0FpH0JafAhiXQ/edCTEyb
         YM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3pEsLcQ/8PBueEyiqA/kBMEdoALnX+fHc+Skgy5Wse4=;
        b=AsZbzK3Kq9rguOazWooR8s1QTQpzOt8aMXgXT/MyklcA0tN7+doqsbO/2WnuBQyjbj
         qpONHO5vJ1uHwEvXJKDztjfSSSiiEwagK+i2+okAjk08VgcQqwqWddcpOgkr4hYrRTUk
         CVh4ZKDC5avufvQGN1CTHQHJ9KTI86pYX5aZetbXiHUSzRGywxDoKSWCfq+PIHcT4tdR
         KSnDbRCsnpSPBLBSEBvOb6C2+5Z3sEilyrLmbLbyX8y7/mIBhvF1zF+XDVZS7KpJj3DU
         oaQpotmMKR0uTivBEuo2uXLxZZxDaVS/fqP6K4DuSEnRi9NK/+hfIkUC0ZuZhluPDo9d
         Hb/A==
X-Gm-Message-State: AOAM530Z/OuID5JS/kax0v176JRidaEGXp2DiT30i94Oh+srMxZGVuht
        wmTtsANY2orFO/GqFa2ZiDFWXQ==
X-Google-Smtp-Source: ABdhPJwRsf+yNOWqXkRPrg7C6+J4ziUSxP9L+WvAbfpgF/03zjoPDhYxMZParIYV9z2a3UBO/FrilQ==
X-Received: by 2002:a2e:6c0e:: with SMTP id h14mr17848984ljc.267.1623760752547;
        Tue, 15 Jun 2021 05:39:12 -0700 (PDT)
Received: from gilgamesh.lab.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id m12sm811418lfb.231.2021.06.15.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 05:39:12 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org
Subject: [PATCH 1/2] watchdog: introduce watchdog_dev_suspend/resume
Date:   Tue, 15 Jun 2021 14:39:03 +0200
Message-Id: <20210615123904.2568052-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
References: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog drivers often disable wdog clock during suspend and then
enable it again during resume. Nevertheless the ping worker is still
running and can issue low-level ping while the wdog clock is disabled
causing the system hang. To prevent such condition introduce
watchdog_dev_suspend/resume which can be used by any wdog driver and
actually cancel ping worker during suspend and restore it back, if
needed, during resume.

Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/watchdog/watchdog_dev.c | 49 +++++++++++++++++++++++++++++++++
 include/linux/watchdog.h        |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a63110..3feca1567281 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1219,6 +1219,55 @@ void __exit watchdog_dev_exit(void)
 	kthread_destroy_worker(watchdog_kworker);
 }
 
+int watchdog_dev_suspend(struct watchdog_device *wdd)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+	int ret;
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
+EXPORT_SYMBOL_GPL(watchdog_dev_suspend);
+
+int watchdog_dev_resume(struct watchdog_device *wdd)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+	int ret;
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
+EXPORT_SYMBOL_GPL(watchdog_dev_resume);
+
 module_param(handle_boot_enabled, bool, 0444);
 MODULE_PARM_DESC(handle_boot_enabled,
 	"Watchdog core auto-updates boot enabled watchdogs before userspace takes over (default="
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 9b19e6bb68b5..febfde3b1ff6 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -209,6 +209,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
 				  unsigned int timeout_parm, struct device *dev);
 extern int watchdog_register_device(struct watchdog_device *);
 extern void watchdog_unregister_device(struct watchdog_device *);
+int watchdog_dev_suspend(struct watchdog_device *wdd);
+int watchdog_dev_resume(struct watchdog_device *wdd);
 
 int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
 
-- 
2.29.0

