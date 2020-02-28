Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8A41739C4
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2020 15:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgB1OYR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Feb 2020 09:24:17 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47642 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgB1OYQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Feb 2020 09:24:16 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SENwnb053696;
        Fri, 28 Feb 2020 08:23:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582899838;
        bh=gFf3iMUyi6ZJJ+RWZCMBD5YGM1y98+HWlMtKDjZYE1Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zPcTgXaRJ4JSp2y+F2uLiZGqv66FBx3oqcAII53m4HNVo+ldnrWpdRD7ilZSxNzPE
         XMhIk/xBP0wf1mqMtHfRsl0PJ+O+n2uBoR4SDYtcdfMXowWO3QNWuEmRIF1AsmWsSl
         2X4RBKbvlN8ShzaDTjpefWZ021tSta/6y5XdPR7c=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SENv7G086299;
        Fri, 28 Feb 2020 08:23:57 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 08:23:46 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 08:23:46 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SENf40049600;
        Fri, 28 Feb 2020 08:23:45 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] watchdog: add support for resetting keepalive timers at start
Date:   Fri, 28 Feb 2020 16:23:29 +0200
Message-ID: <20200228142331.13716-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228142331.13716-1-t-kristo@ti.com>
References: <20200228142331.13716-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Current watchdog core pets the timer always after the initial keepalive
time has expired from boot-up. This is incorrect for certain timers that
don't like to be petted immediately when they are started, if they have
not been running over the boot.

To allow drivers to reset their keepalive timers during startup, add
a new watchdog flag to the api, WDOG_RESET_KEEPALIVE.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/watchdog/watchdog_dev.c | 2 ++
 include/linux/watchdog.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 8b5c742f24e8..131e40c21703 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -283,6 +283,8 @@ static int watchdog_start(struct watchdog_device *wdd)
 		set_bit(WDOG_ACTIVE, &wdd->status);
 		wd_data->last_keepalive = started_at;
 		watchdog_update_worker(wdd);
+		if (test_bit(WDOG_RESET_KEEPALIVE, &wdd->status))
+			wd_data->last_hw_keepalive = started_at;
 	}
 
 	return err;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 417d9f37077a..b56e3f1b1ec3 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -116,6 +116,7 @@ struct watchdog_device {
 #define WDOG_STOP_ON_REBOOT	2	/* Should be stopped on reboot */
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
+#define WDOG_RESET_KEEPALIVE	5	/* Reset keepalive timers at start */
 	struct list_head deferred;
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
