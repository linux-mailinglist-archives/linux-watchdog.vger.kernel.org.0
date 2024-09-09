Return-Path: <linux-watchdog+bounces-1818-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AF9719E1
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 14:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9481C22EF0
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C55B1B81B7;
	Mon,  9 Sep 2024 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAxJOFtY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216F1B7904;
	Mon,  9 Sep 2024 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886207; cv=none; b=tw3X+DOiYNqtDpvlL7Qb71LL+gv5kCwxhXCj8nyA1zVxkGwCGhAJY1Xq2qj0MRa6BK8Dlhf5+FgsTfeon8uMEabznM/xhTnkAQsKGcyTPpu0vX1AfNSG2c16AlCBOBOFkpiWENkq6B0RN75MqsmgWUJZ8xq3x1QWWdgaNYkqhu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886207; c=relaxed/simple;
	bh=fKTrnohR/mjX7bAoHp4TDCKpYppytH7G5Ads0f3+w8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpQCNjQ2b+aU+c9KSq2nYiMxRuyiG7In1bTKm5hrc23Ek4eT4kXRim+NIxvNRFYBLYJojMNq39huZPpAa4VbacwRX6v4f+TAi4GKlOqek8wXz4k6YlMqp87DkzvX4MTge1v/Wy1oPMS3emi7yBSv62FbpVh2T7fVSoKywMrisVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAxJOFtY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725886205; x=1757422205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fKTrnohR/mjX7bAoHp4TDCKpYppytH7G5Ads0f3+w8E=;
  b=RAxJOFtYtAm2o+HADNHIuZBhIQwV9LjF+nfH/VAq6DEdrWFlwl6zNXzJ
   PKUcgcV7CZfnneFdiXUqzBrcrgXxnKsbbqrThqpBMXJ1wv8pwy7rXuSkW
   t2ClJTbnLVsR6mRdIljjUfuwXIfkACX403ajlo+7BvNkjFXCVGEafuB+l
   PTAp6V2JcD1JB9KrRsWA4JX8g3zSzRsFuw92ko5StH0g9OiufVczQvUcK
   t1KY0X1cXnjY18i6AImcNafdS9UoGjGSsycXtEWecdAfouJfxpm227Rl/
   lVPkirtGfl/omAkNgqLw0IiKhzPoGH5H2oWRQcnVPAKShh3JKVuVI1SfS
   g==;
X-CSE-ConnectionGUID: VXjx8s4ITwa9a6RLvCwMNg==
X-CSE-MsgGUID: RS7tBpNxRdekheqMcBKMJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35171806"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35171806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:50:04 -0700
X-CSE-ConnectionGUID: r8Pkll/7RNKrRPRjNcDtfg==
X-CSE-MsgGUID: 6OUsNXUaQVeSjlPlM6iILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="67392015"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2024 05:49:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 127E03DE; Mon, 09 Sep 2024 15:49:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Lee Jones <lee@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v2 2/3] platform/x86: intel_scu_ipc: Move intel_scu_ipc.h out of arch/x86/include/asm
Date: Mon,  9 Sep 2024 15:41:05 +0300
Message-ID: <20240909124952.1152017-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240909124952.1152017-1-andriy.shevchenko@linux.intel.com>
References: <20240909124952.1152017-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mika Westerberg <mika.westerberg@linux.intel.com>

This is a platform/x86 library that is mostly being used by other
drivers not directly under arch/x86 anyway (with the exception of the
Intel MID setup code) so it makes sense that it lives under the
platform_data/x86/ directory instead.

