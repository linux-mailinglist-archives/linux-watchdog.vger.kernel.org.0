Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFE122533
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729715AbfERV2a (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:30 -0400
Received: from sauhun.de ([88.99.104.3]:35844 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729690AbfERV2a (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:30 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id BB1A52C3740;
        Sat, 18 May 2019 23:28:28 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 39/46] watchdog: sprd_wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:54 +0200
Message-Id: <20190518212801.31010-40-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/sprd_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index 14874e9b207b..b049981de3f3 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -328,7 +328,6 @@ static int sprd_wdt_probe(struct platform_device *pdev)
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
 	if (ret) {
 		sprd_wdt_disable(wdt);
-		dev_err(dev, "failed to register watchdog\n");
 		return ret;
 	}
 	platform_set_drvdata(pdev, wdt);
-- 
2.19.1

