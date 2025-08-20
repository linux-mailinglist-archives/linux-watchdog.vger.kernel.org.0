Return-Path: <linux-watchdog+bounces-4020-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F2B2E681
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A676217B80D
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5352D3A97;
	Wed, 20 Aug 2025 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTdRKO2w"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0B22BE7D2;
	Wed, 20 Aug 2025 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721413; cv=none; b=kV35JsxRJGvw0cAahIyxPPpRJnGucb9URXTwszPtr1KX2SVZw6G9JR86lDUGdcJARMlEIvUktJCfTvD3BFOn7Qc2AzNBnnq3HA1BW6eD2uNExELnYrhNLEh3GYxcZwIqw6u7HbYzsO58DvFK62h6uFD/ul9Of3bg9TFsLx1SgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721413; c=relaxed/simple;
	bh=mXIbESrXLnx9wly1IyY9mo7ptrv0/wPucxVUKe53m9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVr/vtMi6DIPht9XLkUWR7kFYTjosV8eaCEkQCgjFutgRx4JQ3C7Lv3LiuygVSEISnk3fmfZJQPuuc4um9rbbiU/1TshGeH8yu2NosbgH7vq2Io/3uqfuA8gHvveUn1mUjVO+SgDvhABuOz0vWZVK/WPCT9E2f1PfmBeRog7Usc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTdRKO2w; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9e4148134so188725f8f.2;
        Wed, 20 Aug 2025 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721410; x=1756326210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sCOHv5AH4AIWnT7tVlZuV6NhvcCtATJkR59ypP69OQ=;
        b=aTdRKO2w2D3hswbaMRYt704H6LUBFHj/MxlzvXch1UfQcD6oWwUWMzfbawbrq95AJl
         qR1K1R+jXhmXl8/n1EKgHsgCRfvXH7ejcT/TkgpT/yz7HSbAEfK0uAbnuEgN1XWu6JRN
         ZBp2hxXeRVr83UyDGVy2NUwhn/79r1KjTXZc67eOyTEc+ERKiSx3fSNIUg+fAbARBu+R
         k92xUe86N+fJrKo1JU81IXi41QIi6G97wY7utWNNYZzqWI3I9IiTBh68MQnKmLa9JltI
         MFulhKbZ4lItxk+GkksdPGD/w/L9VhrLxmbzbvIrJpJ5x59jKe1h8PM2MNkV2BWvOlHh
         J3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721410; x=1756326210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sCOHv5AH4AIWnT7tVlZuV6NhvcCtATJkR59ypP69OQ=;
        b=f0J9ENd7vjsRy9cpwSB8070jAVA9X6ZYsaBnCuBI738NFzMtr2c6lAzF+nk3BVrZi0
         /bABR+D56yKhM50Za46SFXkAjGMc5soskQp28cW17V8S6cyrWKZgoWKcsHLL/mj6LbJk
         B9dPGec0tTw/uhHuTN/BhXwFveN6+MHdQ6l2ZJYkIItiCUfKQLqhIrLWXE9ENlaD2qGm
         4fMvZFEw9JGuIfj6l+xHkGv+pRcMqgA0Pvg30Fe5dmLdHeHea9X2JUVyL9SriD76xns8
         QBY0IEHdytGVHHxgxHuzHYlrabHEDXdn+VdsfxaGY04c9BGMs/s7mWefKu0Su7lRTLd0
         GB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUchv/wy16Y8Am+rClAkjoYPUud5XHBQIXYPdgeSCJbSvyoVGpeYT/8C8ZdFf28wmIAvJejlKNp8eSGb3YV/1x2K/o=@vger.kernel.org, AJvYcCXGAYBDpuhnZow5k+NXn3CuO9Q3jbYe/aTm5neWJuwgfUmFTa+rzhBtywgpIQM5M8+w+nM0s5MPogh+@vger.kernel.org, AJvYcCXk6X0yRHTewJsbvLeX6Oi38HnPxVq7jGkCo7oalIEn7scTHlps/wlYOpmjC90w9m/Ty1rZYEY2B1xQPdKz@vger.kernel.org
X-Gm-Message-State: AOJu0YzNbMgu1jP7XGnFe5k007MmpauEjdr+EV2jQ9ORWsNQmSH3HIYN
	KHf7yE6DPjNWkHzqOcfHf6GXT24z27ajJ84+/Coj5SrlQ1RefXGpjWcq
X-Gm-Gg: ASbGnctElk5GV2dvcjOL+QNnh06pwnAhLPO4k+S9bHbxtPElfV/8FnGnRbyekOta6Uq
	W1ipatiWFqoLWFmi4QE+Pbe39KnD3+bjGszY5eJL19LbPJw7T3t5Z20uXJgsEPkaXHnUH+DK0rH
	N5RLX5z0Pr6qtElPZJSIkad+x8EFwX1k+LSZyjOLr9Q6Kn6JaHLZ9VnBW3JEFnD536ZW0LgnheX
	L6pw7DLZH29gm9O1P/GVuZzWfqnRrgdOMIkY2qrlD7el+rjCIzQA92O8Pc0KjQhASX4C19K+rz4
	3aCv+I1fyrLialeCDR8zeNUCHdBUOAnHHYmfV3hdUKfP3bYj7efsw5fZE24/ik3bA6hsYJi0XSl
	sMifWrE5YiHrP9VtvH4/qR5R5MmWbTJU8mKQh5r658qAiLyYrYWHvfU0g
X-Google-Smtp-Source: AGHT+IFO8t+WY3u26X3JT8f8u/FswNN1WNylkmp5V/OcP3PYB0GFL15Me0iKxaBckZazgtaagHGXtA==
X-Received: by 2002:a5d:5d10:0:b0:3b8:ffd2:6745 with SMTP id ffacd0b85a97d-3c4965fbf5fmr105845f8f.44.1755721409950;
        Wed, 20 Aug 2025 13:23:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:29 -0700 (PDT)
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
Subject: [PATCH v4 4/6] watchdog: rzv2h: Add support for configurable count clock source
Date: Wed, 20 Aug 2025 21:23:20 +0100
Message-ID: <20250820202322.2051969-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- No changes.

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
2.51.0


