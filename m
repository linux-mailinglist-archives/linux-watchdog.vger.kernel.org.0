Return-Path: <linux-watchdog+bounces-3844-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E292AFCC49
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 15:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0121D1BC30CD
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 13:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAAD2DEA96;
	Tue,  8 Jul 2025 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUp0dder"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9032DCF78;
	Tue,  8 Jul 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981820; cv=none; b=p5q/7Ofc9+psUnWPmNhp3rhMKoa6qLYDktCc3j9nu0kKe4cBiXFEeLcSbxakJYVx0V5IzfdaK+5kzOspnXiDWzpIoYawqQUVDjLC9dQ5vbN9rVqSi1wvzaoEhWZ1eUJLAwk6oI8wJOEYhIXAYfuiy/TNBD/eZGlq/3wRkFCxybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981820; c=relaxed/simple;
	bh=emU0e9TLtejOoRZzf0+eKJu/SfyRyiWD4cDimXd+CS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN3Vy52nAQeB3HSc4KfK9v1TvivzCENgMZKhJ9dUMvIYtnX0a0v6BnrJNX/Rnzv5fTgZCT9Lz8PJe4o9RrAuM49nEWSyEEMAyqk0a8g72g/+e03UOzSD5mPGI5sXh4WHZUBLwWo7DV2OX98us0yH6GI/4cuCtkZkCMmhyAx5ciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUp0dder; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751981819; x=1783517819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=emU0e9TLtejOoRZzf0+eKJu/SfyRyiWD4cDimXd+CS8=;
  b=hUp0dderPgKIovtGt2T8dMBXzwkF2TaecUf1uED6eXxnFQAlZjhVgUKj
   obEgEVKWFpxpgB/OhlN90mFGW75vg3Te6MMEEA7mG5pENjv5yxdmQ+2pG
   b/Bfo4E6Rio+4P6Wrv9UNxemfWfnyIW5Dt8F6WQfYJRb+bTorxTtnbF2C
   Z6FEIF64McuinCcRt26xEZ5SMQ5Ide6ve5cRytMkmSH/kNxoLpLoEWndk
   FwSO5aSbAiHmC1So3MmW6H2BymrX9FmAj/s79SLAz/P8khOBHaXUXOg7W
   JU6MDAWT5llj0b4edKCM8x6xzmcUiWJvcL7xXFEcq7GnV7WHIkS/rnSTX
   Q==;
X-CSE-ConnectionGUID: Uwm0U8RXT0+eHBJcJpjoBQ==
X-CSE-MsgGUID: UJU3XrI1QJSuEnGjya5DRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65678027"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="65678027"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 06:36:53 -0700
X-CSE-ConnectionGUID: jaXyz3m4SJqv9BBP0SDnIg==
X-CSE-MsgGUID: iJp2/zGQQf6cEGjUV2twOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="154909700"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2025 06:36:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 256B95CF; Tue, 08 Jul 2025 16:36:50 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	James Hilliard <james.hilliard1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v3 2/2] watchdog: Don't use "proxy" headers
Date: Tue,  8 Jul 2025 16:33:44 +0300
Message-ID: <20250708133646.70384-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250708133646.70384-1-andriy.shevchenko@linux.intel.com>
References: <20250708133646.70384-1-andriy.shevchenko@linux.intel.com>
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
 drivers/watchdog/watchdog_core.h       |  8 +++++++-
 drivers/watchdog/watchdog_pretimeout.c |  2 ++
 include/linux/watchdog.h               | 12 ++++++++----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
index 5b35a8439e26..ab825d9f9248 100644
--- a/drivers/watchdog/watchdog_core.h
+++ b/drivers/watchdog/watchdog_core.h
@@ -24,8 +24,14 @@
  *	This material is provided "AS-IS" and at no charge.
  */
 
-#include <linux/hrtimer.h>
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/hrtimer_types.h>
+#include <linux/init.h>
 #include <linux/kthread.h>
+#include <linux/mutex_types.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
 
 #define MAX_DOGS	32	/* Maximum number of watchdog devices */
 
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index e5295c990fa1..2526436dc74d 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -7,6 +7,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/watchdog.h>
 
 #include "watchdog_core.h"
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


