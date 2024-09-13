Return-Path: <linux-watchdog+bounces-1890-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47289977E7D
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 13:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3491C218EA
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 11:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3A61D7E54;
	Fri, 13 Sep 2024 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KcgQIpLI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3611C2330;
	Fri, 13 Sep 2024 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726227176; cv=fail; b=ul9P3c/cHKgS825IJ2TJzHJS+9rxOpkjW33wlCFokUwFi3QtkocVf2XCarlgK3P3nhD4qXt/lFyBKIcB559XOyAUQDKhNuAREkutk5sh1mgfSQZaRmwCPGGoIsV6WXYm+KdoWexkQmZ1SD6X1vNbJKzImW5IiO0nXfkSLemcDO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726227176; c=relaxed/simple;
	bh=aFCnFsDePmcQLgD7lkZkqY7EqgY8FAxRZPWLGO3PzjA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PRrpjNH5uwf0XJd4ZnJ9AoDGysMOY7b2U5V/ODdgdy5/juuT6uCCBVFjP6LN9lncAPtzaeK3+IQZ6dQ2lo/az7hKpjpExx7NMzEjMiLnTSmTVl3sgixCAO1NCR26hsiYDrJUJjl/gT2TMcbTdjn8+EPrJKLCrUYheVEgE0dxkDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KcgQIpLI; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDG9/opldNvI9URGRyDocj9k1MgAbq1thwCfn1D7GcGwFo+7nsSYaZ2VqG2goVwOIPKl4XE4pvK0k9vCFBIop+Rouz7EA0pJIU6+Rqgr7pYYbV6UmK+NbpcSLBMG5qjGVP7NEhEAbjQeTru2JSiBG+B5ea0ZDyMo0kXYp65jMNdptDFNRJKSThtcPig3CYKAPenPp2v/MZLhJsdn2C6NIsYs+ZGqoeDQMgFY0x86g1ib47lEfCkzvPVbjLv3SbMrjBYMWaL0opJCfbvCme8gZDDmjWK80v5Vne95Ol5T1nZGB+64TD8pZQvawWfTdg7714Vh8ZUYCwEn35njTAcJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ly2MwzGD2iKZhM8idzr1aUpbydBWSPAMSqGYAR5fRh0=;
 b=b2xoTI4H21kMVpTo8h/nUEkImSYSZs7rRC/vn3k3Rf8t84tiDQQdF/PQiE7PGUptWF9pnpVNfyhjtx6boGbC4+4iJQjUD03ykquHVW8d7GpPHZ8YGMOYbAZ0/19/wjKpR7uO8w4jmSLDgS9JzWWOJrldpgffvUdqiPcunYAcQh3eXM8O77xZBST1KLeNWRw4ud3GTbfmwDjYN1xQ4i0qvD8JXRGwlpsyZPabWIB5Y9bPWe3/h+G9o0tArbz+QAa1cFeMORB77frBqP814A2SDjQ4EuChzneZE9+nN1pTL2j4NPUROikgMn0TrHi/BS5n9syXgb5XPuVMw2Umz5fd4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly2MwzGD2iKZhM8idzr1aUpbydBWSPAMSqGYAR5fRh0=;
 b=KcgQIpLI/r7WtDnN3NPUCLrNjzvJ/V5TyELvR0xgX4DtnF6OFZldaDplEt/9OsFpvncCfAPPNko4f+TN+fSDIZs7oE7YIJznN+Cux42Zi9p5DK1FcEOLpgw3zTZxn3001DKgFGTrSxgapcUkDYiZgxr8Ms+SSVr0UBetiMJuf4s=
Received: from CH0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:610:119::17)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 11:32:46 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::5b) by CH0PR03CA0368.outlook.office365.com
 (2603:10b6:610:119::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Fri, 13 Sep 2024 11:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 11:32:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 06:32:44 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Sep 2024 06:32:41 -0500
From: Harini T <harini.t@amd.com>
To: <linux@roeck-us.net>, <michal.simek@amd.com>, <srinivas.neeli@amd.com>,
	<shubhrajyoti.datta@amd.com>
CC: <srinivas.goud@amd.com>, <wim@linux-watchdog.org>,
	<linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V3] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency
