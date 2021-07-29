Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B313DA8AE
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 18:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhG2QRF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 12:17:05 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:36534 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhG2QRF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 12:17:05 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d46 with ME
        id b4Gz2500421Fzsu034GzEF; Thu, 29 Jul 2021 18:17:00 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 29 Jul 2021 18:17:00 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     wim@linux-watchdog.org, linux@roeck-us.net, curtis.klein@hpe.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] watchdog: Fix an invalid memory access in 'watchdog_cdev_unregister()'
Date:   Thu, 29 Jul 2021 18:16:58 +0200
Message-Id: <dcb65e66acd1a50d65635b35d0d340846c7d10c7.1627575359.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

A few lines before 'watchdog_hrtimer_pretimeout_stop(wdd)', we explicitly
set 'wdd->wd_data' to NULL.
So, it is more than likely than this call will lead to an invalid
memory access.

Move this call before the 'wdd->wd_data = NULL;'

Fixes: 7b7d2fdc8c3e ("watchdog: Add hrtimer-based pretimeout feature")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Completely untested!
Not sure at all, that it is the way to fix it.
---
 drivers/watchdog/watchdog_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab32485273..ffd8f1a82355 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1096,6 +1096,8 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 		watchdog_stop(wdd);
 	}
 
+	watchdog_hrtimer_pretimeout_stop(wdd);
+
 	mutex_lock(&wd_data->lock);
 	wd_data->wdd = NULL;
 	wdd->wd_data = NULL;
@@ -1103,7 +1105,6 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 
 	hrtimer_cancel(&wd_data->timer);
 	kthread_cancel_work_sync(&wd_data->work);
-	watchdog_hrtimer_pretimeout_stop(wdd);
 
 	put_device(&wd_data->dev);
 }
-- 
2.30.2

