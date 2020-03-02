Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656B417649F
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 21:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgCBUE7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 15:04:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58054 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgCBUE6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 15:04:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022K4aXS059601;
        Mon, 2 Mar 2020 14:04:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583179476;
        bh=e189hx0wnfxzqqMKnGjStIzEHm5g0egyf6MSbSoBMps=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ISh1MmN3fhlDpGeXzOjDyDDvhGlbm0wVoi8bnyr8OCbdM9c0GP2QhzCgNReZKuZkH
         T5FiG53//wTeJYfVrzQ3OqUnKtdSNpYa3D9EMscMi0+4Fe2Qvq4WOExWbFGSQcUEFs
         XDbO+AiVlNR51TSjL/Xw33ykXVJNmm6PwFlYqc2U=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022K4atE029320
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Mar 2020 14:04:36 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 14:04:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 14:04:36 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 022K4UtD074555;
        Mon, 2 Mar 2020 14:04:35 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCHv2 3/4] watchdog: Add K3 RTI watchdog support
Date:   Mon, 2 Mar 2020 22:04:25 +0200
Message-ID: <20200302200426.6492-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302200426.6492-1-t-kristo@ti.com>
References: <20200302200426.6492-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Texas Instruments K3 SoCs contain an RTI (Real Time Interrupt) module
which can be used as a watchdog. This IP provides a support for
windowed watchdog mode, in which the watchdog must be petted within
a certain time window. If it is petted either too soon, or too late,
a watchdog error will be triggered.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
v2:
  * Added better documentation within the driver code
  * Dropped fck handle, instead get the fck rate during probe only
  * Modified the max_hw_heartbeat calculation logic a bit

 drivers/watchdog/Kconfig   |   8 ++
 drivers/watchdog/Makefile  |   1 +
 drivers/watchdog/rti_wdt.c | 254 +++++++++++++++++++++++++++++++++++++
 3 files changed, 261 insertions(+)
 create mode 100644 drivers/watchdog/rti_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index cec868f8db3f..81faf47d44a6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -583,6 +583,14 @@ config DAVINCI_WATCHDOG
 	  NOTE: once enabled, this timer cannot be disabled.
 	  Say N if you are unsure.
 
+config K3_RTI_WATCHDOG
+	tristate "Texas Instruments K3 RTI watchdog"
+	depends on ARCH_K3 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Say Y here if you want to include support for the K3 watchdog
+	  timer (RTI module) available in the K3 generation of processors.
+
 config ORION_WATCHDOG
 	tristate "Orion watchdog"
 	depends on ARCH_ORION5X || ARCH_DOVE || MACH_DOVE || ARCH_MVEBU || (COMPILE_TEST && !ARCH_EBSA110)
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2ee352bf3372..6de2e4ceef19 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
 obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
 obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
 obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
+obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
 obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
 obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
 obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
