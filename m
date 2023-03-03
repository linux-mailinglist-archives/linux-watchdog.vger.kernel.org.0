Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A2D6AA172
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjCCVhu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjCCVhn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E995E62D8D
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5v-0000J5-9y; Fri, 03 Mar 2023 22:37:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001eC5-OQ; Fri, 03 Mar 2023 22:37:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001wyo-1Z; Fri, 03 Mar 2023 22:37:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 27/34] watchdog: rti: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:09 +0100
Message-Id: <20230303213716.2123717-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y0ppS3/lHOfKcdZ+vVTZLvSg0Vcg/PYnmu6MvKULFV0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhtZfWgPjXdn1m8oF4nZv7Y/Vi5BvYiXvAWw OOWLdsZUbOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJobQAKCRDB/BR4rcrs CUdSB/46PdjFhSC3js+NW7hBkK8ZL/zjz4ZNST3hS6Uz/Drw1a+Ow6Pu/l4N1nAslMcuXfaeM53 Wb/lYZiumVDKRucfe723vyYsNtMN4tt6eEpki57DBJ1nPLjq1lnc7zq8vkNJoEOUxY/K/Fw1NIH WVcVYxv7eQ+RUxX2Tl3n3N4WxYdHYWO3c2d8/uSWTFfWsGB4ccUR1+2TiHEFYgFwBPye2EUthoD 7OOAIlaEZO4IKinw5qWZA8RGnc0hef78GIabSQPFfv5jgxp3x1oBJp4IdxZw90xAaYhumc9ca2q iVF8NKgHbSBl9WtSOILQhZLdTNRrshL1tugZNYr7D1EB0sx4
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
 drivers/watchdog/rti_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 6e9253761fc1..ce8f18e93aa9 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -304,15 +304,13 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rti_wdt_remove(struct platform_device *pdev)
+static void rti_wdt_remove(struct platform_device *pdev)
 {
 	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
 
 	watchdog_unregister_device(&wdt->wdd);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rti_wdt_of_match[] = {
@@ -327,7 +325,7 @@ static struct platform_driver rti_wdt_driver = {
 		.of_match_table = rti_wdt_of_match,
 	},
 	.probe = rti_wdt_probe,
-	.remove = rti_wdt_remove,
+	.remove_new = rti_wdt_remove,
 };
 
 module_platform_driver(rti_wdt_driver);
-- 
2.39.1

