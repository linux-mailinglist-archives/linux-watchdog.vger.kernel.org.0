Return-Path: <linux-watchdog+bounces-1634-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C2964F2A
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 21:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53BF1F211BE
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 19:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43CE1BB680;
	Thu, 29 Aug 2024 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTOguPDR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2601BAEC8;
	Thu, 29 Aug 2024 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960329; cv=none; b=tnSRvsM01fuaGH4rDrX/Mr7ExxExvInFqzTslyYu137fBA+yg/KwgtiCC1KzSHF+4ZrnSBAiqXecSYvHVV+uyUdNRpjXHzW09QYaroKmTDIWfO3Z/mvFmK+ASxLB19va2dA+mlCn32Vnkiu1ivrfu5c6p5hJx2QJkI61X0EJs50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960329; c=relaxed/simple;
	bh=W4epz5aDmv6U1NLOP5QkEYtlC6Yx6N3VhoJcWSy+RBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZP608wcKJTp8eun6g3kXyJA0U3P5aTTA/SXAQqUWZTafvuetV+FjR/dgQAUi/Qhxru9KbQxgXQfZHkG2HI+58kJENFGDKcOdOq9pCvv/5IFJ0IptrxEAa+ieEPD4bgevU1ltiRG+xuw544e6wl28LmJ7vAIVM9bfs4fd+Spigtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTOguPDR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-371c5187198so647221f8f.3;
        Thu, 29 Aug 2024 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960326; x=1725565126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmJ3uoNesBVlL8LJG2PwbBt6QgGjpRJlMiaccw0L+8A=;
        b=BTOguPDRj4kw/nJlx4GZ1YO0oG0gSMD/R6DEaxfTs+UvpO0TTO2/vX3Qz2spAf+5cg
         3GMRQLvjlSRlCRC7An7MQDfc1b3tDDnsJfM5S29F/GkCrYRPLA2rVQDG50cK0C/mw0Fy
         Hs12jjPTF5xjJs7bA7m4GzkwYuSMxphKeKt/vQFSwi60IIAN1KPjvH7m7rJUr54BSWJC
         HPB0FSjyDnB8mv0fwNYF4ESXN/Dk6HjOjcuixpnAIBsj91+/P7y9fOk9mqRb3ryaKKp1
         PQzW28PspnKdOLbTwdQVYVCWz+eJ4cLV/f1mralvFKyuWE5bbDCrB1sHgI2XZbiNT79O
         nxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960326; x=1725565126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmJ3uoNesBVlL8LJG2PwbBt6QgGjpRJlMiaccw0L+8A=;
        b=hpFCe9KBaHn03/FO5RNFGMjiLA+AlId9DzQ90ZPBMsDpx+oLZggqO1PN8+d1xRXTbI
         sKPtOBpMRURnzGmOIPSnzELiELLqBe89VSvnXW63psZmq3PYfFE26oYpS4GxqK8NegWl
         XCfmdefo0YZv3tNFxIs9H8ek/utYd+RTd6j8IvykY0wSNMCY5MVCoHlHOUTCbLJSNNiz
         QzAeuWeXpWM3sg3l5awgHiuZE/dr0lJGgIj5/jP13Sbq1659XSCGriP02L8RW61Bjs8/
         9PqXWMFGMJyn9lFcyNtvIh+falPfh8p0r9Ugoq0hplquP/Wjev0iPJ0u0gntgkOcla/l
         eORQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD5eJOUEtFMQy9++Uqosh6Ghz/nmWZFp0P3Y98b1o4VoKNN23jCpYFTcAqfv9UAO9Dxd3pNRlKuCmIQL1e@vger.kernel.org, AJvYcCXC0mQ5nyHw+oBRQE65xsc8+YIAMPzoS9G7OxgEffltTVIj6Nr9hgy7TrlVJtCEIbctSTIVh73AZkU5VqwLTVSokaI=@vger.kernel.org, AJvYcCXwKOjKm71bMJ3cmtPYui7PH3uNITTFZJYD0DpYRWCWnLiyyiMUsy1AvACD2HzowIiSReSRPULgHdB/@vger.kernel.org
X-Gm-Message-State: AOJu0YwiB6WUiUn8YLL2Qp1sJtvCK0nAm344bO0HpseFl17ZMEhMqS9r
	eLIvHgqs2RJ8jis5jD4rC+q6xwc5PiqLJ+d2rWLLF3WYMAXQJhFg
