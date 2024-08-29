Return-Path: <linux-watchdog+bounces-1633-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB17964F27
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 21:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F170B20F30
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 19:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16711BAED8;
	Thu, 29 Aug 2024 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVmPRbmZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC11B86F2;
	Thu, 29 Aug 2024 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960327; cv=none; b=auIgOoEEYGoZFNG9MKBORIRZqQhANbmzz22iFwdNrRuPdFhlmaYxXh0Vz8MCiXD++URB9HyuxSQ4hkzw+VqwUzdDZhx5kZrTra2O6dQCk9mUNDYBarooPwvnqqKpGy4feiob2SlfpgPmgyVgt/otcvj1ubK0/fY7UKF6EdFRYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960327; c=relaxed/simple;
	bh=n1+7FT/ntcFlz4ndDgXigCmbDKrtYvsmff2Y6NNLaxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hBfVwbdnSNt1CYE0jRztJHlTHg2qcY/NPL4fOi5veF1rUmq35/Zqh/7VVDhal47A5L3pa2emMuoEEABjLFZjzPa/FcOU+c6feMCM4o3vp9br3fZIe39GjNnRWWw13eD471KV/FTHZnpTj2TdrkyFSoy9eJzCxBvsL0ekODmMIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVmPRbmZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37182eee02dso696400f8f.1;
        Thu, 29 Aug 2024 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960324; x=1725565124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGQpGI7FXkT/yuhKV9KT5ZFXqAfnLy434GifSzg9Vbs=;
        b=AVmPRbmZIrUiZ86itbF9aDIgADRcdsftAiGF5Pv8a1X/hygM9DoQr+R42EzVUmyXsX
         0sV6E1zzC9tic6WLpW9QS57YVCuv1DGNygLTGaHm9inrfrl+aYvkF7IiPmPG9MAAPiRZ
         CkOy4S6lg359FQDNqAMEbN+Eok1kwvzszOodjpEnuq8ZNgOESDE5XKs1QBd3z79hsBtB
         hQtQegP7YHhZSzSJr24q8dJSszaT8uCPdsxYjY6OiWWHVmS4fuseDWlgVxyYECEKdI/L
         PqHDvCLQ69Xup2nSfvfSEYYuP8gigHOWpIcOS1iyGgXDkBUpq3Q4iXPLMTn9cQ+JGu42
         s0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960324; x=1725565124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGQpGI7FXkT/yuhKV9KT5ZFXqAfnLy434GifSzg9Vbs=;
        b=l+WgibzpmfY8UOhHcH8BqK+qBphuKLaj1uqflWG7xASB3m38hCAh1QIsGG3dMa/HCc
         MQOKhLaPL3oXdbaZgywAaD2nI7IBhwGOVM4KM8Inn/lxEmU5qeHHaYyUp3NDelVCx/74
         O6gLVmMtwfRoOTml8AWWv14QL1rWFqc7zMpZwHLGWQFdHe1CVRkjrbyfhfqq42SBRvmp
         8BWatxYB4urTuFDsxjN1BrCdDVG+PN5VPc2vD0dHxS04w+sKjVcD18ZX+pRkYCCd1465
         brwyujMFjcFy5+OtoZuOhqFgb/DprgD8gspoOW1wu9iwTIf07u2SKi2TR2IX4w/F8gb5
         aeaA==
X-Forwarded-Encrypted: i=1; AJvYcCU9untZPgyFtcR2t1uO4piJZ1HuIXn4CEsw9pWkR0zIKedYdua53FJluldEMfUtDsTDfU1ACrQ04qqiemTp@vger.kernel.org, AJvYcCUTBNyMbDQiikGf+YgoOyRDnJXBhf2Du6yjU9YdA983kUeRwNvkoaMUp5nySy311fNfCyLBmG8hD1I1UyUs4N2Q/Dg=@vger.kernel.org, AJvYcCWnP5iPikWUpCo7uk8iWgHpjVWcWZKALAUMy7nOZmxVqaIpOgdptLweega+hdc7nia4k0IyQNkPxFFa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9TUNFmMvGt4YvBlfcDdwpnAg9SkPlme/ciP4B6qlz84FEAclF
	7b3g5jTTdnVG9TwJx1U26DhkgFtR84U6PzSG4u/G9RhCQYhan/h3
X-Google-Smtp-Source: AGHT+IENLdroF9LWoASPA4H6lJs6EpBYWq8EkpJNkbCnN10JMfcxNN8aI+6AAM0asDQImLS2OYM9LQ==
X-Received: by 2002:a05:6000:1845:b0:371:7cc8:ada with SMTP id ffacd0b85a97d-374a02288d3mr2875919f8f.16.1724960324005;
        Thu, 29 Aug 2024 12:38:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a26f:c074:4086:5001])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb2c91sm2140049f8f.102.2024.08.29.12.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:38:43 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
Date: Thu, 29 Aug 2024 20:38:30 +0100
Message-Id: <20240829193831.80768-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240829193831.80768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Watchdog Timer (WDT) hardware found in the Renesas
RZ/V2H(P) SoC to the `renesas,wdt` device tree bindings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5
- Updated commit description
- Collated RB tags from Geert and Guenter 

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


