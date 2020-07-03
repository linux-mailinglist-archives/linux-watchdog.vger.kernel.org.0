Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3A32139B9
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jul 2020 14:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGCMGF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jul 2020 08:06:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42098 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgGCMGE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063C4O3s001021;
        Fri, 3 Jul 2020 07:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593777864;
        bh=VggTboeXSUmk45kulNtqvR4NEUHjkR5OBNU73J+87dM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QfMjefPb1cyKZPpn+KxwkKBvejB/DmWP/9j+Huq0rnDYP55f2MA8q1uRqH3M8LNF1
         59k+6laUz3o6W76ogQoUtxsOR9tBojgTgaxdW1ewOAu9dnrfhBJi9ywzT4fP1X+V1+
         Lf4qxSdcqaTFa+oWikVN4MM7kpSMnzTFp+6d92YI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063C4OLN065867;
        Fri, 3 Jul 2020 07:04:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 07:04:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 07:04:24 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063C4Fki109800;
        Fri, 3 Jul 2020 07:04:22 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv2 4/5] watchdog: rti-wdt: attach to running watchdog during probe
Date:   Fri, 3 Jul 2020 15:04:05 +0300
Message-ID: <20200703120406.7092-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703120406.7092-1-t-kristo@ti.com>
References: <20200703120406.7092-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the RTI watchdog is running already during probe, the driver must
configure itself to match the HW. Window size and timeout is probed from
hardware, and the last keepalive ping is adjusted to match it also.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/watchdog/rti_wdt.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 110bfc8d0bb3..987e5a798cb4 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -213,6 +213,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	struct watchdog_device *wdd;
 	struct rti_wdt_device *wdt;
 	struct clk *clk;
+	u32 last_ping = 0;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -258,11 +259,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	wdd->min_timeout = 1;
 	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
 		wdt->freq * 1000;
-	wdd->timeout = DEFAULT_HEARTBEAT;
 	wdd->parent = dev;
 
-	watchdog_init_timeout(wdd, heartbeat, dev);
-
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, 1);
 	watchdog_set_restart_priority(wdd, 128);
@@ -274,12 +272,34 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		goto err_iomap;
 	}
 
+	if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
+		u32 time_left;
+
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		time_left = rti_wdt_get_timeleft(wdd);
+		heartbeat = readl(wdt->base + RTIDWDPRLD);
+		heartbeat <<= WDT_PRELOAD_SHIFT;
+		heartbeat /= wdt->freq;
+
+		wsize = readl(wdt->base + RTIWWDSIZECTRL);
+		ret = rti_wdt_setup_hw_hb(wdd);
+		if (ret)
+			goto err_iomap;
+
+		last_ping = -(time_left - heartbeat) * 1000;
+	}
+
+	watchdog_init_timeout(wdd, heartbeat, dev);
+
 	ret = watchdog_register_device(wdd);
 	if (ret) {
 		dev_err(dev, "cannot register watchdog device\n");
 		goto err_iomap;
 	}
 
+	if (last_ping)
+		watchdog_set_last_hw_keepalive(wdd, last_ping);
+
 	return 0;
 
 err_iomap:
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
