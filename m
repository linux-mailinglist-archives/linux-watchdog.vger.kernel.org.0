Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E912DC6A2
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Dec 2020 19:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbgLPShM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Dec 2020 13:37:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:51803 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731115AbgLPShM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Dec 2020 13:37:12 -0500
IronPort-SDR: pjrDGb2DlYkw0ZfWU5fDiQZW65LVgmBybW3QoFhKTD9MD52/Bl8irQvI3D1UwCL5FqWd/nDBTu
 hfd+wzv5tIyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="174345000"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="174345000"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 10:36:32 -0800
IronPort-SDR: +MlzArBXAY3AKQTOnVq8JRHiz4SvZwWjLXuWqaWlybACLxki9BZL/yb8rMrdFOyoSJoiKBbr1U
 YFTo+dd8p0lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="488645894"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2020 10:36:28 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com, chen.yong.seow@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v4 2/2] watchdog: Add watchdog driver for Intel Keembay Soc
Date:   Thu, 17 Dec 2020 02:32:48 +0800
Message-Id: <26d74f46ce74488424371dd3e16aa38508fa6c2e.1608141131.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>

Intel Keembay Soc requires watchdog timer support.
Add watchdog driver to enable this.

Acked-by: Mark Gross <mgross@linux.intel.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
---
 drivers/watchdog/Kconfig       |  13 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/keembay_wdt.c | 286 +++++++++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)
 create mode 100644 drivers/watchdog/keembay_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index fd7968635e6d..f412cf2d0f1a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2163,4 +2163,17 @@ config USBPCWATCHDOG
 
 	  Most people will say N.
 
+config KEEMBAY_WATCHDOG
+	tristate "Intel Keem Bay SoC non-secure watchdog"
+	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
+	select WATCHDOG_CORE
+	help
+	 This option enable support for an In-secure watchdog timer driver for
+	 Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
+	 count unit. An interrupt will be triggered, when the count crosses
+	 the thershold configured in the register.
+
+	 To compile this driver as a module, choose M here: the
+	 module will be called keembay_wdt.
+
 endif # WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 071a2e50be98..f6f9f434f407 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
 obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
+obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
 
 # M68K Architecture
 obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
