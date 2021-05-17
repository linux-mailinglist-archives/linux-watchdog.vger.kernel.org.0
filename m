Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA54382BD6
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 14:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbhEQMLc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 08:11:32 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3783 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236917AbhEQMLb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 08:11:31 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkHtF04wwzmhLQ;
        Mon, 17 May 2021 20:06:45 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 20:10:12 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 20:10:12 +0800
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "Suravee Suthikulpanit" <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
Subject: [PATCH v2] watchdog: sbsa: Support architecture version 1
Date:   Mon, 17 May 2021 20:10:08 +0800
Message-ID: <1621253408-23401-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

For Armv8.6, The frequency of CNTFRQ_EL0 is standardized to a
frequency of 1GHz, so Arm Base System Architecture 1.0[1] has
introduced watchdog revision 1 that increases the length the
watchdog offset register to 48 bit, while other operation of
the watchdog remains the same.

The driver can determine which version of the watchdog is
implemented through the watchdog interface identification
register (W_IID). If the version is 0x1, the watchdog
offset register will be 48 bit, otherwise it will be 32 bit.

[1] https://developer.arm.com/documentation/den0094/latest

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: Al Stone <al.stone@linaro.org>
Cc: Jianchao Hu <hujianchao@hisilicon.com>
Cc: Huiqiang Wang <wanghuiqiang@huawei.com>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
ChangeLog
v1-->v2:
    1. Addressed Guenter's comments
    2. Remove some dead mailboxs and rewrite comments.
    
 drivers/watchdog/sbsa_gwdt.c | 54 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index f0f1e3b2e463..ee9ff38929eb 100644
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
@@ -113,6 +118,30 @@ MODULE_PARM_DESC(nowayout,
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
 /*
+ * Arm Base System Architecture 1.0 introduces watchdog v1 which
+ * increases the length watchdog offset register to 48 bits.
+ * - For version 0: WOR is 32 bits;
+ * - For version 1: WOR is 48 bits which comprises the register
+ * offset 0x8 and 0xC, and the bits [63:48] are reserved which are
+ * Read-As-Zero and Writes-Ignored.
+ */
+static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
+{
+	if (gwdt->version == 0)
+		return readl(gwdt->control_base + SBSA_GWDT_WOR);
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
@@ -123,16 +152,14 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
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
@@ -149,7 +176,7 @@ static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
 	 */
 	if (!action &&
 	    !(readl(gwdt->control_base + SBSA_GWDT_WCS) & SBSA_GWDT_WCS_WS0))
-		timeleft += readl(gwdt->control_base + SBSA_GWDT_WOR);
+		timeleft += sbsa_gwdt_reg_read(gwdt);
 
 	timeleft += lo_hi_readq(gwdt->control_base + SBSA_GWDT_WCV) -
 		    arch_timer_read_counter();
@@ -172,6 +199,17 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
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
@@ -252,10 +290,14 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	wdd->info = &sbsa_gwdt_info;
 	wdd->ops = &sbsa_gwdt_ops;
 	wdd->min_timeout = 1;
-	wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;
 	wdd->timeout = DEFAULT_TIMEOUT;
 	watchdog_set_drvdata(wdd, gwdt);
 	watchdog_set_nowayout(wdd, nowayout);
+	sbsa_gwdt_get_version(wdd);
+	if (gwdt->version == 0)
+		wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;
+	else
+		wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
 
 	status = readl(cf_base + SBSA_GWDT_WCS);
 	if (status & SBSA_GWDT_WCS_WS1) {
-- 
2.7.4

