Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5C0207277
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jun 2020 13:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389315AbgFXLrh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jun 2020 07:47:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42410 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388491AbgFXLrh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jun 2020 07:47:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjqYb027297;
        Wed, 24 Jun 2020 06:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592999152;
        bh=6X9zZUsoFQTdU0DIGFIuVsDvl3k1u78biIHYBoola70=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IRwG4JIzY464dSINOVUTDq2mdgfxdkE4PwrWioubCV4tnlJexcL6eNMPqR1xX41Pm
         cUl2QXkTnqrylpa8f5IvLG2PwQGo1THbA/hk6dm5a44vndGFTrA8XFEzDzYiCvjOZv
         L11csoT38o/KQ62gTYyecv/MKpcii4aoS0yRicSQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjpl1076329;
        Wed, 24 Jun 2020 06:45:52 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 06:45:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 06:45:51 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjkCN118804;
        Wed, 24 Jun 2020 06:45:50 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match initial allowed window
Date:   Wed, 24 Jun 2020 14:45:34 +0300
Message-ID: <20200624114534.1362-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624114534.1362-1-t-kristo@ti.com>
References: <20200624114534.1362-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the RTI watchdog has been started by someone (like bootloader) when
the driver probes, we must adjust the initial ping timeout to match the
currently running watchdog window to avoid generating watchdog reset.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index d456dd72d99a..02ea2b2435f5 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -55,11 +55,13 @@ static int heartbeat;
  * @base - base io address of WD device
  * @freq - source clock frequency of WDT
  * @wdd  - hold watchdog device as is in WDT core
+ * @min_hw_heartbeat_save - save of the min hw heartbeat value
  */
 struct rti_wdt_device {
 	void __iomem		*base;
 	unsigned long		freq;
 	struct watchdog_device	wdd;
+	unsigned int		min_hw_heartbeat_save;
 };
 
 static int rti_wdt_start(struct watchdog_device *wdd)
@@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
 	/* put watchdog in active state */
 	writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
 
+	if (wdt->min_hw_heartbeat_save) {
+		wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
+		wdt->min_hw_heartbeat_save = 0;
+	}
+
 	return 0;
 }
 
@@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		goto err_iomap;
 	}
 
+	if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
+		u32 time_left;
+		u32 heartbeat;
+
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		time_left = rti_wdt_get_timeleft(wdd);
+		heartbeat = readl(wdt->base + RTIDWDPRLD);
+		heartbeat <<= WDT_PRELOAD_SHIFT;
+		heartbeat /= wdt->freq;
+		if (time_left < heartbeat / 2)
+			wdd->min_hw_heartbeat_ms = 0;
+		else
+			wdd->min_hw_heartbeat_ms =
+				(time_left - heartbeat / 2 + 1) * 1000;
+
+		wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
+	}
+
 	ret = watchdog_register_device(wdd);
 	if (ret) {
 		dev_err(dev, "cannot register watchdog device\n");
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
