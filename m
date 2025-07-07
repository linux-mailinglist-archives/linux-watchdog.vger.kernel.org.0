Return-Path: <linux-watchdog+bounces-3831-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B1AFBC27
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECC83B38F8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EB52222CC;
	Mon,  7 Jul 2025 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOLyI8R5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF121CFF4;
	Mon,  7 Jul 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918484; cv=none; b=cqbLnC2gc6NcmPXwlCl6p/d0aW5uZSi05qcWNXpUdTMLaWpzYvdrcTsOJe+HphELlV9XrKNxm+oWTfSDU2AbpJP8bqdqe1LsvA0ZAc6geBmrrPMqYJdLR6uFU1miBRwdHyVUKi+34M8hLJ2A1/J246doIDELH0wS7Nhwqnbs/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918484; c=relaxed/simple;
	bh=digq2XYTXh1y8LY/b1TYiVlpRxYzxkHlsWdTXzF8KcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWn/w9iD67MITmbfaZMMQyYLNPRfCnELTgB9j57S2gOgV64/J9juzf1Rmv/76EaOELkxHEkcidy2rJzWI4fIKD1plGTR47SidelxqK5cq+NejBokLMBEUHqvChrcc4M5L/tfa+HaW+q8xfNdR+U/xop/OdWGlWkUvU4C+xNsJIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOLyI8R5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so32087385e9.3;
        Mon, 07 Jul 2025 13:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918481; x=1752523281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FPegA29oM0Yk1/YQWrh5958YiJTYamLd51GkQvjIU4=;
        b=aOLyI8R5lGfh3JSv7k4D5EJjQOfv3ix9vb7ELf+EnovKH6yaoUQhM8znfXoAdQzfNz
         QcRjW8naLWT952k79foDVw3AEDEGGfJCQsF8qnL6/Scrm11KeCQEKsi+9Gq9n3T4aR/Q
         C+40LN6uxVH8tLEcz8adNE+c7+D7ENntn8w+vTuAC8cB8wnFgnACdlMLufSThvAokv/Q
         fCDUtVFNN1uhTyhZ/avaDRHC/c0CtPRXfaQFcfbaJ7z8CmlzCgdapkhMue2Gsa0is6hi
         r+WenQUuXFAn1KxDh7Hly8gczCdj68sl0lAnshBw/2QeYQfGuR/wqItr/sRcNaY2IVqo
         ktow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918481; x=1752523281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FPegA29oM0Yk1/YQWrh5958YiJTYamLd51GkQvjIU4=;
        b=N+NuAYomVOPqm9m0SDXY3temkByDt1H+l5pmERhnvThbkoS6yjmWpZmkCghnQN5/Fp
         xPKOunbBtvDfw/ys+vCgFJuy1LFCVfWnTmsAL0Dy2Sap6UGWSJk5TurUg+vJA+Hdmq2Q
         Vd+PPu4ucQ02NbFas0TvhKNEFXjBI5jGrPIRjve974LU3MavXH0EUCjItOJPZUPRoqiz
         VVMLSu+nZXBa9pUfCusI8L1gA604MqnIFVP5hJY37ooAHMGBkMByfDch3bb2YzmjYv5S
         HWpJ8fd53Rg2KjuWn7OKEkXxGsGlRlWsKzw/iW7vrU/6HKf1y1XWDLOkDmBu/PNOEPVH
         VNTg==
X-Forwarded-Encrypted: i=1; AJvYcCVPMNIK6ty2ZVBqULsAWeLxpBmzz2nsVpJrgKLapbTx4LQRcmnOBfmOyAe6rvvn/obOXxdmJ8pj1U0UaaU=@vger.kernel.org, AJvYcCWxtqBN8tas1+4iAqiQzw5qQJL80eQcEOsH7g7pG01fTL2j53nQ9V9Ft3EoKNmUYaNI1Ed4fO4AVi56FxRdd+w=@vger.kernel.org, AJvYcCXkLc+kCdpvLApfCVdijtVkbvBAvoMVj/I9RBpSpUvRJHAylUNaSTF+4CHEzCLw2DwnQM1dDeNwiIpt156DLBJd1Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13/uchz1uFwsbmpqc/Ha6LSUHNAdAFPWy/xNyoUN/WxM5qs9Z
	yssVVJAKw4QXElCtDsJC5vqxViLeUgfupUqYqFee+sL8sqV7iF0qC9Vt
X-Gm-Gg: ASbGnct0U8TRSEYzRen1IQH5f2w3pOgZbCgAn5HzyL3EZkm8BIW7JLxehblqOpj7Oyh
	EvTQBYkooaHAUP7vz367c3VngKTVDHOt7RGXzzBkVi1YSzmc4mx7ZfcpM2jINkCfVwBrrbaX/3F
	kWWl/+ZVXhU4NnCLLX1MaK9q7C5Lh+xUDubdmRaj8s3zJAf6RGQqzvaoFcppENy2MFWH4PyvJ2w
	3Bt4dmEmp7CEOyi/qO9noThtkSizTZoMN/p8oXR3Hqd/snEJnMQSNT6BRjjdG9uz6CZAucqHEkF
	v33MKfXGsNMBit3dkLRI56fx1AvncHdkRca0bC9SAirH9wLl2WFRTLRZTTG1+CWIDIqJJtg/brI
	fUYwxE7YFyiLxHmXbQUA=
X-Google-Smtp-Source: AGHT+IHqDK3BFNoKsr7OWoM1bsM+W/eTnsVdqnD+cEVrJIcWY6Qet0nToGTFbGn3POVWgVo9IrlIIw==
X-Received: by 2002:a05:600c:540c:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-454b4ead0bfmr139034805e9.18.1751918480792;
        Mon, 07 Jul 2025 13:01:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:20 -0700 (PDT)
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
Subject: [PATCH 4/9] watchdog: rzv2h_wdt: Make "oscclk" an optional clock
Date: Mon,  7 Jul 2025 21:01:06 +0100
Message-ID: <20250707200111.329663-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the driver to obtain the "oscclk" clock using
devm_clk_get_optional_prepared() instead of devm_clk_get_prepared().
This allows the driver to handle cases where the "oscclk" clock is not
present in the hardware or device tree.

This change is in preparation for adding support for the RZ/T2H SoC,
which does not provide the "oscclk" clock.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index c2f39dd56687..baf9d64510b9 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -229,7 +229,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->pclk))
 		return dev_err_probe(dev, PTR_ERR(priv->pclk), "no pclk");
 
-	priv->oscclk = devm_clk_get_prepared(dev, "oscclk");
+	priv->oscclk = devm_clk_get_optional_prepared(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
 
-- 
2.49.0


