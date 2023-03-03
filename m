Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E896AA167
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbjCCVhr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjCCVhk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25D862DA7
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-0000AJ-7O; Fri, 03 Mar 2023 22:37:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001eBV-Co; Fri, 03 Mar 2023 22:37:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-001wyM-JZ; Fri, 03 Mar 2023 22:37:35 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 21/34] watchdog: orion: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:03 +0100
Message-Id: <20230303213716.2123717-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bfMsGz9qpwvbKKYF+ssoYFDlsYAdFfN+8CB/uAFAt+k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhX1V3f94C6sXUgFDxyBqYnzbHytqU25cfcf hUWnH2axUeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoVwAKCRDB/BR4rcrs Cbi6B/92cUksSk0a6l8SZP0K+H0NnsfbPDOK0ajRBGjSyZ0wRa2a7Bx6927E0LAeHGS3eYWQ9t+ WP3YkwW6aODXoROUIcd/1jusCe8Fw4+/jpfjDpogJCRVs0gs1WXSZG5VH9GWHxDtEZXUbpgteff tF3ExIO91J1t0QkrRzzbAFTM5XHmtJoHnQrBQLDeegDB66ZX4sBW4X6EEatqPdc7wqKq63ENHDj oyDwAuEv9B9JPkljj4hCdcS/cH7cKw6s4iRj+dbScdBA4kW+AJPIX9T0zFGtFe5gQP/VmT4WMin ukA6bJrmQLCbzCyBbudDqlyLK5jBe5I6M4Ri4lFPZL7SDXSC
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
 drivers/watchdog/orion_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index e25e6bf4647f..5ec2dd8fd5fa 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -649,7 +649,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int orion_wdt_remove(struct platform_device *pdev)
+static void orion_wdt_remove(struct platform_device *pdev)
 {
 	struct watchdog_device *wdt_dev = platform_get_drvdata(pdev);
 	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
@@ -657,7 +657,6 @@ static int orion_wdt_remove(struct platform_device *pdev)
 	watchdog_unregister_device(wdt_dev);
 	clk_disable_unprepare(dev->clk);
 	clk_put(dev->clk);
-	return 0;
 }
 
 static void orion_wdt_shutdown(struct platform_device *pdev)
@@ -668,7 +667,7 @@ static void orion_wdt_shutdown(struct platform_device *pdev)
 
 static struct platform_driver orion_wdt_driver = {
 	.probe		= orion_wdt_probe,
-	.remove		= orion_wdt_remove,
+	.remove_new	= orion_wdt_remove,
 	.shutdown	= orion_wdt_shutdown,
 	.driver		= {
 		.name	= "orion_wdt",
-- 
2.39.1

