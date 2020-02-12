Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C0C15A755
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Feb 2020 12:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgBLLFp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Feb 2020 06:05:45 -0500
Received: from mga11.intel.com ([192.55.52.93]:58048 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgBLLFp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Feb 2020 06:05:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Feb 2020 03:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="237680103"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 12 Feb 2020 03:05:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 350BD1F6; Wed, 12 Feb 2020 13:05:41 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, Tom Abraham <tabraham@suse.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] ACPI / watchdog: Set default timeout in probe
Date:   Wed, 12 Feb 2020 14:05:40 +0300
Message-Id: <20200212110540.83559-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200212110540.83559-1-mika.westerberg@linux.intel.com>
References: <20200211180331.11dbe525@endymion>
 <20200212110540.83559-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the BIOS default timeout for the watchdog is too small userspace may
not have enough time to configure new timeout after opening the device
before the system is already reset. For this reason program default
timeout of 30 seconds in the driver probe and allow userspace to change
this from command line or through module parameter (wdat_wdt.timeout).

Reported-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/watchdog/wdat_wdt.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 2132018f031d..7b0257163522 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -54,6 +54,13 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+#define WDAT_DEFAULT_TIMEOUT	30
+
+static int timeout = WDAT_DEFAULT_TIMEOUT;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
+		 __MODULE_STRING(WDAT_DEFAULT_TIMEOUT) ")");
+
 static int wdat_wdt_read(struct wdat_wdt *wdat,
 	 const struct wdat_instruction *instr, u32 *value)
 {
@@ -308,6 +315,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct acpi_wdat_entry *entries;
 	const struct acpi_table_wdat *tbl;
+	int default_timeout = timeout;
 	struct wdat_wdt *wdat;
 	struct resource *res;
 	void __iomem **regs;
@@ -438,6 +446,22 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, wdat);
 
+	/*
+	 * Set initial timeout so that userspace has time to configure
+	 * the watchdog properly after it has opened the device. In some
+	 * cases the BIOS default is too short and causes immediate reboot.
+	 */
+	default_timeout = timeout;
+	if (timeout < wdat->wdd.min_hw_heartbeat_ms ||
+	    timeout > wdat->wdd.max_hw_heartbeat_ms)
+		default_timeout = WDAT_DEFAULT_TIMEOUT;
+	else
+		default_timeout = timeout;
+
+	ret = wdat_wdt_set_timeout(&wdat->wdd, timeout);
+	if (ret)
+		return ret;
+
 	watchdog_set_nowayout(&wdat->wdd, nowayout);
 	return devm_watchdog_register_device(dev, &wdat->wdd);
 }
-- 
2.25.0

