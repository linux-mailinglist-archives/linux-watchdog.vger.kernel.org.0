Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E0E383B9C
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241105AbhEQRvW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:51:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:14146 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241373AbhEQRvT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:51:19 -0400
IronPort-SDR: 9HrjiOyI4jLV5nvGMunLsc2NLzBKEEVedCT+n39at1DavmFyAgHXcfFFkeuR4QDp+iMGg4AWKh
 KK8wrmRzWlLQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180803219"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="180803219"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:50:03 -0700
IronPort-SDR: gE8lAuQwXGLrOMAoVOxVexJnrS/a4um2FUoxndQkscHxVzwx9KyssFgbmV6a73SVYw3nA5Cr/y
 6ZkIxNhZdT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="460394061"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 10:50:00 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH v2 2/9] watchdog: keembay: Upadate WDT pretimeout for every update in timeout
Date:   Mon, 17 May 2021 23:19:46 +0530
Message-Id: <20210517174953.19404-3-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517174953.19404-1-shruthi.sanil@intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

The pre-timeout value to be programmed to the register has to be
calculated and updated for every change in the timeout value.
Else the threshold time wouldn't be calculated to its
corresponding timeout.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index f2f5c9fae29c..b2afeb4a60e3 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -109,6 +109,7 @@ static int keembay_wdt_set_timeout(struct watchdog_device *wdog, u32 t)
 {
 	wdog->timeout = t;
 	keembay_wdt_set_timeout_reg(wdog);
+	keembay_wdt_set_pretimeout_reg(wdog);
 
 	return 0;
 }
-- 
2.17.1

