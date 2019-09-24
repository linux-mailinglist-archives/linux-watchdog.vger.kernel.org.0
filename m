Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A3EBCA42
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2019 16:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632785AbfIXObU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 24 Sep 2019 10:31:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:2792 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393649AbfIXObU (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 24 Sep 2019 10:31:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 07:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; 
   d="scan'208";a="179499892"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Sep 2019 07:31:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 24CD3D7; Tue, 24 Sep 2019 17:31:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>
Subject: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
Date:   Tue, 24 Sep 2019 17:31:16 +0300
Message-Id: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Normally, the watchdog is disabled when /dev/watchdog is closed, but if
CONFIG_WATCHDOG_NOWAYOUT is defined, then it means that the watchdog should
remain enabled. So we should keep it enabled if CONFIG_WATCHDOG_NOWAYOUT
is defined.

Reported-by: Razvan Becheriu <razvan.becheriu@qualitance.com>
Cc: Ferry Toth <fntoth@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/watchdog/intel-mid_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
index 2cdbd37c700c..470213abfd3d 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -134,6 +134,7 @@ static int mid_wdt_probe(struct platform_device *pdev)
 	wdt_dev->timeout = MID_WDT_DEFAULT_TIMEOUT;
 	wdt_dev->parent = dev;
 
+	watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
 	watchdog_set_drvdata(wdt_dev, dev);
 
 	ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
-- 
2.23.0

