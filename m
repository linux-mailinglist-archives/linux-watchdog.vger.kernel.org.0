Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15C12DF0B4
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Dec 2020 18:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgLSRfL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 19 Dec 2020 12:35:11 -0500
Received: from www.zeus03.de ([194.117.254.33]:38720 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbgLSRfK (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 19 Dec 2020 12:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=+CbbITCo4sjydHD9xFe8UNyiRYF
        yWeWXAToXzvmfr6Q=; b=XdTM9lzev+ho5RQVJqaM5S6igsEuIjdiW/roKKjJzS8
        eIBws6EY27MQ2NoVL+/pEpLtLvE7MP49E8b7EU0NhBOcrz+EEqFfNa/UudGxff3e
        jdyhvNwmmrkaupvll8j9YpqYd7YCFuq2fMfdx1GNOn3LlVQxee23zSi3Zv27Fz3w
        =
Received: (qmail 4185329 invoked from network); 19 Dec 2020 18:34:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2020 18:34:28 +0100
X-UD-Smtp-Session: l3s3148p1@pOUPo9S2EqEgAwDPXyWnAP8QpIJSuVO+
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] watchdog: renesas_wdt: don't sleep in atomic context
Date:   Sat, 19 Dec 2020 18:34:15 +0100
Message-Id: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In the restart handler, we hit multiple OOPSes. One because of
usleep_range() and one because of RPM. So, instead of re-using
rwdt_start(), we implement an atomic version of it in the restart
handler. As a little bonus, reboot will occur sooner because we can now
use the smallest divider in the custom restart routine.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

It is problematic to add a Fixes: tag because we would need three of
them. So, I'd think we add a stable tag and as long as the patch
applies, all is fine. Other opinions?

 drivers/watchdog/renesas_wdt.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 47fce4de0110..d2b5074bca65 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -50,6 +51,7 @@ struct rwdt_priv {
 	struct watchdog_device wdev;
 	unsigned long clk_rate;
 	u8 cks;
+	struct clk *clk;
 };
 
 static void rwdt_write(struct rwdt_priv *priv, u32 val, unsigned int reg)
@@ -125,13 +127,30 @@ static unsigned int rwdt_get_timeleft(struct watchdog_device *wdev)
 	return DIV_BY_CLKS_PER_SEC(priv, 65536 - val);
 }
 
+/* needs to be atomic - no RPM, no usleep_range, no scheduling! */
 static int rwdt_restart(struct watchdog_device *wdev, unsigned long action,
 			void *data)
 {
 	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
+	u8 val;
+
+	clk_prepare_enable(priv->clk);
+
+	/* Stop the timer before we modify any register */
+	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
+	rwdt_write(priv, val, RWTCSRA);
+	/* Delay 2 cycles before setting watchdog counter */
+	udelay(DIV_ROUND_UP(2 * 1000000, priv->clk_rate));
 
-	rwdt_start(wdev);
 	rwdt_write(priv, 0xffff, RWTCNT);
+	/* smallest divider to reboot soon */
+	rwdt_write(priv, 0, RWTCSRA);
+
+	readb_poll_timeout_atomic(priv->base + RWTCSRA, val,
+				  !(val & RWTCSRA_WRFLG), 1, 100);
+
+	rwdt_write(priv, RWTCSRA_TME, RWTCSRA);
+
 	return 0;
 }
 
@@ -191,7 +210,6 @@ static int rwdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rwdt_priv *priv;
-	struct clk *clk;
 	unsigned long clks_per_sec;
 	int ret, i;
 	u8 csra;
@@ -207,13 +225,13 @@ static int rwdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-	priv->clk_rate = clk_get_rate(clk);
+	priv->clk_rate = clk_get_rate(priv->clk);
 	csra = readb_relaxed(priv->base + RWTCSRA);
 	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
 	pm_runtime_put(dev);
-- 
2.29.2