Date: Fri, 13 Sep 2024 17:02:30 +0530
Message-ID: <20240913113230.1939373-1-harini.t@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harini.t@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce6206e-30df-41d6-e18a-08dcd3e7ca0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/P1Qh7YnLVXUiaNE6HOAMKt4xuOTgRsMvP/QoVg0IdMikzXRcKGBXm1Tq6mY?=
 =?us-ascii?Q?W4bz+tYBYKH2AgTwVqC9hbDNhnQduheMUpS3A+Q0Yctm2m0o0k4a8aIcc3ky?=
 =?us-ascii?Q?k03q04YQzcYy63d1Q/uwzqq+lgWYEBlcTdmkO/z69vzFDo5H0z/Odim15k/5?=
 =?us-ascii?Q?49o1PJiHPvhrbWwBfQTKyLRs66GGGw/tcfkqBR4PWS4YQ1PFtWi68PrZB6Mr?=
 =?us-ascii?Q?pw6/CTcZK9sPbTTusPeH1NLwdGb/9NQt3iH3pSkafJtYKS7JEHLHspR3JvJH?=
 =?us-ascii?Q?dO6x1XaBwdIn6jKtKoUjkBL4CmNfOw/3QO0ShKryWR2p49rIpOyz0TmTo5mt?=
 =?us-ascii?Q?TEz1QPnWTMMw5hR561nME5qToDeF7JTP6wnekShju5c9AOP5QDGpCwYGdCDd?=
 =?us-ascii?Q?uueWket1VyZB784+Z+P/bVWOIybSSnMzBpoxf8BinXHm37KGNoO+WlSnG0VU?=
 =?us-ascii?Q?ldtL/LTrUOJY4pQA8yxRE/QJx7S1GX5a1adQRHuJTiDmfVzefN2Q1J8D8yQt?=
 =?us-ascii?Q?wXFwJhyFQKZJaftE6GlOeQgzszXt61PwjUqP1tnTD8S6k7Dv4pnlLfL4gKfM?=
 =?us-ascii?Q?7zeKC125p2MVbdDHbRhuPF0FL2EXmcFpnZePr2IzUr/qvcco5F1X7pgfucGt?=
 =?us-ascii?Q?hX2LD7Cbc4sEtwQU3d2GUY3EpUcotokPLz+d1qy8taTkqi4LHPrBXMiwX33S?=
 =?us-ascii?Q?fbYpyPhgnYOhQ7ZY7WNv5hFa0+U7pkpDeJphiK6hu94uxfKRp4ibWuxVqJd6?=
 =?us-ascii?Q?oI4qtOaVtT+dwIbQD8UFsCf3ldbkkVuCgRUp3qe1j7jH4ObcW2DI05nSu7tw?=
 =?us-ascii?Q?+/W5ze8WqMePc3m09u9p2N0ERTrSgd1+x0+q5wgz5dHk15b8GxS48rJAfZLT?=
 =?us-ascii?Q?eGt2PvrbnzjYZhkGBf6y9XyOpr670NsHcF3cax7tFVg9u+n6eY/eYo2nbnDI?=
 =?us-ascii?Q?u1kc1gWWwFxv+OXb03FAwZ2fuHhOA60OWkI/QmM8i8Y2fUrLIOaVNaSaM3ws?=
 =?us-ascii?Q?2q6pexTa+iCFRPPDSz3zyaF6+78CpDGyYpm2pCQi8myKr9wPuHoqlJ7oDMwA?=
 =?us-ascii?Q?kl9vKalSuZGqF4mJ0iL5TcIaC4LBCMP8iu82S3w3ZbZg0xippYkO0cb+Ufwj?=
 =?us-ascii?Q?8W4FHsRzK+s06krUmfgWDT5YfWel6OL8RFoTDkbj757zyupKLJPo/JP25fdO?=
 =?us-ascii?Q?Xxln9iXU+F+xu20dnPBpVx0Q3IEb+c4eRHhXlHIh2dsmJ1VENfxhRMtwk+CP?=
 =?us-ascii?Q?uo+QGrbrTeuogbDsskQ56tDuxCdr3Ms124Aej5lhPNrzk5c3vxTsBGPlTCAN?=
 =?us-ascii?Q?zMSWEtzCLKXq6l2xxXC2rtwB7bLh7HCPq26LnG2qHdX9Wb9NfI4woeT20qO5?=
 =?us-ascii?Q?dxfu+tmt4+w7POboMM8kjMF00qhNfAPSAvEra9LuTwqdbBLxRQgS2AZ/MEMe?=
 =?us-ascii?Q?lmHDJAuyOv2O1NUYOK2D5vjGNGtnjiztq74Tui9oPTK2XHOvmQTPxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 11:32:45.9603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce6206e-30df-41d6-e18a-08dcd3e7ca0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885

