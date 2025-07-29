Return-Path: <linux-watchdog+bounces-3920-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C353B1509F
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E74D546E55
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 16:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D7D299A8A;
	Tue, 29 Jul 2025 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6GBaRxn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50639298CD0;
	Tue, 29 Jul 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804770; cv=none; b=TH4kB3/ueNdTwykV6dLDizaMylUWyIUL0ezgKSFRL5G26g1p4Dg2eQBmzJ9ity1DMzZpuy0FygQdwL/DDhyiCEw5DNhU5tnLnsx+y8XvLBThfyVO+NDWgxOQFZBM4ThC4Z8kUW7TNb0q/XW7RF+rvwVKCZsQ2EjdEW749n5FN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804770; c=relaxed/simple;
	bh=HnO5nz9IOvhwcpw8eytPMjsK2aWttpRqp7cbarDWQ7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBTUp0sWzLjBcoAPLOF5MCKXyuCTmX4CCxApBEW/tCvkXpZrnepKo76I7f2VAkgHiZWLXVP7JH5K/cwZNjrCgFqvjF3KP2agMbwDhzS3Xmc3ElKsvwiQk1Q13n80B2snBeZq3bft6GLuNQG71wR1mfqpsQWnFb6UPEimN3pBTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6GBaRxn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so24117975e9.3;
        Tue, 29 Jul 2025 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804767; x=1754409567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruabpa0ltK5Lm5uR8TpxSi52H/diFH89uaQqlTWqPHs=;
        b=g6GBaRxnmDLzI9lCuEIwqSG6256/jM0MUdQ7bA4N2b5BcEFwE9nU+SCIHHvMydV9Bz
         FuwDpDJE6pqKi95O5+hvJK1SABr183K+nWlnAkzcWGoDWD1gA6Yh+iPYNsL80O4G0w5K
         zeRW0qBulPeVbWx/Ufr4rMr1PxcWwutJ0jMeVhUF4VMs17lj8D2jnJFGjBrKVNxaKCSz
         s8z2f38+23e0hjHXQ+RgqKG6XXN8Vzq5xOZCXWAsLO7Wgy/nJm7NvzWe3+HkNOBsyNL1
         ihY36q0TxFYJvbStPoUIehz5MlKwrO5bO5VW+c3SsKOiPjytHq8x27+4HmrstF64VIKr
         BlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804767; x=1754409567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruabpa0ltK5Lm5uR8TpxSi52H/diFH89uaQqlTWqPHs=;
        b=lm59a9SbTIRk2kUE304wNF5EfAmq4jAEv5qXCMoC6+fYTszLW69s1tAEO4Y/lcHTVu
         f4+X0IA2qfDpU6mVuhAc8GhFpIy5nJKxZejMLd5K17fhCDoalH4Nwez5im3VQz+9BMsR
         oUpPS3M4m4Bde8fjg7fnVRYKgS+oSkodns6t0NKbTtEyOZ+AJll6tTXO4YK09W2Vk5zR
         5Hle0CCu73D0zmOuoW2/bYfKRaN7oDgzTAZRv0ygBGL/JY3iH9kZxSel4HaNSfeH09Gc
         PWzN0R/iTwWKBxh8lRDAM7Cs+2rj+1tCswa+/0bMfIbYONIbUoxoUnSTOoyCFUnxKdoo
         5Iyg==
X-Forwarded-Encrypted: i=1; AJvYcCUdZAOEeWTyTKKNfNaHo4tg2oAtqmh+YQl7hPqh1r1JuAfCuXetPm4IEWG0HjfmBUfHq+qypeY73LYda1Xs@vger.kernel.org, AJvYcCVCV2yy/nBgjZAP1BQBs7FWSGn4t5JjySQIAf+ZZQdWJXIxqSS++swLtp+zmft0xrOejPUjwOg5YXaF@vger.kernel.org, AJvYcCWTgpm3j0j3tII7wB51u0392B96CDWL3agNAhypQp8hcPRaO/tRUtWoU5t3GZ+XHL5FlaHT9ca7TikblwLz8er3Iek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1YnqjS8iO3BY43Zpi+KMnN7EL6t4pBTo3Btc2J+3V2fPql4cg
	UvYIgBon+9681Tup4qwRYI03WtGT/HqM5SSNBWCtH499VgOjnMMDKvQd
X-Gm-Gg: ASbGncvA903XpM3/1qOMkD0U+5tw7li5AdJ5BsVHEhGxSUtctXq81YZZRBXZjbY0dH9
	RiOjd43DuOH4bsZBBL2XiV7vTrj6e7t0cbVia9RzsWuA8cCMbPH703lUXL1O1LbC7Jcoa+CrUbV
	caee0CYeVCkOf4UR0i4u6rA4uTtvuX35ogA/VMReLd+0P+GHBEVEgiklns/B0iJT9/t+YQ5h25/
	N9L8/hrQyJhcy8S8et/W9lvDo4ofwxQ4m/wxjeJE9i6uy9ptUS4ken4HAQ/hUwUDR6oZMexnSFZ
	fO6ITuRIrHu42h2GRCGKC3oH961RlhvZ0EUJhZmciYQu9caTfjbwlg1UuLmxCEKoYpOVflFuHfM
	eL9eeLlJUFFwQHdCse9lomvPSluNHliAzCpJH+oSGM8b5GjCXUzbTRx2QiDWG0V3xPw1nWPwVyn
	DyZSbI65t/
X-Google-Smtp-Source: AGHT+IHaOhU/mBedspEm3DiLop96zCzxMCflfEOkgbh1MwpkPDOFnNRPwlJFe1xw1/z9fePZ90mJ2w==
X-Received: by 2002:a05:600c:8b81:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45892ba3686mr3590825e9.15.1753804766553;
        Tue, 29 Jul 2025 08:59:26 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:25 -0700 (PDT)
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
Subject: [PATCH v2 5/9] watchdog: rzv2h_wdt: Add support for configurable count clock source
Date: Tue, 29 Jul 2025 16:59:11 +0100
Message-ID: <20250729155915.67758-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- No changes.
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
2.50.1


