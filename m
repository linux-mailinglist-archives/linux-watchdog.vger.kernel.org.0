Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B967F22519
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729607AbfERV2Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:16 -0400
Received: from sauhun.de ([88.99.104.3]:35834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729535AbfERV2Q (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:16 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 6EEBA2C0827;
        Sat, 18 May 2019 23:28:15 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/46] watchdog: i6300esb: drop warning after registering device
Date:   Sat, 18 May 2019 23:27:29 +0200
Message-Id: <20190518212801.31010-15-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/i6300esb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/i6300esb.c b/drivers/watchdog/i6300esb.c
index 17941c03996b..53c39cc2141a 100644
--- a/drivers/watchdog/i6300esb.c
+++ b/drivers/watchdog/i6300esb.c
@@ -319,11 +319,8 @@ static int esb_probe(struct pci_dev *pdev,
 
 	/* Register the watchdog so that userspace has access to it */
 	ret = watchdog_register_device(&edev->wdd);
-	if (ret != 0) {
-		dev_err(&pdev->dev,
-			"cannot register watchdog device (err=%d)\n", ret);
+	if (ret != 0)
 		goto err_unmap;
-	}
 	dev_info(&pdev->dev,
 		"initialized. heartbeat=%d sec (nowayout=%d)\n",
 		edev->wdd.timeout, nowayout);
-- 
2.19.1

