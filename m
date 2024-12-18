Return-Path: <linux-watchdog+bounces-2592-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E80C89F5B96
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6A6189485F
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2945130AC8;
	Wed, 18 Dec 2024 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbIRp/w5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DFC84D29;
	Wed, 18 Dec 2024 00:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482069; cv=none; b=eDNTIOJAoEKKYmauwOvk457oIZ2ssS9jb50SEn1QfHx3iPlFSHkyccmibIxNuFmA0BPtxqY1r4rBlQ+oe0BjnpGS4sHs81ebZD/S2NAoRelM32shQnqPoI6MLpKvH3Aj4HxkxIIXReA/GGUvbMysfVGmrksEqn278C/z1oEKONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482069; c=relaxed/simple;
	bh=5VwEMJTph+GVwjmG6CJ2XFWhnE1JGhFEfKX6lMqy5Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBEsPxEhS+cDxbhH+SupLmFe57ntIjNc8RgoR/aTbWYCgQ585TnoT18r0aGBEYJvRVuw1XeNaYyvujnHIG3nJHMDItW9H8SBdf2KW6iX1sHoH3jS8yWCUjYv8DEi65RO0/zRdSujHrgRQuXj5R9bG3/FD8ZB9matQRPNLMRIBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbIRp/w5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43622267b2eso62074595e9.0;
        Tue, 17 Dec 2024 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482064; x=1735086864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97y/3kYKRHJbJ0DIVHg/JxdsBYdhheuIK0iylVg6CA4=;
        b=IbIRp/w5I50f2Yk0eQpk03LwNTVDJcEVDfIKFUwuRgIGjThXhwWaFZSI86ohfFVs+x
         GbmsoK8k4CZdzoY/Vs/WaTTrkiUuX+ZQse+EVpg++03xmHoEapJEBito6ySJ9sDt7uI6
         YL5Ho/HWCXefnZ6WacuC9QN2evehPj6m2G3sN8SglgP2xchKNBMA71vgelZMlS///uKH
         0pvwOo+oy1zMcpbNJXDF0oAeyR2KNq4YDy5sXIGwrG87F5P9kCbcUcHA/ANAECd18zuE
         p+1S8l4dN82soReOzVUO7Jr3gbxyhSA3DL6CtiInm1tyFRRXp9PAv5niZ5PGZZOpp+an
         kAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482064; x=1735086864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97y/3kYKRHJbJ0DIVHg/JxdsBYdhheuIK0iylVg6CA4=;
        b=GUup8cTd6WHnZ+VIW3Tjn8SkECHLIQDFnmlc+WVXerBz8zC0GKZHfEmJIcDAQVpEtb
         Go8z+wcOvlz/01QIuh2ksW9t0gRYd2UEkyhqY6OQ0QlsYIaBq7K+1RWkOmRpCTfSdgWk
         GHE1P1LRSAnWutYHaru38B1gbEmPm5VUjojsiIgFBbu9Dux+vLkFeTIcGaqnflsHe55y
         hSjR5hBbiD6LlPq9ekJCp4Sq098KQeHRg8WUoys4u7hblM/zrRJ5h+u3q8LEH60Frjb2
         O2XN1cUSvt+8f2HuD7pmLYyShecZJI3fl/Wj6F/kMCZ21vDAUT5OHjsyWW3kxTaNvSj4
         1rjg==
X-Forwarded-Encrypted: i=1; AJvYcCVIlf6+ByJZoRaw1GN0L0VwR9B0ohGORbx0su+6FuFo0+FRHJsDUW2tG0QNQK05dFp3sK0w+gECZrwNKyij@vger.kernel.org, AJvYcCXY8aFY/Y5ZTOWCjLI2WH165d3S/YzncuQUZw3m5Swpsz+F2rln6BzD/lE94XuUyLRTnNRuin8no/8n@vger.kernel.org, AJvYcCXcM6G2p8TQgEFFFvZCGwtj4055bq3L1rbdfDgToAMP1h5TnLVrUU5+XTxdwjF0AsdRpR/jw03SbpY/Uuyir04=@vger.kernel.org, AJvYcCXcfvoYciwbuzHs0iEjpP0SRLnDc17BFqE94K6tN1RDNJy8fs3/wmp9Oqwwk6p9BaefKLZQrJpdHqAZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt1fxjqDNED1XDFdnRyws9GAM/4sSGxmhSS0tjPw1fk2dDZzvP
	HzBaPv0l67ClnKWpq2YdPeF+JwUUCgGPoF1ZBEpoMY5+MRta2qn4
