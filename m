Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55E0A7B4C34
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Oct 2023 09:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjJBHFs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Oct 2023 03:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235684AbjJBHFq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Oct 2023 03:05:46 -0400
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC8FB3
        for <linux-watchdog@vger.kernel.org>; Mon,  2 Oct 2023 00:05:41 -0700 (PDT)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20231002070541d6d29fe43c22c73e16
        for <linux-watchdog@vger.kernel.org>;
        Mon, 02 Oct 2023 09:05:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Rv4hUMKk2v8xsK+vx7AN42bMv3pzRiwWQuC3GPbDA5M=;
 b=XzO7tUyJCjKMbIYz4EzYkdkh47OhFL8qR5KHoIeuV6ZKX3zt1MDd2QsCeMtDm0XjZB04wN
 LMQ5APGDuZQc+1MyXbfrUt9k+K4sylUR8vqaIzclFNv6thSZjGYwpPvUhNePhQ26aTBQcih6
 PDNt3gJqnmVShyxvjMBxbWK/asqek=;
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/2] watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already running
Date:   Mon,  2 Oct 2023 09:05:40 +0200
Message-Id: <b4d2c0e6559b1d0f9fada5076336ac01882883ad.1696230340.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1696230340.git.jan.kiszka@siemens.com>
References: <cover.1696230340.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

commit ef9b7bf52c2f47f0a9bf988543c577b92c92d15e upstream.

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
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20221028062750.45451-1-mika.westerberg@linux.intel.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
---
 drivers/watchdog/iTCO_wdt.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 930798bac582..5ec52032117a 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -401,14 +401,18 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
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
@@ -486,9 +490,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
 	}
 
-	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
-	p->update_no_reboot_bit(p->no_reboot_priv, true);
-
 	/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
 	if (!devm_request_region(dev, p->smi_res->start,
 				 resource_size(p->smi_res),
@@ -547,7 +548,13 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
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
2.35.3

