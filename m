Return-Path: <linux-watchdog+bounces-3830-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C6DAFBC1D
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F116E1AA8460
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BA621D587;
	Mon,  7 Jul 2025 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5l0sGlp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2821765B;
	Mon,  7 Jul 2025 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918483; cv=none; b=NRWKA0LVWnHsP/vzecmHt0Wg71Qxl6sy78XHuRup29zs1X5SB9aDeCF7W6XtKY794zH5expxzHaT+PeQzLanWU1uaTeIMnVlSxc+fdOy4BLiCe+18sR/RBCOUV2wGLKTGDdjdfzbQPvV91HwnqMbTLmZidXg/6mdeiEa0NeoIns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918483; c=relaxed/simple;
	bh=U9n0UvTr/t+VGQ7z8U4zcE4CQNRSCzffzpdEn6vdQdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kEj65Yhr80nWB1iE2kV5dfI4Z3dPKVeP7S6Fv1342y4ZGjfmLS/K2YsLMoeFkryYQ6ERGc6WKzAyokaYDvwJ1lIozv/CcjoawwoIP94VafXa5YxVvAV6PJfurIfywiweYB8xZ1fvmVp9CdgsnUetC/UeCPpteorjW0K/GBp9Qoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5l0sGlp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453608ed113so39968815e9.0;
        Mon, 07 Jul 2025 13:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918480; x=1752523280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1Xoo1ntlvceZQYRguTvASHl7I+9j6IPVbVdRicARhE=;
        b=Y5l0sGlpWeJyQt5tot1plbCXs5kZPSrrQYQsk0SXJyfAS9A5HA4jqRHde3VAbAyAlq
         OJvYsVLAqVy+pA8g1UofS7fEARikwNbDwD38C0UolT93RpbmPT0yWqWbhPjm1nTfpLw0
         tAHe/sNOHNAuTtrDIu+6rjuMJSeAzmbDnsxbdpYCPZI07vZ/Uq5EnBJEw0YRTNPNt1Qq
         vcUXn8Cj7v9hA2v0Bz+j6AjOrZyCC8uffnj8UwVAiaDF4wFtoUNDqvGCKxT47H9UpA7l
         fYMH5a+OOMmsQw7es8Y/YEX1H0NKRaE87g2iWoA2QS/QopFmXNBqsxiSY2wHgof6J0Zn
         cD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918480; x=1752523280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1Xoo1ntlvceZQYRguTvASHl7I+9j6IPVbVdRicARhE=;
        b=vfxeCKwc7ytJEZMx1ZE94a52qG1E7/yPVGudoYWjiqoF4eavB8uX1pYAI2W3clBl2D
         PTTAx9ThVCcnQkdON0Of3H/plr0kGIe2G7TIyr0h5NEPalg5eGgL8FdWilMGAUShA6jV
         YkTZrmpbadxV+ki6/qHZW+izo7y32csqnjNX+c3Fc3HNG8d8m8xf8AThz4dI1xm8jC/R
         2HLpIH4s3N57VsHZp1tdgkSv8WyPcm8a4K5QFj1MWtuViIULGBCflYGy9PtCX6sHch8Z
         WNoW8/TPJ00KFILMUo/ZhzzgQGwozY+qvNVP53vhidyGgfQwQEUD96Qq43TzDWHGqeqO
         gxEA==
X-Forwarded-Encrypted: i=1; AJvYcCU7+D7MvTSH/lIiSNbJM3c4+MiEP/IvJy86B7NOCO1mySTMb38VYbeeziMl92cu6dv3351+lpWvynlBc8bHFK0=@vger.kernel.org, AJvYcCXH//mI1rnL2uQTX5vrXE3KbST6PcPgZLBqsXa4Ny92HOwjIl27VeEWjZ93BwE/uzbZY3ecI3XEaPQ4jqQ=@vger.kernel.org, AJvYcCXbZx/cwE7kBOAvK20UnR8Zv7HuomOIR0NClIm1WddVWGUWltmvXLKhzFg5rdfiXiwak28mzqoRN1eRHuSeezEPfgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfdyS7rC+L0cgZU9+RMe8NViMfxqc1H3P9W1UeBVkuyuhRrZm4
	didkWTZwVOfR/ZZVSBobAB+nBLQ7v3zcabUAhNd9z12GgBE6fOYi9zzu
X-Gm-Gg: ASbGncsa9KSP/G4YJw7H7KIeNy/mU4uAMKEL237EdTPkCi7EiEc8eJ6VFKVueyVb8OS
	oZnuHRCu/8aQBEm/wIfP9dPBmOsR/tHJFQuoovzUlslOPqoiBt1YvZcLoUw/5JFd/6ncrUaH0T9
	xGQLtpqsHzL0XOwB0kO09Cnh+FGQKDm73UY+mP0TbDhNep2on3iqhQDuIDPshqrdrcxUiNlTTJx
	Y0rwfBa5SSReEcW4k6QwXhPpqFzSNl7eOpPC8vA/Zr7GBVFuWaipjHZvCS9dNr0Rosx3hB/shEC
	PJX5XLn2VAJhF+S/Ag47RriI9XEvgWvEXKatIHYTrfuiancUoo99hsqIddRnz84Uy9UmY9V7Rfx
	u1jx9/8nwAe1sxgCTkEw=
X-Google-Smtp-Source: AGHT+IGTG+HvUhHQB4d34CJIXt07l9odI1qWSzTFctw0FQBsGmQGP/eE0+0G4Qu/cJSDZSXo5nID+A==
X-Received: by 2002:a05:600c:3493:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-454b306a122mr134904985e9.2.1751918479615;
        Mon, 07 Jul 2025 13:01:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:19 -0700 (PDT)
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
Subject: [PATCH 3/9] watchdog: rzv2h_wdt: Obtain CKS divider via OF data
Date: Mon,  7 Jul 2025 21:01:05 +0100
Message-ID: <20250707200111.329663-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the rzv2h_wdt driver to obtain the clock division ratio (`cks_div`)
from OF match data instead of using a hardcoded value. This allows the
driver to support SoCs where the clock divider differs from the default
value of 256.

This change is a preparatory step for supporting the RZ/T2H SoC, which
requires a divider value of 8192.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index d64d29709160..c2f39dd56687 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -36,7 +36,6 @@
 #define WDTRCR_RSTIRQS		BIT(7)
 
 #define MAX_TIMEOUT_CYCLES	16384
-#define CLOCK_DIV_BY_256	256
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
@@ -48,6 +47,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 struct rzv2h_of_data {
 	u8 cks_min;
 	u8 cks_max;
+	u16 cks_div;
 };
 
 struct rzv2h_wdt_priv {
@@ -238,7 +238,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * CLOCK_DIV_BY_256) /
+	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * priv->of_data->cks_div) /
 					 clk_get_rate(priv->oscclk);
 	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
 
@@ -265,6 +265,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 static const struct rzv2h_of_data rzv2h_wdt_of_data = {
 	.cks_min = WDTCR_CKS_CLK_1,
 	.cks_max = WDTCR_CKS_CLK_256,
+	.cks_div = 256,
 };
 
 static const struct of_device_id rzv2h_wdt_ids[] = {
-- 
2.49.0


