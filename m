Return-Path: <linux-watchdog+bounces-3922-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1315B150A9
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5455470E3
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 16:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA2D29AAEF;
	Tue, 29 Jul 2025 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amb7yynv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFE299AB1;
	Tue, 29 Jul 2025 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804772; cv=none; b=OEWJbqohS1E1dwzFxJFpIEj2bjqmh38b3gxqeOCo1tdZ2kJNSILXM9X5bf0kEPkJYoq6wWptzIIRLxb2D54hwWfI05y9aH9sBilj2xhjf5p9Tf5d8sU6ivt2Kg0bTCw1sp6Onec7F3mpoZRYd5b6Ad/a3vg+7q4EAE/XcYVukKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804772; c=relaxed/simple;
	bh=UECrRReDGvmfN3ozezJ7VtJp9VNA3aa1MLYpNMTvzj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUFVijEKQppcrQA6e3EpNdgUd9soVvaKqw5Oil+/6QW4RtV4yCDMDuB9agfV24yigfWhYqTMFL+Wub1dqxvf6PMpsIc6HQMinUF+akQUdLN+nQykiaEiS/3Og9WQpNFt4YT2maPfXFna4g6InCfbDFtLa7qVK7logARuBOH57LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amb7yynv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-456108bf94bso31786415e9.0;
        Tue, 29 Jul 2025 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804769; x=1754409569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvoFiY2KW/n/yhVsSJbauDPNuWCooiMd4epdBANYBtU=;
        b=amb7yynvyJz4R9bCY21608lblJ95J33QvcRXnwYe7hleXjNN8iQuEdwSOWkaEUlQq9
         iMliM15rIJhaLCFMXLLxidyvOsy9JY361e0S/y4zMb+V1W+BBtFNdTWg2yfHcLzyhXmc
         ydx63g0q6AgmFHW3RQm3l5UdoW2obuFxHCQDgwQXbdIbCrvOePkAmbOSyQt5P+GRbM3U
         BygHKJq4sl286/h6kUKpJ3mK735O72iu/y6Qg7cR+YC/qNdhHfX7Ct0PRD5Xdi2aAVlC
         iByOkJIoXfqRburxwvIT442S+ExClzqdwcf8tNmgHYWutmKuGiRiwjqrK7WZ3Qe/pcm0
         nx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804769; x=1754409569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvoFiY2KW/n/yhVsSJbauDPNuWCooiMd4epdBANYBtU=;
        b=xFA67o26PCYwtuMHzRGDCJBPIa+TT46PU/Vb1FV5gZ0lmnKxDwyqKsMsGoCTGMdqRE
         3V7GGuoy1LrLl9AgrwEyhTE7U8AUv8dhQPePz2LUW2YFRvXJbKlv4ROr79k7ko3AjZBC
         nwQzj5wZMh6QVIkdHckwqkx1xzprnuuV7gj/YPd19EfyvqlhbizFgsQQYOhh6rcfEpBW
         h1upCCQsEMKwqgiD8pMBB/vp3vkNRGuNE4REpslH1LFRffNhm0IRsIJaC/RD0nIecjHp
         c7i4JORRAnClqxdSqijA839rZKgM2lrfQmW8DMP3Gfjd3tvFuCBuGPOdxcFn6IWSjWyF
         JvlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV74r4ugg74gv9aQB3hreSYDEh2f/fR7uDzhc5oNiwGDt3B/3aadZNaktfCaQm1ITFbqrhdq5ZCHlG85/nmc+7favI=@vger.kernel.org, AJvYcCX5YLc+5ZRvopO3zapDxHHsXeMrghj0AouKdzM7iwWrARM881gjPJdWGwiHugYlER5TocQluowWT5pu@vger.kernel.org, AJvYcCXYCDgauq+Pnx2DRSSq3pGAn5LUe4XI1DGCdE6gLKpdyvyaQMImxcLTvXS2guZK2sKUW7hQ2kJ3QVnALws/@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEG+gntgqNzxM8tvWjmn+maW1lxIvItMB4hV1aoMnIEgAGu8H
	AbWwTFXDSprmgcm9UIKN0Q5LNVISLQ6Yq5iyY9t+rgjpuXk8Lm5Qgg0T
X-Gm-Gg: ASbGnctfDHFfW+TWr536zUU6Ai32mQpGShpZ6qoTHtUZ63m0soV+7bSlVOW1k4K356n
	qM3TFApb2pHgoxeizplI8iCKLYFezzLOT8gRNv9hyToTLl/z0pREYYdxCs4p9e9AxahqkmaJA8H
	VHvxISNP5qsFFHTgllSmZMOtPI8gcLo/gtSwBaU1TFZs6EDY5WovexJuobj4p2D/QGw2pO8SlgN
	sBAq1HC661zmglRhFcxpd92CEJ4Mri3smFZW0EKonHuugzO6ddJvOgbJOhewEzYTH/Z2e8K27rD
	yD3XX6C4NvwRSV4SC9c3FIOosz9bVFySFTDryoqnadzpJvqC55vOBqJomAGc4ApkfiSyHEDES4c
	ddmVihh7zqm4EWPAOti9e9/NbVpdUVv18wZpqdgFCvk9VjilCNZJ7O0/if46io8XKOlDtibxBbg
	==
X-Google-Smtp-Source: AGHT+IHmsW8pYFNOLhhXnto1W16NpjqxhRX3M6WZdJJU+5XwB6UX1XhWsNmEUzlbcJgUBI1ISEqpcA==
X-Received: by 2002:a05:600c:4448:b0:456:1e5a:885e with SMTP id 5b1f17b1804b1-45892b95341mr4164125e9.3.1753804769182;
        Tue, 29 Jul 2025 08:59:29 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:28 -0700 (PDT)
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
Subject: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
Date: Tue, 29 Jul 2025 16:59:13 +0100
Message-ID: <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the watchdog minimum timeout value to be derived from
`max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
consistent minimum timeout in seconds.

This avoids hardcoding a value of `1` second and allows the driver to
adapt correctly to different hardware configurations that may set
`max_hw_heartbeat_ms` differently (e.g., based on the SoC clock source
and divider).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index f0e2bf786acc..9c11ce323c16 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -263,7 +263,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->wdev.min_timeout = 1;
+	priv->wdev.min_timeout = DIV_ROUND_UP(priv->wdev.max_hw_heartbeat_ms, MSEC_PER_SEC);
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 	priv->wdev.info = &rzv2h_wdt_ident;
 	priv->wdev.ops = &rzv2h_wdt_ops;
-- 
2.50.1


