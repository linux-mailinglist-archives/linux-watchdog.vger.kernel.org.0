Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D675D2251F
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbfERV2T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:19 -0400
Received: from sauhun.de ([88.99.104.3]:35844 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729597AbfERV2T (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:19 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 1FD2F2C2704;
        Sat, 18 May 2019 23:28:18 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/46] watchdog: jz4740_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:34 +0200
Message-Id: <20190518212801.31010-20-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/jz4740_wdt.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index d1bc7cbd4f2b..857b950b6391 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -196,11 +196,7 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
 		return PTR_ERR(drvdata->rtc_clk);
 	}
 
-	ret = devm_watchdog_register_device(dev, &drvdata->wdt);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
 static struct platform_driver jz4740_wdt_driver = {
-- 
2.19.1

