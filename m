Return-Path: <linux-watchdog+bounces-740-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBEE86AA12
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 09:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50F421C21464
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 08:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0B22D608;
	Wed, 28 Feb 2024 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mCqO27KJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866A636138
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109206; cv=none; b=toCFbwgcXgYG0DfR6eAl2HWzTkxYxw94tEESnKxg7zGCYTcgRdfJw6jxkSxggrOjPwrUxLlsX0CIMEW4zJK87BH0ZXTk1hEkOxmcEhxHEfJoJw5MkkqDf3GYRjlOG4P1Pvf1qrnN/rVWtu5u/WaH/PlG5H/cPyxcmzJBBc6p73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109206; c=relaxed/simple;
	bh=zMATGWmbhje5tfDxfaCFVw5MU9tqi71sQIaQ5Z5dkgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ragRWnA5ekLDgE0h3WMVd59y5++WtWUnPFYQwU6MS8N7eFVqraqHgiGr1VBdB/YD/DlqN1MxCk9+oazmPQljAGgMhEc7/Z3xK5nh8OPM6CGkvdH2sliuDeRhlBneYDAqFjWpYHJ1Dryy9RDewkyVa5e3wZXTcysiRS/97G6Fd20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mCqO27KJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a440b1c445eso31102766b.1
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 00:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109203; x=1709714003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2oYKm4kbcjnrzOPJaN5bBfK4oadekuOvRl8x7PJBXU=;
        b=mCqO27KJ0IiF9CFQu6XrmeICFGNZ30/aPnUv9BS40YIcd6qlC1XDQSDJd4lr8m9GEM
         XAEc9Y8q4oHPN9b8Dll/ZgqKE5ESH6LMDFr3WIengVrh2DYsdOeWAqZsfb4ufxAvx2Sg
         h2QRn0sK/U2mA9N2myAnskINHSKuXzvIm/xw9vdx4a+YoEN3Z/Isb640V4m0dE0AbM5X
         l6LY26vqaaCVC3SPnUf16bxUpATGVC9XYMwASEs5wWgBpsgyHk/B7C2im1OJ6UymV1hp
         IJ9nrwqLRlNYXRV1hDMM3aZlH1HQusOLq61+qXM8rfcqTKDp54MC59eoXYdc6D/cdzPj
         lXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109203; x=1709714003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2oYKm4kbcjnrzOPJaN5bBfK4oadekuOvRl8x7PJBXU=;
        b=YdUioMshjElGnS+tETgZXOocd/7311VI8zrOKp3xWHQ8B/LNh6TwMsMfkoOw/8BCU8
         1wWOY/hq/TvmGDdgkWtOWt8EyNYTx6bT/XIOKz+LePtnXXu5Ehg+kpvE0dVtrf3+Dq0E
         Q+5wHAz4uUJRMXi1w4qXStv7H5MUi0zru6OsKj88TsP3AMcSuP3RYTxGx7WBeGHW8nRn
         9wTB3sfWuahWTHfAUUfXU5p12LLw9/b5jy3WyCn7jxpIkqncy7dxeS/e/pmKG+KS599s
         YZPIBgldSKbnoGMcLGR25Lo6fjLpuV4becBx/edeY/QzqVTfvt/MAwIxLhbL365SIDET
         KW6A==
X-Gm-Message-State: AOJu0YykQb0cxgiGZgST+nYOu4mVwDb2Ah29Ifa76VLiMQZy9CBW4mAr
	ilP7bXEGrNJzB9KGGy+3y7JyfyBkcSv/s9mNIlaRnTinMLE9fxBqq5j7N3H0zj4=
X-Google-Smtp-Source: AGHT+IHWT4JKXlbefsOIPhleJGJAyUfh4CxJTrOJtgcNtOqQK5q23DCeCx1kQjIOJlb4LzJVzs+4cw==
X-Received: by 2002:a17:906:f357:b0:a44:591:a3d8 with SMTP id hg23-20020a170906f35700b00a440591a3d8mr669369ejb.31.1709109203006;
        Wed, 28 Feb 2024 00:33:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v8 06/10] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Wed, 28 Feb 2024 10:32:49 +0200
Message-Id: <20240228083253.2640997-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

devm_add_action_or_reset() could return -ENOMEM or zero. Thus, remove
comparison with zero of the returning value to make code simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none


 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 93a49fd0c7aa..29eb47bcf984 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -316,7 +316,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2


