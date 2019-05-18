Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D693522515
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfERV2P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:15 -0400
Received: from sauhun.de ([88.99.104.3]:35844 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729535AbfERV2P (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:15 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id D37742C077C;
        Sat, 18 May 2019 23:28:13 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 11/46] watchdog: digicolor_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:26 +0200
Message-Id: <20190518212801.31010-12-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/digicolor_wdt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
index 8af6e9a67d0d..33cda95bd238 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -141,13 +141,7 @@ static int dc_wdt_probe(struct platform_device *pdev)
 	watchdog_set_restart_priority(&dc_wdt_wdd, 128);
 	watchdog_init_timeout(&dc_wdt_wdd, timeout, dev);
 	watchdog_stop_on_reboot(&dc_wdt_wdd);
-	ret = devm_watchdog_register_device(dev, &dc_wdt_wdd);
-	if (ret) {
-		dev_err(dev, "Failed to register watchdog device");
-		return ret;
-	}
-
-	return 0;
+	return devm_watchdog_register_device(dev, &dc_wdt_wdd);
 }
 
 static const struct of_device_id dc_wdt_of_match[] = {
-- 
2.19.1

