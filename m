Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1C76AA155
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjCCVhi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjCCVhh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6540462D8C
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-00005t-K0; Fri, 03 Mar 2023 22:37:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001eAd-UH; Fri, 03 Mar 2023 22:37:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001wxi-6y; Fri, 03 Mar 2023 22:37:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 10/34] watchdog: cpwd: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:52 +0100
Message-Id: <20230303213716.2123717-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LMkzrPF5eAJZYQfTdtVD0pd5bkljN8DywNHIHulvdDs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgyzwyAUGRctfux1Tu5vY6uhBWvZyPrp0ow/ +CwE0bFC/mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoMgAKCRDB/BR4rcrs CTELB/sEbWvRv39V/BQc7ZXZ4OIWgHhtW18iTWGmV9RzQoKnBIr+5xEeoimiok82VoWBZRmhvU5 aV1hMjW+lxAVHncLeMKksNAyar9SbAqalXgWCTcxqg5l8rCer5uLlT/B7a4mPpd5bc4nQVJMLqP SC5IqbNGiXfDkBJUrH9B27iipU1RZYhkb2KgCALQQeGUzC5i0SQLQMHf+Cfo/y52V0vFyZsnJRn Cl174FKehO20U3fXT+SAd6UR+eD1FXIp2JIPpm9rK1MisB+Tu/odf2nN/wJ8kB2xbG/n1oxcBjw kPzGVB8syKfMqkrmjks5zXYF5vpbXNsHkCizFuBOE+QaMz2C
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
 drivers/watchdog/cpwd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 1eafe0b4d71c..47250f9b68c7 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -614,7 +614,7 @@ static int cpwd_probe(struct platform_device *op)
 	return err;
 }
 
-static int cpwd_remove(struct platform_device *op)
+static void cpwd_remove(struct platform_device *op)
 {
 	struct cpwd *p = platform_get_drvdata(op);
 	int i;
@@ -638,8 +638,6 @@ static int cpwd_remove(struct platform_device *op)
 	of_iounmap(&op->resource[0], p->regs, 4 * WD_TIMER_REGSZ);
 
 	cpwd_device = NULL;
-
-	return 0;
 }
 
 static const struct of_device_id cpwd_match[] = {
@@ -656,7 +654,7 @@ static struct platform_driver cpwd_driver = {
 		.of_match_table = cpwd_match,
 	},
 	.probe		= cpwd_probe,
-	.remove		= cpwd_remove,
+	.remove_new	= cpwd_remove,
 };
 
 module_platform_driver(cpwd_driver);
-- 
2.39.1

