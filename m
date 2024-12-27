Return-Path: <linux-watchdog+bounces-2636-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1159FD72F
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2558E162E6F
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA291F941B;
	Fri, 27 Dec 2024 19:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQgsyks2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED161F9412;
	Fri, 27 Dec 2024 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326182; cv=none; b=C+EoCkVCHjmZx90r5HRjMbYqek+hytLP0p6mnSv8BPTaTQQ0GPl4h10sOWmYNJFyu43i8Q2hvlan8sKJhTe2zAuLBn8ZSrpMOI5e31M7Nmyy9lYAVpBwXMCacVMxOXCbhvMzqDEvtbAJgz0QMnDL1ZFysOFR9ATmlIgJv0J0/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326182; c=relaxed/simple;
	bh=4WW1Nh+0M57s35HSCTGGPlCChxVd+FBtroXEMAd5xm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxQJpm0rizNn69bEQTJo0L6mBZ+wgIQpvLo6GmoylM89buRAFs4/k8YZ6X8R/TguZ2D1JFByme0IM0eDr4Bxt+lujAFj3Xa1XU4vqs00gvk0FIvpz4XSCHtaRL3+zlO2LGIN08qWw3YHjkZqOIuOPcD58Ns0Tj8b251OKg/8bQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQgsyks2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21661be2c2dso83135365ad.1;
        Fri, 27 Dec 2024 11:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326180; x=1735930980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnGJoZlRUrYdkAVQ4f/QP85xE8hYegREqAdcln9UTEw=;
        b=EQgsyks2OEBdCF6lIDzvSCFlHpRnngeeNJA4pSccMMyhJG8Vbi1I69btMixNlOpiaX
         uK+4OK8M71THkg696W55BVXNbrdMhE9huthdpZT7LG8cQmBq+e47ZWegDptO6HZ1DfLj
         lGVdTGW4Lyp7OaYxcreeY3wPlQLLgo0+6iXZ0tKx4Zw6sQtm6MEDWYsTAf8GOVhoIxMA
         nLG63UL84nyMxJTnOsYfAHRyVNX0HgcrNaDMWLRcBVbcxJnXy1+exU1Pq20c9DOH46NY
         4dwmFkJ9BYB6dUXk96e1CbgAB28BsW8YBsMZ44EoqQc5aurgdT1BEl+zIQlYd9vzaB0v
         2COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326180; x=1735930980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnGJoZlRUrYdkAVQ4f/QP85xE8hYegREqAdcln9UTEw=;
        b=HDt80ZN0aES4p6xvvA5n0nPnnNxIyyKBcZ7fAphv9Kd4JF7Mka7bYyZHZWPiBA1axM
         0KcF2JPjeNdvBlwvKZY/mZaf9ITZmiT9It9g0niYCjy+ituEleRwBBnJdQamEymnSLvD
         zL8XeXyRrhkj8svAAWJxpyIl9DivVwPT8CoMaGaD0iqcqhE5q3fYfq08L3dSlL14NNCh
         r1kxV7dzEbyQkfLPCUcSSjXszCwEUkImoCsEiaM9/dsMYOxHZp6m2wnoQ1zIziSwgbMC
         g6otKh6umUeNSZFSN7w1+ZNvcdPxIFMCElaWm37AUJs98mal7tk3Ed1tzGGuMMLQhM+l
         +dPg==
X-Forwarded-Encrypted: i=1; AJvYcCUigmUEtnx0/L22KjWr2qOKVTB2s+xjF9h6J5s+7WHPFg9XAh7mgiCGCHRJySYWUwBn66EEITm1pH2v@vger.kernel.org, AJvYcCVA6Ri9bxebIMEXidTvX6JnCdBWmoQU0pwt34kjDH/xDym0m3vtdmwEE0Qq/qI/Fl1DcXlxclriLOj9QnmQ@vger.kernel.org, AJvYcCX56Eg3R56yvGUdD/oAy/X50Zz1ZYI6WEC908BVJuEi5UPnqrCpS9EoGcPve+39Zx7uUqs8MNxn4Ruu@vger.kernel.org, AJvYcCXn0NTgcwRtSAjs+WzEUDGFQ5pESLJO7ofXSWdbpPnz4auLn6OPe27y4TxzjIl8o9sKc/4vM13LEteZ5GYugpo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14fNtEEc884zN6Agibf+4KTM0X0cbzq17/W4jncCU7auuJZVu
	Wh48Fyk22Yf7d2Xnzo9YVNJbPUQyzedOq0+5pfKhQ3JQHejaXZ3d
X-Gm-Gg: ASbGncseG5BRM8/JSwhBcttwgGqskeSHtg0pxbGXykrIXikYpCd2YV1z6UKSsVay+Wb
	2ZDXFsFTvuz01kk7w7WLFL9n87RW5X9rmfr7kdidJbkkaPp1dPjhmXBtCEJQ7bynT9dKGaq1u67
	qWDxrPz/HtcbhRWSaQpg/93nBvgGvbGZzfTJ7aau9GR4pdyskxE4rBCSLdkq0xtzeT9SB0DcxYN
	zpqHoDcLdeNJzoou39Z8RJfzdX1pboxIhGLlTiBKMthc99oOaqO67rpKz18R2+8FU61/PbXeR7M
	h/CntmA=
X-Google-Smtp-Source: AGHT+IG5O7cWLLpJmsbueO6aLJr0yQj8VBZF2ZXs8WpyNBbP7ZJDIt+5wd8Gnu+YgBzYstim+v9+sg==
X-Received: by 2002:a05:6300:628d:b0:1e1:b0e8:11cd with SMTP id adf61e73a8af0-1e5e081ca04mr30619609637.41.1735326180495;
        Fri, 27 Dec 2024 11:03:00 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:03:00 -0800 (PST)
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
Subject: [PATCH v2 5/6] watchdog: rzv2h_wdt: Add support to retrieve the bootstatus information
Date: Fri, 27 Dec 2024 19:02:09 +0000
Message-ID: <20241227190210.69025-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


