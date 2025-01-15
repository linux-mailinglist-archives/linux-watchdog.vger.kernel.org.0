Return-Path: <linux-watchdog+bounces-2715-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B42A11FE9
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 11:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 264A67A2CAD
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 10:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2990B24168A;
	Wed, 15 Jan 2025 10:39:27 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846591EEA20;
	Wed, 15 Jan 2025 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937565; cv=none; b=nf40dTgbc6flNmsPEcESfuLA69qRZ9al1ZQnrorXKZUO0P0b2rMBTSEdMu6I/Ojoy+L8FVSBIUMtfJzVwtTh9URjyisCKTCQXFnObBjEgXRlfm7uZ16sgqulWIVCwH2JLq4gVAl/evfhFx5Pq9HJnccpAfZhvtJLfPD8VmfS9lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937565; c=relaxed/simple;
	bh=Fu2okt0y2+IeQHNBikLETeTY557OS6ji8DQZNYHPgZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgBMH4TtpkiC7MPgksqrtZaoMa9hO6Vu/2TZhgaXmoIYOQWfBnQrHFQDCfXdbH9Dbk4MW9Q+RtGGXrOAT6HsUTybQAAQmD2EHr/NBL9/xJq+DFl0NB39kCox+LG9jHEbvXXub1VOM79Bpv950fDGepNp+nvYWROFZPPtPv8Gxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 68PlJ+6lRSCsOmDc84y/fg==
X-CSE-MsgGUID: r3SI7oOKS3SCDKs69HnIzg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jan 2025 19:39:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.251])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C577E422D9AF;
	Wed, 15 Jan 2025 19:39:05 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
Date: Wed, 15 Jan 2025 10:38:50 +0000
Message-ID: <20250115103858.104709-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


