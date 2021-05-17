Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF989383B8F
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236348AbhEQRp7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:45:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:24739 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236298AbhEQRp7 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:45:59 -0400
IronPort-SDR: pasOBTQC/Ag5bgCPtyUPdO25oPkJgzqfHTconeF8kl+rW0iX7n+wB4EtYosILm25bsvCiOUKMf
 ZTe9C+Q5edHQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="200575392"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="200575392"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:44:41 -0700
IronPort-SDR: gAfZygoGpYIp4wrHn8AzXI0W5thtix5x4siTCadUpsNwsnSiY1aPxMEKjLnpkISlvrNfPJyafe
 2T/BmJgIxe/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="630096596"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2021 10:44:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CA37212F; Mon, 17 May 2021 20:45:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v1 1/1] watchdog: sp805: Use devm_clk_get_optional()
Date:   Mon, 17 May 2021 20:44:56 +0300
Message-Id: <20210517174456.22050-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Replace open coded variants of devm_clk_get_optional().

While at it, drop unneeded OF and ACPI dependency as the APIs in use
are provider agnostic.

Cc: Srinath Mannam <srinath.mannam@broadcom.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/watchdog/sp805_wdt.c | 40 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index 58a00e1ab23b..531551216c8c 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -11,7 +11,6 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/resource.h>
 #include <linux/amba/bus.h>
@@ -23,8 +22,8 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -231,6 +230,7 @@ static int
 sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct sp805_wdt *wdt;
+	u64 rate = 0;
 	int ret = 0;
 
 	wdt = devm_kzalloc(&adev->dev, sizeof(*wdt), GFP_KERNEL);
@@ -243,25 +243,23 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	if (adev->dev.of_node) {
-		wdt->clk = devm_clk_get(&adev->dev, NULL);
-		if (IS_ERR(wdt->clk)) {
-			dev_err(&adev->dev, "Clock not found\n");
-			return PTR_ERR(wdt->clk);
-		}
-		wdt->rate = clk_get_rate(wdt->clk);
-	} else if (has_acpi_companion(&adev->dev)) {
-		/*
-		 * When Driver probe with ACPI device, clock devices
-		 * are not available, so watchdog rate get from
-		 * clock-frequency property given in _DSD object.
-		 */
-		device_property_read_u64(&adev->dev, "clock-frequency",
-					 &wdt->rate);
-		if (!wdt->rate) {
-			dev_err(&adev->dev, "no clock-frequency property\n");
-			return -ENODEV;
-		}
+	/*
+	 * When driver probe with ACPI device, clock devices
+	 * are not available, so watchdog rate get from
+	 * clock-frequency property given in _DSD object.
+	 */
+	device_property_read_u64(&adev->dev, "clock-frequency", &rate);
+
+	wdt->clk = devm_clk_get_optional(&adev->dev, NULL);
+	if (IS_ERR(wdt->clk))
+		return dev_err_probe(&adev->dev, PTR_ERR(wdt->clk), "Clock not found\n");
+
+	wdt->rate = clk_get_rate(wdt->clk);
+	if (!wdt->rate)
+		wdt->rate = rate;
+	if (!wdt->rate) {
+		dev_err(&adev->dev, "no clock-frequency property\n");
+		return -ENODEV;
 	}
 
 	wdt->adev = adev;
-- 
2.30.2

