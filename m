Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C251A6AA152
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjCCVhh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjCCVhg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF4C6233F
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-0008V9-N4; Fri, 03 Mar 2023 22:37:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001eAP-1k; Fri, 03 Mar 2023 22:37:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001wxR-CM; Fri, 03 Mar 2023 22:37:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/34] watchdog: ath79: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:48 +0100
Message-Id: <20230303213716.2123717-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=abIaa5WCkXHESWKNN8dLZhdz2pEteQfyDjCNlGaF9lM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgj3nBpq2X9YByL60qTTdeTFoVEWNIfvAKxk 7xdWPyY5r+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoIwAKCRDB/BR4rcrs CWgiB/9ZZEcHclbs9JoxVCmjPMh0ZaMXIb/6z/krBcnE+KbWCSmD1oZHm26ZT2BVOxNumnOmr+M xK9Ypmgqov9Gj4FtiP/DtbUsunepT6FHSEmDAaI7raRukoI8Q3lwg16zM3pH6j+f/3w6IPlJcEV 6oDygimRvKLIAEeqEV279Q0F+B9rAFx1298cnLo0ShwA2/V/KSRpJXrbiHF5TacAQIHPZ9uQWcL 5iyYs+TDZ6UFj8B5bBqsDQ/ZTbMMaAlU3fePyUgzlwBkWv/734pA2a/qngfD2o4JxCfRPbyl2Sv TiucmIeXg0NSBdq7QqYcWAhfsEEuwfJIkf5ehP8ndtPBXVer
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
 drivers/watchdog/ath79_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index 0f18f06a21b6..b7b705060438 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -296,11 +296,10 @@ static int ath79_wdt_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ath79_wdt_remove(struct platform_device *pdev)
+static void ath79_wdt_remove(struct platform_device *pdev)
 {
 	misc_deregister(&ath79_wdt_miscdev);
 	clk_disable_unprepare(wdt_clk);
-	return 0;
 }
 
 static void ath79_wdt_shutdown(struct platform_device *pdev)
@@ -318,7 +317,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
 
 static struct platform_driver ath79_wdt_driver = {
 	.probe		= ath79_wdt_probe,
-	.remove		= ath79_wdt_remove,
+	.remove_new	= ath79_wdt_remove,
 	.shutdown	= ath79_wdt_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
-- 
2.39.1

