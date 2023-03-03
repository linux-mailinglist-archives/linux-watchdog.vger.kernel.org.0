Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055616AA169
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjCCVhr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjCCVhk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBCF62D86
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-0000Ab-3s; Fri, 03 Mar 2023 22:37:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001eBb-GF; Fri, 03 Mar 2023 22:37:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-001wyJ-CT; Fri, 03 Mar 2023 22:37:35 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 20/34] watchdog: omap: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:02 +0100
Message-Id: <20230303213716.2123717-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=XN+dBdzk16QJCxdEFibRRQ9fthPrchYs74S0K9CsNb0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhU8CfwdBULSFgWPuERnMS47GTOh8YVEnAlD JE9Jicy2TeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoVAAKCRDB/BR4rcrs CX3JCACQRNJxBTOvi7BeQb6hK8xGqSJRnxrXrOVwzZRD30ssGMpkdsZBSiou8h9Op5d0LKvyu81 EPK4EXRPNf63y7S7TYkuXlXOYjjeqGdjWflVHei0D6thZYngm6DVER9uAc2/oFqiWA78xESM+6y LNIPqGLIVh1Cl3fGHmUwF8DHGvPfApH+AJwFYH04V54ZSkoFJKJo+10K2XHlZQX0vXRzjERQq0M +h8/5sTDWOmLdNFYXFqTefburAvrJaub82kkxITPgDv2/lGZFgDuCODbNAAEHgD7Iya4mlhFs9M T973+EBWXHnN+r+NrRkIQJSqya/8p2U+9hPp5a5leVyLn9NV
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
 drivers/watchdog/omap_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index e75aa86f63cb..a7a12f2fe9de 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -306,14 +306,12 @@ static void omap_wdt_shutdown(struct platform_device *pdev)
 	mutex_unlock(&wdev->lock);
 }
 
-static int omap_wdt_remove(struct platform_device *pdev)
+static void omap_wdt_remove(struct platform_device *pdev)
 {
 	struct omap_wdt_dev *wdev = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(wdev->dev);
 	watchdog_unregister_device(&wdev->wdog);
-
-	return 0;
 }
 
 /* REVISIT ... not clear this is the best way to handle system suspend; and
@@ -359,7 +357,7 @@ MODULE_DEVICE_TABLE(of, omap_wdt_of_match);
 
 static struct platform_driver omap_wdt_driver = {
 	.probe		= omap_wdt_probe,
-	.remove		= omap_wdt_remove,
+	.remove_new	= omap_wdt_remove,
 	.shutdown	= omap_wdt_shutdown,
 	.suspend	= pm_ptr(omap_wdt_suspend),
 	.resume		= pm_ptr(omap_wdt_resume),
-- 
2.39.1

