Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1487437B861
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 10:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhELIsl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 04:48:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:57960 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230362AbhELIsk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 04:48:40 -0400
IronPort-SDR: V9ZZxkvD58dX764ChBSF7SfRL7rdj7OrCAOY/QnyCn5ngbPXcaT58olmE+kZpvHIS2lyBTGUU+
 2VBQlKsJgfgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179246744"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179246744"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:47:32 -0700
IronPort-SDR: Jm4G1f0isgvQalaVNlPUNakk/bBnDqa5a97Cpli7LrhfH+clsIoyOKph1MEcHzZB57JAVjql61
 VfFzywOMU5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="435106406"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2021 01:47:29 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH 01/10] watchdog: keembay: Update WDT pre-timeout during the initialization
Date:   Wed, 12 May 2021 14:17:15 +0530
Message-Id: <20210512084724.14634-2-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512084724.14634-1-shruthi.sanil@intel.com>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

The pretimeout register has a default reset value. Hence
when a smaller WDT timeout is set which would be lesser than the
default pretimeout, the system behaves abnormally, starts
triggering the pretimeout interrupt even when the WDT is
not enabled, most of the times leading to system crash.
Hence an update in the pre-timeout is also required for the
default timeout that is being configured.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index 547d3fea33ff..f2f5c9fae29c 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -29,6 +29,7 @@
 #define WDT_LOAD_MAX		U32_MAX
 #define WDT_LOAD_MIN		1
 #define WDT_TIMEOUT		5
+#define WDT_PRETIMEOUT		4
 
 static unsigned int timeout = WDT_TIMEOUT;
 module_param(timeout, int, 0);
@@ -224,11 +225,13 @@ static int keembay_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.min_timeout	= WDT_LOAD_MIN;
 	wdt->wdd.max_timeout	= WDT_LOAD_MAX / wdt->rate;
 	wdt->wdd.timeout	= WDT_TIMEOUT;
+	wdt->wdd.pretimeout	= WDT_PRETIMEOUT;
 
 	watchdog_set_drvdata(&wdt->wdd, wdt);
 	watchdog_set_nowayout(&wdt->wdd, nowayout);
 	watchdog_init_timeout(&wdt->wdd, timeout, dev);
 	keembay_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+	keembay_wdt_set_pretimeout(&wdt->wdd, wdt->wdd.pretimeout);
 
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
 	if (ret)
-- 
2.17.1

