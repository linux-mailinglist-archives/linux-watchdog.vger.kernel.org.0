Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEFF7E2904
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 16:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjKFPtN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 10:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjKFPtM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 10:49:12 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB06C9
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 07:49:09 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qD-0007hB-4V; Mon, 06 Nov 2023 16:48:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0074pU-8R; Mon, 06 Nov 2023 16:48:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-00Dn80-VD; Mon, 06 Nov 2023 16:48:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 4/5] watchdog: starfive-wdt: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 16:48:12 +0100
Message-ID: <20231106154807.3866712-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IWsge4pWEmraTjNs4H8MWqhiFMh0+iEDsY6CQF+OpCs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSQq8u4xRZ377Ik7MUa4G3P63cSZYfQ3qdQB7h CR3kyqmMmaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkKvAAKCRCPgPtYfRL+ ToZ0B/0eXogruJGjFriMGcr36AUn+Kn/rj0PfZbY6QlQmEA9w3o6rIqpaYYPJ7BQKAp9eZq0sfS 7KBSmEukG9yLRVus1fO+G3ityAOanv0iroi8OOx03Yi6bic0S5OTcRR3AU1kjXKlunyLGTbYaEb p5j99rk6E3X3YDOelYQe8j+Gsox0arFqyug1/xaODXJfjlrK85TKMRci0RWrvzJWd7t+IuBWqXQ 8JwY7oPDdCIRC/iOFLO5FQIk3vWuJQufCZIHXgY6tstARSyQkStGy6rBkJb3z2OPJjU+zM5lmTt yyGqYGdswdT8QkSo4ReIK+O4somBCJAwnahAyGfP7nCi0GTA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/starfive-wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 5f501b41faf9..16df92837c5d 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -504,7 +504,7 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int starfive_wdt_remove(struct platform_device *pdev)
+static void starfive_wdt_remove(struct platform_device *pdev)
 {
 	struct starfive_wdt *wdt = platform_get_drvdata(pdev);
 
@@ -516,8 +516,6 @@ static int starfive_wdt_remove(struct platform_device *pdev)
 	else
 		/* disable clock without PM */
 		starfive_wdt_disable_clock(wdt);
-
-	return 0;
 }
 
 static void starfive_wdt_shutdown(struct platform_device *pdev)
@@ -587,7 +585,7 @@ MODULE_DEVICE_TABLE(of, starfive_wdt_match);
 
 static struct platform_driver starfive_wdt_driver = {
 	.probe = starfive_wdt_probe,
-	.remove = starfive_wdt_remove,
+	.remove_new = starfive_wdt_remove,
 	.shutdown = starfive_wdt_shutdown,
 	.driver = {
 		.name = "starfive-wdt",
-- 
2.42.0

