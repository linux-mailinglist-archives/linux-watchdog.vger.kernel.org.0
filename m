Return-Path: <linux-watchdog+bounces-2898-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C866A2F7DB
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D36D618856D2
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC102586CF;
	Mon, 10 Feb 2025 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEIp9RYo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583F257AE7;
	Mon, 10 Feb 2025 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213378; cv=none; b=IqwGmIwebP6GrhiJmMbIi2EZTTu5P3Y0DjyPTtHGKVup/D+veoi5kXFC5Z254ivXbQByce4Ousvs3ifC7MvDMxh4f2ep1NZkDkss56CQHDctEKkRGG+TR/3qwjbKteh5aj8gIy3zgdZyKP5AvjzO9/rV05VELvlOmdXfBAAs9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213378; c=relaxed/simple;
	bh=YGIZKiZefPAf3tEDV+StHA37QKtGAGiN8biDpoR3swc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MciP7vA1Z8ahzlbR6cJgJpH0wAVuAozgrGMr5y49jBwl5Tp81LQJTZ9fArDfxRPr0808d2R4zUOe1m1sxGcQSj41E7YeOp76N1cFIwZi0akIUGeymMFMPPn49oxO09RVmjLK9+4RI0JQ3/jYQbeNIJMml2kMQ66bLMJy2wdXvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEIp9RYo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so11072545e9.3;
        Mon, 10 Feb 2025 10:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213375; x=1739818175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWTSKtPdaszRm0zt2FNMXKkj27jYFbe8QrzAcfIGhzo=;
        b=LEIp9RYoeJWgU6UhCdqBJ7Oj/Qvi2mCqtZZU05JxKAfQtxB6rhHI2/yfvP6K4yDS+A
         5m41W4tP/GlopVoogJzG63p5btsSmwEM9Wa4b6PVpE+7qbQf19MpyMTolqhfHAAWI/u2
         2WwmpW6Xm2ReNOZlF3IF3dqpkRxkSyRDXC/44TnO4EdBKUh8exJvMTOD1AIL19dfbxu1
         pIufhPslOb3GipHxKAzGMeMyZYF/JwbnXS8/ZZnYqUgRZOxXxKWxqw7s7uve7D+NFOE9
         MB3QRWZadPLe7yhEyUZRwsKNqjl2QVHIwn3SKJzl2u2pcBWJBNFQV51YzfTlQ13TbhZc
         hDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213375; x=1739818175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWTSKtPdaszRm0zt2FNMXKkj27jYFbe8QrzAcfIGhzo=;
        b=XRkMc7G5FoL5XYmVUjGml0i81jJYluSBB4F19YBY5EnqtleDheFgZDKbUd9VCeNvfJ
         7HJ7Atz8nU5eaO3YP9qwVefGHGb4GfxAOdbaYZRhH3CJpg5mYDW8OICqJqvER29iir+4
         67xm4VUQKXJpg10GvFmzoFGD3b5Fziec5sPCx1mcwli+ltwOVZDIiQBK+2z0f5CkQAfz
         +2Nin90tmirsyFCTf8bJ6QJxhEEWq8Dl/mB9qNU1IOeKROZtBdY/EBqG2Y0T1n3BvKju
         sZFNiG1ajJrlEtFLVEYzobcMqOp4jnv3Epco2TEBtQ4Hu3kvAzdvwy3lyo33dPf4i5VV
         pJDg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Xdl3/a34R/n4UxdCTziQ+ZNJNMheNg5NpP7pq7eqkIG+AEMn/87MENECSA/V9JB87bGBp43JaJKqQ+Oo@vger.kernel.org, AJvYcCV+fG5ePEsJJx1JVLeveOrhlx4y+dmHiuC99ZJyLUmFtoW4gyObFQ85hsbowMnJRlOELrCwXM2xqu43@vger.kernel.org, AJvYcCVYcLX6+ZM+nzqmRpgMaRmSOC+WlFBiV0+0E9N269Ts/A8XqUzX+l/YBuoje6uRc2wAUBM8WfK9KHtQ8NPmBLE=@vger.kernel.org, AJvYcCXniU5OlIUTy8zAhtWMEQLOj0q+4glQKsECZ0puE74qDnGpoq+xae1rhTBygZIdgU5EJ3Fz2QEzU+hZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyjDLy9e5BEAqLcV/ju642TYnl/oDf/VMkHfSZq4LVq4Nig31eL
	CA+YPIBDgGsDDTtWPVJNtfBK3UFaisqvdZbaHaD1GK5Ltq8Bovwi
