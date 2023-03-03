Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881B96AA177
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjCCVhx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjCCVho (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4086562D8D
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:43 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5w-0000NX-Hl; Fri, 03 Mar 2023 22:37:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5v-001eCY-3U; Fri, 03 Mar 2023 22:37:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5u-001wzB-CA; Fri, 03 Mar 2023 22:37:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 33/34] watchdog: stmp3xxx_rtc: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:15 +0100
Message-Id: <20230303213716.2123717-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7BLjEAE+OMR4vcRLdtu8fbKtU1EdPh6RPJWc/ir7b/0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmiCCHlZhBDExndJ5m6lx0wuc8QePPa20UA98 P6qVFb7UF6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoggAKCRDB/BR4rcrs Ce8lB/9hwoU4opbIZHMZsgS3Z8HcBKf0uHx/7pm9CDNVex/0uLwAE1H1KMZxpjHXMYPCOJ3NBxE x7JjZGZGCCrub8vaYQLn/OCQ20S4PPLyniXXPFteu0lgqxxLk2z7fbMMZue3ctXwGmZD9M3UcB2 HdZOuRUyD6dwtoXswmAn3hHyTry37KEaFuslVjJAad+9fRuJ2XQJ5P0RGRZcDwOB/ciKHeqx5Bt N1b9qsd+i5EVMCi88Bmmq+ykhkX2pqn488i6cQeymdT2/Pdve1wIsoRtysde6tnEmkCCxbgqtBh LVJbn3W/Z2tFN78SGN/nP6klYZWs7IL9HhGpQYL5tKvgTd2N
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
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
index 7caf3aa71c6a..4b2caa9807ac 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -109,10 +109,9 @@ static int stmp3xxx_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int stmp3xxx_wdt_remove(struct platform_device *pdev)
+static void stmp3xxx_wdt_remove(struct platform_device *pdev)
 {
 	unregister_reboot_notifier(&wdt_notifier);
-	return 0;
 }
 
 static int __maybe_unused stmp3xxx_wdt_suspend(struct device *dev)
@@ -144,7 +143,7 @@ static struct platform_driver stmp3xxx_wdt_driver = {
 		.pm = &stmp3xxx_wdt_pm_ops,
 	},
 	.probe = stmp3xxx_wdt_probe,
-	.remove = stmp3xxx_wdt_remove,
+	.remove_new = stmp3xxx_wdt_remove,
 };
 module_platform_driver(stmp3xxx_wdt_driver);
 
-- 
2.39.1

