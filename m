Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7FCA22517
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfERV2Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:16 -0400
Received: from sauhun.de ([88.99.104.3]:35826 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729597AbfERV2Q (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:16 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id E352E2C07F4;
        Sat, 18 May 2019 23:28:14 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/46] watchdog: hpwdt: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:28 +0200
Message-Id: <20190518212801.31010-14-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/hpwdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index db1bf6f546ae..e0ebfba50aab 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -321,10 +321,8 @@ static int hpwdt_init_one(struct pci_dev *dev,
 
 	hpwdt_dev.parent = &dev->dev;
 	retval = watchdog_register_device(&hpwdt_dev);
-	if (retval < 0) {
-		dev_err(&dev->dev, "watchdog register failed: %d.\n", retval);
+	if (retval < 0)
 		goto error_wd_register;
-	}
 
 	dev_info(&dev->dev, "HPE Watchdog Timer Driver: Version: %s\n",
 				HPWDT_VERSION);
-- 
2.19.1

