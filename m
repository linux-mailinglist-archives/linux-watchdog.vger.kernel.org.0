Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7127A17BF1E
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 14:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgCFNiF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 08:38:05 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37306 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgCFNiF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 08:38:05 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E508B8030705;
        Fri,  6 Mar 2020 13:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SB3i3KTZAyDK; Fri,  6 Mar 2020 16:28:29 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/7] watchdog: dw_wdt: Support devices with non-fixed TOP values
Date:   Fri, 6 Mar 2020 16:27:44 +0300
In-Reply-To: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132829.E508B8030705@mail.baikalelectronics.ru>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

In case if the DW Watchdog IP core is synthesised with
WDT_USE_FIX_TOP == false, the TOP interval indexes make the device
to load a custom periods to the counter. These periods are hardwired
at the synthesis stage and can be within [2^8, 2^(WDT_CNT_WIDTH - 1)].
Alas their values can't be detected at runtime and must be somehow
supplied to the driver so one could properly determine the watchdog
timeout intervals. For this purpose we suggest to have a vendor-
specific dts property "snps,watchdog-tops" utilized, which would
provide an array of sixteen counter values. At device probe stage they
will be used to initialize the watchdog device timeouts determined
from the array values and current clocks source rate.

In order to have custom TOP values supported the driver must be
altered in the following way. First of all the fixed-top values
ready-to-use array must be determined for compatibility with currently
supported devices, which were synthesised with WDT_USE_FIX_TOP == true.
Secondly we must redefine the timer period search functions. For
generality they are redesigned in a way to support the TOP array with
no limitations on the items order or value. Finally an array with
pre-defined timeouts must be calculated at probe stage from either
the custom or fixed TOP values depending on the DW watchdog component
parameter WDT_USE_FIX_TOP value.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 drivers/watchdog/dw_wdt.c | 145 +++++++++++++++++++++++++++++++-------
 1 file changed, 119 insertions(+), 26 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index fba21de2bbad..4a57b7d777dc 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/limits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -34,12 +35,24 @@
 #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
 #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
 #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
+#define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
+#define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
 
-/* The maximum TOP (timeout period) value that can be set in the watchdog. */
-#define DW_WDT_MAX_TOP		15
+/* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
+#define DW_WDT_NUM_TOPS		16
+#define DW_WDT_FIX_TOP(_idx)	(1U << (16 + _idx))
 
 #define DW_WDT_DEFAULT_SECONDS	30
 
+static const u32 dw_wdt_fix_tops[DW_WDT_NUM_TOPS] = {
+	DW_WDT_FIX_TOP(0), DW_WDT_FIX_TOP(1), DW_WDT_FIX_TOP(2),
+	DW_WDT_FIX_TOP(3), DW_WDT_FIX_TOP(4), DW_WDT_FIX_TOP(5),
+	DW_WDT_FIX_TOP(6), DW_WDT_FIX_TOP(7), DW_WDT_FIX_TOP(8),
+	DW_WDT_FIX_TOP(9), DW_WDT_FIX_TOP(10), DW_WDT_FIX_TOP(11),
+	DW_WDT_FIX_TOP(12), DW_WDT_FIX_TOP(13), DW_WDT_FIX_TOP(14),
+	DW_WDT_FIX_TOP(15)
+};
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
@@ -49,6 +62,8 @@ struct dw_wdt {
 	void __iomem		*regs;
 	struct clk		*clk;
 	unsigned long		rate;
+	unsigned int		max_top;
+	unsigned int		timeouts[DW_WDT_NUM_TOPS];
 	struct watchdog_device	wdd;
 	struct reset_control	*rst;
 	/* Save/restore */
@@ -64,20 +79,68 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
 		WDOG_CONTROL_REG_WDT_EN_MASK;
 }
 
-static inline int dw_wdt_top_in_seconds(struct dw_wdt *dw_wdt, unsigned top)
+static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
+					 unsigned int timeout, u32 *top)
 {
+	u32 diff = UINT_MAX, tmp;
+	int idx;
+
 	/*
-	 * There are 16 possible timeout values in 0..15 where the number of
-	 * cycles is 2 ^ (16 + i) and the watchdog counts down.
+	 * In general case of non-fixed timeout values they can be arranged in
+	 * any order so we have to traverse all the array values. We also try
+	 * to find a closest timeout number and make sure its value is greater
+	 * than the requested timeout. Note we'll return a maximum timeout
+	 * if reachable value couldn't be found.
 	 */
-	return (1U << (16 + top)) / dw_wdt->rate;
+	for (*top = dw_wdt->max_top, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
+		if (dw_wdt->timeouts[idx] < timeout)
+			continue;
+
+		tmp = dw_wdt->timeouts[idx] - timeout;
+		if (tmp < diff) {
+			diff = tmp;
+			*top = idx;
+		}
+	}
+
+	return dw_wdt->timeouts[*top];
+}
+
+static unsigned int dw_wdt_find_min_timeout(struct dw_wdt *dw_wdt)
+{
+	u32 min_timeout = UINT_MAX, top;
+	int idx;
+
+	for (top = 0, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
+		if (dw_wdt->timeouts[idx] <= min_timeout) {
+			min_timeout = dw_wdt->timeouts[idx];
+			top = idx;
+		}
+	}
+
+	return dw_wdt->timeouts[top];
+}
+
+static unsigned int dw_wdt_find_max_top(struct dw_wdt *dw_wdt, u32 *top)
+{
+	u32 max_timeout = 0;
+	int idx;
+
+	for (*top = 0, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
+		if (dw_wdt->timeouts[idx] >= max_timeout) {
+			max_timeout = dw_wdt->timeouts[idx];
+			*top = idx;
+		}
+	}
+
+	return dw_wdt->timeouts[*top];
 }
 
