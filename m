Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FFE40262E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 11:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhIGJ2n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 05:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhIGJ2m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 05:28:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE64C061575
        for <linux-watchdog@vger.kernel.org>; Tue,  7 Sep 2021 02:27:36 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mNXOA-0007ug-4Y; Tue, 07 Sep 2021 11:27:34 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: mlx-wdt: Use regmap_write_bits()
Date:   Tue,  7 Sep 2021 11:27:32 +0200
Message-Id: <20210907092732.31815-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the regmap_write_bits() macro instead of regmap_update_bits_base().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/watchdog/mlx_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
index 54193369e85c..9c5b6616fc87 100644
--- a/drivers/watchdog/mlx_wdt.c
+++ b/drivers/watchdog/mlx_wdt.c
@@ -100,9 +100,8 @@ static int mlxreg_wdt_ping(struct watchdog_device *wdd)
 	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
 	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->ping_idx];
 
-	return regmap_update_bits_base(wdt->regmap, reg_data->reg,
-				       ~reg_data->mask, BIT(reg_data->bit),
-				       NULL, false, true);
+	return regmap_write_bits(wdt->regmap, reg_data->reg, ~reg_data->mask,
+				 BIT(reg_data->bit));
 }
 
 static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
-- 
2.30.2

