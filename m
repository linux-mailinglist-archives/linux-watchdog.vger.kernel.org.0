Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EFA69A8A2
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Feb 2023 10:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjBQJxe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Feb 2023 04:53:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBQJxd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Feb 2023 04:53:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87D65F257
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Feb 2023 01:53:32 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pSxQj-0001Bz-GS; Fri, 17 Feb 2023 10:53:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pSxQg-005YFM-TS; Fri, 17 Feb 2023 10:53:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pSxQh-004I1u-Fu; Fri, 17 Feb 2023 10:53:23 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH] watchdog: at91rm9200: Only warn once about problems in .remove()
Date:   Fri, 17 Feb 2023 10:53:17 +0100
Message-Id: <20230217095317.1213387-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KCFCul1v7TIKLH577N/fp9oqdUwOHohszUuC4GmMQVs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj706K832g6brobPK/iG1WsgyKDXYEPahLdnc4B vxqba+uWLCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+9OigAKCRDB/BR4rcrs CTvbB/9hR2AJfN4Nnwl/XUWQoa0lWCxmm83VlXuVTHoH+xnqjh8sKqfa0iBPGCrCWeQyE0NJuZv meH9xvEgp0NFaLBGwXeXkjz4FBUmYOOyrGYhAR618vqZ387eLsTmRHMaBGzCKQoEo7PE/mH7Vb9 xF7y/dmcyOh2kLhvDlpgFgZi/6PpTpkjxKIAZkEo1uQB9he7hmXC2Vkp6lM9eue3UQKGlQa8WQV NxFeOMCpQ9Cf4IbwDuQ29+mJ3U0cufx3euEly3cr0K8tRdkH9zltetRIRrbG6rr9A3ETxOcbgKj KGzFjXiwA9W4PHO1MtlpmIX0rbOtODM8XsedB1EHnAQCbtct
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

The single difference between returning 0 and returning an error code in
a platform remove callback is that in the latter case the platform core
emits a warning about the error being ignored.

at91wdt_remove() already emits a warning in the error case, so suppress
the more generic (and less helpful) one by returning 0.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/at91rm9200_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
index 5126454bb861..d57409c1a4d1 100644
--- a/drivers/watchdog/at91rm9200_wdt.c
+++ b/drivers/watchdog/at91rm9200_wdt.c
@@ -270,7 +270,7 @@ static int at91wdt_remove(struct platform_device *pdev)
 	misc_deregister(&at91wdt_miscdev);
 	at91wdt_miscdev.parent = NULL;
 
-	return res;
+	return 0;
 }
 
 static void at91wdt_shutdown(struct platform_device *pdev)

base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
-- 
2.39.1

