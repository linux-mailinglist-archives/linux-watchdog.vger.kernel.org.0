Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A3422528
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbfERV2Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:25 -0400
Received: from sauhun.de ([88.99.104.3]:35834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729671AbfERV2Y (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:24 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 688962C3115;
        Sat, 18 May 2019 23:28:23 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 29/46] watchdog: of_xilinx_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:44 +0200
Message-Id: <20190518212801.31010-30-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/of_xilinx_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 03786992b701..7fe4f7c3f7ce 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -238,10 +238,8 @@ static int xwdt_probe(struct platform_device *pdev)
 	}
 
 	rc = devm_watchdog_register_device(dev, xilinx_wdt_wdd);
-	if (rc) {
-		dev_err(dev, "Cannot register watchdog (err=%d)\n", rc);
+	if (rc)
 		return rc;
-	}
 
 	clk_disable(xdev->clk);
 
-- 
2.19.1

