Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63D137B87C
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 10:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhELItR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 04:49:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:31193 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231251AbhELItM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 04:49:12 -0400
IronPort-SDR: qcVlB362cp49yxoxD1NvuRIInT+slSaGZJE2TZPNE+g1RGVtrE0IfYWM5huwCaBhERCL2L8sRT
 nDQytbVyi7mA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199709121"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="199709121"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:48:05 -0700
IronPort-SDR: wCzTaeqout61qJQrPaJZNZZ3arU0jrhyrLE+1thslreev7SvGhku4f0NfCGWWUrxbxoLJIXx6+
 l4KwWP+KnmZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="435106548"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2021 01:48:02 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH 10/10] watchdog: keembay: Typo corrections and other blank operations
Date:   Wed, 12 May 2021 14:17:24 +0530
Message-Id: <20210512084724.14634-11-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512084724.14634-1-shruthi.sanil@intel.com>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

Corrected typos, aligned the tabs and added new lines
wherever required for better readability

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index 0a8cf5b35699..6a2699021263 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -26,11 +26,14 @@
 #define WDT_TH_INT_MASK		BIT(8)
 #define WDT_TO_INT_MASK		BIT(9)
 #define WDT_INT_CLEAR_SMC	0x8200ff18
+
 #define WDT_UNLOCK		0xf1d0dead
 #define WDT_DISABLE		0x0
 #define WDT_ENABLE		0x1
+
 #define WDT_LOAD_MAX		U32_MAX
 #define WDT_LOAD_MIN		1
+
 #define WDT_TIMEOUT		5
 #define WDT_PRETIMEOUT		4
 
@@ -144,7 +147,7 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
 	struct arm_smccc_res res;
 
 	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
-	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
+	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-secure wdt timeout.\n");
 	emergency_restart();
 
 	return IRQ_HANDLED;
@@ -158,7 +161,7 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
 	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
 
 	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
-	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
+	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-secure wdt pre-timeout.\n");
 	watchdog_notify_pretimeout(&wdt->wdd);
 
 	return IRQ_HANDLED;
@@ -278,8 +281,8 @@ static const struct of_device_id keembay_wdt_match[] = {
 MODULE_DEVICE_TABLE(of, keembay_wdt_match);
 
 static struct platform_driver keembay_wdt_driver = {
-	.probe		= keembay_wdt_probe,
-	.driver		= {
+	.probe	= keembay_wdt_probe,
+	.driver	= {
 		.name		= "keembay_wdt",
 		.of_match_table	= keembay_wdt_match,
 		.pm		= &keembay_wdt_pm_ops,
-- 
2.17.1

