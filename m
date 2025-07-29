Return-Path: <linux-watchdog+bounces-3916-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1113B15091
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 17:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C21546608
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 15:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C71298267;
	Tue, 29 Jul 2025 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0xyro2u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA0296160;
	Tue, 29 Jul 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804765; cv=none; b=kGYJHgUR4Fdx2jB+VVxrHzRsGyKXy4rG3V0E9rsakTzIXLOrZBj1OR8KzGtVzTg0077JkG0B1iWHVwmorpEOtjagqyqqS1jsBJvT17Gido2LzsXA8+zEOMjWAzNe3AdazK1YQFaOgKFFXvq54QzMxrDmaXy+f9iNHTid6z4MuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804765; c=relaxed/simple;
	bh=vbvioINVvE7rYeBX1SdellCgb88Qap25i9w0hclSDOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MVUipKluvUzTqKChOIAz2IsYDOv2Riulv/UC3ab+mf+Z1IRsMkf1AqyxfWO0pe4ut0dC9swL03FawBgPCuRfoNjytQKg/PFboBPKaEYRj0k3C3SE9e9FVMu7Fak04YCcfU6qtsULKG2j15NqRHBqtfQPwIcNhpzTrjiht8qXk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0xyro2u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4555f89b236so46362775e9.1;
        Tue, 29 Jul 2025 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804762; x=1754409562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vs48CD27I+mmNOUnTX99I28CeNgiDQIPijvqQkHdOiQ=;
        b=V0xyro2uoJGirZgNpSJcdpz0dNiICDXPGAZJhgBXVjzlr/3MEZFAsVeng0Yel4+gOE
         Mg8PibnwntoH6Ss1IwYvXK+E+oqJfJ+qGR+SMXYg9DLLYtxxB2qR83umnDakY6229mY4
         GAfL1U2GdtKy0l4OTHSLcDedO4fDllX1t2+cevbfEvl4x733a5OgFLpg2VY69WzxWJ0c
         f53QxXJtmsrwIjoZZoEQCpgHB1kIw606whu+/kQNwMFpGOYsrZ0XtMvwdJubTnuocEbJ
         eP7WuoMMnTW//ksJK1Eqa8EtCm79AFSbAUZSltd3wiaJK9DoeWthnfQNxWC2vFAbStxX
         Py7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804762; x=1754409562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vs48CD27I+mmNOUnTX99I28CeNgiDQIPijvqQkHdOiQ=;
        b=AeQTS9ujvZvyzlXsD8YstaDq13bPel8SUhTIm/u4xvChdW+ZPVPVxzurwo4Rl2MRh8
         ObwdPu+Q2B29HZ80Sq3ci/nHbFfDv2a0Ut7VONHNzIBf2/TAHwL33jMLLws6v7MErmQQ
         KSSBfEqnvhKJdN4VI5NQigt4uxR+sHKx//DoENSS14V9VRzS6LtZy4Ow+Exua7z5YcBi
         J3CQKHM1FOSYlMH8SWBlPA5waU725ZdEQeU1b2PmK7lrtc5kUyu9wJHwbnU35gxWyIao
         /PCZMmdBiFaNphCqJThFlTCNs3zhmc4uDkEA1aqAJWqHszJDO0kkJPhJKw/lVpJdBxip
         FsVg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Gxkx9/mDaz8URNAqMJKReEvE1/qKbvvwEmuXny/0pKLc2lA2IKLnPjohFSm8kCm7hM4DdY5xskAdp1xKkYm5r8k=@vger.kernel.org, AJvYcCVod6M8xOhzZrPzf72Rg1cLiW5Pat3Nj9ebARUom9EeZxqZZS3wlVj3YT/RWAnOsVieV88XgoJnmJ5I@vger.kernel.org, AJvYcCXhVzUB0iNi15NFsyfMTvEgbHO2S/Wz0/8c/DRYpUB9YzoUIjAUxkJXEBbs+NHFFAmjwI/pia8tyEwtU9F9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1d7GchxUv1XP2gM0d/vovTNHFOFNztejz+Mo6w4fizOxlPMq0
	HvHrDP38029fg+qXlQdIlagkMonEygAjvyzYFVv3plqApnQO6Tplordl
