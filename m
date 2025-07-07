Return-Path: <linux-watchdog+bounces-3835-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CAFAFBC35
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75B79165B67
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F4726981C;
	Mon,  7 Jul 2025 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4rbsVh7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99807268FF1;
	Mon,  7 Jul 2025 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918490; cv=none; b=H+n8WV+D+utcd1JI2pE14MjbhGhhJV2s3zG6luut9+0gSF6hiD6HzOTkjGROOI8GrO/4MtFq7BCizUH3DEV1gAOIkt6jbSiqDHOKjHtpwTzaEAgDfD+VJOgdkSg7oLzWjwjCuSjKz0HS0OPKgga6DYQxBi50rQEwtaLa4b4FtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918490; c=relaxed/simple;
	bh=qCgV8OST611D59NkSzc/EwdIYtLmNBOrjzx63kXgCD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwQ/IhW4cn/abrIRuToyF5vjo6czzOFy1IZerFNRPNyIzZdZJKnkMjVJb0jnOVVHM50kOLZnvFN95JReg7ZHJ10X+mne3zopR2mWpihza6c+Te4562K4O23JtX2K38cqFq7Lx2sZLrqzZhqMmDZp0nsSa30/8HWlci2FJsV0jc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4rbsVh7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so40170955e9.1;
        Mon, 07 Jul 2025 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918487; x=1752523287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZrpm9nJM06WerhRVJGiNfhVOSjxE8zl1qw3t/9H9SI=;
        b=H4rbsVh7OPqOv8bwjUX51Ug2Hb2w+00ayDgpLTk8Yw3muP25/jbGrV65+EInG545vu
         Ucph4hHU+W+CgDUaIW7Kg6o25fFsaGDXKNNYc7xdMbPXg7fIyHZItWcJ8eztmMjoWJl8
         a61zKCb/3j2UTbcCMSxH+NqG4hVxR5I9PL/GHISWJCIA01Wgk0LOuYl7EebrwrtanzDJ
         7HFDDJQ5+Z8PoGVxFTZhkG1nLyCwVNNLiR06FkUnkOldvqRTpYjzXmlPvXWnePzg0AOL
         HQQ9uHx5kXV4uItDor9sY/lxTCiEDvOe8oWcYLTu7iVnInUYdWpMCnlKaLBhE3gYh7hQ
         eyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918487; x=1752523287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZrpm9nJM06WerhRVJGiNfhVOSjxE8zl1qw3t/9H9SI=;
        b=IJ7UyCyiOlcIxtlzpEf2Ait+/PboyyxLa7ZxSpP7IDMxrX6nVylGrvfDgwUOo6hzvI
         wsyutNvPdYpUUha2pLP9Yx2+8P0GXC+XAXpJsRUoc9v11fFk223NJOREDrdQ4IlEdu96
         SkKBS2nJEsPTLcK3vSR35FbIqf6WOfMKdfqPo61b/P/nIJRcy991i9JR3B5Cio6uHzOr
         AnbxaQMhngpSbHkPJ2TC3Rl3dTaoSS57BPo0FkcQE0IvvGWmRqUrFP2AHl8FIlrd/Po1
         5az1d1mwvShzR+gWe43RcBa//jB3pFytd/8FoRxUUnsFnY+JTyfBXaBS+QWgUVOuhW8l
         wiHw==
X-Forwarded-Encrypted: i=1; AJvYcCUuaktf6t4NVSoZU3zqmR3siPduC6M8Kkf+Z1Dc6LiwRlR4e5sR94t7QtMYPZT5uKASEGmlxW4y9aaPBM8=@vger.kernel.org, AJvYcCWKYVQCV+QgEOQf7NQum+ylxWC4ySgAQTRcF4YsvsYktTPZihg2P+ZlQYVb2Y01VWJ0hxY5QQxAPPuSAe8imQnkzvM=@vger.kernel.org, AJvYcCXDJQYrWB8OhdOSgUwNBNzAP26qkQD/snFL2ofiNTvm+ctXOKvKresxpCtGVyua68cTRjWr6JnoiWnFs01ugaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15QS7XnckJ13n6xqJJ3Dp0qcvdPsuAkaWLhNdo8J7kIcuSIAP
	loq1Ny53mcdMFxfZphVZHb+TorStWkuMYg6wQoNWaN7tUfIM1xT6yC3dLEvb7w==
X-Gm-Gg: ASbGncsmfjvkFJzeaIakyxWeSkdBYPdULKxTAj3awOVQpwcZG2cd0gcbmyUUrwF7GWW
	d8ltML5F0xWMixwtq53oVJBa2ko6DpdxRiEwMplFavBn5m7wWEvS66JSZ6WKNYxp8kHajf7i9HC
	AkjOl9cYxfAgwu7i0H2O5PJYKKNpW1ISVvhb4OgqOGQYPdMgu9w4yPtY1xhHx/wvAeAqQe/K7p0
	OH45ngj3Rim+0THBY+OhHArIb790l/BmwkP1HgVdBWhQzYfmd+COggyMrTo5zQWM+layASzfj72
	XNeQ8jKvQkF4kglkAUymDqwcnQtMfyc5UmPVJmnsR5PLJvev+J8bSOXc2m2sdMFUbYJ2QpH+hP8
	MDlTyIoMBs5SOofNs6p4=
X-Google-Smtp-Source: AGHT+IHY/v+RTL08PLy6womTLLxmQhluTTjkkedNBxyHc/zF4l2YyC6M/aeDVLyO9W9pfxaF8QBdeA==
X-Received: by 2002:a05:600c:a104:b0:453:7713:539f with SMTP id 5b1f17b1804b1-454b4eb8afdmr90464455e9.26.1751918486617;
        Mon, 07 Jul 2025 13:01:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:25 -0700 (PDT)
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
Subject: [PATCH 9/9] watchdog: rzv2h_wdt: Improve error strings and add newlines
Date: Mon,  7 Jul 2025 21:01:11 +0100
Message-ID: <20250707200111.329663-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update rzv2h_wdt_probe() to provide clearer error strings when retrieving
the pclk, oscclk, and reset controller, and append missing newline
characters to dev_err_probe() and dev_warn() calls for proper log
formatting.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
2.49.0


