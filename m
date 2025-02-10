Return-Path: <linux-watchdog+bounces-2897-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DCA2F7D8
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E78ED18851E8
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8797D2580C2;
	Mon, 10 Feb 2025 18:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNvfkD9U"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C925743B;
	Mon, 10 Feb 2025 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213377; cv=none; b=Z07Dy/Vt8/BE4a+t9fr96pTUHaMP4paAXssI/NV7nILLruX008Ds+ok9TxMY5y0ZPKHp50a1+xzeYJSzqpavH8+ZyRO94N95+xTX6Ma0KngAu399VmxvwCUu4kx2gmLoW7/++DO7le6dRN06qG7NB1KRSg5HLoeHTCtqduDclnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213377; c=relaxed/simple;
	bh=iSPQ4Z+Ux+ADkN4gJLDuSUa+C6oS171HubB4WjTjv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrWbaXBvuCCkiyQLXdgCMtn60KZTmkExu694/iSJa8RVQ8iWP1ooIixQe18AXTXlZPNne8cU1yv3T6ipE02vzOc+00doCL+ergYwX7rGUgfh0o7xHzWUVAHNFNsyo6XJRZb+kP8P0Q+7w/Noq8r4dP0W2ZDyy9tJ7yGD3TzbwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNvfkD9U; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4368a293339so52841415e9.3;
        Mon, 10 Feb 2025 10:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213374; x=1739818174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obZC/Q/ebwhcN6Znb8yGbrrpb9ux2g4SCGdm0zYjhLM=;
        b=DNvfkD9USRn3TmguorwdBiUeVcBCOoiNmg7DiafmDlTS08ylGolnL5ZQDZbTkvy7Xi
         61TjG04sEV0HEyr1fFIEqmnByoc9JXAXkO6Krd3YmtBF2O3WLteqXRrm9cYaUVh9kR2r
         c1o1Tjodakm3jsqbhVJhlm4+oOSi6HsYZjLLANLMeqkbkHQO0ZBMb3R5IKpzwCJm0U7b
         dJU6Y1q2CFkoQMjXSTvidEBMFdeY7Ph1znuKAHd9vwnxzuNBrX7QQ9q+kbimdKtVnqfu
         jEoje/Wd/1bM++yFDz/1g1IS5Z6tJ628FBIj2UpmA6m7e40XHQt78rs+ZixbAMBul0kF
         h8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213374; x=1739818174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obZC/Q/ebwhcN6Znb8yGbrrpb9ux2g4SCGdm0zYjhLM=;
        b=mgTAWzNI19JHZjobGngwfV/fAL4Qj0Jv6dv5m9sgtGouUAn3H/hXTa1667A6AMJ7DW
         n7/ZKKy+lv4Qz1RHr/MH+wK1wyXxJ2aab2NqSdKRf3aSwC3aDep4TFt8pbqE4qAa5RQH
         c9KLObU4spq+fXbIneG+w0s/cstmsfspABeptIAOrVs5dMrLx0BopIKHhnmth+fitroM
         p5PiEeVWnuTFBaLzDc2wcPtRzezqBKE6OHysmY7v5dgs9U0JW9jQyWFLUr4Xj+4aG8Dm
         czouHfgNie9XJKyiiKe55DpSToApaVTWJzpzLUOoD8zqXM6nFysLd+C4o5iNIrO86cdM
         W/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2PMKnYRF+lKu7jKYiJLto22n6mDEIQrSSMBNgXJxeASGw5n29IypzGsRtQXLpDVifS3enwMgh8hmu@vger.kernel.org, AJvYcCUo4UMqvU8JewHWOl7rTEEc7LL1621QYu+wiB6oSNXz5yZKTUbCRLMUerokQbW+s8CxFK8YOKZiNxQW@vger.kernel.org, AJvYcCVMXzad4pNGxKwC75OcGIKnYjst04422tpxEfp2WF1AWScyIHCkj5ohZWNHsQt+Zore1J65HTUoV+cg79Ww@vger.kernel.org, AJvYcCWk9yHMFr2FNXD79+MYJyjSkm4DuwJCWwC6KcHVwgR129g6hB9a+plf184r0VjXpBJOb5sIsITSUvEy6SuoOvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdHUbVLS37SKaGnBGLeLW28PU5SimU/7OEbg1mx4uEo7rHjd74
	DyD7FfnCH826d3+zAzXgayNsz0bE+oqTk1DoM0P3+jM4AGPrWpNV
