Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB661300346
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 13:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbhAVMf3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 07:35:29 -0500
Received: from mga17.intel.com ([192.55.52.151]:29875 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728163AbhAVMek (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 07:34:40 -0500
IronPort-SDR: UWyrYAe9cVfteAjOGoFIRTxAzfXPSrf2LXckZabW3jECNIKEjBg1R6kWi4Nu8SYs3E5Lh/H+dn
 w+Fgp6Rpg72g==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="159215182"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="159215182"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:32:10 -0800
IronPort-SDR: fBWwz4/TQn3AU0gOR3qy32EiYufk0LQqI/n+UXh2WdzeqJCBKNGkX/wfrMEYgKX0mYiiPx36TV
 MPtgGi1p9mqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="502715177"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 22 Jan 2021 04:32:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D9316161; Fri, 22 Jan 2021 14:32:02 +0200 (EET)
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
Subject: [PATCH v1 3/5] platform/x86: intel_scu_wdt: Move driver from arch/x86
Date:   Fri, 22 Jan 2021 14:31:59 +0200
Message-Id: <20210122123201.40935-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The ACPI-enabled Intel MID platforms neither have WDAT table nor proper IDs
to instantiate watchdog device. In order to keep them working move the board
code from arch/x86 to drivers/platform/x86.

Note, the complete SFI support is going to be removed, that's why PDx86
has been chosen as a new home for it. This is the only device which needs
additional code so far.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/platform/intel-mid/device_libs/Makefile          | 1 -
 drivers/platform/x86/Kconfig                              | 8 ++++++++
 drivers/platform/x86/Makefile                             | 1 +
 .../platform/x86/intel_scu_wdt.c                          | 0
 4 files changed, 9 insertions(+), 1 deletion(-)
 rename arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c => drivers/platform/x86/intel_scu_wdt.c (100%)

diff --git a/arch/x86/platform/intel-mid/device_libs/Makefile b/arch/x86/platform/intel-mid/device_libs/Makefile
index 480fed21cc7d..918edac9ab9a 100644
--- a/arch/x86/platform/intel-mid/device_libs/Makefile
+++ b/arch/x86/platform/intel-mid/device_libs/Makefile
@@ -30,4 +30,3 @@ obj-$(subst m,y,$(CONFIG_GPIO_PCA953X)) += platform_tca6416.o
 obj-$(subst m,y,$(CONFIG_KEYBOARD_GPIO)) += platform_gpio_keys.o
 obj-$(subst m,y,$(CONFIG_INTEL_MID_POWER_BUTTON)) += platform_mrfld_power_btn.o
 obj-$(subst m,y,$(CONFIG_RTC_DRV_CMOS)) += platform_mrfld_rtc.o
-obj-$(subst m,y,$(CONFIG_INTEL_MID_WATCHDOG)) += platform_mrfld_wdt.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4a5798a0ce0c..0bb85eabace1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1424,6 +1424,14 @@ config INTEL_SCU_PLATFORM
 	  and SCU (sometimes called PMC as well). The driver currently
 	  supports Intel Elkhart Lake and compatible platforms.
 
+config INTEL_SCU_WDT
+	bool
+	default INTEL_SCU_PCI
+	depends on INTEL_MID_WATCHDOG
+	help
+	  This is a specific platform code to instantiate watchdog device
+	  on ACPI-based Intel MID platforms.
+
 config INTEL_SCU_IPC_UTIL
 	tristate "Intel SCU IPC utility driver"
 	depends on INTEL_SCU
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 728ccc226a29..19306450d791 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
 obj-$(CONFIG_INTEL_SCU_IPC)		+= intel_scu_ipc.o
 obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
 obj-$(CONFIG_INTEL_SCU_PLATFORM)	+= intel_scu_pltdrv.o
+obj-$(CONFIG_INTEL_SCU_WDT)		+= intel_scu_wdt.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
 obj-$(CONFIG_INTEL_TELEMETRY)		+= intel_telemetry_core.o \
 					   intel_telemetry_pltdrv.o \
diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
similarity index 100%
rename from arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c
rename to drivers/platform/x86/intel_scu_wdt.c
-- 
2.29.2

