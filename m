Return-Path: <linux-watchdog+bounces-1186-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA191554E
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Jun 2024 19:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 663D21C224D7
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Jun 2024 17:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490A19F472;
	Mon, 24 Jun 2024 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr/oJjat"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AE7604D;
	Mon, 24 Jun 2024 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719249950; cv=none; b=foOoNbzcvxsyOjGczW5lb9Ev8LLLXWzSjZ2Vx4hoSby3V/G7YDHDSEUn0iYbHke0DzLoOvEyZ0dm6r8SU1L/LctiBlr7jAYFRX4xXJcH6izVAtaBRXL6FKXZ1nfNDh3pk7MRm8O8OJqYqYeNXAPXTljmR/cys60OA3KEJcf6ly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719249950; c=relaxed/simple;
	bh=/vSEh/f9mAe6QHXHJr/MHCcGUf/sv/rw9DC35rnJP7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWY1SGMRkjsbabiBazxTXaqUqTGuj1siTf2n9tWKOUInxNs2pFOoH6y0TalESONhp9wTsZo00OinL+lS2fXMFeSsBKG8s4RxMBY6Cr/YJtJBi5alXxdEc3czqWYy5i5iw8ZPf9yASxYcOyTuygC38CZseQl1TGCKVMNUDyPd7H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr/oJjat; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42198492353so38408875e9.1;
        Mon, 24 Jun 2024 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719249946; x=1719854746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAVTttRs5PidrklmuY1fGR9c9bOT7On0ewI0MWZLvUQ=;
        b=lr/oJjat6nql48NALJQUUcVF13H2Gg95hZdJ6IaYbVXpvCuiIYqmXMf10B4zbmRTuZ
         SrWpcQpCJC1YBU1/Fk+dOkULup+dlziZRzpi0SvsP8mJTljkrVl8m6FCoJ3AqGm65DTu
         H/LJgSLE1A61jYcne3e9pn8axBr4GOuEQNH3PAUBvijcYJpAiMVVKqXP5RyrrPrsksNX
         lncitabSXmUnijsMAmnxa87Qxa4oRF7H7DV+56nRZf54FGjTDAzCtETTWNQB0rHSRE86
         rOo8625d3bmoWfk5AQ23KRj5Hslf2QJKBwqTtkDDXoTDzuRXttc3/RwoORk5MRh34GHy
         XoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719249946; x=1719854746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAVTttRs5PidrklmuY1fGR9c9bOT7On0ewI0MWZLvUQ=;
        b=ucVKMfKW6g5cycyVyOStdHuunBBXhclLeQE1SSCa+ySti4s3FCd0nyxbwT9/+N6EBm
         kPCbsJZ2HQmkw2v9m/HY1cfUcFSyh0LvhVhRl5wZF0IkiPe+AWNq9tzpXP5vp/p+zXZQ
         H2WX9JVR0xzuPLpz10VqYxXzkAm4zl2YmGx/ffuNPTU+pIx8v1EiQAQQh7n1UbtH/Bgf
         3VZuNOi8Loq7HqI/6HzISpaBXFv+s6+Yw0Y5o3nSL0sSQd0pFWvKXXUPFFfGXUlN3zfm
         PsEogW5K9TXZsNGCyovCXGnOUy/uru8hAoq9XOb1LTazcx/fUbSrM0U7MhP+2PVvNsln
         yFKg==
X-Forwarded-Encrypted: i=1; AJvYcCXU1/EGW42a/GMoSCxdTePBjvO+ZukXAAuh2u9uGR5CBx+jhNW2xAXCjJYsqRyKtZwQd1iaB9jRUzvVUqHYBC4Ezk++Vij5RW5TQ0epSeMu4vT36Tb74B012BDOVvjXhVkamRM1AcjcSAlWWvkiKOuymjd4UQrH993E+1zZuJQVFoKhubuoLGUwLWRq
X-Gm-Message-State: AOJu0YzBHSeYyxZi+IFHhoidgHAwSXNpS8OWqVLxr7Ma9Hs1UkE0OfNK
	Iv9f/6rfcti2PsL7mjmyh7baHpsbK9CQZbyAd74UzoQHmpAMYTFW
X-Google-Smtp-Source: AGHT+IHGovGNqn/ueDNjrgNKu9+GXPwXx/qlZT0HcCA8CJVyQcHdUv0/qw216/itNhHB4ejUsgX10w==
X-Received: by 2002:a05:600c:4883:b0:424:90a2:2ff4 with SMTP id 5b1f17b1804b1-42490a25f49mr27624805e9.2.1719249946397;
        Mon, 24 Jun 2024 10:25:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481921f16sm140555005e9.41.2024.06.24.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 10:25:45 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
Date: Mon, 24 Jun 2024 18:25:09 +0100
Message-Id: <20240624172509.106912-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624172509.106912-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240624172509.106912-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Stopped using PM runtime calls in restart handler
- Dropped rstc deassert from probe
---
 drivers/watchdog/Kconfig     |   8 ++
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/rzv2h_wdt.c | 251 +++++++++++++++++++++++++++++++++++
 3 files changed, 260 insertions(+)
 create mode 100644 drivers/watchdog/rzv2h_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 85eea38dbdf4..e5a7aaa2edcb 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -938,6 +938,14 @@ config RENESAS_RZG2LWDT
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
 
+config RENESAS_RZV2HWDT
+	tristate "Renesas RZ/V2H(P) WDT Watchdog"
+	depends on ARCH_R9A09G011 || COMPILE_TEST
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
index 000000000000..c950d73ee7a8
--- /dev/null
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -0,0 +1,251 @@
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
+	struct clk *pclk;
+	struct clk *oscclk;
+	struct reset_control *rstc;
+	struct watchdog_device wdev;
+	unsigned long oscclk_rate;
+};
+
+static int rzv2h_wdt_ping(struct watchdog_device *wdev)
+{
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	static unsigned long delay;
+
+	writeb(0x0, priv->base + WDTRR);
+	writeb(0xFF, priv->base + WDTRR);
+
+	/*
+	 * Refreshing the down-counter requires up to 4 cycles
+	 * of the signal for counting
+	 */
+	if (!delay)
+		delay = 4 * div64_ul(CLOCK_DIV_BY_256 * MICRO, priv->oscclk_rate);
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
+	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
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
+	int ret;
+
+	ret = pm_runtime_put(wdev->parent);
+	if (ret < 0)
+		return ret;
+
+	return reset_control_assert(priv->rstc);
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
+	if (!watchdog_active(wdev)) {
+		struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+		int ret;
+
+		ret = reset_control_deassert(priv->rstc);
+		if (ret)
+			return ret;
+
+		ret = clk_enable(priv->pclk);
+		if (ret) {
+			reset_control_assert(priv->rstc);
+			return ret;
+		}
+		ret = clk_enable(priv->oscclk);
+		if (ret) {
+			clk_disable(priv->pclk);
+			reset_control_assert(priv->rstc);
+			return ret;
+		}
+	}
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
+	rzv2h_wdt_ping(wdev);
+
+	/* wait for underflow to trigger... */
+	mdelay(500);
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
+	priv->pclk = devm_clk_get_prepared(&pdev->dev, "pclk");
+	if (IS_ERR(priv->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk), "no pclk");
+
+	priv->oscclk = devm_clk_get_prepared(&pdev->dev, "oscclk");
+	if (IS_ERR(priv->oscclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->oscclk), "no oscclk");
+
+	priv->oscclk_rate = clk_get_rate(priv->oscclk);
+	if (!priv->oscclk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
+
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
+				     "failed to get cpg reset");
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


