Return-Path: <linux-watchdog+bounces-666-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E440485657D
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 15:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12EC293EFE
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 14:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59B2131E59;
	Thu, 15 Feb 2024 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b7BmtPHD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6409133409
	for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006155; cv=none; b=kEdkQ9Al+oKFIGbvyGTSKfy6HyH6GnV/3V6lX/+9B1dEjMsph93qhsg/mKJdZTorEk4vCo009bOcXhkhJbzboVRdJ7+c0HQH9OqFlmCxkHYDATGRNRfFWzy3GUPyhsmItS9tr6Brv8AkoV6gyGmsWHCvEpFURCx5gN8Vs+GtlZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006155; c=relaxed/simple;
	bh=2C2IVa4viiNlUGmLOxJLTFOjDptgPpUuxtWwnvfEGIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iNuPUbtwwmVxHBXhyxM7XJHgRTDbvtB9u4c4lrmmbfwqKiNL0ktmaKvthI9n6GIZdZwT7lucioXe07fcCwA3EY0hwDGO+hdbnnRWCp4n24cG43ql7eZuGsq1PQmsTSNTHjWoo1NGY/s0d+EemRogjp20gkyLBOsJT4Lr9ByGejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b7BmtPHD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4122acb7e69so1979245e9.3
        for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 06:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006152; x=1708610952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rijbwvHcSAy25b/Tneh/0DG0Xorpu1pIj5rjNv2eY/w=;
        b=b7BmtPHDrwRBmIFvsaHyY67L3XK7LLc2QkaSykgvNG1mrH/KxPwMA3Lg50yx3F54KB
         F4YLr2QT1F36G3PQ78FdZiT9+xfoA7M/UENCf77pxcQBso3CgFKOoNr4Hud3uhjK+FGU
         /lgggoT5X5V9x0GI9dU1+tWip45QkhZYpAsKUm8awe6RjQGNVcFDh0kZEAux4cJXdsQQ
         PzourC3eMqQTJ7z1ia+yMA72XCqrJCPQawPH1msEpvThc0885D4zEDkikky2mRo5GDyE
         zDqSDMlK4V9+ApDP6WtiTKMOkqx1n25bGB/bHmUZUzc/n/zk5vdZ8jFHAUuTVT2a5iFd
         MDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006152; x=1708610952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rijbwvHcSAy25b/Tneh/0DG0Xorpu1pIj5rjNv2eY/w=;
        b=wYNahz3RklP8cgyZBbkxEVnAJm+z0sovcjhAJTT0M6CC6+EFa9AA2NHt/y3T4tF+u3
         yFGVApiBz5BJ1V6XJfyYhnHNNGQQtDSS8QO99CiYbgN9s03MLWhaZwS96CzRsehxLfGk
         NcE6m6OrU3OkQjM1Xvd1+4C/7m7hO0jQtKMCmVad2igyZTLq4UxCX5WSPxAg5PqhWQo5
         /GySEicbyswIIR29Zzw+9CB0eQWh23vxYgVmMeyS13IFyD9jHJHkjVXCaqyg3YluWrgR
         At84Z2v/Iibr2H36n2bBN+8bvYg0rzURHSt960p1FI3y1q6RI8BPnaczNB6XxN+CAIH4
         6OsQ==
X-Gm-Message-State: AOJu0YwJ8PXvrA8TV5lgfVsyEePeNphxEY3WhZ1DUwjOn6WxDfhN1UqX
	qWOven15BwQmQT1xmOypljSWoxxQxYgsRiIFHhF4VcHyfTrZT1m46k+5ldaiWN4=
X-Google-Smtp-Source: AGHT+IFO4kixRtEYXDlu3mbSKifqhuSVYxtsIbsqSj/Di6B6cs7A9YuUvATjjzuvOpQ53ZC9zpVw8A==
X-Received: by 2002:a05:600c:4507:b0:410:71e8:4921 with SMTP id t7-20020a05600c450700b0041071e84921mr1683519wmo.24.1708006152465;
        Thu, 15 Feb 2024 06:09:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:09:11 -0800 (PST)
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
Subject: [PATCH v7 9/9] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Thu, 15 Feb 2024 16:08:41 +0200
Message-Id: <20240215140841.2278657-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v7:
- none

Changes in v6:
- none

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


