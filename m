Return-Path: <linux-watchdog+bounces-4022-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B0B2E68C
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034E7189C3F4
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9737A2D6E47;
	Wed, 20 Aug 2025 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWNPbiQt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F92D47E1;
	Wed, 20 Aug 2025 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721416; cv=none; b=AkERXyd/hLkqHhJIoC3VkG+uvfcY69iUJeGfxV4Y3/2cz4mmvJnhVQCbweA0+DhX5yMfxJiNwkKpqBlT6eAa30PgU2wqUGKdYrb3WTgV4PikNAIxIomfj46sVvHCp7bi9m5RZrgZgS/UvwCbno/sJ2GylBjuJoLc+uW+vkO9zbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721416; c=relaxed/simple;
	bh=V5K9QEx8ADSSy2eD7GW8zzIdgoFeyqTWYgIgn9bZc4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr6hkYLr9yonjNw6Bx9aUWVBn3VHgZ/hgYdAdqOfU0gjHG2T/rcg40L/wkTJA9Ce9yxdTr4kbVjQKh/2PQQgjNPS748vZPtNOZDMAR9VBZqXHiKGrdUInIIDEzl9DiyYfdRa6ozx/Qi3fnrpGskipXwW7agXWoYs4J1w0TA6saQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWNPbiQt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so1612045e9.2;
        Wed, 20 Aug 2025 13:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721413; x=1756326213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOg6o2MdpWl+NZL59tvPC1VGwC54+fKIAVm4C17XgSs=;
        b=VWNPbiQtk7SAC1fkDFRE5ZBGHOMunHq0lckWhLSjstzWho1IfhXLwc6oq5NEk8rTNl
         l9xS43aVopHFC/90VVZZHc6lkJVCxy1unG3Y2Aj1rFvnXYKWkHlDXyJ5yW585RffjCsz
         wgp4EjAM68EoWyu6EBrZdO9wKM13j7bLtm9QMz6HQy6zGQFXrnmR18QD0RvO3n1OPitV
         hWO10WS/BAmKV77vi+MJgtyz1whSNVfiQQujWRynfuaxmSaaUe0oY2C6TXePME13xLVf
         s3eobw8qEU2IqFWqO9PbT5PlobDVGtDyyRvFGf6ow4Wq0t/tiEZwhJTDFDda5a/x8Ha6
         QK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721413; x=1756326213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOg6o2MdpWl+NZL59tvPC1VGwC54+fKIAVm4C17XgSs=;
        b=M363Xm0d/anyaZIYfCVUhfjTSG40yrm8g2nlOL51a6ROPA51fxnbtELdk4PcUzZpA8
         DrQCNN0d0FKqVoJBMyMDeFUNtfsB2oDxWFoGa25liYvSqN6TRh66psqMIcVw3b5/BlHs
         wiXtva0kD5nM3fXIt3BCJ51zxN6RjpYvz+CLt13VDXsUDKTpyi39g8FoZAae5O8lk4Pb
         UhuotOgNcGXBGxHxrL2zIussyW35zTkSZDFUgeVF8UQhct9CPT7BtHsGk4LSTC0d9pIu
         cP3cQ3ObLAoXKAMKSllRqGc+0NsrKhDzpRHjVrJYGtZ0i8gYi0rdDRDn48toMl3EK2Va
         ia6g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0fR6dUFfdhi1LIwzRPjPV3eDeAqkGD7/SrSLASvpR5f/HMlyUElPD5VDs0TmPnvazugSVXPfZq3kCYlBBl3bEs8=@vger.kernel.org, AJvYcCWMivHXqwWzEtFZ/88VwpK9Zl0twG4h1338pOIYUnCvfYsGdKW8HMgPRCAhKc7Ymc5XE8lL7pXYANahKO6y@vger.kernel.org, AJvYcCXBYtL9Vyzaiab80LsdN83zySGavGiXMhCTt5QmKRxlrjOcTTfMsbrhwpFEyIzjkzUho1HpTgXSJqxq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqokf/IinZPA9MSH4K5R7D6Oe5xHeqT4K8KzIOc9SRfepf/PFp
	2RUBKiH3ftmF0Kj7mG/2gyFllhj4kcxT0jID/SuuLwZb3+7cko0JvUsL
X-Gm-Gg: ASbGncu3M6EQ0X8mNuigm7JEYZaqWtRBArKtJTsVbLdLfE9H2zzaxmA33fqGZYkVZMV
	aGrLPRfxn7eZhjti+4w0jOKp6R4QxXpO8Vc+XjXDvWHyljVn561Lzmwh5H0WQf9W9/XPOLHHqs1
	PAX+2WRH23rznZ/F39Kr0xtWAbp/Uxz1HfzkdAM2MIbBWPSDFvu3XzOb9oL3WJQPUvJGKsTINAb
	STgRQUjscZbrUWGORhXZ4kjyycxWb6ejBYkHBvm4wE9t/Wq6JNERLI0JwmNjBdA+Xjn8AmLzw8Z
	7wwMScEufPbmQwlnDmUnWQwf5obbBMwwO99NQGgoGJ8R82As/x6RZZ0UHRKGJphwY+6tPorj5bf
	rML+HVTvwcNw4TkafBsxCgnlaVN8doOnxWL5cCCk6Sl4tI3ZW0WLglXlr
X-Google-Smtp-Source: AGHT+IGwtdZtw439q2hTXf1RRpj+mXGxqMZG6j5pMhfYrrfZPPBdt49EmB7QuwncrkF4ei8UK83yNw==
X-Received: by 2002:a05:6000:2c12:b0:3b9:1d32:cf63 with SMTP id ffacd0b85a97d-3c493f65b97mr108154f8f.8.1755721412715;
        Wed, 20 Aug 2025 13:23:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:31 -0700 (PDT)
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
Subject: [PATCH v4 6/6] watchdog: rzv2h: Improve error strings and add newlines
Date: Wed, 20 Aug 2025 21:23:22 +0100
Message-ID: <20250820202322.2051969-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update rzv2h_wdt_probe() to provide clearer error strings when retrieving
the pclk, oscclk, and reset controller, and append missing newline
characters to dev_err_probe() and dev_warn() calls for proper log
formatting.

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
 drivers/watchdog/rzv2h_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index ee3ed5a6d98e..2027795f212e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -296,16 +296,16 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 
 	priv->pclk = devm_clk_get_prepared(dev, "pclk");
 	if (IS_ERR(priv->pclk))
-		return dev_err_probe(dev, PTR_ERR(priv->pclk), "no pclk");
+		return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to get pclk\n");
 
 	priv->oscclk = devm_clk_get_optional_prepared(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
-		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
+		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "Failed to get oscclk\n");
 
 	priv->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
-				     "failed to get cpg reset");
+				     "Failed to get cpg reset\n");
 
 	switch (priv->of_data->count_source) {
 	case COUNT_SOURCE_LOCO:
@@ -343,7 +343,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 
 	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
 	if (ret)
-		dev_warn(dev, "Specified timeout invalid, using default");
+		dev_warn(dev, "Specified timeout invalid, using default\n");
 
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
-- 
2.51.0


