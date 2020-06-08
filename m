Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703A21F1294
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jun 2020 07:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgFHFv5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jun 2020 01:51:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:42875 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728804AbgFHFv5 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jun 2020 01:51:57 -0400
IronPort-SDR: RomAWwPM3Fpw0sjlV6HRWQ0DKHZX8KZf1HMmIbSVHd5p5rlgdC+X/zrmn41byGLlD19XPbAIiI
 bMOo+PIPs19w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2020 22:51:40 -0700
IronPort-SDR: x23D/Uyio/lhPuI9FDBfZLoJbX0vP8Wq2gUSrJsDkICVqC4ZXgsNJqcVLyvgMfLt2rrlNSI1Ov
 TbRU8Lnm9tmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="379319103"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2020 22:51:37 -0700
From:   Dilip Kota <eswara.kota@linux.intel.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com, Dilip Kota <eswara.kota@linux.intel.com>
Subject: [PATCH 2/2] watchdog: intel: Watchdog timer support on Lightning Mountain
Date:   Mon,  8 Jun 2020 13:49:40 +0800
Message-Id: <220609c6aec3dbd06585897ddcfdde277c823cac.1591584255.git.eswara.kota@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1591584255.git.eswara.kota@linux.intel.com>
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
In-Reply-To: <cover.1591584255.git.eswara.kota@linux.intel.com>
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Intel Lightning Mountain SoC, General Purpose Timer Counter(GPTC)
programmable as clocksource, real time clock or watchdog timer.

This driver configures GPTC as Watchdog timer and triggers reset signal
to CPU on timeout.

Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
---
 drivers/watchdog/Kconfig              |  13 ++
 drivers/watchdog/Makefile             |   1 +
 drivers/watchdog/intel_lgm_gptc_wdt.c | 420 ++++++++++++++++++++++++++++++++++
 3 files changed, 434 insertions(+)
 create mode 100644 drivers/watchdog/intel_lgm_gptc_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0663c604bd642..8009c11e75dda 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1789,6 +1789,19 @@ config IMGPDC_WDT
 	  To compile this driver as a loadable module, choose M here.
 	  The module will be called imgpdc_wdt.
 
+config INTEL_LGM_GPTC_WDT
+	tristate "INTEL LGM SoC Watchdog"
+	depends on X86 || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	select REGMAP
+	select MFD_SYSCON
+	select WATCHDOG_CORE
+	help
+	  Driver for Watchdog Timer on Intel Lightning Mountain SoC.
+
+	  To compile this driver as a loadable module, choose M here.
+	  The module will be called intel_lgm_gptc_wdt.
+
 config LANTIQ_WDT
 	tristate "Lantiq SoC watchdog"
 	depends on LANTIQ
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 6de2e4ceef190..92c99e4c46eb7 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -166,6 +166,7 @@ obj-$(CONFIG_TXX9_WDT) += txx9wdt.o
 obj-$(CONFIG_OCTEON_WDT) += octeon-wdt.o
 octeon-wdt-y := octeon-wdt-main.o octeon-wdt-nmi.o
 obj-$(CONFIG_LANTIQ_WDT) += lantiq_wdt.o
+obj-$(CONFIG_INTEL_LGM_GPTC_WDT) += intel_lgm_gptc_wdt.o
 obj-$(CONFIG_LOONGSON1_WDT) += loongson1_wdt.o
 obj-$(CONFIG_RALINK_WDT) += rt2880_wdt.o
 obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
