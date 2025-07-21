Return-Path: <linux-watchdog+bounces-3892-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A210B0CE7C
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 01:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60A33542C01
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jul 2025 23:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0261324DD12;
	Mon, 21 Jul 2025 23:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lfU0ndhF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8742459D5;
	Mon, 21 Jul 2025 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753142247; cv=none; b=rEc1/gzJnvRs79PZ7rVMw8nunYPYcsD0Fnl4lShlK/t65Gr4lUnsIHrVwBxu7GEwsO/1K5Z2fXvdQOXqN7Ip+k9prIQoL4piTzSZgF5wZnCIThdMP6x0jvY/loccGmJjYeI9dy/XZYXyzZflSBSUl8sCJZZw3tnN8dX6P6BnhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753142247; c=relaxed/simple;
	bh=M1DHbBI2A5Kehjwx3oY+PQa2erfWj1DUefOOJmzXC0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfT1za44b3WjnB6cU5LTHqUcIdOGoyCybjevu+dpj4PyhLhUh10cEeqP8SVEZAdhyXKVHDevfdzOstE16XEtpflOtQAr765sxQwKlvZV+j6nhLcOCttgfGXbqfKEYdOT6dCQMgSUx6DZlyEALL8XVsjRNyc+GyzRYH0kSDcm6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lfU0ndhF; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LNv6fu1379795;
	Mon, 21 Jul 2025 18:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753142226;
	bh=+PIFVG00aZCIkbW543S4nBS5+BFO6ngSanFzNooT3aI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lfU0ndhFbpJwQR6ISAB6kMcL+aVS5s9SKvtW9HnYNy0xvV4N8Rb5H1TjcgiEOxlbL
	 wf+ujp6EiuRkO3Vosavf3Wqyu3aI3ZJk2gJoPM66J0Nazu8GFUS/NQif43F27Si6Vs
	 e8vRLp1Xh+pFWg1AP7KCmYSochEs/d0ocFqtsMTY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LNv66v3668802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 18:57:06 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 18:57:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 18:57:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LNv5e2422426;
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
Subject: [PATCH v4 2/2] watchdog: rti_wdt: Add reaction control
Date: Mon, 21 Jul 2025 18:57:05 -0500
Message-ID: <20250721235705.1160972-3-jm@ti.com>
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

This allows to configure reaction between NMI and reset for WWD.

On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
to the ESM module which can subsequently route the signal to safety
master or SoC reset. On AM62L, the watchdog reset output is routed
to the SoC HW reset block. So, add a new compatible for AM62l to add
SoC data and configure reaction to reset instead of NMI.

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index d1f9ce4100a8..0c01e7e46100 100644
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
+	bool nmi;
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
@@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 */
 	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
 
-	/* Generate NMI when wdt expires */
-	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+	/* Reset device if wdt serviced outside of window or generate NMI if available */
+	if (wdt->data->nmi)
+		reaction = RTIWWDRXN_NMI;
+	else
+		reaction = RTIWWDRXN_RST;
+
+	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
 
 	/* Open window size 50%; this is the largest window size available */
 	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
@@ -255,6 +268,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	wdd->timeout = DEFAULT_HEARTBEAT;
 	wdd->parent = dev;
 
+	wdt->data = device_get_match_data(dev);
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, 1);
 	watchdog_set_restart_priority(wdd, 128);
@@ -369,8 +384,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static struct rti_wdt_data j7_wdt = {
+	.nmi = true,
+};
+
+static struct rti_wdt_data am62l_wdt = {
+	.nmi = false,
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


