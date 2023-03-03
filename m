Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1C86AA156
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbjCCVhj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjCCVhh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAF362D86
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-00006D-Qf; Fri, 03 Mar 2023 22:37:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-001eAl-58; Fri, 03 Mar 2023 22:37:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001wxl-Et; Fri, 03 Mar 2023 22:37:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 11/34] watchdog: dw: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:53 +0100
Message-Id: <20230303213716.2123717-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5Y2NHWphrFZXOxH/6CBv3LnZTHSvhtiO0Ar57w0WXf4=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQwZZi+jcqTSd7KvtZSjJlFOnfWcz0J17j1hv+3P2/sm FXgumJvJ6MxCwMjF4OsmCJLXZGW2ASJNf/tSpZwwwxiZQKZwsDFKQATuZfM/oe3KXnaVv1FWxae aZbgz5ieprFH2spT1Xgtf5Cwzx2rJdlywbel1k/94mO0O6P8zHrvZ3eKmPc5Wermlj3jPrYg7Xz mMdEv2459+HhxQ2ZXyaaDP1YERL3R39LTYOrKmLF4904/N6kMtfgmL5s1Tixf9uRZV0rmz0kNDX y5vzJ7FU+4l22dwT+XFPMNE3N+b7ny9ddVtZv/Z39xKWxWyhLaf5CVTTW2ZfZp9SO6O2RXhhtEP /nhvii58/dDA5PkV82zpYLTHzJ+cX4i3LrCzFo+0S894cR/c80e1acSgc9DCg/qB+fa5TlnF/qV ZV6b6BneZ3JeRuD8t3yr80+FdkxcGhf8+rnsZNVnFzu1AA==
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
 drivers/watchdog/dw_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 462f15bd5ffa..6f88bd81f8a1 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -681,7 +681,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dw_wdt_drv_remove(struct platform_device *pdev)
+static void dw_wdt_drv_remove(struct platform_device *pdev)
 {
 	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
 
@@ -691,8 +691,6 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
 	reset_control_assert(dw_wdt->rst);
 	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -705,7 +703,7 @@ MODULE_DEVICE_TABLE(of, dw_wdt_of_match);
 
 static struct platform_driver dw_wdt_driver = {
 	.probe		= dw_wdt_drv_probe,
-	.remove		= dw_wdt_drv_remove,
+	.remove_new	= dw_wdt_drv_remove,
 	.driver		= {
 		.name	= "dw_wdt",
 		.of_match_table = of_match_ptr(dw_wdt_of_match),
-- 
2.39.1

