Return-Path: <linux-watchdog+bounces-3738-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B99AEA3E0
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 18:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 098AB4E4774
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 16:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E4D2ECEA6;
	Thu, 26 Jun 2025 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXqY4ne+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59402E4262;
	Thu, 26 Jun 2025 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956711; cv=none; b=nrjlVa99rzsADl8Jl5jt+16/L630SDidnmi/SmORms0L2ryZ97rd9a0VVhEexX6j50fPffJ2SDD/UJglQId4Momp75rj8PUvzQ1WmSH/y+O7r7B4wAf01PAJh/1VGbFKA+VEFBoHE1QGDFOcuAPIxTvgqVbzMIriTzbK7djL0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956711; c=relaxed/simple;
	bh=wqBh7X5xKktV9DzTlUGgy5dCWpsRDu8oey1YYIW7dXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qY3d0Ro402I3FzuahmnsxeVAgwFPRCEieiCS3EjdsDTalFUVYrSmBKjtJBJair8mORGEqYSRET53oSMvU859d6S17XiOeow+CK1TuaPr+hVtM25y12GVI0ptX2ywxl8PYTj3RdaPi1bEHgIsxr3qOwHi0oUg5zeuWYmlzak2QGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXqY4ne+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750956710; x=1782492710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wqBh7X5xKktV9DzTlUGgy5dCWpsRDu8oey1YYIW7dXQ=;
  b=PXqY4ne+TDNdRdp5QiTGV/1d0V5pRiObolwyAfM4wvBe97yX7i8Fws77
   If/Fot0NLlplG+D6daHksS1e3Xq+/zu145YbZ10Bkn0cUrgx4CxcCIlgO
   BHJWqX0LM9S9ygjT4FDlWFodyK+MIxubs//l7jlJndi+1sfFq/wTd9//M
   dALcT3xS+YxOqJsTeOXkCkX17tjkrdikgU/D8x94nTPLmTPhWXK/WtGOd
   X5O+GbXDAm6Yf0UWvG91eM+d2wTOgzFWwPQHfCDx3A12fTEn7/PmRWt+b
   5H1RqKbrfysWMyewGS8w7Dx/LfvIiIy0l+4m6SJ+MOYIxGoAQihsVUDUv
   w==;
X-CSE-ConnectionGUID: JXcIeWEzTqG/+e2gpLXU/w==
X-CSE-MsgGUID: lrMFUO+aQ12uI5mihCAK/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53126376"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53126376"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:51:50 -0700
X-CSE-ConnectionGUID: 2uH59PzYQKiYi3aXAPTtrw==
X-CSE-MsgGUID: ST9AsRyOTL6uXjlTB3Tz7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152673554"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 09:51:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 96CF42AD; Thu, 26 Jun 2025 19:51:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 1/1] watchdog: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 19:51:45 +0300
Message-ID: <20250626165145.327685-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/watchdog.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 99660197a36c..8c60687a3e55 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -9,14 +9,18 @@
 #ifndef _LINUX_WATCHDOG_H
 #define _LINUX_WATCHDOG_H
 
-
 #include <linux/bitops.h>
-#include <linux/cdev.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/notifier.h>
+#include <linux/printk.h>
+#include <linux/types.h>
+
 #include <uapi/linux/watchdog.h>
 
+struct attribute_group;
+struct device;
+struct module;
+
 struct watchdog_ops;
 struct watchdog_device;
 struct watchdog_core_data;
-- 
2.47.2


