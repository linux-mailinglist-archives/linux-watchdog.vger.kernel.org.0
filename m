Return-Path: <linux-watchdog+bounces-3961-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1CB1A9F0
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503CC18A39D7
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB69B2918EB;
	Mon,  4 Aug 2025 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRfI9QIp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815A23D294;
	Mon,  4 Aug 2025 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337459; cv=none; b=pm1EEY/1xCF/llZ4n+8Ym+BGQRZNdswp66WIhxZFr99XSI4am2S1bx/WnFUwbCf+RrwYYLJrtvIm04J8MZ0leiftrMZS7ZJjYIH60eNAPOcpqZlxLiAosJeyGFCBVyPmwqPgfWh/zNPA3Zz3JP3pB5ULJuj8GvdpgzAZ7P7TChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337459; c=relaxed/simple;
	bh=iGZD0LQ3kSDXmYoPeaYnugCI5o1eWItexWDE/LM8Q+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnR2Vrnq5kulFinydB7HWelITX9K6+14XlY+/XYF9NnbPDuqZLfJcKSvIRl06UaMhgbs2Tysj9tCYGfsmpazBzmAkOyCM5/CUUtMlxiVwHl4NjrIwTAcDndQVbBCp7EH9cwxNr2IuMUIZk2EOo8r31opXn+JVkLdeqozvO4k9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRfI9QIp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-455b00339c8so30487485e9.3;
        Mon, 04 Aug 2025 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337456; x=1754942256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VJM1mx30IuCWN7LUhFDjSWyKbNj6VnDSykcNH8sS+0=;
        b=WRfI9QIpBhUnK0lGMssMEMgfhjpjPDjCHqWOELgFseJfUMz879ktSL7Qx28UON5W/c
         MURuUl2PwwH+H758C4ex2ikI5Ft9HYqP20RK8E55vMepBhrYFAmBNC0TNac2nSz9FV66
         kPh+brN79t5xnd04D6y8KjIs8M1MSfk2UDSNe+xbwqa2e6rFswkZSPGnPHU36HSqkLES
         0RK5JJ+DMLpMW7HZ45ibx29ptu1OKW1EOLFNz8QpCoAYfQ1DnQsVi8Veg5wQNTvXgrCb
         tu0t/JaYhatYc1/vMEB3czYL80oEzQwobZzAgv74rN4jnVqRh/VrSUTTWBWFTIgZ7546
         qh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337456; x=1754942256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VJM1mx30IuCWN7LUhFDjSWyKbNj6VnDSykcNH8sS+0=;
        b=H37GosiS92yuKA0tbTkfS+71qo7IGjJtqN/PAqUom1bGJbL5yOhvaE53dZYv6lfldY
         KyNMpWpPgANMGdujoLiWjO3+9kNaME2ws/KhWmQJuDg8K1w8huZAUVyOU8ij2XuWua53
         9Uj/hqqpRExfmPwt6WYgSf4dMPzVvnZ8JUf8mhQsAIEEEtUXSgNciUqoWc8r8NJHDidf
         o5odUmFwg7vNxQBaELG0M9cjZqX7nsP4kR64SmYpszztXmiZ1x3XXbTvF7lQjEyO9DN/
         cXb3h0IV+1YPhPXOY3kQZxc3TAYgNyVUrYCjJcjly8EuENGH6tB2otaQc21jCE9opIE7
         niaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbiFnD7lYZo0reQEsFXourPEaIcSPjkF/q4JLJpnkgtABpAlc80hHLXbaWQWJy6AbV/yX57uvoGHHigHAM@vger.kernel.org, AJvYcCVr47Jr4g5asP39tD6yyoitPKUfPmEpvjGdhJ82dw+ArxjzywkBvjDX+MXaDPnaW2vlP2yCbGziV3s6vrOiqTXH8JQ=@vger.kernel.org, AJvYcCWWAH4G3KGtg0sT5Zy3fD/SuQL7z2882xVzN0VXBjjtGdoeIABnkZFTP1/RzLuiPIVj/+paRS8/62W3@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4Rdy0foQhyvISx4YPlYmYW5Ej9QfQQMA5vCPIY93TR5ClU/W
	onuF6+CvpY+DtAOb6eOgJLeYy55EYHWi+8MzbdAxbDx/WmyJYRZ/uT0Q
X-Gm-Gg: ASbGnct+S31DRJkQORPXD1Hpz6GTMbvuTDVCefhEJD20A2tsk6aB5Qd7BLJXV90Ufig
	O+NMGDRCgrBxoIGhmR01PvZc1WnmWDltV4/Bn/Cl5iQAVtxkTDuQAfkZRRz1APEgbO9JEgAecMl
	lqCTVyHIwktTqNHHjfhS5TsTG0r1p6g60IaWY00pWJ+Y+Kbnn2botNWXcV4ih5NtgVmenNFrR1h
	ash2RuBK4lA0OofK60DgUFlFW+bgzj/WAkeXjeHoli3kGYqNqIfYBN4dFMyPWDrv8ufdidiOYFn
	Iz6726O1csTqIhuoE2TtV1PevaNWQRUpANnPvYSxTL45vE6M5qblEEH/qQ4OsgMuh4c4ICUYVvw
	nlX+ehJfhXSy3jsA5sdhbN7sDrbmXOCttnYC33DfgtR2OgYBAk9SJ7CqRN84i/qYYFmRfth9D6Q
	==
X-Google-Smtp-Source: AGHT+IFhirFSwPDMKdw0szNtN+lgDQLs7hfhawj6V3Wl0uz6ab9RL3vLHJiWuSfsZg9QrYIu8FKcTQ==
X-Received: by 2002:a05:6000:2004:b0:3b8:d16a:a4b1 with SMTP id ffacd0b85a97d-3b8d94ca58dmr7129938f8f.58.1754337456380;
        Mon, 04 Aug 2025 12:57:36 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:35 -0700 (PDT)
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
Subject: [PATCH v3 6/6] watchdog: rzv2h: Improve error strings and add newlines
Date: Mon,  4 Aug 2025 20:57:23 +0100
Message-ID: <20250804195723.3963524-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update rzv2h_wdt_probe() to provide clearer error strings when retrieving
the pclk, oscclk, and reset controller, and append missing newline
characters to dev_err_probe() and dev_warn() calls for proper log
formatting.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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
2.50.1


