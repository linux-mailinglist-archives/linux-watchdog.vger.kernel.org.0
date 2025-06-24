Return-Path: <linux-watchdog+bounces-3714-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 982CDAE70A5
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 22:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3DB03A68F3
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 20:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCF32EB5BA;
	Tue, 24 Jun 2025 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zi2H6T5z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A929AAF0;
	Tue, 24 Jun 2025 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796785; cv=none; b=Pf/zEIyv5GcMt1lZ3TQaM2gNYdTZx1EPwFzVNNUMDPwivnm6DEG4B07gEnBgZjXE1NVDDET6wDgUeIQCVKHQer6HBd3mZD+9UNcgFpIB3SNyxbTHCPVabWlOA9DruIdfgzmRZlb0cWkY1YBhJPYarXBQ8bXaRTvEoalQC5a2IPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796785; c=relaxed/simple;
	bh=8qvwSHO1+kU/s+0/nwif8OvvuO8uIInW/6Ce8eRN7RY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUmIKyWgKE8N7N2iiYWYFuxGA5Ty2FkvF+NbS44zTCXDwz9NWlLZ7sJHrmQQNrpv0uOn2v1mpDCJx3mAep9gBujrUcIVcZ3pkxtGMIlOzYnSdRJAKUbwYKnhXDPdzW1LKn9600e7MnbuS5s7fAmBF6PdY/OuGBnz4h0OvC0+tZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Zi2H6T5z; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OKQ6MP1955253;
	Tue, 24 Jun 2025 15:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750796766;
	bh=m4TjCvZ5Jf7Xqqe6R0pi6faNrYPWbmCQi4gwoWZ2ILQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zi2H6T5zdEo6iF+U1R3Sqp5A61gG/EGcLHULAJpH61ZlgAtb04iRpK8VjdS6b/o76
	 SlTOb4UzcTlSZYNlrN2k+5pI7BdBgw6EZTjBKWxojuEtyxVKZWjjbO100e/N+iudK0
	 y9qo35bYBbzGr4BbZ1LUOZJ+TKHGB7IQQ9VmKXf0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OKQ6gk2021547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 15:26:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 15:26:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 15:26:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OKQ5VX2374186;
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
Subject: [PATCH RESEND 2/2] watchdog: rti_wdt: Add reaction control
Date: Tue, 24 Jun 2025 15:26:05 -0500
Message-ID: <20250624202605.1333645-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624202605.1333645-1-jm@ti.com>
References: <20250624202605.1333645-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This allows to configure reaction between NMI and reset for WWD.

On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
to the ESM module which can subsequently route the signal to safety
master or SoC reset. On AM62L, the watchdog reset output is routed
to the SoC HW reset block. So, add a new compatible for AM62l to add
SoC data and configure reaction to reset instead of NMI.

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/watchdog/rti_wdt.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index d1f9ce4100a8..d419884c86c4 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -35,7 +35,8 @@
 #define RTIWWDRXCTRL	0xa4
 #define RTIWWDSIZECTRL	0xa8
 
-#define RTIWWDRX_NMI	0xa
+#define RTIWWDRXN_RST	0x5
+#define RTIWWDRXN_NMI	0xa
 
 #define RTIWWDSIZE_50P		0x50
 #define RTIWWDSIZE_25P		0x500
@@ -63,22 +64,29 @@
 
 static int heartbeat;
 
+struct rti_wdt_data {
+	bool reset;
+};
+
 /*
  * struct to hold data for each WDT device
  * @base - base io address of WD device
  * @freq - source clock frequency of WDT
  * @wdd  - hold watchdog device as is in WDT core
+ * @data - hold configuration data
  */
 struct rti_wdt_device {
 	void __iomem		*base;
 	unsigned long		freq;
 	struct watchdog_device	wdd;
+	const struct rti_wdt_data *data;
 };
 
 static int rti_wdt_start(struct watchdog_device *wdd)
 {
 	u32 timer_margin;
 	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+	u8 reaction;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(wdd->parent);
@@ -101,8 +109,12 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 */
 	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
 
-	/* Generate NMI when wdt expires */
-	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+	/* Generate reset or NMI when timer expires/serviced outside of window */
+	reaction = RTIWWDRXN_NMI;
+	if (wdt->data->reset)
+		reaction = RTIWWDRXN_RST;
+
+	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
 
 	/* Open window size 50%; this is the largest window size available */
 	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
@@ -255,6 +267,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	wdd->timeout = DEFAULT_HEARTBEAT;
 	wdd->parent = dev;
 
+	wdt->data = of_device_get_match_data(dev);
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, 1);
 	watchdog_set_restart_priority(wdd, 128);
@@ -369,8 +383,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static struct rti_wdt_data j7_wdt = {
+	.reset = false,
+};
+
+static struct rti_wdt_data am62l_wdt = {
+	.reset = true,
+};
+
 static const struct of_device_id rti_wdt_of_match[] = {
-	{ .compatible = "ti,j7-rti-wdt", },
+	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
+	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
-- 
2.49.0


