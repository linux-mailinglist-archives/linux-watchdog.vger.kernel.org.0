Return-Path: <linux-watchdog+bounces-3043-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617EA4F052
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 23:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0BA188CABD
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 22:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EAD27BF93;
	Tue,  4 Mar 2025 22:25:47 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A27E27BF7B;
	Tue,  4 Mar 2025 22:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127147; cv=none; b=YegcLDYTQDt2Hz4hEpm55dnHl1K7ZvC67N8drLhmWcpS9F5/VtzMSsNg/RD/9W1TzXX/r9LgTT8NXsNwRx0bk35NVn3xAsoELduqj0cQAtm611i71mHLjUFe5KLnwKyF1L1vADGPP3kKOI1yN3uBrFQEof8H9YJcfoDbGRAucgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127147; c=relaxed/simple;
	bh=fM32MIuFbhdfHzKCwFeEw51NeeHy3o+LDYOxFqpZreA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8YVPtrsk4kWhWaMGYzYnnAyYSZdSJTr6z7ruyNN/udyUatBcbQ/GzAZ/NIvIY4QeGqEqg1vsOUwaAxosOCVWol6nV+SMNLFlngv0HT1//2EntU5Ket5ift23XV7TfXuqUAk6UG/QDqdo6mjCDg86+7FG96SL54/NniFyfee+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C803497;
	Tue,  4 Mar 2025 14:25:58 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 186293F5A1;
	Tue,  4 Mar 2025 14:25:42 -0800 (PST)
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
Subject: [PATCH v2 03/15] dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
Date: Tue,  4 Mar 2025 22:22:57 +0000
Message-ID: <20250304222309.29385-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304222309.29385-1-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
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


