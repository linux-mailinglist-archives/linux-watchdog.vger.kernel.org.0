Return-Path: <linux-watchdog+bounces-2771-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F683A1C7F7
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 14:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 769837A30E7
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 13:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D54612DD8A;
	Sun, 26 Jan 2025 13:27:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C6EEDE;
	Sun, 26 Jan 2025 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737898028; cv=none; b=jPY3tb5OrMtdvqJXt1GkiCbfUvBivUWQAzgseIaABF3c3gXuSCNegoiyNzkr2+cD3zHk9Qs8BeeZQcE5gaIxX/lYBFcvGdfqEA7zzIXoUqFtQIOdxewZjhfyC/dGjuCoaHZRfqHUQASfDxzc3xICNiExgY48a8ehMot+dgBiO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737898028; c=relaxed/simple;
	bh=WzUAR9LGv5gv8IYpuaY81t8A+CdxUq8/ut4yqHVn5d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSwo+oluyeXe41+GOBAvylPJveSrI31vCdyiQTN4JG1m1sTDX/QicqBHyIlxKy36FC5ah/2cFWAevkkKzkFdDKmzLacbcSYDlXGyhTRHYvwInCdXXU18BoxnYXe5XhQ2Gl6omadsl5B4hxJc2riJaiR7DxUVu1H0P6Si4+FebSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: JVzG+WatT5mDZBCr1Oxn8Q==
X-CSE-MsgGUID: Po5huIFBQVqA7CjqVBFkxw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2025 22:26:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C418F4002C29;
	Sun, 26 Jan 2025 22:26:41 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
Date: Sun, 26 Jan 2025 13:26:30 +0000
Message-ID: <20250126132633.31956-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the support for the watchdog IP available on RZ/G3E SoC. The
watchdog IP available on RZ/G3E SoC is identical to the one found on
RZ/V2H SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 29ada89fdcdc..3e0a8747a357 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -75,6 +75,10 @@ properties:
               - renesas,r8a779h0-wdt     # R-Car V4M
           - const: renesas,rcar-gen4-wdt # R-Car Gen4
 
+      - items:
+          - const: renesas,r9a09g047-wdt # RZ/G3E
+          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
+
       - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
 
   reg:
-- 
2.43.0


