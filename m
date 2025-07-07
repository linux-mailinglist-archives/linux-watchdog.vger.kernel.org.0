Return-Path: <linux-watchdog+bounces-3825-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C27AFBA46
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FADA1898716
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 18:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42972638BF;
	Mon,  7 Jul 2025 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XTCgqTIt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947717A2E3;
	Mon,  7 Jul 2025 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751911226; cv=none; b=hWptrk7G90LqsJbffN0T7/eF7iFUe+waFARYi4jWRmI7wajSP/sTcEfCq6GPj1o7XgULdAwMSep7s3AKnjk4GRVRSlNNCuSNc0u5kdkaXFmBQEwrcI5Zu8B7LpUWtl3H6LzWlOLV8K6elKBzryplzECe/fvqg+KqAWco5m/FGoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751911226; c=relaxed/simple;
	bh=0RZSxgaRH6ptwJRNYfINYVrQgkykInNIGuqXOsjInU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXPfAGQhJrfpq5YAXlKvIn/B0+VaAGmxndfD4t5JV6y4oyrDqj9QEJWx+apNzFmE1XKkhJCho19jBkfzKLnF+oLy75KwKgnltTV1W/VJrsAj/pohzYuSsj3spB9MCkNsArwf8kKiTBEtqGAz6jT0GBFV3CJ+z2kuIodYz2CbsEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XTCgqTIt; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567I044V284451;
	Mon, 7 Jul 2025 13:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751911204;
	bh=vk6uXfUch8/WvTlVfXXqhMpCGzMmlK9vi+JQlL/veso=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XTCgqTItBvV5EFuKUk11y0qy73NtL4amwbTq/eBCIA9PBq5r7K9kpvireUXL+mT/C
	 +Y9aByX5F39aK86Bv0OToM5Mvd35rFovE1AT6RqUUjuspon+D9c45mrbaPFWYQ/gAR
	 WBeMpvXe0SOqk/ai+hypxZgyzoEVwRUOsZHXSPYc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567I0287664632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 13:00:04 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 13:00:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 13:00:02 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567I02QM345700;
	Mon, 7 Jul 2025 13:00:02 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v3 1/2] dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
Date: Mon, 7 Jul 2025 13:00:01 -0500
Message-ID: <20250707180002.3918865-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707180002.3918865-1-jm@ti.com>
References: <20250707180002.3918865-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add a new compatible ti,am62l-rti-wdt for am62l SoC [0].

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index 62ddc284a524..2966e5bfb6c0 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -23,6 +23,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ti,am62l-rti-wdt
       - ti,j7-rti-wdt
 
   reg:
-- 
2.49.0


