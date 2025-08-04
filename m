Return-Path: <linux-watchdog+bounces-3960-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B73B1A9EB
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12E53BF9F6
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF599291142;
	Mon,  4 Aug 2025 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVnSINSI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5D23313F;
	Mon,  4 Aug 2025 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337458; cv=none; b=fUCm2qVd7AfHNFkWIQmAriWeg0vR5/VwonWGM63lzs5fGwT4mlkQdyrWENANK52+syI6DC5nd9wu7+Th20MAN2g6EpGd9vgwJGLpf8k6DkngpwZZWmLc7K4mv5Jxg+dPTXtZSBChK32nuHUuqQyIG1ldSi/yeJpU+BE33tePKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337458; c=relaxed/simple;
	bh=Uei7WzHf4ufcSYmXJmjdkG3Y2RTo+kMYfa1w7DOs5bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=morITDudUDEA1iavaXivi1GEpUYADOKuSEivJUjNzM3eeV6EZTav2NYChMDJZ74AyOYaQsaY1uoU//15cM2dkQazuUsifjmWvF6R2Ons1P7Dv2234Fuc8fG0hlTdBTDTt1QeB37zzTFXIC1j8jGW+/LEEAJr1uFvJeJsAwSg8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVnSINSI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-459ddb41539so5360725e9.2;
        Mon, 04 Aug 2025 12:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337455; x=1754942255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJPwKog2fKu1QVO9GrFWU3eAL+AwvpT1XJ9KMuR3DHA=;
        b=jVnSINSIPBfcoaDpdZeVTmSGEqw//+ZFO1dBSpO8msdp+lfAb5vVx+108SuKE5GVdN
         TU13HsFrRW5H8UnyfxomLKQyfbKvoDzVp7qLYi78qyn8k3xEdllzdfEgmgEut6mS/btJ
         Ny/wr6NlPtIfvcZ/44KLaVuXUygHrP2vNFsMeG9sxrjrxdl4ectEnoxhQXIQgF6oU+pR
         xQhBKvSKkCi+QSkfV/vMh4SzoPdsHp3OBA56Iwks8oQcV2+C6cZglHH3WzfVjeWGaYzq
         XCdvNFD4hPEtzC506MeACcqDLHb87/eFEK/hWYa3H/8B3NMJg+XtqmFYOeQBNl8j+TUl
         bRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337455; x=1754942255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJPwKog2fKu1QVO9GrFWU3eAL+AwvpT1XJ9KMuR3DHA=;
        b=fq3nU+l2X9kh3BV8b8LT9MkINwcGGRHDx7g9kJpDQy60oLpe3DZJQjwNzW4iqadQjK
         oCluZDg4JGBhU0OMiJmyzDF8wlWFHOKNVtwATYeQOoOF01iecD1JW8u9KQZMFWk5C1LK
         alWPLieBbb6Ab9dven1Kz0m335W8JVD0azTemn14hnx8lscKZOFIzHEq9oRwETH/Ol1U
         JF1HI6gZJjngGaYMuFIXuqwQUXV2brx7QR2i8Olu0wgz9FhBh7hpWibq+RgAi4KQtBd7
         cCWitm5iuW4S5USU1I/sbdhdUcMz7l6es3Erlapx9a6BSOaLNz61tYwCFEhm77fLjTcj
         FK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7J+P0ip/UnFfX/fGAmknz6vTWkPS99nvZoe8VAf0DMapePK7/oqylBDLlZKfGynGwh9xPnTpdvmqX@vger.kernel.org, AJvYcCUV9pmNL9P7+bZFBE9RjKcDicyGfeGGviwEzxTYYWJ7lY0p0O0OxGx74iAasO4udYzAP5riBncZlnxObWpG98bZQWo=@vger.kernel.org, AJvYcCXhZdPdgZzl9gUTWbj+ghzirRdjB5dWgQwdkk24AlBXqlPlZYOYrAemF3I0nHSU03S41VRP9XkmHeEMFwZA@vger.kernel.org
