Return-Path: <linux-watchdog+bounces-1819-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FC9719E6
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 14:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B10FB22BAF
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 12:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310351B86C5;
	Mon,  9 Sep 2024 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxaDbosF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A681B81DA;
	Mon,  9 Sep 2024 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886222; cv=none; b=odO7Qio17Vs19Lm+y16c4x9gxadaAdQRbfd5wM1zyOiX0VWPw5HIwtIldAQKAs2OmFkYBkG7D4r9AkMGTOmi7HcCXnIibvnUH6/VkL4x/VXzVrZ1/KyngfJtefL89iFcmLXtEvx3XG/BSrgvA3IHVLW1pEYAbpcoT34/Tti/iZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886222; c=relaxed/simple;
	bh=ktQqty7CmANhdnN8FgKIYwj7UnEZc2yb3ojL3kABXug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZfJeLLBt+GjHAgpH2zexBDsQTE5iZ0rC+pYi/Y8fqQONbaJIlA9NQwOk3N/ZdZRirJDEHsn+ICi7OSG6UAfEph+nrfOkt2mauMjAFMlvCC9gR0hzZTBzkSJSjddHlyiJ17lA6BZ+Xl+3AE2zPbcM5DpIn1SAkIVQ0eo6E1fP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxaDbosF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725886221; x=1757422221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktQqty7CmANhdnN8FgKIYwj7UnEZc2yb3ojL3kABXug=;
  b=JxaDbosFzQOq1mlR/M+G8saZdL3AyQO2YPc3ZelkcpGY7c6DJEWs8jkB
   VZLBUFw19+ZpG+14tR3zq/mL2muLopq1+IXfijJ/NWZZrIpaPt1ecLNdv
   GK+iAZiLnoCSpQehzEf+5cQG4MbqyIsEHI8QXXSaeMGn3mqz6DWzeMdUe
   UVXXGx8DhWg7e8qS+MHr6++DpHictpBm1OqTLfkU9wJrxQmIPJCnW0t1/
   AXrjfTSClIAg/2lR+87DsDmzBANQQ2AWpmUJzWA5Va44On/vQ8Z7zufwn
   goAG2hZfRPkVtclQofSvq6tGcl4aKkQivEozmXZHXYD9w09UlsJfTkfTG
   Q==;
X-CSE-ConnectionGUID: Vsh/yVKtSwqtnaaY2/XsNQ==
X-CSE-MsgGUID: blTqPvLxSuu3Ww/dpdUdwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24079056"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24079056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:50:04 -0700
X-CSE-ConnectionGUID: aKS2/vUES9enluGbQoGpsw==
X-CSE-MsgGUID: z9Ezr8y5SiWreVR33K+HPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97470224"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 05:49:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0559218D; Mon, 09 Sep 2024 15:49:56 +0300 (EEST)
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
Subject: [PATCH v2 1/3] MAINTAINERS: Add Intel MID section
Date: Mon,  9 Sep 2024 15:41:04 +0300
Message-ID: <20240909124952.1152017-2-andriy.shevchenko@linux.intel.com>
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

The different drivers are spread over the kernel.
I would like to be informed about the changes in them, which
are done not by me. Also, most of them I indeed support.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10430778c998..61c74ae39961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11477,6 +11477,24 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-intel-m10-bmc-sec-update
 F:	drivers/fpga/intel-m10-bmc-sec-update.c
 
+INTEL MID (Mobile Internet Device) PLATFORM
+M:	Andy Shevchenko <andy@kernel.org>
+L:	linux-kernel@vger.kernel.org
+S:	Supported
+F:	arch/x86/include/asm/intel-mid.h
+F:	arch/x86/include/asm/intel_scu_ipc.h
+F:	arch/x86/pci/intel_mid_pci.c
+F:	arch/x86/platform/intel-mid/
+F:	drivers/extcon/extcon-intel-mrfld.c
+F:	drivers/iio/adc/intel_mrfld_adc.c
+F:	drivers/mfd/intel_soc_pmic_mrfld.c
+F:	drivers/platform/x86/intel/mrfld_pwrbtn.c
+F:	drivers/platform/x86/intel_scu_*
+F:	drivers/staging/media/atomisp/
+F:	drivers/watchdog/intel-mid_wdt.c
+F:	include/linux/mfd/intel_soc_pmic_mrfld.h
+F:	include/linux/platform_data/intel-mid_wdt.h
+
 INTEL P-Unit IPC DRIVER
 M:	Zha Qipeng <qipeng.zha@intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0.rc1.1336.g36b5255a03ac


