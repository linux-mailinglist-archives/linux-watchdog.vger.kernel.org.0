Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A015383BA6
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239953AbhEQRvx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:51:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:12911 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236481AbhEQRvv (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:51:51 -0400
IronPort-SDR: XdxYovPiruQELSQe1EnMyHFdbHdU/8xoIg67DaSALAvgtlLmSVyH3QC/mHa0ytfsUj0blFjSp6
 oSNlr7bmzymQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="187646363"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187646363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:50:34 -0700
IronPort-SDR: XjpWXgykiTLLgTMKL6EL1poYl732Ta6evkuDt/sC/CLVVHeXP2gmVDeLVHXFzn+DfAOqNKbVP4
 i4TcqgCVahfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="460394214"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 10:50:18 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH v2 7/9] watchdog: keembay: MACRO for WDT enable and disable values
Date:   Mon, 17 May 2021 23:19:51 +0530
Message-Id: <20210517174953.19404-8-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517174953.19404-1-shruthi.sanil@intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

Introduced MACRO's for WDT enable and disable values for better readability

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index dd192b8dff55..d8c50b6291cd 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -27,6 +27,8 @@
 #define WDT_TO_INT_MASK		BIT(9)
 #define WDT_ISR_CLEAR		0x8200ff18
 #define WDT_UNLOCK		0xf1d0dead
+#define WDT_DISABLE		0x0
+#define WDT_ENABLE		0x1
 #define WDT_LOAD_MAX		U32_MAX
 #define WDT_LOAD_MIN		1
 #define WDT_TIMEOUT		5
@@ -84,7 +86,7 @@ static int keembay_wdt_start(struct watchdog_device *wdog)
 {
 	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
 
-	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
+	keembay_wdt_writel(wdt, TIM_WDOG_EN, WDT_ENABLE);
 
 	return 0;
 }
@@ -93,7 +95,7 @@ static int keembay_wdt_stop(struct watchdog_device *wdog)
 {
 	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
 
-	keembay_wdt_writel(wdt, TIM_WDOG_EN, 0);
+	keembay_wdt_writel(wdt, TIM_WDOG_EN, WDT_DISABLE);
 
 	return 0;
 }
-- 
2.17.1

