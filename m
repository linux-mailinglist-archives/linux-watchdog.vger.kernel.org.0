Return-Path: <linux-watchdog+bounces-1451-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CB9482DC
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 22:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2D8D1F22376
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 20:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7094416C699;
	Mon,  5 Aug 2024 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XofljPCG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755AB16A37C;
	Mon,  5 Aug 2024 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722888272; cv=none; b=ihmJ2LIZtVM6HwOC00lU5ZqFJx39dYpPz2XZEawMsMWnLvY80EXJQJ48I4Zv50ml0HePshvADy5ZbPFaSoOfqGU/Y2+fz2MC4atEV3tLecWENJ/B5L/R5hzBHlhqmRhYRDevVK0AlOlZWhVg5CZjGZLkgD/0DU8NUk49mjB1e8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722888272; c=relaxed/simple;
	bh=iODb6OQrUL58ALslEvQpLTnfs/KQiMyRxQemMVqXOG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kT+22KjG/yOF/QYmv8RCYn8nVjeTrm6Evk+h00xfem7lMNbyMpJOQajXa4WMChOQtC3nP40IRZlVkQLfSk3hbao111b0IM1GZWmATbz8tvPb67ZGQ+ghht26YNcPaILm+HS4fI4Vl2wjNfn1uvB2X0CbynwIjs17U6Qn7Lmn38I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XofljPCG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42803bbf842so99666765e9.1;
        Mon, 05 Aug 2024 13:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722888269; x=1723493069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heUghuk8oELrcN0EwSv5IDiZOEj9GvKbyKkKqB/gu6c=;
        b=XofljPCGR4DqGSEiEtwtMNrljseBNpTicgRY3/VCHLoLbNUTC6elnJSEqusN6MKyIT
         17kX8Hq2ybaqvebzYSRiWRyHUlyTk/fNl3vBF3r2aXEE4UiocFmTVdP/NHslASVQJMPp
         Bl5JitOt2epGKlq/ajk9eVYfOGZW4xsrHK0TCCRDOm6c/HlDUhKmFmoHkLUJPC20kBO6
         kBlDW694tN5rduEItJ6LUpJUBTVLjSRl3Ih78IjEGJ61MYhb2JjJm16GwtpeipKIQALh
         ybS6354mqGzPz4k+ip1es8AGs33rJNzEKrjk1888g3iDqshF3+PkAlDmqpXp4oCv3rnQ
         47KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722888269; x=1723493069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heUghuk8oELrcN0EwSv5IDiZOEj9GvKbyKkKqB/gu6c=;
        b=LUvJC2waqVi0wdWcy8THnzw52Lhefb9mtXFyLwnIG6+izhKidfv/EhWalmh4sqGwg1
         d54rVcjkfhWptoiyob0Ax5n4aaikhLNmJ6kb89sZprXWfqFBbee5AdZwjxyFV4AHegAY
         x3/+Tg0N1iIFNHzoS3Nn1xUKRku5TBkIhSDWJfMokVXlYB96rNjzo33+L+BX7C1SWIt2
         GxXowsG3cLSDGzg/ygV70nwoNRBCxaV+AuA/GzzGyUpfHyhrlUQM1nTduc/OEYbA/jKC
         ofdeAlRWNmhdFbUgalinC0WdPAnBhW2RRDAI3T3Cg+2fxbOz7XV4DWxwQEukb/dHJXCw
         tHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjouUDrp3r/MpUigPNcwrX35PZZ9Ehd/ggpsVODMqgFTWzIqNykOkcp89lf9VPZxbT+amuSB8ekcEgCUW+LfNORsz0la5taywjIx2K+Y/Z4SSSa80emSE6mTAMxm7B4TPyVTOVeFoM/lgTSTjrz7I0AXaGre1NTYySboknaQMDVjJF61Lud4AW8Zgh20vc/w==
X-Gm-Message-State: AOJu0Yylsdqmx0mFXYmBKG5o01nmnXiDyRR1L97DNsezxsEFBKToKopw
	+qjGOjiamZgrQF+whjOYWx9mKFlksq9bllapnrb8oxeHpLCnj55o
X-Google-Smtp-Source: AGHT+IGSctFthWy1jry9/5qDYog27Heb6dpJXjOd6FXa2yBvvGqMDYcZp96iEn83vhfRTJMb8rurzg==
X-Received: by 2002:a05:600c:4713:b0:426:593c:9359 with SMTP id 5b1f17b1804b1-428e6b954cfmr130704735e9.32.1722888268626;
        Mon, 05 Aug 2024 13:04:28 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:25b8:5324:d26c:319c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bba283fsm212967405e9.46.2024.08.05.13.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 13:04:28 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
Date: Mon,  5 Aug 2024 21:03:59 +0100
Message-Id: <20240805200400.54267-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


