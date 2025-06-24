Return-Path: <linux-watchdog+bounces-3712-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC4AE709B
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 22:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A10D317E2C9
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 20:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D6F2E92AB;
	Tue, 24 Jun 2025 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pb4p6ZKi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D112571C9;
	Tue, 24 Jun 2025 20:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796784; cv=none; b=YXm4whLM0Big3Hn2wTJ2Jrbn2Hk1QThWJJP04EPCAki8cNPLiDgxvJh9jiFGKaKc5qS4ayNHU1WgAC1dE+mr9MBxWPIjnC1+wmsbx6LlNmlmt29kcE76QvyFkqb/SYye1SuqLeimSeHdhd3aYfRoysKLIAOntUvUMS8qyG2A3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796784; c=relaxed/simple;
	bh=BVL18EjPmF59/3eRRLTskKUD7DQk8icHYZcc/+Mp8q8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eJwSvaqzD39Uvw+/x+a7E858wjTbv8Pzca4nQp1VHXESHXPefK2PIsHz/+svbYAOdMCouCOGFj+1ojK2V0JRKzcyOFbM6VaLffxqgAzHD5gJRfE7TjmVw3urO7T9E0Sm5GNjlHnvp2z9KJsB5ZrP1+3NfBtJnl4a+Qk8YNsOeqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pb4p6ZKi; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OKQ6jF1650732;
	Tue, 24 Jun 2025 15:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750796766;
	bh=f7UGEFbYf1v1lahWwNPxHFz0KNcdzK0ZoJnWITJId1k=;
	h=From:To:CC:Subject:Date;
	b=Pb4p6ZKiQhHmNHV2CWgHrFU6J4f3mqdo3cME7BpV5UxY6iRp12qlIKcf87LJAWRiv
	 OZoPkuWhaTf8hXhXmMQBahA7XLfdh02fKT8OvSOz4t6OL7995sF1SNyCKWbzYH2W+Y
	 +6UBOO/Mo6c/p8qF+cj2BZzh7NJAa8JVF/Ky8K+M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OKQ6tZ1865424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 15:26:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 15:26:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 15:26:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OKQ5VV2374186;
	Tue, 24 Jun 2025 15:26:05 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 0/2] Add reaction control in rti
Date: Tue, 24 Jun 2025 15:26:03 -0500
Message-ID: <20250624202605.1333645-1-jm@ti.com>
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

Changes since v1:
- Resend v1 due to wrong email adress

v1: https://lore.kernel.org/linux-devicetree/14f89780-87b4-4ade-98db-08e2a1a123c7@ti.com

[0] https://www.ti.com/product/AM62L
[1] https://www.ti.com/tool/TMDS62LEVM

Judith Mendez (2):
  dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
  watchdog: rti_wdt: Add reaction control

 .../bindings/watchdog/ti,rti-wdt.yaml         |  1 +
 drivers/watchdog/rti_wdt.c                    | 31 ++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.49.0