X-Gm-Gg: ASbGnctoIdj960ODDZv2vhCEAjrLax1dXUsLt2e/omT4gbu/jMCG2cLfsF4kqu7gQcu
	ATHmRVWhFnncuiq1vN611oWQy8PnJd4OvkABmiH6MWvy+HNQzCr8jvQzbZ3CMj1Prj2m0qvo99j
	RKL4Dz12xbOTPfm+R4w+BeFM7G8xbhFt1HF56RF4MAtoDLyALj0oh43XjORfBPlispdOCGL32Bv
	w4XXVGqqQZdN+RPupDQuQK3NFbooelcbH4dtkqIb3Og7RGIQSG6M6EcBObekhfC6SdjSj/oqru8
	XlIhjxrBer0xPTgVSaXg89BoK5Hzvj/ZqPieKZETV7HDieitx+gLsowp4Ok+Qjwxyyrkrd8Kj73
	MYgFEgmeesJOJOrIJ2OdTymQgaLnj1OV7+ED2N97nuAzGVsJ68FK4QjhUx0W61279Ibc4O1+RKg
	==
X-Google-Smtp-Source: AGHT+IFSMdUQNQq5u3Kitzm1xkSyTdl2849pzlHvJWWhrJajHgWTVeNJpB8NZ8jxGdCr8QX0QkIBXg==
X-Received: by 2002:a05:600c:3583:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-45892bcc628mr2756825e9.27.1753804761792;
        Tue, 29 Jul 2025 08:59:21 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:21 -0700 (PDT)
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
Subject: [PATCH v2 1/9] dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
Date: Tue, 29 Jul 2025 16:59:07 +0100
Message-ID: <20250729155915.67758-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Extend the Renesas WDT device tree bindings to support the watchdog timer
found on the RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

The RZ/T2H WDT is mostly compatible with the one found on the RZ/V2H(P),
but includes an additional register and differs in the clock division
ratio settings for the WDTCR[CKS] field. To reflect these differences,
introduce a new compatible string, "renesas,r9a09g077-wdt".

The binding schema is updated accordingly. On RZ/T2H, the WDT does not
require the "resets" property. It also requires two register regions and
the presence of a "power-domains" property. The "clock-names" property is
limited to a single entry, "pclk", for this SoC.

The RZ/N2H SoC uses the same WDT IP as the RZ/T2H. It is supported by
using "renesas,r9a09g087-wdt" as the primary compatible string, with
"renesas,r9a09g077-wdt" listed as a fallback to describe the shared
hardware features.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v1->v2:
- Dropped items from clock-names and instead added maxItems: 1.
- Added reviewed-by from Rob.
---
 .../bindings/watchdog/renesas,wdt.yaml        | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 78874b90c88c..b6e60162c263 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -81,10 +81,17 @@ properties:
               - renesas,r9a09g056-wdt # RZ/V2N
           - const: renesas,r9a09g057-wdt # RZ/V2H(P)
 
-      - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
+      - enum:
+          - renesas,r9a09g057-wdt    # RZ/V2H(P)
+          - renesas,r9a09g077-wdt    # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g087-wdt # RZ/N2H
+          - const: renesas,r9a09g077-wdt # RZ/T2H
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     minItems: 1
@@ -132,6 +139,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - renesas,r9a09g077-wdt
                 - renesas,rza-wdt
                 - renesas,rzn1-wdt
     then:
@@ -183,7 +191,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-wdt
+            enum:
+              - renesas,r9a09g057-wdt
+              - renesas,r9a09g077-wdt
     then:
       properties:
         interrupts: false
@@ -192,6 +202,26 @@ allOf:
       required:
         - interrupts
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-wdt
+    then:
+      properties:
+        resets: false
+        clock-names:
+          maxItems: 1
+        reg:
+          minItems: 2
+      required:
+        - clock-names
+        - power-domains
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


