Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3F02AF748
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 18:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgKKRTE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 12:19:04 -0500
Received: from mga14.intel.com ([192.55.52.115]:13067 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgKKRTE (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 12:19:04 -0500
IronPort-SDR: 3undOV416OoHutjogCUv7cPH0IWob+ixirj0vSSm3WjUd+dibECro3fEUR/QtkkfpVhE+rbnbv
 YAYOC1/SseRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="169397447"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="169397447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 09:19:04 -0800
IronPort-SDR: jyCcpDcnfcXI2GAq2/85JvFlyE381IbkT93q+qIPJmq1w2k60XqyX3syxbv3oEZIohtoFhcoRx
 lDhGbQlvbFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="541880853"
Received: from glass.png.intel.com ([172.30.181.98])
  by orsmga005.jf.intel.com with ESMTP; 11 Nov 2020 09:19:02 -0800
From:   vee.khee.wong@intel.com
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wong Vee Khee <vee.khee.wong@intel.com>
Subject: [PATCH 1/1] watchdog: wdat_wdt: Fix missing kerneldoc reported by W=1
Date:   Thu, 12 Nov 2020 01:22:05 +0800
Message-Id: <20201111172205.17215-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Wong Vee Khee <vee.khee.wong@intel.com>

Fix the following warning while compiling with W=1.

drivers/watchdog/wdat_wdt.c:48: warning: Function parameter or member 'instructions' not described in 'wdat_wdt'

Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
 drivers/watchdog/wdat_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 3065dd670a18..cec7917790e5 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -34,9 +34,9 @@ struct wdat_instruction {
  * @period: How long is one watchdog period in ms
  * @stopped_in_sleep: Is this watchdog stopped by the firmware in S1-S5
  * @stopped: Was the watchdog stopped by the driver in suspend
- * @actions: An array of instruction lists indexed by an action number from
- *           the WDAT table. There can be %NULL entries for not implemented
- *           actions.
+ * @instructions: An array of instruction lists indexed by an action number from
+ *                the WDAT table. There can be %NULL entries for not implemented
+ *                actions.
  */
 struct wdat_wdt {
 	struct platform_device *pdev;
-- 
2.17.0

