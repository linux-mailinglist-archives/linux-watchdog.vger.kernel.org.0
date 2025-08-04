Return-Path: <linux-watchdog+bounces-3958-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2188B1A9E5
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13D147A9D15
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F3D28C5B3;
	Mon,  4 Aug 2025 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0oEO+d6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8024F28B7EB;
	Mon,  4 Aug 2025 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337456; cv=none; b=ajyFnRUDzg3NotP53vkxg2bivfGfTg24/UeKOHbIxuEnAy7xoZkoSXJcbA2Fsipu277bbTP1PPeyh/6SDbkj8lwGV81r2CCFD/DHy/WgpumXaxe6CscjPtMP+MYmQRuJXtmZVie2+P9s8G9UlGRQJzx2iiksVHLWt5T0118b6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337456; c=relaxed/simple;
	bh=9j9aJ6r1I2u2YDmF8Y7JiU78TMonHg3Fu6HE+g3S+Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6KoXqW503LQ1s2kHyunSQIjo0e5ouhECWwmaTHcameiO0UZBolg2B2aE7KUB7F9YXCs5GEG1ecIGqRYdn2YVn2bxAgJ0vYoRJh9v1GZsLzWEU2lx9dZIfIcjea90LJc5Xp6MGrLn80O1ReoSEBFRlW5yf53CUakPNu5g/UhY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0oEO+d6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso21801355e9.3;
        Mon, 04 Aug 2025 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337453; x=1754942253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOkmDnsNkA+vW/lZ6uq1C/Z7TLqfpXQVz8a7heaHjOE=;
        b=d0oEO+d6SW60F17hhLmUKgPKvllSdSeZRZCkYKHNJ5BGObWLbb3Ed5ADkpx+IfoqxC
         mOHTBZ08btBY17IdiznNUavvkfQI1aEYUw624cZasnZiQi2DvS9Sd5uWPx3r6kqGwxxn
         7InRYWMeb6oxxjSRDQy3r3m/jfyOIRCJc/q7KYuchhoJqCFP8LUCsbZsUsNui9JumIqz
         6PP9rJhbpmazNHWp5oswFiryWiDyo1+m+EraUkNO2Xq8JkpUDPs/H/aoNiFvWs7TZfBv
         CFT6atA8NKpJt1finrQXEY43EMRsJ7jb/tAHUBhX0zvEoHejtvieLFqRgisasG4Q+VcC
         L36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337453; x=1754942253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOkmDnsNkA+vW/lZ6uq1C/Z7TLqfpXQVz8a7heaHjOE=;
        b=Wvq1M0PvpkhPo39Ic89ie9iR0tWR44KqJSHKdjp59oN5gn+SSv9FZWl3kRZKgIaGzi
         OwB12sg18uICk5nIt+15xMHJvJDAZIxlcwQdLGJMTWQNHfLrXb2cOjma4cNK61vgOLyb
         Y/arkWA5ZKMvFNTgMxRItHDI8OBF02zYLtpUE5NVL+KlyYlIRx4AkKEZ/qGh/sa/MTuJ
         oxO2Vt6eQ6WTRPiyU3GXi0/tFjPRcK8kf1l3HLZN/9wO9/0ZLLV9bnO86nGVIJSezkVi
         4OemEC0NUWS/MJZp2kAXTzjOAzvL04FlIf6KUzbPx4guOUDRuKs+CjNgVbEY8fQASNv6
         dABA==
X-Forwarded-Encrypted: i=1; AJvYcCUf9HfH97UNZTA7K9JhA/gRwoZLClrLe5h7pzDy4JhEdZfBIz3IviMhGWeXgR8b7eK8N9eTBMuJw4xm@vger.kernel.org, AJvYcCVifzR42MCX5BZfudGQlCPwFQioNp2dJaeDl3B1dFFXilhYH9B2YX4aAdgBd2/t12DQopZknM5OvzJ14c4Y@vger.kernel.org, AJvYcCWLOQdsWNo71tLl+0VMlF2RQmuYQAYrVzw/Bg4EymIjpr37pMx13lP07XPg5sfW75vegbDJ90CgMnqwTlwGS0KeOxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCc49H9riMlZzTpDCq2oyUU5LN1c1vVoyXD5rFhtRcE0za/Kpy
	coSO503b16LzMJepxtUKhsakPzSJYKcB8ndRDs8Xp3H7C9f/Kb2w3wna
X-Gm-Gg: ASbGncvER4qmivHcVcPk8QE6/Zy6nHiTovu29b/w3UYjCL1Fo5FpPTQ0xBfRAHSC7Hi
	i8GrQ/oC5yOPrR5lawM0Z3MnJnACClU3ysJnF7pMWEE/m+dMCjTpqTx9SZt+fky2K97dfZAgPHR
	TOxNKut7Cvj4oUmSTfRb6a6/WsVh36AByxGH8mbgxlLB9bZNT9QBqpL23sL94O8mC/IhSmG7YZS
	k1ifzqTC+fUWHKkgabwWrYLJsCtCDUtKgZxOT2aRmLjqXSDNtQSfX6HIbR+j10etCCgW9OoZu2q
	n3IEp5GkRtMCTDGY0yeVtQ+bbFgM+EtPcXYDX9s/RywD/n2SMjguIXMFJjq0VSRG/qofRFV5ZiH
	MKrcyWlImSBQRcpaoTU88iwrfaTB6CdzZoTB4fmZeNhpZGCt106xozjVOaPrS+Z5hSJlEI0tc5f
	GdQXn/n8ag
X-Google-Smtp-Source: AGHT+IGszXavcuwTmbVIqme3LnZrlrApp0gEZlMR1LPQF5CI+fQ0RrxBWgbIu28RuUUVaSgWi5hsCQ==
X-Received: by 2002:a05:600c:1d0c:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-458b69dddedmr80540125e9.8.1754337452658;
        Mon, 04 Aug 2025 12:57:32 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:31 -0700 (PDT)
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
Subject: [PATCH v3 3/6] watchdog: rzv2h: Make "oscclk" and reset controller optional
Date: Mon,  4 Aug 2025 20:57:20 +0100
Message-ID: <20250804195723.3963524-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the rzv2h_wdt driver to make the "oscclk" clock and reset
controller optional.

Use devm_clk_get_optional_prepared() to obtain the "oscclk" clock,
allowing the driver to work on platforms that do not provide this clock,
such as the RZ/T2H SoC.

Similarly, use devm_reset_control_get_optional_exclusive() to allow the
driver to function on platforms that lack a reset controller.

These changes are preparatory steps for supporting the RZ/T2H SoC, which
does not provide an "oscclk" clock or a reset controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Merged with the patch "watchdog: rzv2h_wdt: Make reset controller optional"
- Updated commit message to clarify that both "oscclk" and reset controller
  are made optional.
- Added reviewed-by from Wolfram.

v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 755067800ebb..3c02960b65cf 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -230,11 +230,11 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->pclk))
 		return dev_err_probe(dev, PTR_ERR(priv->pclk), "no pclk");
 
-	priv->oscclk = devm_clk_get_prepared(dev, "oscclk");
+	priv->oscclk = devm_clk_get_optional_prepared(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
 
-	priv->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	priv->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
-- 
2.50.1


