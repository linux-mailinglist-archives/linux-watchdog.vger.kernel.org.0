Return-Path: <linux-watchdog+bounces-3828-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D36AFBC18
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F0A84A12A0
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F16D21C167;
	Mon,  7 Jul 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/KYcZbr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526531FBE8B;
	Mon,  7 Jul 2025 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918482; cv=none; b=F36oVnVvPU9W3JOo6uN1Hjoy0ubz/EreTOEcLGIOXXtf0RXz2cMcf05+NlPPciegxLQgxlc4BEHoa0YBQfbaNZdb6HBVSzzhdetBjjkGT5gFClLQm21JwnsLfmPamKtBrVHY+JqjZ56KS9z7WloFaCVhqYIooojNQDpI3foTqdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918482; c=relaxed/simple;
	bh=zGKV4TwmffsXGBRMR3PvlsnxcqwJncNj70mdpBwnyPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nROiJgGznyk/SeRaOD+zJahH8UdnpFdKU6Z4DNZi1PkA9riyUhgbt5V18t+XN+FYFWVtNtHgCJSo+0czBhSAno48YMhkyGY6RvABfBR4S1F03GkOcVhxBD8rAIeasnSxU0lc7m8y61a+hc1bli592XZj4pVQRykOQXGNpUfV66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/KYcZbr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so2292338f8f.2;
        Mon, 07 Jul 2025 13:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918478; x=1752523278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cABofFObtx+y5oVEMq6EwPs/kt7P1VPzpWliJASsVxE=;
        b=e/KYcZbrANpHwzdfSOwATIoDrD0nSiQGjRRTnFImylJHM7V1D3/T8ou9kMF/jguz6E
         IIBAXgw2fbpSHzY/v3lovBhKWucaHkYMTLJWefW60QNalBxWckw0QLTjoRTIzwZ+xfw5
         hpe7oyo24ytBFuP81t7zMR+Z4gqpVBYf7Q8492pGR/t3Bi9SmbOgRS4ESwHH8R6TnTUA
         1/kIb1R6Xwo2Bfj4b2xQl9sBnL7VBafzV1T7Fr60OUDvFuvGynTwNHkVCKg8UAb+YrXZ
         FTs7mMvey6edl5kK9jY/Q1QCYMJAp9xvyXnMONYcsAo2dtKw9EaxMbmiBvHpzTxLpkEo
         PvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918478; x=1752523278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cABofFObtx+y5oVEMq6EwPs/kt7P1VPzpWliJASsVxE=;
        b=nEMiJHzx7WZ/1of8+RpMnK0OFku1MC9DxrMySngwwiZZNUt85+M0V5k7UltEEX9hhe
         0UYYG68OP3exykUvFhWZNLHijL/uT+vKxpmstZoUkCCpkc+ERbyaf5YIeKrmnpIuWES7
         t7GvXF9TTJdVdQqAZwYI14vq6qXTXuceD/zLg8d5nO9QRABxu4JBnSjNncsd3E6JrTgX
         ADprE3bkVHXGG4ESahJG6M9Wrxb3DtigswOuhBUbLMgVvkImJyTNAGMPJQLqpWI/kWah
         hNKkLyZKIgGH426BCn4joOisRGgQP54OnaNFT/LNFRT9ZXMRvnwwGSAk913nmZOZy/lp
         0X6w==
X-Forwarded-Encrypted: i=1; AJvYcCUvIrkiyZdih1iHDI1I+JhyK3VAatZtUWmSR4t27OXoow26YryRL8M/58ZKGwMCx1b/0HKi0ahhpXZnu8fusFjMPMo=@vger.kernel.org, AJvYcCXiipc1s9or1D4Es5iZW/LGolqNxnlF2xP9w7e8nxOojmenoGBG4fAmkfSzvSIA415aFRVHdFFQNUEfVChU22Y=@vger.kernel.org, AJvYcCXmazvCySGSycbQ0JOvf7Z/t2KQMATeZQpgjTVN/2/eQo2J/97JfYsljazn1lDgWokQ3pu5zxCzXmAZLbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdXkTSwBk0TKctImuhelPQRm8rVPA4gszAsY8+4S9MA2OgvrM
	sYbzjeXYiZY9J80KWV7+HpbauPqUNKVZAgdwyjoHQWJclzya8vjILwCV
X-Gm-Gg: ASbGncsrPjG4czq00BFTjSffi73Y3y4C6CWYN8DTgjiYqrz+PB0a0omTTanjAug7tej
	eGzCmQ741mcu+qrRW+tbvZX9JF+jJCi70D5X6xtZYdtvNoaT9Rd5tn+aEXSsn1dYFCQFOfFiKqa
	Mfc3JmoU6UkLFg3RtOs9i7ySRRG+l7CNuvK5topqXWjm67JcMsx08ikG22BcR8PRTdn0IwdomBO
	w4w3VGAJ5M9RLMYX14Vee7fRpgAE5n4sa7o7SfO0saGCvCMxsdGdcjFQUITLh90eYCcWtaoa+cc
	vCZwrVEMrK8D7HLaHQ1dv88hBnHqbL2WvrK4SsGi6wnuh6jhrn6yx/Dpxjz60z5WzeObpQMNW0J
	QhQAYuldBNjyMQfy6xEE=
X-Google-Smtp-Source: AGHT+IFE/Ft4DBmWyWWjCBFV/SYDTTq4qLNkAzzM1a8qBGgTDH87LKKWzzV+YEL2RXuX+KNTaYgZhg==
X-Received: by 2002:a05:6000:288e:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3b5dde928a2mr109505f8f.25.1751918477743;
        Mon, 07 Jul 2025 13:01:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:17 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
Date: Mon,  7 Jul 2025 21:01:03 +0100
Message-ID: <20250707200111.329663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 .../bindings/watchdog/renesas,wdt.yaml        | 37 +++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 78874b90c88c..ce439a401c12 100644
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
@@ -192,6 +202,27 @@ allOf:
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
+          items:
+            - const: pclk
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
2.49.0


