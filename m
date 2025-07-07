Return-Path: <linux-watchdog+bounces-3824-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A14AFBA44
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993CF42374F
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 18:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82191D9A54;
	Mon,  7 Jul 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M8NwVFoD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B463170826;
	Mon,  7 Jul 2025 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751911225; cv=none; b=E3h/Trgp8zTatZlCz0xmeWcRtIyeEDvqrXPjVaZpzHcoDzUkYPTNpGmdQG1bHHw0pdLTKQyUbQDUQEeCNof6ZSzdXK0Zq8NpKTNJXvkAFnmOjlYIgtXJGJPNwvFWBfcThFqt0jQwmeet06PXH4lCdxux4OlnnwQG2HN/UE+j3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751911225; c=relaxed/simple;
	bh=hGtJ1R7HLtE8p08O+9gD/uPYwFRTpks+W/+pvkhHCkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VeyleAh4H4yuned6G9GUF4yXdwjAkGeJHYcGYoory9E/s6KgXiruc1WUFWx27rR1ZW8R6gevgjk1oSjipSkMLQndt5g99ryrYzxJUYyuVg9ItIlZDJykYh/epWVd4qlovcn7Fde4eB45ld0o7iJIUgdZWXhkbl8AUuSQetDYn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M8NwVFoD; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567I04VD284455;
	Mon, 7 Jul 2025 13:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751911204;
	bh=k+/xOJl1eIR6B1liVsGidKI00SXYIx6BSAs3amVSspo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M8NwVFoDUoviGytEp/2NAyruyiX18W6murp6TUDLw5cCM3uGrOis+L87KcihRY5Qr
	 xyoCYPPL+ir+Zw1MMaML/0xLCJVT9Pui7Dsl71V7O0I2gnz4bFrRdCB1ip6lCwVfIB
	 rPLBA1QRkTsVSJzQcaEGis41G9Y0NrbSJ4mXDDMM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567I03qS664693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 13:00:04 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 13:00:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 13:00:02 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567I02QN345700;
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
Subject: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
Date: Mon, 7 Jul 2025 13:00:02 -0500
Message-ID: <20250707180002.3918865-3-jm@ti.com>
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
index d1f9ce4100a8..c9ee443c70af 100644
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
@@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 */
 	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
 
-	/* Generate NMI when wdt expires */
-	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+	/* Reset device if wdt serviced outside of window or generate NMI if available */
+	if (wdt->data->reset)
+		reaction = RTIWWDRXN_RST;
+	else
+		reaction = RTIWWDRXN_NMI;
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


