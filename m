Return-Path: <linux-watchdog+bounces-3836-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A822AFBC36
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02C3D1AA85F0
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E535026A0A7;
	Mon,  7 Jul 2025 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5N3R45E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84489267B12;
	Mon,  7 Jul 2025 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918492; cv=none; b=CNund8Qr2aTVXDUXKf9BGq7YMcR2mlahvHm45LSBamR609q7EBoxWnIFc2XXv48xMo8Pej5MzNKIFerj+KqlOnRzKxVaqoCnp7qUlUQZZgrqhcjqa/h23bjfpJqdAH20Md77ydMVG9bGCvIINsLxHlkWsZlLNHLyuTbB2Oi0hXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918492; c=relaxed/simple;
	bh=2YcfqpTGwDXsbTYTPCk1WekTgmfG+uYhV4Dye6GG1Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jc3/5v7u+117LChmfriIOGPLMOyakL5OUnPhecsQ+6UJ4CWor9MR0c9wBMWEW6ixqf3KIV98jDlXZbQQ5+jO5XO94vC5aO7TBEuVV5K8lIJwmgULP7NhnTRdUs7WbmD1Cfki6BHLk9aL+YRBoeeUBtT7J4wz9DBlnkNq0shRqu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5N3R45E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a582e09144so2268088f8f.1;
        Mon, 07 Jul 2025 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918486; x=1752523286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3ts6Nhl1YsBg1Vnz6RDZm/f0rdbRhKhf7+4pXCOkqU=;
        b=Z5N3R45Enzqrj28b7grTwt57nk1pTPFzDGxEx8bFayq6szCVXvnRCdpyOiyGV63nu9
         /8MSyEd/IDKVTTyjS9xT7tm9MNkyzZynptUaJV9Q79XBWPTC592RaHorLEiTiK/+ivEG
         XOYGlBP5D5t3WGfsowRrTMyuLPCK+oDHztg+2vQsW6fSbEUkOf8eWKazFwYiVuKDoiv4
         OFun4HWEw92yKN/62t6e9UPynRpIrh0akrX2/NL+V6tUlRWSe8FDpOEaYVrw7zOmYY+G
         6RARLmbH3yIq1Uut628sQOgf1OBCJlZ1IZZNqJ22tDK8U1Lg25Z18K2dFfaMH5HErCFK
         tVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918486; x=1752523286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3ts6Nhl1YsBg1Vnz6RDZm/f0rdbRhKhf7+4pXCOkqU=;
        b=aV8c/wIOzbTNmSFtFh7lcK7zNni76z2ltrt2G6xuWsd2TBvd3gBgyKSqNr6h6Pa2bQ
         qQxY6eI5Nb98aB0q60H3tEoXtcUxCxK9CLhQVWpkJSFqlfZu3AS2S2PJugmbi7pqB1mq
         EuTVWfo7E6owck3S9qCs3NDTbrXJ3nkmzbyvuMtHW8vCEmUJUtSrJDB3yoWCXiBsCWc6
         bdk4ahN5Lfvxi6q6SRLK9WaOOMSkUtMd/lSoTXJ/DkpAduBB69Jezsey3glz+35XgQhP
         g0oACKz78eoMW0dTVyhPWniuRMvpejSWVlFw1ExQ9vbjdlIVuT646SehY4YbJMVRlpe6
         sNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVByseP4rx4hjh4CW6Pplymipghw569UlKkUf0mszXzVecI2yr36zbQYwQLJIRjV9HHWc5Gd118qDP0YSoC0dbNiLQ=@vger.kernel.org, AJvYcCWLwEwpzVfS8FT1JLSulEKDGmF16PzeKpaNPclOen/qwP70PJtml9w2SMPMtCBA6TwBLRYbpgkBmJEHppkUuCw=@vger.kernel.org, AJvYcCXZvy7RS794hbYx2taIW+ZD9kel5GBYSFkEPkC6paWeIVuBXyfOn5LLRAgoU5fZsqdNWwHDetndgbHVxNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6OcitqwDFq/xkYFQ+1bhhsLnbSpCy0qYUrEX19H+E0iLYjt7
	F4ii43rAcplOJ0095G3tqtUazc4MG0pQbWhpWVZugyCDtaHZZXVW9nj7
X-Gm-Gg: ASbGncvEGDOfPL9Kh8iQOJgrbBLTDZztbkdNhq+Rve1PtKJ7NoeYKCbmYm+H7v7i/i4
	PEr8rOxjxg6RsBVzhnZHUBzBnSmNJLK4njPVv4Mg2wqlYSr3S+AdPy/mVnsolZJpG9y+e0xBerS
	bN/fFu0Ozt96vJj3EHDcDZXH6SPqyNcRjyfmZMlHw6YVNL0Jd814CVY5BAin1HrNyAgJFwjsAM7
	I8uN8L9nQPuUPiJFQFfX/DKwBHU2foouzsjVuZ7KstrXxJJPAC4SYGD7Qi2aSrpAnwftr5TdCWO
	NfYdgSWSlChgxtS4lKx3b8QEDrkE1F6e5dJW4G6em9cVLA1o4Tm9+LT5IaBfdNWmFiguLsaAh4H
	r1tNWIrIwP1qTQXEusIk=
X-Google-Smtp-Source: AGHT+IHjgW4juiGW3JQ9huFeR9Q8fG7Je4sUlfT1WiHeh7iWcOKrVEvR8gwX2S2BpUt9YBP4520fVA==
X-Received: by 2002:a05:6000:1787:b0:3a4:f72a:b19d with SMTP id ffacd0b85a97d-3b49701198dmr8884835f8f.8.1751918485385;
        Mon, 07 Jul 2025 13:01:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:24 -0700 (PDT)
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
Subject: [PATCH 8/9] watchdog: rzv2h: Add support for RZ/T2H
Date: Mon,  7 Jul 2025 21:01:10 +0100
Message-ID: <20250707200111.329663-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
2.49.0


