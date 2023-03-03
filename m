Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772F06AA151
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbjCCVhh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjCCVhg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E9F62D86
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-0008Uw-8b; Fri, 03 Mar 2023 22:37:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001eA9-Ct; Fri, 03 Mar 2023 22:37:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001wxD-Ht; Fri, 03 Mar 2023 22:37:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 02/34] watchdog: acquirewdt: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:44 +0100
Message-Id: <20230303213716.2123717-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9+q6C+nj1xYa0tIZrxM2LYMQH3OvD3DGaw1eGi3kuN4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgWO7DqToqu+bNAasPZmOaF65IkE9uWq7qAA 3fKCOtBvJmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoFgAKCRDB/BR4rcrs Cf1kB/9UpQxQCbZozInzUxOOWhiW4vPwx6AmFPr1lM/je1K0W8mjwM71RQ7EMLe+/NnpWOK5+Cd u9POxN1p/WbECiP6BJSxAcTVSthJXPP8SdX5gY87JU2yuN/0yVeocpneRo1xxzoGh94epN1xGhU /h6MwqeCaxcFdDP5TSHNFL3BB+zsDvJNf/ZZCdd4zD7Va8k11n6xBmD+AuuRZJ4ulKNFiY48iu6 NhbGZAk4k/QVnbMKpLoHDu3FEDqWbGyPMuMdl6Rayd+JWnkGbO3lphiEOXOqEPY4Gds0Dydzbj9 MBUIRs2PgrIEwGh3zGkc/B8Vk1wm3IEzJfRZE+MKeetU84Of
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
 drivers/watchdog/acquirewdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/acquirewdt.c b/drivers/watchdog/acquirewdt.c
index bc6f333565d3..53b04abd55b0 100644
--- a/drivers/watchdog/acquirewdt.c
+++ b/drivers/watchdog/acquirewdt.c
@@ -271,14 +271,12 @@ static int __init acq_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int acq_remove(struct platform_device *dev)
+static void acq_remove(struct platform_device *dev)
 {
 	misc_deregister(&acq_miscdev);
 	release_region(wdt_start, 1);
 	if (wdt_stop != wdt_start)
 		release_region(wdt_stop, 1);
-
-	return 0;
 }
 
 static void acq_shutdown(struct platform_device *dev)
@@ -288,7 +286,7 @@ static void acq_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver acquirewdt_driver = {
-	.remove		= acq_remove,
+	.remove_new	= acq_remove,
 	.shutdown	= acq_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
-- 
2.39.1

