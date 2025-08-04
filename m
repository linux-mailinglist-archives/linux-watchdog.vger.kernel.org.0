Return-Path: <linux-watchdog+bounces-3956-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F07F0B1A9DD
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 21:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8D917E628
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 19:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAFC28B50A;
	Mon,  4 Aug 2025 19:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+a/oukh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923DA1DF269;
	Mon,  4 Aug 2025 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337453; cv=none; b=eNF/407lu9yx65JdoDb+g0nqfi47PbAGQ96XHZaXH8aXM8gRsfE+sWGdbsAsBJYVzYZdcAK/vufcxIg4gXvMyKYNu8Jm+qIaMTbxHqsOaiKbmtiK04Uiwg0vkPx/rq7HWW4F9WgoWnnpe5l7vvz+rNlfqcTFbFxoHDnvF46g+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337453; c=relaxed/simple;
	bh=qVaC3BO1vdexvq1x/1dF6b4EcLY5+d1m3fCg4HeMDLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FI1EozVhTVl/RLY7jo1R1VMKTxMEeJvNT1bynfRYX6uIKGxicP70QWyQS2RTikiVRAoVUGW/Y0Z9a1pEXSUKZkGGqGiateK8sbjDB1lTF+mwb58xY+0oJYgTP3Fk9ET7oElSVjZjMGSqRhefdYGlKhXIRiYMg0QqRdhZBDzHOgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+a/oukh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so960804f8f.1;
        Mon, 04 Aug 2025 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754337450; x=1754942250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSn9VjlCgdV+2kvM6aIx0YPpc5jS2CNcHjZLUNGdtr0=;
        b=N+a/oukhOTuha0d9NmoBGGkxShu2mULfVH8PfpdzBZ7GMSMCt4GL4mx3fh+loU0fjJ
         SI335SsL1VHQkY6UtiiyG2vjVGteduLDGjMtOllJn95PxGgBNVaYRhB1WWIQKw93hdr/
         DOvrJzHmDqLTtqJSZoS+/cVwXvq9cN/sOMyPWUF+7aVnK0T+nP5ko/sHIYtK5YvCj4jl
         e/aVcCQNnVQjQ2xRTW7ohNjEz1My4KTfqZvGgHJ+GV7ZL+VTTzghhz2iCloQaRE0kix0
         5wimPRIwtrrsaSSxzl1KSQ7AhjQ3Hs7KEDJxNCClTpiEQw7i1bvFUUYKoYs2WCQgXDcr
         1M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754337450; x=1754942250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSn9VjlCgdV+2kvM6aIx0YPpc5jS2CNcHjZLUNGdtr0=;
        b=KDLbSLiUxmwBy/0pTfzGY2LYfvNApXcdaUVKI4b8LAaUkSZfVzE/Pg+F6JwKu1CSD4
         AohY1bzokdcxPGQANuMA667iwySk5+JKhOkKMa0FOPN5iUYVMipACgfYB3yM8VQa1Spd
         oHI/5Mhw1JrFxqkD78ImJD3juZQkYfDrjR/qnjj0ku1PCxJU/DlNaCLXedghj3PmEuOC
         2UNH+2KCPBmV53RCUl9pzHd1H1kV6+amLXg/MIqY33Rb4Je+zby8hNQa8JvbYuBYl7ta
         ypXzQh9VpCghzj9rtKWudrxECVKEzrsuNU9JpsJq6GznXaSI2udhf6xoEDg9guQNcvqC
         jZXg==
X-Forwarded-Encrypted: i=1; AJvYcCUmUrvcdyGMsQyExHqC2veXFzoT8z+S8jg+AJ1X/+EiQ8ZgId2hj5ADXdEZ4ba70f0dO8jJ1B3WGjJJ@vger.kernel.org, AJvYcCWYxybkHtJHIdBaTvAFQ0A5wtgncCYQqfnkqV2Yq5UgYIEFvDeQaQ3n88rXRgAWNRrsrWG+Jb1puMZvIRzz@vger.kernel.org, AJvYcCX43yu11cAB4Ii7DwrhUnN8l4t1UO58+vMZYMyGQCN2iOJ2eMnRb56dnuJlNMBfr8mxB/7aXuVeEyim39b5n8PGNRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynBiwXWj7Vhe6mJaEdzM58Ui8zdaioCuzS4QLwDPLZQ42YEIiM
	1BtH1vLui04toAbOCaB4W053YnM8ZTDEgC4WnH9A4sG8vmxdqGOw9Wnz
X-Gm-Gg: ASbGncvhN6D13hxHxBBtEGP0+3NucqEZS29hKGGz47he6UU8C54TUxJkcE67SRumhmS
	FdqSCdVwRpsfmroTEQnGjZe0XE9yyoOJFMSuA6uAgYgwkJrIc31lxgZCsAkhf1+smRpFWmh322L
	42baV39sdr9JM6jU41lYRHOYVP9jVsjFxqOL2wKaU7rMT+/F42FJuJdyfSXkhZIMA47Z4VyCSo7
	zqSfu/pkA/BCSNE1RMCRStcgZjP6iyw+Y0qEk8MrLcixLMv9QEp00gQjJ/bq58iFAw4E/0tFl3Y
	OARGuBJj7gqbIoN0xdJSdgjripns4rsqWHraScpctMk8NwDfrTblaXDr0tzoGLiI9at24C+Fd1+
	6LDwPUVgJ616vsLPu1t5fDCyKTwA08dH48cFDeXadpovqd/vq0K0BEUZVJT90dtF5H0qJZgP4Ig
	==
X-Google-Smtp-Source: AGHT+IGWKy91sQ+kvopcey5WRxnVuPBptprmi1/Q0gEOisct1Z021COhZf9sS45lL0TQovPONsjoqA==
X-Received: by 2002:a05:6000:2c06:b0:3b8:d360:337f with SMTP id ffacd0b85a97d-3b8d94c9d48mr8191090f8f.51.1754337449492;
        Mon, 04 Aug 2025 12:57:29 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm16293840f8f.17.2025.08.04.12.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:57:28 -0700 (PDT)
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
Subject: [PATCH v3 1/6] dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
Date: Mon,  4 Aug 2025 20:57:18 +0100
Message-ID: <20250804195723.3963524-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No changes.

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


