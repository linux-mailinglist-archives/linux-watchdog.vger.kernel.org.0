Return-Path: <linux-watchdog+bounces-3957-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF17B1A9E0
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 309CA17E6F3
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB0828B7FF;
	Mon,  4 Aug 2025 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeRfcNQA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E3C28B419;
	Mon,  4 Aug 2025 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337455; cv=none; b=aRhiOEf3Ldy8w4FAlGMQP1785ahgZztqFsM4JsYgnKSsTIdVCPzssJoPNsPQ/lezdDppAVjraZQ9ghyT0plArW2ujGrF6+7T33yEbsXqz6AK0QA6xAsIbbWxp+fbaxlxwefNenbPr5sQO2nnelMVKTkYmaUc8Viw4fqTwBFsx28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337455; c=relaxed/simple;
	bh=O7gMG9LJRqG3JH6h9IN9KjpS2FyuQb/JeOXs1HIfKLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDfCltJZigoEDTsIYxO22HBjMRKmEEueGdUTqPUGnIIzQeku4tAUX5gYyVOxJf1726vcxtjSrzkkncbfQN2dijOIqYtJ40cZRcGcRPqOotQXJVhyUfEko8g1BX+947J37OwqJwKpJgOeD+mcM+RIKkXOQMtT6cQoMssAS7pCi/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeRfcNQA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so34279315e9.3;
        Mon, 04 Aug 2025 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337451; x=1754942251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95qdUjFCrM5xDIVpXvypofLT3arjC/swnbpIHBLpTnE=;
        b=GeRfcNQAyfltvGhNrpEDzyh2D9HNEbPYlpU7DS8gq07IO7iF6K9DzNP7ZEL6aLi9/0
         7ZYd2uNtoDAF2baU1MjrqT9gz0y5K3GkaDVmXA+RgSChUy20ZhBthfeNfGx77z3EilgH
         Fyq7/TphHDHuXHzJhW2XqVKHrgWIpXlV0hcE/IW532RfMxdKgKM5/xQJJFcoh+dIyuuL
         4Km7kuUGib79rhChSjGpbVNd6Aetq6k4TiMNAFwPvUV453dbw01qR/jK0jiGZUFeU0yp
         +gyZ06DoKfm9eHq1FRpcy+kD3tdQ13VtCI4QUrG9duujMUYdySrP4D0ynWPEMN6MC2bT
         ZwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337451; x=1754942251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95qdUjFCrM5xDIVpXvypofLT3arjC/swnbpIHBLpTnE=;
        b=XWCK11Wl2k3ZZW/ZGFWvNP4mS7+BJPLJqaYK43OXWg/EHt1We9xLqu2+W4k1z0j/t3
         7NYMP+iYw4tvDxYyeMChwHA0c8lIPsyRGS2XwUd0z0d40+3jHA0jehv4LoMbfyZUXXea
         M+M5RVy7w1rRn8fbNPQRQ49TfFGMoUpgP5awgE8GQVZYWH/wEMCu0VoJOICMDVgQY5eZ
         PqXKmtAAaa8MuJbh+y0JE0gObUXxjWKrZq7eRbCgASnX95VwWMvvQBCAwQZGlsDxX89I
         kJxmg+ApyFSddNtmKOsMqJAiKio2gNVdO2MjHOSzhkwaI/ATgT5CjBpGySlaes0YZKPp
         gVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR4XMVxaSecw00ppGgWC8Jef/Wyz+f3WJwvmIoqmmOXNEVa6nixFW9WCIB9jns7X3wvkeOCiOHRRHgWkyHupyAH8E=@vger.kernel.org, AJvYcCWI5gL8hGwVieuUlFzQleJKCBN9QgBF3q6kU+BnteVbzOWoBLgYoWpenDgxBGUWfKcH22IUuTsLklgc@vger.kernel.org, AJvYcCWi8m9j6rjiPnbR0DCQNUqFPSNxi1ABUoLVPFukeh8lFPYJ/FybWcE85EgFvO2c+Hon3cXdCJBGaZK2L5Nf@vger.kernel.org
X-Gm-Message-State: AOJu0YzYomYe+11A71JgapJAwqnPM+ZmFB2ruYRvYmLuJAJiBTApW/wQ
	ynLZ1FqilsKNdz6jV8zVpr2FrcPPdlkDJBv1VqihjHmE5kLdWCT2OqqC