-static int dw_wdt_get_top(struct dw_wdt *dw_wdt)
+static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
 {
 	int top = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
 
-	return dw_wdt_top_in_seconds(dw_wdt, top);
+	return dw_wdt->timeouts[top];
 }
 
 static int dw_wdt_ping(struct watchdog_device *wdd)
@@ -90,20 +153,13 @@ static int dw_wdt_ping(struct watchdog_device *wdd)
 	return 0;
 }
 
-static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
+static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
 {
 	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
-	int i, top_val = DW_WDT_MAX_TOP;
+	unsigned int timeout;
+	u32 top;
 
-	/*
-	 * Iterate over the timeout values until we find the closest match. We
-	 * always look for >=.
-	 */
-	for (i = 0; i <= DW_WDT_MAX_TOP; ++i)
-		if (dw_wdt_top_in_seconds(dw_wdt, i) >= top_s) {
-			top_val = i;
-			break;
-		}
+	timeout = dw_wdt_find_best_top(dw_wdt, req * MSEC_PER_SEC, &top);
 
 	/*
 	 * Set the new value in the watchdog.  Some versions of dw_wdt
@@ -111,7 +167,7 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
 	 * CP_WDT_DUAL_TOP in WDT_COMP_PARAMS_1).  On those we
 	 * effectively get a pat of the watchdog right here.
 	 */
-	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
+	writel(top | top << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
 	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
 	/*
@@ -119,10 +175,10 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
 	 * kernel(watchdog_dev.c) helps to feed watchdog before
 	 * wdd->max_hw_heartbeat_ms
 	 */
-	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
-		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
+	if (req * MSEC_PER_SEC > wdd->max_hw_heartbeat_ms)
+		wdd->timeout = req;
 	else
-		wdd->timeout = top_s;
+		wdd->timeout = timeout / MSEC_PER_SEC;
 
 	return 0;
 }
@@ -238,6 +294,41 @@ static int dw_wdt_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
 
+static void dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
+{
+	u32 data, of_tops[DW_WDT_NUM_TOPS];
+	const u32 *tops;
+	int ret, idx;
+
+	/*
+	 * Retrieve custom or fixed counter values depending on the
+	 * WDT_USE_FIX_TOP flag found in the component specific parameters
+	 * #1 register.
+	 */
+	data = readl(dw_wdt->regs + WDOG_COMP_PARAMS_1_REG_OFFSET);
+	if (data & WDOG_COMP_PARAMS_1_USE_FIX_TOP) {
+		tops = dw_wdt_fix_tops;
+	} else {
+		ret = of_property_read_variable_u32_array(dev_of_node(dev),
+			"snps,watchdog-tops", of_tops, DW_WDT_NUM_TOPS,
+			DW_WDT_NUM_TOPS);
+		if (ret < 0) {
+			dev_warn(dev, "No valid TOPs array specified\n");
+			tops = dw_wdt_fix_tops;
+		} else {
+			tops = of_tops;
+		}
+	}
+
+	/*
+	 * We'll keep the timeout values in ms to approximate requested
+	 * timeouts with better accuracy.
+	 */
+	for (idx = 0; idx < DW_WDT_NUM_TOPS; ++idx)
+		dw_wdt->timeouts[idx] =
+			mult_frac(tops[idx], MSEC_PER_SEC, dw_wdt->rate);
+}
+
 static int dw_wdt_drv_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -275,12 +366,14 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 	reset_control_deassert(dw_wdt->rst);
 
+	dw_wdt_init_timeouts(dw_wdt, dev);
+
 	wdd = &dw_wdt->wdd;
 	wdd->info = &dw_wdt_ident;
 	wdd->ops = &dw_wdt_ops;
-	wdd->min_timeout = 1;
+	wdd->min_timeout = dw_wdt_find_min_timeout(dw_wdt) / MSEC_PER_SEC;
 	wdd->max_hw_heartbeat_ms =
-		dw_wdt_top_in_seconds(dw_wdt, DW_WDT_MAX_TOP) * 1000;
+		dw_wdt_find_max_top(dw_wdt, &dw_wdt->max_top);
 	wdd->parent = dev;
 
 	watchdog_set_drvdata(wdd, dw_wdt);
@@ -293,7 +386,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	 * devicetree.
 	 */
 	if (dw_wdt_is_enabled(dw_wdt)) {
-		wdd->timeout = dw_wdt_get_top(dw_wdt);
+		wdd->timeout = dw_wdt_get_timeout(dw_wdt) / MSEC_PER_SEC;
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	} else {
 		wdd->timeout = DW_WDT_DEFAULT_SECONDS;
-- 
2.25.1

