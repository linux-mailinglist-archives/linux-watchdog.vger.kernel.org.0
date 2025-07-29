Return-Path: <linux-watchdog+bounces-3919-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F11B150A2
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4BF0188E7C3
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 16:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE84299959;
	Tue, 29 Jul 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4KRSx3F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE2298CC5;
	Tue, 29 Jul 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804769; cv=none; b=EpimjKnLuOZe11XBWTbW8vv4WRmISE0lI8trLWUo+5xXoawFuXwg7FryYdb44UbvLQ/YZU0pQfntDxIdQJLmiNojHuqsfKjx7tWduMYP+zSwQ88ciXsAftX76/E5sPB3tYAMbjhBZe774c7c3VOQWpejSxn9CyBZGL/oHMsCBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804769; c=relaxed/simple;
	bh=d80BbnLWJw7aYIGqkYH/OF6Uay+jqCNOHGNA/mcUGfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUJkHsIxU1JY4M4/bztVXO5gZIk+s1vZ19Ul1H0pZwhtXoK+JkWuMs2R4MLsTHiwxJ9qKlP+Xp9Q9aLtkTYbBwZI9dPSJWQBxhxMxY/orjPGQXbKYxncGIM4jv4j8xjw01XntXExc9KhgKmUN5WqYtf5a4HCGuZ2Pp6NXt7+Dpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4KRSx3F; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78776fb25so1538670f8f.1;
        Tue, 29 Jul 2025 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804765; x=1754409565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYv+xVv/OkD0dO20HCpV9OkdALvLRcDIxjtD65Z+TQM=;
        b=A4KRSx3FTEpDO8DD4bvr29NI+Q+hrKK3qciXg4/DTiVc2jqFeDP906Kg4ZVLSPpbxC
         QTiOk0M8zKweYQvJxm5slPWtb+bBY1irMpC9up5SP2ceGGLJBblifj43XqPSZwsvUpGB
         Ec6UyJRX61h69krgpIJjLzhx7ujoThiXyElTHtcSEwKEiynxHVmD2PWcPsILnV4WGWpZ
         NMahQYDULFtRB7TznJAFJsq4TSV4Ec7xMsrDhcmspyzARXGdBZKBCcwq2D3vOoTTROnz
         8J7YG9EARH46Meic2+9lD1E3I5If50uv9L5c6WPxdlLFyA0Ez6vdfnyuu7CASOv2rJgV
         Qbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804765; x=1754409565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYv+xVv/OkD0dO20HCpV9OkdALvLRcDIxjtD65Z+TQM=;
        b=L8MVvSoa+J4n6+h1yZAKY3uyybfVg61vyEcB5ZyeQT3K9koVgP3DMyrFugOJlipwW5
         /AkPS7WxZwClVTMUJ9hDOatbaDKOm1IJ4ecs7SwAUHBHvKVssOpwMZS4NkJhoBwl6wxP
         Y95kUMEqP6hWkE/muAlWI0YSfRyl7MfdfNKAlA6P8NxH6vBlpyvEvwjF6KA+ZAAYxjwC
         X7c8aeBqGOFGmA1POs7+dFMElPn0QbLdJGu3TmPipu9kYEFcOrARjBGEswNaS2CpZsrX
         YyHwhkTSA/2gBNdHqAqs/2KAn2mMug09piCarL/O8yFPHQYy2m1wp0mvog6rZ3QW7sjC
         T7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUmJITeJezrPavnhLw9/3IO7XgAwCTz9aiym5lhpgX1PaDbjyhM9M//o0JPcnOWUtXXA/Ik7LakSmyJRac6YuzY9Tw=@vger.kernel.org, AJvYcCXpVCnGgdQ8DuzKIPIr+dZcMOW8k1m+7L3/cL7bezW5n1VCOaYIOStQ4jOsyz/eGwu2hAjWYLmACL31@vger.kernel.org, AJvYcCXvWE3pSoCJr3k7OniaMfAdu/2AZQw1+910qfXpwfoePkdCZnvROstRVGOeGYVJsv6fT1ZUKpvKjdGUBiv4@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXBE2t+CD+be5BIt76KR01STkfoUq9JdPPpGKEDU3J0jmrwum
	qnsUG+1ztswS+aX8YJf85AVIrQuuGjpZ49lPlZsU3vy4ZFavEBa8Delp
X-Gm-Gg: ASbGnctgMahLF8HfZGJ2Ln5VQUjtS21HdYKmchigOIsi3hgL8lpEJ1qqn5sBRPtZEq8
	nhmbkPWqkNHcjjoFMDpxdnSiKkjXkLgrYx7wjnNvA97lnb2h7DDqgsXHzZNwFFwOZzUFPIyqzZo
	5g0PHlQVdV9P+W203lJFNYZlFx6xexiOsHWhLTnycSP52WMq8WiJCyzyeMNtL296+koW+okbBHE
	Wanb01FhaU6N9Lg9Jpuiv3O4uoEe/gt0eAbulRc9qapo6T/+iQACT/VpvLmJxiRpBDxEaKOxyEq
	gEnmhMB55Ucd7PF4arC+fwFUIBY124Te/dQrus4i0g0bSuDmmU+zvNvfJ3PeskvqjOSkMmg2edg
	Mq+XMECtyHK2esuUrtqGQqvk537dkgfXufRo8Vfdz08IKYxUpsifRiWwIAgV4jgtvhTHJWwLfYQ
	==
X-Google-Smtp-Source: AGHT+IHADWnJGSo1DeWeYcA+fpK/ibo9O+JVzMEsugPi21geW/ffoAOIgIB1biOqX92HTqen2a5DDw==
X-Received: by 2002:a05:6000:2405:b0:3b7:93d3:f47f with SMTP id ffacd0b85a97d-3b794f648efmr165106f8f.0.1753804765357;
        Tue, 29 Jul 2025 08:59:25 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:24 -0700 (PDT)
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
Subject: [PATCH v2 4/9] watchdog: rzv2h_wdt: Make "oscclk" an optional clock
Date: Tue, 29 Jul 2025 16:59:10 +0100
Message-ID: <20250729155915.67758-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the driver to obtain the "oscclk" clock using
devm_clk_get_optional_prepared() instead of devm_clk_get_prepared().
This allows the driver to handle cases where the "oscclk" clock is not
present in the hardware or device tree.

This change is in preparation for adding support for the RZ/T2H SoC,
which does not provide the "oscclk" clock.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
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
2.50.1


