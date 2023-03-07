Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816636AD90A
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Mar 2023 09:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjCGISA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Mar 2023 03:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjCGIRy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Mar 2023 03:17:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8964FF21
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Mar 2023 00:17:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSVi-0003g3-Dz; Tue, 07 Mar 2023 09:17:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMs-002Q8P-M5; Tue, 07 Mar 2023 08:04:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZRMr-002uFv-HW; Tue, 07 Mar 2023 08:04:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 2/3] watchdog: rn5t618: Simplify using devm_watchdog_register_device()
Date:   Tue,  7 Mar 2023 08:04:03 +0100
Message-Id: <20230307070404.2256308-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
References: <20230307070404.2256308-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1PxQiWm3o6xUBSctv+48rlF0I9W5WfuriSqfvHsKzlM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBuHcBdRQEiMdyNGO0wvyudctRxbxKNXf1ZGT8 Q5wMTuu3CyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAbh3AAKCRDB/BR4rcrs CUlJB/9w05/G2u+xTbJgrDoPcvwy3KMVu6OelCseEE4lrsWRtsLBRj7GLxnce5iEgnNtXbgvafj 80BPCGxCQvar+kAE5RYbWyAnhV4jwawi9hcCoeI6gA5TdjfFwEhmSas+ogZITaDI6FXa+l/tC9V olLHG7+IW8Biio7sucA/WVg3d7jZmEmJ82AMgATKPHQgb575XNLn80ZX17XUCyYQSQN9hIbin0v R7mJSqJzJ/KNd9fMVZIN5kwaU9feHsT56hkNtCM3CCa2TlUnsZqwUy7dM2qpqX7N42WhL6/5VDi 15fEfkMw9yWjOz85Xhq2jYHkJQKBN3c3tZ+jvfUZR5At3m2J
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

This allows to drop the .remove() function as it only exists to
unregister the watchdog device which is now done in a callback
registered by devm_watchdog_register_device().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/rn5t618_wdt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
index 40d8ebd8c0ac..87d06d210ac9 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -178,21 +178,11 @@ static int rn5t618_wdt_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, wdt);
 
-	return watchdog_register_device(&wdt->wdt_dev);
-}
-
-static int rn5t618_wdt_remove(struct platform_device *pdev)
-{
-	struct rn5t618_wdt *wdt = platform_get_drvdata(pdev);
-
-	watchdog_unregister_device(&wdt->wdt_dev);
-
-	return 0;
+	return devm_watchdog_register_device(dev, &wdt->wdt_dev);
 }
 
 static struct platform_driver rn5t618_wdt_driver = {
 	.probe = rn5t618_wdt_probe,
-	.remove = rn5t618_wdt_remove,
 	.driver = {
 		.name	= DRIVER_NAME,
 	},
-- 
2.39.1