X-Gm-Gg: ASbGncvIcqJ/lkni0OwoGwMtG7b5AA8tvvCXgl7V23i0lG84CKOtt5E0YCc8p0QfReH
	4JFzNEKrsGL4uG3ZSknWC8a6QPVms+DrUU+b7coqSen2x3Bm2gdOyCwoonSwCr3sPv5yq1Zj2hT
	p+OXUqt+btSBWjqSL4USZDvQa9Dxh/yzVGPPnED923ZMewYN/seNxrEKnm8N1hGnxWH1/9u7JBY
	/Jm9x9fx/XcfqsOvEAdzsdgn76kKwEsevjRyOTd1XVw0OCFpx8qzWouaxpxvbVRmGwAK13wldUx
	ef0NehCHtGNzEufE1st1eEcIMzaTrW0i1Mf6jPIageQ9
X-Google-Smtp-Source: AGHT+IEnCLLOAS1utGGq2zirxxkcwo7tozkHxYgCBtNuA8gEiane1s25u9DRK+tSu0nqYWDnXc1+4Q==
X-Received: by 2002:a5d:64a9:0:b0:38d:b1e5:7e09 with SMTP id ffacd0b85a97d-38de41c5439mr676315f8f.49.1739213374816;
        Mon, 10 Feb 2025 10:49:34 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:34 -0800 (PST)
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
Subject: [PATCH v4 6/9] watchdog: rzv2h_wdt: Add support to retrieve the bootstatus information
Date: Mon, 10 Feb 2025 18:49:07 +0000
Message-ID: <20250210184910.161780-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Note, this change doesnt break any ABI, if the `syscon` node is missing
the driver probe continues further to handle backward compatibility.

v3->v4
- called of_node_put() for args.np

v2->v3
- No change

v1->v2
- Returned ret in error path instead of -EINVAL
- Dropped unnecessar regmap_read
---
 drivers/watchdog/rzv2h_wdt.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..c9bdaa8f2e3a 100644
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
@@ -206,9 +212,42 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzv2h_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct rzv2h_wdt_priv *priv;
+	unsigned int bootstatus = 0;
+	struct regmap *syscon;
 	int ret;
 
+	/* Do not error out to maintain old DT compatibility */
+	syscon = syscon_regmap_lookup_by_phandle(np, "renesas,syscon-cpg-error-rst");
+	if (!IS_ERR(syscon)) {
+		struct of_phandle_args args;
+		u32 offset;
+		u32 val;
+		u8 bit;
+
+		ret = of_parse_phandle_with_fixed_args(np, "renesas,syscon-cpg-error-rst",
+						       2, 0, &args);
+		if (ret)
+			return ret;
+
+		offset = args.args[0];
+		bit = args.args[1];
+		of_node_put(args.np);
+		ret = regmap_read(syscon, offset, &val);
+		if (ret)
+			return ret;
+
+		if (val & CPG_ERROR_RST2(bit)) {
+			ret = regmap_write(syscon, offset,
+					   CPG_ERROR_RST2(bit) |
+					   CPG_ERROR_RST2_WEN(bit));
+			if (ret)
+				return ret;
+		}
+		bootstatus = val & CPG_ERROR_RST2(bit) ? WDIOF_CARDRESET : 0;
+	}
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -243,6 +282,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	priv->wdev.info = &rzv2h_wdt_ident;
 	priv->wdev.ops = &rzv2h_wdt_ops;
 	priv->wdev.parent = dev;
+	priv->wdev.bootstatus = bootstatus;
 	watchdog_set_drvdata(&priv->wdev, priv);
 	watchdog_set_nowayout(&priv->wdev, nowayout);
 	watchdog_stop_on_unregister(&priv->wdev);
-- 
2.43.0


