Return-Path: <linux-watchdog+bounces-4383-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEABD9087
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 13:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C9313524D1
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 11:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F8C30C377;
	Tue, 14 Oct 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hK3UBS0b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AA30C61E
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441430; cv=none; b=PBLChHVinryoiSlkAT39/gyCV+H3hsjgUpp2PuV/WHlWJ3pJ3kEMZvX5KG7QxUHJEyPH1FljWOHMH0vs5DzhpAsQtV2sUQwf7Rp69G1eCN5aY8XBFl/CLFZKh8b5mq+1IT++pYh69QGRKIoOGZA1Z3t8uHcJpVHE43Hd3Cyf23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441430; c=relaxed/simple;
	bh=JKkzunXJI7SSy9RFWCsKShj8+JF5EAwNZkgXDaVrd+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orOlfoJ/ivQmJ6RbRIso3wjOcHOy+qmBPO5NlgYUYb44BJF4C3YQMUnydvSl6B05NLZg28ZEgeo0qpPReL2zujAOLe2eq0OIOxHJldFzQlEDsMY1/z+2o7bhTzfzF3aOah2hFgY1trW/ObqLpRBruMUF/pQj/z1Udp9g5wJ3Tm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hK3UBS0b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=g3WYL2pzJuVi8WRchTtp/JyvwjnGTf7H9qfruNOIL5Y=; b=hK3UBS
	0bfW/mxoN58lvrvG0gKXlYcxev48VTPsfQ9eeDxhph5vUn/oR0L5G+kb50z4bNMM
	+EZu+c04koziIjrF9BLmN5N3DvRPZVIwZ1DtVb8rC6G97FHbHBGEJSU1x8Us3gue
	GAvkgNy0nR3P7+Muo/XMDqAPm7BWbY7tSu3p3jvdID1HfNqa8rd6rpVdTJigQ2XT
	BAhW33AQb2E7zMzwLsmZJIKv+X3KjXK21bthrY4JsGeKU+oiGPbt0/HuH4oTuK0P
	T8UNqqh5RlkshHZ+vprF0O3joZFr/gC7GxiOmxMXdt9vHMm+HnTQUwjmUbKW6miN
	rrsvcVlqQ1ETYCpQ==
Received: (qmail 2943715 invoked from network); 14 Oct 2025 13:30:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 13:30:19 +0200
X-UD-Smtp-Session: l3s3148p1@op5ztRxB8qwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: renesas_wwdt: add driver
Date: Tue, 14 Oct 2025 13:29:54 +0200
Message-ID: <20251014112953.25712-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver adds support for the Renesas Window Watchdog Timer (WWDT).
Because it can only be setup once after boot and we cannot know if this
already happened in early boot stages, it is mandated that the firmware
configures the watchdog. Linux then adapts according to the given
setup. Note that this watchdog only reports an overflow to the Error
Control Module (ECM) and does not reset the SoC on its own.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:

* support not only V4H but all Gen3/4 SoCs having this WWDT
* update commit message and add introductory comment to explain how
  this WWDT is handled as a "read-only" device basically
* dropped pretimeout flag because this feature cannot be configured
  from userspace
* added bitfield.h to prevent build failures
* switched to "GPL" licence string
* cosmetic updates

 drivers/watchdog/Kconfig        |   8 ++
 drivers/watchdog/Makefile       |   1 +
 drivers/watchdog/renesas_wwdt.c | 163 ++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/watchdog/renesas_wwdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 05008d937e40..792d0d831336 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -969,6 +969,14 @@ config RENESAS_WDT
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas R-Car and other SH-Mobile SoCs (usually named RWDT or SWDT).
 
+config RENESAS_WWDT
+	tristate "Renesas Window WWDT Watchdog"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This driver adds watchdog support for a window timer found in some
+	  Renesas R-Car Gen3 and later SoCs.
+
 config RENESAS_RZAWDT
 	tristate "Renesas RZ/A WDT Watchdog"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index b680e4d3c1bc..ba52099b1253 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
 obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
 obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
 obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
+obj-$(CONFIG_RENESAS_WWDT) += renesas_wwdt.o
 obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
 obj-$(CONFIG_RENESAS_RZN1WDT) += rzn1_wdt.o
 obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
