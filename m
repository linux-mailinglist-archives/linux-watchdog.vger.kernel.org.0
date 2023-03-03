Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825E86AA160
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjCCVho (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjCCVhj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D948262D8E
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:38 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-0000A0-PE; Fri, 03 Mar 2023 22:37:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001eBN-4P; Fri, 03 Mar 2023 22:37:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-001wyC-Un; Fri, 03 Mar 2023 22:37:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 18/34] watchdog: nic7018: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:00 +0100
Message-Id: <20230303213716.2123717-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IgIBURT08KNAyITcnmDzkiD1kSrg7T91+Mj13I3MbCI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhNvYiqUi9/LTcjl/sngm/L4RXaXlkOM9za2 47km9scQEiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoTQAKCRDB/BR4rcrs CcYaCACQXE9TDw6mYV5/db6el5DEbh++wXQviw07R7QZRdAvuDAmGtqpfT6Rt9k5oRXnQxLQ7a+ ok1tnswjbGOyRE4XX32bzu5OBso3CoV4VFpVzgmjgo7rnj0BVUqwwUVnQMiXxXhMWQ5UOKMjkDx 6KdKHUhYAu+WulHxuYaTEk0e4v70X84n2l2YvbZX7I3Ml3S19V1k0CXNJ2SWg1IlnfBRmj/3+h5 IdPky2t2qgnNVohW+D2GoaIpBg3GEqjs22pSFkGxo8O+2E1aqfBMVAU7HX0oloTA8Smc/UpZdnk gHE2/L3TVHWaphFT199wSKzLdWTnSErYh9t8xM758OlWHte6
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
 drivers/watchdog/nic7018_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/nic7018_wdt.c b/drivers/watchdog/nic7018_wdt.c
index 2a46cc662943..c3f0a4926667 100644
--- a/drivers/watchdog/nic7018_wdt.c
+++ b/drivers/watchdog/nic7018_wdt.c
@@ -218,7 +218,7 @@ static int nic7018_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nic7018_remove(struct platform_device *pdev)
+static void nic7018_remove(struct platform_device *pdev)
 {
 	struct nic7018_wdt *wdt = platform_get_drvdata(pdev);
 
@@ -226,8 +226,6 @@ static int nic7018_remove(struct platform_device *pdev)
 
 	/* Lock WDT register */
 	outb(LOCK, wdt->io_base + WDT_REG_LOCK);
-
-	return 0;
 }
 
 static const struct acpi_device_id nic7018_device_ids[] = {
@@ -238,7 +236,7 @@ MODULE_DEVICE_TABLE(acpi, nic7018_device_ids);
 
 static struct platform_driver watchdog_driver = {
 	.probe = nic7018_probe,
-	.remove = nic7018_remove,
+	.remove_new = nic7018_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(nic7018_device_ids),
-- 
2.39.1

