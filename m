Return-Path: <linux-watchdog+bounces-1166-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B19990DF18
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Jun 2024 00:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 049F41C232E5
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2024 22:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEF217E46A;
	Tue, 18 Jun 2024 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSGQlEAd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157E17B41B;
	Tue, 18 Jun 2024 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718749467; cv=none; b=oy+FzHbJPhClsrVwzlz9ua4sSyRWfcMJ9Fv9N3e4IBA8fACiuoLWmhEXdYBAbm6L8gRUWo3wHf3tepLJQkWICKLjz2EKnXktliCyW7FOWTnDhEuseI3Z4JuUFz1rUf82ocBcjr6iK2ug1QSS9Azcr5ZLfr/utqcTdvV2xYH2enA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718749467; c=relaxed/simple;
	bh=hFXvzMI8OVt2ppOfjexRUVnlgjMzstuZsOht5zQaGPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4WWsbp2Y0QvCLnO35N9zTaqh8rZz2XV6s+4ZQa6aFRoEeWNV7rvyiVIoc8k5yROKINjuzkydL/sDUngb+AnB+9/RS+m64sz9vqy+akFp24lGD75BMdC06UNXoMy/6L9ya/I4FNs4qnYzSnQLiOfb2vitk1beO0fMxuQsNpGKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSGQlEAd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424720e73e0so9644635e9.0;
        Tue, 18 Jun 2024 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718749463; x=1719354263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbnIZSvSRv5tdZDkiMYcRb8apw+5UyYOBl70Ommm6V4=;
        b=GSGQlEAdfKHnm1PhxHoNpTPStHP9mJGFkn5OSEh8Np2/2VU0E3BPHOe8NW9xqacJa9
         HagdTI32hYYndBwo0zks+B4OvFBgvVVkRlgBDMKa/jYejJZvesbAuvITFycNpEl+Jj90
         zI7HfxiygeWdrrzu4Xj1T4ahuzZWbJnapf1LYtAI0ERVIU1MVjZWsHHV781EW9Qf40e3
         pa2iaJznOW3R/o4xSb77OyBLkjwqxuMa1+Els+Zu8a5qdAAmzmxu5mtwylI65vX4hdYN
         /rRwda4PJba/lCRCE+hNKTaQbTehlSJ3t0PHrzXSy4/03pz7UfH2qO6A19T5+DjTB4LQ
         a3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718749463; x=1719354263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbnIZSvSRv5tdZDkiMYcRb8apw+5UyYOBl70Ommm6V4=;
        b=iYm1dNbv45CXbFk+PK11Co6voYA4BGovCzTVl4yWUi4NHTF/QDgAVor05wPUBAn47a
         SE8mE2guslqRmXp62ZgMoDuIhHYBvx1dg9l/EITljoRFKtTapCry9s4hq1GvpKOZ32s0
         A8mJDMbXMsxzFCbwht/7ZG3otSWwfN6bqNx0//UmOJwR9RRTrtLRpL2brEEezTbNnBra
         STNYX7dUEGNZXZO+ZAWJwOTxZ2T0pmCPYNUyyewGwkgXAZm9qf6+JKqKLX2HvS+7KjrP
         20/LKz12IhVjIU+EiVr4KxXE89dSEGP4FCzqMWpMhinwLd4PCW6psBnG8zP044g3dDHF
         9Hug==
X-Forwarded-Encrypted: i=1; AJvYcCVIGsMtaPl9hfIXz+VvCVifkDKeS30eFZAeSDtXOMlzH3PcHUsbq1lgL4yFCRVLw3SUgLivwLmSiHs3YYNh5pjsVskkRiYEw78txF/Glq2vwmjwKyyx8DZtY8lDQQJEWkBu7wGi4tqOOZ8Ex9DwH++3+tpQu0KHNLG5jxNmBsvIbcxCaEYWE2gVhc0j
X-Gm-Message-State: AOJu0YywNXgN3lLO9JRp1Ty70nyJdIBeR6pEEXA2Iiu0Rw13uPvpH5jD
	z8VJkrwfEBHm6XUL7PlS4P3UIfDhIKYDwnrf7i/fBScXtWuZDVSk
X-Google-Smtp-Source: AGHT+IE5mQEl5RCG4EFBodAAycFd5LoVA9ZRcGvM2HSziIofzP94yt6K6eZnUdIG+a9LOiOjyTGHOA==
X-Received: by 2002:adf:ed47:0:b0:35f:1bb2:4354 with SMTP id ffacd0b85a97d-36317b7909bmr679068f8f.35.1718749463313;
        Tue, 18 Jun 2024 15:24:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm15189697f8f.107.2024.06.18.15.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 15:24:22 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/V2H(P) SoC
Date: Tue, 18 Jun 2024 23:24:02 +0100
Message-Id: <20240618222403.464872-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


