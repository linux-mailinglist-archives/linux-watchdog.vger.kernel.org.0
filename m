Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FFC30034F
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 13:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbhAVMgY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 07:36:24 -0500
Received: from mga03.intel.com ([134.134.136.65]:46880 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbhAVMgV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 07:36:21 -0500
IronPort-SDR: oPvKUszGKpxbFzhKRnMa6JevMT9BdLydL66FK1Az/q5AyP5nZQr4Mcoy9fK+Tx3IUVPgSjFavA
 7+f9TGmtEmHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179520249"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="179520249"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:32:10 -0800
IronPort-SDR: Ea6ik9Gc4H7LH9R5b9hXa26KKnqIIPOuAEalN/ILPjiPE/d/fh+SqBoSHhsjWf9IAymdOKczUc
 lmvhafBVERhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="427955916"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2021 04:32:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EF1C832E; Fri, 22 Jan 2021 14:32:02 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/5] platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison
Date:   Fri, 22 Jan 2021 14:32:01 +0200
Message-Id: <20210122123201.40935-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Switch the platform code to use x86_id_table and accompanying API
instead of custom comparison against x86 CPU model.

This is one of the last users of custom API for that and following
changes will remove it for the good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_wdt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
index 19f7686a3c19..85ee85ca2215 100644
--- a/drivers/platform/x86/intel_scu_wdt.c
+++ b/drivers/platform/x86/intel_scu_wdt.c
@@ -11,6 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/intel-mid_wdt.h>
 
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
 #include <asm/intel-mid.h>
 #include <asm/io_apic.h>
 #include <asm/hw_irq.h>
@@ -48,12 +50,20 @@ static struct intel_mid_wdt_pdata tangier_pdata = {
 	.probe = tangier_probe,
 };
 
+static const struct x86_cpu_id intel_mid_cpu_ids[] = {
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID, &tangier_pdata),
+	{}
+};
+
 static int __init register_mid_wdt(void)
 {
-	if (intel_mid_identify_cpu() != INTEL_MID_CPU_CHIP_TANGIER)
+	const struct x86_cpu_id *id;
+
+	id = x86_match_cpu(intel_mid_cpu_ids);
+	if (!id)
 		return -ENODEV;
 
-	wdt_dev.dev.platform_data = &tangier_pdata;
+	wdt_dev.dev.platform_data = (const struct intel_mid_wdt_pdata *)id->driver_data;
 	return platform_device_register(&wdt_dev);
 }
 arch_initcall(register_mid_wdt);
-- 
2.29.2

