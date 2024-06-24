Return-Path: <linux-watchdog+bounces-1185-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3F91554A
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Jun 2024 19:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE81C1F24440
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Jun 2024 17:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0576F19EEBD;
	Mon, 24 Jun 2024 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M16oajqb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4E1DA32;
	Mon, 24 Jun 2024 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719249948; cv=none; b=PtW5PLlLUl/RczdMnV12Cdp4ybAyWOzB3YiixIWC0e2nE37WPvQZZyCv4QkcvYmFUtfhueMob/r5rTkVfI4dW0de5ON2y8DHQwCoIN/pxzFes9FzZE7ue6irDNOG36/yAejueBPiDonL7s+CrEvtbdOINPuggIjIUhPpnK7v+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719249948; c=relaxed/simple;
	bh=Mwn5PayJqjJYT+dOmdEVFtRH9oIImJxDwxDMQkkrvSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMksIXYx8hhWsgVZoICAyI/q2T30aTBAQge/2MSEADdxbh124sX0RMRjwacHU4ub86z/fsfA8id1821NBweMRCi2gXcYjaUg5MyvnbBYJnu9donJTUQ6mu7Va1Ml2jKa1WLSEDbWFIkPNHUC6pZ58LG9Rls1Fyq+UcuuQWTpOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M16oajqb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4217d808034so37863355e9.3;
        Mon, 24 Jun 2024 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719249945; x=1719854745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=senOMSMrJcBNHfSBGQ2th2iEi+b0Okbc/49mKAUN/0Y=;
        b=M16oajqb1StnowIBntR3wI0XjMDOTUmox5NsP+Ln+mvuhA31LnkStbLGWYUVA82zVT
         P5zqio/82JI7Q811aZFc+sTXULYdZ4xdL8Mq+Qb7MvAinrMp2HGPggxCut7jq5PpTQKc
         4xqKjcBwWi39kAiOFmy9hrXLT3mA+zdryUK0wMYqGHKfNGcQJj+Acji+kAw2ZkF1cEGG
         dXCfdn5P1avgv3bqDLw5VbDN/65uZnEKeis6mlotjj+shczXquHUeiSx3UEU+wc58/7k
         Mb6r4A6MXFi7+WqACWFWTy7Oszob0Q7VgrLeA6wGxrGc9Ax9MhihcswLxXPuq3of+IPa
         gtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719249945; x=1719854745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=senOMSMrJcBNHfSBGQ2th2iEi+b0Okbc/49mKAUN/0Y=;
        b=HUuUHDU2cxJMuPGCK+wi1AuS+PSg/vXAuLXMZYRKnAw8oBl39UHEBNVUcVpDM5Ka8I
         b6m2spCNxn3ht1fRNgKB06pSZA/vXOao0SN/h/uCqq/8NKpidTxLPoT0ySclJ2LKoB+7
         XplVEzCQdmlftC4IdrYuNfC8YwewBVIu357w2/9O9A/xSCo5MU7+T5eoX8wKliSAIrXY
         EG6XaXxTg4NMJdiKL++gSx97pnlD4udMFvLvl9DlXJl8c66m/2MPOJ+Cm9+jwPCxVf7D
         fP8Pls0NdGnhx4ZX1u/IvpVU9vMGkRDJBO3QQDaAL5VFNhGvaHcFtxQF6ulC4g1xZxfY
         h0AA==
X-Forwarded-Encrypted: i=1; AJvYcCV6NXRxrImjfQftoRc/PzLfmaXu7BQQlGH4IQKSqWfatYK2KlTamzZOh/KWXLogbsHTCsVfxCSZMIHTXD9akzVvuZL36iq9PA+RPk4D4t8piexzO5ZONJJJGQXqxKopfSwR5dqkxKRHz/t0KVsou97gbjBfofjQZ4pzZ5uWjQK6LDrntnvjtG8ixqUe
X-Gm-Message-State: AOJu0Ywx4WoaD9JfN7cv8I/8zTRGAqFfZqm+iX8BCtI2+WGR5HDXJ0WS
	5y2cYNG4PJoTYLy9yXjpLVgkpSf7jqB7UDq6YPGivYGqeAUPZGTD
X-Google-Smtp-Source: AGHT+IEnE6sz+GMNlbw46g2jk2ANo41zWELMXZLov7m2P9VA47EfkDDYkHXIxRRpNWznBi+c1Q9Hlg==
X-Received: by 2002:a05:600c:2152:b0:424:8838:364f with SMTP id 5b1f17b1804b1-4248cc350b1mr34781145e9.22.1719249945271;
        Mon, 24 Jun 2024 10:25:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481921f16sm140555005e9.41.2024.06.24.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 10:25:44 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
Date: Mon, 24 Jun 2024 18:25:08 +0100
Message-Id: <20240624172509.106912-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624172509.106912-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240624172509.106912-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Included RB tag
---
 .../bindings/watchdog/renesas,wdt.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index ffb17add491a..21ddde8f70b7 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -74,6 +74,8 @@ properties:
               - renesas,r8a779h0-wdt     # R-Car V4M
           - const: renesas,rcar-gen4-wdt # R-Car Gen4
 
+      - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
+
   reg:
     maxItems: 1
 
@@ -112,7 +114,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
 
 allOf:
@@ -136,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - renesas,r9a09g057-wdt
               - renesas,rzg2l-wdt
               - renesas,rzv2m-wdt
     then:
@@ -170,6 +172,19 @@ allOf:
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