new file mode 100644
index 000000000000..547d3fea33ff
--- /dev/null
+++ b/drivers/watchdog/keembay_wdt.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Watchdog driver for Intel Keem Bay non-secure watchdog.
+ *
+ * Copyright (C) 2020 Intel Corporation
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/watchdog.h>
+
+/* Non-secure watchdog register offsets */
+#define TIM_WATCHDOG		0x0
+#define TIM_WATCHDOG_INT_THRES	0x4
+#define TIM_WDOG_EN		0x8
+#define TIM_SAFE		0xc
+
+#define WDT_ISR_MASK		GENMASK(9, 8)
+#define WDT_ISR_CLEAR		0x8200ff18
+#define WDT_UNLOCK		0xf1d0dead
+#define WDT_LOAD_MAX		U32_MAX
+#define WDT_LOAD_MIN		1
+#define WDT_TIMEOUT		5
+
+static unsigned int timeout = WDT_TIMEOUT;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout period in seconds (default = "
+		 __MODULE_STRING(WDT_TIMEOUT) ")");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default = "
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct keembay_wdt {
+	struct watchdog_device	wdd;
+	struct clk		*clk;
+	unsigned int		rate;
+	int			to_irq;
+	int			th_irq;
+	void __iomem		*base;
+};
+
+static inline u32 keembay_wdt_readl(struct keembay_wdt *wdt, u32 offset)
+{
+	return readl(wdt->base + offset);
+}
+
+static inline void keembay_wdt_writel(struct keembay_wdt *wdt, u32 offset, u32 val)
+{
+	writel(WDT_UNLOCK, wdt->base + TIM_SAFE);
+	writel(val, wdt->base + offset);
+}
+
+static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog)
+{
+	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
+
+	keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);
+}
+
+static void keembay_wdt_set_pretimeout_reg(struct watchdog_device *wdog)
+{
+	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
+	u32 th_val = 0;
+
+	if (wdog->pretimeout)
+		th_val = wdog->timeout - wdog->pretimeout;
+
+	keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val * wdt->rate);
+}
+
+static int keembay_wdt_start(struct watchdog_device *wdog)
+{
+	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
+
+	keembay_wdt_set_timeout_reg(wdog);
+	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
+
+	return 0;
+}
+
+static int keembay_wdt_stop(struct watchdog_device *wdog)
+{
+	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
+
+	keembay_wdt_writel(wdt, TIM_WDOG_EN, 0);
+
+	return 0;
+}
+
+static int keembay_wdt_ping(struct watchdog_device *wdog)
+{
+	keembay_wdt_set_timeout_reg(wdog);
+
+	return 0;
+}
+
+static int keembay_wdt_set_timeout(struct watchdog_device *wdog, u32 t)
+{
+	wdog->timeout = t;
+	keembay_wdt_set_timeout_reg(wdog);
+
+	return 0;
+}
+
+static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog, u32 t)
+{
+	if (t > wdog->timeout)
+		return -EINVAL;
+
+	wdog->pretimeout = t;
+	keembay_wdt_set_pretimeout_reg(wdog);
+
+	return 0;
+}
+
+static unsigned int keembay_wdt_get_timeleft(struct watchdog_device *wdog)
+{
+	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
+
+	return keembay_wdt_readl(wdt, TIM_WATCHDOG) / wdt->rate;
+}
+
+/*
+ * SMC call is used to clear the interrupt bits, because the TIM_GEN_CONFIG
+ * register is in the secure bank.
+ */
+static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
+{
+	struct keembay_wdt *wdt = dev_id;
+	struct arm_smccc_res res;
+
+	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
+	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
+	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
+	emergency_restart();
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
+{
+	struct keembay_wdt *wdt = dev_id;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
+	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
+	watchdog_notify_pretimeout(&wdt->wdd);
+
+	return IRQ_HANDLED;
+}
+
+static const struct watchdog_info keembay_wdt_info = {
+	.identity	= "Intel Keem Bay Watchdog Timer",
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_PRETIMEOUT |
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_KEEPALIVEPING,
+};
+
+static const struct watchdog_ops keembay_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= keembay_wdt_start,
+	.stop		= keembay_wdt_stop,
+	.ping		= keembay_wdt_ping,
+	.set_timeout	= keembay_wdt_set_timeout,
+	.set_pretimeout	= keembay_wdt_set_pretimeout,
+	.get_timeleft	= keembay_wdt_get_timeleft,
+};
+
+static int keembay_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct keembay_wdt *wdt;
+	int ret;
+
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt->base))
+		return PTR_ERR(wdt->base);
+
+	/* we do not need to enable the clock as it is enabled by default */
+	wdt->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(wdt->clk))
+		return dev_err_probe(dev, PTR_ERR(wdt->clk), "Failed to get clock\n");
+
+	wdt->rate = clk_get_rate(wdt->clk);
+	if (!wdt->rate)
+		return dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
+
+	wdt->th_irq = platform_get_irq_byname(pdev, "threshold");
+	if (wdt->th_irq < 0)
+		return dev_err_probe(dev, wdt->th_irq, "Failed to get IRQ for threshold\n");
+
+	ret = devm_request_irq(dev, wdt->th_irq, keembay_wdt_th_isr, 0,
+			       "keembay-wdt", wdt);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ for threshold\n");
+
+	wdt->to_irq = platform_get_irq_byname(pdev, "timeout");
+	if (wdt->to_irq < 0)
+		return dev_err_probe(dev, wdt->to_irq, "Failed to get IRQ for timeout\n");
+
+	ret = devm_request_irq(dev, wdt->to_irq, keembay_wdt_to_isr, 0,
+			       "keembay-wdt", wdt);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ for timeout\n");
+
+	wdt->wdd.parent		= dev;
+	wdt->wdd.info		= &keembay_wdt_info;
+	wdt->wdd.ops		= &keembay_wdt_ops;
+	wdt->wdd.min_timeout	= WDT_LOAD_MIN;
+	wdt->wdd.max_timeout	= WDT_LOAD_MAX / wdt->rate;
+	wdt->wdd.timeout	= WDT_TIMEOUT;
+
+	watchdog_set_drvdata(&wdt->wdd, wdt);
+	watchdog_set_nowayout(&wdt->wdd, nowayout);
+	watchdog_init_timeout(&wdt->wdd, timeout, dev);
+	keembay_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+
+	ret = devm_watchdog_register_device(dev, &wdt->wdd);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register watchdog device.\n");
+
+	platform_set_drvdata(pdev, wdt);
+	dev_info(dev, "Initial timeout %d sec%s.\n",
+		 wdt->wdd.timeout, nowayout ? ", nowayout" : "");
+
+	return 0;
+}
+
+static int __maybe_unused keembay_wdt_suspend(struct device *dev)
+{
+	struct keembay_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		return keembay_wdt_stop(&wdt->wdd);
+
+	return 0;
+}
+
+static int __maybe_unused keembay_wdt_resume(struct device *dev)
+{
+	struct keembay_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		return keembay_wdt_start(&wdt->wdd);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(keembay_wdt_pm_ops, keembay_wdt_suspend,
+			 keembay_wdt_resume);
+
+static const struct of_device_id keembay_wdt_match[] = {
+	{ .compatible = "intel,keembay-wdt" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, keembay_wdt_match);
+
+static struct platform_driver keembay_wdt_driver = {
+	.probe		= keembay_wdt_probe,
+	.driver		= {
+		.name		= "keembay_wdt",
+		.of_match_table	= keembay_wdt_match,
+		.pm		= &keembay_wdt_pm_ops,
+	},
+};
+
+module_platform_driver(keembay_wdt_driver);
+
+MODULE_DESCRIPTION("Intel Keem Bay SoC watchdog driver");
+MODULE_AUTHOR("Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

