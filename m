Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1646AA17F
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjCCVh6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjCCVhu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C54762D8E
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:49 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-0008Uz-VX; Fri, 03 Mar 2023 22:37:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001eAL-SU; Fri, 03 Mar 2023 22:37:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001wxO-5R; Fri, 03 Mar 2023 22:37:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 05/34] watchdog: at91rm9200: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:47 +0100
Message-Id: <20230303213716.2123717-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y9c84V3OIUrX7btc5Pg+PdesCQSfurferO1R0FfG/Vk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmggv2CxtyhyWnlFhtc46w9G8ZFP9Cu1oDsG7 dqiVegZJWSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoIAAKCRDB/BR4rcrs CUXSCACBuuSDAwdFKgcWCQue2LLM5AoiE8sujzZObYel82ZdeVhJ8qHlq333ebgsG71PBH15CeA GPKfhpfeEuTrGnJHnjir8d7GrEeJWsN285yQGe6b1WvGEpY1eGDzFomOlTB/Jn92gGG/5djq3XV xnvexkpmWURp2AGpqpkqWe14+zIdnbC1LyH0J9xcP+8ip8gwaUbNDIspxB9cyuNyDqu+iH6O3Ln 5l3cOzduDz+10f98hE7qw7ZwJiLVyuwEhW4r7SWlb2yHgcmDdif3JLTW3MirSqOf0RJLvpq81d7 F1W+lJC/fRi3eP0/WJ3Y8PHMU85QZwfA10cyN9sB/gP++rTa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/at91rm9200_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
index d57409c1a4d1..d20ec27ba354 100644
--- a/drivers/watchdog/at91rm9200_wdt.c
+++ b/drivers/watchdog/at91rm9200_wdt.c
@@ -258,7 +258,7 @@ static int at91wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int at91wdt_remove(struct platform_device *pdev)
+static void at91wdt_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int res;
@@ -269,8 +269,6 @@ static int at91wdt_remove(struct platform_device *pdev)
 
 	misc_deregister(&at91wdt_miscdev);
 	at91wdt_miscdev.parent = NULL;
-
-	return 0;
 }
 
 static void at91wdt_shutdown(struct platform_device *pdev)
@@ -299,7 +297,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
 
 static struct platform_driver at91wdt_driver = {
 	.probe		= at91wdt_probe,
-	.remove		= at91wdt_remove,
+	.remove_new	= at91wdt_remove,
 	.shutdown	= at91wdt_shutdown,
 	.suspend	= pm_ptr(at91wdt_suspend),
 	.resume		= pm_ptr(at91wdt_resume),
-- 
2.39.1

