Return-Path: <linux-watchdog+bounces-3040-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A335A4E00C
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 15:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E1957AAEB7
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 14:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E2F204680;
	Tue,  4 Mar 2025 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNIWBPfE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9787202F90;
	Tue,  4 Mar 2025 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096880; cv=none; b=OB+pnYgUwsh4xz22XXjyRs+Otk8Z8wSNiwxLQHCzGEU3FaUNo8XkFWEVpROlutkBvaccvP1pVZgoHGk3v/VER0IYtDUyeq8fGsTFRq17bgGMrt4En1dqq1BsuRA+qZh5h6VNuFQM+08qfu57q6dU/ll0iY2F3S6cM9L5jBXiaio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096880; c=relaxed/simple;
	bh=vJyQB5Blh3KGhbpLZmZIfPJA0eS8D7VJOGBnqE9Cvcg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=c+s3rjArvtiE9Iye2Col3dJF6w6RVOtdHQafl58TeFiqezXCr3yIZSwtNK5gYezM5HAFDl6psgnttwswFX269ecm6FLpaxQY2krdOItSlUNUk0gtt0Y/byziTuF3J3UL9tXw3G+n6m8WWxEUpZegUsRY+7nyCBuuqesEaIyRBNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNIWBPfE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741096878; x=1772632878;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vJyQB5Blh3KGhbpLZmZIfPJA0eS8D7VJOGBnqE9Cvcg=;
  b=kNIWBPfEOu8CrxZrboRXrG8yNBo/AbX5vOUboRAjivhrTFG6xNYtvmLb
   2K3gXdqcZudZHy4OcTxsm7wPmDJkBwC+cWNTK3LIKVK+/T9fofvxFAp+q
   sM08PrUpqs8g0q8c/2Ts37wRUf1EcbWUiS5WT/kMD7TADVMSX9BDTWJdM
   pMYz6pTc9F1OWQbq9oqbeZ9/gaWH3rrCN7HzHmH5KDImVJO5k4KgUaz6S
   bRbimsnvN94rk7rZXiHF2th7IDyoMeRsd6Zwbvprozw1GCLGiOdqTJq5c
   FtEjWs0GFkrq6qiqJtk7mDWHfQ6zmtMGkUHgRGJlZYj7oEzlrhTcljZY5
   w==;
X-CSE-ConnectionGUID: ISXKQ6bvSiONRSuo78QACQ==
X-CSE-MsgGUID: rt5XKkawSJSMA91fz+sQQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42261681"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="42261681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:01:17 -0800
X-CSE-ConnectionGUID: VTHynAnQTIGub0JKGisgzA==
X-CSE-MsgGUID: VTWkiimRTJW1rhom4ATjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="119060914"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 04 Mar 2025 06:01:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4249E27D; Tue, 04 Mar 2025 16:01:15 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
Date: Tue,  4 Mar 2025 15:45:35 +0200
Message-ID: <20250304140114.1812452-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tidy up ACPI ID table:
- drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h
- remove explicit driver_data initializer
- drop comma in the terminator entry

With that done, extend compile test coverage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed the dependency to be on HAS_IOPORT (LKP)

 drivers/watchdog/Kconfig       | 3 ++-
 drivers/watchdog/nic7018_wdt.c | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..a2ed9ee0b808 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1730,7 +1730,8 @@ config NI903X_WDT
 
 config NIC7018_WDT
 	tristate "NIC7018 Watchdog"
-	depends on X86 && ACPI
+	depends on HAS_IOPORT
+	depends on ACPI || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  Support for National Instruments NIC7018 Watchdog.
diff --git a/drivers/watchdog/nic7018_wdt.c b/drivers/watchdog/nic7018_wdt.c
index 44982b37ba6f..44b5298f599a 100644
--- a/drivers/watchdog/nic7018_wdt.c
+++ b/drivers/watchdog/nic7018_wdt.c
@@ -3,12 +3,13 @@
  * Copyright (C) 2016 National Instruments Corp.
  */
 
-#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/types.h>
 #include <linux/watchdog.h>
 
 #define LOCK			0xA5
@@ -229,8 +230,8 @@ static void nic7018_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id nic7018_device_ids[] = {
-	{"NIC7018", 0},
-	{"", 0},
+	{ "NIC7018" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, nic7018_device_ids);
 
@@ -239,7 +240,7 @@ static struct platform_driver watchdog_driver = {
 	.remove = nic7018_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.acpi_match_table = ACPI_PTR(nic7018_device_ids),
+		.acpi_match_table = nic7018_device_ids,
 	},
 };
 
-- 
2.47.2


