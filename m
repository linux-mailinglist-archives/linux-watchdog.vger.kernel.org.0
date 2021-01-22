Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDAFB300348
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 13:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbhAVMfg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 07:35:36 -0500
Received: from mga14.intel.com ([192.55.52.115]:29472 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728159AbhAVMek (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 07:34:40 -0500
IronPort-SDR: IM2ELx6Ijke34ySPI0Qmfn8qV7zd8S2C81VH+rGGffFb/mWCTE473sEFcC6Ut/iWBHAOYLb2dO
 Nowr2KOHTMHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="178661020"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="178661020"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:32:10 -0800
IronPort-SDR: Wh3rkhMZP+YbZBcmjyEVRU8Txx6FDyJbuPNdBg7uhBs7dltk1l2P+qib5BV6QU8uE6n+/2zpk4
 V46bSMzUWypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="355224168"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2021 04:32:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E5BB629A; Fri, 22 Jan 2021 14:32:02 +0200 (EET)
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
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 4/5] platform/x86: intel_scu_wdt: Drop SCU notification
Date:   Fri, 22 Jan 2021 14:32:00 +0200
Message-Id: <20210122123201.40935-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since SCU code along with the Intel MID watchdog driver has been refactored
in a way that latter will be probed only after the former has been come
to live, the notification code is bogus and not needed. Remove it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/platform/x86/intel_scu_wdt.c | 31 +++++++---------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
index 227218a8f98e..19f7686a3c19 100644
--- a/drivers/platform/x86/intel_scu_wdt.c
+++ b/drivers/platform/x86/intel_scu_wdt.c
@@ -12,7 +12,6 @@
 #include <linux/platform_data/intel-mid_wdt.h>
 
 #include <asm/intel-mid.h>
-#include <asm/intel_scu_ipc.h>
 #include <asm/io_apic.h>
 #include <asm/hw_irq.h>
 
@@ -49,34 +48,18 @@ static struct intel_mid_wdt_pdata tangier_pdata = {
 	.probe = tangier_probe,
 };
 
-static int wdt_scu_status_change(struct notifier_block *nb,
-				 unsigned long code, void *data)
-{
-	if (code == SCU_DOWN) {
-		platform_device_unregister(&wdt_dev);
-		return 0;
-	}
-
-	return platform_device_register(&wdt_dev);
-}
-
-static struct notifier_block wdt_scu_notifier = {
-	.notifier_call	= wdt_scu_status_change,
-};
-
 static int __init register_mid_wdt(void)
 {
 	if (intel_mid_identify_cpu() != INTEL_MID_CPU_CHIP_TANGIER)
 		return -ENODEV;
 
 	wdt_dev.dev.platform_data = &tangier_pdata;
-
-	/*
-	 * We need to be sure that the SCU IPC is ready before watchdog device
-	 * can be registered:
-	 */
-	intel_scu_notifier_add(&wdt_scu_notifier);
-
-	return 0;
+	return platform_device_register(&wdt_dev);
 }
 arch_initcall(register_mid_wdt);
+
+static void __exit unregister_mid_wdt(void)
+{
+	platform_device_unregister(&wdt_dev);
+}
+__exitcall(unregister_mid_wdt);
-- 
2.29.2

