Return-Path: <linux-watchdog+bounces-3826-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2567AFBA49
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EAE81AA695B
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 18:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BAF2641F9;
	Mon,  7 Jul 2025 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="njgJvhn+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BFA1ACECE;
	Mon,  7 Jul 2025 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751911226; cv=none; b=qcedhUo7x56wy9c5GzkANF2HpxbN4JfMsBkxhZcFC5s5DOYfgaXxEazvxACK034epLMMYPLG2zphn8T6RZCUsEck0+s/vDR3KC12RLzcrj5kYUZ3v1I4/Kxjtu09Z+eg0yDdoXEldLDVeUeTf6iqWWnVMea/7AYfHTAbd8HXAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751911226; c=relaxed/simple;
	bh=r6NZBrffWzNw7dte2+xmTPvu0PfUvX4a7JkEhaiWhLk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VdlgSPQUB19+EqbCPFP7vaWECq5R/DZ7vYv3mLBzj5AZWRQUwLhHy3hzihjd06GUlRADRDkrVYut4dB0U4BVuYRE2WsMzkNxCsKxSdMoYIvj7nibi6Gok+O36IUpsHxq9U23Ca4PeWbnpvBFImOdRpuOxG80ECYsyhS/AI03pcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=njgJvhn+; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567I041n929153;
	Mon, 7 Jul 2025 13:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751911204;
	bh=jO9NDpDqasebT3fzKzOHXV7PwCeXf/Izih3UInLmNzQ=;
	h=From:To:CC:Subject:Date;
	b=njgJvhn+e72Egv+TaF+cymQrjgNP0QztjvQkfnySlLWww39bWZnDMJ4DFsoaMdgVr
	 V/EM5EiMA0FECIOIEaOqEXjctxHyEROy8ixWscDbM/3Tn6iTRBLFQw8OX8VufL9CAq
	 KKV4l139PMgW6DapELUKyT/IatIIAks1tWUsCCx4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567I04Eq1620340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 13:00:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 13:00:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 13:00:02 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567I02QL345700;
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
Subject: [PATCH v3 0/2] Add reaction control in rti
Date: Mon, 7 Jul 2025 13:00:00 -0500
Message-ID: <20250707180002.3918865-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This allows for reaction control in rti driver. Since AM62L SoC [0]
does not have WWD reset output routed to a ESM module like all other
K3 SoC's and has a reset signal routed to the reset HW block, add a new
compatible for AM62L and configure reset reaction for AM62L SoC instead
of NMI.

This patch has been tested on AM62L EVM [1].

Changes since v2:
- Pick Krzysztof's tag
- Take Andrew's sugestions from v2 for patch 2/2
 -> switch to device_get_match_data
 -> fix comment and assignment of reaction variable logic in rti_wdt_start

v2: https://lore.kernel.org/linux-devicetree/20250625143338.2381726-1-jm@ti.com/
v1-resend: https://lore.kernel.org/linux-devicetree/20250624202605.1333645-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250624194509.1314095-1-jm@ti.com/

[0] https://www.ti.com/product/AM62L
[1] https://www.ti.com/tool/TMDS62LEVM

Judith Mendez (2):
  dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
  watchdog: rti_wdt: Add reaction control

 .../bindings/watchdog/ti,rti-wdt.yaml         |  1 +
 drivers/watchdog/rti_wdt.c                    | 32 ++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.49.0


