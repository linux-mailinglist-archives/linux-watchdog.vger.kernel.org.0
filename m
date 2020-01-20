Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 439221426E8
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jan 2020 10:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgATJRh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jan 2020 04:17:37 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41285 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgATJRh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jan 2020 04:17:37 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1itTBc-0005op-C8; Mon, 20 Jan 2020 10:17:32 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1itTBb-0000TQ-SF; Mon, 20 Jan 2020 10:17:31 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] watchdog: da9062: do not ping the hw during stop()
Date:   Mon, 20 Jan 2020 10:17:29 +0100
Message-Id: <20200120091729.16256-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The da9062 hw has a minimum ping cool down phase of at least 200ms. The
driver takes that into account by setting the min_hw_heartbeat_ms to
300ms and the core guarantees that the hw limit is observed for the
ping() calls. But the core can't guarantees the required minimum ping
cool down phase if a stop() command is send immediately after the ping()
command. So it is not allowed to ping the watchdog within the stop()
command as the driver do. Remove the ping can be done without doubts
because the watchdog gets disabled anyway and a (re)start reset the
watchdog counter too.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/watchdog/da9062_wdt.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 77b6b5336067..0ad15d55071c 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -97,13 +97,6 @@ static int da9062_wdt_stop(struct watchdog_device *wdd)
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
 	int ret;
 
-	ret = da9062_reset_watchdog_timer(wdt);
-	if (ret) {
-		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err = %d)\n",
-			ret);
-		return ret;
-	}
-
 	ret = regmap_update_bits(wdt->hw->regmap,
 				 DA9062AA_CONTROL_D,
 				 DA9062AA_TWDSCALE_MASK,
-- 
2.20.1

