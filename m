Return-Path: <linux-watchdog+bounces-3891-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63480B0CE79
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 01:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290EC3BDD3C
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jul 2025 23:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D3A248F6F;
	Mon, 21 Jul 2025 23:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RtTTu9l4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD4219A6B;
	Mon, 21 Jul 2025 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753142246; cv=none; b=qtpNM55Y/sxeKNcTaFAtLHweVio2ndHV13s+ozrRvvHlcx8J6EDtIGh3/ducg5LlUCBMtblnf1nHFD1SCcBIM0qRVbsvQA7xsOZPWAR6sMShcpZgohH35d4jVlXRlSIXT8dCJAC9TxLOnq52vCrrTHI3NH77jP3a5qdvqgzx50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753142246; c=relaxed/simple;
	bh=arbzkV2E0no0mFDIvbnkNLTIFGMu4xFEU0aY3gLFC60=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qr69b1QnSD1R4ZMCzjpXTdsM2dH5fNmnoReHbqHU7VmSjSeX5v5SOS3uooDZpcc3cML2owmPUAQFRS0f+tlz6Pnt99j5fhoEto94iXXklnRgu0PbbscKtlSc2B+e3W+WFh9OCD1AAgw54NLqDMgELim5+qMySJZog5C0MphCsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RtTTu9l4; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LNv5T21379791;
	Mon, 21 Jul 2025 18:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753142226;
	bh=Ha51BmO3BFnOaMX9XHX6JPjZdZK9xhxWuq3w4PS1ik4=;
	h=From:To:CC:Subject:Date;
	b=RtTTu9l4Q5V2aaMBc4Irz8hKLy3JJYC1fCj/NopcUn5sCM8yUN5vtV2nvnGGcWt+3
	 aZ40uyFQZGP79ct4vLmcmRca003pRefLw0B+y2V2oO10ag5redLRmEHD1G4AxOj38h
	 PhHWz7mwy42d2LJaMk4uvtOeyY3Y71Uhl/c51I4U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LNv57D623743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 18:57:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 18:57:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 18:57:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LNv5e0422426;
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
Subject: [PATCH v4 0/2] Add reaction control in rti
Date: Mon, 21 Jul 2025 18:57:03 -0500
Message-ID: <20250721235705.1160972-1-jm@ti.com>
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
K3 SoC's and has the reset output signal routed to the reset HW block,
add a new compatible for AM62L and configure reset reaction for AM62L
SoC instead of NMI.

This patch has been tested on AM62L EVM [1].

Changes since v3:
- Expected default reaction for watchdog is HW reset line, so check for NMI
  and set reaction to NMI if exists, else default to HW reset.

v3: https://lore.kernel.org/linux-devicetree/20250707180002.3918865-1-jm@ti.com/
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


