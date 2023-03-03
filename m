Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051056AA15A
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjCCVhl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjCCVhi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A1A62D95
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-00005s-6N; Fri, 03 Mar 2023 22:37:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001eAb-U5; Fri, 03 Mar 2023 22:37:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001wxV-Iv; Fri, 03 Mar 2023 22:37:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 07/34] watchdog: bcm2835: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:49 +0100
Message-Id: <20230303213716.2123717-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=cI7FTjbvztVO6mz6+txwLW+bweaeRgJNiyo/oBrE/yY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgo+Puf549yBsfiDBiX7gp2NIBVMu1ZVqoJI 8YaJ3R9+AiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoKAAKCRDB/BR4rcrs CVHhB/0XbA+S7QgbQsCThmgE0osCJrZKChczOg9O2uvLgw1cyTcyuXLxyPApWp91Iy582TBmLh0 Vx9v1dPCvT2hDupuL2plxhX88u5l2hfTDigVXN7zeP5VZOOU5vlNW4jwZz7+3biAUJCs2POkMNX TO8NXN6jibV8Dz/wM9mpUvtY2LelV4nXdg7jym9tMepWqLf3xuKJik1AgU6EK7SLZyUnhp43Ot6 f5p+Xk42TN8j0zIdgytM4Z+jiztdo3V8G3zXgXrPSAJAoamb3jxv57hTJ9RW5L9fyGHFL8tvSWl JjmW6GhwHQSPVohn877iWueLGpwM9QKpuI4hmcCpry7yMEEV
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
 drivers/watchdog/bcm2835_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index 94907176a0e4..7a855289ff5e 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -218,17 +218,15 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bcm2835_wdt_remove(struct platform_device *pdev)
+static void bcm2835_wdt_remove(struct platform_device *pdev)
 {
 	if (pm_power_off == bcm2835_power_off)
 		pm_power_off = NULL;
-
-	return 0;
 }
 
 static struct platform_driver bcm2835_wdt_driver = {
 	.probe		= bcm2835_wdt_probe,
-	.remove		= bcm2835_wdt_remove,
+	.remove_new	= bcm2835_wdt_remove,
 	.driver = {
 		.name =		"bcm2835-wdt",
 	},
-- 
2.39.1

