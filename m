Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC5D33B049
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhCOKsN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:48:13 -0400
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com ([40.107.93.85]:3104
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229879AbhCOKrl (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXU4eOhKjEEkN+eMqZNUV08x2NO5EW93T49qUXMmRLzbbcf4pP06aIw8VmHIQ7YW8Yim2kULfHmahl2riVZeu3IROuZBW0feWPJEuB07sduqxP0i+YWXGAOJOxmuGeIfZWzuGfV8vloW2cfyecxvn9Iwz5wYweMnYMMY1CfvbVfh6ExL8/CLK4Y48PQkRAtReOzENMcQTBuVX1kFLFCwN6bDE9gFUyAV2kKaYiwu+pXVJgzoTxn6EK+nmfAVaiR/NPPDFC4STk0wwI3rOnpRCJPRjHg9wy6VuZc+2ISmCN0mnDX+WJFtHUUsWxTBg0/x3ZgyGaSBAcCx4udTvoXF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rWlee/N981L8R/FIkHzNkMapvUxZLYDnv+/PWstzpg=;
 b=KVYx2wck2SJ68hkxIota/Vumr+XXirD3w9nlC4jDhnYNW0MRM2/wSf/pkHnsyMfpWnhol0LiA3E6xAjIAqkXu94fmgurafV66ok858rbTjFU1LcFasQNeAIsCmLmQ90ki4J5B3QsJhqe2tI/CmQaEYvrKArg/sdVCMIhcwAwC196BBcW5UF+O5eU5z1MZWAuHVs+0HL5rtkL9+jKKdgW99IzCrJA7poBKeOVpJ9TniBbsH/jCnD5eGWS0DGv70PXso6qvLeMqufpGJpqoNQIXREJosxl2r5+bitY54DtXsJU+RM32b8qx5rbo0IKL+Vm3/hodrun00Z6rWMe2PqNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rWlee/N981L8R/FIkHzNkMapvUxZLYDnv+/PWstzpg=;
 b=BR056tDl5XgSuj7lf6T8n38wz44U9CXXozcR/ugnWbXaxBycpB4B7juJ9VmtTdvi3KbbpHv8/C27R1TnN0+D0S10D8wnPInshTi+fzG0O/M8H9wpYbIu5CjSgnNuiw7e1TOJ9/f1AqTHcDrdRaqnTl6uV4FwP24xIfOUioWnWBg=
Received: from CY4PR2201CA0011.namprd22.prod.outlook.com
 (2603:10b6:910:5f::21) by BN7PR02MB4145.namprd02.prod.outlook.com
 (2603:10b6:406:fd::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 10:47:39 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:5f:cafe::13) by CY4PR2201CA0011.outlook.office365.com
 (2603:10b6:910:5f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:37 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:37 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkl6-00055N-49; Mon, 15 Mar 2021 03:47:36 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 7/9] watchdog: of_xilinx_wdt: Add Versal Window watchdog support
Date:   Mon, 15 Mar 2021 16:16:52 +0530
Message-ID: <1615805214-24857-8-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ed7fe9-5eee-4dfb-0cec-08d8e79fc08e
X-MS-TrafficTypeDiagnostic: BN7PR02MB4145:
X-Microsoft-Antispam-PRVS: <BN7PR02MB4145D74907B2DB0148D86231AF6C9@BN7PR02MB4145.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zhwvBiNhPXhZRkR0QmjJ1MtMh7tVSPlrczUDoqZO6Ljbn5ArDA15raCL+kYhkF+5F5xAM9jD/qPaf4+44a8CIgiVAzCjViuZjJFFIdc2cbMSiqrfAGIbpyWdLd6lVsQIbW4Bv4O4zBiym/RlVZmWO7rzqP91Hp39TDCy3R0pbWoLBa2+QvWfSfOkCTZ9oZwXo0+bYNaIQiJdJzMFb6a6AmcnC1jEl9Sz0ToCYLE1yB8TJu9AhH+rbi1MeKdeA9aZGvGs/Ap1xUUVxr1KfP7omotdxI+jAKBZD9LjBZuUk2HPhUFHSBR2UudsVm2ZKsEwOxCUS7yVzRfEF2ZQhW5lorMjKs98WgS2ek4RTHaqdySxJ7xG8o4zJo8P3Y++a0yHRYcA79tiIKmwlWGzPq/SYjbMkO6e9wBohF1UY+8bs11zTbPnVy8VlhoIJ2AlbrXDM/ScMq8fHDkCg+XokqBhnjrwuJSOxCgoHcxUeXU6wWW6THx0g1hU1hNidP8SrYTeV1M3g7dNjq0XT3nfzA7SNcPbbG9439RpN6gEDk02B6tYpZvoG2u++KYLMGTyWZ7QHYnhyzKausLm/ZOQv/6vYDhEWvg9OZ4nQNqUyHnUdhdQfSdHHUi/kpXxmnGr4PHRm3uTDgugQvmQDQqBvCTaWWR3cM9pWRc+yQzG3D2UoyMYNE3eUaPozWs/vWvEHvFe
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966006)(36840700001)(7636003)(70206006)(44832011)(5660300002)(47076005)(70586007)(316002)(356005)(478600001)(8936002)(4326008)(336012)(110136005)(6666004)(82310400003)(7696005)(36756003)(54906003)(426003)(6636002)(82740400003)(2616005)(186003)(8676002)(107886003)(36906005)(2906002)(26005)(36860700001)(30864003)(83380400001)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:38.8646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ed7fe9-5eee-4dfb-0cec-08d8e79fc08e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4145
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Versal watchdog driver uses Window watchdog mode. Window watchdog
timer(WWDT) contains closed(first) and open(second) window with
32 bit width. WWDT will generate an interrupt after the first window
timeout and reset signal after the second window timeout. Timeout
and Pre-timeout configuration, Stop and Refresh trigger only
in open window.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 285 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 3b93b60f1a00..3656e716b4f7 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -2,10 +2,11 @@
 /*
  * Watchdog Device Driver for Xilinx axi/xps_timebase_wdt
  *
- * (C) Copyright 2013 - 2014 Xilinx, Inc.
+ * (C) Copyright 2013 - 2021 Xilinx, Inc.
  * (C) Copyright 2011 (Alejandro Cabrera <aldaya@gmail.com>)
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -17,6 +18,11 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
+#include <linux/interrupt.h>
+
+#define XWT_WWDT_DEFAULT_TIMEOUT	10
+#define XWT_WWDT_MIN_TIMEOUT		1
+#define XWT_WWDT_MAX_TIMEOUT		42
 
 /* Register offsets for the Wdt device */
 #define XWT_TWCSR0_OFFSET   0x0 /* Control/Status Register0 */
@@ -35,15 +41,44 @@
 #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
 #define XWT_TIMER_FAILED            0xFFFFFFFF
 
+/* Register offsets for the WWdt device */
+#define XWT_WWDT_MWR_OFFSET	0x00
+#define XWT_WWDT_ESR_OFFSET	0x04
+#define XWT_WWDT_FCR_OFFSET	0x08
+#define XWT_WWDT_FWR_OFFSET	0x0c
+#define XWT_WWDT_SWR_OFFSET	0x10
+
+/* Master Write Control Register Masks */
+#define XWT_WWDT_MWR_MASK	BIT(0)
+
+/* Enable and Status Register Masks */
+#define XWT_WWDT_ESR_WINT_MASK	BIT(16)
+#define XWT_WWDT_ESR_WSW_MASK	BIT(8)
+#define XWT_WWDT_ESR_WEN_MASK	BIT(0)
+
+/* Function control Register Masks */
+#define XWT_WWDT_SBC_MASK	0xFF00
+#define XWT_WWDT_SBC_SHIFT	16
+#define XWT_WWDT_BSS_MASK	0xC0
+
 #define WATCHDOG_NAME     "Xilinx Watchdog"
 
+static int wdt_timeout;
+
+module_param(wdt_timeout, int, 0644);
+MODULE_PARM_DESC(wdt_timeout,
+		 "Watchdog time in seconds. (default="
+		 __MODULE_STRING(XWT_WWDT_DEFAULT_TIMEOUT) ")");
+
 /**
  * enum xwdt_ip_type - WDT IP type.
  *
  * @XWDT_WDT: Soft wdt ip.
+ * @XWDT_WWDT: Window wdt ip.
  */
 enum xwdt_ip_type {
 	XWDT_WDT = 0,
+	XWDT_WWDT = 1,
 };
 
 struct xwdt_devtype_data {
@@ -58,6 +93,7 @@ struct xwdt_device {
 	spinlock_t spinlock; /* spinlock for register handling */
 	struct watchdog_device xilinx_wdt_wdd;
 	struct clk		*clk;
+	int irq;
 };
 
 static int xilinx_wdt_start(struct watchdog_device *wdd)
@@ -145,6 +181,220 @@ static const struct watchdog_ops xilinx_wdt_ops = {
 	.ping = xilinx_wdt_keepalive,
 };
 
+static int is_wwdt_in_closed_window(struct watchdog_device *wdd)
+{
+	u32 control_status_reg;
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+
+	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
+	if (control_status_reg & XWT_WWDT_ESR_WEN_MASK)
+		if (!(control_status_reg & XWT_WWDT_ESR_WSW_MASK))
+			return 0;
+
+	return 1;
+}
+
+static int xilinx_wwdt_start(struct watchdog_device *wdd)
+{
+	int ret;
+	u32 control_status_reg, fcr;
+	u64 time_out, pre_timeout, count;
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	count = clk_get_rate(xdev->clk);
+	if (!count)
+		return -EINVAL;
+
+	/* Calculate timeout count */
+	pre_timeout = count * wdd->pretimeout;
+	time_out = count * wdd->timeout;
+	if (!watchdog_active(xilinx_wdt_wdd)) {
+		ret  = clk_enable(xdev->clk);
+		if (ret) {
+			dev_err(wdd->parent, "Failed to enable clock\n");
+			return ret;
+		}
+	}
+
+	spin_lock(&xdev->spinlock);
+	iowrite32(XWT_WWDT_MWR_MASK, xdev->base + XWT_WWDT_MWR_OFFSET);
+	iowrite32(~(u32)XWT_WWDT_ESR_WEN_MASK,
+		  xdev->base + XWT_WWDT_ESR_OFFSET);
+
+	if (pre_timeout) {
+		iowrite32((u32)(time_out - pre_timeout),
+			  xdev->base + XWT_WWDT_FWR_OFFSET);
+		iowrite32((u32)pre_timeout, xdev->base + XWT_WWDT_SWR_OFFSET);
+		fcr = ioread32(xdev->base + XWT_WWDT_SWR_OFFSET);
+		fcr = (fcr >> XWT_WWDT_SBC_SHIFT) & XWT_WWDT_SBC_MASK;
+		fcr = fcr | XWT_WWDT_BSS_MASK;
+		iowrite32(fcr, xdev->base + XWT_WWDT_FCR_OFFSET);
+	} else {
+		iowrite32((u32)pre_timeout,
+			  xdev->base + XWT_WWDT_FWR_OFFSET);
+		iowrite32((u32)time_out, xdev->base + XWT_WWDT_SWR_OFFSET);
+		iowrite32(0x0, xdev->base + XWT_WWDT_FCR_OFFSET);
+	}
+
+	/* Enable the window watchdog timer */
+	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
+	control_status_reg |= XWT_WWDT_ESR_WEN_MASK;
+	iowrite32(control_status_reg, xdev->base + XWT_WWDT_ESR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Started!\n");
+
+	return 0;
+}
+
+static int xilinx_wwdt_stop(struct watchdog_device *wdd)
+{
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	if (!is_wwdt_in_closed_window(wdd)) {
+		dev_warn(xilinx_wdt_wdd->parent, "timer in closed window");
+		return -EINVAL;
+	}
+
+	spin_lock(&xdev->spinlock);
+
+	iowrite32(XWT_WWDT_MWR_MASK, xdev->base + XWT_WWDT_MWR_OFFSET);
+	/* Disable the Window watchdog timer */
+	iowrite32(~(u32)XWT_WWDT_ESR_WEN_MASK,
+		  xdev->base + XWT_WWDT_ESR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	if (watchdog_active(xilinx_wdt_wdd))
+		clk_disable(xdev->clk);
+
+	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Stopped!\n");
+
+	return 0;
+}
+
+static int xilinx_wwdt_keepalive(struct watchdog_device *wdd)
+{
+	u32 control_status_reg;
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+
+	/* Refresh in open window is ignored */
+	if (!is_wwdt_in_closed_window(wdd))
+		return 0;
+
+	spin_lock(&xdev->spinlock);
+
+	iowrite32(XWT_WWDT_MWR_MASK, xdev->base + XWT_WWDT_MWR_OFFSET);
+	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
+	control_status_reg |= XWT_WWDT_ESR_WINT_MASK;
+	control_status_reg &= ~XWT_WWDT_ESR_WSW_MASK;
+	iowrite32(control_status_reg, xdev->base + XWT_WWDT_ESR_OFFSET);
+	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
+	control_status_reg |= XWT_WWDT_ESR_WSW_MASK;
+	iowrite32(control_status_reg, xdev->base + XWT_WWDT_ESR_OFFSET);
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
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	if (!is_wwdt_in_closed_window(wdd)) {
+		dev_warn(xilinx_wdt_wdd->parent, "timer in closed window");
+		return -EINVAL;
+	}
+
+	if (new_time < XWT_WWDT_MIN_TIMEOUT ||
+	    new_time > XWT_WWDT_MAX_TIMEOUT) {
+		dev_warn(xilinx_wdt_wdd->parent,
+			 "timeout value must be %d<=x<=%d, using %d\n",
+				XWT_WWDT_MIN_TIMEOUT,
+				XWT_WWDT_MAX_TIMEOUT, new_time);
+		return -EINVAL;
+	}
+
+	wdd->timeout = new_time;
+	wdd->pretimeout = 0;
+
+	if (watchdog_active(xilinx_wdt_wdd)) {
+		ret = xilinx_wwdt_start(wdd);
+		if (ret)
+			dev_dbg(xilinx_wdt_wdd->parent, "timer start failed");
+	}
+
+	return 0;
+}
+
+static int xilinx_wwdt_set_pretimeout(struct watchdog_device *wdd,
+				      u32 new_pretimeout)
+{
+	u32 ret = 0;
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	if (!is_wwdt_in_closed_window(wdd)) {
+		dev_warn(xilinx_wdt_wdd->parent, "timer in closed window");
+		return -EINVAL;
+	}
+
+	if (new_pretimeout < wdd->min_timeout ||
+	    new_pretimeout >= wdd->timeout)
+		return -EINVAL;
+
+	wdd->pretimeout = new_pretimeout;
+
+	if (watchdog_active(xilinx_wdt_wdd)) {
+		ret = xilinx_wwdt_start(wdd);
+		if (ret)
+			dev_dbg(xilinx_wdt_wdd->parent, "timer start failed");
+	}
+
+	return 0;
+}
+
+static irqreturn_t xilinx_wwdt_isr(int irq, void *wdog_arg)
+{
+	struct xwdt_device *xdev = wdog_arg;
+
+	watchdog_notify_pretimeout(&xdev->xilinx_wdt_wdd);
+	return IRQ_HANDLED;
+}
+
+static const struct watchdog_info xilinx_wwdt_ident = {
+	.options =  WDIOF_MAGICCLOSE |
+		WDIOF_KEEPALIVEPING |
+		WDIOF_SETTIMEOUT,
+	.firmware_version = 1,
+	.identity = "xlnx_wwdt watchdog",
+};
+
+static const struct watchdog_info xilinx_wwdt_pretimeout_ident = {
+	.options = WDIOF_MAGICCLOSE |
+		   WDIOF_KEEPALIVEPING |
+		   WDIOF_PRETIMEOUT |
+		   WDIOF_SETTIMEOUT,
+	.firmware_version = 1,
+	.identity = "xlnx_wwdt watchdog",
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
 static u32 xwdt_selftest(struct xwdt_device *xdev)
 {
 	int i;
@@ -181,11 +431,19 @@ static const struct xwdt_devtype_data xwdt_wdt_data = {
 	.xwdt_ops = &xilinx_wdt_ops,
 };
 
+static const struct xwdt_devtype_data xwdt_wwdt_data = {
+	.wdttype = XWDT_WWDT,
+	.xwdt_info = &xilinx_wwdt_ident,
+	.xwdt_ops = &xilinx_wwdt_ops,
+};
+
 static const struct of_device_id xwdt_of_match[] = {
 	{ .compatible = "xlnx,xps-timebase-wdt-1.00.a",
 		.data = &xwdt_wdt_data },
 	{ .compatible = "xlnx,xps-timebase-wdt-1.01.a",
 		.data = &xwdt_wdt_data },
+	{ .compatible = "xlnx,versal-wwdt-1.0",
+		.data = &xwdt_wwdt_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xwdt_of_match);
@@ -194,7 +452,7 @@ static int xwdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int rc;
-	u32 pfreq = 0, enable_once = 0;
+	u32 pfreq = 0, enable_once = 0, pre_timeout = 0;
 	struct xwdt_device *xdev;
 	struct watchdog_device *xilinx_wdt_wdd;
 	const struct of_device_id *of_id;
@@ -236,6 +494,12 @@ static int xwdt_probe(struct platform_device *pdev)
 				 "Parameter \"xlnx,wdt-enable-once\" not found\n");
 
 		watchdog_set_nowayout(xilinx_wdt_wdd, enable_once);
+	} else {
+		rc = of_property_read_u32(dev->of_node, "pretimeout-sec",
+					  &pre_timeout);
+		if (rc)
+			dev_dbg(dev,
+				"Parameter \"pretimeout-sec\" not found\n");
 	}
 
 	xdev->clk = devm_clk_get(dev, NULL);
@@ -268,6 +532,23 @@ static int xwdt_probe(struct platform_device *pdev)
 			xilinx_wdt_wdd->timeout =
 				2 * ((1 << xdev->wdt_interval) /
 					pfreq);
+	} else {
+		xilinx_wdt_wdd->pretimeout = pre_timeout;
+		xilinx_wdt_wdd->timeout = XWT_WWDT_DEFAULT_TIMEOUT;
+		xilinx_wdt_wdd->min_timeout = XWT_WWDT_MIN_TIMEOUT;
+		xilinx_wdt_wdd->max_timeout = XWT_WWDT_MAX_TIMEOUT;
+		xdev->irq = platform_get_irq_byname(pdev, "wdt");
+		if (xdev->irq > 0) {
+			if (!devm_request_irq(dev, xdev->irq, xilinx_wwdt_isr,
+					      0, dev_name(dev), xdev)) {
+				xilinx_wdt_wdd->info =
+				&xilinx_wwdt_pretimeout_ident;
+			}
+		}
+		rc = watchdog_init_timeout(xilinx_wdt_wdd,
+					   wdt_timeout, &pdev->dev);
+		if (rc)
+			dev_warn(&pdev->dev, "unable to set timeout value\n");
 	}
 
 	spin_lock_init(&xdev->spinlock);
-- 
2.7.4

