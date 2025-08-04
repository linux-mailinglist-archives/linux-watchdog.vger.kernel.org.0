Return-Path: <linux-watchdog+bounces-3959-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CBB1A9E7
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4029917E722
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4A528FFDA;
	Mon,  4 Aug 2025 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8pnKW/I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F128C2D5;
	Mon,  4 Aug 2025 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337457; cv=none; b=F2vuXM+baAk9naU3xgPwrmz5eqtTalL+3x50qcQrIMK4DKwBn0X/wpSMufBQ/R7vpbgnXMD4VbGVGGwc/6e0sIv3Bx/II9Wz4rZDIinAfYVcIEbe/GNwIaWh0o4mFQnNrb7rHef/XjSPVuquTMeDMWh3k6JMUJTHjhWtS/Kz6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337457; c=relaxed/simple;
	bh=42boYoMG/y4QAR+iec8aaKmpyPux2/tMdZkEBgsF6iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtuE2OHGKK/UOgN+/1gDT8rfdNa0GinbtYaKeCXqbDlPFE64yr/QTPmaV4Qaw986vN44KzoJ1BMhbvVtg/hgk+ef/9DWS6bwXaO+hZsI1v/nT1/8i3TYOwspapDv9pV49Se94gBUhUf6i+K30jY6B65HvjuKBqiWU1oZ39XvE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8pnKW/I; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45994a72356so14905735e9.0;
        Mon, 04 Aug 2025 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337454; x=1754942254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=age55wbZhUILPh9ylrfGSynJrjpmIlO2XVYgrke2dNo=;
        b=E8pnKW/Ix/SMwdV+gQ7emtLULiJQFDg1N5ffltJI6zR6qQHK9cwwmBF0O8Ubh9qGTQ
         O0+jumgu2UA2ttxRL8lmr5m2n5yPvd9K/OecO34+su5NLEMSuZ7DeNFFTOXeeg8dWz+D
         JlOIkT3cxEejymTHTD+iyFSCJhnBOyAWehcGnrN9ft3f6k1nGOTa9x4Z5pbv3V+LOVv5
         3VUmp+k5ni1tSyLxrsx0Jj7KFC3bSJO8MEjznHkkMqjAtRuyHsnmO/4NtaKZYkZSbqhh
         AjXh4xJZbWva3srOHmwyg9uKP/qVoaIwK13vf8Bk9Vsf48LheAc5ykvC+z5656rcDLYk
         Ss5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337454; x=1754942254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=age55wbZhUILPh9ylrfGSynJrjpmIlO2XVYgrke2dNo=;
        b=Yxk70o9MMeu/OOYbWUb/w3jVsau3K40RStYh6tERSSNBQvNeOVbZuTlDYrewGj8/2C
         gF/oU2t3+ksqrZL1D3x0MEcZygf4XvxNwSorVFbP45KaXGeVR3YS8UslmYJnMTiMNc3F
         ui7KHB6Y6RGw4o3c7rZNScy7VGfELpCbDmjHVTeh0EDw97AoSXcCtvmrDXVP61zCWbNP
         Yhum5nrAzG0gUbZiDepg9cuILNxSJe3uoXvbln04e/FSbYsbtvBffP6nZHW+8iA74GgV
         fTSbZ7VSxCpqnsqGWOdCOaECmwu2K9wrJRAqbRAzl4wpyUe8p9MKMDH+ObyoK63RgEtD
         iZTw==