In the current implementation, the value of max_hw_heartbeat_ms is set
to the timeout period expressed in milliseconds and fails to verify if
the close window percentage exceeds the maximum value that the hardware
supports.

1. Calculate max_hw_heartbeat_ms based on input clock frequency.
2. Update frequency check to require a minimum frequency of 1Mhz.
3. Limit the close and open window percent to hardware supported value
to avoid truncation.
4. If the user input timeout exceeds the maximum timeout supported, use
only open window and the framework supports the higher timeouts.

Fixes: 12984cea1b8c ("watchdog: xilinx_wwdt: Add Versal window watchdog support")

Signed-off-by: Harini T <harini.t@amd.com>
---

Changes in V3:
- Use u32 for timeout_ms as the timeout cannot exceed UINT_MAX/1000.
- Update frequency check in the code to require a minimum frequency of
  1Mhz to prevent potential logic issues and ensure proper device
  functioning.
- Use div_u64 instead of div64_64() to calculate ticks for 1ms.
- Use standard multi-line comments.

Changes in V2:
- Modify the implementation to make the timeout independent of the
  maximum hardware timeout as the framework supports it.
- Modify the implementation to obtain ticks from milliseconds instead of
  ticks from seconds to avoid the minor time difference between hardware
  and software.
- Limit the close and open window percentage to hardware supported value
  to avoid truncation.
- If the timeout exceeds the maximum timeout supported, use only open
  window and set the min_hw_heartbeat_ms to zero.
- Modify the commit title and description.
- Add Fixes tag in commit description.

V2 link: https://lore.kernel.org/all/20240715053537.290064-1-harini.t@amd.com/

V1 link: https://lore.kernel.org/all/20240319111219.21094-1-harini.t@amd.com/

---
 drivers/watchdog/xilinx_wwdt.c | 75 ++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/xilinx_wwdt.c b/drivers/watchdog/xilinx_wwdt.c
index d271e2e8d6e2..3d2a156f7180 100644
--- a/drivers/watchdog/xilinx_wwdt.c
+++ b/drivers/watchdog/xilinx_wwdt.c
@@ -2,7 +2,7 @@
 /*
  * Window watchdog device driver for Xilinx Versal WWDT
  *
- * Copyright (C) 2022 - 2023, Advanced Micro Devices, Inc.
+ * Copyright (C) 2022 - 2024, Advanced Micro Devices, Inc.
  */
 
 #include <linux/clk.h>
@@ -36,6 +36,12 @@
 
 #define XWWDT_CLOSE_WINDOW_PERCENT	50
 
+/* Maximum count value of each 32 bit window */
+#define XWWDT_MAX_COUNT_WINDOW		GENMASK(31, 0)
+
+/* Maximum count value of closed and open window combined */
+#define XWWDT_MAX_COUNT_WINDOW_COMBINED	GENMASK_ULL(32, 1)
+
 static int wwdt_timeout;
 static int closed_window_percent;
 
