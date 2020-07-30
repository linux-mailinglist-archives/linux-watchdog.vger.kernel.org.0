Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B612329C7
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 04:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgG3CHd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 22:07:33 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57312 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgG3CHd (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 22:07:33 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1AB8320114A;
        Thu, 30 Jul 2020 04:07:31 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CEFA6201144;
        Thu, 30 Jul 2020 04:07:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 78DA040302;
        Thu, 30 Jul 2020 04:07:21 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 1/2] watchdog: imx7ulp: Strictly follow the sequence for wdog operations
Date:   Thu, 30 Jul 2020 10:03:10 +0800
Message-Id: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

According to reference manual, the i.MX7ULP WDOG's operations except
refresh should follow below sequence:

1. disable global interrupts;
2. unlock the wdog and wait unlock bit set;
3. reconfigure the wdog and wait for reconfiguration bit set;
4. enabel global interrupts.

Strictly follow the recommended sequence can make it more robust.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V2:
	- change the wait timeout to 20us according to experiment;
	- drop WARN_ON when timeout, and check its return value in each caller for
	  unlock wait, no need to handle the return value for reconfiguration.
---
 drivers/watchdog/imx7ulp_wdt.c | 74 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 7993c8c..010ddd1 100644
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
+#define WDOG_WAIT_TIMEOUT	20
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0000);
@@ -48,17 +50,40 @@ struct imx7ulp_wdt_device {
 	struct clk *clk;
 };
 
-static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
+static int imx7ulp_wdt_wait(void __iomem *base, u32 mask)
+{
+	u32 val = readl(base + WDOG_CS);
+
+	if (!(val & mask) && readl_poll_timeout_atomic(base + WDOG_CS, val,
+						       val & mask, 0,
+						       WDOG_WAIT_TIMEOUT))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 
 	u32 val = readl(wdt->base + WDOG_CS);
+	int ret;
 
+	local_irq_disable();
 	writel(UNLOCK, wdt->base + WDOG_CNT);
+	ret = imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
+	if (ret)
+		goto enable_out;
 	if (enable)
 		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
 	else
 		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
+
+enable_out:
+	local_irq_enable();
+
+	return ret;
 }
 
 static bool imx7ulp_wdt_is_enabled(void __iomem *base)
@@ -79,17 +104,12 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
 
 static int imx7ulp_wdt_start(struct watchdog_device *wdog)
 {
-
-	imx7ulp_wdt_enable(wdog, true);
-
-	return 0;
+	return imx7ulp_wdt_enable(wdog, true);
 }
 
 static int imx7ulp_wdt_stop(struct watchdog_device *wdog)
 {
-	imx7ulp_wdt_enable(wdog, false);
-
-	return 0;
+	return imx7ulp_wdt_enable(wdog, false);
 }
 
 static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
@@ -97,22 +117,37 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 	u32 val = WDOG_CLOCK_RATE * timeout;
+	int ret;
 
+	local_irq_disable();
 	writel(UNLOCK, wdt->base + WDOG_CNT);
+	ret = imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
+	if (ret)
+		goto timeout_out;
 	writel(val, wdt->base + WDOG_TOVAL);
+	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
+
+timeout_out:
+	local_irq_enable();
 
 	wdog->timeout = timeout;
 
-	return 0;
+	return ret;
 }
 
 static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
 			       unsigned long action, void *data)
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
+	int ret;
+
+	ret = imx7ulp_wdt_enable(wdog, true);
+	if (ret)
+		return ret;
 
-	imx7ulp_wdt_enable(wdog, true);
-	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
+	ret = imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
+	if (ret)
+		return ret;
 
 	/* wait for wdog to fire */
 	while (true)
@@ -136,19 +171,30 @@ static const struct watchdog_info imx7ulp_wdt_info = {
 		    WDIOF_MAGICCLOSE,
 };
 
-static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
+static int imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
 {
 	u32 val;
+	int ret;
 
+	local_irq_disable();
 	/* unlock the wdog for reconfiguration */
 	writel_relaxed(UNLOCK_SEQ0, base + WDOG_CNT);
 	writel_relaxed(UNLOCK_SEQ1, base + WDOG_CNT);
+	ret = imx7ulp_wdt_wait(base, WDOG_CS_ULK);
+	if (ret)
+		goto init_out;
 
 	/* set an initial timeout value in TOVAL */
 	writel(timeout, base + WDOG_TOVAL);
 	/* enable 32bit command sequence and reconfigure */
 	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
 	writel(val, base + WDOG_CS);
+	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
+
+init_out:
+	local_irq_enable();
+
+	return ret;
 }
 
 static void imx7ulp_wdt_action(void *data)
@@ -199,7 +245,9 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 	watchdog_set_drvdata(wdog, imx7ulp_wdt);
-	imx7ulp_wdt_init(imx7ulp_wdt->base, wdog->timeout * WDOG_CLOCK_RATE);
+	ret = imx7ulp_wdt_init(imx7ulp_wdt->base, wdog->timeout * WDOG_CLOCK_RATE);
+	if (ret)
+		return ret;
 
 	return devm_watchdog_register_device(dev, wdog);
 }
-- 
2.7.4

