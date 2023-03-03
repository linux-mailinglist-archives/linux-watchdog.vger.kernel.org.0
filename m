Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2376A6AA153
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjCCVhh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbjCCVhg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7062B62D8A
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5p-0008Ux-8d; Fri, 03 Mar 2023 22:37:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5o-001eAD-GZ; Fri, 03 Mar 2023 22:37:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001wxG-OK; Fri, 03 Mar 2023 22:37:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 03/34] watchdog: advantechwdt: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:45 +0100
Message-Id: <20230303213716.2123717-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=H4BXHHkhLbqRbC62pRYTELNAroaWXfz0bieKzM3Xji0=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQwZUgyTFWYE3AoNbyH04jBcGJA1dXl0Z93XeZWEnB9s 4DpJdf1TkZjFgZGLgZZMUWWuiItsQkSa/7blSzhhhnEygQ2hYtTACZSEc/BMN1Gj9Fj4dfDEgu+ x3+pU5182NWXNbl5vUtQmkz+jwnhph86ch3TAxxnLGwO+jzhRNwbqTjjAx8XXJTqvC72S2li+DI z/xfap640nOdnKIgrWnyxfP5RrqPCKRa3mNZYpF3+dH/nk0L3RcIRW26wOPI8yMoTnpV+us27NC DR5tMG/VtMkW/+Le3iqq8pyt94s7VKP+pqb0xvuG+1j8YBHu8n9U/FZ56e94GDuUZG43prqFlqp 5yGlkSw2mHmWwd/hvA9Xm1+a0NS0CqnX/wvvnlm+O1755pmrqvQyGZup9RnvUVgrtWtme9s2u0W XDFJfLhDWsxrjd2XXx8ibP0DS4prWL+e9PCT82LRWAgA
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
 drivers/watchdog/advantechwdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/advantechwdt.c b/drivers/watchdog/advantechwdt.c
index 554fe85da50e..7a0acbc3e4dd 100644
--- a/drivers/watchdog/advantechwdt.c
+++ b/drivers/watchdog/advantechwdt.c
@@ -279,14 +279,12 @@ static int __init advwdt_probe(struct platform_device *dev)
 	goto out;
 }
 
-static int advwdt_remove(struct platform_device *dev)
+static void advwdt_remove(struct platform_device *dev)
 {
 	misc_deregister(&advwdt_miscdev);
 	release_region(wdt_start, 1);
 	if (wdt_stop != wdt_start)
 		release_region(wdt_stop, 1);
-
-	return 0;
 }
 
 static void advwdt_shutdown(struct platform_device *dev)
@@ -296,7 +294,7 @@ static void advwdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver advwdt_driver = {
-	.remove		= advwdt_remove,
+	.remove_new	= advwdt_remove,
 	.shutdown	= advwdt_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
-- 
2.39.1

