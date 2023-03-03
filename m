Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 861C96AA15D
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjCCVhn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjCCVhj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8F562D86
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:38 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-00009v-Lh; Fri, 03 Mar 2023 22:37:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001eBJ-1G; Fri, 03 Mar 2023 22:37:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-001wxr-SF; Fri, 03 Mar 2023 22:37:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 13/34] watchdog: geodewdt: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:55 +0100
Message-Id: <20230303213716.2123717-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SKAV+qcj5+C+HrTYZy8tDYcd6N3r9EXGU/nAfdzZO8k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmg9wUXy0j1mKaV80r0j3T2YXDlGOAtEB948R ibybzj3vG6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoPQAKCRDB/BR4rcrs CYfUB/9HX+f49ANA1n+lthIu0b4X/XzrCYuQQpECyGpKwx7yW1Nt88izsW0gip9VNGay2hrT9Gh tpB0l4mjj7Fzp/T1AwdUkUaDLX+QfZOCWFq17tWe/BeSs/5PHSLDVDPebCxkxPGpz4S3z2dQc/M SerSCenj47EuUUSwlorRcCJB1WNCSXGNamxj0Y4wfmtCBgeBayR7xyKYqr4WI+S3nLEWFVbYtHq JqwwwTBvAeO33SSSQUS7G1cTsDQ9RPwINMbRU7BPlhwf55yA7xi0f9hmEiTZalsJXcFq2GCVmU3 pR2gGeNuB7aa9tnesthPvGTvykCz3dAFwCktuJISgtu2+7mi
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
 drivers/watchdog/geodewdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
index 0b699c783d57..5186c37ad451 100644
--- a/drivers/watchdog/geodewdt.c
+++ b/drivers/watchdog/geodewdt.c
@@ -238,10 +238,9 @@ static int __init geodewdt_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int geodewdt_remove(struct platform_device *dev)
+static void geodewdt_remove(struct platform_device *dev)
 {
 	misc_deregister(&geodewdt_miscdev);
-	return 0;
 }
 
 static void geodewdt_shutdown(struct platform_device *dev)
@@ -250,7 +249,7 @@ static void geodewdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver geodewdt_driver = {
-	.remove		= geodewdt_remove,
+	.remove_new	= geodewdt_remove,
 	.shutdown	= geodewdt_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
-- 
2.39.1

