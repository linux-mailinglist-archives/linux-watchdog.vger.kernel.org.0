Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F235245B88C
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 11:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241579AbhKXKqO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 05:46:14 -0500
Received: from [113.204.237.245] ([113.204.237.245]:34586 "EHLO
        test.cqplus1.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S241578AbhKXKqO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 05:46:14 -0500
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
        LIVER,40,3)
Received: from 172.28.114.216
        by cqmailgates with MailGates ESMTP Server V5.0(1213:0:AUTH_RELAY)
        (envelope-from <xt.hu@cqplus1.com>); Wed, 24 Nov 2021 18:42:23 +0800 (CST)
From:   Xiantao Hu <xt.hu@cqplus1.com>
To:     wim@linux-watchdog.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     wells.lu@sunplus.com, qinjian@cqplus1.com,
        Xiantao Hu <xt.hu@cqplus1.com>
Subject: [PATCH v2 1/2] watchdog: Add watchdog driver for Sunplus SP7021
Date:   Wed, 24 Nov 2021 18:41:48 +0800
Message-Id: <20211124104149.361019-2-xt.hu@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124104149.361019-1-xt.hu@cqplus1.com>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Sunplus SP7021 requires watchdog timer support.
Add watchdog driver to enable this.

Signed-off-by: Xiantao Hu <xt.hu@cqplus1.com>
---
Changes in v2:
 - Addressed all comments from Mr. Guenter Roeck
 - Drop the remove()

 MAINTAINERS                    |   6 +
 drivers/watchdog/Kconfig       |  11 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/sunplus_wdt.c | 322 +++++++++++++++++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 drivers/watchdog/sunplus_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e0bca0de0..f6a328772 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17933,6 +17933,12 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/dlink/sundance.c
 
+SUNPLUS WATCHDOG DRIVER
+M:	Xiantao Hu <xt.hu@cqplus1.com>
+L:	linux-watchdog@vger.kernel.org
+S:	Maintained
+F:	drivers/watchdog/sunplus_wdt.c
+
 SUPERH
 M:	Yoshinori Sato <ysato@users.sourceforge.jp>
 M:	Rich Felker <dalias@libc.org>
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3..1a95df8ed 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -990,6 +990,17 @@ config MSC313E_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called msc313e_wdt.
 
+config SUNPLUS_WATCHDOG
+	tristate "Sunplus watchdog support"
+	depends on ARCH_SUNPLUS || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer
+	  in Sunplus SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sunplus_wdt.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 1bd2d6f37..d6a9e4d0e 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
 obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
 obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
 obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
+obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
new file mode 100644
index 000000000..44abc04df
--- /dev/null
+++ b/drivers/watchdog/sunplus_wdt.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sunplus Watchdog Driver
+ *
+ * Copyright (C) 2021 Sunplus Technology Co., Ltd.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/watchdog.h>
+
+#define WDT_CTRL                0x00
+#define WDT_CNT                 0x04
+
+#define WDT_STOP				0x3877
+#define WDT_RESUME				0x4A4B
+#define WDT_CLRIRQ				0x7482
+#define WDT_UNLOCK				0xAB00
+#define WDT_LOCK				0xAB01
+#define WDT_CONMAX				0xDEAF
+
+#define RBUS_WDT_RST        BIT(1)
+#define STC_WDT_RST         BIT(4)
+
+#define MASK_SET(mask)		((mask) | (mask << 16))
+
+#define SP_WDT_MAX_TIMEOUT		11U
+#define SP_WDT_DEFAULT_TIMEOUT	10
+
+#define STC_CLK				90000
+
+#define DEVICE_NAME		"sunplus-wdt"
+
+static unsigned int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct sp_wdt_priv {
+	struct watchdog_device wdev;
+	void __iomem *base;
+	struct clk *clk;
+	struct reset_control *rstc;
+};
+
+static int sp_wdt_restart(struct watchdog_device *wdev,
+			       unsigned long action, void *data)
+{
+	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	void __iomem *base = priv->base;
+
+	writel(WDT_STOP, base + WDT_CTRL);
+	writel(WDT_UNLOCK, base + WDT_CTRL);
+	writel(0x0001, base + WDT_CNT);
+	writel(WDT_LOCK, base + WDT_CTRL);
+	writel(WDT_RESUME, base + WDT_CTRL);
+
+	return 0;
+}
+
+/* TIMEOUT_MAX = ffff0/90kHz =11.65,so longer than 11 seconds will time out */
+static int sp_wdt_ping(struct watchdog_device *wdev)
+{
+	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	void __iomem *base = priv->base;
+	u32 count;
+	u32 actual;
+
+	actual = min(wdev->timeout, SP_WDT_MAX_TIMEOUT);
+
+	if (actual > SP_WDT_MAX_TIMEOUT) {
+		writel(WDT_CONMAX, base + WDT_CTRL);
+	} else {
+		writel(WDT_UNLOCK, base + WDT_CTRL);
+		/* tiemrw_cnt[3:0]can't be write,only [19:4] can be write. */
+		count = (actual * STC_CLK) >> 4;
+		writel(count, base + WDT_CNT);
+		writel(WDT_LOCK, base + WDT_CTRL);
+	}
+
+	return 0;
+}
+
+static int sp_wdt_set_timeout(struct watchdog_device *wdev,
+				   unsigned int timeout)
+{
+
+	wdev->timeout = timeout;
+	sp_wdt_ping(wdev);
+
+	return 0;
+}
+
+static int sp_wdt_stop(struct watchdog_device *wdev)
+{
+	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	void __iomem *base = priv->base;
+
+	writel(WDT_STOP, base + WDT_CTRL);
+
+	return 0;
+}
+
+static int sp_wdt_start(struct watchdog_device *wdev)
+{
+	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	void __iomem *base = priv->base;
+
+	writel(WDT_RESUME, base + WDT_CTRL);
+
+	return 0;
+}
+
+static unsigned int sp_wdt_get_timeleft(struct watchdog_device *wdev)
+{
+	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	void __iomem *base = priv->base;
+	u32 val;
+
+	val = readl(base + WDT_CNT);
+	val &= 0xffff;
+	val = val << 4;
+
+	return val;
+}
+
+/*
+ * 1.We need to reset watchdog flag(clear watchdog interrupt) here
+ * because watchdog timer driver does not have an interrupt handler,
+ * and before enable STC and RBUS watchdog timeout. Otherwise,
+ * the intr is always in the triggered state.
+ * 2.Enable STC and RBUS watchdog timeout trigger.
+ * 3.Watchdog counter is running, need to be stopped.
+ */
+static int sp_wdt_hw_init(struct watchdog_device *wdev, void __iomem *rst_en)
+{
+	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	void __iomem *base = priv->base;
+	u32 val;
+
+	writel(WDT_CLRIRQ, base + WDT_CTRL);
+	val = readl(rst_en);
+	val |= MASK_SET(STC_WDT_RST);
+	val |= MASK_SET(RBUS_WDT_RST);
+	writel(val, rst_en);
+
+	sp_wdt_stop(wdev);
+	writel(WDT_LOCK, base + WDT_CTRL);
+	writel(WDT_CONMAX, base + WDT_CTRL);
+
+	return 0;
+}
+
+static const struct watchdog_info sp_wdt_info = {
+	.identity	= DEVICE_NAME,
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_KEEPALIVEPING,
+};
+
+static const struct watchdog_ops sp_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= sp_wdt_start,
+	.stop		= sp_wdt_stop,
+	.ping		= sp_wdt_ping,
+	.set_timeout	= sp_wdt_set_timeout,
+	.get_timeleft	= sp_wdt_get_timeleft,
+	.restart	= sp_wdt_restart,
+};
+
+static void sp_clk_disable_unprepare(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static void sp_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int sp_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sp_wdt_priv *priv;
+	struct resource *wdt_res;
+	int err;
+	void __iomem *rst_en;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "Can't find clock source\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	err = clk_prepare_enable(priv->clk);
+	if (err) {
+		dev_err(dev, "Clock can't be enabled correctly\n");
+		return err;
+	}
+
+	/* The timer and watchdog shared the STC reset */
+	priv->rstc = devm_reset_control_get_shared(dev, NULL);
+	if (!IS_ERR(priv->rstc))
+		reset_control_deassert(priv->rstc);
+
+	err = devm_add_action_or_reset(dev, sp_reset_control_assert,
+				       priv->rstc);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(dev, sp_clk_disable_unprepare,
+				       priv->clk);
+	if (err)
+		return err;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	/* The registers accessed here shared by multiple drivers. */
+	wdt_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	rst_en =
+	    devm_ioremap(dev, wdt_res->start, resource_size(wdt_res));
+	if (IS_ERR(rst_en))
+		return PTR_ERR(rst_en);
+
+	priv->wdev.info = &sp_wdt_info;
+	priv->wdev.ops = &sp_wdt_ops;
+	priv->wdev.timeout = SP_WDT_DEFAULT_TIMEOUT;
+	priv->wdev.max_hw_heartbeat_ms = SP_WDT_MAX_TIMEOUT * 1000;
+	priv->wdev.min_timeout = 1;
+	priv->wdev.parent = dev;
+
+	watchdog_init_timeout(&priv->wdev, timeout, dev);
+	watchdog_set_nowayout(&priv->wdev, nowayout);
+	watchdog_set_restart_priority(&priv->wdev, 128);
+
+	watchdog_set_drvdata(&priv->wdev, priv);
+
+	sp_wdt_hw_init(&priv->wdev, rst_en);
+
+	watchdog_stop_on_reboot(&priv->wdev);
+	err = devm_watchdog_register_device(dev, &priv->wdev);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, priv);
+
+	dev_info(dev, "Watchdog enabled (timeout=%d sec%s.)\n",
+		 priv->wdev.timeout, nowayout ? ", nowayout" : "");
+
+	return 0;
+}
+
+static const struct of_device_id sp_wdt_of_match[] = {
+	{.compatible = "sunplus,sp7021-wdt", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sp_wdt_of_match);
+
+static int __maybe_unused sp_wdt_suspend(struct device *dev)
+{
+	struct sp_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (watchdog_active(&priv->wdev))
+		sp_wdt_stop(&priv->wdev);
+
+	reset_control_assert(priv->rstc);
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static int __maybe_unused sp_wdt_resume(struct device *dev)
+{
+	int err;
+
+	struct sp_wdt_priv *priv = dev_get_drvdata(dev);
+
+	err = clk_prepare_enable(priv->clk);
+	if (err) {
+		dev_err(dev, "Clock can't be enabled correctly\n");
+		return err;
+	}
+
+	reset_control_deassert(priv->rstc);
+
+	if (watchdog_active(&priv->wdev))
+		sp_wdt_start(&priv->wdev);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(sp_wdt_pm_ops, sp_wdt_suspend, sp_wdt_resume);
+
+static struct platform_driver sp_wdt_driver = {
+	.probe = sp_wdt_probe,
+	.driver = {
+		   .name = DEVICE_NAME,
+		   .of_match_table = sp_wdt_of_match,
+		   .pm = &sp_wdt_pm_ops,
+	},
+};
+
+module_platform_driver(sp_wdt_driver);
+
+MODULE_AUTHOR("Xiantao Hu <xt.hu@cqplus1.com>");
+MODULE_DESCRIPTION("Sunplus Watchdog Timer Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

