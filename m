Return-Path: <linux-watchdog+bounces-2567-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B29F142D
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 18:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B178328287C
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 17:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220111E5710;
	Fri, 13 Dec 2024 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHVUzKIT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63171E412A;
	Fri, 13 Dec 2024 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111871; cv=none; b=LvIYac1MvNTAk6DZPPcda9qiR4C4cMkSZprxqJQq4vdQ8z/HfEfc/MX4Hz6ZLLZI+tur1dc5ksRi1ZRQfetHjz5MHrmgbkO5Nlz0JqzRuCCLVU6qDeGdHflPAGIwScvizuq6ehosr6i0qB42NTu8XTxpFe6BjUpDA6VBtzbcoCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111871; c=relaxed/simple;
	bh=nknOgVwG3RCKQlEd/MN7YEnG/xsR+xdHy7WgwRNk+50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hz7wMEGg4/IEGTzq2IrtQL2rZDgBMj53kz4qdJ6lKDAldSH7ni18N1U35w84MsdXKfHTxn7QGtGI6j553F19XM1PssD5xd0u0wWpaJ1JgKy5+XG6t0uDmoI7HYKrN1/WUtkxUzgRy2+PIbpMFcLAur2G8cW41NndO4UB+eHoLuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHVUzKIT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43628e97467so13810005e9.3;
        Fri, 13 Dec 2024 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734111866; x=1734716666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdGzxlnxXPszw2dmBRPxwLpnCH861/F9dbdJa9ZUBPg=;
        b=nHVUzKITKVwaYfQtLZg5f3T9i7sKSu58904SjzENzGckK8P14pL3UtYBYjzfKQwGSn
         HvYZ2LI20SoFMls7MSqPd3/wJaSTlpK//pARoyqSXb7CH3oi9p/oqxdf7U3Xzxi3ijFK
         GDc+dOrcmb4+e/T6tVzaps39Y4pB+BTa3n2Sb/2Lc09x6gx9reqGtbF5dmNi6GP2iu7n
         aLJVjqIimeA8nDnQVcJoMQlIsiIq5xvdCIz426V9aKnTnFPkXmdE8iW9ZyGY/iRFF0K3
         3JN0xN9ZyXaDASxasDatzAh6QEhcgiaAdVN/De7Z/oNZ4eKTG38FhDc4J24p8xWfgiK9
         Sk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734111866; x=1734716666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdGzxlnxXPszw2dmBRPxwLpnCH861/F9dbdJa9ZUBPg=;
        b=jb73BLvHdc/JiXN3zfYJVPvO7PKPIEO4u1O/6ueaz3QBTIgbUem66JOLJxL8bPqn5g
         /jB7f5XwOEewtrMbjyUF7xZcOuvi86nidFr5EUdInpypAaXXX0JRtFsg+kdamcFwpl1o
         fYgpT/UXRMF82BDeoGKjtkq9oDvd7N1Zgbi9g+iuAG5HUksw1pUKQzozMsAP3wkOVuTk
         U4cAdEf01eISjM0lDAGap7VuWk0BA/Z4qlxgILaxHXtVBEcF7qkhPAf4BDMl2Kh/yCy9
         uUVh1AaaKg4FEixel5b7hDi65Qb8F/Q3pP3gsq8bJjw88GUolh5NkcIiDAzYySP+yy+M
         7K/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6Z03oOqeOQ7UHJc3LWuRUfsWho0gIqY+aWp7dtsBs1BbKzR7rfwBo07TTGYDk/3GIsda3onQlnJu5hNi0jRA=@vger.kernel.org, AJvYcCUcSjufG5yLbcwfmYUeRzaOk3eXaV8MYxOwr7MQKqmVin7sUYJ1hXT3F+xmxsarQMZNAHYsIOrQnWCpT3V5PFetVig=@vger.kernel.org, AJvYcCUiD6GVcReXrKDsbO8LdamFX5qyDpSgpPbLrmd9oWsrRcKjyHbga33WR5pnF5QcmHNJo/18QSPzHi/Dz+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4KoD0Nl4X4N+ULPc2wtt8v2vbenQW7iESpD54UNWXplb5GZ+
	uN9qpW1+zmTYhBg3TuV9bVD/ge5tLzZacMN2Fhuc1u73u+nmY1sj
