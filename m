Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBFE350B2A0
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Apr 2022 10:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445420AbiDVIDM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Apr 2022 04:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445394AbiDVIDL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Apr 2022 04:03:11 -0400
X-Greylist: delayed 1979 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 22 Apr 2022 01:00:17 PDT
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09519527CB;
        Fri, 22 Apr 2022 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=RrUAgaYBGqDlVeJywd9UwMyWVO5BjQ8SP6lbW6haBps=; b=aquPLQ6b42nMo9of3bdebMZYmk
        8jloNnIWnsmh89f40GGmLqyesubKxt1t9SGZeMwBN+QAcnqvO+iuYRw/pXEnsA/Ka1d5IbKFFNe1E
        DwdFdWBvqVTfVtd44EAA17G7mDoe19u+6dtfrI3gbRaZDR8fzILnNJxLve1W96ueXEEnEzIY+gbTS
        nzeqoQdtzr8Q0q12n0H1u6653u3Kcb0bQyL+aHgG9ZEdCn5WoyQ7l6gh4Zx9Mf/d4+bDwObMxGFqK
        GjO9k+m+aHShSzMP25AA60JpfwX7Ymv0x+eOYAWchN7iHK+GFWv8Q9jQs7oxXb3HXSo/Y+lAX2fdl
        NokNeHKA==;
Received: from [89.212.21.243] (port=36186 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1nhnh2-007P6W-Vq;
        Fri, 22 Apr 2022 09:27:12 +0200
From:   Primoz Fiser <primoz.fiser@norik.com>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Primoz Fiser <primoz.fiser@norik.com>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during suspend
Date:   Fri, 22 Apr 2022 09:27:12 +0200
Message-Id: <20220422072713.3172345-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422072713.3172345-1-primoz.fiser@norik.com>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Optionally disable watchdog during suspend (if enabled) and re-enable
it upon resume.
This enables boards to sleep without being interrupted by the watchdog.

This patch is based on commit f6c98b08381c ("watchdog: da9062: add
power management ops") and commit 8541673d2a5f ("watchdog: da9062: fix
power management ops") and brings the same functionality to DA9063.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/watchdog/da9063_wdt.c | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 9adad1862bbd..09a4af4c58fc 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/da9063/registers.h>
 #include <linux/mfd/da9063/core.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 /*
@@ -26,6 +27,8 @@
  *   others: timeout = 2048 ms * 2^(TWDSCALE-1).
  */
 static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
+static bool use_sw_pm;
+
 #define DA9063_TWDSCALE_DISABLE		0
 #define DA9063_TWDSCALE_MIN		1
 #define DA9063_TWDSCALE_MAX		(ARRAY_SIZE(wdt_timeout) - 1)
@@ -218,6 +221,8 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 	if (!wdd)
 		return -ENOMEM;
 
+	use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
+
 	wdd->info = &da9063_watchdog_info;
 	wdd->ops = &da9063_watchdog_ops;
 	wdd->min_timeout = DA9063_WDT_MIN_TIMEOUT;
@@ -228,6 +233,7 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_restart_priority(wdd, 128);
 	watchdog_set_drvdata(wdd, da9063);
+	dev_set_drvdata(dev, wdd);
 
 	wdd->timeout = DA9063_WDG_TIMEOUT;
 
@@ -249,10 +255,40 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, wdd);
 }
 
+static int __maybe_unused da9063_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (!use_sw_pm)
+		return 0;
+
+	if (watchdog_active(wdd))
+		return da9063_wdt_stop(wdd);
+
+	return 0;
+}
+
+static int __maybe_unused da9063_wdt_resume(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (!use_sw_pm)
+		return 0;
+
+	if (watchdog_active(wdd))
+		return da9063_wdt_start(wdd);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(da9063_wdt_pm_ops,
+			da9063_wdt_suspend, da9063_wdt_resume);
+
 static struct platform_driver da9063_wdt_driver = {
 	.probe = da9063_wdt_probe,
 	.driver = {
 		.name = DA9063_DRVNAME_WATCHDOG,
+		.pm = &da9063_wdt_pm_ops,
 	},
 };
 module_platform_driver(da9063_wdt_driver);
-- 
2.25.1

