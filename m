Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A9B4CAA6
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2019 11:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730660AbfFTJWR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Jun 2019 05:22:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:60030 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730596AbfFTJWR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Jun 2019 05:22:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 02:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
   d="scan'208";a="154062397"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2019 02:22:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id AE791162; Thu, 20 Jun 2019 12:22:13 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: wdat_wdt: Convert to use SPDX identifier
Date:   Thu, 20 Jun 2019 12:22:13 +0300
Message-Id: <20190620092213.4551-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This gets rid of the unnecessary license boilerplate.

No functional changes intended.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/watchdog/wdat_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 430ee4e9b185..476f79ccb6cf 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ACPI Hardware Watchdog (WDAT) driver.
  *
  * Copyright (C) 2016, Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/acpi.h>
-- 
2.20.1

