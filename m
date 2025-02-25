Return-Path: <linux-watchdog+bounces-3000-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB52A43A9F
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 11:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 960BD17AA0E
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 10:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FC4266F17;
	Tue, 25 Feb 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElTGJ1Om"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951B262D25;
	Tue, 25 Feb 2025 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477493; cv=none; b=dg7e91uV1u+TlITPtAPvOmsGX0DLXTfu/m1hZKDHalAatbsF1GSP7XwPmWFhG/ySCZ4j5AAmwqSPFkxWcmHiXu2ypi7DyU949jzKYYYYcBykf8jqPstTMzM7uFe2xg6W6bG6jpGpYnieV5zI1EYPWccxtOyL/6FxvH0cOnmSUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477493; c=relaxed/simple;
	bh=C4tUg7SiwBa8xXWRh7NwI3E2Gt08iqlKbNdN/vLD8Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRNloUjdhkJm6daoiXPtAcTGum2nHxQAwylYFPAJdjy8XC2vbyzMebDTf7rF2eDKvahfqikElvHJtJ9n3DFj8VghtalFigpxN/imSqvVLJPW6J5C6geQKPoWuNMq+NU38WYPLIzu0I+lJ1N4uzDQjC0uJ0FlEuSlA1ymDkmYpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElTGJ1Om; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740477492; x=1772013492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C4tUg7SiwBa8xXWRh7NwI3E2Gt08iqlKbNdN/vLD8Ms=;
  b=ElTGJ1OmNTcWtjfK5Wxljc3zZsGvFBCKL4kaU0/XvHLVu4dbNTHcf0J5
   FSzbasYP4Fssqlzbtf8SO330/LeG8DuCeOBO1Gr5G+fIKtGE/koW83e3A
   61TEAvAZA5Pq+EyZS7t2fwm/FGsEAfbJhDDcBjBtKaOrgXOt8aCtgx/Qj
   mCChBg+8T6iy0OjW7FlRXuJabZcN+Bvek0ufsIr2cheZxIkFu70zsjlMw
   YQPuySDiJYHniiCn5O9RQPuJCBcNnJ+C8jtC8ce+QtQEVXjPLYMzF5p9v
   ShV32wiVAuTcbbbsucMd9a8qMyDopqGdhZs0PIJ3z6c9ql+6BYH6VaCaK
   g==;
X-CSE-ConnectionGUID: U/s+uGSfSU2fBFmlff0Upg==
X-CSE-MsgGUID: JLJgE2EyQcu6Qm5PjVUQ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41188985"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="41188985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:58:12 -0800
X-CSE-ConnectionGUID: jnXTykRvRgWgGQ/zRDEdyQ==
X-CSE-MsgGUID: grnoM7BqS+qEv5HDeewsZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116836126"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 25 Feb 2025 01:58:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4B90044D; Tue, 25 Feb 2025 11:58:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v1 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
Date: Tue, 25 Feb 2025 11:58:04 +0200
Message-ID: <20250225095804.360899-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
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
 drivers/watchdog/Kconfig       | 3 ++-
 drivers/watchdog/nic7018_wdt.c | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..ca9e108c44e6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1730,7 +1730,8 @@ config NI903X_WDT
 
 config NIC7018_WDT
 	tristate "NIC7018 Watchdog"
-	depends on X86 && ACPI
+	depends on HAS_IOMEM
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
2.45.1.3035.g276e886db78b


