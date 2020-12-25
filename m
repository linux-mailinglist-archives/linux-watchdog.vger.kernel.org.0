Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E432E2A7C
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Dec 2020 09:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgLYIt5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Dec 2020 03:49:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10082 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgLYIt5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Dec 2020 03:49:57 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D2LFF3f84zM9DM;
        Fri, 25 Dec 2020 16:48:17 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Fri, 25 Dec 2020 16:49:10 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC:     <linux-watchdog@vger.kernel.org>
Subject: [PATCH] watchdog: ziirave_wdt: remove unused including <linux/version.h>
Date:   Fri, 25 Dec 2020 16:49:14 +0800
Message-ID: <1608886154-55309-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/watchdog/ziirave_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index cab86a0..4297280 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
-#include <linux/version.h>
 #include <linux/watchdog.h>
 
 #include <asm/unaligned.h>
-- 
2.7.4

