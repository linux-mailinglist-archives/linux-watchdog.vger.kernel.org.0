Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50EA47118CC
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 May 2023 23:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjEYVIo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 May 2023 17:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjEYVIo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 May 2023 17:08:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BA4195
        for <linux-watchdog@vger.kernel.org>; Thu, 25 May 2023 14:08:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2ICO-00010Z-I0; Thu, 25 May 2023 23:08:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2ICN-002oIK-GQ; Thu, 25 May 2023 23:08:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2ICM-007xhd-RG; Thu, 25 May 2023 23:08:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
Date:   Thu, 25 May 2023 23:08:37 +0200
Message-Id: <20230525210837.735447-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+yjCGWECJG0VqqK97wkLss8//Sfex2bqMoQ1k6w84K0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkb85J1DGTrd3Z5HBKlfCP0qDl7TBu/j+mYrTa8 9OGQJVrkoKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG/OSQAKCRCPgPtYfRL+ Til2B/0Xhg0A0h6MTC3nC9krycUFs7rSfaCVU9CYw+VqeYh4j5ZxPmwvAvXvh0yDVgjkqRj2RbJ km0WLAW0u4iQLUTK7U2H7khvAdNw88RUF76kiKFIRTyrfeIdl6jQO2gXmHOfeDSU2duI7oo5i7m djp/DRfEIZHWUDUoieJQtzwswImc8fpiMLX9fvqhGdCNnNm/75AKmCLOZzEMIaHILxhRUDVgyN9 Kf5FVtp462C8mUrMzIFns6UdiftW9zSlU74DEZPdWYq45mquSUUeZ6aa6C8/bcPMZy7wO44x2SU duGRVIiJlR2Y33oxcFvgiCcnugMEl0GFP60BVGiT4z/4GRpq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/ziirave_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 21ca08a694ee..5ed33df68e9a 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -731,7 +731,7 @@ static struct i2c_driver ziirave_wdt_driver = {
 		.name = "ziirave_wdt",
 		.of_match_table = zrv_wdt_of_match,
 	},
-	.probe_new = ziirave_wdt_probe,
+	.probe = ziirave_wdt_probe,
 	.remove = ziirave_wdt_remove,
 	.id_table = ziirave_wdt_id,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

