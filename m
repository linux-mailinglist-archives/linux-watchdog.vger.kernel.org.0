Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D6837B869
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 10:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhELIsz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 04:48:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:57993 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230525AbhELIsy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 04:48:54 -0400
IronPort-SDR: CozDhw0hVCoWBnr/f0T8Z0ngWXdVcEeW9SDwY3jSaoLSSFZQL7arunpZDwN7oDD+FfEcRBPFKq
 XK86FbUu7Vug==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179246837"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179246837"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:47:46 -0700
IronPort-SDR: C9m92KLpkhqwcS2fetT9HmtYrpU3+eJFaqRxyHLD6Fuy3pA3vCLkWMowDTL3pbUIv8mwIqKNZV
 ZEyFnmJ73uVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="435106472"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2021 01:47:43 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH 05/10] watchdog: keembay: Remove timeout update in the WDT start function
Date:   Wed, 12 May 2021 14:17:19 +0530
Message-Id: <20210512084724.14634-6-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512084724.14634-1-shruthi.sanil@intel.com>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

Removed set timeout from the start WDT function. There is a function
defined to set the timeout. Hence no need to set the timeout again in
start function as the timeout would have been already updated
before calling the start/enable.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index f2a16c9933c3..039753b9932b 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -84,7 +84,6 @@ static int keembay_wdt_start(struct watchdog_device *wdog)
 {
 	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
 
-	keembay_wdt_set_timeout_reg(wdog);
 	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
 
 	return 0;
-- 
2.17.1