X-Google-Smtp-Source: AGHT+IEVGSIn7FwxgnqajHXyzrP9CTluLgrL/DGCEkaq6RT0Orjud+iTOEW9QuZh7FJI/QOfFG/Z6g==
X-Received: by 2002:adf:a3d9:0:b0:371:937a:326c with SMTP id ffacd0b85a97d-3749b5867c1mr2286829f8f.57.1724960325319;
        Thu, 29 Aug 2024 12:38:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a26f:c074:4086:5001])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb2c91sm2140049f8f.102.2024.08.29.12.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:38:44 -0700 (PDT)
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
Subject: [PATCH v5 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
Date: Thu, 29 Aug 2024 20:38:31 +0100
Message-Id: <20240829193831.80768-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
v4->v5
- Collated RB tag from Guenter 

v3->v4
- Turn on the clocks first before reset operation in start & restart callbacks
- Added checks in restart callback before turning ON clocks/resets
- Dropped udelay after every ping operation
- Added comments
- Simplified calculation of max_hw_heartbeat_ms

v2->v3
- Fixed dependency, ARCH_R9A09G011->ARCH_R9A09G057
- Added dependency for PM
- Added delay after de-assert operation as clks are halted temporarily
  after de-assert operation
- clearing WDTSR register

v1->v2
- Stopped using PM runtime calls in restart handler
- Dropped rstc deassert from probe
---
 drivers/watchdog/Kconfig     |   9 ++
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/rzv2h_wdt.c | 272 +++++++++++++++++++++++++++++++++++
 3 files changed, 282 insertions(+)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bae1d97cce89..684b9fe84fff 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -953,6 +953,15 @@ config RENESAS_RZG2LWDT
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
 
+config RENESAS_RZV2HWDT
+	tristate "Renesas RZ/V2H(P) WDT Watchdog"
+	depends on ARCH_R9A09G057 || COMPILE_TEST
+	depends on PM || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This driver adds watchdog support for the integrated watchdogs in the
+	  Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a system.
+
 config ASPEED_WATCHDOG
 	tristate "Aspeed BMC watchdog support"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index b51030f035a6..ab6f2b41e38e 100644
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
index 000000000000..2da7a631fb2a
--- /dev/null
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) WDT Watchdog Driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corporation.
+ */
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
+#define WDTRR			0x00	/* WDT Refresh Register RW, 8  */
+#define WDTCR			0x02	/* WDT Control Register RW, 16 */
+#define WDTSR			0x04	/* WDT Status Register RW, 16 */
+#define WDTRCR			0x06	/* WDT Reset Control Register RW, 8  */
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
+#define WDTRCR_RSTIRQS		BIT(7)
+
+#define MAX_TIMEOUT_CYCLES	16384
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
+	struct clk *pclk;
+	struct clk *oscclk;
+	struct reset_control *rstc;
+	struct watchdog_device wdev;
+};
+
+static int rzv2h_wdt_ping(struct watchdog_device *wdev)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	/*
+	 * The down-counter is refreshed and starts counting operation on
+	 * a write of the values 00h and FFh to the WDTRR register.
+	 */
+	writeb(0x0, priv->base + WDTRR);
+	writeb(0xFF, priv->base + WDTRR);
+
+	return 0;
+}
+
+static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	/* Configure the timeout, clock division ratio, and window start and end positions. */
+	writew(wdtcr, priv->base + WDTCR);
+
+	/* Enable interrupt output to the ICU. */
+	writeb(0, priv->base + WDTRCR);
+
+	/* Clear underflow flag and refresh error flag. */
+	writew(0, priv->base + WDTSR);
+}
+
+static int rzv2h_wdt_start(struct watchdog_device *wdev)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret) {
+		pm_runtime_put(wdev->parent);
+		return ret;
+	}
+
+	/* delay to handle clock halt after de-assert operation */
+	udelay(3);
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
+	/*
+	 * Down counting starts after writing the sequence 00h -> FFh to the
+	 * WDTRR register. Hence, call the ping operation after loading the counter.
+	 */
+	rzv2h_wdt_ping(wdev);
+
+	return 0;
+}
+
+static int rzv2h_wdt_stop(struct watchdog_device *wdev)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_put(wdev->parent);
+	if (ret < 0)
+		return ret;
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
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	if (!watchdog_active(wdev)) {
+		ret = clk_enable(priv->pclk);
+		if (ret)
+			return ret;
+
+		ret = clk_enable(priv->oscclk);
+		if (ret) {
+			clk_disable(priv->pclk);
+			return ret;
+		}
+
+		ret = reset_control_deassert(priv->rstc);
+		if (ret) {
+			clk_disable(priv->oscclk);
+			clk_disable(priv->pclk);
+			return ret;
+		}
+	} else {
+		/*
+		 * Writing to the WDT Control Register (WDTCR) or WDT Reset
+		 * Control Register (WDTRCR) is possible once between the
+		 * release from the reset state and the first refresh operation.
+		 * Therefore, issue a reset if the watchdog is active.
+		 */
+		ret = reset_control_reset(priv->rstc);
+		if (ret)
+			return ret;
+	}
+
+	/* delay to handle clock halt after de-assert operation */
+	udelay(3);
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
+	/* wait for underflow to trigger... */
+	udelay(5);
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
+static int rzv2h_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzv2h_wdt_priv *priv;
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
+	priv->pclk = devm_clk_get_prepared(&pdev->dev, "pclk");
+	if (IS_ERR(priv->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk), "no pclk");
+
+	priv->oscclk = devm_clk_get_prepared(&pdev->dev, "oscclk");
+	if (IS_ERR(priv->oscclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->oscclk), "no oscclk");
+
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
+				     "failed to get cpg reset");
+
+	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * CLOCK_DIV_BY_256) /
+					 clk_get_rate(priv->oscclk);
+	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
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


