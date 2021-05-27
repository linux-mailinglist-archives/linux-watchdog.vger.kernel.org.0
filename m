Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1466D392B39
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 11:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbhE0J7O (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 05:59:14 -0400
Received: from mail-dm6nam08on2061.outbound.protection.outlook.com ([40.107.102.61]:55009
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236003AbhE0J7F (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 05:59:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwsLOlOs0MRfmoc9/VhAkkw6K1fzZ3pbjZjSEy7jkwdAUgj3MgXu/G5PlaHNrw+x5Fxo/za8dmn8fR63RGaluy00YEYFsIkhFgeVtvlR/0ws8UN5+uR/6OGbGGOZ7k1FUE5R+bqziueI3VW+cM6DCJPU2m3jXxwxKHyFUU7ks0b6t2iQW/f8LfRFR4w1WS1CMY3OUoNAHBi4kMn08Z8IlJrFhkxm0RKQX58NQLmjcrzkDM8lmP8TbsD0DiEtv6t9ufP8/4r4vzka1tBbzLl3Yx8ebGqoKy+tlIhDDdqRjbbdr3SWGlAW+i8jYC1ksDU+2gZGxidnZM/YeS/ll6/7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbxZJSOgTlx6tvqD2n4muM79bo3s/lxKs3AIreZst2E=;
 b=ixfUB4g/dzVH8FfiFTwTmwc1x35VW6wmFtiM5RNMX9YFQOOlCU8AtiKSnsL0hqsK3pAoSbkXMQejYa+dWaGnxWYt4u9oegaft/IqMOFSbMdgXiqk7y7tCIRbgJ9haYdX3yuu3/0NuSJ+QyZA0+5ZAfLQGABipM6YDWNWE5STPCENlR6HKOe9CTtNajHCTurPqpq+iq25SvrJexp7WFOWAkvExXlmlQNIWWG8vGYIKmKWO3fwmuwqumDz4kVhAQCQ7xG141kQ3D3tputz/JijCjDW8cEoKgMEHiYgqVUR7Dr1vhDvInL1WVnsOADPpwZozLOWAqFvOygcQOnUWmJW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbxZJSOgTlx6tvqD2n4muM79bo3s/lxKs3AIreZst2E=;
 b=dd1z/IBcEzLeFasCXL7C7YEWUX822gIYGo+1b4CBtDzLsbFcYBnLdwt+Lu/dAjZ6cSlbAlXQ3GZaaovTXa9JQyqpUotuomoot4Fi0B2PNcFekneUi50nHhCnzOu18TkepF25yoRLaEL66ATCQYCVgsYcAyIjvSgFRMRZAfd+Wjg=
Received: from DM5PR11CA0008.namprd11.prod.outlook.com (2603:10b6:3:115::18)
 by DM8PR02MB8294.namprd02.prod.outlook.com (2603:10b6:8:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20; Thu, 27 May 2021 09:57:31 +0000
Received: from DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::82) by DM5PR11CA0008.outlook.office365.com
 (2603:10b6:3:115::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22 via Frontend
 Transport; Thu, 27 May 2021 09:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT021.mail.protection.outlook.com (10.13.4.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.27 via Frontend Transport; Thu, 27 May 2021 09:57:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 02:57:29 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 02:57:29 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=49918 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lmClc-0007Zl-EA; Thu, 27 May 2021 02:57:28 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal Window watchdog mode
Date:   Thu, 27 May 2021 15:27:08 +0530
Message-ID: <20210527095709.12841-3-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
References: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b4fc409-042e-4ec8-a914-08d920f5d7e3
X-MS-TrafficTypeDiagnostic: DM8PR02MB8294:
X-Microsoft-Antispam-PRVS: <DM8PR02MB82947A76C0344230FC9FD425AF239@DM8PR02MB8294.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T/MzHj53MFIQ+rFMDjO4/ODn7WxHl9HzrwF9PMMz8r5kS8ANooxMwSez9pLr8GvaUUWO8Jga05bWMERGwPu6Nw27QygnYRLivebYuiopz9RMf6uq72Zcj/ki/5s1Yu4cgtunLvpjkL/zEYyIn3O5TMHDCgv4jMxavo1iBWHFcC+at4pbIQRQowA2YNQPflHhXNRlJ9jsIj546WQImGBJ6xWMRrJ6UvTQ8oC3BhJJB5qaqRm3W3ARj38Rp9Oxb606QU7R8UqNEf8qPSpWlkqrxZ7id4T4LqZe1Fyz5izCk+VNpVpYCgUqTzi1gz2uKW71FXBnq0VKSrMSWIOmQnb4yOrihQ3EBGEYPLJ3EehRcsrO3n0zasKo2YWri/4Bo/cgNm1FWHq/hAk9j3Zkmv9tIklJKz38oEZilLQbH+hWNNIy2l3GpS8SFIQijwxFOVXii/UbdZ5ONfElg3RboaaO/tmfNI7VU1PCsMify8nyy/jI0iwWuRC4sbBLCnVZhZcSBPGr6iUKhgevQNDaNHpMPSjr37G5qdmDARxMiJfoAWnOs+HVLJ+U0E7ctajYLXrqbY8RfTU7/N2NWQAMNXLJapSe95L7XO5TaFBX8NZ8W24UQpyNojpKbiabQiArwge13DYeF5Fd4xPR049HiJtAaDeCqgwPORWuecBZOr+DZGaeB4ixXdV8oD4Ork5Vrg0z
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(9786002)(6636002)(8936002)(8676002)(36906005)(26005)(4326008)(2906002)(316002)(107886003)(47076005)(478600001)(36756003)(83380400001)(186003)(6666004)(356005)(70206006)(1076003)(2616005)(336012)(44832011)(82740400003)(426003)(30864003)(70586007)(82310400003)(54906003)(5660300002)(36860700001)(7696005)(110136005)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 09:57:30.9833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4fc409-042e-4ec8-a914-08d920f5d7e3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8294
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Versal watchdog driver uses Window watchdog mode. Window watchdog
timer(WWDT) contains closed(first) and open(second) window with
32 bit width. WWDT will generate an interrupt after the first window
timeout and reset signal after the second window timeout. Timeout
and Pre-timeout configuration, Stop and Refresh trigger only in open
window.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/Kconfig       |  16 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/xilinx_wwdt.c | 382 +++++++++++++++++++++++++++++++++
 3 files changed, 399 insertions(+)
 create mode 100644 drivers/watchdog/xilinx_wwdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 355100dad60a..2ed17f278783 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -307,6 +307,22 @@ config XILINX_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called of_xilinx_wdt.
 
+config XILINX_WINDOW_WATCHDOG
+	tristate "Xilinx Window Watchdog timer"
+	depends on HAS_IOMEM
+	select WATCHDOG_CORE
+	help
+	  Window Watchdog driver for the versal_wwdt ip core.
+	  Window watchdog timer(WWDT) contains closed(first) and
+	  open(second) window with 32 bit width. WWDT will generate
+	  an interrupt after the first window timeout and reset
+	  signal after the second window timeout. Timeout and
+	  Pre-timeout configuration, Stop and Refresh trigger
+	  only in open window.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called xilinx_wwdt.
+
 config ZIIRAVE_WATCHDOG
 	tristate "Zodiac RAVE Watchdog Timer"
 	depends on I2C
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a7eade8b4d45..97d10c3d39c7 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -148,6 +148,7 @@ obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
 
 # MicroBlaze Architecture
 obj-$(CONFIG_XILINX_WATCHDOG) += of_xilinx_wdt.o
+obj-$(CONFIG_XILINX_WINDOW_WATCHDOG) += xilinx_wwdt.o
 
 # MIPS Architecture
 obj-$(CONFIG_ATH79_WDT) += ath79_wdt.o
diff --git a/drivers/watchdog/xilinx_wwdt.c b/drivers/watchdog/xilinx_wwdt.c
new file mode 100644
index 000000000000..8fa2cb2225e8
--- /dev/null
+++ b/drivers/watchdog/xilinx_wwdt.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Window Watchdog Device Driver for Xilinx Versal WWDT
+ *
+ * (C) Copyright 2021 Xilinx, Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/watchdog.h>
+
+#define XWWDT_DEFAULT_TIMEOUT	40
+#define XWWDT_MIN_TIMEOUT	1
+#define XWWDT_MAX_TIMEOUT	42
+
+/* Register offsets for the WWdt device */
+#define XWWDT_MWR_OFFSET	0x00
+#define XWWDT_ESR_OFFSET	0x04
+#define XWWDT_FCR_OFFSET	0x08
+#define XWWDT_FWR_OFFSET	0x0c
+#define XWWDT_SWR_OFFSET	0x10
+
+/* Master Write Control Register Masks */
+#define XWWDT_MWR_MASK		BIT(0)
+
+/* Enable and Status Register Masks */
+#define XWWDT_ESR_WINT_MASK	BIT(16)
+#define XWWDT_ESR_WSW_MASK	BIT(8)
+#define XWWDT_ESR_WEN_MASK	BIT(0)
+
+/* Function control Register Masks */
+#define XWWDT_SBC_MASK		0xFF00
+#define XWWDT_SBC_SHIFT		16
+#define XWWDT_BSS_MASK		0xC0
+
+static int wwdt_timeout;
+
+module_param(wwdt_timeout, int, 0644);
+MODULE_PARM_DESC(wwdt_timeout,
+		 "Watchdog time in seconds. (default="
+		 __MODULE_STRING(XWWDT_DEFAULT_TIMEOUT) ")");
+
+struct xwwdt_device {
+	void __iomem *base;
+	spinlock_t spinlock; /* spinlock for register handling */
+	struct watchdog_device xilinx_wwdt_wdd;
+	struct clk *clk;
+	int irq;
+};
+
+static int is_wwdt_in_closed_window(struct watchdog_device *wdd)
+{
+	u32 control_status_reg;
+	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
+
+	spin_lock(&xdev->spinlock);
+	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
+	spin_unlock(&xdev->spinlock);
+	if (control_status_reg & XWWDT_ESR_WEN_MASK)
+		if (!(control_status_reg & XWWDT_ESR_WSW_MASK))
+			return 0;
+
+	return 1;
+}
+
+static int xilinx_wwdt_start(struct watchdog_device *wdd)
+{
+	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
+	u64 time_out, pre_timeout, count;
+	u32 control_status_reg, fcr;
+	int ret;
+
+	count = clk_get_rate(xdev->clk);
+	if (!count)
+		return -EINVAL;
+
+	/* Calculate timeout count */
+	pre_timeout = count * wdd->pretimeout;
+	time_out = count * wdd->timeout;
+	if (!watchdog_active(xilinx_wwdt_wdd)) {
+		ret  = clk_enable(xdev->clk);
+		if (ret) {
+			dev_err(wdd->parent, "Failed to enable clock\n");
+			return ret;
+		}
+	}
+
+	spin_lock(&xdev->spinlock);
+	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
+	iowrite32(~(u32)XWWDT_ESR_WEN_MASK,
+		  xdev->base + XWWDT_ESR_OFFSET);
+
+	if (pre_timeout) {
+		iowrite32((u32)(time_out - pre_timeout),
+			  xdev->base + XWWDT_FWR_OFFSET);
+		iowrite32((u32)pre_timeout, xdev->base + XWWDT_SWR_OFFSET);
+		fcr = ioread32(xdev->base + XWWDT_SWR_OFFSET);
+		fcr = (fcr >> XWWDT_SBC_SHIFT) & XWWDT_SBC_MASK;
+		fcr = fcr | XWWDT_BSS_MASK;
+		iowrite32(fcr, xdev->base + XWWDT_FCR_OFFSET);
+	} else {
+		iowrite32((u32)pre_timeout,
+			  xdev->base + XWWDT_FWR_OFFSET);
+		iowrite32((u32)time_out, xdev->base + XWWDT_SWR_OFFSET);
+		iowrite32(0x0, xdev->base + XWWDT_FCR_OFFSET);
+	}
+
+	/* Enable the window watchdog timer */
+	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
+	control_status_reg |= XWWDT_ESR_WEN_MASK;
+	iowrite32(control_status_reg, xdev->base + XWWDT_ESR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	dev_dbg(xilinx_wwdt_wdd->parent, "Watchdog Started!\n");
+
+	return 0;
+}
+
+static int xilinx_wwdt_stop(struct watchdog_device *wdd)
+{
+	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
+
+	if (!is_wwdt_in_closed_window(wdd)) {
+		dev_warn(xilinx_wwdt_wdd->parent, "timer in closed window");
+		return -EINVAL;
+	}
+
+	spin_lock(&xdev->spinlock);
+
+	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
+	/* Disable the Window watchdog timer */
+	iowrite32(~(u32)XWWDT_ESR_WEN_MASK,
+		  xdev->base + XWWDT_ESR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	if (watchdog_active(xilinx_wwdt_wdd))
+		clk_disable(xdev->clk);
+
+	dev_dbg(xilinx_wwdt_wdd->parent, "Watchdog Stopped!\n");
+
+	return 0;
+}
+
+static int xilinx_wwdt_keepalive(struct watchdog_device *wdd)
+{
+	u32 control_status_reg;
+	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
+
+	/* Refresh in open window is ignored */
+	if (!is_wwdt_in_closed_window(wdd))
+		return 0;
+
+	spin_lock(&xdev->spinlock);
+
+	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
+	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
+	control_status_reg |= XWWDT_ESR_WINT_MASK;
+	control_status_reg &= ~XWWDT_ESR_WSW_MASK;
+	iowrite32(control_status_reg, xdev->base + XWWDT_ESR_OFFSET);
+	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
+	control_status_reg |= XWWDT_ESR_WSW_MASK;
+	iowrite32(control_status_reg, xdev->base + XWWDT_ESR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	return 0;
+}
+
+static int xilinx_wwdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int new_time)
+{
+	u32 ret = 0;
+	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
+
+	if (!is_wwdt_in_closed_window(wdd)) {
+		dev_warn(xilinx_wwdt_wdd->parent, "timer in closed window");
+		return -EINVAL;
+	}
+
+	if (new_time < XWWDT_MIN_TIMEOUT ||
+	    new_time > XWWDT_MAX_TIMEOUT) {
+		dev_warn(xilinx_wwdt_wdd->parent,
+			 "timeout value must be %d<=x<=%d, using %d\n",
+			 XWWDT_MIN_TIMEOUT,
+			 XWWDT_MAX_TIMEOUT, new_time);
+		return -EINVAL;
+	}
+
+	wdd->timeout = new_time;
+	wdd->pretimeout = 0;
+
+	if (watchdog_active(xilinx_wwdt_wdd)) {
+		ret = xilinx_wwdt_start(wdd);
+		if (ret)
+			dev_dbg(xilinx_wwdt_wdd->parent, "timer start failed");
+	}
+
+	return ret;
+}
+
+static int xilinx_wwdt_set_pretimeout(struct watchdog_device *wdd,
+				      u32 new_pretimeout)
+{
+	u32 ret = 0;
+	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
+
+	if (!is_wwdt_in_closed_window(wdd)) {
+		dev_warn(xilinx_wwdt_wdd->parent, "timer in closed window");
+		return -EINVAL;
+	}
+
+	if (new_pretimeout < wdd->min_timeout ||
+	    new_pretimeout >= wdd->timeout)
+		return -EINVAL;
+
+	wdd->pretimeout = new_pretimeout;
+
+	if (watchdog_active(xilinx_wwdt_wdd)) {
+		ret = xilinx_wwdt_start(wdd);
+		if (ret)
+			dev_dbg(xilinx_wwdt_wdd->parent, "timer start failed");
+	}
+
+	return ret;
+}
+
+static void xwwdt_clk_disable_unprepare(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static irqreturn_t xilinx_wwdt_isr(int irq, void *wdog_arg)
+{
+	struct xwwdt_device *xdev = wdog_arg;
+
+	watchdog_notify_pretimeout(&xdev->xilinx_wwdt_wdd);
+
+	return IRQ_HANDLED;
+}
+
+static const struct watchdog_info xilinx_wwdt_ident = {
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_SETTIMEOUT,
+	.firmware_version = 1,
+	.identity = "xlnx_window watchdog",
+};
+
+static const struct watchdog_info xilinx_wwdt_pretimeout_ident = {
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_PRETIMEOUT |
+		   WDIOF_SETTIMEOUT,
+	.firmware_version = 1,
+	.identity = "xlnx_window watchdog",
+};
+
+static const struct watchdog_ops xilinx_wwdt_ops = {
+	.owner = THIS_MODULE,
+	.start = xilinx_wwdt_start,
+	.stop = xilinx_wwdt_stop,
+	.ping = xilinx_wwdt_keepalive,
+	.set_timeout = xilinx_wwdt_set_timeout,
+	.set_pretimeout = xilinx_wwdt_set_pretimeout,
+};
+
+static int xwwdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct watchdog_device *xilinx_wwdt_wdd;
+	struct xwwdt_device *xdev;
+	u32 pre_timeout = 0;
+	int ret;
+
+	xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
+	if (!xdev)
+		return -ENOMEM;
+
+	xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
+	xilinx_wwdt_wdd->info = &xilinx_wwdt_ident;
+	xilinx_wwdt_wdd->ops = &xilinx_wwdt_ops;
+	xilinx_wwdt_wdd->parent = dev;
+
+	xdev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(xdev->base))
+		return PTR_ERR(xdev->base);
+
+	ret = of_property_read_u32(dev->of_node, "pretimeout-sec",
+				   &pre_timeout);
+	if (ret)
+		dev_dbg(dev,
+			"Parameter \"pretimeout-sec\" not found\n");
+
+	xdev->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(xdev->clk))
+		return PTR_ERR(xdev->clk);
+
+	ret = clk_get_rate(xdev->clk);
+	if (!ret)
+		return -EINVAL;
+
+	ret = clk_prepare_enable(xdev->clk);
+	if (ret) {
+		dev_err(dev, "unable to enable clock\n");
+		return ret;
+	}
+	ret = devm_add_action_or_reset(dev, xwwdt_clk_disable_unprepare,
+				       xdev->clk);
+	if (ret)
+		goto err_clk_disable;
+
+	xilinx_wwdt_wdd->pretimeout = pre_timeout;
+	xilinx_wwdt_wdd->timeout = XWWDT_DEFAULT_TIMEOUT;
+	xilinx_wwdt_wdd->min_timeout = XWWDT_MIN_TIMEOUT;
+	xilinx_wwdt_wdd->max_timeout = XWWDT_MAX_TIMEOUT;
+
+	xdev->irq = platform_get_irq_byname(pdev, "wdt");
+	if (xdev->irq < 0) {
+		ret = xdev->irq;
+		goto err_clk_disable;
+	}
+
+	if (!devm_request_irq(dev, xdev->irq, xilinx_wwdt_isr,
+			      0, dev_name(dev), xdev)) {
+		xilinx_wwdt_wdd->info = &xilinx_wwdt_pretimeout_ident;
+	}
+
+	ret = watchdog_init_timeout(xilinx_wwdt_wdd,
+				    wwdt_timeout, &pdev->dev);
+	if (ret)
+		dev_info(&pdev->dev, "Configured default timeout value\n");
+
+	spin_lock_init(&xdev->spinlock);
+	watchdog_set_drvdata(xilinx_wwdt_wdd, xdev);
+
+	ret = devm_watchdog_register_device(dev, xilinx_wwdt_wdd);
+	if (ret)
+		goto err_clk_disable;
+
+	clk_disable_unprepare(xdev->clk);
+
+	dev_info(dev, "Xilinx Window Watchdog Timer with timeout %ds\n",
+		 xilinx_wwdt_wdd->timeout);
+
+	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(xdev->clk);
+	return ret;
+}
+
+/* Mat for of_platform binding */
+static const struct of_device_id xwwdt_of_match[] = {
+	{ .compatible = "xlnx,versal-wwdt-1.0", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, xwwdt_of_match);
+
+static struct platform_driver xwwdt_driver = {
+	.probe = xwwdt_probe,
+	.driver = {
+		.name = "Xilinx Window Watchdog",
+		.of_match_table = xwwdt_of_match,
+	},
+};
+
+module_platform_driver(xwwdt_driver);
+
+MODULE_AUTHOR("Neeli Srinivas <sneeli@xilinx.com>");
+MODULE_DESCRIPTION("Xilinx Window Watchdog driver");
+MODULE_LICENSE("GPL");
-- 
2.22.0

