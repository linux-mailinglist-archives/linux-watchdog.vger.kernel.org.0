Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93DDB2C2C7
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2019 11:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfE1JKI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 May 2019 05:10:08 -0400
Received: from unicorn.mansr.com ([81.2.72.234]:58306 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbfE1JKI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 May 2019 05:10:08 -0400
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id 1BCE715621; Tue, 28 May 2019 10:10:06 +0100 (BST)
From:   Mans Rullgard <mans@mansr.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: gpio: add support for nowayout option
Date:   Tue, 28 May 2019 10:09:47 +0100
Message-Id: <20190528090947.2610-1-mans@mansr.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add support for the nowayout option in the gpio watchdog driver.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/watchdog/gpio_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index ea77cae03c9d..63792bb70213 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -17,6 +17,12 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		"Watchdog cannot be stopped once started (default="
+				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 #define SOFT_TIMEOUT_MIN	1
 #define SOFT_TIMEOUT_DEF	60
 
@@ -155,6 +161,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	priv->wdd.timeout	= SOFT_TIMEOUT_DEF;
 
 	watchdog_init_timeout(&priv->wdd, 0, &pdev->dev);
+	watchdog_set_nowayout(&priv->wdd, nowayout);
 
 	watchdog_stop_on_reboot(&priv->wdd);
 
-- 
2.21.0

