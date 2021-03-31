Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4F334FC01
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Mar 2021 10:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhCaI7R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Mar 2021 04:59:17 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15832 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhCaI6p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Mar 2021 04:58:45 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F9KtS2NvLz9t8p;
        Wed, 31 Mar 2021 16:56:32 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:58:30 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     <linux-watchdog@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] watchdog: dw_wdt: Remove duplicated include from dw_wdt.c
Date:   Wed, 31 Mar 2021 16:58:30 +0800
Message-ID: <20210331085830.2964-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/watchdog/dw_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 32d0e1781e63..b1642e2d9175 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -19,7 +19,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>

