Return-Path: <linux-watchdog+bounces-4018-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FCB2E66E
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1523B5484
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B0D2C237F;
	Wed, 20 Aug 2025 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g118oula"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FF92BE048;
	Wed, 20 Aug 2025 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721411; cv=none; b=N2uIDN/2vH6zgZJ7xMsXRqNySpyc9yv3pHUp7+gQW0bhd/m4uHHFc7ycXFfggfzLSk7XelODF9FAH71Y9f233jB2nLZSEcdi1Niv22D9GQ/IdRLB1hrepKFY6Oia3QmVo7TM3FNOsG+k7fhWfsMSZpj6gCOWZUcNLzejIyqOSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721411; c=relaxed/simple;
	bh=CjjwHUmo36KbpZcoW9susR/nTVVNkUUG+7qTeq4vuJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNIGQfSI0CRvOWzzuC4Jl50JdmaONU0mZP6/se7+dbSJ7mpy5DH4/Cv4c6terghtcMnlTIeG2GT9r7Q3NjNsx9s+V9/VyIPZ33WYOqlOwPqp4B4VEms1HLJwDNsor2doTyURAqP6HF63OYrXXSQ4tMz5RXbU7wgxECXsbXgRTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g118oula; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso210073f8f.0;
        Wed, 20 Aug 2025 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721407; x=1756326207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr1iFcvHB55MEbh11M6+C4Bj3+1ragxm6Wtrs+MkHRw=;
        b=g118oulayKA42YXfQuB5kmzwZFtKXBPzGOvsAEf7TeVZ3+mIA1Fs6pX0al1ab/CGTk
         T4fud/aUU78QOuZ7Z3T6rC8OJ9b/Us1vqfJgTes0KEiEoO84PpO5y6vZLoqxAyoOsxHR
         S1yznWK3P1nrUKkuFNHlGExAlNEy8UwxJRdDdD2v+EiBhNngEy9Gx8H/t01TBPLtK37x
         eO8dIO65ImN+xoIXY9/D3ouHGnIWx+wcM5IaooNpVMQFF1gFL+pvaFmwWgs+j7sLrZjW
         ZwdLpWhcpKWEqR5bIbgGexl50FNYR5kJeHvojSEOmQeNirHweigva/02tlEulf16M9Ji
         VAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721407; x=1756326207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr1iFcvHB55MEbh11M6+C4Bj3+1ragxm6Wtrs+MkHRw=;
        b=ut9aJ2TpsiDSi9nJgWwqfHAkVIlce097kxfhKExkEtH+QPob6CrGEjVy7xZrsAdG0k
         7JaUtFO6tZZnCIk3v5o6V7aFPOcwyWBSAAp97G9PUq7Nj+94lrrjtwiNy1DcoBHUmGog
         PCPdfDRi3u+Ha4s37TvseAXCEngWNCYhVsPzbZBrA9F77zDGMlG0yuwY2O+7D9OxYWNk
         kK6XLguPoVcrLrYd48HcP/vLIZJWLLoK15uIhytPRMcVcNTV0tw5z100hMK1N2hs+d66
         v/YSVuO4ZF+XGWy/8oWWO/gbR2g94DI+d9r7T69tKZFlBhfqr9jkCR5BefY2ZcFdtCHZ
         mXZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV48XRneHELfOE0iu6wNoaCvBb5CJDmpyaa1Wdfj6TvChDbVcOy3BNaQGx/zsxe5kskfXtaAHX+n/RF@vger.kernel.org, AJvYcCWiaOnIoPe8FvFmR2OLon3TI95yol/WuY3OF2G/FixaABQPjVRCXZ/cfYxqX2AcjFE4gEj4/qup2iYUgvhi@vger.kernel.org, AJvYcCWtNtV0th9DZb8qGvOFfZkQ1ouPswbRkF352nQ5qlWuJJEOF3CMb2LokkKPQSOjcGsZppv7KNBDhKJvpzWK2MVWJUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVf5sksmAYDKcO2jkfLT2Fws1zg+UKJhzG05cG0m8+seWeJgWa
	g4TtTvIZeF9A8I8chm6enl6oPFXcTQ75WR/xV1RP9LWZILGytuO60gM0
X-Gm-Gg: ASbGncswlFNP4uL92ABWqp13T0e3ioIB+slIL5Pzv1P0R8NlDmHcP5HC0w/Z0an9fN0
	1qzYMQNHQN3JSh8WFPRHnNNqNuimeK5bH+wa55Sm+DlQJqFvXE8TbZkvKy1byl0d66qI1r0uQw/
	OGlJSayTH7Xy1KlCMCK+kTy1F03Mv8W6rO/rzDsOKpC3kQJSjbPGXA2i9PjocemLlRg1cHDN4fK
	MrlJxM0e8tNiBhYQ6C/GHHZkQSwxvCsw0HuHB66pFPw0rmjV7U3i+LLDUJfna+u8O7wU32RrBdy
	3M4CVAlBWvf71jmFCF6qM0XUkiqu9NRwbEhpCeOmutClSqY0ucaPMoOWFiokyOEvxXmOhHsvmhB
	d6kkl3IBrj1XDB8xdvq04oroQu7h80+NSnaGaxuObcrzIIYnLm2qE6tyI
X-Google-Smtp-Source: AGHT+IHh9GJVypBRo2SRQEfhHtQe/PRkU8wT4DU6oYpIDsWWAre3075S3lOi3Tm/SH4mm92vftThnQ==
X-Received: by 2002:a05:6000:4403:b0:3b7:910d:8054 with SMTP id ffacd0b85a97d-3c45f0da276mr452334f8f.11.1755721407260;
        Wed, 20 Aug 2025 13:23:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: [PATCH v4 2/6] watchdog: rzv2h: Obtain clock-divider and timeout values from OF match data
Date: Wed, 20 Aug 2025 21:23:18 +0100
Message-ID: <20250820202322.2051969-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- No changes.

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
2.51.0


