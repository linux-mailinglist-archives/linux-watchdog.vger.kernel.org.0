Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F3632DCB
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Jun 2019 12:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfFCKlA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Jun 2019 06:41:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:7357 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726520AbfFCKlA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Jun 2019 06:41:00 -0400
X-IronPort-AV: E=Sophos;i="5.60,546,1549897200"; 
   d="scan'208";a="17684991"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jun 2019 19:40:57 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6A8E7424C191;
        Mon,  3 Jun 2019 19:40:57 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Date:   Mon,  3 Jun 2019 19:36:01 +0900
Message-Id: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
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
---
 Changes from v1 (https://patchwork.kernel.org/patch/10972641/):
 - Change formula to improve accuracy.
 - Add Geert-san's Reviewed-by.

 drivers/watchdog/renesas_wdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 565dbc1..525a1fe 100644
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
 
+static void rwdt_wait(struct rwdt_priv *priv, unsigned int cycles)
+{
+	unsigned long delays;
+
+	delays = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
+
+	usleep_range(delays, 2 * delays);
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
+	rwdt_wait(priv, 2);
 
 	rwdt_init_timeout(wdev);
 	rwdt_write(priv, priv->cks, RWTCSRA);
@@ -98,6 +110,8 @@ static int rwdt_stop(struct watchdog_device *wdev)
 	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	rwdt_write(priv, priv->cks, RWTCSRA);
+	/* Delay 3 cycles before disabling module clock */
+	rwdt_wait(priv, 3);
 	pm_runtime_put(wdev->parent);
 
 	return 0;
-- 
2.7.4

