Return-Path: <linux-watchdog+bounces-3832-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F49AFBC29
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B7C1AA80D5
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EAC22B8A5;
	Mon,  7 Jul 2025 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Keiz0CQu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604321E098;
	Mon,  7 Jul 2025 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918485; cv=none; b=KfghoFSYfRLchDZpuwMueV3i1/omSOlptU/kiP06GLPNMEqd3BL5ZqVNy27FSo3tWjOkWz62py1ShlI7HfkmxJpX15eU7t7k/xzrVcYGQfdNDX0+6i6zftzENm5SwN1pgV+XcYapomuvSwvUSspdpCGWtIOY8r2WDqUtq93CDtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918485; c=relaxed/simple;
	bh=4lmK5H5FTLM5fVLs5snSbjXGVL+7VYM6oP9exb/h0es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ie9JOBloCTORZxSkL0tHmAE5GBohnCuz8ZM27wfGfJP4CZxeZY/51fUaoGTIzv8p5vNl8h8MGJscMjISwSXloA/6wKrSLKG+67ftppMqIqJYSK/b9RDeQ9+2EMRX4mlFdxr2z1kRAXFln3RbDVagsi0+Q8hhkHe7g31v9EuHajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Keiz0CQu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453398e90e9so24529395e9.1;
        Mon, 07 Jul 2025 13:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918482; x=1752523282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/kwCuB4RTIwn+d7r5g8B9awVScIvJKrhWRX83EqinE=;
        b=Keiz0CQu0Vg1QlxAWRLXs/VK3/U1vrOeE0NbMSE8UPWnSBizlSt9pU50k28o4YdqMN
         e2knC//bj+8g37OCvoThXCrL4tJLwgN4Lhz9VMaeXKzOREn8R4g+7o4vTyAMarDKeNQj
         VBOrQCzwu+8PGCsHA+vy+fjT1kYl7g67PvOS5lcxxVsUSF13PA5TrVB6Ge9sl97J85NQ
         avU0fKmg908ru/1dGZOjVGllGGj/JQPWzIcWDd38yUyPsGFV+7yyeEg5Ju6qH+9khk3W
         /Ov19627V9u534Mhbq+4nu3zYotZNuFfjLM8JdXnkj2G3Xgi8wGbML/1ICX75qwD7oDh
         ia6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918482; x=1752523282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/kwCuB4RTIwn+d7r5g8B9awVScIvJKrhWRX83EqinE=;
        b=T/h/s8lz1gPob4K0USvJdK37adtFx23NJcTOegHkEO+I/Kpi+u6flBNpnP8Fsm5lwW
         tDgN9sk2TCSwvGmjchFmStYLH/JRmbWxCysVbmD9Rn5r7jtiEfDMvq8E9vZnV9ksbrzi
         pBBb22PK4UBWGUcS1XwUbB7CpsHBPgaAuNGmZ/fA/3hSCqjQs+O4k4lnjmEryPFtsHBD
         +kEk2i2US1wLhh9crfpwFfwIPEh269b/bb+5GhvOMWCoHcUwbcuTiR5F7QQ138W2Cjms
         YiljhoI5D2IYoPt3OwcP+W6FMonP7H41t+j7rIg8HQnp55HTkZcqiX58d5/tnUUqSdja
         uH+g==
X-Forwarded-Encrypted: i=1; AJvYcCUVAYjba/PnEdRa/ox3eQTbsSpvWjEiOI0qcxKVtu3QeEwkApAFDrqiPNPuF37ZSTAw64B04Qwd+/6vk23yHQg=@vger.kernel.org, AJvYcCW3O8f4Gz3nbkkULO4CtQlzoxP0M2/pO/bERHb5OCjJJDdXbHMCr3gkwsRRjCFVt60w4q+lJjZar+Ut8c0=@vger.kernel.org, AJvYcCWp3alftrkuD+bApgE1C7Wl8K3Bt2S1uuTOqvxwPi7EwdJclJTmn1NWYC5bvGYM/M40f7IC/1diPlm7L6A2D0np9X4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7k3NdknuM+0hYJALJd+E5rYNpTwLZYVp1fZTYIMdrlKJsibwe
	TaOYFFPD9W+XR1z9zqsjXJ2aw/v3hZxIB4/npcaYZFDnrWPNVtRiec2g
