Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6376B1F745C
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jun 2020 09:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgFLHKL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Jun 2020 03:10:11 -0400
Received: from m17617.mail.qiye.163.com ([59.111.176.17]:5247 "EHLO
        m17617.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgFLHKL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Jun 2020 03:10:11 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.227])
        by m17617.mail.qiye.163.com (Hmail) with ESMTPA id 6DFCF261796;
        Fri, 12 Jun 2020 15:03:11 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] drivers\watchdog: Use kobj_to_dev() API
Date:   Fri, 12 Jun 2020 15:03:04 +0800
Message-Id: <1591945384-14587-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGR9OTElDT0gZTkkYVkpOQkpCT05IQkpMSk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6Exw5ETg2SgsCVjENSlES
        SiwaFCNVSlVKTkJKQk9OSEJJSktJVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlJTFlXWQgBWUFKTkxDNwY+
X-HM-Tid: 0a72a756ee0a9375kuws6dfcf261796
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use kobj_to_dev() API instead of container_of().

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/watchdog_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 => 100755 drivers/watchdog/watchdog_dev.c

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34..9da2360
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -587,7 +587,7 @@ static DEVICE_ATTR_RW(pretimeout_governor);
 static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
 				int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	umode_t mode = attr->mode;
 
-- 
2.7.4

