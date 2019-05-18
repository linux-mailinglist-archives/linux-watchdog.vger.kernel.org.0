Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346BC2250B
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbfERV2L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:11 -0400
Received: from sauhun.de ([88.99.104.3]:35782 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729196AbfERV2L (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:11 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 9442C2C05C1;
        Sat, 18 May 2019 23:28:09 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 03/46] watchdog: aspeed_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:18 +0200
Message-Id: <20190518212801.31010-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The core will print out details now.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/aspeed_wdt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 34117745c65f..3ad2558a6de0 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -313,13 +313,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
-	ret = devm_watchdog_register_device(dev, &wdt->wdd);
-	if (ret) {
-		dev_err(dev, "failed to register\n");
-		return ret;
-	}
-
-	return 0;
+	return devm_watchdog_register_device(dev, &wdt->wdd);
 }
 
 static struct platform_driver aspeed_watchdog_driver = {
-- 
2.19.1

