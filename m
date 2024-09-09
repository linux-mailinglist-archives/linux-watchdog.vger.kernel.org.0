Return-Path: <linux-watchdog+bounces-1820-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C749719EA
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 14:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B87284FAE
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 12:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D7C1B9B20;
	Mon,  9 Sep 2024 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMCybx6d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37271AD9EA;
	Mon,  9 Sep 2024 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886223; cv=none; b=lmgx0FKkw9nr9BqR2lNwsjPdPE/P4HZZOSfiRhvoCLPj5BnS23X02Urexijr0ZkFDmHkJVINdWJQ1zF9WQ9/qPH0xrcjkXMiOGwPOp3o/r6MkPTfc+a5icv8t2Gf2NRh30x7vEBj3V2RbCGe80m+0bB65TA8pr6cIT+zWNKknGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886223; c=relaxed/simple;
	bh=1RukBZw68MThfKPTePNTcy9HFsZa+40HD7vkknVQzVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/qon3JpseGAqVf7r5DguhmN604vEyeoK6SwCYtV8QPr/BQSW6udn/AWQ6JQdJh81ft/odPUfJVIsiR/s7PxLDlGEKsJ028Cpo4yyJj1+fqRRardVEChhiUVKH6rsT9zI/fiBNqcBtUsLWklpLIoqKXPPQwaH8A9UwbiTUao4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMCybx6d; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725886222; x=1757422222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1RukBZw68MThfKPTePNTcy9HFsZa+40HD7vkknVQzVI=;
  b=EMCybx6dE0q/nFKJqDoDalvWXA0iv6JNIfGhy5VzahMtKFLPkxvk6348
   RnUZcKJnaMLEORCe3Q26Gt5WpZbdP2796MzSszHzPBtQ/v1DtakYuuaKW
   zjzPJ5Eaj/2NZ6cRc3qP3QoJ7ymMw59R5o5VWmG0wT2Ls4j2kLKpXSuTv
   WxHVOTdzupzmHSY3x/FI6JYz24M1y0qtZLiXkOzxEe6QakrvoNcusGxAW
   DpP5PlCQX2cNu5fG+4gQn2yeduVoeHipwR9mVCqviapNJmeEomvyqFJ1f
   GyKbP2T3GNUwPKqzkB4/D035oRoITYb+LhYkp70nuvqY5rFrm+pMqcUY2
   Q==;
X-CSE-ConnectionGUID: Iw5QU/XgTUC/IvV/2vnTLw==
X-CSE-MsgGUID: HVv4liRoSqq7ntO+2cAezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24079079"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24079079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:50:04 -0700
X-CSE-ConnectionGUID: bJSvXvWtQiCd1zHPjHCsPw==
X-CSE-MsgGUID: nl08P0dvRTmAUvmS+fulLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97470234"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 05:49:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1E0183FC; Mon, 09 Sep 2024 15:49:57 +0300 (EEST)
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
Subject: [PATCH v2 3/3] platform/x86: intel_scu_wdt: Move intel_scu_wdt.h to x86 subfolder
Date: Mon,  9 Sep 2024 15:41:06 +0300
Message-ID: <20240909124952.1152017-4-andriy.shevchenko@linux.intel.com>
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

This is a platform/x86 library that can only be used on x86 devices.
so it makes sense that it lives under the platform_data/x86/ directory
instead.

No functional changes intented.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_wdt.c                  | 3 ++-
 drivers/watchdog/intel-mid_wdt.c                      | 2 +-
 include/linux/platform_data/{ => x86}/intel-mid_wdt.h | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)
 rename include/linux/platform_data/{ => x86}/intel-mid_wdt.h (74%)

diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
index d0b6637861d3..746d47d33406 100644
--- a/drivers/platform/x86/intel_scu_wdt.c
+++ b/drivers/platform/x86/intel_scu_wdt.c
@@ -9,13 +9,14 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/intel-mid_wdt.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/io_apic.h>
 #include <asm/hw_irq.h>
 
+#include <linux/platform_data/x86/intel-mid_wdt.h>
+
 #define TANGIER_EXT_TIMER0_MSI 12
 
 static struct platform_device wdt_dev = {
diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
index 91c9c3950e44..756d262dc580 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 #include <linux/watchdog.h>
 
-#include <linux/platform_data/intel-mid_wdt.h>
+#include <linux/platform_data/x86/intel-mid_wdt.h>
 #include <linux/platform_data/x86/intel_scu_ipc.h>
 
 #define IPC_WATCHDOG 0xf8
diff --git a/include/linux/platform_data/intel-mid_wdt.h b/include/linux/platform_data/x86/intel-mid_wdt.h
similarity index 74%
rename from include/linux/platform_data/intel-mid_wdt.h
rename to include/linux/platform_data/x86/intel-mid_wdt.h
index 8dba70b4b020..e5c0210d0fec 100644
--- a/include/linux/platform_data/intel-mid_wdt.h
+++ b/include/linux/platform_data/x86/intel-mid_wdt.h
@@ -6,8 +6,8 @@
  *      Contact: David Cohen <david.a.cohen@linux.intel.com>
  */
 
-#ifndef __INTEL_MID_WDT_H__
-#define __INTEL_MID_WDT_H__
+#ifndef __PLATFORM_X86_INTEL_MID_WDT_H_
+#define __PLATFORM_X86_INTEL_MID_WDT_H_
 
 #include <linux/platform_device.h>
 
@@ -16,4 +16,4 @@ struct intel_mid_wdt_pdata {
 	int (*probe)(struct platform_device *pdev);
 };
 
-#endif /*__INTEL_MID_WDT_H__*/
+#endif	/* __PLATFORM_X86_INTEL_MID_WDT_H_ */
-- 
2.43.0.rc1.1336.g36b5255a03ac


