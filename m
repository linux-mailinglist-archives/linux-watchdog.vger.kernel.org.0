Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F3422524
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbfERV2W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:22 -0400
Received: from sauhun.de ([88.99.104.3]:35850 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729620AbfERV2W (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:22 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id BBF6B2C28E9;
        Sat, 18 May 2019 23:28:20 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andreas Werner <andreas.werner@men.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 24/46] watchdog: menf21bmc_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:39 +0200
Message-Id: <20190518212801.31010-25-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/menf21bmc_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/menf21bmc_wdt.c b/drivers/watchdog/menf21bmc_wdt.c
index b1dbff553cdc..ab9b20c9608f 100644
--- a/drivers/watchdog/menf21bmc_wdt.c
+++ b/drivers/watchdog/menf21bmc_wdt.c
@@ -156,10 +156,8 @@ static int menf21bmc_wdt_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_watchdog_register_device(dev, &drv_data->wdt);
-	if (ret) {
-		dev_err(dev, "failed to register Watchdog device\n");
+	if (ret)
 		return ret;
-	}
 
 	dev_info(dev, "MEN 14F021P00 BMC Watchdog device enabled\n");
 
-- 
2.19.1

