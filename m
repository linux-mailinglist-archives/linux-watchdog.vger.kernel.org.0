Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C096AA176
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjCCVhv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjCCVhn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309A862DB0
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:42 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5w-0000MH-1l; Fri, 03 Mar 2023 22:37:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5u-001eCJ-Gf; Fri, 03 Mar 2023 22:37:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001wyz-MM; Fri, 03 Mar 2023 22:37:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 30/34] watchdog: sch311x: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:12 +0100
Message-Id: <20230303213716.2123717-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iVlH6Z3xXpcEeYUc2mGof+xkaDC4Lm3O9ljwCn/Ey+g=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmh4FbRpe31Yef6x6jiaV2mZxZIKc0JWQziQN gGo2L4OoV+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoeAAKCRDB/BR4rcrs CRnRB/sF1wWSPJX5xYHE+TwkGbjnnNmHIdM2peN2+2tSnHVD58lFzpQ68d+6jsDsSYBqMX5qgf0 dqtDZ4wXXE7hFZu/0p5J22+gnnNq+22GtF++O0a+nKtSQ9KJUePGum6XbjSX4TSJfBR1wyxPhfr TsRgA30bSpDGxtfNygJF1cOwzZ6Bo6wjKcNGrjmE5qlvKD9mQis2iqbgxmja0c+VVj/54zAH9R7 9PWkupzpt5KKqG0hQ7KnG0AooiQEjhOhbomKtR0Ua8kym+IJo5QRy1aqCVl1ityFOIE73CRwSTF Qc78OEg9sb2x62xPf3MYksIk2OTMM6ZhFxyKf5bAkqWCttlC
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
 drivers/watchdog/sch311x_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
index d8b77fe10eba..409d49880170 100644
--- a/drivers/watchdog/sch311x_wdt.c
+++ b/drivers/watchdog/sch311x_wdt.c
@@ -425,7 +425,7 @@ static int sch311x_wdt_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int sch311x_wdt_remove(struct platform_device *pdev)
+static void sch311x_wdt_remove(struct platform_device *pdev)
 {
 	/* Stop the timer before we leave */
 	if (!nowayout)
@@ -436,7 +436,6 @@ static int sch311x_wdt_remove(struct platform_device *pdev)
 	release_region(sch311x_wdt_data.runtime_reg + WDT_TIME_OUT, 4);
 	release_region(sch311x_wdt_data.runtime_reg + GP60, 1);
 	sch311x_wdt_data.runtime_reg = 0;
-	return 0;
 }
 
 static void sch311x_wdt_shutdown(struct platform_device *dev)
@@ -447,7 +446,7 @@ static void sch311x_wdt_shutdown(struct platform_device *dev)
 
 static struct platform_driver sch311x_wdt_driver = {
 	.probe		= sch311x_wdt_probe,
-	.remove		= sch311x_wdt_remove,
+	.remove_new	= sch311x_wdt_remove,
 	.shutdown	= sch311x_wdt_shutdown,
 	.driver		= {
 		.name = DRV_NAME,
-- 
2.39.1

