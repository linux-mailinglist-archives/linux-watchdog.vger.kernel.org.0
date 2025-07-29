Return-Path: <linux-watchdog+bounces-3917-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF6BB15092
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 17:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC544E71F4
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 15:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF5B29898C;
	Tue, 29 Jul 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxDnhpR1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81362980BF;
	Tue, 29 Jul 2025 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804766; cv=none; b=FJ5sobcMZemzNE4eiS8OrIXXGUIrGuGIX/eCDuMVPi838yU37KKQ0vBqAQ51mp0q6XzIhMsoofT9DaWNp7BcCy/WfpntjnvJPkln7Nz0VpsTE3Wt/U117ih0L5J+RzGSjGM9Ph8YtupsQpavp33ZLhpqoV2pW2kXWv7INh0k2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804766; c=relaxed/simple;
	bh=PE3C3PO27vz5qgsTEMoMqmf8wtlGxCAVioSJlwS9mhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARROZhBGyrMCVFyRhT+kGW5UAhNvq7VmYqyTFi4izNAHDO1Nr+1bf9nu9AsunULNrLAy9+ndsfDxcJL/72TVLdtg3YVf79PDsYVJoS8HYrB5flRXG2Rzv6X+pErlzSxH4KepVB9+U+wNRjRekYGQf5j5nvoUOlR6o4bUP3Q0OBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxDnhpR1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b794a013bcso290940f8f.2;
        Tue, 29 Jul 2025 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804763; x=1754409563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uPl0JJnxMfvy8UEmylzhIFMh0psWUX8bjf0ZC2vlP8=;
        b=RxDnhpR1gedE1DArLb5hIXbTabSKGyrJG2k8P9sSnBgmbsbmrHqf28ACNq015E0vOs
         bpd89O6f1j+8AwPK1vp20J5iBoDljHADg2Q2oQ5hyGhRz8oAzpmPEesB1pH4cqc1q67S
         0ZTmNBIWQUsX9j0tkHvCFZeiL2Pz8tfnP2aDxDszMaphe+LbUwPSuTQauMy6+SoNZwtx
         fWrQIoX4vgyvBKGWCrg+qR1fXuVljqct5rN0RFtPEqly/d49dRnLfPNKYvgXd5Bk1gw7
         olC+6PLT4zDl0+EmZACv5qJWG0UqWlthgDyyfVwsQJbafsTMSdJ1fzsKSTDYrJEMtorp
         RbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804763; x=1754409563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uPl0JJnxMfvy8UEmylzhIFMh0psWUX8bjf0ZC2vlP8=;
        b=OXI3X5XzPJwblm1Jj9cotons53I2c0I0RB6k4sc2JQViFQg7SgoD3hsMRwz6aqsDrO
         Yy8rLJ/3H3qR9+rN6ndlt9aDX2MvQdhqaEVvSSnK8b3taal4KSbTr32W4qLwEMEgwqrT
         g0XlhAWM+8B/2aEjFfpq6DlWM0MaPJRG4cbghD6Z6N8RjAEoyXKi3DBb2hRpzbYqe/mE
         O8/szB0t2JXJHK1sKbGJQF2VqlGT+i2FpnFcxj8PLl4um3wHzUVg9BzupkyXaMDhjvHo
         xYNtTUTJxC9BMmVVAUSaMzfcedUo3YVCviU+E978J5CkNZXe5CXPMTM7hkvbSXglk78i
         mnSg==
X-Forwarded-Encrypted: i=1; AJvYcCVJtrdUW/DRKfK9EHjvGbE30VXxQ9l6yuJF6ApZzojdVYckCHuUtvEQ9ob4FW7SwUWmGNM+RqvEAWNup3W6@vger.kernel.org, AJvYcCXABwOVZWHmevLHIUML6VKZvgjVIrSnzySMj1b1Z92SxsricuPVTNqtPHA8u4kQ2lgtW6ak75CAhHfU@vger.kernel.org, AJvYcCXJgB8AMNVuMelCLqzBBhTqJU9yRxKfzljK13Wpys5euPZYYC/57h3cvQsxyNXI8XwwOR0DacpIfRl2rpDhg/7+1QE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfa+/kd8XhpCd684txnuZYZ5743h4Gy4Ec6HV38NtUE2rqQDOZ
	Dha11GeHZdoTBs4lVwS02Zl27Zgfd4usEuH1BGVBk498yPf0nPvMvsDNvtTztw==
X-Gm-Gg: ASbGncsPt+GsTUiCVsVt2cewvWcmI8NGaPEeK3rDUSjEiU6wXj+3ChELFGLDIgRcoLZ
	27X6ALXxYDuAALBAccu7FmUXIO5vs+FjsvbtGzBjPP/Sa6OW2W6zCLR+JNctV5ufGRN1Chjauj5
	kIHA5QpS+HgUsjPxZ7M9hNKZKGfvZjzUItfjL88bk4V0yHl4r+vrQuZUj+I9+QsV7P8pZ3isTtB
	HifGVD47LU3/yXeW3Oiqskb2AZ4O46OUYTfIdzXkvlLLdWPv7aEt2X+Ncplhx5R1efyGPIJrOIK
	m5w7SUKp1/eRutTIXncQ967wCxSqFbf7kXRzBsHGLz2SN381GnQhSwTl2rjU93j8zWxGklKiIYV
	EhU7wYNi6KeW1hscLsygQrkReINEFxVFysmainq0Sb5OOvXGTIZamKADNfemvPZc+FeqztgEMnw
	==
X-Google-Smtp-Source: AGHT+IFo4Ah4Rd/dHx5nhCsz8OYA0c7AdModvMTwzoxUoJoxC913WomOJj3fHd1Es8mERRXLOr+jug==
X-Received: by 2002:a5d:50c3:0:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3b79501d04bmr129674f8f.54.1753804762863;
        Tue, 29 Jul 2025 08:59:22 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:22 -0700 (PDT)
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
Subject: [PATCH v2 2/9] watchdog: rzv2h_wdt: Obtain clock-divider ranges from OF match data
Date: Tue, 29 Jul 2025 16:59:08 +0100
Message-ID: <20250729155915.67758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move the clock division ratio values into OF match data instead of
hardcoding them in the driver. Introduce `rzv2h_of_data` to hold `cks_min`
and `cks_max`, populated via the device tree match table. In probe, call
`of_device_get_match_data()` to retrieve these values for setting up the
watchdog.

This refactoring is transparent for existing RZ/V2H(P) usage and
facilitates adding RZ/T2H support with different divider ranges.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
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
2.50.1


