Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CE1300341
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 13:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbhAVMfO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 07:35:14 -0500
Received: from mga12.intel.com ([192.55.52.136]:11230 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbhAVMek (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 07:34:40 -0500
IronPort-SDR: 0ty8CsPaFZLWcDRDaGuoC3XNIwN7XH2/Nb/Ors1JlzyzKAGbKM+iBfGtAmhljHv9zQbkXUiplU
 z6ip9VSUDp4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="158617608"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="158617608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:32:07 -0800
IronPort-SDR: BrIzskPsl6Sg9+MjqpUaQLYlI3dmaMvKvn4C6ItAeijJRYhnW8X+MhR5NQdzbrUOGkeI3PlAkR
 DDH06W3KNUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="351883204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 22 Jan 2021 04:32:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D1B5212A; Fri, 22 Jan 2021 14:32:02 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 2/5] watchdog: intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
Date:   Fri, 22 Jan 2021 14:31:58 +0200
Message-Id: <20210122123201.40935-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When SCU is not ready and CONFIG_DEBUG_SHIRQ=y we got deferred probe followed
by fired test IRQ which immediately makes kernel panic. Fix this by delaying
IRQ handler registration till SCU is ready.

Fixes: 80ae679b8f86 ("watchdog: intel-mid_wdt: Convert to use new SCU IPC API")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/watchdog/intel-mid_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
index 1ae03b64ef8b..9b2173f765c8 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -154,6 +154,10 @@ static int mid_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
 	watchdog_set_drvdata(wdt_dev, mid);
 
+	mid->scu = devm_intel_scu_ipc_dev_get(dev);
+	if (!mid->scu)
+		return -EPROBE_DEFER;
+
 	ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
 			       IRQF_SHARED | IRQF_NO_SUSPEND, "watchdog",
 			       wdt_dev);
@@ -162,10 +166,6 @@ static int mid_wdt_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mid->scu = devm_intel_scu_ipc_dev_get(dev);
-	if (!mid->scu)
-		return -EPROBE_DEFER;
-
 	/*
 	 * The firmware followed by U-Boot leaves the watchdog running
 	 * with the default threshold which may vary. When we get here
-- 
2.29.2

