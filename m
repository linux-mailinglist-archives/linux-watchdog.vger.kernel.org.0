Return-Path: <linux-watchdog+bounces-3742-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE8AEB036
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 09:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EEE71C2213D
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 07:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5705B21771A;
	Fri, 27 Jun 2025 07:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWsRnThV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C77721638D;
	Fri, 27 Jun 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009880; cv=none; b=W+UpWXLic59juikbvZThiEs5PE/q8hdVMnDtFGsOC4PtULRCl7YHEg3745foEKO6uBwlKze88h/mQ8p7zKPjSORpulsliBfj6rbSfm7dF/XqxQxcOpMTMUGwhHN58LinVL/bFcbxDLERJiMrWGzp+A7scDcq//+8Tk8bHbjrWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009880; c=relaxed/simple;
	bh=ZKB3Ocbz8DgLXZ2egB4rTZT2kqhk/i1KjfOjxojdDAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHFqnAlnM3zIfAWKxbzQFg1XH+YSJyU7Rb1O4EyFPg0VmzuudPDSRzhIHasrlZZfugonA7hxusaAC7HruBT4KDTLEzCH2IjSLlSG5H+PKaNXCwBhEA40gG/Z43V8BPzxY8f7cnTOp5uIPvWz39KNvrD2XV7U1S6nitjrAsdqgUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWsRnThV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751009878; x=1782545878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKB3Ocbz8DgLXZ2egB4rTZT2kqhk/i1KjfOjxojdDAA=;
  b=hWsRnThVnbI12sXOmw5rcCWAcSTV1YFil10Z2UM0KyCSAxfOtGl7BeQZ
   TSRDKPCPKkMiJjzBy9eAhgxnTkwN/XCjXBGW3MGDSivmoFvTWNkIwTJFK
   CblVygMtPJSHL6H+ihNgHeYfLuUXm+Arv4iNDJfEnDxWQ58LlXNqRfVoK
   7H0C8XMTchnnw/Zr7prFNcLxZtgvO7IH+9tMnqTjeefiyYfzAJN6BCccD
   Y9AhqnMNOubjOV+iFd3OsU6hyNk3Qzc5TBv7Rn0Do0Unsy6GJ5CMi1BAf
   R3d391YSw9fRhfEYoh1HMeHaMJO50iZaO6qHDlrHGmWcT1bp2MHsLGFr9
   w==;
X-CSE-ConnectionGUID: XTKcF84mSw+toVnY6PfBDA==
X-CSE-MsgGUID: grvFbrHaTgKkVPno7ynypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64757329"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="64757329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:37:58 -0700
X-CSE-ConnectionGUID: 49PlB93CQd+O2gpNR3uAVA==
X-CSE-MsgGUID: RS9KsFB8RNG4Tr1NvwgCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157023274"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jun 2025 00:37:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AF7892AD; Fri, 27 Jun 2025 10:37:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/1] watchdog: Don't use "proxy" headers
Date: Fri, 27 Jun 2025 10:37:22 +0300
Message-ID: <20250627073753.589509-1-andriy.shevchenko@linux.intel.com>
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

v2: fixed multiple compilation errors (LKP)

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


