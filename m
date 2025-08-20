Return-Path: <linux-watchdog+bounces-4017-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB7B2E66A
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 22:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53CF71BA21DF
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Aug 2025 20:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CF52C08D4;
	Wed, 20 Aug 2025 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjawLkFT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D02BD001;
	Wed, 20 Aug 2025 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721409; cv=none; b=F+I6zpp6O8lHXeq5Vp3bh4y3on2Mb2TiDzlSp10VOlYFvp7XcRvWl4GNN0S5wVnGXknCn3gK6dU0/1mae1asuUTwyQRqE2kbOhzA3fFvyQI+dVGXm4Aan7KOB//Ul+wT9aGjOM215TkSmhLac93gBo2RPEOiCkvjD0mehJoHRkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721409; c=relaxed/simple;
	bh=rCh0jm0hKWAUX+VCLeR124MAi6P/voIn91Yn0jBGCVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REzRTHadLtK/EAqIus43DNX7HeS1d+EBSS/uf/+6c/iQR9UAC2SVU2aUYebqm6XMsgeb4mN6YB8RJ0llno+PSxVJdoGPifA8D6oVgvNMk5/wxnZYKGFDA8c8BxUvaA4UyVFARO6JLBBOaw2ZB5fYA7ApfRQGn3U1JlF6Hw5Gcjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjawLkFT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so197777f8f.3;
        Wed, 20 Aug 2025 13:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755721406; x=1756326206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0U8LYRMmqG5lX7rJXuYXLHt87CXjM0esinNNcYoO3g=;
        b=SjawLkFTWqFFjUoVVb9nxxglzl8ELEhWtqOKCBo81bNmLzMn1e2+a6eKp16L/MqonY
         KkDDqqtVp7WNGwmkcePf+3ELSRj+RaQ4Wy7k9AHFmeZ48svD4/KeGt7Yh3b3WEa7Z1U6
         LLE1tUbybD3aC3njCjsd3t5eIW3kCdhJKsSkPBM/9l+JwoxCfwdRu2hRr/L8bGues/pZ
         K8N+13f0LD+pfhQ6dJzxK6jyqOJsvXyY1tIuohTjYa5Kp8+6GVOMHdGQ6Rt9ZmZC0+J8
         /QtgJSiUPIu+sacLV6Q/zxOGN7zgQALbGWOrfky4GP9BU2Pb016xaXEt+sVmjBDUo6n5
         9mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755721406; x=1756326206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0U8LYRMmqG5lX7rJXuYXLHt87CXjM0esinNNcYoO3g=;
        b=nV4XnZse0ztibQXBSUl6bm+HUEnA1VovaXDEKu/fs/4Ni5foNHXeMR25wBTWoST28D
         drQ8vcLmYq+6wDzujftDSMyHSpvjOyO3uIyhK/Man1YgHVtPk+XQjE+aXfcAF9UQWJlX
         6jDMag/OxZZhY3cwtCpyk/kRJYAfzz4XR2HDZ0CcKg7+bBvP1JLOzcla1R+B/fozNZAA
         /viP9qF9EnB4r5AAGRTPcIT/BaWruxS/WphoVQtcgFYHaG6cl9YIer+N2y8nP5MacCkF
         KFlQXZd3gW1D0bUQVOi0GRSr9Cu5clrAoSXn6wXdxIVTnWDmx6bq0WsUOIczyGCTtpcm
         z1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7850M+jOrwt7j0AV32ZqlbBd1cXYjAg1qB5loa/m+HBlGed6wXXNBxM90zK/+3vWCXwRH3FJQm/DNaGJo@vger.kernel.org, AJvYcCWRrRBKXhkNbzsxyX+QAyIW0+4NSHp2dFbCL46cl/LOiZH8gE6WbfFh7Mjobpg1Fk6kY3VMqGD5ejQoN9IwUxoNPwY=@vger.kernel.org, AJvYcCWS+JhiFtiqZRl+05udnY0cwMu2jMoIASzSdH9DQ7f2cUlUPi6GYzh4pH+jAVsdK8Q71ZwXF7Kcnsbj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqaYW6wBFYSWfYuHqvQHYa1LlcuNEYU0EKhbkQ4xsGU338eE1u
	2LQpRWMDAzAql2g9xJis8Jb6TsoYuv9OtompuKVkUemmc7cpgVoD4u1y
X-Gm-Gg: ASbGncv60o9bGDZhNXBfBxibkNTWuiMsNs62diQhdHwMu9mlOOq5aNcnoA+1M4YSGXK
	852uAARgIvGmfeuYSwowSQGvV1aaOfhwIkpENSvCJMumD1k0YOoBxHI6rvmGN0VNdrIezak/6bn
	Enim3xvABYoV/jqkz2DlX8C4j6jXNMLkg0RI2qt/fNzZVqg+jaya6z/+WTePxQnLYkB8Zjm9bll
	fr3VOpLAXqjeZL/QLJOC5wbw920mBbs7BiL/2oVMTEaLB+M85vbH8a+Nyf+Buy7ngbzwLO5F1un
	XmGetdobyYANI5GaN4VNJp3qv7B1zgFIOlf3ja6R1COdkWodhjovFDtqrlQGYBU3UZwH79tMONy
	oTZsWLQG0s1kq7Rv0VGvvVu6340+f1MmFuVSdE4nuE0aUBt0FvZeBQ8DL
X-Google-Smtp-Source: AGHT+IH+6oF+xWEODFBnDuhgFlZto/2SsHppVObMXuYk/sEu3KMArFPBzh0j4ROnWC3cLO+5IGOthQ==
X-Received: by 2002:a05:6000:4013:b0:3b7:973b:39bc with SMTP id ffacd0b85a97d-3c496caf42emr115109f8f.54.1755721405877;
        Wed, 20 Aug 2025 13:23:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0754f3b7esm8471059f8f.30.2025.08.20.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:23:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: [PATCH v4 1/6] dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
Date: Wed, 20 Aug 2025 21:23:17 +0100
Message-ID: <20250820202322.2051969-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Example:
    wdt0: watchdog@80082000 {
        compatible = "renesas,r9a09g077-wdt";
        reg = <0 0x80082000 0 0x400>,
              <0 0x81295100 0 0x04>;
        clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
        clock-names = "pclk";
        power-domains = <&cpg>;
        status = "disabled";
    };

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Updated commit message to include example node
- Added reviewed-by from Geert.

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
2.51.0


