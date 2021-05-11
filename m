Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8633A379FE4
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 08:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhEKGps (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 02:45:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2558 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhEKGps (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 02:45:48 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FfSyK0NM3zkWRZ;
        Tue, 11 May 2021 14:42:01 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 14:44:32 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC:     <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] watchdog: Fix possible use-after-free in wdt_startup()
Date:   Tue, 11 May 2021 15:01:35 +0800
Message-ID: <1620716495-108352-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This module's remove path calls del_timer(). However, that function
does not wait until the timer handler finishes. This means that the
timer handler may still be running after the driver's remove function
has finished, which would result in a use-after-free.

Fix by calling del_timer_sync(), which makes sure the timer handler
has finished, and unable to re-schedule itself.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/watchdog/sbc60xxwdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sbc60xxwdt.c b/drivers/watchdog/sbc60xxwdt.c
index a947a63..7b97480 100644
--- a/drivers/watchdog/sbc60xxwdt.c
+++ b/drivers/watchdog/sbc60xxwdt.c
@@ -146,7 +146,7 @@ static void wdt_startup(void)
 static void wdt_turnoff(void)
 {
 	/* Stop the timer */
-	del_timer(&timer);
+	del_timer_sync(&timer);
 	inb_p(wdt_stop);
 	pr_info("Watchdog timer is now disabled...\n");
 }
-- 
2.6.2

