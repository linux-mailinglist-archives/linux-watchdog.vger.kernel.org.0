Return-Path: <linux-watchdog+bounces-3923-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1743B150B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81020188E710
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 16:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BB229ACC6;
	Tue, 29 Jul 2025 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA+/vLxt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB3629A9CD;
	Tue, 29 Jul 2025 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804774; cv=none; b=QyehWlfTI36hIx/B6nASOOzgEwCk5DD/mZVyOJdYIcv2Nl6o8h1G6U1EiCjSRqdrDjm5TmoDojg1EW3FoW05OmETz5Leav4/Cju/gVApxNBOVmY2hzD0xSWIJ6YFBbgvDtHSmMQ81OslQKb9k/KDfGAAGIgIi2d9H2uoiovFhhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804774; c=relaxed/simple;
	bh=K0R4RjwpZyCicSWFwFqAw+4R5RGghtqpmJ+ISw1rJ+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGb3lwGrM1yGYyVoh9dNlQdgA/PdBojz1IPTAdS8pOwmCU+NshJBWCxaUze/CQpR7vlmQdfiCTB0a6a97sS64ivZ+W9bfi3KEnajF7EaDH7nubQiDa8l39076V9+eLY6z4O69t6EjbWdiaY7k49Pc9/Y6tAKGUsYMgFchFk5Z9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA+/vLxt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso57045175e9.3;
        Tue, 29 Jul 2025 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804771; x=1754409571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUDkyho81x1o6cTJJdSUCwZWpZ4ReDOMoAv4I1Fock=;
        b=JA+/vLxtz6YqawPsUqUhmzQWk0yprMr6Gu5cSv6DIATffUliDoUt85164OIUaWq2As
         mpKEL9VqPmFUk47ma8eV+WVeCl5NT+Js2GIRhPBRZqo6stlsKFJHQUy0FYNIRB8hmtpW
         fBFOkwJFjBAEzsRzv272VnkhFvXRPMXPDbqt4YNCJA++3Ji0lVs+mHj3XjkAjcRBrYGa
         vcGC3Y8y/g2CA/pDgNjKVo/HGXUDqYmLu6yhCHisMVMSFKHKcwFYWqQUHQde0QVAbSeq
         Ze8ZsQRVqqONiadI7RUXVr8GWUCFb54hQk5fsnIIK7Lv5dGwdSfOrSIAk/PBrTuSgPwA
         2sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804771; x=1754409571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUDkyho81x1o6cTJJdSUCwZWpZ4ReDOMoAv4I1Fock=;
        b=agw4fvRmx7aYvkK28iDvbRohc4ivgcui+MwKHA6PVh+cRpyyCasiQuW+nfn+9KQnvq
         k50YrMVacRfobR6Zrs+ILx5B+XTo7KoikqVGoFFau6bF1e1s0C8izgL70ROx00Gw6oF0
         TIxeJGzWpInMKbhtvzwKjUn4OY/jTnsWkja7he7/pTWdv12fNWUy4P+MI9EZu03pGubB
         2DLsXRBiSDLxuVoT+nrXarNSE7Iv7dAZG4e9aWjrSKEJOWZb2ZAVn/07WQCkQYIiE5Gp
         f2EbD6ymg10rGIpBxkFv2RNL4L2mi3kAol4iRtw4Ph5FuxKaz1RjogT92UULgw2cBLZl
         IquA==
X-Forwarded-Encrypted: i=1; AJvYcCUNf1NSznONPF+fzJDBAUqQWT90SVjxw7zHLeJ1j1OBGy8mBOsMZAmjwzR6kZg4RpfUpRz3FD8jJK+WsltsxPjbrYc=@vger.kernel.org, AJvYcCUQ6sFsFi9hAkn/3mehVr6P+erQzDKiT8+XFmwADU4wl1mGit2VIh8Stjp8KIFA1f3zbfEams1j6A58OyE6@vger.kernel.org, AJvYcCVJHfv9GsHDUCLlyiQlAs+vNF7h41OXzIRYjdwc8mvZ8gtVsx1txDe6lQs237P2reXHPfhn0KrEs95m@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUgse4ChLssH7ZHO9w/ybwcItYvn/sKasbbLBrWCqXn4u8Zm9
	rtQT9YHh6FaGpmiaEKAHPA5vdLcW/Vx+JkO+IhwavTF03sj53dBC3WWW
