Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262B537B867
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 10:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhELIsx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 04:48:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:57985 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231132AbhELIsu (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 04:48:50 -0400
IronPort-SDR: eeDbyjZs/VZhoADlFPI3Op/0+EnfS4Rt87MgTKu+/8e6byLJGTjLimSqfJvFXPTW8AGGAcagdt
 YL6OUzpNF4Dg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179246821"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179246821"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:47:42 -0700
IronPort-SDR: J8psRwWYB4debo/R8qrXG6fXnRATRMGiNy6fy72dEqxTzntgbjw+W2J23cRPfZzwAgPThzgS3r
 8v9zXcOMR5lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="435106460"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2021 01:47:39 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH 04/10] watchdog: keembay: Clear either the TO or TH interrupt bit
Date:   Wed, 12 May 2021 14:17:18 +0530
Message-Id: <20210512084724.14634-5-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512084724.14634-1-shruthi.sanil@intel.com>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

During the interrupt service routine of the TimeOut interrupt and
the ThresHold interrupt, the respective interrupt clear bit
have to be cleared and not both.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
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

