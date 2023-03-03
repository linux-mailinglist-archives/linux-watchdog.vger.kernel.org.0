Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EC26AA15F
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjCCVho (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjCCVhj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595BA6233F
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:38 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-00009d-Hc; Fri, 03 Mar 2023 22:37:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-001eBG-Sw; Fri, 03 Mar 2023 22:37:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-001wy9-Nk; Fri, 03 Mar 2023 22:37:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 17/34] watchdog: mtx-1: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:59 +0100
Message-Id: <20230303213716.2123717-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JynVHIU1C8idOxmj9F78LBnlLYI6md8oMsgxVjNsJWE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhKQpkXhIm3oZFrNIitHjDBadeq9W9NFa8AS XC7CdQWF7mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoSgAKCRDB/BR4rcrs CUJvB/0a93kZ5PLGryhI83PIQ+l0x4APk0y8owGOBfFIO+ytn9qJTlBSDLI/4fwx21FF2Qi73t3 h2sJbV4TeQiWauAk9obNnAr32QsAbn4+/9NL5xuhTkVJCEojSYfSDz/b4d6wXPFhqI5p/9LaUPE 2nOy+XR94jiUB+xghz81d/FrWEgoHKL6grUqlnbMK1agrH0yLWZyfKyg1JpPYmIoMuq2e9Z97qB I/QXv+sSdKDHIUzFnoV7H84rG4EfZfeiHAn7RVW6TSqOiR7edwfBzygjQyQOqob4wKHSENjYo1f yuBX6jO9qiocxegDQr7UQMP41AMZfKYWE9GyBxMJwf5O6w12
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
 drivers/watchdog/mtx-1_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
index ea1bbf5ee528..152e41ecbb14 100644
--- a/drivers/watchdog/mtx-1_wdt.c
+++ b/drivers/watchdog/mtx-1_wdt.c
@@ -221,7 +221,7 @@ static int mtx1_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtx1_wdt_remove(struct platform_device *pdev)
+static void mtx1_wdt_remove(struct platform_device *pdev)
 {
 	/* FIXME: do we need to lock this test ? */
 	if (mtx1_wdt_device.queue) {
@@ -230,12 +230,11 @@ static int mtx1_wdt_remove(struct platform_device *pdev)
 	}
 
 	misc_deregister(&mtx1_wdt_misc);
-	return 0;
 }
 
 static struct platform_driver mtx1_wdt_driver = {
 	.probe = mtx1_wdt_probe,
-	.remove = mtx1_wdt_remove,
+	.remove_new = mtx1_wdt_remove,
 	.driver.name = "mtx1-wdt",
 	.driver.owner = THIS_MODULE,
 };
-- 
2.39.1