X-Gm-Gg: ASbGnctYGej/Hv5GOl2wkcYW+svZ0icOk3wY7GerSJwck6EujMMLgBQ8SsHPQBuUTqW
	rhMNMk/6b3In391butaBf8SD94FgDZdbjfd25hMLSzylk5KolyZlJTV9GFZ/8W5414039fh+OgI
	ncIScXZYNZOFuYgsIkMlGM5yvZUd6Ka9RM7Gfe4ThtcSNhRDWVDbGIkCnDQ+n80idLU7TTh/8m/
	b2MfDbbDUdfD2xoZuE4dGlJ3PQHruipaU6JwEw8r1qzIitSa7OYhjRc3jk9nj03F4WCW/N9Xk4I
	RDi8UMa10+FCjFP4mYDxG0BRHCEaSUsDH1JCy+9C/yQOEzDefa3Y/muVjza0HQbTNDA65rijBu/
	ryRwpD0tfV3sQS9AujZKguMms4yFp1VZBDBJBK2k0zVC5chB22jS8eOPngJOkdf7ZOY7Ek6PROQ
	==
X-Google-Smtp-Source: AGHT+IE71e3KqxdOp8yvwn/U0iHH2gXMVqmU7Rx0AooTfLj3HsAYg48vVIEob2gdUOLNAXwpyWo37g==
X-Received: by 2002:a5d:5d8a:0:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b794ffe7d0mr150187f8f.33.1753804770609;
        Tue, 29 Jul 2025 08:59:30 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:29 -0700 (PDT)
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
Subject: [PATCH v2 8/9] watchdog: rzv2h: Add support for RZ/T2H
Date: Tue, 29 Jul 2025 16:59:14 +0100
Message-ID: <20250729155915.67758-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control of
the watchdog counter using the WDT Debug Control Register (WDTDCR), which
allows explicitly stopping and starting the counter. This behavior differs
from RZ/V2H, which doesn't use WDTDCR, so the driver is extended to handle
this requirement.

