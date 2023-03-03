Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45EA6AA178
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjCCVhy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjCCVhq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945E662D8E
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:45 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5v-0000MI-Jj; Fri, 03 Mar 2023 22:37:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5u-001eCI-GX; Fri, 03 Mar 2023 22:37:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001wyr-8Y; Fri, 03 Mar 2023 22:37:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 28/34] watchdog: s3c2410: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:10 +0100
Message-Id: <20230303213716.2123717-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=M+DN6Ffcu47NvDlJ71rx485DsQUZMI7Kl6vBiuQHIaI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhx0CtjwFuTgZla7LkQRXk62OR+DTlQfjsgs mG811DGxLeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJocQAKCRDB/BR4rcrs CcLPCACUexN6C8auNnEIoxV3LNntl/LWc+Xs+y1CEHX5mk0o+qdS6522BqH2fFs9kH/g54KhAHM OyMzSl9wfsAtTHOqhDCQriOrPpI/3SJyKFu/I+ChBsnCvj0Iblk83vZl9rWB7bzVWsc97oUrrlu XmAFMOaiQ9aYBK1urau9B0JCsRtd6E2KRw2Hnz395cHzla1PfbqcoMfO8qtspD1BzFSgqZ86XmL C1smF2NYluWPaltuZUWWI+0SOCFPd7nisJe9/nCagzrAu3aOQeDsylRVkddnYuWEomkVGhSD9Z1 nFCRLRdBcoG6HiyAdxFNi/OMmqETdIwa6wO89swJgGbcG1vV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/watchdog/s3c2410_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index cf104a844a43..d1f408913843 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -775,7 +775,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int s3c2410wdt_remove(struct platform_device *dev)
+static void s3c2410wdt_remove(struct platform_device *dev)
 {
 	int ret;
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
@@ -789,8 +789,6 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 
 	clk_disable_unprepare(wdt->src_clk);
 	clk_disable_unprepare(wdt->bus_clk);
-
-	return 0;
 }
 
 static void s3c2410wdt_shutdown(struct platform_device *dev)
@@ -845,7 +843,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
 
 static struct platform_driver s3c2410wdt_driver = {
 	.probe		= s3c2410wdt_probe,
-	.remove		= s3c2410wdt_remove,
+	.remove_new	= s3c2410wdt_remove,
 	.shutdown	= s3c2410wdt_shutdown,
 	.id_table	= s3c2410_wdt_ids,
 	.driver		= {
-- 
2.39.1