X-Forwarded-Encrypted: i=1; AJvYcCU2q0PmjU3W5gGXX6uN3ksgpmRsh6Su/z9YL/V4hSxra2SqlRgj6iehvUmplhtfJp0qnnyMdSFFZcPr@vger.kernel.org, AJvYcCV2Eu7F3sdsn3FR9zAXTfAMc15v13cbQX0vyX94f0dvNwCpfbOsHG/DkOyHoMZ0GdbqTNlH4LVVgfyW8891gQfCCwY=@vger.kernel.org, AJvYcCWAhyeoQy/VxML+uWPP5Y/pfB3tVDeNC7cp3cKZMhM3k80Jc4qz9o32Gb9C3CFWMO2VIm5/QHUzyAyPx+rU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7VvtwaPOsZzm9ojuK0UaXLRIpP48UYmnf25Iqh6hBcVM/9x/
	5YTmmI8/bjfFC6F4tCnrL8TjKiSl3mdBFbvN8WiKup61OioZrgZSCgyo
X-Gm-Gg: ASbGncvPMODYSdGrdLBHVUOtD7ZVSprp9BwKT5UTGi7JIZF/9I0LGa+yn92WrXIhPu6
	yTrBk0WvhGRX9JGcY2o6jAlKrdPFCe/uMTfEmKDI2j76YAc/EBCifIFiQpcf+F1g8lO6mCbtmJQ
	79UELz4nd3DzGIK0sd7Ca5/R53wqhW090qrObH4dcPGG02k9oi+qZRAMiqcF+pburQLz59bPgr/
	16CpXoTHtmrNHWS2eWCuqlTm+SVrxgW8dSlfr06sJ4j0Ctah4Twqgi6h0akstJJK7x7p5/DQHyy
	r12ZU7jtWWRHf+U88906L10BrVOiXsSVrUyFQ9lj6EAXGdoxOPXUXu5HeQ8wxb34lyn8qz/OVdy
	LVHobP2KwhcyoaB04mKA3Z7fit/lhJEYJwBK/BM3QhJ/0nr73jeosBI2qEp0eB/fh5XiBThfeNQ
	==
X-Google-Smtp-Source: AGHT+IEagAU/Bnj1Ds7svrQ9UJcYaGd8BaxU8CmqdUxUKaMqT6oz8XaUBmvR3+urXT9ZVAB1gR1BFg==
X-Received: by 2002:a05:600c:b93:b0:459:dfa8:b85e with SMTP id 5b1f17b1804b1-459e0b2af38mr7787645e9.0.1754337454051;
        Mon, 04 Aug 2025 12:57:34 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:33 -0700 (PDT)
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
Subject: [PATCH v3 4/6] watchdog: rzv2h: Add support for configurable count clock source
Date: Mon,  4 Aug 2025 20:57:21 +0100
Message-ID: <20250804195723.3963524-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for selecting the count clock source used by the watchdog
timer. The RZ/V2H(P) SoC uses the LOCO as the count source, whereas on
RZ/T2H and RZ/N2H SoCs, the count source is the peripheral clock (PCLKL).

Introduce a `count_source` field in the SoC-specific data structure and
refactor the clock rate selection logic accordingly. This prepares the
driver for supporting the RZ/T2H and RZ/N2H SoCs, which differ in their
watchdog clocking architecture from RZ/V2H(P).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Added reviewed-by from Wolfram.

v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3c02960b65cf..e71d1e108f69 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -42,12 +42,18 @@ module_param(nowayout, bool, 0);
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
 	u8 tops;
 	u16 timeout_cycles;
+	enum rzv2h_wdt_count_source count_source;
 };
 
 struct rzv2h_wdt_priv {
@@ -214,6 +220,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rzv2h_wdt_priv *priv;
+	struct clk *count_clk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -239,8 +246,19 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
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
+
 	priv->wdev.max_hw_heartbeat_ms = (MILLI * priv->of_data->timeout_cycles *
-					  priv->of_data->cks_div) / clk_get_rate(priv->oscclk);
+					  priv->of_data->cks_div) / clk_get_rate(count_clk);
 	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
 
 	ret = devm_pm_runtime_enable(dev);
@@ -269,6 +287,7 @@ static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 	.cks_div = 256,
 	.tops = WDTCR_TOPS_16384,
 	.timeout_cycles = 16384,
+	.count_source = COUNT_SOURCE_LOCO,
 };
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
-- 
2.50.1