X-Gm-Gg: ASbGnctsOUWK2lebrtK0oNJcbPp0m5L2l5LcMoEpPjuMF8AxL5oRGyDvgETGRd6SSaX
	pni0IfGYERL6E4KmOO9o2XNQtcqXLsXvylj/neX1uaM1117c/h0tIeSLfSdLwu2YT2qVgDJnC28
	ytudBZn4+VTEjyGPeDdnNrueGj+3Mwzq6eSgvMlaoPcxJgozy0nFqrl0sqJHSpyNbskQXIWLrDX
	mp+H8uDwA/T/JHPyJIyt3cUaC4W3BwVon1FC7HF1GKVKmDAcChY0p7Skb3SQdH1gGNFA1p8tRB4
	MCx4H6mWgA==
X-Google-Smtp-Source: AGHT+IFUBR0OpCNikkib0NSmTgitbT6MEEfTidX4W4kFAXM+zLn5PcXdSK8IwCJy/N+pHg236pGtUA==
X-Received: by 2002:a05:600c:4511:b0:434:f4f9:8104 with SMTP id 5b1f17b1804b1-4362aaa4ca1mr29348615e9.33.1734111865861;
        Fri, 13 Dec 2024 09:44:25 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625717c9fsm55520975e9.44.2024.12.13.09.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:44:24 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the bootstatus information
Date: Fri, 13 Dec 2024 17:44:19 +0000
Message-ID: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

The CPG_ERROR_RSTm(m = 2 -8 ) registers are set in response to an error
interrupt causing an reset. CPG_ERROR_RST2[ERROR_RST1] is set if there
was an underflow/overflow on WDT1 causing an error interrupt.

To fetch this information from CPG block `syscon` is used and bootstatus
field in the watchdog device is updated based on the
CPG_ERROR_RST2[ERROR_RST1] bit. Upon consumig CPG_ERROR_RST2[ERROR_RST1]
bit we are also clearing it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
@Geert, I intend to drop WDT0/2/3 nodes (and related clocks) as HW manual
says WDT1 is for CA55 (I'll first confirm this internally)

Hi Geert/Rob,

I havent included a binding changes as part of the RFC as I wanted to get
some initial feedback on the implementation. Currently CPG block doesnt
have the "syscon" this patch has been tested with below diff to SoC DTSI

Cheers,
Prabhakar

Changes to SoC DTSI:
@@ -243,7 +243,7 @@ pinctrl: pinctrl@10410000 {
                };

                cpg: clock-controller@10420000 {
-                       compatible = "renesas,r9a09g057-cpg";
+                       compatible = "renesas,r9a09g057-cpg", "syscon";
                        reg = <0 0x10420000 0 0x10000>;
                        clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
                        clock-names = "audio_extal", "rtxin", "qextal";
@@ -455,6 +456,7 @@ wdt1: watchdog@14400000 {
                        clock-names = "pclk", "oscclk";
                        resets = <&cpg 0x76>;
                        power-domains = <&cpg>;
+                       syscon = <&cpg>;
                        status = "disabled";
                };

---
 drivers/watchdog/rzv2h_wdt.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..8e0901bb7d2b 100644
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
@@ -40,6 +43,10 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define CPG_ERROR_RST2			0xb40
+#define CPG_ERROR_RST2_ERR_RST1		BIT(1)
+#define CPG_ERROR_RST2_ERR_RST1_WEN	(BIT(1) << 16)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -135,7 +142,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 }
 
 static const struct watchdog_info rzv2h_wdt_ident = {
-	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_CARDRESET,
 	.identity = "Renesas RZ/V2H WDT Watchdog",
 };
 
@@ -207,12 +214,29 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rzv2h_wdt_priv *priv;
+	struct regmap *regmap;
+	unsigned int buf;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = regmap_read(regmap, CPG_ERROR_RST2, &buf);
+	if (ret)
+		return -EINVAL;
+
+	if (buf & CPG_ERROR_RST2_ERR_RST1) {
+		ret = regmap_write(regmap, CPG_ERROR_RST2,
+				   CPG_ERROR_RST2_ERR_RST1_WEN | CPG_ERROR_RST2_ERR_RST1);
+		if (ret)
+			return -EINVAL;
+	}
+
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -243,6 +267,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	priv->wdev.info = &rzv2h_wdt_ident;
 	priv->wdev.ops = &rzv2h_wdt_ops;
 	priv->wdev.parent = dev;
+	priv->wdev.bootstatus = buf & CPG_ERROR_RST2_ERR_RST1 ? WDIOF_CARDRESET : 0;
 	watchdog_set_drvdata(&priv->wdev, priv);
 	watchdog_set_nowayout(&priv->wdev, nowayout);
 	watchdog_stop_on_unregister(&priv->wdev);
-- 
2.43.0


