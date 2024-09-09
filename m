Return-Path: <linux-watchdog+bounces-1821-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF49719EB
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 14:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 828F02853CB
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 12:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432F01B9B37;
	Mon,  9 Sep 2024 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZafzdWSQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CDF1B86D3;
	Mon,  9 Sep 2024 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886224; cv=none; b=LxDNZwwH/KTp93qwOimuk9PuGwfuTT2pPjqCkpBRk7nm6ej+oB8bE90xPPk57CQB/v1IiZpp02fIM7VdjgGAND9s7BmvvDBl3PaPtAlAYKb4PqlVCi+6+HtSvg3P/vRE01W7XDqnWrjRtC5vdhwuKe/G6FIFf5W/eZRTPoqIiAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886224; c=relaxed/simple;
	bh=KWYespF+mcQwqISVVXzv9T2zQplfsj431bxXbvKt39o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GEaWhTatHMPTXQBls71j8afFJN6EiStVgYH5wG8sczFOG4CtJJ+qaLFXT6MQ2WaQBEXu6idjWV+8eqSnySPZFyKpm5xO8mxtPUFLBgE4vLqX1Of5GJS+Q6VOVJ8eEcLfFBnZi0kciaEPiwlheQM0Pyzut3qOq7dry4lWvXlqtGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZafzdWSQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725886223; x=1757422223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KWYespF+mcQwqISVVXzv9T2zQplfsj431bxXbvKt39o=;
  b=ZafzdWSQF+zEWjDUDmTmf85z5kkdw+s1pKV2/FBJP/n0Nn/K2KY5sA1Z
   IEUXCM68FYRrJ+KU7HrexCx/vZBmM30+sSvp0OwDdLhOtJv+8Pzv/mEtq
   ugGyyVnZ9YptSWlfRu3+fQjF+3PJUVFFxOnYtGMyS5WtB55AkltaGnrko
   MDgdRBMor33D7g3yrizD2HrjscZqIJxHIezAODFs0A1cc5ik6Y5e9EvZu
   3wBwSSLJjDQOK8p7hEWzcMXHBXO1UOMxuLJTsXY7Ik5mn5w4ebqLrAzAM
   1QxgveusaG7XtORXu5hlRuPq3iGs4w8WSUk+JUJSKhzxh5lLLZ0ELNj/t
   g==;
X-CSE-ConnectionGUID: 1BMZ9U31SPm44MxQXT3x6A==
X-CSE-MsgGUID: ZWVytuzpSPuuaQws/4WGmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24079104"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24079104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:50:05 -0700
X-CSE-ConnectionGUID: vx5aSnBRQneWiQsSzpk30A==
X-CSE-MsgGUID: Hc3TVcRKRKK+K5Fxc3MKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97470243"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 05:49:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E351C321; Mon, 09 Sep 2024 15:49:56 +0300 (EEST)
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
Subject: [PATCH v2 0/3] platform/x86: intel_scu: Move headers to x86 subfolder
Date: Mon,  9 Sep 2024 15:41:03 +0300
Message-ID: <20240909124952.1152017-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the record to the MAINTAINERS to follow what is going on with the
Intel MID platform related code and drivers.

With that, clean up a bit a couple of headers, i.e. move them to x86
subfolder of include/linux/platform_data where they belong to.

No functional changes intended.

Taking into account nature of this change it's supposed to go via PDx86
tree, please Ack.

v2:
- Maintained --> Supported (Dave)
- added two cleanup patches (Mika and me)

Andy Shevchenko (2):
  MAINTAINERS: Add Intel MID section
  platform/x86: intel_scu_wdt: Move intel_scu_wdt.h to x86 subfolder

Mika Westerberg (1):
  platform/x86: intel_scu_ipc: Move intel_scu_ipc.h out of
    arch/x86/include/asm

 MAINTAINERS                                   | 20 ++++++++++++++++++-
 arch/x86/include/asm/intel_telemetry.h        |  2 +-
 arch/x86/platform/intel-mid/intel-mid.c       |  3 ++-
 drivers/mfd/intel_pmc_bxt.c                   |  3 +--
 drivers/mfd/intel_soc_pmic_bxtwc.c            |  3 +--
 drivers/mfd/intel_soc_pmic_mrfld.c            |  3 +--
 drivers/platform/x86/intel_scu_ipc.c          |  2 +-
 drivers/platform/x86/intel_scu_ipcutil.c      |  2 +-
 drivers/platform/x86/intel_scu_pcidrv.c       |  2 +-
 drivers/platform/x86/intel_scu_pltdrv.c       |  2 +-
 drivers/platform/x86/intel_scu_wdt.c          |  3 ++-
 drivers/usb/typec/mux/intel_pmc_mux.c         |  3 +--
 drivers/watchdog/intel-mid_wdt.c              |  5 ++---
 .../platform_data/{ => x86}/intel-mid_wdt.h   |  6 +++---
 .../linux/platform_data/x86}/intel_scu_ipc.h  |  4 ++--
 15 files changed, 39 insertions(+), 24 deletions(-)
 rename include/linux/platform_data/{ => x86}/intel-mid_wdt.h (74%)
 rename {arch/x86/include/asm => include/linux/platform_data/x86}/intel_scu_ipc.h (96%)

-- 
2.43.0.rc1.1336.g36b5255a03ac


