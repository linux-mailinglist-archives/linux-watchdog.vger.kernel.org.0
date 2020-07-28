Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649FE23033C
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jul 2020 08:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgG1GrG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 02:47:06 -0400
Received: from inva020.nxp.com ([92.121.34.13]:43154 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgG1GrF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 02:47:05 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C4411A0D52;
        Tue, 28 Jul 2020 08:47:03 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 33B4F1A0045;
        Tue, 28 Jul 2020 08:46:59 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C21AB402F3;
        Tue, 28 Jul 2020 08:46:53 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/2] watchdog: imx7ulp: Strictly follow the sequence for wdog operations
Date:   Tue, 28 Jul 2020 14:42:46 +0800
Message-Id: <1595918567-2017-1-git-send-email-Anson.Huang@nxp.com>
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
 drivers/watchdog/imx7ulp_wdt.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 7993c8c..b414ecf 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -48,17 +49,32 @@ struct imx7ulp_wdt_device {
 	struct clk *clk;
 };
 
+static inline void imx7ulp_wdt_wait(void __iomem *base, u32 mask)
+{
+	int retries = 100;
+
+	do {
+		if (readl_relaxed(base + WDOG_CS) & mask)
+			return;
+		usleep_range(200, 1000);
+	} while (retries--);
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

