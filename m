Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD08724EBF1
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Aug 2020 09:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgHWHOK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Aug 2020 03:14:10 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:20458 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbgHWHOJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Aug 2020 03:14:09 -0400
Received: from localhost.localdomain (unknown [210.32.144.184])
        by mail-app2 (Coremail) with SMTP id by_KCgDn7rIjF0Jfrv0bAg--.41012S4;
        Sun, 23 Aug 2020 15:13:42 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Krzysztof Sobota <krzysztof.sobota@nokia.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: Fix double-free in watchdog_cdev_register
Date:   Sun, 23 Aug 2020 15:13:38 +0800
Message-Id: <20200823071338.15209-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgDn7rIjF0Jfrv0bAg--.41012S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CF15GFWrArW5Jr48GFy3urg_yoW8Jw1Dpa
        y5CrW5Zr4Utw4UWrZrJwn7ZFy8Gas5try8uF1UG3y3CFs0kry5trWFyFy5CayDG393WF15
        Zr1UtrW0ga9xtr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUva1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
        6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
        vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxG
        rwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
        6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
        uYvjfUYMKZDUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoSBlZdtPnBhAA3so
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When misc_register() fails, wd_data will be released by the
release callback function watchdog_core_data_release(), so
we don't need to free it again. But when watchdog_kworker is
NULL, we should free wd_data to prevent memleak.

Fixes: cb36e29bb0e4b ("watchdog: initialize device before misc_register")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/watchdog/watchdog_dev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 6798addabd5a..8ee78e26feb1 100644
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
@@ -1021,7 +1023,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 				pr_err("%s: a legacy watchdog module is probably present.\n",
 					wdd->info->identity);
 			old_wd_data = NULL;
-			kfree(wd_data);
 			return err;
 		}
 	}
-- 
2.17.1

