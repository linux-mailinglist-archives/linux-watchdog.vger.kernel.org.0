Return-Path: <linux-watchdog+bounces-3707-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE62AE7024
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 21:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DE227B48B3
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 19:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4880F2EE5ED;
	Tue, 24 Jun 2025 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W2tQr+wx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF32EBDC8;
	Tue, 24 Jun 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794328; cv=none; b=jJhZK6Rd6T+dx6SU+SVMMYpNkfl3gTEbU9v1toKzmKkx+x28D1JzBYjN439yBYaTeJu+Z/O0wM9Oy1aYU/ygzZ5tlP8tBJ9sonOICPqVjuOxT4yNyneVKdJ2iqUKq5LsFnPo3zYUemeoWrfZ+i+nwsBSjjHnm56W5v6rs5pwd2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794328; c=relaxed/simple;
	bh=nVtjFLsYqac80kauKYUyPSrHZSE3qmCX34aBfTJr+Wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DtGg0hzvEqbkEsXkNdQ6/zbs+lkxSIxZHvx0NPUimEZ6zgtl2eosI3GS4VtW90LozWAuD8A16XsEz4ii/PH2qd6BSE14zm44+XRsIdnQXGwxbcUbRTXSnzFXCh/pesHOpnPpsQNvihO5NLjFLGEQXZ+d5nUuYRj7B6UgGW+jE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W2tQr+wx; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OJj9it1945029;
	Tue, 24 Jun 2025 14:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750794309;
	bh=O+dohNIF9NWYZKLUHqPZXLCGqouvSJpVjlA8CWcfu0I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=W2tQr+wx5PTcaG5BxlKKAxKKtl6NI2oS2TF6AAdW/18IzGK+t4JA8cv370TzgBuim
	 XoJozmBBHbHyTpPiDuxHTz60A3g2Vg5uuEsBQHX4brwB2ScdfEblQajnudI01ZWKQs
	 3HCHMowet8UtRtTOyrnbVktdBUbiS6GtAptna/B4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OJj9Bc562424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 14:45:09 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 14:45:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 14:45:09 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OJj92b2326408;
	Tue, 24 Jun 2025 14:45:09 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <t-kristo@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
Date: Tue, 24 Jun 2025 14:45:08 -0500
Message-ID: <20250624194509.1314095-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624194509.1314095-1-jm@ti.com>
References: <20250624194509.1314095-1-jm@ti.com>
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
---
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index 62ddc284a524..f57d5c2b8024 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     enum:
       - ti,j7-rti-wdt
+      - ti,am62l-rti-wdt
 
   reg:
     maxItems: 1
-- 
2.49.0


