Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78E721D712
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jul 2020 15:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgGMN0O (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jul 2020 09:26:14 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55130 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729613AbgGMN0N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jul 2020 09:26:13 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DDIWtv090683;
        Mon, 13 Jul 2020 08:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594646312;
        bh=wQ0AjsWp9AHSyNL3eQMx/G1gq1SORFAJ4yWvonHRb60=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=p9556DgmA5at/waqCveAf70Ob6C7a91cGe4W6NKkiCiXGbX3fmFkmnHv4t5n882Wl
         ji53gF6bJqxeUmSG1n4XNb2NcK9KHGlCr6TXWhfVhMuuYWCpOhDX2Dkffx5tq5XGx7
         9qZb7n1+pxFcYAGtVezOfgJQ3XMmiqRC2+yUlCak=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DDIWbP042059
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 08:18:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 08:18:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 08:18:31 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DDIOXr015417;
        Mon, 13 Jul 2020 08:18:30 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv3 3/4] watchdog: rti-wdt: attach to running watchdog during probe
Date:   Mon, 13 Jul 2020 16:18:17 +0300
Message-ID: <20200713131818.825-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713131818.825-1-t-kristo@ti.com>
References: <20200713131818.825-1-t-kristo@ti.com>
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
 drivers/watchdog/rti_wdt.c | 111 +++++++++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index d456dd72d99a..45dfc546e371 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -35,7 +35,11 @@
 
 #define RTIWWDRX_NMI	0xa
 
-#define RTIWWDSIZE_50P	0x50
+#define RTIWWDSIZE_50P		0x50
+#define RTIWWDSIZE_25P		0x500
+#define RTIWWDSIZE_12P5		0x5000
+#define RTIWWDSIZE_6P25		0x50000
+#define RTIWWDSIZE_3P125	0x500000
 
 #define WDENABLE_KEY	0xa98559da
 
@@ -48,7 +52,7 @@
 
 #define DWDST			BIT(1)
 
-static int heartbeat;
+static int heartbeat = DEFAULT_HEARTBEAT;
 
 /*
  * struct to hold data for each WDT device
@@ -79,11 +83,9 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 * be petted during the open window; not too early or not too late.
 	 * The HW configuration options only allow for the open window size
 	 * to be 50% or less than that; we obviouly want to configure the open
-	 * window as large as possible so we select the 50% option. To avoid
-	 * any glitches, we accommodate 5% safety margin also, so we setup
-	 * the min_hw_hearbeat at 55% of the timeout period.
+	 * window as large as possible so we select the 50% option.
 	 */
-	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
+	wdd->min_hw_heartbeat_ms = 500 * wdd->timeout;
 
 	/* Generate NMI when wdt expires */
 	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
@@ -110,7 +112,48 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
 	return 0;
 }
 
-static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
+static int rti_wdt_setup_hw_hb(struct watchdog_device *wdd, u32 wsize)
+{
+	/*
+	 * RTI only supports a windowed mode, where the watchdog can only
+	 * be petted during the open window; not too early or not too late.
+	 * The HW configuration options only allow for the open window size
+	 * to be 50% or less than that.
+	 */
+	switch (wsize) {
+	case RTIWWDSIZE_50P:
+		/* 50% open window => 50% min heartbeat */
+		wdd->min_hw_heartbeat_ms = 500 * heartbeat;
+		break;
+
+	case RTIWWDSIZE_25P:
+		/* 25% open window => 75% min heartbeat */
+		wdd->min_hw_heartbeat_ms = 750 * heartbeat;
+		break;
+
+	case RTIWWDSIZE_12P5:
+		/* 12.5% open window => 87.5% min heartbeat */
+		wdd->min_hw_heartbeat_ms = 875 * heartbeat;
+		break;
+
+	case RTIWWDSIZE_6P25:
+		/* 6.5% open window => 93.5% min heartbeat */
+		wdd->min_hw_heartbeat_ms = 935 * heartbeat;
+		break;
+
+	case RTIWWDSIZE_3P125:
+		/* 3.125% open window => 96.9% min heartbeat */
+		wdd->min_hw_heartbeat_ms = 969 * heartbeat;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static unsigned int rti_wdt_get_timeleft_ms(struct watchdog_device *wdd)
 {
 	u64 timer_counter;
 	u32 val;
@@ -123,11 +166,18 @@ static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
 
 	timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
 
+	timer_counter *= 1000;
+
 	do_div(timer_counter, wdt->freq);
 
 	return timer_counter;
 }
 
+static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	return rti_wdt_get_timeleft_ms(wdd) / 1000;
+}
+
 static const struct watchdog_info rti_wdt_info = {
 	.options = WDIOF_KEEPALIVEPING,
 	.identity = "K3 RTI Watchdog",
@@ -148,6 +198,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	struct watchdog_device *wdd;
 	struct rti_wdt_device *wdt;
 	struct clk *clk;
+	u32 last_ping = 0;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -169,6 +220,14 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/*
+	 * If watchdog is running at 32k clock, it is not accurate.
+	 * Adjust frequency down in this case so that we don't pet
+	 * the watchdog too often.
+	 */
+	if (wdt->freq < 32768)
+		wdt->freq = wdt->freq * 9 / 10;
+
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
 	if (ret) {
@@ -185,11 +244,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
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
@@ -201,12 +257,47 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		goto err_iomap;
 	}
 
+	if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
+		u32 time_left_ms;
+		u64 heartbeat_ms;
+		u32 wsize;
+
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		time_left_ms = rti_wdt_get_timeleft_ms(wdd);
+		heartbeat_ms = readl(wdt->base + RTIDWDPRLD);
+		heartbeat_ms <<= WDT_PRELOAD_SHIFT;
+		heartbeat_ms *= 1000;
+		heartbeat_ms /= wdt->freq;
+		if (heartbeat_ms / 1000 != heartbeat)
+			dev_warn(dev, "watchdog already running, ignoring heartbeat config!\n");
+
+		heartbeat = heartbeat_ms / 1000;
+
+		wsize = readl(wdt->base + RTIWWDSIZECTRL);
+		ret = rti_wdt_setup_hw_hb(wdd, wsize);
+		if (ret) {
+			dev_err(dev, "bad window size.\n");
+			goto err_iomap;
+		}
+
+		last_ping = heartbeat_ms - time_left_ms;
+		if (time_left_ms > heartbeat_ms) {
+			dev_warn(dev, "time_left > heartbeat? Assuming last ping just before now.\n");
+			last_ping = 0;
+		}
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
