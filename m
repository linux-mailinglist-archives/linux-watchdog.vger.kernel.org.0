Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDBBA23179A
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 04:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731099AbgG2CYs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 22:24:48 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47326 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730901AbgG2CYr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 22:24:47 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DAA71200100;
        Wed, 29 Jul 2020 04:24:44 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 90D1E200D82;
        Wed, 29 Jul 2020 04:24:40 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3B70B402DF;
        Wed, 29 Jul 2020 04:24:35 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence for wdog operations
Date:   Wed, 29 Jul 2020 10:20:26 +0800
Message-Id: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

According to reference manual, the i.MX7ULP WDOG's operations should
follow below sequence:

1. disable global interrupts;
2. unlock the wdog and wait unlock bit set;
3. reconfigure the wdog and wait for reconfiguration bit set;
4. enabel global interrupts.

Strictly follow the recommended sequence can make it more robust.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- use readl_poll_timeout_atomic() instead of usleep_ranges() since IRQ is disabled.
---
 drivers/watchdog/imx7ulp_wdt.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 7993c8c..7d2b12e 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -36,6 +37,7 @@
 #define DEFAULT_TIMEOUT	60
 #define MAX_TIMEOUT	128
 #define WDOG_CLOCK_RATE	1000
+#define WDOG_WAIT_TIMEOUT	10000
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0000);
@@ -48,17 +50,31 @@ struct imx7ulp_wdt_device {
 	struct clk *clk;
 };
 
+static inline void imx7ulp_wdt_wait(void __iomem *base, u32 mask)
+{
+	u32 val = readl(base + WDOG_CS);
+
+	if (!(val & mask))
+		WARN_ON(readl_poll_timeout_atomic(base + WDOG_CS, val,
+						  val & mask, 0,
+						  WDOG_WAIT_TIMEOUT));
+}
+
 static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 
 	u32 val = readl(wdt->base + WDOG_CS);
 
+	local_irq_disable();
 	writel(UNLOCK, wdt->base + WDOG_CNT);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
 	if (enable)
 		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
 	else
 		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
+	local_irq_enable();
 }
 
 static bool imx7ulp_wdt_is_enabled(void __iomem *base)
@@ -72,7 +88,12 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 
+	local_irq_disable();
+	writel(UNLOCK, wdt->base + WDOG_CNT);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
 	writel(REFRESH, wdt->base + WDOG_CNT);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
+	local_irq_enable();
 
 	return 0;
 }
@@ -98,8 +119,12 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 	u32 val = WDOG_CLOCK_RATE * timeout;
 
+	local_irq_disable();
 	writel(UNLOCK, wdt->base + WDOG_CNT);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
 	writel(val, wdt->base + WDOG_TOVAL);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
+	local_irq_enable();
 
 	wdog->timeout = timeout;
 
@@ -140,15 +165,19 @@ static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
 {
 	u32 val;
 
+	local_irq_disable();
 	/* unlock the wdog for reconfiguration */
 	writel_relaxed(UNLOCK_SEQ0, base + WDOG_CNT);
 	writel_relaxed(UNLOCK_SEQ1, base + WDOG_CNT);
+	imx7ulp_wdt_wait(base, WDOG_CS_ULK);
 
 	/* set an initial timeout value in TOVAL */
 	writel(timeout, base + WDOG_TOVAL);
 	/* enable 32bit command sequence and reconfigure */
 	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
 	writel(val, base + WDOG_CS);
+	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
+	local_irq_enable();
 }
 
 static void imx7ulp_wdt_action(void *data)
-- 
2.7.4

