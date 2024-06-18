Return-Path: <linux-watchdog+bounces-1167-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27990DF1C
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Jun 2024 00:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAEFC1F234A0
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2024 22:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24BB1849CA;
	Tue, 18 Jun 2024 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K50RuArS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2B178CC8;
	Tue, 18 Jun 2024 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718749468; cv=none; b=LRjLdDBUzhfh4kNKgCuX2eqMfP0Sr4BZxpQmurSpvE65FYYOeRRGyFK/25SqunZXSyaqq5ZXNjalLsPYLxS8vubb5dBhGtq+etxDJhu/owWT/1/zzZMoRjf3c3F5Ag4oKZDrch7gvY5JTWrtlGqHbXwwDf0LUYVBV3KH4gDJJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718749468; c=relaxed/simple;
	bh=PnupujgC1qwoaNcANVP4xnijpN+a90U657o7R3krZfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkI4yHljBZm48go78izxjPCOgzx1UYrYogVHYPyN/UKn9fcIfNZ7V3gELRK33g44FePk7SvGFgyYsHLH9qZwRFIqOiblf7wmWmD5gyCbm3nYSNXRBbfaS5H0RnwmHm26egiUAx0wTyDXzlnl6rY+5l8pkJDHant1Sqb4TYiIxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K50RuArS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42165f6645fso48567465e9.2;
        Tue, 18 Jun 2024 15:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718749465; x=1719354265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNPn8c71MIw9w3GH/klPVoaZ0Vb/hed/fABHhKRDv9k=;
        b=K50RuArS5K/io7YqaLouckDm1BxrLvgWszBa3UX4KHnnHfni2/194mBjP4AtFE8Dmp
         h7eiHkEMCTJrP9UID+2SZEdFq1QR2fzApCZwZLAE0ItbU1vrd9gjosJ/fu0X18quw/pq
         bm30wA+jAceRYirFdWDCfo5F3D9fQLMjFLC4fG5NEAMH9Yt2RRPAFub7igQzBJoY1Cut
         JKFvaekA5PGkkq6nPw2Ve/ognqdKFNG8jSWtNVtALCov2ob7VNr8x/AhlagDfpTUh0Xp
         +Y8jAR2TYytmOBLt36GPphUKeBcyY9I+zKgXJGQ4KmDEQwsuZ502ZmeY/FvH0v0VVxZB
         c87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718749465; x=1719354265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNPn8c71MIw9w3GH/klPVoaZ0Vb/hed/fABHhKRDv9k=;
        b=LCkDzfm6TJCWfm1y1nJdlXFHID7PhfwpYsulaFjjhq9m5fKhuDJv+GioLnGuGPYmw1
         k/dGGe7zp+jNSEniF8U5Oh+j5V30K4ah25jEUkqMvUV2it4s9mokDQ9ZBgpSGJPMsgZj
         iD3OspzXMaI4r6saYMzF9zaVZ30Ykb1HKScTZ9zv7PKKnLxa86P35Z/zPaU5DQa2TJrm
         zx0B5Zs5DBi4xUqysb7K7y368WhBPiUPTFXN/BVN8o47vGr+VrnhcJKA6sqxyoLHp5K6
         nnb18lpvj4Cy7UjRGMv4mYcjM3b7rdVBq3N+z8oAVEoalTW0fB8KsGoDG5HIdxxsO6zx
         lgYA==
X-Forwarded-Encrypted: i=1; AJvYcCX4FctD8sUYVvsUW6THhuHzsp7diCPeQ7ZPmqWvJu9hcbeGEbGMRBAgDsSGzahpZdNPDnDrAtr+mf7KdMj1QxHCD/EBAYMgsBuh63LrmNylN4KFp/4s8MqWmwFaKS8WCGcr5b2BrOURFS8Ptyy3UfRmdGngGSMPUlg52kPXb6iP9QqiTrrPgGavC1lr
X-Gm-Message-State: AOJu0YyoHLGnnAdZqrNOo6oh1AyYZvS2M2yvLIGXOnIOec+w6fa4ko6v
	Ogv1nQtiZN/5k8KcnoNt0Eh1p/aa3AUO8g5BcM/gk8EnRdceilOn
