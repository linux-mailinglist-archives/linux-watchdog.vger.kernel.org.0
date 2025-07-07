Return-Path: <linux-watchdog+bounces-3829-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D8AFBC1B
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7ECD3A8DC8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAF121C9F9;
	Mon,  7 Jul 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH8lqmC6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A581F3BB5;
	Mon,  7 Jul 2025 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918482; cv=none; b=mfijwAy5okZRtLMzmT75FGWepsgI/xqSF++7Xof/RjLqO18d6WsGWKAECva3tBw4JgGw8ckh5sDIS0yIlQhjv0pofbtGfomumOaKkowFUnu/N9uPqalHajmfXb7LQi73CCPa018yZBhZVvrNe3YX4D78ehyrdMvsK8ul/kERzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918482; c=relaxed/simple;
	bh=V6IQ2gg8theLQKhy0pSAfQIVT4+2x1DClOMYvHnbKTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugn7t77eBlqpKoZWQ2WzITQDeNn7UxwNTNNtmUFu5FdnQi3FeqfdFBuPzhJsrtGRwJAu1sQP2StmgGgyUQCiOoBUoDBtlf3mzU3dnL5N8Af7BgxEekPd71Ham9ouEcOQ6/1BBCMzJqL7r9AF3JhyZUrSbx4cyHJT18uY/U/44mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH8lqmC6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-454ac069223so22865075e9.1;
        Mon, 07 Jul 2025 13:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918479; x=1752523279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LP8bmMp57OA6IhQ6YmNAhKyLYtPMaSr+eZSmls4pM8M=;
        b=dH8lqmC6soXAKbaBmdXG5iOa8BVf0+egejy30Y8E0xIxvarm4a1Jt04VGYNpiUTZuy
         YrdyscwmSZoE4Zc3L8EQlbeHGpw1X/irsSgJcXr3ve/S3R0ud3hui9oepNLK/F7agyJp
         Mz2odF2iyy7ThVV5aEVbE4y4MQC1JKtCjDvTU70FrcowEPjKDOS+6eiJQf6/fG9b3rp+
         npiKlXKbSXcUMuEBtEnzUmxUrOo7fOauI5Qiv58kMWKQ2t0+gNtUz/JAt+3dG0rFf0JI
         6ArRaG7MCeXxwwh393b9jx4ASJRE2OhnQxyz8rbZAP4gefMHx4ZKfzLYwUIbKut0OGtQ
         WAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918479; x=1752523279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP8bmMp57OA6IhQ6YmNAhKyLYtPMaSr+eZSmls4pM8M=;
        b=wLeMAK9jbcKvKME0fynd5LCSIAAWIdb9oR6mGshyID72SONHXiKNkTAiuiREW5eB8H
         ARZu2kH0Dy+HNuVc+2qF7CRxzugAea157j0aB8zFPqtOC1Q8EFSwmfiOU1NG29gStY/B
         ilTYVwzs4r5gdlkQ2Z+X+cUpPbG7KC9jbX67gkxyFakqCo0yJ7vsClaVbWwYgE7LnCeM
         dYcTIp9A7fyqQNiSMywNA3o+M7N3TZMSIUpKAmIc9g+X4Tzb5rFTj9xU4LOTBkhwKvVb
         R5L8GUKFCuAFcAcYJcASgpHO1XA0UvGd3LCwbnQO0SWz1qo5RS1J9YMo8llqCskLnmuL
         WtGA==
X-Forwarded-Encrypted: i=1; AJvYcCUIBzOU4G8e7cskC7BlCt7mC05HJFD4OZVCaY2z1ne0kPjXH4PPSoNPrzTt+sx2wo2RWokcWQpv3blcQ+WHPKS/vRg=@vger.kernel.org, AJvYcCVOgsSKkOqxEZprvwaUqN1atgTzuEPftSBUwm3OYaSZBLqF4OK1iL2M3Fm7IJ0Bk5vx1b5p5LU75ywP92JV+L0=@vger.kernel.org, AJvYcCWniAtRQZDHnwTikOqb96/+Vd5zHd9uwTsZR3W4r5bFvAkhWw/St2Xu47cvwjGCxiUOjgPooYOrBQarHuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCac2z4I5qm+X7pxv26JO6umAFbhlzj2dKYQciSUxQiom7HjI
	WtbZ7S9xHy8+14JVSdUm6KE3TWv9j7YlIRP0WOZQoegItQUKnIuBKrPl
X-Gm-Gg: ASbGnctTlN+ouhusG3ySU1n+J0mDCoxVmlMOEdghPifATpF4lQvSPqGXor+u4JGnIBh
	nTkPpePbNPR95+cxDZ1wQfnrWiUANmlv5f+CQYI2B6AiBPdy0idXlYusXygSrPKMNHrS5Axu5jq
	lByho50vCuAnLnvnab1xIu1A4mGy6KpY957hlvQh2ImZbsGGLG5T7l1uOD8iCH284BN9GVtlSPe
	oFlrZJ/LE2avJ/P3u+a1tLcelvkNnOIficmbN548Yeyz46itSei0a8riq9i+XTMtB0iLPlk+GfK
	EZo3KXgRcbEsS+bNMVgwozXjv7/YV55wJrKka3ETo1HSv4lkhltzlkPalVTuSVSTmne/fe/o0tU
	hfvEp02ROb0+jmllhIkc=
X-Google-Smtp-Source: AGHT+IErr9J27PXfYeZhimqyOaDoekqacPSEV+vEQRLL/v5ULwP2Kxqx3EaJZU6S+5WtEKbFalI82Q==
X-Received: by 2002:a05:600c:3e85:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-454cd691516mr225575e9.12.1751918478674;
        Mon, 07 Jul 2025 13:01:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/9] watchdog: rzv2h_wdt: Obtain clock-divider ranges from OF match data
Date: Mon,  7 Jul 2025 21:01:04 +0100
Message-ID: <20250707200111.329663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the clock division ratio values into OF match data instead of
hardcoding them in the driver. Introduce `rzv2h_of_data` to hold `cks_min`
and `cks_max`, populated via the device tree match table. In probe, call
`of_device_get_match_data()` to retrieve these values for setting up the
watchdog.

This refactoring is transparent for existing RZ/V2H(P) usage and
facilitates adding RZ/T2H support with different divider ranges.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..d64d29709160 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -45,12 +45,18 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+struct rzv2h_of_data {
+	u8 cks_min;
+	u8 cks_max;
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
@@ -106,7 +112,7 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 	 * - RPES[9:8] - Window End Position Select - 11b: 0%
 	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
 	 */
-	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
+	rzv2h_wdt_setup(wdev, priv->of_data->cks_max | WDTCR_RPSS_100 |
 			WDTCR_RPES_0 | WDTCR_TOPS_16384);
 
 	/*
@@ -184,7 +190,7 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	 * - RPES[9:8] - Window End Position Select - 00b: 75%
 	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
 	 */
-	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
+	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	rzv2h_wdt_ping(wdev);
@@ -213,6 +219,8 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->of_data = of_device_get_match_data(dev);
+
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -254,8 +262,13 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
 
+static const struct rzv2h_of_data rzv2h_wdt_of_data = {
+	.cks_min = WDTCR_CKS_CLK_1,
+	.cks_max = WDTCR_CKS_CLK_256,
+};
+
 static const struct of_device_id rzv2h_wdt_ids[] = {
-	{ .compatible = "renesas,r9a09g057-wdt", },
+	{ .compatible = "renesas,r9a09g057-wdt", .data = &rzv2h_wdt_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
-- 
2.49.0


