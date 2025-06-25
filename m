Return-Path: <linux-watchdog+bounces-3722-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FCCAE8697
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8111894D68
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADF22698BF;
	Wed, 25 Jun 2025 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fLVjoexH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F605267F53;
	Wed, 25 Jun 2025 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862038; cv=none; b=TfjGhuB9OugKn3BFzBMF225o07zrXaPdmGXFmWRR1H9+Yt1AGbd5c2LTAx2NEz0bj2d6BbjU0kwnXh1QbZZJYJrUG8X6wuFFvH72YGHw2sl3XN39zR+Tsja85QEmrxrt7lZxYME9J6Bw0s15CTM7Wdda8hQeSY/UxC+S79+qGoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862038; c=relaxed/simple;
	bh=mryvQn1AUsDhNxTd87dfmhlmM2rUxFC9bnecWyDM2O4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CF/jjkuY+SEAiaYFNDqmWYazhPWTW927aE/GBUWUaXJ9tMN/8hKAgMoikRDew6gFvEeX0QyzP55xaDNaKyixLChI3SZ4KEN93pg0VFzfh5NQBp6Dsxc1YGRY2jAkVKAAEbrU0iPdXFW7Hz0YNaxnnPU/O6vs0I96ftKBIbopPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fLVjoexH; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PEXd2K2139733;
	Wed, 25 Jun 2025 09:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750862019;
	bh=w6DGEV6ofEq9PT3PQmAnbPJaKGlqyXr0Gq+CyGdb9jw=;
	h=From:To:CC:Subject:Date;
	b=fLVjoexHvr92IuFTiSu2u8Uy1m4/X0UGAHSbkQVDhSZM+OBIgFZ7fATgIx570bgY1
	 T14OsyIhxh8gcC5jnc78rDMK5q8V2K0M7tEY6qopZKjktYEEjSP5/2HmNLfhMTwClx
	 mdllT5w6G18MwT6o3F+ImavL536eCnVnogb3HsU4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PEXdpf2749208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 09:33:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 09:33:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 09:33:39 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PEXco13804070;
	Wed, 25 Jun 2025 09:33:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add reaction control in rti
Date: Wed, 25 Jun 2025 09:33:36 -0500
Message-ID: <20250625143338.2381726-1-jm@ti.com>
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

Changes since v1-resend:
- Binding: order compatible alphabetically

v1-resend: https://lore.kernel.org/linux-devicetree/20250624202605.1333645-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250624194509.1314095-1-jm@ti.com/

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


