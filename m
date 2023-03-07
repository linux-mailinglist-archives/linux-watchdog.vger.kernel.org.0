Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C77BD6AD908
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Mar 2023 09:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjCGIR6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Mar 2023 03:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjCGIRx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Mar 2023 03:17:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAF44FF1D
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Mar 2023 00:17:31 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSVj-0003g3-62; Tue, 07 Mar 2023 09:17:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMs-002Q8L-Ea; Tue, 07 Mar 2023 08:04:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMr-002uFy-NM; Tue, 07 Mar 2023 08:04:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 3/3] watchdog: wm8350: Simplify using devm_watchdog_register_device()
Date:   Tue,  7 Mar 2023 08:04:04 +0100
Message-Id: <20230307070404.2256308-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
References: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WUykWHRFf+Bdw+cJ1GYc0evQOMYyerm2g27vJVErCEs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBuHgjQCMx5AGmL+fbXtdjTr4N8jIcPeAJ64Jf Ez4NHJDc3uJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAbh4AAKCRDB/BR4rcrs CUrIB/9ruGt8RcSn6jvhqDviIsXu0adrvIJllRZlxyF60DwBUUndVi+vpHSy7LFl8sTioWn1QvO LALRa/29weZCBdnTPzHFq4zGmAs9qr7yfFAAzu10e+lm/D/dzurYQ/Y5JqK/dCXKyRWgkvILcim nkuFgmuWkKQPUCH1rNJx8lHQINl/XFOtinB6/Gf3etLrjSMQNDan1N3TO+O+YhDK++Qanf8RkzZ Gl/CaC865CrJ3uy0aR/M449/aeHCjK4uMVU9f+7FQ732Am0EMuInfcC2qmjVa8vJPblACv28qMk kEOLHgfJ5TN6/uHFTdO2OVhRGsyNnwHbgImqnwJKOwFLLdf2
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
 drivers/watchdog/wm8350_wdt.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/watchdog/wm8350_wdt.c b/drivers/watchdog/wm8350_wdt.c
index 33c62d51f00a..c82c1b77d91b 100644
--- a/drivers/watchdog/wm8350_wdt.c
+++ b/drivers/watchdog/wm8350_wdt.c
@@ -153,18 +153,11 @@ static int wm8350_wdt_probe(struct platform_device *pdev)
 	/* Default to 4s timeout */
 	wm8350_wdt_set_timeout(&wm8350_wdt, 4);
 
-	return watchdog_register_device(&wm8350_wdt);
-}
-
-static int wm8350_wdt_remove(struct platform_device *pdev)
-{
-	watchdog_unregister_device(&wm8350_wdt);
-	return 0;
+	return devm_watchdog_register_device(&pdev->dev, &wm8350_wdt);
 }
 
 static struct platform_driver wm8350_wdt_driver = {
 	.probe = wm8350_wdt_probe,
-	.remove = wm8350_wdt_remove,
 	.driver = {
 		.name = "wm8350-wdt",
 	},
-- 
2.39.1

