Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080647B4C36
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Oct 2023 09:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbjJBHFs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Oct 2023 03:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbjJBHFq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Oct 2023 03:05:46 -0400
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F4AB7
        for <linux-watchdog@vger.kernel.org>; Mon,  2 Oct 2023 00:05:42 -0700 (PDT)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202310020705410172e3eb3ed6c3f419
        for <linux-watchdog@vger.kernel.org>;
        Mon, 02 Oct 2023 09:05:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Zb0fFis9wFuzoVY5Rq2CsqjJ5uUfzhmUPgFsAbdeOj0=;
 b=kQx5pK5XR2LFGAhv+KdExYNYGBhk1s8fNolpw/+TEYDnTUjSdN8SlDQeicae4cL4EBIFnh
 DtnUIg+jZNxx2LRhX5qZPf9+XS4OmzqgvP/oGT9d0vwBQNI4toabbbycDKFf0kiJYdBCXRQt
 FLLB+6hu3y9MyhmiTyVNRu9GXCeqI=;
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Malin Jonsson <malin.jonsson@ericsson.com>
Subject: [PATCH 1/2] watchdog: iTCO_wdt: No need to stop the timer in probe
Date:   Mon,  2 Oct 2023 09:05:39 +0200
Message-Id: <a5f4da3744650079ea0fe8f378ae5fc7f37bc1dd.1696230340.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1696230340.git.jan.kiszka@siemens.com>
References: <cover.1696230340.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

commit 1ae3e78c08209ac657c59f6f7ea21bbbd7f6a1d4 upstream.

The watchdog core can handle pinging of the watchdog before userspace
opens the device. For this reason instead of stopping the timer, just
mark it as running and let the watchdog core take care of it.

Cc: Malin Jonsson <malin.jonsson@ericsson.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20210921102900.61586-1-mika.westerberg@linux.intel.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
---
 drivers/watchdog/iTCO_wdt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 347f0389b089..930798bac582 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -401,6 +401,16 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
 	return time_left;
 }
 
+static void iTCO_wdt_set_running(struct iTCO_wdt_private *p)
+{
+	u16 val;
+
+	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
+	val = inw(TCO1_CNT(p));
+	if (!(val & BIT(11)))
+		set_bit(WDOG_HW_RUNNING, &p->wddev.status);
+}
+
 /*
  *	Kernel Interfaces
  */
@@ -537,8 +547,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(&p->wddev, p);
 	platform_set_drvdata(pdev, p);
 
-	/* Make sure the watchdog is not running */
-	iTCO_wdt_stop(&p->wddev);
+	iTCO_wdt_set_running(p);
 
 	/* Check that the heartbeat value is within it's range;
 	   if not reset to the default */
-- 
2.35.3

