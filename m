Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4BC22521
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbfERV2U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:20 -0400
Received: from sauhun.de ([88.99.104.3]:35834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729620AbfERV2U (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:20 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 2F87F2C2761;
        Sat, 18 May 2019 23:28:19 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 21/46] watchdog: max77620_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:36 +0200
Message-Id: <20190518212801.31010-22-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/max77620_wdt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/watchdog/max77620_wdt.c b/drivers/watchdog/max77620_wdt.c
index 3ca6b9337932..21e0f118cb86 100644
--- a/drivers/watchdog/max77620_wdt.c
+++ b/drivers/watchdog/max77620_wdt.c
@@ -185,13 +185,7 @@ static int max77620_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(wdt_dev, wdt);
 
 	watchdog_stop_on_unregister(wdt_dev);
-	ret = devm_watchdog_register_device(dev, wdt_dev);
-	if (ret < 0) {
-		dev_err(dev, "watchdog registration failed: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_watchdog_register_device(dev, wdt_dev);
 }
 
 static const struct platform_device_id max77620_wdt_devtype[] = {
-- 
2.19.1

