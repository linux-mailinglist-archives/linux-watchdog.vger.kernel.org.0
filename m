Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B08D6AA162
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjCCVhp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbjCCVhk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A9D62D8D
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-0000A5-SP; Fri, 03 Mar 2023 22:37:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001eBQ-7E; Fri, 03 Mar 2023 22:37:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-001wy6-HL; Fri, 03 Mar 2023 22:37:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Vladimir Zapolskiy <vz@mleia.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 16/34] watchdog: lpc18xx: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:58 +0100
Message-Id: <20230303213716.2123717-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=n7azFGUPBrsh0Bp6UwezUzjK+kCPODWtZ+uq4gprEN8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhHkiVkKSlGIMQLTEQ1j04fq3VA+xdDBKyY5 iiMjUB5XCeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoRwAKCRDB/BR4rcrs CVQZB/4rnCJKXjN1CTYmT1nM59qWxDcfNiSsGGzhWPlAijT/Z3FA3tBIFVgoPbpm/8fh6FFK+df k1/cir/iHMkjWbZ78ER1dTWnFVsbweQ73fk4zt4TBby4EbG4Gmp1ml/6ostsHdsleAKKPelvRoc 6cKjc1v6bmt6QYITdAd9YUf4P9xsqHIAAx86ymjCyt51DrSzO7zc+GTg9f61hR7/SquH5BsbyEP KXWQ0mQdavr6eT14x/eRNqUWODBjnAajMBthAUWTWlcmIRoiQQp2BW7XR4ESBWzagPF5vUXVq3z dmsFpWfPUu8HKRGWydVFxcBlzZZtxxJiE2EbQplEBXxDCCKO
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
 drivers/watchdog/lpc18xx_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
index 1b9b5f21a0df..19535f4a2fd2 100644
--- a/drivers/watchdog/lpc18xx_wdt.c
+++ b/drivers/watchdog/lpc18xx_wdt.c
@@ -261,14 +261,12 @@ static int lpc18xx_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &lpc18xx_wdt->wdt_dev);
 }
 
-static int lpc18xx_wdt_remove(struct platform_device *pdev)
+static void lpc18xx_wdt_remove(struct platform_device *pdev)
 {
 	struct lpc18xx_wdt_dev *lpc18xx_wdt = platform_get_drvdata(pdev);
 
 	dev_warn(&pdev->dev, "I quit now, hardware will probably reboot!\n");
 	del_timer_sync(&lpc18xx_wdt->timer);
-
-	return 0;
 }
 
 static const struct of_device_id lpc18xx_wdt_match[] = {
@@ -283,7 +281,7 @@ static struct platform_driver lpc18xx_wdt_driver = {
 		.of_match_table	= lpc18xx_wdt_match,
 	},
 	.probe = lpc18xx_wdt_probe,
-	.remove = lpc18xx_wdt_remove,
+	.remove_new = lpc18xx_wdt_remove,
 };
 module_platform_driver(lpc18xx_wdt_driver);
 
-- 
2.39.1

