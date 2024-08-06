Return-Path: <linux-watchdog+bounces-1464-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997029499D6
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 23:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559D9282D3C
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 21:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2F816C683;
	Tue,  6 Aug 2024 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7AeZ50o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80658158DD8;
	Tue,  6 Aug 2024 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722978413; cv=none; b=J1YysKPxgB0kx5+XkrKz9C7NURSpx97f2GpN5zmUACclb0Hs35i+2yU9YgG2qSVQWDeqmfOQp+ZPnaiWZqQ80hnTTopePQrE1qso2yVCHeQGTHen+W1ixxN/HpYIiU7rWv6uUQ8dWWoZA3rKV1RN9n91OntN55wNakhsCtho2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722978413; c=relaxed/simple;
	bh=5qp6zh8BEumHoSEvwn+ULVViwqIpvdSFJSJMKJiS5p0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jUofds538rYVxSJHAo4Szu64jpyHwdmc4zpDhzUk2GxpcpyIQXb8m2eYv0cxy4XnLuYYnVbngNPBGznyRXHXp8kjXhZDDxED1zplO68UlxYEAixqykbA0XHWbI1xJvzl56D4B/G+jjuYTLURWOu0KOvBak1D72ilC8pAM7AQKMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7AeZ50o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-368313809a4so139029f8f.0;
        Tue, 06 Aug 2024 14:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722978410; x=1723583210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9MWmQ0qH1ITOxEaCA2Jd+x5ZWjdjJjHzBG990dgogs=;
        b=m7AeZ50oXmlXuksi53DR2DK4xUkRWUnHIiTb91GwWHXfgAENM6rU2M8d/RU/dpP84y
         OhJ2pQo7mGS5mdFGUx9gPbfQ3Zhvu+a2yX01nGBcna8yfg0Y2LbGbDuU5p50jLstxAKl
         IiDyx3425lvpOCCoT3vArk/9afZO92IT43Sap+adrTgN+5zhoE9Gi47rYpaY5N6mpEl2
         3y/spiDHujMn0Bk2xkHLLiBovJ3We/nIXwTAZAbDcivfxzwVLrKA/KfQ1fE9mypnRyiV
         cIz1h8jUQD7Hi2yWZCvLKrMdvcDxP52pHHhdSM/3ZjUjpJMTkbXC5d0iw2xtxtYZyROO
         82gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722978410; x=1723583210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9MWmQ0qH1ITOxEaCA2Jd+x5ZWjdjJjHzBG990dgogs=;
        b=DfZ5z9hvMq9n8Ye77yV7GWuy2+sNv4aHAyx3hWOTwOYTeiULtCQ1hghZb2APBaQlUA
         iRHrjja5dAuW1H1Scf6T7O4sTXZZ53UkLQl01/bquulHHYcXnkoE/3LqKDLqR134bcYy
         4Npn2EdhbrUYa1SSNEZKIJGuwJ5WiKuekFdmF+fUscpk7jaCbJInmn9s9ryQR2Z/EjNx
         NWWj9F5+Dn1bVzf5F6fdKdhu6LEM32fCXnVNalgC3Rf6hbxos4VG3zCWlt9NNXpYk0tV
         /m2WhwzT9k3GBt8DBnFxEjPXDenmkhxZDhGh976CEViwilrBOLd6F7H4vSlZtvDMe2Wv
         eO0A==
X-Forwarded-Encrypted: i=1; AJvYcCW0NVNpeTj/k1NukNPNYE1eBWJjklkCgvZ+P5oZUUo2s4T7UgzeX0FHfsX8wFVvopj5Yiw+oHQopB7fs2LUdEZaW/d5hKXb6wDkfL66ywMt6XT85G2V7kNELa3/NghTCFzxJpiV5uA+ZQdyq537FNDzAsBaUfbAYqZSp4+IbcVrogn71Ciq56H+kcWIR7IbWg==
X-Gm-Message-State: AOJu0YxndSD59Aw/p4F4QLzXddrEdAsoOLzwMVb8qeVsp+JbL8d2FQkF
	hZAOKNYCcKNKPln3ahCdkaeW2LOwun5MHE6V1fXjlbzZ8DT6XQcp
X-Google-Smtp-Source: AGHT+IH4JNq2iiVC8OFzooWR7e1aFkBTn24d6LO6Jy8ZeSu7YQrrHvjwYjQ3MI9iocgJuw06se4wQQ==
X-Received: by 2002:a5d:6c6c:0:b0:36b:ea2d:fd5a with SMTP id ffacd0b85a97d-36bf0f556c1mr46712f8f.22.1722978409259;
        Tue, 06 Aug 2024 14:06:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42904f92a2dsm1384025e9.2.2024.08.06.14.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:06:48 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
Date: Tue,  6 Aug 2024 22:06:22 +0100
Message-Id: <20240806210623.183842-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Watchdog Timer (WDT) hardware found in the Renesas
RZ/V2H(P) SoC to the `renesas,wdt` device tree bindings. The RZ/V2H(P)
SoC features a WDT that is compatible with existing Renesas watchdog
drivers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v3->v4
- No change

v2->v3
- No change

v1->v2
- Included RB tag
---
 .../bindings/watchdog/renesas,wdt.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index eba454d1680f..29ada89fdcdc 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -75,6 +75,8 @@ properties:
               - renesas,r8a779h0-wdt     # R-Car V4M
           - const: renesas,rcar-gen4-wdt # R-Car Gen4
 
+      - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
+
   reg:
     maxItems: 1
 
@@ -113,7 +115,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
 
 allOf:
@@ -137,6 +138,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - renesas,r9a09g057-wdt
               - renesas,rzg2l-wdt
               - renesas,rzv2m-wdt
     then:
@@ -171,6 +173,19 @@ allOf:
         interrupts:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-wdt
+    then:
+      properties:
+        interrupts: false
+        interrupt-names: false
+    else:
+      required:
+        - interrupts
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