No functional changes intented.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                                                   | 4 ++--
 arch/x86/include/asm/intel_telemetry.h                        | 2 +-
 arch/x86/platform/intel-mid/intel-mid.c                       | 3 ++-
 drivers/mfd/intel_pmc_bxt.c                                   | 3 +--
 drivers/mfd/intel_soc_pmic_bxtwc.c                            | 3 +--
 drivers/mfd/intel_soc_pmic_mrfld.c                            | 3 +--
 drivers/platform/x86/intel_scu_ipc.c                          | 2 +-
 drivers/platform/x86/intel_scu_ipcutil.c                      | 2 +-
 drivers/platform/x86/intel_scu_pcidrv.c                       | 2 +-
 drivers/platform/x86/intel_scu_pltdrv.c                       | 2 +-
 drivers/usb/typec/mux/intel_pmc_mux.c                         | 3 +--
 drivers/watchdog/intel-mid_wdt.c                              | 3 +--
 .../asm => include/linux/platform_data/x86}/intel_scu_ipc.h   | 4 ++--
 13 files changed, 16 insertions(+), 20 deletions(-)
 rename {arch/x86/include/asm => include/linux/platform_data/x86}/intel_scu_ipc.h (96%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61c74ae39961..802e6c957154 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11482,7 +11482,6 @@ M:	Andy Shevchenko <andy@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-mid.h
-F:	arch/x86/include/asm/intel_scu_ipc.h
 F:	arch/x86/pci/intel_mid_pci.c
 F:	arch/x86/platform/intel-mid/
 F:	drivers/extcon/extcon-intel-mrfld.c
@@ -11494,6 +11493,7 @@ F:	drivers/staging/media/atomisp/
 F:	drivers/watchdog/intel-mid_wdt.c
 F:	include/linux/mfd/intel_soc_pmic_mrfld.h
 F:	include/linux/platform_data/intel-mid_wdt.h
+F:	include/linux/platform_data/x86/intel_scu_ipc.h
 
 INTEL P-Unit IPC DRIVER
 M:	Zha Qipeng <qipeng.zha@intel.com>
@@ -11557,8 +11557,8 @@ F:	drivers/counter/intel-qep.c
 INTEL SCU DRIVERS
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 S:	Maintained
-F:	arch/x86/include/asm/intel_scu_ipc.h
 F:	drivers/platform/x86/intel_scu_*
+F:	include/linux/platform_data/x86/intel_scu_ipc.h
 
 INTEL SDSI DRIVER
 M:	David E. Box <david.e.box@linux.intel.com>
diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index 8046e70dfd7c..43b7657febca 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -10,7 +10,7 @@
 #define TELEM_MAX_EVENTS_SRAM		28
 #define TELEM_MAX_OS_ALLOCATED_EVENTS	20
 
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 enum telemetry_unit {
 	TELEM_PSS = 0,
diff --git a/arch/x86/platform/intel-mid/intel-mid.c b/arch/x86/platform/intel-mid/intel-mid.c
index f83bbe0acd4a..a8e75f8c14fd 100644
--- a/arch/x86/platform/intel-mid/intel-mid.c
+++ b/arch/x86/platform/intel-mid/intel-mid.c
@@ -27,9 +27,10 @@
 #include <asm/intel-mid.h>
 #include <asm/io.h>
 #include <asm/i8259.h>
-#include <asm/intel_scu_ipc.h>
 #include <asm/reboot.h>
 
+#include <linux/platform_data/x86/intel_scu_ipc.h>
+
 #define IPCMSG_COLD_OFF		0x80	/* Only for Tangier */
 #define IPCMSG_COLD_RESET	0xF1
 
diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
index 9f01d38acc7f..e405d7513ca1 100644
--- a/drivers/mfd/intel_pmc_bxt.c
+++ b/drivers/mfd/intel_pmc_bxt.c
@@ -23,8 +23,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/itco_wdt.h>
-
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 /* Residency with clock rate at 19.2MHz to usecs */
 #define S0IX_RESIDENCY_IN_USECS(d, s)		\
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index ba32cacfc499..ab3c94224dd1 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -15,8 +15,7 @@
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/mfd/intel_soc_pmic_bxtwc.h>
 #include <linux/module.h>
-
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 /* PMIC device registers */
 #define REG_ADDR_MASK		GENMASK(15, 8)
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 71da861e8c27..77121775c1a3 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -12,11 +12,10 @@
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/mfd/intel_soc_pmic_mrfld.h>
 #include <linux/module.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <asm/intel_scu_ipc.h>
-
 /*
  * Level 2 IRQs
  *
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index a68df4133403..5b16d29c93d7 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -23,7 +23,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 /* IPC defines the following message types */
 #define IPCMSG_PCNTRL         0xff /* Power controller unit read/write */
diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
index 7d87cbd4b9c6..69b36ce41fa2 100644
--- a/drivers/platform/x86/intel_scu_ipcutil.c
+++ b/drivers/platform/x86/intel_scu_ipcutil.c
@@ -18,7 +18,7 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 static int major;
 
diff --git a/drivers/platform/x86/intel_scu_pcidrv.c b/drivers/platform/x86/intel_scu_pcidrv.c
index dbf0310448da..d7f72d6deb44 100644
--- a/drivers/platform/x86/intel_scu_pcidrv.c
+++ b/drivers/platform/x86/intel_scu_pcidrv.c
@@ -11,7 +11,7 @@
 #include <linux/init.h>
 #include <linux/pci.h>
 
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 static int intel_scu_pci_probe(struct pci_dev *pdev,
 			       const struct pci_device_id *id)
diff --git a/drivers/platform/x86/intel_scu_pltdrv.c b/drivers/platform/x86/intel_scu_pltdrv.c
index 56ec6ae4c824..0892362acd7b 100644
--- a/drivers/platform/x86/intel_scu_pltdrv.c
+++ b/drivers/platform/x86/intel_scu_pltdrv.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 static int intel_scu_platform_probe(struct platform_device *pdev)
 {
diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 56989a0d0f43..46b4c5c3a6be 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/usb/pd.h>
@@ -18,8 +19,6 @@
 #include <linux/debugfs.h>
 #include <linux/usb.h>
 
-#include <asm/intel_scu_ipc.h>
-
 #define PMC_USBC_CMD		0xa7
 
 /* Response status bits */
diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
index 8d71f6a2236b..91c9c3950e44 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -21,8 +21,7 @@
 #include <linux/watchdog.h>
 
 #include <linux/platform_data/intel-mid_wdt.h>
-
-#include <asm/intel_scu_ipc.h>
+#include <linux/platform_data/x86/intel_scu_ipc.h>
 
 #define IPC_WATCHDOG 0xf8
 
diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/include/linux/platform_data/x86/intel_scu_ipc.h
similarity index 96%
rename from arch/x86/include/asm/intel_scu_ipc.h
rename to include/linux/platform_data/x86/intel_scu_ipc.h
index 8537f597d20a..0ca9962e97f2 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/include/linux/platform_data/x86/intel_scu_ipc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_INTEL_SCU_IPC_H_
-#define  _ASM_X86_INTEL_SCU_IPC_H_
+#ifndef __PLATFORM_X86_INTEL_SCU_IPC_H_
+#define __PLATFORM_X86_INTEL_SCU_IPC_H_
 
 #include <linux/ioport.h>
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


