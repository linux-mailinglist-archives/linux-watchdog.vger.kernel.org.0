Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7836B9188B
	for <lists+linux-watchdog@lfdr.de>; Sun, 18 Aug 2019 20:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfHRSAW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 18 Aug 2019 14:00:22 -0400
Received: from sauhun.de ([88.99.104.3]:41704 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfHRSAW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 18 Aug 2019 14:00:22 -0400
Received: from localhost (p5486CD86.dip0.t-ipconnect.de [84.134.205.134])
        by pokefinder.org (Postfix) with ESMTPSA id 2E1942C2356;
        Sun, 18 Aug 2019 20:00:19 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] watchdog: renesas_wdt: support handover from bootloader
Date:   Sun, 18 Aug 2019 20:00:07 +0200
Message-Id: <20190818180007.2258-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Support an already running watchdog by checking its enable bit and set
up the status accordingly before registering the device. Introduce a new
flag to remember all this to keep RPM calls balanced.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC:

* Geert ensured that the module clock for the RWDT will stay active
  during the boot process because clock will only be stopped at the end
  of init if there is no refcnt for this clk.

* So, we make sure to have a refcnt when FW enabled the wdog. Once the
  first call to open comes, we "transfer" the refcnt to that call.
  (Is that the correct behaviour? I think it is a tad better than to
   place the balancing RPM call in remove, but I am open here)

* Tested with "open_timeout" kernel parameter. System can now reboot
  if userspace hasn't taken over the watchdog with <n> seconds.


 drivers/watchdog/renesas_wdt.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 00662a8e039c..11cef69f329b 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -50,6 +50,7 @@ struct rwdt_priv {
 	struct watchdog_device wdev;
 	unsigned long clk_rate;
 	u8 cks;
+	bool started_by_fw;
 };
 
 static void rwdt_write(struct rwdt_priv *priv, u32 val, unsigned int reg)
@@ -85,7 +86,11 @@ static int rwdt_start(struct watchdog_device *wdev)
 	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
 	u8 val;
 
-	pm_runtime_get_sync(wdev->parent);
+	if (priv->started_by_fw)
+		/* we already called this function and RPM is active */
+		priv->started_by_fw = false;
+	else
+		pm_runtime_get_sync(wdev->parent);
 
 	/* Stop the timer before we modify any register */
 	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
@@ -194,6 +199,7 @@ static int rwdt_probe(struct platform_device *pdev)
 	struct clk *clk;
 	unsigned long clks_per_sec;
 	int ret, i;
+	u8 csra;
 
 	if (rwdt_blacklisted(dev))
 		return -ENODEV;
@@ -213,8 +219,8 @@ static int rwdt_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 	priv->clk_rate = clk_get_rate(clk);
-	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
-				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
+	csra = readb_relaxed(priv->base + RWTCSRA);
+	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
 	pm_runtime_put(dev);
 
 	if (!priv->clk_rate) {
@@ -252,6 +258,14 @@ static int rwdt_probe(struct platform_device *pdev)
 	/* This overrides the default timeout only if DT configuration was found */
 	watchdog_init_timeout(&priv->wdev, 0, dev);
 
+	/* Check if FW enabled the watchdog */
+	if (csra & RWTCSRA_TME) {
+		/* Ensure properly initialized dividers */
+		rwdt_start(&priv->wdev);
+		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
+		priv->started_by_fw = true;
+	}
+
 	ret = watchdog_register_device(&priv->wdev);
 	if (ret < 0)
 		goto out_pm_disable;
-- 
2.20.1

