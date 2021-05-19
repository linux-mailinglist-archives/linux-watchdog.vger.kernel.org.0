Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961793888EB
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 May 2021 10:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242398AbhESIEe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 May 2021 04:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242061AbhESIEd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 May 2021 04:04:33 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690CFC06175F
        for <linux-watchdog@vger.kernel.org>; Wed, 19 May 2021 01:03:14 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h4so12907578wrt.12
        for <linux-watchdog@vger.kernel.org>; Wed, 19 May 2021 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZxA52JCafjscyRCkeqgLv4G3OrvF7j/p01MCqUZWfM=;
        b=KukhYa7YtiHF6s3PI3TA2VtewEOy/SoiED9sqwCYF5J/BIy6UhqE3wHHMyTjiyYdNW
         BldZ4Ga8qqsqccAvyljYr01LOUP6iKQGgnSWXnA2e+oGXN6yj3zOKUVddux3I/YHXvLj
         ATkhJ87hfRocaOk61fm8PLUkOCnboD3krZp6CjYZeZ6oEuyelX2TvvEtrrFb6G3cWBiB
         gRVMiwCQiRMfdXhwSWreeXkaYmxJY4tL3C2LEoNXH+4VSMhfmklw9gBT7tFHiey4G/ed
         9pwNEyrzeukUqAb/CyWrO4SyIB640Yps9ddY5LUNDT0L6koPjSSVQxW8k5ekbFdhMcqB
         VLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZxA52JCafjscyRCkeqgLv4G3OrvF7j/p01MCqUZWfM=;
        b=ov6YRHyp6LQq9bxWSeP4qGOhdQOekLUmIHx/zEOY6AEpOuyv6viz13wDRQrJU/+1gs
         w8zYLeC+D9veyCKMqDJBbwjiG+mO13fi36+aV3QK2n6SVdG7Fn0TOzK7zr3+UEkOodfr
         2Ug/5usduJ0aen8o4A8yupnOg3hXkzm8oHXS2hEVkXrJBeguSubQOZ/fNTmYGAhHKxNG
         8Qzrny7Tp5S4/BrC3aWl1uJuk/gPu+dea+7vLSLYkspIHjheMQp7mnVAh2dHfbDfA5mF
         pCzxaAVJanrHWKXjzOZRjM1Bjz6ZrEBh8k50uz96VUBX68RxwJWoAgENnUQhkuu++xt/
         0b4w==
X-Gm-Message-State: AOAM531FFBGovwxTEU0yaYRB6IggR37U+/skqzSXbYn07KyoKLGrU/8q
        Cg+BAKE6QVL+3UMCR66GmEXyLFn0d61QkZrf
X-Google-Smtp-Source: ABdhPJxygWOcxCwmqQo13ntWdHmd8qWkIiYkBo7PNWfeYyYXGnmgR2MhCIhXbU55QieN7yKx8nie4w==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr13242234wre.140.1621411392813;
        Wed, 19 May 2021 01:03:12 -0700 (PDT)
Received: from eichest-laptop.lan (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id c194sm5079797wme.46.2021.05.19.01.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 01:03:12 -0700 (PDT)
From:   Stefan Eichenberger <eichest@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Eichenberger <eichest@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [RESEND PATCH v2] watchdog: imx_sc_wdt: fix pretimeout
Date:   Wed, 19 May 2021 10:03:11 +0200
Message-Id: <20210519080311.142928-1-eichest@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the WDIOF_PRETIMEOUT flag is not set when registering the device the
driver will not show the sysfs entries or register the default governor.
By moving the registering after the decision whether pretimeout is
supported this gets fixed.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/imx_sc_wdt.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index e9ee22a7cb45..8ac021748d16 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -183,16 +183,12 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 
-	ret = devm_watchdog_register_device(dev, wdog);
-	if (ret)
-		return ret;
-
 	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
 				       true);
 	if (ret) {
 		dev_warn(dev, "Enable irq failed, pretimeout NOT supported\n");
-		return 0;
+		goto register_device;
 	}
 
 	imx_sc_wdd->wdt_notifier.notifier_call = imx_sc_wdt_notify;
@@ -203,7 +199,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 					 false);
 		dev_warn(dev,
 			 "Register irq notifier failed, pretimeout NOT supported\n");
-		return 0;
+		goto register_device;
 	}
 
 	ret = devm_add_action_or_reset(dev, imx_sc_wdt_action,
@@ -213,7 +209,8 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	else
 		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
 
-	return 0;
+register_device:
+	return devm_watchdog_register_device(dev, wdog);
 }
 
 static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
-- 
2.27.0

