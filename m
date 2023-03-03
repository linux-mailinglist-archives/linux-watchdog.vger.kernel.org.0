Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F044B6AA163
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbjCCVhp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjCCVhk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C7C62D9C
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-0000AM-4Z; Fri, 03 Mar 2023 22:37:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001eBW-DV; Fri, 03 Mar 2023 22:37:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-001wyG-5Z; Fri, 03 Mar 2023 22:37:35 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 19/34] watchdog: nv_tco: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:01 +0100
Message-Id: <20230303213716.2123717-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=N474ygOiq5p6UhyWq5RkJUOSzFCpjF/S6GwTzm//nUM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhRZZiOfocWCNCFpf/WzFAkNsxNbtg7Eq5db zue/z6g2YqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoUQAKCRDB/BR4rcrs CZXFB/98QZMb0w0vfOeDyh4n5wec/HM7clSteY97pQ7G9JMFL5mKTsgni4N2zoMHtYiL9w+qYly K5Xbmt1Uvuu8im4ZvNJEwCLDTxJUOtzD/x40O6I3NaizNSOqT1m1QSPumOCF+Y/KyL4lK/Na9su KkINB/5WCi+c1YN9davUmXXcLbypG18fxs2dPEnYCZJyUBL7jOem0oImrrIvYDjFWK6SwHq1Un9 S2Bkh48cUdO5tmwqIHveh4RQNHqElAQhh6WZsTNpRtjnIGLWfUxiXTDoko79XueUkKDapEHIA/8 BFwmXeb54IyjA7a7UvoQMY4h+6wUfgl0hT1ajbW5FJtY2/WO
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
 drivers/watchdog/nv_tco.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
index f6902a337422..ac4a9c16341d 100644
--- a/drivers/watchdog/nv_tco.c
+++ b/drivers/watchdog/nv_tco.c
@@ -446,12 +446,10 @@ static void nv_tco_cleanup(void)
 	release_region(tcobase, 0x10);
 }
 
-static int nv_tco_remove(struct platform_device *dev)
+static void nv_tco_remove(struct platform_device *dev)
 {
 	if (tcobase)
 		nv_tco_cleanup();
-
-	return 0;
 }
 
 static void nv_tco_shutdown(struct platform_device *dev)
@@ -469,7 +467,7 @@ static void nv_tco_shutdown(struct platform_device *dev)
 
 static struct platform_driver nv_tco_driver = {
 	.probe		= nv_tco_init,
-	.remove		= nv_tco_remove,
+	.remove_new	= nv_tco_remove,
 	.shutdown	= nv_tco_shutdown,
 	.driver		= {
 		.name	= TCO_MODULE_NAME,
-- 
2.39.1