X-Gm-Gg: ASbGncvsF1CE9HlEYVpiaejqkLGCLS98MJv5W/cq7nUlyMyGiF53dDoy46EqCTJLp8a
	vDicLpHjRkkpWbgQT1NDKT7mcM7Ds9lDiQ9Ki74jzakliZxMNbznBfYF2CwcLZr/0vMxP1gKJQR
	c5Vf7yABc+pZM0rAQjm1CbNRQBw/CE4Zba1asLGpjCPChhtuozx2YLFu39nVcIgE/WM7eLCQXAD
	b9a7f89cQiHeYtwipb8OCfRT7pdZxzw4zA245YAWPyk3bH12/BK2K1np77nHTl5MHGNO/3W2Cbc
	BzkTIFq3M7oKzvePawaiR5g4kjSQ7XB+kEvdnbL6HC6T7taAhCoptQLOxAH6dHTLnZALTP5F1wi
	fMBfWnrcGLP3hX0rIRgFqO1ZzZdwi0F954CgDYf75VXr88Jk4O1UoQOB6GQefz5GgbHdAW4Jd2A
	==
X-Google-Smtp-Source: AGHT+IFauweegyNNoTilGo/HPL9252kHPQykuiNPyCcHk6zfWoMBXYfdcYM6CG84hwWA28uoBs2HVQ==
X-Received: by 2002:a05:600c:3b22:b0:459:da76:d7aa with SMTP id 5b1f17b1804b1-459da76d970mr31218435e9.25.1754337451259;
        Mon, 04 Aug 2025 12:57:31 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/6] watchdog: rzv2h: Obtain clock-divider and timeout values from OF match data
Date: Mon,  4 Aug 2025 20:57:19 +0100
Message-ID: <20250804195723.3963524-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the rzv2h_wdt driver to fetch clock configuration and timeout
parameters from device tree match data rather than relying on hardcoded
constants. Introduce a new structure rzv2h_of_data that encapsulates
minimum and maximum clock select values (cks_min and cks_max), clock
divider (cks_div), timeout cycle count (timeout_cycles), and the
timeout period select bits (tops). These values are provided through
the OF match table and retrieved via of_device_get_match_data() during
probe.

This change allows dynamic configuration of the watchdog timer for
different SoCs, such as the RZ/T2H, which require different settings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Updated struct rzv2h_of_data to include tops and timeout_cycles.
- Updated max_hw_heartbeat_ms calculation to use the new struct fields.
- Updated commit message to clarify that the change is to obtain
  clock-divider and timeout values from OF match data.
- Added reviewed-by from Wolfram.

v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..755067800ebb 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -35,9 +35,6 @@
 
 #define WDTRCR_RSTIRQS		BIT(7)
 
-#define MAX_TIMEOUT_CYCLES	16384
-#define CLOCK_DIV_BY_256	256
-
 #define WDT_DEFAULT_TIMEOUT	60U
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -45,12 +42,21 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+struct rzv2h_of_data {
+	u8 cks_min;
+	u8 cks_max;
+	u16 cks_div;
+	u8 tops;
+	u16 timeout_cycles;
+};
+
 struct rzv2h_wdt_priv {
 	void __iomem *base;
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
 	struct watchdog_device wdev;
+	const struct rzv2h_of_data *of_data;
 };
 
 static int rzv2h_wdt_ping(struct watchdog_device *wdev)
@@ -84,6 +90,7 @@ static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
 static int rzv2h_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	const struct rzv2h_of_data *of_data = priv->of_data;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(wdev->parent);
@@ -106,8 +113,8 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 	 * - RPES[9:8] - Window End Position Select - 11b: 0%
 	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
 	 */
-	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
-			WDTCR_RPES_0 | WDTCR_TOPS_16384);
+	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
+			WDTCR_RPES_0 | of_data->tops);
 
 	/*
 	 * Down counting starts after writing the sequence 00h -> FFh to the
@@ -184,7 +191,7 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	 * - RPES[9:8] - Window End Position Select - 00b: 75%
 	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
 	 */
-	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
+	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	rzv2h_wdt_ping(wdev);
@@ -213,6 +220,8 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->of_data = of_device_get_match_data(dev);
+
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -230,8 +239,8 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * CLOCK_DIV_BY_256) /
-					 clk_get_rate(priv->oscclk);
+	priv->wdev.max_hw_heartbeat_ms = (MILLI * priv->of_data->timeout_cycles *
+					  priv->of_data->cks_div) / clk_get_rate(priv->oscclk);
 	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
 
 	ret = devm_pm_runtime_enable(dev);
@@ -254,8 +263,16 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
 
+static const struct rzv2h_of_data rzv2h_wdt_of_data = {
+	.cks_min = WDTCR_CKS_CLK_1,
+	.cks_max = WDTCR_CKS_CLK_256,
+	.cks_div = 256,
+	.tops = WDTCR_TOPS_16384,
+	.timeout_cycles = 16384,
+};
+
 static const struct of_device_id rzv2h_wdt_ids[] = {
-	{ .compatible = "renesas,r9a09g057-wdt", },
+	{ .compatible = "renesas,r9a09g057-wdt", .data = &rzv2h_wdt_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
-- 
2.50.1