X-Gm-Gg: ASbGncu1u7I82/y30wKihorMJg3xi0xUVXFv/utIShr6sMdgLdBHHHlLeymagtbUj71
	yRKxOjjSs60rE2LE+VEkSUnD+Jo8eTG5TtlHXUOoeghhGNZbA3WnqXJfc/qEmEn9SgvNs+vVekw
	kS5SQEEM8vnWs81YaA+vTRnDLhd0XYFdEETpcGcIk1CHzaf2U5PLFpemsU1mwJMaxmf35YohARu
	DzXBI2CopRsUKr81yjkormzse1yO95OeUoV1n196bfZiG0Ah/UszNXwEA5KzM1BuztlKv2ubG5w
	/SPjqZnZWUhvN/62RUUVkewt2ZNrI8LZe1WO2fi7YU75KCm3d/GYavlK1HFTuwLA5eS17Uhi3lz
	RS9ZEBW19Ua8TvMaxEA8=
X-Google-Smtp-Source: AGHT+IG9nktah2TRCvvPkN6TvRcs8DyouEWw3ogE870zPPJzDoQQwS6p4bajVo+HkNKZi8GuVlz5eg==
X-Received: by 2002:a05:600c:1e02:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-454ccc4a47emr8622835e9.19.1751918481702;
        Mon, 07 Jul 2025 13:01:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:21 -0700 (PDT)
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
Subject: [PATCH 5/9] watchdog: rzv2h_wdt: Add support for configurable count clock source
Date: Mon,  7 Jul 2025 21:01:07 +0100
Message-ID: <20250707200111.329663-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for selecting the count clock source used by the watchdog
timer. The RZ/V2H(P) SoC uses the LOCO as the count source, whereas on
RZ/T2H and RZ/N2H SoCs, the count source is the peripheral clock (PCLKL).

Introduce a `count_source` field in the SoC-specific data structure and
refactor the clock rate selection logic accordingly. This prepares the
driver for supporting the RZ/T2H and RZ/N2H SoCs, which differ in their
watchdog clocking architecture from RZ/V2H(P).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index baf9d64510b9..cb584ac5860f 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -44,10 +44,16 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+enum rzv2h_wdt_count_source {
+	COUNT_SOURCE_LOCO,
+	COUNT_SOURCE_PCLK,
+};
+
 struct rzv2h_of_data {
 	u8 cks_min;
 	u8 cks_max;
 	u16 cks_div;
+	enum rzv2h_wdt_count_source count_source;
 };
 
 struct rzv2h_wdt_priv {
@@ -213,6 +219,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rzv2h_wdt_priv *priv;
+	struct clk *count_clk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -238,8 +245,18 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
+	switch (priv->of_data->count_source) {
+	case COUNT_SOURCE_LOCO:
+		count_clk = priv->oscclk;
+		break;
+	case COUNT_SOURCE_PCLK:
+		count_clk = priv->pclk;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Invalid count source\n");
+	}
 	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * priv->of_data->cks_div) /
-					 clk_get_rate(priv->oscclk);
+					 clk_get_rate(count_clk);
 	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
 
 	ret = devm_pm_runtime_enable(dev);
@@ -266,6 +283,7 @@ static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 	.cks_min = WDTCR_CKS_CLK_1,
 	.cks_max = WDTCR_CKS_CLK_256,
 	.cks_div = 256,
+	.count_source = COUNT_SOURCE_LOCO,
 };
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
-- 
2.49.0


