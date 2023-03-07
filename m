Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6A26AD904
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Mar 2023 09:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjCGIR4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Mar 2023 03:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjCGIRp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Mar 2023 03:17:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E714FF0C
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Mar 2023 00:17:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSVj-0003g3-93; Tue, 07 Mar 2023 09:17:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMs-002Q8H-04; Tue, 07 Mar 2023 08:04:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMr-002uFs-Bk; Tue, 07 Mar 2023 08:04:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 1/3] watchdog: bcm47xx: Simplify using devm_watchdog_register_device()
Date:   Tue,  7 Mar 2023 08:04:02 +0100
Message-Id: <20230307070404.2256308-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
References: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ipYgmb1DRXfHJgb5NnRHQkT4QBz7D3v0/zcqTIsfBFc=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMaSwPbzxxJOzSVvX/eHpqwdnvk+X+KTDn5Uy//dbic128 y0mqQg7dTIaszAwcjHIiimy1BVpiU2QWPPfrmQJN8wgViaQKQxcnAIwEWk1DoZGvohAj+Z8e2ae xYlXejk3ne+9cCHl36l7P0pXXqwVbLyizNwQXSGn0pqe2M8efMXlNIdDXrKUMufEVucJKdPaUk9 I/XZ4wtEhldSzwS3to0u4kUligOCq/kcPsq6v+b9UcJnfnm9cS7WcVzFVe99Te3VGuvNv+IsK9d Iu2T8qGRmZ3nVSyt7zFzz+E3s9rOzh1biamXKvTgg8fXO/7ntgw17Z2MhrttbGZ+/EZKWlXl3K2 Z7IkOp04eOikwUX9in1r+QJ9vEOqr/q3KquKr5GT8e0/8s6sZJPfcuE3iYcMyw5xz+hI0miWYZd /UrAtZaJshmBvxT/9DxuZtnkfFRRpuzC1DMajZ5MtqEA
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

This allows to drop the .remove() function as it only exists to
unregister the watchdog device which is now done in a callback
registered by devm_watchdog_register_device().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/bcm47xx_wdt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.c
index 05425c1dfd4c..06a54c7de40b 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -202,7 +202,7 @@ static int bcm47xx_wdt_probe(struct platform_device *pdev)
 	watchdog_set_restart_priority(&wdt->wdd, 64);
 	watchdog_stop_on_reboot(&wdt->wdd);
 
-	ret = watchdog_register_device(&wdt->wdd);
+	ret = devm_watchdog_register_device(&pdev->dev, &wdt->wdd);
 	if (ret)
 		goto err_timer;
 
@@ -218,21 +218,11 @@ static int bcm47xx_wdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int bcm47xx_wdt_remove(struct platform_device *pdev)
-{
-	struct bcm47xx_wdt *wdt = dev_get_platdata(&pdev->dev);
-
-	watchdog_unregister_device(&wdt->wdd);
-
-	return 0;
-}
-
 static struct platform_driver bcm47xx_wdt_driver = {
 	.driver		= {
 		.name	= "bcm47xx-wdt",
 	},
 	.probe		= bcm47xx_wdt_probe,
-	.remove		= bcm47xx_wdt_remove,
 };
 
 module_platform_driver(bcm47xx_wdt_driver);
-- 
2.39.1

