Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97BF022539
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbfERV2d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:33 -0400
Received: from sauhun.de ([88.99.104.3]:35834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729690AbfERV2d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:33 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id E81CA2C775D;
        Sat, 18 May 2019 23:28:31 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 45/46] watchdog: wm831x_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:28:00 +0200
Message-Id: <20190518212801.31010-46-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/wm831x_wdt.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wdt.c
index 9b6565a3fab4..030ce240620d 100644
--- a/drivers/watchdog/wm831x_wdt.c
+++ b/drivers/watchdog/wm831x_wdt.c
@@ -267,14 +267,7 @@ static int wm831x_wdt_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = devm_watchdog_register_device(dev, &driver_data->wdt);
-	if (ret != 0) {
-		dev_err(wm831x->dev, "watchdog_register_device() failed: %d\n",
-			ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_watchdog_register_device(dev, &driver_data->wdt);
 }
 
 static struct platform_driver wm831x_wdt_driver = {
-- 
2.19.1

