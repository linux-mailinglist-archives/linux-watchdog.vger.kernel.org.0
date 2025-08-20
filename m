Return-Path: <linux-watchdog+bounces-4021-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEAB2E67A
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E18643B452E
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1870F2D47FD;
	Wed, 20 Aug 2025 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC2sJitg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C3F2D3727;
	Wed, 20 Aug 2025 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721415; cv=none; b=qW+UgyjsF4/wQp80vy0OsOuNIiEGxJyhzkcodckJlZRUa9YqXwpKBVm3jsYv96SctOnVbmw2mABNhT0n4r/tW0Ti2J80myjf+XnsLr3MD2KaVrqg3FG1Km9kEcf/4omxJ2BZu/h9mSu/sYjM79Lz7wCdpBX04y66s1fYoys+LXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721415; c=relaxed/simple;
	bh=/OIVTtRusZZH4TYPV7NYoaORY3sXSBiZWyBjY5wUbWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXeR9Wsz+KvfofiHbsWKFJCQ2JGAhyHXVpyJpGw1E9FE/vkD83qK7kYTPC/Qjh8jvJJNhvDpSy6iCDWGhkKqaGrezvbRqLz5jM769+kNqL4MnICBQrq15lSWN9FSkkC06UxkB/j0YeuEe3T9MF/DD3lT8//TmwP/EUucqMSPQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC2sJitg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so272475f8f.1;
        Wed, 20 Aug 2025 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721411; x=1756326211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSU+05zeeqxeQozS0kVq/YsDf11HPmLtSI26jxvtSVQ=;
        b=WC2sJitgu6DFbGV4B1zJdPLHxbuGX/K8S/Sl4cu76fS+xsWVRGMK7uJc1Uqq0eNm+w
         Zlv2J4bg1ge9u0IfreQwAdmPnsPicb7CeXJP2IkR17goDVK3z8jXO9cJ+SjHsdGqJ5m9
         QwTTC0EmgizeA5vmbwB2ZIL8TUyoWj4nKCOkO7B3bzDwezbuGoGh7g2Now+kppNTV2X3
         ci7jPauZKFil0vGC0UYcrLjjV/jfhiq09bVbLay9XqnJq0ybhrYRbHSoarKIlfNaMdEc
         Zz06J9EfHrudh3mXpq+Gn+WMlaXjsFiEEw+FlbxYTohLcy++CKxW84kapfJewOMDyTQn
         ZE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721411; x=1756326211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSU+05zeeqxeQozS0kVq/YsDf11HPmLtSI26jxvtSVQ=;
        b=vc0luohWiqDvb7By3En6WfJCset6d2TuNbTKhYkj9r+mFZCWa3SjOhiVAjwcp3h6xQ
         /Ot0B2OaZqkmkgqWFKodGIwigzJeE+uSQPIA6Naa6MUPUqc2/p9w8CoR+dA3Kgk+6jXN
         UMGnKNXReWj2W+rbZbjAQNusqqTA9H7wg7FuV5w5IAKN4fFjTVGJYYnDD5PKRc3xGalM
         UVHbRWSxpsRCvYFcmRmwnE7ywqvdqQ8X+QIhgYpIre/KE8Bia7YHb9NUvD8hKnImO3Vq
         j6WZilBRYCqCfIm8lP5N++n1nnQEPDZsKIOd1uxl/19qYBWHKB9yPpEU4sLr+MfAlh1i
         p8sw==
X-Forwarded-Encrypted: i=1; AJvYcCVvt+6l5A4jz7loMfERChs5WCYx2oPJSb8fNbCsf3Z+iFS0I1wq45oy75AOpKra6JwYn1HdV4SP4v1b@vger.kernel.org, AJvYcCXkjvPkjRQy6by0kzwOi1GYM8D3JRkdrCRASnilcvakCe5p/Fnb1/O9hqAdNoEm0RNaqUxesJaeyF4CgF7UttrzVJ8=@vger.kernel.org, AJvYcCXvTONgZ6/vuIPcHTKH4fW2dgaeEfUsK3xbhaoq9aibKtDhV4b4f3ssAWMoA/bP82miD5lyw7XmSMNcAHmG@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrv1a5bR8m68E5fMvyCyULnEPe7jxxNn0GawmgplKGaqeqzDq
	XX2K0TLPmJpUIrHPK4cpDFhEc0fozL9VNjCH2K9THUV2GT1/b97dAxKl
X-Gm-Gg: ASbGncuXEWiNqKU87YIML2zLnQe+YCGGwflVq2GBkFHZqXzSKaA6AQimk0e13Mr2LM4
	e+ADFCgOd3HASwX+9F0gH8hjBOfvHG1DHb0IsiJURAtPTyI7gWPiJ4FNy8h3lT4qj/d4FaslOxb
	QZFSHsQMEvV3CdI4zra3CIiPVKKwyZYe3b18qTL1FE4su7623R1EGmR8ytVt6D1RRW1hAyr45FN
	FozNXAQWyk+F4g3JVvEXYdqLs3pDzCiQ6ty25Xt/c0ya4cT878LGbcva6dPfMMkoDGuXdwym2LE
	cYEiskcukF38bPyIpp14hN3eYhZX3xfpNtnD64gFXSrzw4Yt68HTWufpzoAWSVhnp9+ayMH5m/F
	Fam3tSK1Cco3rIhSwuigwBErt/upAxYTAHEDgP5XdfGN0Nb8rWUdhCYdF
X-Google-Smtp-Source: AGHT+IFeYRtJ6c/b1Ij/i6ibiNiSQR1ETOTgrjqFZ60z7vHrKsmUY9umpHtjOr8Ax5wuNrgIuSifbQ==
X-Received: by 2002:a5d:588c:0:b0:3b7:83c0:a9e0 with SMTP id ffacd0b85a97d-3c4949faeaemr101366f8f.25.1755721411204;
        Wed, 20 Aug 2025 13:23:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:30 -0700 (PDT)
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
Subject: [PATCH v4 5/6] watchdog: rzv2h: Add support for RZ/T2H
Date: Wed, 20 Aug 2025 21:23:21 +0100
Message-ID: <20250820202322.2051969-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- No changes.

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
2.51.0


