Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9B1383BA0
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242550AbhEQRv1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:51:27 -0400
Received: from mga17.intel.com ([192.55.52.151]:14172 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241699AbhEQRv0 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:51:26 -0400
IronPort-SDR: UPPpX9/NocEgK6gmZmCz6UT0I34eF+27K+hqhHwz4nvJv/UkxqGnThRjfhCaWlT8qtsn+EaDFj
 8FOqW8yPDp0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180803232"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="180803232"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:50:09 -0700
IronPort-SDR: neXanyN4hTonynEoKXnQP9cveTI/yVIDuLyTFoqroBnmjwot2yFt1387I0OazIKFRTpNqCp7JX
 6/eBGYgxf5sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="460394104"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 10:50:06 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH v2 4/9] watchdog: keembay: Clear either the TO or TH interrupt bit
Date:   Mon, 17 May 2021 23:19:48 +0530
Message-Id: <20210517174953.19404-5-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517174953.19404-1-shruthi.sanil@intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

During the interrupt service routine of the TimeOut interrupt and
the ThresHold interrupt, the respective interrupt clear bit
have to be cleared and not both.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index 6053416b8d3d..f2a16c9933c3 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -23,7 +23,8 @@
 #define TIM_WDOG_EN		0x8
 #define TIM_SAFE		0xc
 
-#define WDT_ISR_MASK		GENMASK(9, 8)
+#define WDT_TH_INT_MASK		BIT(8)
+#define WDT_TO_INT_MASK		BIT(9)
 #define WDT_ISR_CLEAR		0x8200ff18
 #define WDT_UNLOCK		0xf1d0dead
 #define WDT_LOAD_MAX		U32_MAX
@@ -142,7 +143,7 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
 	struct arm_smccc_res res;
 
 	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
-	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
 	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
 	emergency_restart();
 
@@ -156,7 +157,7 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
 
 	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
 
-	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
 	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
 	watchdog_notify_pretimeout(&wdt->wdd);
 
-- 
2.17.1