X-Gm-Message-State: AOJu0YyMThnXCSdU2I19bGJfg74xMqJqLtst7F+g5Ly3baxSj2VOxcAm
	eN80TVfuGkDbwzPfM5afmC/eJgGxL0HhdkhqukMUwqadlayO4VM9CfYw
X-Gm-Gg: ASbGncvry2JJ1bS708YR9e6vUJDmUebCkpBQMpeM6vHeO4YLoynERbJPuCu07wLRkiJ
	U/32/XWAsKsbf5/UFLAFcmJAQeqE+xHIw1p8wa2I0gqNSGR9rTKGtnEP8thbZe3s2VPNlGX7Xjd
	oFwA4hwstuuQFgs1n5Ukrp4H1D6cAUlE8sbI6YwHJjtR1/cOaXylegcz1Y3wSCFPelHX4NK+yzr
	/XmFiU2toSOokSysGwHWMiGTTDObyxQbK9hbuAqLHq71GHp1eUUrceLwbYvIED58jiVVt7bJ1R3
	tFQm2cqKrKFK5cTKPzRzwRF3R/KbkOmNDhaY+DhAQuyrtUunCebgEwrZRnEXbWWNEVYFLiAgcu/
	J4NjkYVxoOiS4cTi3ZLjd2Gpdwxn2yS7SXhqP7sn074z7q3iLj3MgANZaUT2ykzAropKLzcjZyg
	==
X-Google-Smtp-Source: AGHT+IGPLEjI7VXGeSccJM+K5kKbvSy+WTVMSGFSBuRFFHctYO+znZ883QHIHYqQPct/cGOLvMy72Q==
X-Received: by 2002:a05:600c:4752:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-458b69e3710mr94917065e9.14.1754337455087;
        Mon, 04 Aug 2025 12:57:35 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:34 -0700 (PDT)
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
Subject: [PATCH v3 5/6] watchdog: rzv2h: Add support for RZ/T2H
Date: Mon,  4 Aug 2025 20:57:22 +0100
Message-ID: <20250804195723.3963524-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control of
the watchdog counter using the WDT Debug Control Register (WDTDCR), which
allows explicitly stopping and starting the counter. This behavior differs
from RZ/V2H, which doesn't have WDTDCR, so the driver is extended to handle
this requirement.

