Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EBA7E28FD
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 16:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjKFPsp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 10:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjKFPso (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 10:48:44 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2267107
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 07:48:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qB-0007h9-Ju; Mon, 06 Nov 2023 16:48:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-0074pO-RQ; Mon, 06 Nov 2023 16:48:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r01qA-00Dn7s-IA; Mon, 06 Nov 2023 16:48:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 2/5] watchdog: txx9: Stop using module_platform_driver_probe()
Date:   Mon,  6 Nov 2023 16:48:10 +0100
Message-ID: <20231106154807.3866712-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Kz0fRs6Kvl4uYaSittIqsKRgAcv2hRtW689WI81wO08=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSQq6ptl/HF7aDDKiZ+IYulAfXPSV2Z2EIkpBW HWwch1IF4iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkKugAKCRCPgPtYfRL+ TqdpCACf4KSWthH8R50+QUU5LJalugRsnD1MUifGJV8ekW4wGLtyFs3yWlFaArkjG/+ueronsb7 pEkhgjhqv9j1IJNqO75Yb6efSWc53U3e3D5f39DFrlMj8TMISpuK/Kzkp8vIhrClD1BseUH9FpW dnJceGeOPuhzY8FbuPb91OvC3Ve0BHDBMLPQZLwlmeAZW/IME/pLp5MNM0of+sXu1KoDsra4/OF SDzR/CZpkk43DwpQoccLalRAjmyKC0jNDsf3OdxaJDjBoHl37UOL4fpE4ZOzo8w5YaRDuzrMsBo +/jwAtOBcixQws0E5JxzptBdN7NeHlOl6wrvINiSdIpNd7zE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On today's platforms the benefit of platform_driver_probe() isn't that
relevant any more. It allows to drop some code after booting (or module
loading) for .probe() and discard the .remove() function completely if
the driver is built-in. This typically saves a few 100k.

The downside of platform_driver_probe() is that the driver cannot be
bound and unbound at runtime which is ancient and also slightly
complicates testing. There are also thoughts to deprecate
platform_driver_probe() because it adds some complexity in the driver
core for little gain. Also many drivers don't use it correctly. This
driver for example misses to mark the driver struct with __refdata which
is needed to suppress a (W=1) modpost warning:

	WARNING: modpost: drivers/watchdog/txx9wdt: section mismatch in reference: txx9wdt_driver+0x4 (section: .data) -> txx9wdt_remove (section: .exit.text)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/txx9wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/txx9wdt.c b/drivers/watchdog/txx9wdt.c
index 89a54b6645bd..f900c519ed63 100644
--- a/drivers/watchdog/txx9wdt.c
+++ b/drivers/watchdog/txx9wdt.c
@@ -98,7 +98,7 @@ static struct watchdog_device txx9wdt = {
 	.ops = &txx9wdt_ops,
 };
 
-static int __init txx9wdt_probe(struct platform_device *dev)
+static int txx9wdt_probe(struct platform_device *dev)
 {
 	int ret;
 
@@ -145,7 +145,7 @@ static int __init txx9wdt_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int __exit txx9wdt_remove(struct platform_device *dev)
+static int txx9wdt_remove(struct platform_device *dev)
 {
 	watchdog_unregister_device(&txx9wdt);
 	clk_disable_unprepare(txx9_imclk);
@@ -159,14 +159,14 @@ static void txx9wdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver txx9wdt_driver = {
-	.remove = __exit_p(txx9wdt_remove),
+	.probe = txx9wdt_probe,
+	.remove = txx9wdt_remove,
 	.shutdown = txx9wdt_shutdown,
 	.driver = {
 		.name = "txx9wdt",
 	},
 };
-
-module_platform_driver_probe(txx9wdt_driver, txx9wdt_probe);
+module_platform_driver(txx9wdt_driver);
 
 MODULE_DESCRIPTION("TXx9 Watchdog Driver");
 MODULE_LICENSE("GPL");
-- 
2.42.0

