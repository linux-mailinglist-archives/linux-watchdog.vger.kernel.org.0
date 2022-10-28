Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24BF610A51
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Oct 2022 08:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJ1G1d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Oct 2022 02:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ1G1c (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Oct 2022 02:27:32 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB31C1B8656
        for <linux-watchdog@vger.kernel.org>; Thu, 27 Oct 2022 23:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666938449; x=1698474449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2mHNrPW4NQnLhJCKOBl5tOMyhCZq/bh0eVYDUcaXi74=;
  b=SWJwGbZbD4mNypc5XPc15oI3bH5/cLVgxDXyC1Y/KlJlgT4vrtBKoNCA
   lCwYweDtTCCmTwLc241V7IjRK1Q08QY4brtU8aJ0oTQJdhPuGf+y14G+S
   GbmNmAZ1GTDrsr85nwLFMHoJZQVhxvlrEokr5TBgt9XDnzMi0iKCB/sEU
   ExwAouGM+8R9aUxZE112Uh92/z7Ubv6OtuowEnBHikksJDO4MeXJrr00N
   9/76pEmUeIvw4Wi1/VjQeTPK9XsYip8huygf4akBugdEy0f3hDosxvpWB
   boxv1i/jzN7zEKf9gBJoVDS1r4wiYXV/2Em+Sf+UNPA/26zQMkpOQ9TlC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="288137550"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; 
   d="scan'208";a="288137550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 23:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="696106692"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; 
   d="scan'208";a="696106692"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 27 Oct 2022 23:27:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9A358107; Fri, 28 Oct 2022 09:27:50 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     berrange@redhat.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already running
Date:   Fri, 28 Oct 2022 09:27:50 +0300
Message-Id: <20221028062750.45451-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Daniel reported that the commit 1ae3e78c0820 ("watchdog: iTCO_wdt: No
need to stop the timer in probe") makes QEMU implementation of the iTCO
watchdog not to trigger reboot anymore when NO_REBOOT flag is initially
cleared using this option (in QEMU command line):

  -global ICH9-LPC.noreboot=false

The problem with the commit is that it left the unconditional setting of
NO_REBOOT that is not cleared anymore when the kernel keeps pinging the
watchdog (as opposed to the previous code that called iTCO_wdt_stop()
that cleared it).

Fix this so that we only set NO_REBOOT if the watchdog was not initially
running.

Fixes: 1ae3e78c0820 ("watchdog: iTCO_wdt: No need to stop the timer in probe")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Hi,

I tested this with the command line Daniel provided:

      -watchdog-action poweroff \
      -global ICH9-LPC.noreboot=false

With the patch QEMU shuts down after ~60s and without it keeps running.

 drivers/watchdog/iTCO_wdt.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 34693f11385f..e937b4dd28be 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -423,14 +423,18 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
 	return time_left;
 }
 
-static void iTCO_wdt_set_running(struct iTCO_wdt_private *p)
+/* Returns true if the watchdog was running */
+static bool iTCO_wdt_set_running(struct iTCO_wdt_private *p)
 {
 	u16 val;
 
-	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
+	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is enabled */
 	val = inw(TCO1_CNT(p));
-	if (!(val & BIT(11)))
+	if (!(val & BIT(11))) {
 		set_bit(WDOG_HW_RUNNING, &p->wddev.status);
+		return true;
+	}
+	return false;
 }
 
 /*
@@ -518,9 +522,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
 	}
 
-	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
-	p->update_no_reboot_bit(p->no_reboot_priv, true);
-
 	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
 		/*
 		 * Bit 13: TCO_EN -> 0
@@ -572,7 +573,13 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(&p->wddev, p);
 	platform_set_drvdata(pdev, p);
 
-	iTCO_wdt_set_running(p);
+	if (!iTCO_wdt_set_running(p)) {
+		/*
+		 * If the watchdog was not running set NO_REBOOT now to
+		 * prevent later reboots.
+		 */
+		p->update_no_reboot_bit(p->no_reboot_priv, true);
+	}
 
 	/* Check that the heartbeat value is within it's range;
 	   if not reset to the default */
-- 
2.35.1

