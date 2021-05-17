Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6508F383B9E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241685AbhEQRvZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:51:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:14146 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241517AbhEQRvY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:51:24 -0400
IronPort-SDR: RUocIHZAk5rsuOCKJtcEk5usWCd4+LoWGYwfmSKrqgloa43pGxLKx0zSicrODirbMadj4NqG9k
 KThlT0BrRK2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180803224"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="180803224"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:50:07 -0700
IronPort-SDR: blH80mSRAc1im9p1PVj7wRzarQfHPGaRFLDczeKbnxvGvouT2mad/W2Z/CuxftxWmvVk3MjhCB
 mkBdVE00LP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="460394077"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 10:50:03 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH v2 3/9] watchdog: keembay: Update pretimeout to zero in the TH ISR
Date:   Mon, 17 May 2021 23:19:47 +0530
Message-Id: <20210517174953.19404-4-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517174953.19404-1-shruthi.sanil@intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

The pretimeout has to be updated to zero during the ISR of the
ThresHold interrupt. Else the TH interrupt would be triggerred for
every tick until the timeout.

Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>
---
 drivers/watchdog/keembay_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
index b2afeb4a60e3..6053416b8d3d 100644
--- a/drivers/watchdog/keembay_wdt.c
+++ b/drivers/watchdog/keembay_wdt.c
@@ -154,6 +154,8 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
 	struct keembay_wdt *wdt = dev_id;
 	struct arm_smccc_res res;
 
+	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
+
 	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
 	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
 	watchdog_notify_pretimeout(&wdt->wdd);
-- 
2.17.1

