Return-Path: <linux-watchdog+bounces-3842-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA2AFCC43
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 15:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AE761620EF
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 13:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A57A22F75B;
	Tue,  8 Jul 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnDN/PoR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1A217722;
	Tue,  8 Jul 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981815; cv=none; b=SBznZS4JVFoZQG3NpTpYrTgZSdXHNwKCwyW3WBb47oQc2f0bY1DoyYy4AD37J5PAJyCk3qb9lgPNqEJOtxGzNBaKrohS+0gp2BDTeMcMetI1U51ful1REmACgK1DnM4dD6XCtjcTvY/Oc+kSVO5vE0ByCbWN6c2Uzr5vxjBNP+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981815; c=relaxed/simple;
	bh=50UZDKGimleLKJFh2vUS3FzJCx9uIonSknEzUu1iAFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fi5JQ7+yXAxKLlzzxcW0evdzZgRpuda0Umg5ATMA+a6xU246ey2jiin1cOsIpvJuC179cQGLwAsfVyxWjc8gXqyxQVaELjuYk1foZrpjcKe5CtIY020ZNBWIxaG9HIly7T3LpjLUgFkykOo+h42/GCstTOVV/M0aeOwRN0noB7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnDN/PoR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751981814; x=1783517814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=50UZDKGimleLKJFh2vUS3FzJCx9uIonSknEzUu1iAFI=;
  b=jnDN/PoRiuKra9KZTGfagcW/dUiBYNJlKql6dL2VHbFoEr0sjnKfnc49
   8bj/vWFMj3/tnnMuPdzJNzD32wpGU+bNmjdzp5Cg4HC/kTEvJl/x8AfSE
   RL8ORiBlt9duqioaIgVP80aTRCHO44ZIgDZFdxOGgATI6goS8mg/fdrqj
   90ns2lN27VXBJ2ARmElgxuISI5cmu6AaG2Nxid7v2+7g9hCihf2KqwnbF
   oDx9WL99wD5lLVc7wM7JajmQCDSxFdGlhhXEXMBsWeBKNmQVDCKYn5jbS
   DU65tVQnbsX13uuqwtqQdQJQm1YgfqIacyH+QqlTB0qjpeDxnp9i/2ADd
   Q==;
X-CSE-ConnectionGUID: ygWAFElsRZiYIkxVKhQySg==
X-CSE-MsgGUID: 02bkXVO4T3+qh4+mZ2DxiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54192428"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="54192428"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 06:36:53 -0700
X-CSE-ConnectionGUID: /zdv3SMFTU6UT00hVMNIbw==
X-CSE-MsgGUID: iVlmu7L9QHq3qUFZT7nnSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="186518368"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 08 Jul 2025 06:36:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 93A951DF; Tue, 08 Jul 2025 16:36:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	James Hilliard <james.hilliard1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v3 1/2] watchdog: it87_wdt: Don't use "proxy" headers
Date: Tue,  8 Jul 2025 16:33:43 +0300
Message-ID: <20250708133646.70384-2-andriy.shevchenko@linux.intel.com>
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
 drivers/watchdog/it87_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index a1e23dce8810..3b8488c86a2f 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -22,11 +22,13 @@
 
 #include <linux/bits.h>
 #include <linux/dmi.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/kernel.h>
+#include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
 
-- 
2.47.2


