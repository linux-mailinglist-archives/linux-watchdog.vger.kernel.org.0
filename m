Return-Path: <linux-watchdog+bounces-3709-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A2AE7010
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 21:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1131A17C210
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 19:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBEE2EF9CB;
	Tue, 24 Jun 2025 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="adsYaD+H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC92ECD14;
	Tue, 24 Jun 2025 19:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794329; cv=none; b=LeoVdg7vLUC7c2eBTVlCIO6hXMxwuYbf1VzoakzBSnK4V/rhBMqMPXJhoJzQbAHPHQpAVbp2FpOpXBWAfPIcS4ct9k3CixmtYei0sq7fFuE+F9+HaZenfdU4NltS0+0ZBnmw3+1qkg0SI8Hn0R5TJSa4ynI3HbArVmZcWpy90AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794329; c=relaxed/simple;
	bh=ZqjDB2Afh1JOEWZ27VXE6hu4Cb49XT7xWl99zNUIbMI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aFqCzTQRcmeMpxfjjHDOtfS8srQTt1O3jISh0GMa6IoHS81XJzPBp15XTu/Rc0K6I3XXOcUevzuQ+yIvivvkEyiH5UgTx4j91jJ2N1RQHmW7eWIFmDhWyAccaduhHGKSeltHIcMcxvQVea9sMylBxFwNG2tIGjFsyKApvk69h/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=adsYaD+H; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OJj9dD1903653;
	Tue, 24 Jun 2025 14:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750794309;
	bh=DiIFhqT5jW8AL/wFzN9Rpyuf9ZhlNrg18hXKR9LbMhg=;
	h=From:To:CC:Subject:Date;
	b=adsYaD+HSv/RKyG89ljvD7giZYLAGExFwWPbENMLWI34k2CY9Owd4JUp7Li+jfj9d
	 C+q1TR00/PKNBfKpEidlpXoYu7hCNKmE1OQFfXtTApME40WY2eqRwFvyJ55Aex7OOR
	 qoMHKmBJ5/T6S9B3y4/lKPHi4fyRRq8ZmKAO3TVw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OJj9j8562423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 14:45:09 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 14:45:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 14:45:09 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OJj92a2326408;
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
Subject: [PATCH 0/2] Add reaction control in rti
Date: Tue, 24 Jun 2025 14:45:07 -0500
Message-ID: <20250624194509.1314095-1-jm@ti.com>
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

[0] https://www.ti.com/product/AM62L
[1] https://www.ti.com/tool/TMDS62LEVM

Judith Mendez (2):
  dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
  watchdog: rti_wdt: Add reaction control to rti

 .../bindings/watchdog/ti,rti-wdt.yaml         |  1 +
 drivers/watchdog/rti_wdt.c                    | 31 ++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.49.0