X-Gm-Gg: ASbGncsHRHpT2YKrsyNBZ45eDIxyTNLQ/rUB+wS9OTLmYnBA4KRkF/Ro7DnO0H2BO+m
	912jIzm1SMo6YjwGjVzZFJ4LlleF4c65vzIAsRKC1u4bBiYPzB69xjQZ+wMGnI1QWAjzK75r6wI
	gNTvGvRopETEvbvWnXBHNCsBvujFD2Td3ElD9Pf/2vYl/sB2CHI0yjvRhOhtcLfFrc8pZzQgUIT
	IVPlPInYjr1DN50Wwmo6r9k9OyrNcgrW+qFKNk8WDtKQXH+feKJEbQltICyYZv54gPCo9QJEyh6
	4Gjd/mDVfKsVry2KYvgB1s9PkpKBqnxdWIlioWDYAyD7
X-Google-Smtp-Source: AGHT+IHH2Nqyj+gvLs90MLXN4JB/c9lIK0C15emTVznToX5OBHJ0ZSyLAahBZT8FRVz1ONKmbREBOg==
X-Received: by 2002:a05:600c:4e56:b0:434:f9c4:a850 with SMTP id 5b1f17b1804b1-43924989231mr135074015e9.10.1739213373533;
        Mon, 10 Feb 2025 10:49:33 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:32 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/9] dt-bindings: watchdog: renesas: Document `renesas,syscon-cpg-error-rst` property
Date: Mon, 10 Feb 2025 18:49:06 +0000
Message-ID: <20250210184910.161780-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CPG block in the RZ/V2H(P) and RZ/G3E SoCs includes Error Reset Select
Registers (`CPG_ERRORRST_SELm`) and Error Reset Registers
(`CPG_ERROR_RSTm`). The `CPG_ERRORRST_SELm` register must be configured to
trigger a system reset in response to specific error conditions, while the
`CPG_ERROR_RSTm` registers store the error interrupt factors that caused
the system reset.

For the watchdog IP to trigger a system reset on a watchdog timer
underflow, the `CPG_ERRORRST_SEL2` and `CPG_ERROR_RST2` registers in the
CPG block must be configured. For example, setting `BIT(1)` in
`CPG_ERRORRST_SEL2` allows WDT1 to issue a system reset upon a watchdog
timer underflow. Similarly, `BIT(1)` in `CPG_ERROR_RST2` indicates whether
the system reset was caused by a WDT1 underflow. This functionality
enables the watchdog driver to configure the `CPG_ERRORRST_SEL2` register
and determine whether the system booted due to a `Power-on Reset` or a
`Watchdog Reset`.

To support this operation, add the `renesas,syscon-cpg-error-rst` property
to the WDT node. This property maps to the `syscon` CPG node, allowing the
watchdog driver to configure and retrieve the necessary reset information.

Additionally, this property is marked as required for the RZ/V2H(P) and
RZ/G3E SoC to ensure future compatibility and is explicitly disallowed
for other SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this change doesnt break any ABI, as the subsequent driver patch
handles the case elegantly if the `syscon` node is missing to handle
backward compatibility.

v3->v4
- Updated commit message

v2->v3
- No change

v1->v2
- Renamed `renesas,r9a09g057-syscon-wdt-errorrst` to `renesas,syscon-cpg-error-rst`
- Updated commit message
---
 .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 29ada89fdcdc..ca62ae8b1b0c 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -112,6 +112,19 @@ properties:
 
   timeout-sec: true
 
+  renesas,syscon-cpg-error-rst:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The first cell is a phandle to the SYSCON entry required to obtain
+      the current boot status. The second cell specifies the CPG_ERROR_RSTm
+      register offset within the SYSCON, and the third cell indicates the
+      bit within the CPG_ERROR_RSTm register.
+    items:
+      - items:
+          - description: Phandle to the CPG node
+          - description: The CPG_ERROR_RSTm register offset
+          - description: The bit within CPG_ERROR_RSTm register of interest
+
 required:
   - compatible
   - reg
@@ -182,7 +195,11 @@ allOf:
       properties:
         interrupts: false
         interrupt-names: false
+      required:
+        - renesas,syscon-cpg-error-rst
     else:
+      properties:
+        renesas,syscon-cpg-error-rst: false
       required:
         - interrupts
 
-- 
2.43.0


