Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A267E2903
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 16:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjKFPs7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 10:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbjKFPsx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 10:48:53 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E610D67
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 07:48:49 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0007h8-T6; Mon, 06 Nov 2023 16:48:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-0074pL-KW; Mon, 06 Nov 2023 16:48:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-00Dn7o-B9; Mon, 06 Nov 2023 16:48:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 1/5] watchdog: at91sam9: Stop using module_platform_driver_probe()
Date:   Mon,  6 Nov 2023 16:48:09 +0100
Message-ID: <20231106154807.3866712-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6qCjLgRs8LjWcKpjoJFV/bKAmdWeXlVN/t58ixQNqro=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSQq50rUzra2wa9jK/Iw4QnaVb7bB8WtVPVrkR zuaSr0MmoWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkKuQAKCRCPgPtYfRL+ TkkwB/97XYahEtj8N9mMvFKBMjHV5rsbBRZqUSuMy3WfbQOSeMx1TNnllYNNeb3BjY4titkJKRU u8MYE3UionZUlBkmJG/Fjushng/UmO3Vtc5S4NnO7bBbD2PoUkYEv2xUjQzgNTCCfjvz3mYPa+w DtHWzzltTvp+4WJJ0kfjV0z+MuFLuDKqWozOsOPa5xV4WCsS8UE45W97p5k/JoihULLerDvvveY Nh6sHCuZiALnu5nRB8YlplJqHfUjRSWLdUQDPyDeZRR2dPpDoohlIBdQ2PqQ48Tlsr1NBkA4U4I r6SCwD65Ky+fKj3th00+1nnFf2iox7ROf7+yq/CYVNOHeG0p
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On today's platforms the benefit of platform_driver_probe() isn't that
relevant any more. It allows to drop some code after booting (or module
loading) for .probe() and discard the .remove() function completely if
the driver is built-in. This typically saves a few 100k.

The downside of platform_driver_probe() is that the driver cannot be
bound and unbound at runtime which is ancient and also slightly
complicates testing. There are also thoughts to deprecate
platform_driver_probe() because it adds some complexity in the driver
core for little gain. Also many drivers don't use it correctly. This
driver for example misses to mark the driver struct with __refdata which
is needed to suppress a (W=1) modpost warning:

	WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in reference: at91wdt_driver+0x4 (section: .data) -> at91wdt_remove (section: .exit.text)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/at91sam9_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index b111b28acb94..507adb12754d 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -324,7 +324,7 @@ static inline int of_at91wdt_init(struct device_node *np, struct at91wdt *wdt)
 }
 #endif
 
-static int __init at91wdt_probe(struct platform_device *pdev)
+static int at91wdt_probe(struct platform_device *pdev)
 {
 	int err;
 	struct at91wdt *wdt;
@@ -372,7 +372,7 @@ static int __init at91wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __exit at91wdt_remove(struct platform_device *pdev)
+static int at91wdt_remove(struct platform_device *pdev)
 {
 	struct at91wdt *wdt = platform_get_drvdata(pdev);
 	watchdog_unregister_device(&wdt->wdd);
@@ -393,14 +393,14 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
 #endif
 
 static struct platform_driver at91wdt_driver = {
-	.remove		= __exit_p(at91wdt_remove),
+	.probe		= at91wdt_probe,
+	.remove		= at91wdt_remove,
 	.driver		= {
 		.name	= "at91_wdt",
 		.of_match_table = of_match_ptr(at91_wdt_dt_ids),
 	},
 };
-
-module_platform_driver_probe(at91wdt_driver, at91wdt_probe);
+module_platform_driver(at91wdt_driver);
 
 MODULE_AUTHOR("Renaud CERRATO <r.cerrato@til-technologies.fr>");
 MODULE_DESCRIPTION("Watchdog driver for Atmel AT91SAM9x processors");
-- 
2.42.0

