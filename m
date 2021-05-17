Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726EE383BA8
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhEQRv7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:51:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:12915 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236558AbhEQRvw (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:51:52 -0400
IronPort-SDR: t6Ptn/S5EJSNuFmjWvakRJiJVSwEBjuKu3/P7TqvjEFgho29X35XMUkDtLeGxEV6UUZsWFDfKI
 J1COGp3NjSwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="187646365"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187646365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:50:34 -0700
IronPort-SDR: 9E7a99yCj545AwSmkrAdMsZkf3ivuZBlaiaTfFKAdRKFcrUnwYLBJ7/6R6UHCwgmMy5sNM7jc0
 rGskGANVgXTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="460394216"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 10:50:22 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH v2 8/9] watchdog: keembay: WDT SMC handler MACRO name update
Date:   Mon, 17 May 2021 23:19:52 +0530
Message-Id: <20210517174953.19404-9-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517174953.19404-1-shruthi.sanil@intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

Updated the WDT SMC handler MACRO name to make it clear that its
a ARM SMC handler that helps in clearing the WDT interrupt bit.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index d8c50b6291cd..5ac823487b70 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -25,7 +25,7 @@
 
 #define WDT_TH_INT_MASK		BIT(8)
 #define WDT_TO_INT_MASK		BIT(9)
-#define WDT_ISR_CLEAR		0x8200ff18
+#define WDT_INT_CLEAR_SMC	0x8200ff18
 #define WDT_UNLOCK		0xf1d0dead
 #define WDT_DISABLE		0x0
 #define WDT_ENABLE		0x1
@@ -143,7 +143,7 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
 	struct keembay_wdt *wdt = dev_id;
 	struct arm_smccc_res res;
 
-	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
 	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
 	emergency_restart();
 
@@ -157,7 +157,7 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
 
 	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
 
-	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
 	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
 	watchdog_notify_pretimeout(&wdt->wdd);
 
-- 
2.17.1

