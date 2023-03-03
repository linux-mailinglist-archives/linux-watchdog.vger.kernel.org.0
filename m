Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F676AA158
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjCCVhj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjCCVhh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D118D6233F
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-00006x-1Y; Fri, 03 Mar 2023 22:37:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-001eAp-CC; Fri, 03 Mar 2023 22:37:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001wxo-M7; Fri, 03 Mar 2023 22:37:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 12/34] watchdog: gef: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:54 +0100
Message-Id: <20230303213716.2123717-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Br27F/QZG9StXFuBEXX2hkDJ3aauh97InfFDgn1gzWQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmg52NFb9aGgFZQvbXSt8xGFAoDkvm9mS7NsV iXhgUKGwQiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoOQAKCRDB/BR4rcrs CdFjCACY/d/7OMkMiNCDECYAJ6zih5OiEAtBZlb5JItHyJjHHDPGTjT8mYPBbGrkDmMatslV9/b l21KYcNHZrRyrbSqxQtjfSz6Kk/aLYlrjmxuk+wz+QrEygNUxpPr38DJqgvomuSlVc64UtI6VaU W5xoQJkCc6NTOWr9Kvf38zczFdaPpKLqUEh5zPe7e+VAAqYBNGpsASzBnCnHcQhbLQ9PQwq94E3 RojWsDjLuSJcYXj3Tk41YyA9TLWQDKww59p3BRXMvGtuxkgtMAMhY4Zxv4dnELGBLoPOziK5pT3 aDpoXiEJh+YCZ0qn5J92uaA66FBdbqUJl14jErNvs4SAB2O8
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
 drivers/watchdog/gef_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index df5406aa7d25..97afc907f659 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -283,15 +283,13 @@ static int gef_wdt_probe(struct platform_device *dev)
 	return misc_register(&gef_wdt_miscdev);
 }
 
-static int gef_wdt_remove(struct platform_device *dev)
+static void gef_wdt_remove(struct platform_device *dev)
 {
 	misc_deregister(&gef_wdt_miscdev);
 
 	gef_wdt_handler_disable();
 
 	iounmap(gef_wdt_regs);
-
-	return 0;
 }
 
 static const struct of_device_id gef_wdt_ids[] = {
@@ -308,7 +306,7 @@ static struct platform_driver gef_wdt_driver = {
 		.of_match_table = gef_wdt_ids,
 	},
 	.probe		= gef_wdt_probe,
-	.remove		= gef_wdt_remove,
+	.remove_new	= gef_wdt_remove,
 };
 
 static int __init gef_wdt_init(void)
-- 
2.39.1

