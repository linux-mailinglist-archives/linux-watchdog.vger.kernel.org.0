Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4726624F13B
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Aug 2020 04:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgHXCkX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Aug 2020 22:40:23 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:20556 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726684AbgHXCkW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Aug 2020 22:40:22 -0400
Received: from localhost.localdomain (unknown [210.32.144.184])
        by mail-app3 (Coremail) with SMTP id cC_KCgCHj9+DKENfun8bAw--.22092S4;
        Mon, 24 Aug 2020 10:40:07 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: Fix memleak in watchdog_cdev_register
Date:   Mon, 24 Aug 2020 10:40:01 +0800
Message-Id: <20200824024001.25474-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCHj9+DKENfun8bAw--.22092S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1UXFyxKr1kGr1rGw1xKrg_yoWfKrX_Wr
        1xZry3Wrn8KFn5XF1Uta17Zr409F4kXF4rAr18tFySk397Xry7WrZrZryIgw10ga4rAry3
        Jr1DWrsY9FyDCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48J
        MxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUHWlkUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUCBlZdtPpD7wABsr
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When watchdog_kworker is NULL, we should free wd_data
before the function returns to prevent memleak.

Fixes: 664a39236e718 ("watchdog: Introduce hardware maximum heartbeat in watchdog core")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/watchdog/watchdog_dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 6798addabd5a..785270ee337c 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -994,8 +994,10 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 	wd_data->wdd = wdd;
 	wdd->wd_data = wd_data;
 
-	if (IS_ERR_OR_NULL(watchdog_kworker))
+	if (IS_ERR_OR_NULL(watchdog_kworker)) {
+		kfree(wd_data);
 		return -ENODEV;
+	}
 
 	device_initialize(&wd_data->dev);
 	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
-- 
2.17.1