X-Google-Smtp-Source: AGHT+IGwFhge1wDpB8liES4gpZ7RHYk/LtG2saq+l9DiSnX+qmcoIK8X7oTf2n+AU0gFqi1RWd9/ag==
X-Received: by 2002:a7b:c355:0:b0:422:44b2:b295 with SMTP id 5b1f17b1804b1-42475293d5fmr5199035e9.25.1718749465115;
        Tue, 18 Jun 2024 15:24:25 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm15189697f8f.107.2024.06.18.15.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 15:24:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
Date: Tue, 18 Jun 2024 23:24:03 +0100
Message-Id: <20240618222403.464872-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Watchdog Timer driver for RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/Kconfig     |   8 ++
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/rzv2h_wdt.c | 248 +++++++++++++++++++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 85eea38dbdf4..3f7bcc10ccc2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -938,6 +938,14 @@ config RENESAS_RZG2LWDT
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
 
+config RENESAS_RZV2HWDT
+	tristate "Renesas RZ/V2H(P) WDT Watchdog"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This driver adds watchdog support for the integrated watchdogs in the
+	  Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a system.
+
 config ASPEED_WATCHDOG
 	tristate "Aspeed BMC watchdog support"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2d1117564f5b..295909a1b3b9 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
 obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
 obj-$(CONFIG_RENESAS_RZN1WDT) += rzn1_wdt.o
 obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
+obj-$(CONFIG_RENESAS_RZV2HWDT) += rzv2h_wdt.o
 obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
 obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
 obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