diff --git a/drivers/watchdog/intel_lgm_gptc_wdt.c b/drivers/watchdog/intel_lgm_gptc_wdt.c
new file mode 100644
index 0000000000000..52be7cc194f8f
--- /dev/null
+++ b/drivers/watchdog/intel_lgm_gptc_wdt.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Intel Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/cpu.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+#define GPTC_CLC		0x00
+#define GPTC_CLC_SUSPEND	BIT(4)
+#define GPTC_CLC_RMC		GENMASK(15, 8)
+
+/* divider 10 to produce 200 / 10 = 20 MHz clock */
+#define CLC_RMC_DIV		10
+
+#define GPTC_CON(X)		(0x10 + (X) * 0x20)
+#define GPTC_CON_CNT_UP		BIT(1)
+#define GPTC_CON_ONESHOT	BIT(3)
+#define GPTC_CON_EXT		BIT(4)
+
+#define GPTC_RUN(X)		(0x18 + (X) * 0x20)
+#define GPTC_RUN_EN		BIT(0)
+#define GPTC_RUN_STOP		BIT(1)
+#define GPTC_RUN_RELOAD		BIT(2)
+
+#define GPTC_RLD(X)		(0x20 + (X) * 0x20)
+#define GPTC_CNT(X)		(0x28 + (X) * 0x20)
+
+#define GPTC_IRNENCLR		0xF0
+#define GPTC_IRNEN		0xF4
+#define GPTC_IRNCR		0xFC
+
+/* Watchdog Timeout Reset register offset and bitfeilds */
+#define BIA_WDT_RST_EN		0x1E0
+#define BIA_WDT			BIT(6)
+
+#define MAX_TIMERID		2
+#define MAX_CPUID		3
+#define TIMER_MARGIN_SEC	300
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started\n"
+	" (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct lgm_gptc_timer {
+	struct lgm_gptc_wdt	*wdt_node;
+	struct watchdog_device	wdd;
+	unsigned int		tid;
+	unsigned int		cpuid;
+	unsigned int		frequency;
+	unsigned int		cycles;
+	bool			enable;
+};
+
+struct lgm_gptc_wdt {
+	struct device		*dev;
+	void __iomem		*gptc_base;
+	struct regmap		*rst_hndl;
+	struct clk		*freqclk;
+	struct clk		*gateclk;
+	unsigned int		fpifreq;
+	enum cpuhp_state	state;
+};
+
+DEFINE_PER_CPU(struct lgm_gptc_timer, lgm_timer_per_cpu);
+
+static void lgm_gptc_wdt_cfg_timer(struct lgm_gptc_timer *timer)
+{
+	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
+	void __iomem *base = wdt_node->gptc_base;
+	u32 val;
+
+	val = readl(base + GPTC_CON(timer->tid));
+	val &= ~GPTC_CON_CNT_UP;
+	val |= GPTC_CON_EXT;
+	val &= ~GPTC_CON_ONESHOT;
+	writel(val, base + GPTC_CON(timer->tid));
+	writel(U32_MAX, base + GPTC_RLD(timer->tid));
+	writel(BIT(timer->tid * 2), base + GPTC_IRNEN);
+}
+
+static void lgm_gptc_wdt_init(struct lgm_gptc_wdt *wdt_node)
+{
+	void __iomem *base = wdt_node->gptc_base;
+
+	writel(GPTC_CLC_SUSPEND | FIELD_PREP(GPTC_CLC_RMC, CLC_RMC_DIV),
+	       base + GPTC_CLC);
+	writel(0xFF, base + GPTC_IRNENCLR);
+	writel(0xFF, base + GPTC_IRNCR);
+}
+
+static void lgm_gptc_wdt_timer_stop(struct lgm_gptc_timer *timer)
+{
+	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
+
+	writel(GPTC_RUN_STOP, wdt_node->gptc_base + GPTC_RUN(timer->tid));
+	regmap_write(wdt_node->rst_hndl, BIA_WDT_RST_EN, 0x00);
+}
+
+static void lgm_gptc_wdt_timer_set_timeout(struct lgm_gptc_timer *timer,
+					   u32 timeout)
+{
+	unsigned long cycles;
+	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
+
+	cycles = timeout * timer->frequency / CLC_RMC_DIV;
+	if (cycles > U32_MAX)
+		cycles = U32_MAX;
+
+	timer->cycles = cycles;
+	writel(cycles, wdt_node->gptc_base + GPTC_RLD(timer->tid));
+}
+
+static int lgm_gptc_wdt_start(struct watchdog_device *wdt_dev)
+{
+	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
+	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
+	void __iomem *base = wdt_node->gptc_base;
+	u32 val;
+
+	val = readl(base + GPTC_CON(timer->tid));
+	val &= ~GPTC_CON_ONESHOT;
+	writel(val, base + GPTC_CON(timer->tid));
+
+	writel(timer->cycles, base + GPTC_RLD(timer->tid));
+	writel(GPTC_RUN_EN | GPTC_RUN_RELOAD, base + GPTC_RUN(timer->tid));
+	writel(BIT(timer->tid * 2), base + GPTC_IRNEN);
+
+	/* Enable WDT reset */
+	regmap_read(wdt_node->rst_hndl, BIA_WDT_RST_EN, &val);
+	val |= BIT(timer->cpuid) | BIA_WDT;
+	regmap_write(wdt_node->rst_hndl, BIA_WDT_RST_EN, val);
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_stop(struct watchdog_device *wdt_dev)
+{
+	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
+
+	lgm_gptc_wdt_timer_stop(timer);
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_set_timeout(struct watchdog_device *wdt_dev,
+				    unsigned int new_timeout)
+{
+	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
+
+	wdt_dev->timeout = new_timeout;
+	lgm_gptc_wdt_timer_set_timeout(timer, new_timeout);
+
+	return 0;
+}
+
+static uint32_t lgm_gptc_wdt_get_timeleft(struct watchdog_device *wdt_dev)
+{
+	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
+	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
+	u32 cycles, interval;
+
+	cycles = readl(wdt_node->gptc_base + GPTC_CNT(timer->tid));
+	interval = cycles / timer->frequency / CLC_RMC_DIV;
+	dev_dbg(wdt_node->dev, "timeleft=%u cycles=%u\n", interval, cycles);
+
+	return interval;
+}
+
+static int lgm_gptc_wdt_ping(struct watchdog_device *wdt_dev)
+{
+	return lgm_gptc_wdt_start(wdt_dev);
+}
+
+static const struct watchdog_info lgm_gptc_wdt_info = {
+	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity	= "Hardware Watchdog for Intel LGM",
+};
+
+static const struct watchdog_ops lgm_gptc_wdt_ops = {
+	.start		= lgm_gptc_wdt_start,
+	.stop		= lgm_gptc_wdt_stop,
+	.ping		= lgm_gptc_wdt_ping,
+	.set_timeout	= lgm_gptc_wdt_set_timeout,
+	.get_timeleft	= lgm_gptc_wdt_get_timeleft,
+	.owner		= THIS_MODULE,
+};
+
+static int lgm_gptc_wdt_reg_wdd(struct lgm_gptc_timer *timer)
+{
+	struct lgm_gptc_wdt *wdt_node  = timer->wdt_node;
+	struct watchdog_device *wdd;
+	int ret;
+
+	wdd = &timer->wdd;
+	wdd->id = timer->cpuid;
+	wdd->info = &lgm_gptc_wdt_info;
+	wdd->ops = &lgm_gptc_wdt_ops;
+	wdd->min_timeout = 1;
+	wdd->max_timeout = U32_MAX;
+	wdd->max_hw_heartbeat_ms = wdd->max_timeout * 1000;
+	wdd->min_hw_heartbeat_ms = wdd->min_timeout * 1000;
+	wdd->timeout = TIMER_MARGIN_SEC;
+	watchdog_init_timeout(wdd, 0, wdt_node->dev);
+	lgm_gptc_wdt_timer_set_timeout(timer, wdd->timeout);
+	watchdog_set_drvdata(wdd, timer);
+	watchdog_set_nowayout(wdd, nowayout);
+	ret = watchdog_register_device(wdd);
+	if (ret) {
+		dev_err(wdt_node->dev,
+			"Watchdog timer register fail: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_reg_cpu(unsigned int cpu)
+{
+	struct lgm_gptc_timer *timer = per_cpu_ptr(&lgm_timer_per_cpu, cpu);
+
+	if (!timer->enable)
+		return 0;
+
+	lgm_gptc_wdt_cfg_timer(timer);
+	lgm_gptc_wdt_reg_wdd(timer);
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_unreg_cpu(unsigned int cpu)
+{
+	struct lgm_gptc_timer *timer = per_cpu_ptr(&lgm_timer_per_cpu, cpu);
+
+	if (!timer->enable)
+		return 0;
+
+	lgm_gptc_wdt_timer_stop(timer);
+	watchdog_unregister_device(&timer->wdd);
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_clk_enable(struct lgm_gptc_wdt *wdt_node)
+{
+	int ret;
+
+	wdt_node->gateclk = devm_clk_get(wdt_node->dev, "gptc");
+	if (IS_ERR(wdt_node->gateclk)) {
+		ret = PTR_ERR(wdt_node->gateclk);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(wdt_node->dev,
+				"Failed to get gptc clk: %d\n", ret);
+		}
+
+		return ret;
+	}
+
+	wdt_node->freqclk = devm_clk_get(wdt_node->dev, "freq");
+	if (IS_ERR(wdt_node->freqclk)) {
+		ret = PTR_ERR(wdt_node->freqclk);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(wdt_node->dev,
+				"Failed to get freq clk: %d\n", ret);
+		}
+
+		return ret;
+	}
+
+	ret = clk_prepare_enable(wdt_node->gateclk);
+	if (ret) {
+		dev_err(wdt_node->dev, "Gate clk enable failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(wdt_node->freqclk);
+	if (ret) {
+		dev_err(wdt_node->dev, "fpi clk enable failed: %d\n", ret);
+		clk_disable_unprepare(wdt_node->gateclk);
+		return ret;
+	}
+
+	wdt_node->fpifreq = clk_get_rate(wdt_node->freqclk);
+
+	return 0;
+}
+
+static void lgm_gptc_wdt_clk_disable(struct lgm_gptc_wdt *wdt_node)
+{
+	clk_disable_unprepare(wdt_node->gateclk);
+	clk_disable_unprepare(wdt_node->freqclk);
+}
+
+static int lgm_gptc_wdt_of_parse_timer(struct lgm_gptc_wdt *wdt_node)
+{
+	struct device_node *np = wdt_node->dev->of_node;
+	struct lgm_gptc_timer *timer;
+	u32 i, nr_timers, args[4];
+	int ret;
+
+	ret = of_property_read_variable_u32_array(np, "intel,timer-cfg",
+						  args, 2, 4);
+	if (ret < 0) {
+		dev_err(wdt_node->dev, "Failed to get timer cfg: %d\n", ret);
+		return ret;
+	}
+
+	nr_timers = ret / 2;
+	if (!nr_timers) {
+		dev_err(wdt_node->dev, "No timer defined\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < nr_timers; i++) {
+		if (args[i * 2] > MAX_TIMERID) {
+			dev_err(wdt_node->dev,
+				"Invalid timer id %d\n", args[i * 2]);
+			return -EINVAL;
+		}
+
+		if (args[i * 2 + 1] > MAX_CPUID) {
+			dev_err(wdt_node->dev,
+				"Invalid CPU-id : %d\n", args[i * 2 + 1]);
+			return -EINVAL;
+		}
+
+		timer = per_cpu_ptr(&lgm_timer_per_cpu, args[i * 2 + 1]);
+		timer->cpuid = args[i * 2 + 1];
+		timer->tid = args[i * 2];
+		timer->enable = true;
+		timer->wdt_node = wdt_node;
+		timer->frequency = wdt_node->fpifreq;
+		timer++;
+	}
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_drv_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lgm_gptc_wdt *wdt_node;
+	int ret;
+
+	wdt_node = devm_kzalloc(dev, sizeof(*wdt_node), GFP_KERNEL);
+	if (!wdt_node)
+		return -ENOMEM;
+
+	wdt_node->dev = dev;
+	wdt_node->gptc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt_node->gptc_base))
+		return PTR_ERR(wdt_node->gptc_base);
+
+	wdt_node->rst_hndl = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "intel,wdt-rst-hndl");
+	if (IS_ERR(wdt_node->rst_hndl)) {
+		dev_err(dev, "No phandle of reset controller\n");
+		return PTR_ERR(wdt_node->rst_hndl);
+	}
+
+	ret = lgm_gptc_wdt_clk_enable(wdt_node);
+	if (ret)
+		return ret;
+
+	ret = lgm_gptc_wdt_of_parse_timer(wdt_node);
+	if (ret)
+		return ret;
+
+	lgm_gptc_wdt_init(wdt_node);
+	ret  = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "LGM GPTC WDT REG",
+				 lgm_gptc_wdt_reg_cpu, lgm_gptc_wdt_unreg_cpu);
+	if (ret < 0) {
+		dev_err(dev, "CPU hotplug setup failed: %d\n", ret);
+		return ret;
+	}
+
+	wdt_node->state = ret;
+	platform_set_drvdata(pdev, wdt_node);
+
+	return 0;
+}
+
+static int lgm_gptc_wdt_drv_remove(struct platform_device *dev)
+{
+	struct lgm_gptc_wdt *wdt_node = platform_get_drvdata(dev);
+
+	cpuhp_remove_state(wdt_node->state);
+	lgm_gptc_wdt_clk_disable(wdt_node);
+
+	return 0;
+}
+
+static const struct of_device_id lgm_gptc_wdt_drv_match[] = {
+	{ .compatible = "intel,lgm-gptc-wdt" },
+	{}
+};
+
+static struct platform_driver lgm_gptc_wdt_driver = {
+	.driver		= {
+		.name		= "intel,lgm-gptc-wdt",
+		.of_match_table = lgm_gptc_wdt_drv_match,
+	},
+	.probe		= lgm_gptc_wdt_drv_probe,
+	.remove		= lgm_gptc_wdt_drv_remove,
+};
+
+module_platform_driver(lgm_gptc_wdt_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Driver for Watchdog Timer on Intel Lightning Mountain SoC");
-- 
2.11.0

