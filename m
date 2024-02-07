Return-Path: <linux-watchdog+bounces-617-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77784CB29
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Feb 2024 14:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC9761C262B4
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Feb 2024 13:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304287E768;
	Wed,  7 Feb 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CNoFYJt4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BDE7E76F
	for <linux-watchdog@vger.kernel.org>; Wed,  7 Feb 2024 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311313; cv=none; b=dPMJ7FPHQ9WjVCuc3vD99V1jxIbC4okRqlojGmlpqxrZBDhgElrA0Tucw4kiG6VWX6uwMOK/iU0yjGl4+W9u0hlkS/YBIkWqHplbXbQ7BAyxsXBzLNzdyjyXwt57ePbGYf+Uyp5eLsF9RqdCJ+T5WA4mFMq8dVyuZx0V5Jolbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311313; c=relaxed/simple;
	bh=EBT/o5fj1f+aOOhaga/UA54ow99OuFMlbr0SqdGDEkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JPVEJdvTetMOv8HADvBaRtK9t7dzbFSEK2KWsCKHs4H1iWC0NJ2LrxcXidyE1h/EEYDzEKb53xYUsatsJ9Idq4aCLeYGsseRasfelUCMuYg81RP3tIIMYq/hf9RVaBRGq8XQhz9KMNC3lLPdxf+n/UbhrS7KNwGddEP6s42uTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CNoFYJt4; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68c427136b0so2727996d6.1
        for <linux-watchdog@vger.kernel.org>; Wed, 07 Feb 2024 05:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311310; x=1707916110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOdegQKiWMRLxYnVG69/8bl7NYnyCDQ503xbXTJ4Mqg=;
        b=CNoFYJt4bCXL8yVb8DBhTRHk5+eBLyNcTFpX+TJ3hcBDZZEcPtx83dW8tOebCCWYkK
         BIW/MESRltd+GgGgfwsxaNbF9WGm3Oj8ZohMUEKjJ/YN6i2sNRI0DqAQ7Ao/e5aOgOcw
         qbbb/yeznzKvkiF9k/JHL9eYJ+/1P6F3dyDSuWBm0ZMdb97Hjl5tP/1Hfd8ZP/dEPEmm
         2QncFfqT66QmVe76HsAljuQzZ6V2zke4pUidISSEtcjessVmZn6E2Lo4l5m0zO1BmDNz
         8USDLABv2CMwee/jC8VnvHJ9oQDIXqMun/dkBDz/KlpALBb+39o54czwjvCRFu/9qY83
         OSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311310; x=1707916110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOdegQKiWMRLxYnVG69/8bl7NYnyCDQ503xbXTJ4Mqg=;
        b=EvciJ3nAC9gFdj2BtJuw7iuCXYnZb2N6We0CyCYp0SULznicgz4MvMVQYybkJtpRK3
         RNPCbqe8FwLstoMIqWB0uuimR+ZV3SrRcTuXuzUJh3n2/ilX5XMB11KkhiLJexse+uqv
         eLmj6j6DHhjPh+4XKc5J1NQ64zP3qmg3Yi4FDh7cEzURoG3EihpQYISwOk5AGnf1KgWN
         +jJY9B7zWtr8ZCVfUeQYK4riM9OSCyL337urn/b1nTimEOy836AoWYzMJve+PfAkYDUK
         f4VgXbstbcjsq256hCZZ7iQCG58ps95T0BN6e1RmRxt7ppgTx+C+I1CwBf3P29QGgb/7
         oetw==
X-Gm-Message-State: AOJu0Yw42xQXlxoMvz12J9K+3VCuY+W+QWLULZPRXCIEfkWS6rUlqETP
	BTK3X7gbB1Y/qdEcXOqWcVe5tu8WGUACrSketuWfmUPvQx/C7jrgjPXIC8fmsmQ=
X-Google-Smtp-Source: AGHT+IHHCcDI2dErkIQ8G2e9uYmc6icsnTSr8Y7LomjfWM/BrqxviD7XPu2Pl+WHcxuB0htYmsOeGw==
X-Received: by 2002:a05:6214:19ec:b0:681:9ea:b99f with SMTP id q12-20020a05621419ec00b0068109eab99fmr6857265qvc.57.1707311309982;
        Wed, 07 Feb 2024 05:08:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5ND3WhNKoyXcJyyfmtS++THXmakhK7DoKyn0LS/tQPuo9CPOV+QF4LG87VmNX3hJE9EOmzIEbvE5fV8PV846WsEEXfaxQg/tPeSyi2nWTP17lW6vbJqCs+mMZ9zrkqlZKoREyJfvfH9c5fr4sEZ7Fnhozzb82CPGQ3LwnaWMb2lHUJH3W6eXoQgqN4B8BA6tsOSG5ABuD+ZXCekg8YsFTTpg3bx404YM1UW9Fe/FB/2IoTqyAHJPx7SGwBzn2m2AeyFdZRabfTm+4Z3/MK5Ts7PuMnNtzrtZAAn/7jFgX2VkEDFVlMJnIYRFDn9vwS5tuJk/hRqMGYkPaOkJfFpGCNgO6zl/dv4VhTS2ocKvoozhV39X2FckWZbL6TbGVZutiaFbHexksSOWT6c1ZV1O7FQOElKga7QszClFhC+/hOz/a0PHvzyLUr3+K1rQrgZxKy6TkGtyQqowp/Ir47iA9i4/cKC660bXI7IyjJUbC2BQDmBMf89ICKVmwN20w59G29ZmpeevyDo9BizIU61y23uO8Xj/KsOuTOCC8CK/SCVwMeGU=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:08:29 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 9/9] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Wed,  7 Feb 2024 15:07:45 +0200
Message-Id: <20240207130745.1783198-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- re-arranged the tags as my b4 am/shazam placed previously the
  Ab, Rb tags before the author's Sob

Changes in v2:
- collected tags
- s/G2UL/G2L in patch description

 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 951a7d54135a..220763838df0 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


