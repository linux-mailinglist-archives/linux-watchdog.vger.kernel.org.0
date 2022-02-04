Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9F44A9CC9
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Feb 2022 17:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376475AbiBDQSY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Feb 2022 11:18:24 -0500
Received: from smtpout1.mo528.mail-out.ovh.net ([46.105.34.251]:48461 "EHLO
        smtpout1.mo528.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376476AbiBDQSW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Feb 2022 11:18:22 -0500
Received: from pro2.mail.ovh.net (unknown [10.109.156.10])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 0801BE1D48BA;
        Fri,  4 Feb 2022 17:18:21 +0100 (CET)
Received: from localhost.localdomain (88.125.132.78) by DAG1EX2.emp2.local
 (172.16.2.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Feb
 2022 17:18:19 +0100
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
To:     <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: [PATCH 6/6] watchdog: Add Renesas RZ/N1 Watchdog driver
Date:   Fri, 4 Feb 2022 17:18:04 +0100
Message-ID: <20220204161806.3126321-7-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204161806.3126321-1-jjhiblot@traphandler.com>
References: <20220204161806.3126321-1-jjhiblot@traphandler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [88.125.132.78]
X-ClientProxiedBy: DAG2EX1.emp2.local (172.16.2.11) To DAG1EX2.emp2.local
 (172.16.2.2)
X-Ovh-Tracer-Id: 5894367490575120724
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgeelgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepfeeugefgieeutdfhvdegveetvdeuvefgveegleeileevveehfeejjeffgfduudeknecukfhppedtrddtrddtrddtpdekkedruddvhedrudefvddrjeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehprhhovddrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

This is a driver for the standard WDT on the RZ/N1 devices. This WDT has
very limited timeout capabilities. However, it can reset the device.
To do so, the corresponding bits in the SysCtrl RSTEN register need to
be enabled. This is not done by this driver.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
---
 drivers/watchdog/Kconfig    |   8 ++
 drivers/watchdog/Makefile   |   1 +
 drivers/watchdog/rzn1_wdt.c | 197 ++++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/watchdog/rzn1_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c8fa79da23b3..ba6e4ebef404 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -883,6 +883,14 @@ config RENESAS_RZAWDT
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
 
+config RENESAS_RZN1WDT
+	tristate "Renesas RZ/N1 watchdog"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This driver adds watchdog support for the integrated watchdogs in the
+	  Renesas RZ/N1 SoCs. These watchdogs can be used to reset a system.
+
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f7da867e8782..38d38564f47b 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
 obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
 obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
 obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
+obj-$(CONFIG_RENESAS_RZN1WDT) += rzn1_wdt.o
 obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
 obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
 obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
new file mode 100644
index 000000000000..0d3284a44dde
--- /dev/null
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/N1 Watchdog timer.
+ * This is a 12-bit timer driver from a (62.5/16384) MHz clock. It can't even
+ * cope with 2 seconds.
+ *
+ * Copyright 2018 Renesas Electronics Europe Ltd.
+ *
+ * Derived from Ralink RT288x watchdog timer.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define RZN1_WDT_RETRIGGER			0x0
+#define RZN1_WDT_RETRIGGER_RELOAD_VAL		0
+#define RZN1_WDT_RETRIGGER_RELOAD_VAL_MASK	0xfff
+#define RZN1_WDT_RETRIGGER_PRESCALE		BIT(12)
+#define RZN1_WDT_RETRIGGER_ENABLE		BIT(13)
+#define RZN1_WDT_RETRIGGER_WDSI			(0x2 << 14)
+
+#define RZN1_WDT_PRESCALER			BIT(14)
+#define RZN1_WDT_MAX				4095
+
+struct rzn1_watchdog {
+	struct watchdog_device		wdt;
+	struct device			*dev;
+	void __iomem			*base;
+	unsigned int			irq;
+	unsigned int			reload_val;
+	unsigned long			clk_rate;
+};
+
+#define to_rzn1_watchdog(_ptr) \
+	container_of(_ptr, struct rzn1_watchdog, wdt)
+
+static int rzn1_wdt_ping(struct watchdog_device *w)
+{
+	struct rzn1_watchdog *wdt = to_rzn1_watchdog(w);
+
+	/* Any value retrigggers the watchdog */
+	writel(0, wdt->base + RZN1_WDT_RETRIGGER);
+
+	return 0;
+}
+
+static int rzn1_wdt_start(struct watchdog_device *w)
+{
+	struct rzn1_watchdog *wdt = to_rzn1_watchdog(w);
+	u32 val;
+
+	/*
+	 * The hardware allows you to write to this reg only once.
+	 * Since this includes the reload value, there is no way to change the
+	 * timeout once started. Also note that the WDT clock is half the bus
+	 * fabric clock rate, so if the bus fabric clock rate is changed after
+	 * the WDT is started, the WDT interval will be wrong.
+	 */
+	val = RZN1_WDT_RETRIGGER_WDSI;
+	val |= RZN1_WDT_RETRIGGER_ENABLE;
+	val |= RZN1_WDT_RETRIGGER_PRESCALE;
+	val |= wdt->reload_val;
+	writel(val, wdt->base + RZN1_WDT_RETRIGGER);
+
+	return 0;
+}
+
+static int rzn1_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
+{
+	struct rzn1_watchdog *wdt = to_rzn1_watchdog(w);
+
+	w->timeout = t;
+
+	wdt->reload_val = (t * wdt->clk_rate) / RZN1_WDT_PRESCALER;
+
+	return 0;
+}
+
+static irqreturn_t rzn1_wdt_irq(int irq, void *_wdt)
+{
+	struct rzn1_watchdog *wdt = (struct rzn1_watchdog *)_wdt;
+
+	dev_info(wdt->dev, "%s triggered\n", __func__);
+	return IRQ_HANDLED;
+}
+
+static struct watchdog_info rzn1_wdt_info = {
+	.identity = "RZ/N1 Watchdog",
+	.options = WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+};
+
+static const struct watchdog_ops rzn1_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = rzn1_wdt_start,
+	.ping = rzn1_wdt_ping,
+	.set_timeout = rzn1_wdt_set_timeout,
+};
+
+static const struct watchdog_device rzn1_wdt_dev = {
+	.info = &rzn1_wdt_info,
+	.ops = &rzn1_wdt_ops,
+	.min_timeout = 0,
+	.max_timeout = 1,
+	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
+};
+
+static int rzn1_wdt_probe(struct platform_device *pdev)
+{
+	struct rzn1_watchdog *wdt;
+	int ret;
+	struct device_node *np = pdev->dev.of_node;
+	int err;
+	struct clk *clk;
+
+	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+	wdt->dev = &pdev->dev;
+	wdt->wdt = rzn1_wdt_dev;
+	platform_set_drvdata(pdev, wdt);
+
+	wdt->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt->base)) {
+		dev_err(wdt->dev, "unable to get register bank\n");
+		return PTR_ERR(wdt->base);
+	}
+	wdt->irq = irq_of_parse_and_map(np, 0);
+	if (wdt->irq == NO_IRQ) {
+		dev_err(wdt->dev, "failed to get IRQ from DT\n");
+		return -EINVAL;
+	}
+
+	err = devm_request_irq(wdt->dev, wdt->irq, rzn1_wdt_irq, 0,
+			       np->name, wdt);
+	if (err) {
+		dev_err(wdt->dev, "failed to request irq %d\n", wdt->irq);
+		return err;
+	}
+	clk = devm_clk_get(wdt->dev, NULL);
+	if (!IS_ERR(clk) && clk_prepare_enable(clk))
+		return PTR_ERR(clk);
+
+	wdt->clk_rate = clk_get_rate(clk);
+	if (!wdt->clk_rate) {
+		err = -EINVAL;
+		goto err_clk_disable;
+	}
+
+	wdt->reload_val = RZN1_WDT_MAX;
+	wdt->wdt.max_hw_heartbeat_ms = (RZN1_WDT_MAX * 1000) /
+					(wdt->clk_rate / RZN1_WDT_PRESCALER);
+
+	ret = watchdog_init_timeout(&wdt->wdt, 0, &pdev->dev);
+	if (ret)
+		dev_warn(&pdev->dev, "Specified timeout invalid, using default");
+
+	ret = devm_watchdog_register_device(&pdev->dev, &wdt->wdt);
+	if (ret)
+		goto error;
+
+	dev_info(wdt->dev, "Initialized\n");
+
+	return 0;
+
+error:
+err_clk_disable:
+	clk_disable_unprepare(clk);
+	dev_warn(wdt->dev, "Initialization failed\n");
+	return err;
+}
+
+
+static const struct of_device_id rzn1_wdt_match[] = {
+	{ .compatible = "renesas,rzn1-wdt" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rzn1_wdt_match);
+
+static struct platform_driver rzn1_wdt_driver = {
+	.probe		= rzn1_wdt_probe,
+	.driver		= {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= rzn1_wdt_match,
+	},
+};
+
+module_platform_driver(rzn1_wdt_driver);
+
+MODULE_DESCRIPTION("Renesas RZ/N1 hardware watchdog");
+MODULE_AUTHOR("Phil Edworthy <phil.edworthy@renesas.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

