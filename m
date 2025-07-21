Return-Path: <linux-watchdog+bounces-3890-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13CB0CE75
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 01:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D1FD54266B
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jul 2025 23:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B49424677E;
	Mon, 21 Jul 2025 23:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dv7DFJz3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9560D1DE3AB;
	Mon, 21 Jul 2025 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753142246; cv=none; b=r2soQYNhDXFdwhz21C9WbUZDtxXUlkdhml4A2gy/IqiZxfDyi/oPjtI3C0Mj2zSygnqKu1TUk8W7DAdQxZjo+DrX61+1qvVzfqoyoNFb7bqVJC3PnQxNl2qKC7jEv8+bupuWgYrKaY62E3wm899eoT50LkrF+ikTcP7M/8+pkW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753142246; c=relaxed/simple;
	bh=0RZSxgaRH6ptwJRNYfINYVrQgkykInNIGuqXOsjInU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXG6vueu2MLYPdpIa1nfZYPiVInMr+I4gkk5GRoDpsG3itQQUDet5jdnoQVUMYZzy8bCpjo6wkCRd5fsyVoHCywE7j79lVMmZ5yzrDA/C4oI22RXx0MvED8Nc5hRSLgFAq920Nw7gQ3rRBhDY7RVL8biQ8Ppfd8L/ZxHkysuP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dv7DFJz3; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LNv6w51364869;
	Mon, 21 Jul 2025 18:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753142226;
	bh=vk6uXfUch8/WvTlVfXXqhMpCGzMmlK9vi+JQlL/veso=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dv7DFJz3hvi+WXFBS++140eeKqogpxyBWwaADYoEZr/h10tGCaPgnL/QyaCorul5y
	 yS7PngQWCBj9uKkLn0WnKRv6qJMDS1A7ClUbQHUkSn6Px5k8dWr6RnHL/BWkWumCKg
	 xefBqeEe/Bl8PlhGGE2+4SsmxSZrjeqTS1mut9e0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LNv5Lc623744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 18:57:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 18:57:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 18:57:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LNv5e1422426;
	Mon, 21 Jul 2025 18:57:05 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v4 1/2] dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
Date: Mon, 21 Jul 2025 18:57:04 -0500
Message-ID: <20250721235705.1160972-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721235705.1160972-1-jm@ti.com>
References: <20250721235705.1160972-1-jm@ti.com>
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


