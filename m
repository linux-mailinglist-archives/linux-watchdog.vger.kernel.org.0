Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE5C2DC13C
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Dec 2020 14:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgLPN2D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Dec 2020 08:28:03 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9626 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgLPN2D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Dec 2020 08:28:03 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwrS404xz15cYN;
        Wed, 16 Dec 2020 21:26:32 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:27:01 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] watchdog: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:27:33 +0800
Message-ID: <20201216132733.15635-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/watchdog/mpc8xxx_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
index 3fc457bc16db..2f7ded32e878 100644
--- a/drivers/watchdog/mpc8xxx_wdt.c
+++ b/drivers/watchdog/mpc8xxx_wdt.c
@@ -175,8 +175,8 @@ static int mpc8xxx_wdt_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&ddata->lock);
 
-	ddata->wdd.info = &mpc8xxx_wdt_info,
-	ddata->wdd.ops = &mpc8xxx_wdt_ops,
+	ddata->wdd.info = &mpc8xxx_wdt_info;
+	ddata->wdd.ops = &mpc8xxx_wdt_ops;
 
 	ddata->wdd.timeout = WATCHDOG_TIMEOUT;
 	watchdog_init_timeout(&ddata->wdd, timeout, dev);
-- 
2.22.0