new file mode 100644
index 000000000000..7a46c40891e2
--- /dev/null
+++ b/drivers/watchdog/rti_wdt.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Watchdog driver for the K3 RTI module
+ *
+ * (c) Copyright 2019-2020 Texas Instruments Inc.
+ * All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define DEFAULT_HEARTBEAT 60
+
+/* Max heartbeat is calculated at 32kHz source clock */
+#define MAX_HEARTBEAT	1000
+
+/* Timer register set definition */
+#define RTIDWDCTRL	0x90
+#define RTIDWDPRLD	0x94
+#define RTIWDSTATUS	0x98
+#define RTIWDKEY	0x9c
+#define RTIDWDCNTR	0xa0
+#define RTIWWDRXCTRL	0xa4
+#define RTIWWDSIZECTRL	0xa8
+
+#define RTIWWDRX_NMI	0xa
+
+#define RTIWWDSIZE_50P	0x50
+
+#define WDENABLE_KEY	0xa98559da
+
+#define WDKEY_SEQ0		0xe51a
+#define WDKEY_SEQ1		0xa35c
+
+#define WDT_PRELOAD_SHIFT	13
+
+#define WDT_PRELOAD_MAX		0xfff
+
+#define DWDST			BIT(1)
+
+static int heartbeat;
+
+/*
+ * struct to hold data for each WDT device
+ * @base - base io address of WD device
+ * @freq - source clock frequency of WDT
+ * @wdd  - hold watchdog device as is in WDT core
+ */
+struct rti_wdt_device {
+	void __iomem		*base;
+	unsigned long		freq;
+	struct watchdog_device	wdd;
+};
+
+static int rti_wdt_start(struct watchdog_device *wdd)
+{
+	u32 timer_margin;
+	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+
+	/* set timeout period */
+	timer_margin = (u64)wdd->timeout * wdt->freq;
+	timer_margin >>= WDT_PRELOAD_SHIFT;
+	if (timer_margin > WDT_PRELOAD_MAX)
+		timer_margin = WDT_PRELOAD_MAX;
+	writel_relaxed(timer_margin, wdt->base + RTIDWDPRLD);
+
+	/*
+	 * RTI only supports a windowed mode, where the watchdog can only
+	 * be petted during the open window; not too early or not too late.
+	 * The HW configuration options only allow for the open window size
+	 * to be 50% or less than that; we obviouly want to configure the open
+	 * window as large as possible so we select the 50% option. To avoid
+	 * any glitches, we accommodate 5% safety margin also, so we setup
+	 * the min_hw_hearbeat at 55% of the timeout period.
+	 */
+	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
+
+	/* Generate NMI when wdt expires */
+	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+
+	/* Open window size 50%; this is the largest window size available */
+	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
+
+	readl_relaxed(wdt->base + RTIWWDSIZECTRL);
+
+	/* enable watchdog */
+	writel_relaxed(WDENABLE_KEY, wdt->base + RTIDWDCTRL);
+	return 0;
+}
+
+static int rti_wdt_ping(struct watchdog_device *wdd)
+{
+	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+
+	/* put watchdog in service state */
+	writel_relaxed(WDKEY_SEQ0, wdt->base + RTIWDKEY);
+	/* put watchdog in active state */
+	writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
+
+	return 0;
+}
+
+static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	u64 timer_counter;
+	u32 val;
+	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+
+	/* if timeout has occurred then return 0 */
+	val = readl_relaxed(wdt->base + RTIWDSTATUS);
+	if (val & DWDST)
+		return 0;
+
+	timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
+
+	do_div(timer_counter, wdt->freq);
+
+	return timer_counter;
+}
+
+static const struct watchdog_info rti_wdt_info = {
+	.options = WDIOF_KEEPALIVEPING,
+	.identity = "K3 RTI Watchdog",
+};
+
+static const struct watchdog_ops rti_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= rti_wdt_start,
+	.ping		= rti_wdt_ping,
+	.get_timeleft	= rti_wdt_get_timeleft,
+};
+
+static int rti_wdt_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+	struct device *dev = &pdev->dev;
+	struct resource *wdt_mem;
+	struct watchdog_device *wdd;
+	struct rti_wdt_device *wdt;
+	struct clk *clk;
+
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		if (PTR_ERR(clk) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get clock\n");
+		return PTR_ERR(clk);
+	}
+
+	wdt->freq = clk_get_rate(clk);
+	if (!wdt->freq) {
+		dev_err(dev, "Failed to get fck rate.\n");
+		return -EINVAL;
+	}
+
+	devm_clk_put(dev, clk);
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "runtime pm failed\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, wdt);
+
+	wdd = &wdt->wdd;
+	wdd->info = &rti_wdt_info;
+	wdd->ops = &rti_wdt_ops;
+	wdd->min_timeout = 1;
+	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
+		wdt->freq * 1000;
+	wdd->timeout = DEFAULT_HEARTBEAT;
+	wdd->parent = dev;
+
+	watchdog_init_timeout(wdd, heartbeat, dev);
+
+	watchdog_set_drvdata(wdd, wdt);
+	watchdog_set_nowayout(wdd, 1);
+	watchdog_set_restart_priority(wdd, 128);
+
+	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	wdt->base = devm_ioremap_resource(dev, wdt_mem);
+	if (IS_ERR(wdt->base)) {
+		ret = PTR_ERR(wdt->base);
+		goto err_iomap;
+	}
+
+	ret = watchdog_register_device(wdd);
+	if (ret) {
+		dev_err(dev, "cannot register watchdog device\n");
+		goto err_iomap;
+	}
+
+	return 0;
+
+err_iomap:
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
+}
+
+static int rti_wdt_remove(struct platform_device *pdev)
+{
+	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
+
+	watchdog_unregister_device(&wdt->wdd);
+	pm_runtime_put(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id rti_wdt_of_match[] = {
+	{ .compatible = "ti,rti-wdt", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
+
+static struct platform_driver rti_wdt_driver = {
+	.driver = {
+		.name = "rti-wdt",
+		.of_match_table = rti_wdt_of_match,
+	},
+	.probe = rti_wdt_probe,
+	.remove = rti_wdt_remove,
+};
+
+module_platform_driver(rti_wdt_driver);
+
+MODULE_AUTHOR("Tero Kristo <t-kristo@ti.com>");
+MODULE_DESCRIPTION("K3 RTI Watchdog Driver");
+
+module_param(heartbeat, int, 0);
+MODULE_PARM_DESC(heartbeat,
+		 "Watchdog heartbeat period in seconds from 1 to "
+		 __MODULE_STRING(MAX_HEARTBEAT) ", default "
+		 __MODULE_STRING(DEFAULT_HEARTBEAT));
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:rti-wdt");
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
