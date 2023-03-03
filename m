Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23386AA17A
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjCCVhw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbjCCVhn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0094862D8E
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:42 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5w-0000OL-MO; Fri, 03 Mar 2023 22:37:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5v-001eCb-C1; Fri, 03 Mar 2023 22:37:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5u-001wzE-JM; Fri, 03 Mar 2023 22:37:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 34/34] watchdog: wm8350: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:16 +0100
Message-Id: <20230303213716.2123717-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FsTnlhggXsgEULKqbXWL/LTIOxmfSKGmu5i8CQCqZsE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmiFtSMLGcsyUp3OzB+xkaNCByzphZuintiRG snzjgtBKYeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJohQAKCRDB/BR4rcrs CTBqB/4hcZWYiM/Scq4FHWrfA6b5P4oge5iuLGgEVqEgmCp8W7TBzvJqQy7c/WoOZRZtXcv6ryP ueXfffcb8xdQ3LhnXtl22RiHEowYgWK+XfiIZggqxQklSqQ50gm0IvWBLjxWxkRjXvDqLr6ATxJ 9YvZyQ6vY0uEqJXZ6PbbAVPnQExt2C5v2eyT1nP5sIednhABJwNCKyFpGwRhDeMRdYNBVjpOhVq gZ7y9TQfaSqK1HmsXN/xH1zxdgUBbLrEhsJNOxsIH0RM+FMNvSnLG9crD6JZ3AdNAzWQphtKxJf EVdJJfUrXnt4Eh0p7w0AQlvjxTML8ALztjOj7uLFzJKueo3Z
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
 drivers/watchdog/wm8350_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/wm8350_wdt.c b/drivers/watchdog/wm8350_wdt.c
index 33c62d51f00a..febda195aed2 100644
--- a/drivers/watchdog/wm8350_wdt.c
+++ b/drivers/watchdog/wm8350_wdt.c
@@ -156,15 +156,14 @@ static int wm8350_wdt_probe(struct platform_device *pdev)
 	return watchdog_register_device(&wm8350_wdt);
 }
 
-static int wm8350_wdt_remove(struct platform_device *pdev)
+static void wm8350_wdt_remove(struct platform_device *pdev)
 {
 	watchdog_unregister_device(&wm8350_wdt);
-	return 0;
 }
 
 static struct platform_driver wm8350_wdt_driver = {
 	.probe = wm8350_wdt_probe,
-	.remove = wm8350_wdt_remove,
+	.remove_new = wm8350_wdt_remove,
 	.driver = {
 		.name = "wm8350-wdt",
 	},
-- 
2.39.1