To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_data`
structure. When set, the driver maps the WDTDCR register and uses it to
control the watchdog counter in the start, stop, and restart callbacks.
Additionally, the clock divisor and count source for RZ/T2H are defined
to match its hardware configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 77 +++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 9c11ce323c16..1b32bab87d67 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -21,11 +21,16 @@
 #define WDTSR			0x04	/* WDT Status Register RW, 16 */
 #define WDTRCR			0x06	/* WDT Reset Control Register RW, 8  */
 
+/* This register is only available on RZ/T2H and RZ/N2H SoCs */
+#define WDTDCR			0x00	/* WDT Debug Control Register RW, 32  */
+
 #define WDTCR_TOPS_1024		0x00
 #define WDTCR_TOPS_16384	0x03
 
 #define WDTCR_CKS_CLK_1		0x00
+#define WDTCR_CKS_CLK_4		0x10
 #define WDTCR_CKS_CLK_256	0x50
+#define WDTCR_CKS_CLK_8192	0x80
 
 #define WDTCR_RPES_0		0x300
 #define WDTCR_RPES_75		0x000
@@ -35,6 +40,8 @@
 
 #define WDTRCR_RSTIRQS		BIT(7)
 
+#define WDTDCR_WDTSTOPCTRL	BIT(0)
+
 #define MAX_TIMEOUT_CYCLES	16384
 
 #define WDT_DEFAULT_TIMEOUT	60U
@@ -54,10 +61,12 @@ struct rzv2h_of_data {
 	u8 cks_max;
 	u16 cks_div;
 	enum rzv2h_wdt_count_source count_source;
+	bool wdtdcr;
 };
 
 struct rzv2h_wdt_priv {
 	void __iomem *base;
+	void __iomem *wdtdcr;
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
@@ -79,6 +88,20 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+{
+	u32 reg = readl(priv->wdtdcr + WDTDCR);
+
+	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+}
+
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	u32 reg = readl(priv->wdtdcr + WDTDCR);
+
+	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+}
+
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
 {
 	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
@@ -113,7 +136,9 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 
 	/*
 	 * WDTCR
-	 * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
+	 * - CKS[7:4] - Clock Division Ratio Select
+	 *     - 0101b: oscclk/256 for RZ/V2H(P)
+	 *     - 1000b: pclkl/8192 for RZ/T2H
 	 * - RPSS[13:12] - Window Start Position Select - 11b: 100%
 	 * - RPES[9:8] - Window End Position Select - 11b: 0%
 	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
@@ -121,6 +146,9 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 	rzv2h_wdt_setup(wdev, priv->of_data->cks_max | WDTCR_RPSS_100 |
 			WDTCR_RPES_0 | WDTCR_TOPS_16384);
 
+	if (priv->of_data->wdtdcr)
+		rzt2h_wdt_wdtdcr_count_start(priv);
+
 	/*
 	 * Down counting starts after writing the sequence 00h -> FFh to the
 	 * WDTRR register. Hence, call the ping operation after loading the counter.
@@ -139,6 +167,9 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
+	if (priv->of_data->wdtdcr)
+		rzt2h_wdt_wdtdcr_count_stop(priv);
+
 	ret = pm_runtime_put(wdev->parent);
 	if (ret < 0)
 		return ret;
@@ -191,7 +222,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 
 	/*
 	 * WDTCR
-	 * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
+	 * - CKS[7:4] - Clock Division Ratio Select
+	 *     - 0000b: oscclk/1 for RZ/V2H(P)
+	 *     - 0100b: pclkl/4 for RZ/T2H
 	 * - RPSS[13:12] - Window Start Position Select - 00b: 25%
 	 * - RPES[9:8] - Window End Position Select - 00b: 75%
 	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
@@ -199,6 +232,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
+	if (priv->of_data->wdtdcr)
+		rzt2h_wdt_wdtdcr_count_start(priv);
+
 	rzv2h_wdt_ping(wdev);
 
 	/* wait for underflow to trigger... */
@@ -215,6 +251,28 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 	.restart = rzv2h_wdt_restart,
 };
 
+static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
+				 struct rzv2h_wdt_priv *priv)
+{
+	int ret;
+
+	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(priv->wdtdcr))
+		return PTR_ERR(priv->wdtdcr);
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	rzt2h_wdt_wdtdcr_count_stop(priv);
+
+	ret = pm_runtime_put(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int rzv2h_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -263,6 +321,12 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_init(pdev, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "WDTDCR init failed\n");
+	}
+
 	priv->wdev.min_timeout = DIV_ROUND_UP(priv->wdev.max_hw_heartbeat_ms, MSEC_PER_SEC);
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 	priv->wdev.info = &rzv2h_wdt_ident;
@@ -279,6 +343,14 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
 
+static const struct rzv2h_of_data rzt2h_wdt_of_data = {
+	.cks_min = WDTCR_CKS_CLK_4,
+	.cks_max = WDTCR_CKS_CLK_8192,
+	.cks_div = 8192,
+	.count_source = COUNT_SOURCE_PCLK,
+	.wdtdcr = true,
+};
+
 static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 	.cks_min = WDTCR_CKS_CLK_1,
 	.cks_max = WDTCR_CKS_CLK_256,
@@ -288,6 +360,7 @@ static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
 	{ .compatible = "renesas,r9a09g057-wdt", .data = &rzv2h_wdt_of_data },
+	{ .compatible = "renesas,r9a09g077-wdt", .data = &rzt2h_wdt_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
-- 
2.50.1


