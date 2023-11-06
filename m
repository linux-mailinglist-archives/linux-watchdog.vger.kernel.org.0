Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D6C7E28FC
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 16:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjKFPsp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 10:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjKFPso (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 10:48:44 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12121B2
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 07:48:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0007hI-QI; Mon, 06 Nov 2023 16:48:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0074pX-Da; Mon, 06 Nov 2023 16:48:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-00Dn83-4S; Mon, 06 Nov 2023 16:48:39 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 5/5] watchdog: txx9wdt: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 16:48:13 +0100
Message-ID: <20231106154807.3866712-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=19R16HoTkmoGz3FYqRvLDwotxo52jJV5gvceAFUBBmU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSQq998W8PY09AzIIrXsySLVoFqxg+8cVy4Yux 3zp+rNrKC2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkKvQAKCRCPgPtYfRL+ TsS9CACzleuDrOxjwLKoa0klPlzgic/kon1lfCG0/a9zZRYE7luRbFoOqXOyfmvifF/2RtjKU93 c8Qxik0/xG7uNn+AkfRI7gObLiQpWozjiX3EoIMdZDyD7s/fmzENtYsHRCfD2ToOxMTVKwe4fXc z7tdwy0GjjNH8f8HHZOOwsA34plxshQnnLkLg7hcSjgFVRbvzCLnGIPn8Oq+QMyf+sPQgEMh+6y ib/17pZP25IG+GBsPeEBm5MEPBSFInnZnRpuXPT/Dl8BGipkMMNAak2wK3K8a2X4vx6i4Dd0g+X y3aigi7xFgpHWDysLhCq3vJGmymuenT4Ui96nl80cSAtluoY
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
 drivers/watchdog/txx9wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/txx9wdt.c b/drivers/watchdog/txx9wdt.c
index f900c519ed63..8d5f67acbff2 100644
--- a/drivers/watchdog/txx9wdt.c
+++ b/drivers/watchdog/txx9wdt.c
@@ -145,12 +145,11 @@ static int txx9wdt_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int txx9wdt_remove(struct platform_device *dev)
+static void txx9wdt_remove(struct platform_device *dev)
 {
 	watchdog_unregister_device(&txx9wdt);
 	clk_disable_unprepare(txx9_imclk);
 	clk_put(txx9_imclk);
-	return 0;
 }
 
 static void txx9wdt_shutdown(struct platform_device *dev)
@@ -160,7 +159,7 @@ static void txx9wdt_shutdown(struct platform_device *dev)
 
 static struct platform_driver txx9wdt_driver = {
 	.probe = txx9wdt_probe,
-	.remove = txx9wdt_remove,
+	.remove_new = txx9wdt_remove,
 	.shutdown = txx9wdt_shutdown,
 	.driver = {
 		.name = "txx9wdt",
-- 
2.42.0

