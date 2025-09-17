Return-Path: <linux-watchdog+bounces-4254-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB7B81660
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 20:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409361C26C79
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 18:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E6D301009;
	Wed, 17 Sep 2025 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X6hml2Yz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E23009CD
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Sep 2025 18:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758135426; cv=none; b=JO2VwN0mXrPCVldCY25tMCC8imYDJAsI0ZuS4ZyiAqrN7Stsba1lsmpvqSFsKcgWKIYzaNRv01FGOX7o+cKroCRQ5YqIrIjRhnSe69DCQRw2UhfuwnDdY4DizGIg6f+0EHnjEH/GHQl863bwRevC0HbewWexH9gqR1v1Pf2bEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758135426; c=relaxed/simple;
	bh=3Han6siJWDtUocI92DUtCmQZ6dFhvQQhj2JyD0GrOxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P37kV5treKrSPFAPJXSF0eSUu1DHdonxrZGeILpErmDSlmEJn4YgtypV6RDLPsnbUi03a2BVWD2ghkyF61pAiEMW4dEcXItoGXJuUyL+9aZluXTkMy+uqlap1Bo7WWB94nhLZ4RrsXPCpZhY7tq2eZvZ/0IPxRFSn7jVhmw94dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X6hml2Yz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=XNygAcceJph3pXz8p/481ySnQNAFtRHl0H/S0lMu37s=; b=X6hml2
	Yz2ey/lsp4Dk5YG3SSP94KLK1rM3e/w0i5gdOxA2smlL7+q5y96wad9Mzs2mP+r8
	fpag/E1IPT6DtzriLcUsHHSC64ihG+oHX8nHVriz+LyW3cy3nCxAHoW3rdhz7ojR
	zza/fo4UtawnwjH3NlOk9y0sJOOL9WBQHsplH7Ma7oNTM9JtcJpP5X3USF6401BW
	+G2NrpcBnr1m1CsOlnyxDXYkj7lsvnfjJijtom6X3zwCwIH69hyR73B05bpSP8cy
	Us0aEI7Yt42N8cTRakaC4OWzHvagsciDZhf1ucVyySJnA0Fk69qchizFGqNLVUq/
	LF0rOZghuslUhQCQ==
Received: (qmail 3239087 invoked from network); 17 Sep 2025 20:57:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2025 20:57:01 +0200
X-UD-Smtp-Session: l3s3148p1@Co49zQM/csUujnvK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 2/2] watchdog: renesas_wwdt: add driver
Date: Wed, 17 Sep 2025 20:56:49 +0200
Message-ID: <20250917185651.12428-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250917185651.12428-1-wsa+renesas@sang-engineering.com>
References: <20250917185651.12428-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver adds support for the Renesas Window Watchdog Timer (WWDT).
Because it can only be setup once after boot and we cannot know if this
already happened, it is mandated that the firmware configures the
watchdog. Linux then adapts according to the given config.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/Kconfig        |   8 ++
 drivers/watchdog/Makefile       |   1 +
 drivers/watchdog/renesas_wwdt.c | 156 ++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/watchdog/renesas_wwdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0c25b2ed44eb..8d59dad28e58 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -958,6 +958,14 @@ config RENESAS_WDT
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
index bbd4d62d2cc3..4f9aea38e96e 100644
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
index 000000000000..0cd47e4213a5
--- /dev/null
+++ b/drivers/watchdog/renesas_wwdt.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Renesas Window Watchdog Timer (WWDT)
+ */
+
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
+	.options = WDIOF_KEEPALIVEPING | WDIOF_ALARMONLY | WDIOF_PRETIMEOUT,
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
+	wdev->max_hw_heartbeat_ms = 1000 * interval / rate;
+	wdev->min_hw_heartbeat_ms = window_size * interval / rate;
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
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");
-- 
2.47.2


