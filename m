Return-Path: <linux-watchdog+bounces-2893-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB2A2F7C2
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12AE167389
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F42625E460;
	Mon, 10 Feb 2025 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMwyFiBW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262A25E441;
	Mon, 10 Feb 2025 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213371; cv=none; b=C98jg4OtY9yE4HHGF1tKY+3B2EB4wcDmSSmoCc1/WwD+L5Z8JYUyYyfwecCh0FzeJMGFzfAHF37C1sp5ESkerhSsIY1gm0OBK4B0pXu1L5g7ZmFTyoDMnNmM+UYzHueniQSbaeh5MIu0qHQ2a45JrlIX4OEbwh3/QakhV14ugbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213371; c=relaxed/simple;
	bh=27/M0K0pZ94C7ixi1MppJXFz19Fjzo4aVpVb2lItSyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4GCuqMDI7UWIGVaiJi7NyxmIBXo8IVnRuHU+BjN0zZ3zC1PAefeJBX1+Hnc9fE6mgVIY3709IB2wiERUBFFiXZwtsWkHhL1F6U9kGPuEF2J3hXQn+DE6Gixdt7CyjyNw4cgwRL4GFGdgu+YYArGHpWnRrZ/Dis8HYmXSBJ9wu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMwyFiBW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43944181e68so14709765e9.0;
        Mon, 10 Feb 2025 10:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213368; x=1739818168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTnMvG36Wz8JFnnCPWbU9cUrL+hmT4sMMFdNFht1xLc=;
        b=NMwyFiBWYuUlsM3D8miDtnZc2OEhVvVBA5dKyuwxHhHLgXQiebCeO0DYGEa42D6WoR
         X2RA2qHV6HmlkQCXeAJsTDHHC4QXNmvEteFB/nErSQXhQXgtr9bE+PN58awXfvrTFNeu
         3cEx7DDNnY9TWv9qMw+XynC0mm3PTRLXX6Wjz8KcNwf/NYaEQJdm585UVnXPDvttXHj/
         kac84VXtlRJ3I8T2PW4FmH8BGrl0VuS6jrtlKs5X4n8v4S30IpV8NSbDSEoZayqDyNCm
         PAvMpMB6qEcrJJqafnXz1FyDDJ6ROYDnai9fmn2wXtgs/lZlzlNOWDQ21SR8fCPxqpWY
         i8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213368; x=1739818168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTnMvG36Wz8JFnnCPWbU9cUrL+hmT4sMMFdNFht1xLc=;
        b=bWi1WxOr7HIYrQdgp/gN7tvtSG4tBeNCYKaLwJfFvHetcQYxiMEZWeAqjIhSNXNAyq
         msl6Ox62GgF1+urorRGMa916TsKnEdRdHNtjVLGcCFi/99L7cNVm8UPEtD1kDHtvgKpl
         3d0BtOY2LTSogN8tDtFG9sN/145TCbXmQCyddimv8OZWDL8mIAJbtf0mC7htMmhLTa6u
         WPae+2FPnxGmtJp0n77cMPrz27Ctc4g+A9LcBxq8YXdKlq+zA/9OR6SaFmsNIJATepRl
         X2RhuOl/VtQfldKyv4TXurBlYFWA3wUg+SO2ELST7rpHcMEXVuH8ADFg9rI9N74pg82Y
         ch7w==
X-Forwarded-Encrypted: i=1; AJvYcCUpsr6t1ECX1ERp12BOhPfIft9+N66tXbGi82MvVQbC4zrtenL6V0leUvcondSJQZQnv6rKvjMatsScAGT+@vger.kernel.org, AJvYcCV+6Q7zkuC3itAjErjzreWOxiisg4j7AsF4lAIe5EgObF83+83gIvGVR/IsZ0EZMIAMMP8aGiPPWsgRnCHfWqs=@vger.kernel.org, AJvYcCWTsg4bnvHLNUFYYcuOwp2p0rTKE0g5tZKY/f4PThwZv2whjWQFU1+AKe9hLZ2E6xz2A+0B6LGQpcsK@vger.kernel.org, AJvYcCXg3PJQ0zdfZ72bg6vnse3574DGPLw8j8jc83418i2tJ0oYg4/9DrO1H8p7C4D5DSh1wcYdxMXh8U5y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlo0QUsQMEyHfSJ8PGCD6xzycE/qu3ObjYWgF0o3X3VNkldpjr
	AzGPU8G/UqHR/plwrc4ktz7V9iQBqnl5gPo542/EP32NQxntX0cf
X-Gm-Gg: ASbGncvMbV6sJF5qZM2YPXNq8Hhm2uJ1664MBFjovOAExWnJ7KT8W8BSM62kJZTLiSn
	ta7F4kqGLa+5MBns38JDeBLti7B45JS7GloZZgDm0xEocBOGLrBfTrJMAcvCNNg4WCwZEjT20di
	QusN2wlEzWdEbgA9gcwGVyK4vW8EIRTEfEYQ66QVRweacDaqeJd+FwCRd68jYT0PZw53hTVWCGg
	42e+oUNpDwNz4dr02FnQS96NXcE4TNvJpxp+HcZzyP93li33rtRbxAdhHq253XyZ2T1pD41LkkQ
	WoOzvq7jmOQkJwHl1fNtPma+pJuSje7efMj+4QNdv+BQ
X-Google-Smtp-Source: AGHT+IFFGwp6XMjtwpsCEHiggZLqFIyCdlzhWeH1IDGpfJQobICn40J9zohV2rug2pNgoLa6W6bupQ==
X-Received: by 2002:a05:600c:c87:b0:434:f739:7cd9 with SMTP id 5b1f17b1804b1-4392498859fmr124181615e9.9.1739213367697;
        Mon, 10 Feb 2025 10:49:27 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:26 -0800 (PST)
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
Subject: [PATCH v4 1/9] dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG
Date: Mon, 10 Feb 2025 18:49:02 +0000
Message-ID: <20250210184910.161780-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
the system reset. These registers can be used by various IP blocks as
needed.

For example, in `CPG_ERRORRST_SEL2`, setting `BIT(1)` enables the WDT1 to
issue a system reset upon a watchdog timer underflow. Similarly, `BIT(1)`
in `CPG_ERROR_RST2` indicates whether the system reset was caused by a
WDT1 underflow. This functionality allows the watchdog driver to configure
the CPG_ERRORRST_SEL2 register and determine whether the system booted due
to a `Power-on Reset` or a `Watchdog Reset`.

Add the `syscon` compatible property to the RZ/V2H(P) and RZ/G3E CPG
blocks, enabling drivers to access the `CPG_ERRORRST_SELm` and
`CPG_ERROR_RSTm` registers as needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- Updated commit meessage

v2->v3
- No change

v1->v2
- No change
---
 .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..f42d79e73e70 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -17,9 +17,11 @@ description:
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a09g047-cpg # RZ/G3E
-      - renesas,r9a09g057-cpg # RZ/V2H
+    items:
+      - enum:
+          - renesas,r9a09g047-cpg # RZ/G3E
+          - renesas,r9a09g057-cpg # RZ/V2H
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -73,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     clock-controller@10420000 {
-        compatible = "renesas,r9a09g057-cpg";
+        compatible = "renesas,r9a09g057-cpg", "syscon";
         reg = <0x10420000 0x10000>;
         clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
         clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


