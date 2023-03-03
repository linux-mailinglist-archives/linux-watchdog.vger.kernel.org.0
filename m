Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2D96AA171
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjCCVhu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbjCCVhn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB05262DAA
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5v-0000J7-A3; Fri, 03 Mar 2023 22:37:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001eC6-Oo; Fri, 03 Mar 2023 22:37:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001wyl-Qb; Fri, 03 Mar 2023 22:37:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 26/34] watchdog: rn5t618: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:08 +0100
Message-Id: <20230303213716.2123717-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=13adthKED0hw/LacgJu2Y/eoMB75bN5Yr91DJjqZzXg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhqAxaRMiwYmcGxsOzY1fcEFeOC7hNGND0Qp WWnUQiEX8mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoagAKCRDB/BR4rcrs CSmZCACXtu9u0DYMnkFdOB7Ah6X/8QqEGysblV35cMQC74bVU0NTZE0waNGrdItypDM6RDrmp9K zWmffyvvI35p1roxvgA+pxjrGeGXtY8rCWKB7y+mV1PeGocwY21xN6jG5hMSE9yESdzf843EQLy dJuuZzQfVJHkHjD5jXMmrKq565fBAjmFR0s9nPnkLEIudiQxID1YydStZjM4wAzoHguBCyDZsG2 fPG965MapSc4KPKTwidEzFfIKG1ciWi9R4EdJFKMDFCkD1JRViWrJtjqWHxCHQx9IUJbnezGbLN hf0zqUBsRHdHQuIOOAImmzZE9oQjR2CEUGhSG6oLEpYRb3Jd
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
 drivers/watchdog/rn5t618_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
index 40d8ebd8c0ac..b0da5cc8ccdf 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -181,18 +181,16 @@ static int rn5t618_wdt_probe(struct platform_device *pdev)
 	return watchdog_register_device(&wdt->wdt_dev);
 }
 
-static int rn5t618_wdt_remove(struct platform_device *pdev)
+static void rn5t618_wdt_remove(struct platform_device *pdev)
 {
 	struct rn5t618_wdt *wdt = platform_get_drvdata(pdev);
 
 	watchdog_unregister_device(&wdt->wdt_dev);
-
-	return 0;
 }
 
 static struct platform_driver rn5t618_wdt_driver = {
 	.probe = rn5t618_wdt_probe,
-	.remove = rn5t618_wdt_remove,
+	.remove_new = rn5t618_wdt_remove,
 	.driver = {
 		.name	= DRIVER_NAME,
 	},
-- 
2.39.1