new file mode 100644
index 000000000000..08f97b4bab7f
--- /dev/null
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) WDT Watchdog Driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corporation.
+ */
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/units.h>
+#include <linux/watchdog.h>
+
+#define WDTRR			0x00	/* RW, 8  */
+#define WDTCR			0x02	/* RW, 16 */
+#define WDTRCR			0x06	/* RW, 8  */
+
+#define WDTCR_TOPS_1024		0x00
+#define WDTCR_TOPS_16384	0x03
+
+#define WDTCR_CKS_CLK_1		0x00
+#define WDTCR_CKS_CLK_256	0x50
+
+#define WDTCR_RPES_0		0x300
+#define WDTCR_RPES_75		0x000
+
+#define WDTCR_RPSS_25		0x00
+#define WDTCR_RPSS_100		0x3000
+
+#define WDTRCR_RSTIRQS         BIT(7)
+
+#define CLOCK_DIV_BY_256	256
+
+#define WDT_DEFAULT_TIMEOUT	60U
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct rzv2h_wdt_priv {
+	void __iomem *base;
+	struct watchdog_device wdev;
+	struct reset_control *rstc;
+	unsigned long oscclk_rate;
+};
+
+static u32 rzv2h_wdt_get_cycle_usec(struct rzv2h_wdt_priv *priv,
+				    unsigned long cycle,
+				    u16 wdttime)
+{
+	int clock_division_ratio;
+	u64 timer_cycle_us;
+
+	clock_division_ratio = CLOCK_DIV_BY_256;
+
+	timer_cycle_us = clock_division_ratio * (wdttime + 1) * MICRO;
+
+	return div64_ul(timer_cycle_us, cycle);
+}
+
+static int rzv2h_wdt_ping(struct watchdog_device *wdev)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	unsigned long delay;
+
+	writeb(0x0, priv->base + WDTRR);
+	writeb(0xFF, priv->base + WDTRR);
+
+	/*
+	 * Refreshing the down-counter requires up to 4 cycles
+	 * of the signal for counting
+	 */
+	delay = 4 * rzv2h_wdt_get_cycle_usec(priv, priv->oscclk_rate, 0);
+	udelay(delay);
+
+	return 0;
+}
+
+static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	writew(wdtcr, priv->base + WDTCR);
+
+	/* LSI needs RSTIRQS to be cleared */
+	writeb(readb(priv->base + WDTRCR) & ~WDTRCR_RSTIRQS, priv->base + WDTRCR);
+}
+
+static int rzv2h_wdt_start(struct watchdog_device *wdev)
+{
+	pm_runtime_get_sync(wdev->parent);
+
+	/*
+	 * WDTCR
+	 * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
+	 * - RPSS[13:12] - Window Start Position Select - 11b: 100%
+	 * - RPES[9:8] - Window End Position Select - 11b: 0%
+	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
+	 */
+	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
+			WDTCR_RPES_0 | WDTCR_TOPS_16384);
+
+	rzv2h_wdt_ping(wdev);
+
+	return 0;
+}
+
+static int rzv2h_wdt_stop(struct watchdog_device *wdev)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	pm_runtime_put(wdev->parent);
+	reset_control_reset(priv->rstc);
+
+	return 0;
+}
+
+static const struct watchdog_info rzv2h_wdt_ident = {
+	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+	.identity = "Renesas RZ/V2H WDT Watchdog",
+};
+
+static int rzv2h_wdt_restart(struct watchdog_device *wdev,
+			     unsigned long action, void *data)
+{
+	rzv2h_wdt_stop(wdev);
+
+	pm_runtime_get_sync(wdev->parent);
+
+	/*
+	 * WDTCR
+	 * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
+	 * - RPSS[13:12] - Window Start Position Select - 00b: 25%
+	 * - RPES[9:8] - Window End Position Select - 00b: 75%
+	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
+	 */
+	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
+			WDTCR_RPES_75 | WDTCR_TOPS_1024);
+
+	rzv2h_wdt_ping(wdev);
+
+	return 0;
+}
+
+static const struct watchdog_ops rzv2h_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = rzv2h_wdt_start,
+	.stop = rzv2h_wdt_stop,
+	.ping = rzv2h_wdt_ping,
+	.restart = rzv2h_wdt_restart,
+};
+
+static void rzv2h_wdt_reset_assert(void *data)
+{
+	struct reset_control *rstc = data;
+
+	reset_control_assert(rstc);
+}
+
+static int rzv2h_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzv2h_wdt_priv *priv;
+	struct clk *oscclk;
+	unsigned long rate;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	/* Get watchdog oscclk clock */
+	oscclk = clk_get(&pdev->dev, "oscclk");
+	if (IS_ERR(oscclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(oscclk),
+				     "no oscclk");
+
+	priv->oscclk_rate = clk_get_rate(oscclk);
+	clk_put(oscclk);
+	if (!priv->oscclk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
+
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
+					"failed to get cpg reset");
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert");
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       rzv2h_wdt_reset_assert,
+				       priv->rstc);
+	if (ret < 0)
+		return ret;
+
+	rate = priv->oscclk_rate / 256;
+	priv->wdev.max_hw_heartbeat_ms = (1000 * 16383) / rate;
+	dev_dbg(dev, "max hw timeout of %dms\n",
+		priv->wdev.max_hw_heartbeat_ms);
+
+	priv->wdev.min_timeout = 1;
+	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
+	priv->wdev.info = &rzv2h_wdt_ident;
+	priv->wdev.ops = &rzv2h_wdt_ops;
+	priv->wdev.parent = dev;
+	watchdog_set_drvdata(&priv->wdev, priv);
+	watchdog_set_nowayout(&priv->wdev, nowayout);
+	watchdog_stop_on_unregister(&priv->wdev);
+
+	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
+	if (ret)
+		dev_warn(dev, "Specified timeout invalid, using default");
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
+}
+
+static const struct of_device_id rzv2h_wdt_ids[] = {
+	{ .compatible = "renesas,r9a09g057-wdt", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
+
+static struct platform_driver rzv2h_wdt_driver = {
+	.driver = {
+		.name = "rzv2h_wdt",
+		.of_match_table = rzv2h_wdt_ids,
+	},
+	.probe = rzv2h_wdt_probe,
+};
+module_platform_driver(rzv2h_wdt_driver);
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/V2H(P) WDT Watchdog Driver");
-- 
2.34.1


