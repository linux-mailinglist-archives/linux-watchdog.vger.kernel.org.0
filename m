Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAA5377AA7
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 05:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhEJDnG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 9 May 2021 23:43:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2545 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhEJDnG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 9 May 2021 23:43:06 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fdmy14Cm2zkYDx;
        Mon, 10 May 2021 11:39:21 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 11:41:53 +0800
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Fu Wei <fu.wei@linaro.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Timur Tabi <timur@codeaurora.org>,
        "Jianchao Hu" <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
Subject: [PATCH] watchdog: sbsa: Support architecture version 1
Date:   Mon, 10 May 2021 11:41:57 +0800
Message-ID: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Arm Base System Architecture 1.0[1] has introduced watchdog
revision 1 that increases the length the watchdog offset
regiter to 48 bit, while other operation of the watchdog remains
the same.
Let's support the feature infered it from the architecture version
of watchdog in W_IID register. If the version is 0x1, the watchdog
offset register will be 48 bit, otherwise it will be 32 bit.

[1] https://developer.arm.com/documentation/den0094/latest

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Fu Wei <fu.wei@linaro.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: Al Stone <al.stone@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>
Cc: Jianchao Hu <hujianchao@hisilicon.com>
Cc: Huiqiang Wang <wanghuiqiang@huawei.com>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/watchdog/sbsa_gwdt.c | 46 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index f0f1e3b2e463..ca4f7c416f1e 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -73,16 +73,21 @@
 #define SBSA_GWDT_WCS_WS0	BIT(1)
 #define SBSA_GWDT_WCS_WS1	BIT(2)
 
+#define SBSA_GWDT_VERSION_MASK  0xF
+#define SBSA_GWDT_VERSION_SHIFT 16
+
 /**
  * struct sbsa_gwdt - Internal representation of the SBSA GWDT
  * @wdd:		kernel watchdog_device structure
  * @clk:		store the System Counter clock frequency, in Hz.
+ * @version:            store the architecture version
  * @refresh_base:	Virtual address of the watchdog refresh frame
  * @control_base:	Virtual address of the watchdog control frame
  */
 struct sbsa_gwdt {
 	struct watchdog_device	wdd;
 	u32			clk;
+	int			version;
 	void __iomem		*refresh_base;
 	void __iomem		*control_base;
 };
@@ -113,6 +118,27 @@ MODULE_PARM_DESC(nowayout,
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
 /*
+ * Read and write are 32 or 64 bits depending on watchdog architecture
+ * version: if version is equal 0, its 32-bits operation; otherwise 64-bits
+ * operation is chosen.
+ */
+static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
+{
+	if (gwdt->version == 0)
+		return (u64)readl(gwdt->control_base + SBSA_GWDT_WOR);
+	else
+		return readq(gwdt->control_base + SBSA_GWDT_WOR);
+}
+
+static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
+{
+	if (gwdt->version == 0)
+		writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
+	else
+		writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
+}
+
+/*
  * watchdog operation functions
  */
 static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
@@ -123,16 +149,14 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
 	wdd->timeout = timeout;
 
 	if (action)
-		writel(gwdt->clk * timeout,
-		       gwdt->control_base + SBSA_GWDT_WOR);
+		sbsa_gwdt_reg_write(gwdt->clk * timeout, gwdt);
 	else
 		/*
 		 * In the single stage mode, The first signal (WS0) is ignored,
 		 * the timeout is (WOR * 2), so the WOR should be configured
 		 * to half value of timeout.
 		 */
-		writel(gwdt->clk / 2 * timeout,
-		       gwdt->control_base + SBSA_GWDT_WOR);
+		sbsa_gwdt_reg_write(gwdt->clk / 2 * timeout, gwdt);
 
 	return 0;
 }
@@ -149,7 +173,7 @@ static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
 	 */
 	if (!action &&
 	    !(readl(gwdt->control_base + SBSA_GWDT_WCS) & SBSA_GWDT_WCS_WS0))
-		timeleft += readl(gwdt->control_base + SBSA_GWDT_WOR);
+		timeleft += sbsa_gwdt_reg_read(gwdt);
 
 	timeleft += lo_hi_readq(gwdt->control_base + SBSA_GWDT_WCV) -
 		    arch_timer_read_counter();
@@ -172,6 +196,17 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
 	return 0;
 }
 
+static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
+{
+	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
+	int ver;
+
+	ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
+	ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
+
+	gwdt->version = ver;
+}
+
 static int sbsa_gwdt_start(struct watchdog_device *wdd)
 {
 	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
@@ -300,6 +335,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	 * it's also a ping, if watchdog is enabled.
 	 */
 	sbsa_gwdt_set_timeout(wdd, wdd->timeout);
+	sbsa_gwdt_get_version(wdd);
 
 	watchdog_stop_on_reboot(wdd);
 	ret = devm_watchdog_register_device(dev, wdd);
-- 
2.7.4

