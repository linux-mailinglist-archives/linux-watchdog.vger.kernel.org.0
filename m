Return-Path: <linux-watchdog+bounces-2680-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A8DA0B58C
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E77718867C5
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545042500D6;
	Mon, 13 Jan 2025 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STt99I1d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49913246332;
	Mon, 13 Jan 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767447; cv=none; b=mLvoXNKo+1cgWYDz261kQFgdGlfxniixSBTtANp8dHpWTOgHBTFlVq9go7yhy6uRy56A5chayOqFBUhnVKQMZbQYYQc6EBs/gI6az90XrHrvWNsSCBndlq0jnhcODh03KDgErPRhlLTmlR7lwAXHxGwOnwRboIMymmc/KiEKiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767447; c=relaxed/simple;
	bh=cPbAQJjzP2jyHa8v1Bo/aUUIhv8bPbqtMqUoapRsqyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrGiihE3JpzG65zCB/cQGQjkKjGBxLKs83p+/JMaAsZIy+zX2Gn/iPo48E7Q222vltISgEOwQbrWe57i1fEzZ/Y6Utgs+7Sil7OvG5XVuGmPSREgRFZwO4iw01OF6AfUFpoF0d+0q+fBSx6U0k0ilnHq0AnzsULlYJBqPL1mDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STt99I1d; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2099437f8f.1;
        Mon, 13 Jan 2025 03:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767443; x=1737372243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDEeUg2JBjfBblB/2iud2mGE+Qes+mfomfi7Q9Wqrt8=;
        b=STt99I1d+jU5uz4RxhHxW8u75CLdwxn9MFhbjzDQHX+DiO7UPtRX0B3rFblkgTXCkC
         GLVGSEO3DZNk6JhfxHZJQTx9Jeb14a+HGFcpdGoUCk9jx7LCaPcw14ZEPcds4EzQeQJX
         teE3wS5k9eyV8GwwlkCqWKN9CMIPzZKyA3dbLtJjdkOwFDyLLPZ3KOYu8FizN2JozChG
         Uqvf6Zl+rI30u+QiQVIkd3XuXB596KY2+SztPWHfwqCycExUUf0usHMvobyBd13vGjye
         qs0xj9riakK5cDqw8yp+/ZKHHT2FTsQd+w1MIELl5NPDeBCcqKTJ5ZbxYINP8uHvsOum
         4/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767443; x=1737372243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDEeUg2JBjfBblB/2iud2mGE+Qes+mfomfi7Q9Wqrt8=;
        b=Em/NorFDYB8pUqIA+TFTEQATMC/0xlfX2NIWWtby5ST7HYOMq2++VvLKdw+Mgs+w54
         SJ/bc2Vq83UqRx+wK80pA1SQTye1gQ/aLNXmjFLaQB0Ii4CL3zg88Zdp6cCct9bzrQGw
         wFF81kZeDoPOHdL22TI3q8eY6sa9rToLjnnaJwnY5IefqL3p33bdkXCZoKb1l00+lQe7
         51qBXWvN2TB3KJ3HlX/1xo7BgSBtGTs54U3l/sxWcZ8pUeCIk0h2R8XGKxn3fadgovs2
         FpVzVhIEDi5TCCJAJH+kslUB+mfCR/+4Vi9HavqWZedCyZRtz/2i0QH0YYrKBZG86pNc
         Q1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVuih/Bms3H/3GV86dW/ZQTOpQ+J31921IBKPR1h4cO8dl2fATgITZVJ+dJRUZWiVn48B3RKRSNWnSu@vger.kernel.org, AJvYcCWr9tosC6Ypq8PX/0LfMYs7a+EhuWCZcy5uJvJ6h+HBhX0PI84JCWZS6WC3RuIHvGldZTuEw+zGz7exAoEflaI=@vger.kernel.org, AJvYcCXOnaqxRRR03wCugPUm/JXj7ylmFSDkLzJ+pg4guEZ//4pbJzP60lwwxPYSB+fSFB2UnDAygf4A+kSu@vger.kernel.org, AJvYcCXtkQQ0+3Thg+joH58MATPhePeGJ9UCtum5dwT2fa24neqlBAPt5v74oJdI7O6bvi0yUVrfhjIP+hpEryUg@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZaqlHnOVY5KPJwGUC/M4HE5WEJg5Q+zg9Rf1VJ3A7cRAD+nK
	8till8zYcgO+vDm+Dn86dPDoAJAsGYGJxD4IiTFb4U1Z9eV5dKRX
X-Gm-Gg: ASbGncsHkn7jachGf30liae271Zx643oHfh7HyXXzq5slg0/xQ2gSmX69MG11HxCLIX
	2b1MLUGdMx/DW1jv1YJdan5K9UbR4jbQCXf/EP46LkGTzViTD758qfTYB0ZDUhzELFyULCn0BL/
	UVXKPzVGzzaNPnIZJxiwOzR4xZnaunoALqzsIlTm0DXZCWVh2+NnkB2iR7Xb32YCL3DTnGE8UXz
	KlnB6YTzRg9R9CIdga7rQg8RWBR/gmMMhMNKMSHUgjQ/nt6pJOxSYycgPtaf+DjoA/kpv0U3I76
	s7+AUsdcLw==
X-Google-Smtp-Source: AGHT+IEEnvYznkH+51HQXrqFv74DFt9PIG/zZkxeCWgT0J7CgcyGwa6gKNTfyx1CPkQQHYQGT1UTFw==
X-Received: by 2002:a5d:64ee:0:b0:385:fc00:f5f3 with SMTP id ffacd0b85a97d-38a872f7f8bmr13501284f8f.4.1736767443504;
        Mon, 13 Jan 2025 03:24:03 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:24:02 -0800 (PST)
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
Subject: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the bootstatus information
Date: Mon, 13 Jan 2025 11:23:48 +0000
Message-ID: <20250113112349.801875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v2->v3
- No change

v1->v2
- Returned ret in error path instead of -EINVAL
- Dropped unnecessar regmap_read
---
 drivers/watchdog/rzv2h_wdt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..ab7e35928190 100644
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
@@ -206,9 +212,37 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
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
+		u32 reg;
+
+		ret = of_parse_phandle_with_fixed_args(np, "renesas,syscon-cpg-error-rst",
+						       2, 0, &args);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(syscon, args.args[0], &reg);
+		if (ret)
+			return ret;
+
+		if (reg & CPG_ERROR_RST2(args.args[1])) {
+			ret = regmap_write(syscon, args.args[0],
+					   CPG_ERROR_RST2(args.args[1]) |
+					   CPG_ERROR_RST2_WEN(args.args[1]));
+			if (ret)
+				return ret;
+		}
+		bootstatus = reg & CPG_ERROR_RST2(args.args[1]) ? WDIOF_CARDRESET : 0;
+	}
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -243,6 +277,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	priv->wdev.info = &rzv2h_wdt_ident;
 	priv->wdev.ops = &rzv2h_wdt_ops;
 	priv->wdev.parent = dev;
+	priv->wdev.bootstatus = bootstatus;
 	watchdog_set_drvdata(&priv->wdev, priv);
 	watchdog_set_nowayout(&priv->wdev, nowayout);
 	watchdog_stop_on_unregister(&priv->wdev);
-- 
2.43.0


