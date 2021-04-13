Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F5735DB55
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 11:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhDMJe4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 05:34:56 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:60702 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230378AbhDMJeu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 05:34:50 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UVRamsD_1618306463;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UVRamsD_1618306463)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 13 Apr 2021 17:34:29 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     wim@linux-watchdog.org
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] watchdog: it87_wdt: remove useless function
Date:   Tue, 13 Apr 2021 17:34:20 +0800
Message-Id: <1618306460-57286-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix the following clang warning:

drivers/watchdog/it87_wdt.c:155:20: warning: unused function
'superio_outw' [-Wunused-function].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/watchdog/it87_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 2b48318..bb11229 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -152,14 +152,6 @@ static inline int superio_inw(int reg)
 	return val;
 }
 
-static inline void superio_outw(int val, int reg)
-{
-	outb(reg++, REG);
-	outb(val >> 8, VAL);
-	outb(reg, REG);
-	outb(val, VAL);
-}
-
 /* Internal function, should be called after superio_select(GPIO) */
 static void _wdt_update_timeout(unsigned int t)
 {
-- 
1.8.3.1

