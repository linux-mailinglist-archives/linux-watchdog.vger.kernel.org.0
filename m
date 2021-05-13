Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CF137F677
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 13:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhEMLLB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 May 2021 07:11:01 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:53810 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231690AbhEMLK7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 May 2021 07:10:59 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UYkkqt._1620904183;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UYkkqt._1620904183)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 13 May 2021 19:09:49 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, p.zabel@pengutronix.de,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH v2] watchdog: dw_wdt: Fix duplicate included linux/kernel.h
Date:   Thu, 13 May 2021 19:09:42 +0800
Message-Id: <1620904182-74107-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Clean up the following includecheck warning:

./drivers/watchdog/dw_wdt.c: linux/kernel.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Adjust header file order, for the follow advice:
   https://lore.kernel.org/patchwork/patch/1428192/

 drivers/watchdog/dw_wdt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 32d0e17..cd57884 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -13,22 +13,21 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/limits.h>
-#include <linux/kernel.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/interrupt.h>
 #include <linux/of.h>
-#include <linux/pm.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/reset.h>
 #include <linux/watchdog.h>
-#include <linux/debugfs.h>
 
 #define WDOG_CONTROL_REG_OFFSET		    0x00
 #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
-- 
1.8.3.1

