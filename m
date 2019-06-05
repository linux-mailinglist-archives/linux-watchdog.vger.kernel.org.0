Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A24835623
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 07:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFEFI7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 01:08:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:32227 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726056AbfFEFI7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 01:08:59 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17851309"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2019 14:08:58 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 374E24187DC1;
        Wed,  5 Jun 2019 14:08:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Date:   Wed,  5 Jun 2019 14:04:00 +0900
Message-Id: <1559711040-29779-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

According to the hardware manual of R-Car Gen2 and Gen3,
software should wait a few RLCK cycles as following:
 - Delay 2 cycles before setting watchdog counter.
 - Delay 3 cycles before disabling module clock.

So, this patch adds such delays.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Changes from v2 (https://patchwork.kernel.org/patch/10972721/):
 - Rename the wait function name.
 - Rename the variable name in the wait function.
 - Change variable type.
 - Add Wolfram-san and Niklas-san's Reviewed-by.

 Changes from v1 (https://patchwork.kernel.org/patch/10972641/):
 - Change formula to improve accuracy.
 - Add Geert-san's Reviewed-by.

 drivers/watchdog/renesas_wdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 565dbc1..0cfc0e9 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -7,6 +7,7 @@
  */
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -70,6 +71,15 @@ static int rwdt_init_timeout(struct watchdog_device *wdev)
 	return 0;
 }
 
+static void rwdt_wait_cycles(struct rwdt_priv *priv, unsigned int cycles)
+{
+	unsigned int delay;
+
+	delay = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
+
+	usleep_range(delay, 2 * delay);
+}
+
 static int rwdt_start(struct watchdog_device *wdev)
 {
 	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
@@ -80,6 +90,8 @@ static int rwdt_start(struct watchdog_device *wdev)
 	/* Stop the timer before we modify any register */
 	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
 	rwdt_write(priv, val, RWTCSRA);
+	/* Delay 2 cycles before setting watchdog counter */
+	rwdt_wait_cycles(priv, 2);
 
 	rwdt_init_timeout(wdev);
 	rwdt_write(priv, priv->cks, RWTCSRA);
@@ -98,6 +110,8 @@ static int rwdt_stop(struct watchdog_device *wdev)
 	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	rwdt_write(priv, priv->cks, RWTCSRA);
+	/* Delay 3 cycles before disabling module clock */
+	rwdt_wait_cycles(priv, 3);
 	pm_runtime_put(wdev->parent);
 
 	return 0;
-- 
2.7.4