@@ -54,6 +60,8 @@ MODULE_PARM_DESC(closed_window_percent,
  * @xilinx_wwdt_wdd: watchdog device structure
  * @freq: source clock frequency of WWDT
  * @close_percent: Closed window percent
+ * @closed_timeout: Closed window timeout in ticks
+ * @open_timeout: Open window timeout in ticks
  */
 struct xwwdt_device {
 	void __iomem *base;
@@ -61,27 +69,22 @@ struct xwwdt_device {
 	struct watchdog_device xilinx_wwdt_wdd;
 	unsigned long freq;
 	u32 close_percent;
+	u64 closed_timeout;
+	u64 open_timeout;
 };
 
 static int xilinx_wwdt_start(struct watchdog_device *wdd)
 {
 	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
 	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
-	u64 time_out, closed_timeout, open_timeout;
 	u32 control_status_reg;
 
-	/* Calculate timeout count */
-	time_out = xdev->freq * wdd->timeout;
-	closed_timeout = div_u64(time_out * xdev->close_percent, 100);
-	open_timeout = time_out - closed_timeout;
-	wdd->min_hw_heartbeat_ms = xdev->close_percent * 10 * wdd->timeout;
-
 	spin_lock(&xdev->spinlock);
 
 	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
 	iowrite32(~(u32)XWWDT_ESR_WEN_MASK, xdev->base + XWWDT_ESR_OFFSET);
-	iowrite32((u32)closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
-	iowrite32((u32)open_timeout, xdev->base + XWWDT_SWR_OFFSET);
+	iowrite32((u32)xdev->closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
+	iowrite32((u32)xdev->open_timeout, xdev->base + XWWDT_SWR_OFFSET);
 
 	/* Enable the window watchdog timer */
 	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
@@ -133,7 +136,12 @@ static int xwwdt_probe(struct platform_device *pdev)
 	struct watchdog_device *xilinx_wwdt_wdd;
 	struct device *dev = &pdev->dev;
 	struct xwwdt_device *xdev;
+	u64 max_per_window_ms;
+	u64 min_per_window_ms;
+	u64 timeout_count;
 	struct clk *clk;
+	u32 timeout_ms;
+	u64 ms_count;
 	int ret;
 
 	xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
@@ -154,12 +162,13 @@ static int xwwdt_probe(struct platform_device *pdev)
 		return PTR_ERR(clk);
 
 	xdev->freq = clk_get_rate(clk);
-	if (!xdev->freq)
+	if (xdev->freq < 1000000)
 		return -EINVAL;
 
 	xilinx_wwdt_wdd->min_timeout = XWWDT_MIN_TIMEOUT;
 	xilinx_wwdt_wdd->timeout = XWWDT_DEFAULT_TIMEOUT;
-	xilinx_wwdt_wdd->max_hw_heartbeat_ms = 1000 * xilinx_wwdt_wdd->timeout;
+	xilinx_wwdt_wdd->max_hw_heartbeat_ms =
+		div64_u64(XWWDT_MAX_COUNT_WINDOW_COMBINED, xdev->freq) * 1000;
 
 	if (closed_window_percent == 0 || closed_window_percent >= 100)
 		xdev->close_percent = XWWDT_CLOSE_WINDOW_PERCENT;
@@ -167,6 +176,48 @@ static int xwwdt_probe(struct platform_device *pdev)
 		xdev->close_percent = closed_window_percent;
 
 	watchdog_init_timeout(xilinx_wwdt_wdd, wwdt_timeout, &pdev->dev);
+
+	/* Calculate ticks for 1 milli-second */
+	ms_count = div_u64(xdev->freq, 1000);
+	timeout_ms = xilinx_wwdt_wdd->timeout * 1000;
+	timeout_count = timeout_ms * ms_count;
+
+	if (timeout_ms > xilinx_wwdt_wdd->max_hw_heartbeat_ms) {
+		/*
+		 * To avoid ping restrictions until the minimum hardware heartbeat,
+		 * we will solely rely on the open window and
+		 * adjust the minimum hardware heartbeat to 0.
+		 */
+		xdev->closed_timeout = 0;
+		xdev->open_timeout = XWWDT_MAX_COUNT_WINDOW;
+		xilinx_wwdt_wdd->min_hw_heartbeat_ms = 0;
+		xilinx_wwdt_wdd->max_hw_heartbeat_ms = xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2;
+	} else {
+		xdev->closed_timeout  = div64_u64(timeout_count * xdev->close_percent, 100);
+		xilinx_wwdt_wdd->min_hw_heartbeat_ms =
+			div64_u64(timeout_ms * xdev->close_percent, 100);
+
+		if (timeout_ms > xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2) {
+			max_per_window_ms = xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2;
+			min_per_window_ms = timeout_ms - max_per_window_ms;
+
+			if (xilinx_wwdt_wdd->min_hw_heartbeat_ms > max_per_window_ms) {
+				dev_info(xilinx_wwdt_wdd->parent,
+					 "Closed window cannot be set to %d%%. Using maximum supported value.\n",
+					xdev->close_percent);
+				xdev->closed_timeout = max_per_window_ms * ms_count;
+				xilinx_wwdt_wdd->min_hw_heartbeat_ms = max_per_window_ms;
+			} else if (xilinx_wwdt_wdd->min_hw_heartbeat_ms < min_per_window_ms) {
+				dev_info(xilinx_wwdt_wdd->parent,
+					 "Closed window cannot be set to %d%%. Using minimum supported value.\n",
+					xdev->close_percent);
+				xdev->closed_timeout = min_per_window_ms * ms_count;
+				xilinx_wwdt_wdd->min_hw_heartbeat_ms = min_per_window_ms;
+			}
+		}
+		xdev->open_timeout = timeout_count - xdev->closed_timeout;
+	}
+
 	spin_lock_init(&xdev->spinlock);
 	watchdog_set_drvdata(xilinx_wwdt_wdd, xdev);
 	watchdog_set_nowayout(xilinx_wwdt_wdd, 1);
-- 
2.25.1


