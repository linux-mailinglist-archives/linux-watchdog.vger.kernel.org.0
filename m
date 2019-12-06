Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39394115086
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Dec 2019 13:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfLFMnS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Dec 2019 07:43:18 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7196 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbfLFMnS (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Dec 2019 07:43:18 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 34E8698A8BE4491AEB20;
        Fri,  6 Dec 2019 20:43:15 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Dec 2019
 20:43:06 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>, <andrew@lunn.ch>
CC:     <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] watchdog: tqmx86_wdt: Fix build error
Date:   Fri, 6 Dec 2019 20:42:59 +0800
Message-ID: <20191206124259.25880-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If TQMX86_WDT is y and WATCHDOG_CORE is m, building fails:

drivers/watchdog/tqmx86_wdt.o: In function `tqmx86_wdt_probe':
tqmx86_wdt.c:(.text+0x46e): undefined reference to `watchdog_init_timeout'
tqmx86_wdt.c:(.text+0x4e0): undefined reference to `devm_watchdog_register_device'

Select WATCHDOG_CORE to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: e3c21e088f89 ("watchdog: tqmx86: Add watchdog driver for the IO controller")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 1679e0d..20bd967 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1444,6 +1444,7 @@ config SMSC37B787_WDT
 config TQMX86_WDT
 	tristate "TQ-Systems TQMX86 Watchdog Timer"
 	depends on X86
+	select WATCHDOG_CORE
 	help
 	This is the driver for the hardware watchdog timer in the TQMX86 IO
 	controller found on some of their ComExpress Modules.
-- 
2.7.4