diff --git a/drivers/watchdog/renesas_wwdt.c b/drivers/watchdog/renesas_wwdt.c
new file mode 100644
index 000000000000..0f56f5c7e407
--- /dev/null
+++ b/drivers/watchdog/renesas_wwdt.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Renesas Window Watchdog Timer (WWDT)
+ *
+ * The WWDT can only be setup once after boot. Because we cannot know if this
+ * already happened in early boot stages, it is mandated that the firmware
+ * configures the watchdog. Linux then adapts according to the given setup.
+ * Note that this watchdog only reports an overflow to the Error Control Module.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define WDTA0WDTE	0x00
+#define WDTA0RUN	BIT(7)
+#define WDTA0_KEY	0x2c
+
+#define WDTA0MD		0x0c
+#define WDTA0OVF(x)	FIELD_GET(GENMASK(6, 4), x)
+#define WDTA0WIE	BIT(3)
+#define WDTA0ERM	BIT(2)
+#define WDTA0WS(x)	FIELD_GET(GENMASK(1, 0), x)
+
+struct wwdt_priv {
+	void __iomem *base;
+	struct watchdog_device wdev;
+};
+
+static int wwdt_start(struct watchdog_device *wdev)
+{
+	struct wwdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	writeb(WDTA0RUN | WDTA0_KEY, priv->base + WDTA0WDTE);
+	return 0;
+}
+
+static const struct watchdog_info wwdt_ident = {
+	.options = WDIOF_KEEPALIVEPING | WDIOF_ALARMONLY,
+	.identity = "Renesas Window Watchdog",
+};
+
+static const struct watchdog_ops wwdt_ops = {
+	.owner = THIS_MODULE,
+	.start = wwdt_start,
+};
+
+static irqreturn_t wwdt_error_irq(int irq, void *dev_id)
+{
+	struct device *dev = dev_id;
+
+	dev_warn(dev, "Watchdog timed out\n");
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wwdt_pretimeout_irq(int irq, void *dev_id)
+{
+	struct watchdog_device *wdev = dev_id;
+
+	watchdog_notify_pretimeout(wdev);
+	return IRQ_HANDLED;
+}
+
+static int wwdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wwdt_priv *priv;
+	struct watchdog_device *wdev;
+	struct clk *clk;
+	unsigned long rate;
+	unsigned int interval, window_size;
+	int ret;
+	u8 val;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	clk = devm_clk_get(dev, "cnt");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	rate = clk_get_rate(clk);
+	if (!rate)
+		return -EINVAL;
+
+	wdev = &priv->wdev;
+
+	val = readb(priv->base + WDTA0WDTE);
+	if (val & WDTA0RUN)
+		set_bit(WDOG_HW_RUNNING, &wdev->status);
+
+	val = readb(priv->base + WDTA0MD);
+	interval = 1 << (9 + WDTA0OVF(val));
+	/* size of the closed(!) window per mille */
+	window_size = 250 * (3 - WDTA0WS(val));
+
+	wdev->info = &wwdt_ident;
+	wdev->ops = &wwdt_ops;
+	wdev->parent = dev;
+	wdev->min_hw_heartbeat_ms = window_size * interval / rate;
+	wdev->max_hw_heartbeat_ms = 1000 * interval / rate;
+	wdev->timeout = DIV_ROUND_UP(wdev->max_hw_heartbeat_ms, 1000);
+
+	watchdog_set_drvdata(wdev, priv);
+	watchdog_set_nowayout(wdev, true);
+
+	if (!(val & WDTA0ERM)) {
+		ret = platform_get_irq_byname(pdev, "error");
+		if (ret < 0)
+			return ret;
+
+		ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_error_irq,
+						IRQF_ONESHOT, NULL, dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (val & WDTA0WIE) {
+		ret = platform_get_irq_byname(pdev, "pretimeout");
+		if (ret < 0)
+			return ret;
+
+		ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_pretimeout_irq,
+						IRQF_ONESHOT, NULL, wdev);
+		if (ret < 0)
+			return ret;
+	}
+
+	devm_watchdog_register_device(dev, wdev);
+
+	return 0;
+}
+
+static const struct of_device_id renesas_wwdt_ids[] = {
+	{ .compatible = "renesas,rcar-gen3-wwdt", },
+	{ .compatible = "renesas,rcar-gen4-wwdt", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_wwdt_ids);
+
+static struct platform_driver renesas_wwdt_driver = {
+	.driver = {
+		.name = "renesas_wwdt",
+		.of_match_table = renesas_wwdt_ids,
+	},
+	.probe = wwdt_probe,
+};
+module_platform_driver(renesas_wwdt_driver);
+
+MODULE_DESCRIPTION("Renesas Window Watchdog (WWDT) Driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");
-- 
2.47.2


