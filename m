Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA8494BC9
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 19:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfHSReB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 13:34:01 -0400
Received: from sauhun.de ([88.99.104.3]:53846 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbfHSReB (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 13:34:01 -0400
Received: from localhost (p54B3355A.dip0.t-ipconnect.de [84.179.53.90])
        by pokefinder.org (Postfix) with ESMTPSA id 7D3B12C2868;
        Mon, 19 Aug 2019 19:33:59 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] watchdog: renesas_wdt: support handover from bootloader
Date:   Mon, 19 Aug 2019 19:33:46 +0200
Message-Id: <20190819173346.4019-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Support an already running watchdog by checking its enable bit and set
up the status accordingly before registering the device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:

* removed custom code to handle RPM refcnt. The watchdog core does it
  already.

Tested again on a Renesas Salvator-XS (R-Car M3N) with and without the
'open_timeout' command line parameter.

After all these discussions, the patch became quite simple again :/
Still, thanks for all the discussions to make sure we didn't overlook
clock handling.

 drivers/watchdog/renesas_wdt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 00662a8e039c..47fce4de0110 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -194,6 +194,7 @@ static int rwdt_probe(struct platform_device *pdev)
 	struct clk *clk;
 	unsigned long clks_per_sec;
 	int ret, i;
+	u8 csra;
 
 	if (rwdt_blacklisted(dev))
 		return -ENODEV;
@@ -213,8 +214,8 @@ static int rwdt_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 	priv->clk_rate = clk_get_rate(clk);
-	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
-				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
+	csra = readb_relaxed(priv->base + RWTCSRA);
+	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
 	pm_runtime_put(dev);
 
 	if (!priv->clk_rate) {
@@ -252,6 +253,13 @@ static int rwdt_probe(struct platform_device *pdev)
 	/* This overrides the default timeout only if DT configuration was found */
 	watchdog_init_timeout(&priv->wdev, 0, dev);
 
+	/* Check if FW enabled the watchdog */
+	if (csra & RWTCSRA_TME) {
+		/* Ensure properly initialized dividers */
+		rwdt_start(&priv->wdev);
+		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
+	}
+
 	ret = watchdog_register_device(&priv->wdev);
 	if (ret < 0)
 		goto out_pm_disable;
-- 
2.20.1

