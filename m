Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94A72252E
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbfERV21 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:27 -0400
Received: from sauhun.de ([88.99.104.3]:35826 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729675AbfERV21 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:27 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 160E52C35BF;
        Sat, 18 May 2019 23:28:26 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 34/46] watchdog: rave-sp-wdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:49 +0200
Message-Id: <20190518212801.31010-35-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/rave-sp-wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/rave-sp-wdt.c b/drivers/watchdog/rave-sp-wdt.c
index 35db173252f9..2c95615b6354 100644
--- a/drivers/watchdog/rave-sp-wdt.c
+++ b/drivers/watchdog/rave-sp-wdt.c
@@ -310,7 +310,6 @@ static int rave_sp_wdt_probe(struct platform_device *pdev)
 
 	ret = devm_watchdog_register_device(dev, wdd);
 	if (ret) {
-		dev_err(dev, "Failed to register watchdog device\n");
 		rave_sp_wdt_stop(wdd);
 		return ret;
 	}
-- 
2.19.1

