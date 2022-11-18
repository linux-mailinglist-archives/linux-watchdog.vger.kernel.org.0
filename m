Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74CF063032B
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Nov 2022 00:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbiKRXYv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Nov 2022 18:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235462AbiKRXXX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Nov 2022 18:23:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9076F56D41
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Nov 2022 15:13:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9n-0005Ro-49; Fri, 18 Nov 2022 23:48:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9i-0058tW-Nt; Fri, 18 Nov 2022 23:48:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9i-0000VY-Ju; Fri, 18 Nov 2022 23:48:18 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 596/606] watchdog: ziirave_wdt: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:45:30 +0100
Message-Id: <20221118224540.619276-597-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/ziirave_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index d0e88875443a..21ca08a694ee 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -593,8 +593,7 @@ static int ziirave_wdt_init_duration(struct i2c_client *client)
 					 reset_duration);
 }
 
-static int ziirave_wdt_probe(struct i2c_client *client,
-			     const struct i2c_device_id *id)
+static int ziirave_wdt_probe(struct i2c_client *client)
 {
 	int ret;
 	struct ziirave_wdt_data *w_priv;
@@ -732,7 +731,7 @@ static struct i2c_driver ziirave_wdt_driver = {
 		.name = "ziirave_wdt",
 		.of_match_table = zrv_wdt_of_match,
 	},
-	.probe = ziirave_wdt_probe,
+	.probe_new = ziirave_wdt_probe,
 	.remove = ziirave_wdt_remove,
 	.id_table = ziirave_wdt_id,
 };
-- 
2.38.1

