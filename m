Return-Path: <linux-watchdog+bounces-3924-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DDB150B4
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F9A17ABE4B
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 15:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B5329B200;
	Tue, 29 Jul 2025 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNGXr71z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1F2951A8;
	Tue, 29 Jul 2025 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804775; cv=none; b=MpCzdOveVs6DUw0qCGF2aBIaES9dtPeskThwmhKEFAb0jYSI0pwZ+qznveQPxHI3USNHnjBcd6yXS1vwXuZAY1zG4cxD6r2U7E1MK22OijO4vNI3Y307tgs3pNDXVOcfMJXBNU7ROUtEn2FKan/Y/JhPrjAUxIeJgQvC0J8UkCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804775; c=relaxed/simple;
	bh=qijvZ0ldY8tfO052bu9qwgPi3S9ADxw7SiseQRFSEsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUVfJnwaaVG1ekmnps/Ay+wxemdwJo/h/iNwTVqhcCrnDPAQVPK3B/zNtigdlgoI1PFBU+RrqP5yWu/WC25D9/jd/8Tcgnp3AFsCg9o7rm7MHCSkV6vQgSAn9KGMLr7CQeujoHqxutcf5r9Q2b66c7j9WL2368FS4VgXnXkSw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNGXr71z; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b783d851e6so2804403f8f.0;
        Tue, 29 Jul 2025 08:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804772; x=1754409572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AShRiryHO7F/QO/kgY5hVX4Qft3GQ8t4IUNBt9irlp8=;
        b=JNGXr71zAzKEmIcqDWObO48LfSXJAGRVpaV/36u3V5B1s1Dj1AqBEmEmj+q03f2/dd
         HCKXu/Q116JY6hqG+5XYMmt9BHxLEr+9VQr8alshzoKfJlGY2cejv40hsvyt3iM02Cc2
         jr2HACVNkH0rlRM13kr4wDNEpvs0mYpjdx7+SgJx+IxwPje1QaXQHn8Uwcs8NTDN7lxT
         Y6rX3JroE8H5V94S33Rk7/u903N4lA6P4WjvJiZPA5gKELiZ3krvy9Mq+7ROQbMblTbg
         hbF9r7mgOMhwHv3Ox72qwQfHoJ+eYNUUJsd4DXhClWrzwXjwaiFygOtuH7e08vRt/rJE
         1k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804772; x=1754409572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AShRiryHO7F/QO/kgY5hVX4Qft3GQ8t4IUNBt9irlp8=;
        b=WrswV9OgFFP0+kMzMTtk46UXVA6u9S9AOx5lMrUeP705++oxM6cXxdWOCNSk8bnbuL
         BzHapopXcM5tw3HIrWkEx6ErFCZKsVLBXf/bVOHpZr17kDVzA6zIjyWuyqvgCEATFrKL
         ifdng+R0jab+ZeqKcygVuLS3E3JO9RVacZEsaS5LKCDzJNxwdxtgFtZZ16SehJyMTsMf
         Sf0tbN0bAe8qVBoz4HT4Sz21slj8q3nUYrE/yzofrT5X/3WKpdM7W2bx/uyGdyOgNshE
         jdwuK4pp8yk+SIA1ud03YBI/Pk3EI9t5aY9xDcnwha2KDJ3p3sRqv+m2uDiscYlzY2u/
         rlHg==
X-Forwarded-Encrypted: i=1; AJvYcCX6jruGDHNCUs0EtTa+nUXge4NurVFwoDXlQwsH/k/J7EEJtp2vT32gzi8BdQrznaGxNJoT0C4MuDzypQMf@vger.kernel.org, AJvYcCXWxv8MVn3TFLqrplrf2AEteQDb8fBo6B5dCHFIMvgzsqO2X4ZCMIZ7p5MnkxZx9BeHzb8YdZm5uPIb@vger.kernel.org, AJvYcCXa1AhjtkMwsm+YdHqNt2A9yYbAdiVjEMqfoqcMQ8cCH1JfldNukqBnLppvZ9TAb7N9xFjqNUv3TNgLiZApMCSgoQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wJwbHe+UrXkmfI2ObEJmVMriWTYB6o8088a9qz1mn0oFgtzc
	Zw08PbolTTtU84Ppa7pqfr5X5TA+W8PtolzYQE+dTzS3CwLS3oVF9VAA
X-Gm-Gg: ASbGncutkpb9YSla0A4dDFyhkOxnTzD0aI6taQBE3q3BI5+84nZqDL1cuz2fSGgVgMe
	4Z11i2Cm2v3zB6vEgFa/YTXEIVuEKsqdHhNWox99p+zmfKMfgdto0lgUGU6eUby3872OTx6rwh+
	P8fPLgoTlUMxKFFJK+RS5j6lBzV0byEJPPFcrWxAGFK/LZLXdKYtcB8Gz4TRnxlLUOCA5lchxTp
	Yv+Xip8RDRxH2a/7o9biWZ7uqcYTKjAET6HbfMblAtcvZ1JlVr9uufpMdjpminq+eseDe1610pO
	gg04ihfpp6sTyRxzlZ/34LZHen1Av9zWOLANi0VKGXACgkAQPytGBBHTLdctACq2xCqrBX32mD6
	XF8g0qB09feSfLeoRz2L5OTzDorjHIrhmPjdd6ieLULqLk5ZmogpIA+fI1SyZU0nCk/e+r0ewcg
	==
X-Google-Smtp-Source: AGHT+IFUNYWjN85krBi94XZ5vcJuA1ZR67t8AOlPHUGM+7xuP2h0SFzhCBSUxGl/fZbaBk44plPtfw==
X-Received: by 2002:a05:6000:4203:b0:3ab:27f9:e4f with SMTP id ffacd0b85a97d-3b794ffe745mr150976f8f.35.1753804771950;
        Tue, 29 Jul 2025 08:59:31 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v2 9/9] watchdog: rzv2h_wdt: Improve error strings and add newlines
Date: Tue, 29 Jul 2025 16:59:15 +0100
Message-ID: <20250729155915.67758-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 1b32bab87d67..db76a7c0e1d6 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -292,16 +292,16 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 
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
@@ -338,7 +338,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 
 	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
 	if (ret)
-		dev_warn(dev, "Specified timeout invalid, using default");
+		dev_warn(dev, "Specified timeout invalid, using default\n");
 
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
-- 
2.50.1


