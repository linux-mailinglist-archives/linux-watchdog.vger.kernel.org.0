Return-Path: <linux-watchdog+bounces-3070-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3DA55C5B
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 01:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC19171E01
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 00:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B291624C5;
	Fri,  7 Mar 2025 00:57:30 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A65B154433;
	Fri,  7 Mar 2025 00:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309050; cv=none; b=dTv/XcaVfYkaSSL9CAQIcv3N7dMu37MdjWCk2W4c4+CMazYSwpbyDmRvN1UDWs7DTCbEySBiJEHk3w6INq/3bi+WSOoK8kwQo0qou2cgTJ7hn21gLZoD1TgYKzuERvl6Ggne3cy22Tyz1ikKK6093Xpp5iuFxqmGfjTcbxAT8lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309050; c=relaxed/simple;
	bh=fM32MIuFbhdfHzKCwFeEw51NeeHy3o+LDYOxFqpZreA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbISFlDNy65fqnlfuZr0FA0FLYOYcN0yBwMQ5agCRjfTDtA+Y+V+UiedShAfzVfd+q8np6JTviiJkwsbMjIkdkyb1eWWbCcrLNMbSaJSSrQI/TO8Ul908GIn5ArfN42OgE28uSBkF2dXlepeosTr9s+6MEgJDu1i4jZ+P1zeM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6898F1BC0;
	Thu,  6 Mar 2025 16:57:41 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08633F5A1;
	Thu,  6 Mar 2025 16:57:26 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 03/15] dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
Date: Fri,  7 Mar 2025 00:57:00 +0000
Message-ID: <20250307005712.16828-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC features a watchdog similar to the one used in
previous SoCs, but moves some registers around (by just one word), making
it incompatible to existing IPs.

Add the new name to the list of compatible string, and also to the list
of IP requiring two clock inputs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 64c8f73938099..b35ac03d51727 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - const: allwinner,sun20i-d1-wdt-reset
           - const: allwinner,sun20i-d1-wdt
+      - const: allwinner,sun55i-a523-wdt
 
   reg:
     maxItems: 1
@@ -60,6 +61,7 @@ if:
           - allwinner,sun20i-d1-wdt-reset
           - allwinner,sun50i-r329-wdt
           - allwinner,sun50i-r329-wdt-reset
+          - allwinner,sun55i-a523-wdt
 
 then:
   properties:
-- 
2.46.3


