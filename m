Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943C737B870
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 10:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhELItE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 04:49:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:31174 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231203AbhELItC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 04:49:02 -0400
IronPort-SDR: yBS777odih5yShrng91lSnCV72ZsyTfv/jm4a3We7JHWBbDpos4K6tXGMlU+R+myIgOA9p+Wfs
 JC+bSEsJBMRw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199708983"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="199708983"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:47:51 -0700
IronPort-SDR: ofY0xNY7S23WdAB/MH5ceIhRyDgJqRf3JK1bx9oKYDWEWiXznM7B9OGBpw2l8YqpAzw9TlyMUF
 ctvzZVAVv/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="435106481"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2021 01:47:46 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH 06/10] watchdog: keembay: Removed timeout update in the TO ISR
Date:   Wed, 12 May 2021 14:17:20 +0530
Message-Id: <20210512084724.14634-7-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512084724.14634-1-shruthi.sanil@intel.com>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

In the TO ISR removed updating the Timeout value because
its not serving any purpose as the timer would have already expired
and the system would be rebooting.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index 039753b9932b..dd192b8dff55 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -141,7 +141,6 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
 	struct keembay_wdt *wdt = dev_id;
 	struct arm_smccc_res res;
 
-	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
 	arm_smccc_smc(WDT_ISR_CLEAR, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
 	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
 	emergency_restart();
-- 
2.17.1

