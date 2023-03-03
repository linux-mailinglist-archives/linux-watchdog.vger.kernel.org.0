Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441EE6AA15B
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjCCVhl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbjCCVhi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BCD62D8D
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-00005o-6D; Fri, 03 Mar 2023 22:37:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001eAZ-S9; Fri, 03 Mar 2023 22:37:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001wxe-0E; Fri, 03 Mar 2023 22:37:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/34] watchdog: bcm_kona: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:51 +0100
Message-Id: <20230303213716.2123717-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6iQrQBQ/8cNCzN3/6Tl45oGFovNbg5BTl82HWggeOFY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmguDgpt8HM3j99LPU+PXylW2tji63SJPoRhQ Y2NiSXPyvWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoLgAKCRDB/BR4rcrs CdW7B/91OEJ0xeknRiUNvKV+XA5wgtecSgbDhobNEdDK7gxipzxsm2nGU+UriSIefBAyI42UW2L Uk7ksvV9Vt0SI0eUXtpSQEuyxqvAtQAOP1tgOwQMlvjyP/xaMQPEEajXzO7oELBnJJXLHVcgOMr gVk9RZWl8sp6tSiNfXzJXIUPRUN4LRtcRJunsPD+g+IvQt6cXAOH+djNZoG+iQHhHMl0WhzgJqb nt7H9H83g8HCRRfGI1GCSICAkl1Sdyrx3em6MB84IX04DYBpddWnwxAshOgA5QmmZ7tQtmBEbC5 dawe+bm52wnllyI07QYEHjknJRsI4N4Rj2ass6OJFbbZgxb3
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
 drivers/watchdog/bcm_kona_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
index 8237c4e9c2a0..49e12d47b073 100644
--- a/drivers/watchdog/bcm_kona_wdt.c
+++ b/drivers/watchdog/bcm_kona_wdt.c
@@ -310,12 +310,10 @@ static int bcm_kona_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bcm_kona_wdt_remove(struct platform_device *pdev)
+static void bcm_kona_wdt_remove(struct platform_device *pdev)
 {
 	bcm_kona_wdt_debug_exit(pdev);
 	dev_dbg(&pdev->dev, "Watchdog driver disabled");
-
-	return 0;
 }
 
 static const struct of_device_id bcm_kona_wdt_of_match[] = {
@@ -330,7 +328,7 @@ static struct platform_driver bcm_kona_wdt_driver = {
 			.of_match_table = bcm_kona_wdt_of_match,
 		  },
 	.probe = bcm_kona_wdt_probe,
-	.remove = bcm_kona_wdt_remove,
+	.remove_new = bcm_kona_wdt_remove,
 };
 
 module_platform_driver(bcm_kona_wdt_driver);
-- 
2.39.1