X-Gm-Gg: ASbGncsCGreml+fDw4zGpgR2UCFroDnTi+BGe9q4U44dU1baD4GEmCKWs4Wjb9vmhhr
	i3iAbl/9To6SstZZiD4nH8f9/3yyw6KYIPBR403tfUKRfwB+zR9qSk7iOKgFt8ig1mMkWXB4to8
	2FG2EIsk0hXAv//dlkFSXl61v+VD2uBDs58la1iHFPDidApI9gC067sBbmF4kM9gA8Hfs8XazOV
	gUDYoYX7nEDdroTAPo6u0NGg+/+x4WhFBu43h8XixMnJXguBKQFzpgNVk1tupLnmCSYHDU53RbX
	olgKt+MfLA==
X-Google-Smtp-Source: AGHT+IG/p+tvlmR5cXbuBHcC5EGtbbK+O2oiwoMoU+84PhuDVVzLOZJyBIL8AMNKJTaJVDz5Uae2kg==
X-Received: by 2002:a05:6000:4021:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-388e4d8ff3dmr603792f8f.39.1734482064257;
        Tue, 17 Dec 2024 16:34:24 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:23 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] watchdog: rzv2h_wdt: Add support to retrieve the bootstatus information
Date: Wed, 18 Dec 2024 00:34:13 +0000
Message-ID: <20241218003414.490498-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the RZ/V2H(P) SoC we can determine if the current boot is due to
`Power-on-Reset` or due to the `Watchdog`. The information used to
determine this is present on the CPG block.

The CPG_ERROR_RSTm(m = 2 - 8) registers are set in response to an error
interrupt causing an reset. CPG_ERROR_RST2[ERROR_RST0/1/2] is set if there
was an underflow/overflow on WDT1 causing an error interrupt.

To fetch this information from CPG block `syscon` is used and bootstatus
field in the watchdog device is updated based on the
CPG_ERROR_RST2[ERROR_RST0/1/2] bit. Upon consumig
CPG_ERROR_RST2[ERROR_RST0/1/2] bit we clear it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 48 +++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..5ba5965ac170 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -4,14 +4,17 @@
  *
  * Copyright (C) 2024 Renesas Electronics Corporation.
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/units.h>
 #include <linux/watchdog.h>
@@ -40,6 +43,9 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define CPG_ERROR_RST2(x)	BIT(x)
+#define CPG_ERROR_RST2_WEN(x)	BIT((x) + 16)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -139,6 +145,11 @@ static const struct watchdog_info rzv2h_wdt_ident = {
 	.identity = "Renesas RZ/V2H WDT Watchdog",
 };
 
+static const struct watchdog_info rzv2h_wdt_ident_card_reset = {
+	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_CARDRESET,
+	.identity = "Renesas RZ/V2H WDT Watchdog",
+};
+
 static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
@@ -206,9 +217,40 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzv2h_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct rzv2h_wdt_priv *priv;
+	unsigned int bootstatus = 0;
+	bool cardreset = false;
+	struct regmap *syscon;
 	int ret;
 
+	/* Do not error out to maintain old DT compatibility */
+	syscon = syscon_regmap_lookup_by_phandle(np, "renesas,r9a09g057-syscon-wdt-errorrst");
+	if (!IS_ERR(syscon)) {
+		struct of_phandle_args args;
+		u32 reg;
+
+		ret = of_parse_phandle_with_fixed_args(np, "renesas,r9a09g057-syscon-wdt-errorrst",
+						       2, 0, &args);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(syscon, args.args[0], &reg);
+		if (ret)
+			return -EINVAL;
+
+		if (reg & CPG_ERROR_RST2(args.args[1])) {
+			ret = regmap_write(syscon, args.args[0],
+					   CPG_ERROR_RST2(args.args[1]) |
+					   CPG_ERROR_RST2_WEN(args.args[1]));
+			if (ret)
+				return -EINVAL;
+		}
+		cardreset = true;
+		bootstatus = reg & CPG_ERROR_RST2(args.args[1]) ? WDIOF_CARDRESET : 0;
+		regmap_read(syscon, args.args[0], &reg);
+	}
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -240,9 +282,13 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 
 	priv->wdev.min_timeout = 1;
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
-	priv->wdev.info = &rzv2h_wdt_ident;
+	if (!cardreset)
+		priv->wdev.info = &rzv2h_wdt_ident;
+	else
+		priv->wdev.info = &rzv2h_wdt_ident_card_reset;
 	priv->wdev.ops = &rzv2h_wdt_ops;
 	priv->wdev.parent = dev;
+	priv->wdev.bootstatus = bootstatus;
 	watchdog_set_drvdata(&priv->wdev, priv);
 	watchdog_set_nowayout(&priv->wdev, nowayout);
 	watchdog_stop_on_unregister(&priv->wdev);
-- 
2.43.0