To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_data`
structure. When set, the driver maps the WDTDCR register and uses it to
control the watchdog counter in the start, stop, and restart callbacks.
Additionally, the clock divisor and count source for RZ/T2H are defined
to match its hardware configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Updated commit message `doesn't use WDTDCR` to `doesn't have WDTDCR`.
- Updated the comment in rzv2h_wdt_start to clarify the clock divisor
  and timeout period select bits for RZ/T2H.
- Updated rzt2h_wdt_of_data to include tops and timeout_cycles
  for RZ/T2H.  
- Added reviewed-by from Wolfram.

v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 84 ++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index e71d1e108f69..ee3ed5a6d98e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -21,11 +21,17 @@
 #define WDTSR			0x04	/* WDT Status Register RW, 16 */
 #define WDTRCR			0x06	/* WDT Reset Control Register RW, 8  */
 
+/* This register is only available on RZ/T2H and RZ/N2H SoCs */
+#define WDTDCR			0x00	/* WDT Debug Control Register RW, 32  */
+
 #define WDTCR_TOPS_1024		0x00
+#define WDTCR_TOPS_4096		0x01
 #define WDTCR_TOPS_16384	0x03
 
 #define WDTCR_CKS_CLK_1		0x00
+#define WDTCR_CKS_CLK_4		0x10
 #define WDTCR_CKS_CLK_256	0x50
+#define WDTCR_CKS_CLK_8192	0x80
 
 #define WDTCR_RPES_0		0x300
 #define WDTCR_RPES_75		0x000
@@ -35,6 +41,8 @@
 
 #define WDTRCR_RSTIRQS		BIT(7)
 
+#define WDTDCR_WDTSTOPCTRL	BIT(0)
+
 #define WDT_DEFAULT_TIMEOUT	60U
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -54,10 +62,12 @@ struct rzv2h_of_data {
 	u8 tops;
 	u16 timeout_cycles;
 	enum rzv2h_wdt_count_source count_source;
+	bool wdtdcr;
 };
 
 struct rzv2h_wdt_priv {
 	void __iomem *base;
+	void __iomem *wdtdcr;
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
@@ -79,6 +89,20 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
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
@@ -114,14 +138,21 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 
 	/*
 	 * WDTCR
-	 * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
+	 * - CKS[7:4] - Clock Division Ratio Select
+	 *     - 0101b: oscclk/256 for RZ/V2H(P)
+	 *     - 1000b: pclkl/8192 for RZ/T2H
 	 * - RPSS[13:12] - Window Start Position Select - 11b: 100%
 	 * - RPES[9:8] - Window End Position Select - 11b: 0%
-	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
+	 * - TOPS[1:0] - Timeout Period Select
+	 *     - 11b: 16384 cycles (3FFFh) for RZ/V2H(P)
+	 *     - 01b: 4096 cycles (0FFFh) for RZ/T2H
 	 */
 	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
 			WDTCR_RPES_0 | of_data->tops);
 
+	if (priv->of_data->wdtdcr)
+		rzt2h_wdt_wdtdcr_count_start(priv);
+
 	/*
 	 * Down counting starts after writing the sequence 00h -> FFh to the
 	 * WDTRR register. Hence, call the ping operation after loading the counter.
@@ -140,6 +171,9 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
+	if (priv->of_data->wdtdcr)
+		rzt2h_wdt_wdtdcr_count_stop(priv);
+
 	ret = pm_runtime_put(wdev->parent);
 	if (ret < 0)
 		return ret;
@@ -192,7 +226,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 
 	/*
 	 * WDTCR
-	 * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
+	 * - CKS[7:4] - Clock Division Ratio Select
+	 *     - 0000b: oscclk/1 for RZ/V2H(P)
+	 *     - 0100b: pclkl/4 for RZ/T2H
 	 * - RPSS[13:12] - Window Start Position Select - 00b: 25%
 	 * - RPES[9:8] - Window End Position Select - 00b: 75%
 	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
@@ -200,6 +236,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
+	if (priv->of_data->wdtdcr)
+		rzt2h_wdt_wdtdcr_count_start(priv);
+
 	rzv2h_wdt_ping(wdev);
 
 	/* wait for underflow to trigger... */
@@ -216,6 +255,28 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
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
@@ -265,6 +326,12 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_init(pdev, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "WDTDCR init failed\n");
+	}
+
 	priv->wdev.min_timeout = 1;
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 	priv->wdev.info = &rzv2h_wdt_ident;
@@ -281,6 +348,16 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
 
+static const struct rzv2h_of_data rzt2h_wdt_of_data = {
+	.cks_min = WDTCR_CKS_CLK_4,
+	.cks_max = WDTCR_CKS_CLK_8192,
+	.cks_div = 8192,
+	.tops = WDTCR_TOPS_4096,
+	.timeout_cycles = 4096,
+	.count_source = COUNT_SOURCE_PCLK,
+	.wdtdcr = true,
+};
+
 static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 	.cks_min = WDTCR_CKS_CLK_1,
 	.cks_max = WDTCR_CKS_CLK_256,
@@ -292,6 +369,7 @@ static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
 	{ .compatible = "renesas,r9a09g057-wdt", .data = &rzv2h_wdt_of_data },
+	{ .compatible = "renesas,r9a09g077-wdt", .data = &rzt2h_wdt_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
-- 
2.50.1


