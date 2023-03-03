Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED546AA154
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjCCVhi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbjCCVhh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CC262D8D
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-0008Uy-Cc; Fri, 03 Mar 2023 22:37:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001eAH-Np; Fri, 03 Mar 2023 22:37:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001wxK-UU; Fri, 03 Mar 2023 22:37:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 04/34] watchdog: ar7: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:46 +0100
Message-Id: <20230303213716.2123717-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RkHCGC/s6zXR1s/1Ybq/smzYK3nLB5LM3xWD9STFFbE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgdAK0AQJR6edTzhWdTCt9tTOZG+Rbtz8wgp Fd345C/v6eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoHQAKCRDB/BR4rcrs CRuzB/9ThWB7myFo9F8tSt7kd06iabMEZcod1PeUwsun1hEFz8ZAbVeuEzOP/Y3LjeomyX8pukr rDPPc1O7l8L1P6POwpaX7QNN5sMNA+nceLRJg7wsFMq/TKMHCxnL3XNtwnxVMTEZoRAJPtbGd+v XvbSNzedb+hcEj9lutcu3/KrUdXVb6a7wzxt6XGRgdCmTBw7pr0P5AHqQgZ8vJKMXR6t1YA1WWB 76VRgcSy/w+nwv0fI7MtoW1j5q7v7yF+mCD6B2nmE7jWtDhOV5/2PqNe1N660jj54dSBMFWpp5G QNToA22ZG/khd1BlVT+SAvPdGOb7BK57gYziyKUbIOK2EPQL
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
 drivers/watchdog/ar7_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index 743e171d97a3..cdcaeb0961ac 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -290,12 +290,11 @@ static int ar7_wdt_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int ar7_wdt_remove(struct platform_device *pdev)
+static void ar7_wdt_remove(struct platform_device *pdev)
 {
 	misc_deregister(&ar7_wdt_miscdev);
 	clk_put(vbus_clk);
 	vbus_clk = NULL;
-	return 0;
 }
 
 static void ar7_wdt_shutdown(struct platform_device *pdev)
@@ -306,7 +305,7 @@ static void ar7_wdt_shutdown(struct platform_device *pdev)
 
 static struct platform_driver ar7_wdt_driver = {
 	.probe = ar7_wdt_probe,
-	.remove = ar7_wdt_remove,
+	.remove_new = ar7_wdt_remove,
 	.shutdown = ar7_wdt_shutdown,
 	.driver = {
 		.name = "ar7_wdt",
-- 
2.39.1

