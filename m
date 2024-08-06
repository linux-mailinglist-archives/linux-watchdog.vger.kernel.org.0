Return-Path: <linux-watchdog+bounces-1465-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24609499DA
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 23:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5801B282E4A
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 21:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7729E16F29F;
	Tue,  6 Aug 2024 21:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTGTRR9r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B216C6AB;
	Tue,  6 Aug 2024 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722978415; cv=none; b=fUNDt0SwvsOiYo7uwzk1ULyepcquqmORSm3I9aJhqYza2Mkoxbl1ijYdMmewNZr2L7hzDKAp6HtviC5ip+VgMULRn1UGeo5aDR70ylBJaDeNpjOrZf7l1l2P1t56NVRUMhzhCsr2w57zw6pfQjYCM5o6J4ZqxaulE62k+8jTjuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722978415; c=relaxed/simple;
	bh=KC5ozMFF/deddcw7jRpLt9y5S1T8VUC1PyGXj9G14E4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bXa8K0dyoOtapJ4CeZ2WDgcH/Q4OkIKbdvWowJRYKk+qkoh/x0LLRISmVyVLLnfIcKpAgI5E0ATnmLgj1ceVuL57T8qbVWRkGkF5yF5aE49k13WQe/Nh9J9eRYZaROrQwzFgANPfOy44Csfl39ZHiRLdcvGOhF11SFmRdOO6LvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTGTRR9r; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42803bbf842so10766185e9.1;
        Tue, 06 Aug 2024 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722978412; x=1723583212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1O5XJyCQsO0a3iVyQNgTWC2/z5n7gNQZLw/w3cy8Xs=;
        b=LTGTRR9r6UsyFhIgq0hDtRkPuiw5g66q3tQ9IzN4vJhbNQv1cYUY+psDuxVtB6o3Tf
         DOkr0PJDoXg/Gu5kBGHW4oOREOVtS//RHp1Og3qLc6m3ZtoNyR3mgVlnLH9IZlQm9W9V
         jG2RQazEg7P1YMSafLRFCR1sRmuElxcAX+Rkiec5+mvk+g6lhx5iSDGiyLUKhFP0TYwW
         GLSZSeyTc8OUa/YrE9z1oOd0RxD9zI84XBydKXSSmUz4QAmaLhZQtPrqY6gr0AOtlNmn
         WwSpbTo83a9kQvI2BK7Agl7Rb8uHNq1Q7ESD3GOfjW+Zuv1BAg4I4ep+hBePmPBO7JFf
         KLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722978412; x=1723583212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1O5XJyCQsO0a3iVyQNgTWC2/z5n7gNQZLw/w3cy8Xs=;
        b=ujiwBA61pV05j1058FZiutH9UhwJbghJ6gPfaLXDfieHAwYAcOdVDEUlgs7IIrwwUu
         2BfZXkIVL8gCWJ8FgczlDzjwxIBphRPRUnQMBzOi5Vwp+69s/4T66QO804187XvAPyJC
         XWtmZAc5ffkpXVgl2CF955nbvVqkL71G9v436N6KqUduKcxDShdClwScmi8OBFn59ffu
         Akb2YldOY/NuhMataOpvrNqTafXI4ez7YsakSiPUQQd1PnlLm03b2UhSCkXCSkB6PzIH
         wvUjfTPofwQhdb9EtCrhgtZUmVoAotDfR7SdK92udRkoflulbXeDZpVH8AKy3JhtaCEf
         O6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUBTglkFntM2npy+6HaErEV/6JI5AdemMtBdV2lltoE/rh9jp+btiC0Xg3X5ot/xKogz6uKDuttVZ7N1R9uC6faF0jL9dgXUSTxiZTEM/sv5/fysKwhsQeOc9Pldpmp73IyrVqrXMCMRqbejtRqIRk54JYMl9biQ5YWFDBSEL0ZZjkE/MuXsVosPKR4y49izA==
X-Gm-Message-State: AOJu0YxoVruF9AAHwszFnjXi/TXqBWCJgUaVhgjfUXHOdB/k+mUaktDf
	B4q6KsmT0QBz2vcKCzrEr7oYWsrcnjnyJjQALMti4qN6UBYCypCc
X-Google-Smtp-Source: AGHT+IEucDVJEF/FtO/tiitIgeNVi8GMKclHhEXGHsd7CZi/QfdItPtCAk8l7VacyTmrOJOgGJ1d+A==
X-Received: by 2002:a05:600c:3504:b0:427:f196:c549 with SMTP id 5b1f17b1804b1-428e6b7e954mr156026855e9.23.1722978411281;
        Tue, 06 Aug 2024 14:06:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42904f92a2dsm1384025e9.2.2024.08.06.14.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:06:49 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
Date: Tue,  6 Aug 2024 22:06:23 +0100
Message-Id: <20240806210623.183842-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


