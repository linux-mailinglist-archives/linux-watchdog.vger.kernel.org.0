Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6982FCC04
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 08:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbhATHtf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 02:49:35 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:45111 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728909AbhATHtS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 02:49:18 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UMJS2ZT_1611128891;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMJS2ZT_1611128891)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 15:48:15 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     jerry.hoemann@hpe.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] watchdog/hpwdt: Assign boolean values to a bool variable
Date:   Wed, 20 Jan 2021 15:48:10 +0800
Message-Id: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix the following coccicheck warnings:

 ./drivers/watchdog/hpwdt.c:345:2-12: WARNING: Assignment of
0/1 to bool variable.

./drivers/watchdog/hpwdt.c:126:2-12: WARNING: Assignment of
0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/watchdog/hpwdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index cbd1498..22ddba3 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -123,7 +123,7 @@ static int hpwdt_settimeout(struct watchdog_device *wdd, unsigned int val)
 	if (val <= wdd->pretimeout) {
 		dev_dbg(wdd->parent, "pretimeout < timeout. Setting to zero\n");
 		wdd->pretimeout = 0;
-		pretimeout = 0;
+		pretimeout = false;
 		if (watchdog_active(wdd))
 			hpwdt_start(wdd);
 	}
@@ -336,13 +336,13 @@ static int hpwdt_init_one(struct pci_dev *dev,
 	watchdog_init_timeout(&hpwdt_dev, soft_margin, NULL);
 
 	if (is_kdump_kernel()) {
-		pretimeout = 0;
+		pretimeout = false;
 		kdumptimeout = 0;
 	}
 
 	if (pretimeout && hpwdt_dev.timeout <= PRETIMEOUT_SEC) {
 		dev_warn(&dev->dev, "timeout <= pretimeout. Setting pretimeout to zero\n");
-		pretimeout = 0;
+		pretimeout = false;
 	}
 	hpwdt_dev.pretimeout = pretimeout ? PRETIMEOUT_SEC : 0;
 	kdumptimeout = min(kdumptimeout, HPWDT_MAX_TIMER);
-- 
1.8.3.1

