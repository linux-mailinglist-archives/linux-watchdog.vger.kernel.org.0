Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3E222513
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbfERV2O (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:14 -0400
Received: from sauhun.de ([88.99.104.3]:35826 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfERV2O (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:14 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id C2DF12C077A;
        Sat, 18 May 2019 23:28:12 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/46] watchdog: da9062_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:24 +0200
Message-Id: <20190518212801.31010-10-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/da9062_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index aac749cfaccb..e149e66a6ea9 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -214,11 +214,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(&wdt->wdtdev, wdt);
 
 	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
-	if (ret < 0) {
-		dev_err(wdt->hw->dev,
-			"watchdog registration failed (%d)\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	return da9062_wdt_ping(&wdt->wdtdev);
 }
-- 
2.19.1

