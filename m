Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6C140F5B7
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 12:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242266AbhIQKQy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 06:16:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:45312 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242724AbhIQKQy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 06:16:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="308312285"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="308312285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2021 03:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="453258081"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 Sep 2021 03:15:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id ADD7E430; Fri, 17 Sep 2021 13:15:33 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Malin Jonsson <malin.jonsson@ericsson.com>, john.jacques@intel.com,
        linux-watchdog@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] watchdog: iTCO_wdt: Leave running if the watchdog core ping thread is enabled
Date:   Fri, 17 Sep 2021 13:15:33 +0300
Message-Id: <20210917101533.9722-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog core can handle pinging of the watchdog before userspace
gets control so we can take advantage of that in iTCO_wdt. This also
allows users to disable the watchdog core ping thread by passing
watchdog.handle_boot_enabled=0 in the kernel command line if needed.

To avoid any unexpected resets we keep the existing functionality of
stopping the watchdog on probe if the watchdog core ping thread is not
enabled in the Kconfig (CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=n).

Cc: Malin Jonsson <malin.jonsson@ericsson.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/watchdog/iTCO_wdt.c | 42 ++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 643c6c2d0b72..234494c03df3 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -430,6 +430,27 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
 	return time_left;
 }
 
+static bool iTCO_wdt_set_running(struct iTCO_wdt_private *p)
+{
+	/*
+	 * If the watchdog core is enabled to handle pinging the
+	 * watchdog before userspace takes control we can leave the
+	 * hardware as is.
+	 */
+	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
+		u16 val;
+
+		/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
+		val = inw(TCO1_CNT(p));
+		if (!(val & BIT(11)))
+			set_bit(WDOG_HW_RUNNING, &p->wddev.status);
+
+		return true;
+	}
+
+	return false;
+}
+
 /*
  *	Kernel Interfaces
  */
@@ -572,15 +593,20 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(&p->wddev, p);
 	platform_set_drvdata(pdev, p);
 
-	/* Make sure the watchdog is not running */
-	iTCO_wdt_stop(&p->wddev);
+	if (!iTCO_wdt_set_running(p)) {
+		/* Make sure the watchdog is not running */
+		iTCO_wdt_stop(&p->wddev);
 
-	/* Check that the heartbeat value is within it's range;
-	   if not reset to the default */
-	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
-		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
-		dev_info(dev, "timeout value out of range, using %d\n",
-			WATCHDOG_TIMEOUT);
+		/*
+		 * Check that the heartbeat value is within it's range;
+		 * if not reset to the default.
+		 */
+		if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
+			iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
+			dev_info(p->wddev.parent,
+				 "timeout value out of range, using %d\n",
+				 WATCHDOG_TIMEOUT);
+		}
 	}
 
 	watchdog_stop_on_reboot(&p->wddev);
-- 
2.33.0

