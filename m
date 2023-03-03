Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94DDC6AA16E
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjCCVht (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbjCCVhm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7147E62DA6
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5u-0000Fx-Oa; Fri, 03 Mar 2023 22:37:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001eBu-8k; Fri, 03 Mar 2023 22:37:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001wyZ-A9; Fri, 03 Mar 2023 22:37:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 24/34] watchdog: renesas: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:06 +0100
Message-Id: <20230303213716.2123717-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y1lJI0IICJXW8SluHHYFHg1hyYDIrzGh81N9PINLqMM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhjp66tQsp32Tk6Qo8KLzTxzNGoOrgFfcnGa r4mMukEZuiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoYwAKCRDB/BR4rcrs CZlQB/48ioRXPTgnPh5dT09qUc2WkTf7BJTWik3n1ahyNaXYMcjQ3d0nlKFRw16w9BXXadbm0VV ZnWrmCboP/6Qx+ZKYqFc48pe4F1VivF8ts+AZyhivaiDJ7mMSVxnGYgKNUxOoIGX1/354LRHZYM +00MjpyuuwZjjS+WU9WsDm2AS5do7bSX+iXP9o96FOm/6ysHqYqAbgNAzFuZDKrcGIIKzEDeGy0 AKTFPsqv3/4/aXZSXHGHgJsQmBPaDWu2SHB+RoT7cWPn5hliaYYnPET/i8RUGPD7eRv4m47l9qO 2/Ul14bolNFlNq34IhiVX77zf/H2rUaNyt7p2w5cCDbT2qsc
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
 drivers/watchdog/renesas_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 41d58ea5eb2f..12c41d6e5cd6 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -292,14 +292,12 @@ static int rwdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rwdt_remove(struct platform_device *pdev)
+static void rwdt_remove(struct platform_device *pdev)
 {
 	struct rwdt_priv *priv = platform_get_drvdata(pdev);
 
 	watchdog_unregister_device(&priv->wdev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused rwdt_suspend(struct device *dev)
@@ -339,7 +337,7 @@ static struct platform_driver rwdt_driver = {
 		.pm = &rwdt_pm_ops,
 	},
 	.probe = rwdt_probe,
-	.remove = rwdt_remove,
+	.remove_new = rwdt_remove,
 };
 module_platform_driver(rwdt_driver);
 
-- 
2.39.1

