Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 089F97E2901
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 16:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbjKFPs6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 10:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbjKFPss (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 10:48:48 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB06134
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 07:48:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0007hA-T2; Mon, 06 Nov 2023 16:48:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0074pR-26; Mon, 06 Nov 2023 16:48:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-00Dn7w-P3; Mon, 06 Nov 2023 16:48:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 3/5] watchdog: at91sam9_wdt: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 16:48:11 +0100
Message-ID: <20231106154807.3866712-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QjDXnUKdFeWY23VLKaqCEl5AisXjKrGyHZw5xvz6h9o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSQq7pnemtZheeM6ByBJ1m7V3ry4QBDuUwJnDr QOPcaJF8IaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkKuwAKCRCPgPtYfRL+ TrWyB/0Q1yuNiQLm+fZlEfnotb9tbJDJhs/BIacj47l3LTcKxkDkZ8TfzvVcgf4kkrn7MxFeRcj smURfjy6Tl1sCYyPiKD6sX78HvGZ87NWZrqpYWQn7BoHFOjqZsvqLzSOSVm1xCDk3ju/tuun7UW PzbVG96zq5d053jlWxgaFbG+zulsjS9vhwX773prbRsFWStis/997XZF80+ifCpmb6+bfPksUmz ozB3HPWN7folZU6mrs3mQOuCCoGPjsy6DhqCGIp2nKERdJJCEEmr1OfBaCwNM37caaZxuN+vf75 Hy03KaiVtU27zP1ohmd56+Z5coK//0SZnqOMhSNt6AldCnhb
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/at91sam9_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index 507adb12754d..2c6474cb858b 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -372,15 +372,13 @@ static int at91wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int at91wdt_remove(struct platform_device *pdev)
+static void at91wdt_remove(struct platform_device *pdev)
 {
 	struct at91wdt *wdt = platform_get_drvdata(pdev);
 	watchdog_unregister_device(&wdt->wdd);
 
 	pr_warn("I quit now, hardware will probably reboot!\n");
 	del_timer(&wdt->timer);
-
-	return 0;
 }
 
 #if defined(CONFIG_OF)
@@ -394,7 +392,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
 
 static struct platform_driver at91wdt_driver = {
 	.probe		= at91wdt_probe,
-	.remove		= at91wdt_remove,
+	.remove_new	= at91wdt_remove,
 	.driver		= {
 		.name	= "at91_wdt",
 		.of_match_table = of_match_ptr(at91_wdt_dt_ids),
-- 
2.42.0

