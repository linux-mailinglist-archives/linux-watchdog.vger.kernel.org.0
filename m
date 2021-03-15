Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8FF133B03D
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhCOKrm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:42 -0400
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com ([40.107.223.77]:57569
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229732AbhCOKr2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ1L8fADi9umN2eVt0Zm9ZiWsUO2PG68pcnbjVu882nuFPpgcTW5YO9Ovn4kZxta1Ag6+1aaV18plZk9CvRO91UPZ1HrOxRCzXJSCF8WCsPcm/8uFytGiDMfwXO8yYg3xN3WW564Dr9tjL8P6vcGPDvdPXm93/MWKWvV9n3NF7ltTzpjSxXhquCokK07U1Ot2VoWPMY2c/HOENT2ka9KSsZ4QYH/M5zmOEUsw7+at8fvMHcX9RTGd4yitSKO3YDIEU7v0b5W7cJ6+5oJk7cz3XPXyJPpMmJ16gsANod/+caKBbfzWuW/+Fvx5VESkwDdCKIFC0c6pJOmfmmOooARFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyhwFbQA81kAFJXqZWwZcUJbGIKTfkzIYsByU7MYtDE=;
 b=fRs64mhJ9jImJciOHgA3QOjR273PiWudW8zmbXHQpMaawJLUv3o514vsl+T64U445yJLTHqxJq8ZArwT/VTBZeJ8diLrSFQtu9UFq+dwaK3yjv6CwQserVOzwAxRrGvM5QkCQSODHArqqkjyo4QKioMR6GEpNOedMigxj/GPZOeYF2OKceqbB0+HdZlExafwVkK1nnwJqIDN+O1cSzwI2E76Z0xQRhbPwMrjeBXwwvJs9ZjNX8shGyOPvkS+ThcKgclKnAfjsoOztUS5Y1QC/4BkIYQiqfDmaAzHdMIRad30dfEW+I5qr8cGhlcprFHaE/pFPutmCEDGt63PC3nWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyhwFbQA81kAFJXqZWwZcUJbGIKTfkzIYsByU7MYtDE=;
 b=Qhu/JYbwmFqwOym/S58dizYtQnpxZ5B9a2bz41ZO8ikvWgb36OALG57xzpbgnN3uEuBRs4D4YZA2cLjDDsamWMmKJdIcM2TsuMvXkFhfl7KerJ+KCGxMKpJd2zGZwaCRBmArU+yJjE0SUtI3gKxu2jQUFlkSHGpBsw7wAF9gkVw=
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 SN6PR02MB5613.namprd02.prod.outlook.com (2603:10b6:805:e5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 10:47:24 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::b4) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:22 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:22 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkkq-00055N-T5; Mon, 15 Mar 2021 03:47:21 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 3/9] watchdog: of_xilinx_wdt: Used dev_dbg()
Date:   Mon, 15 Mar 2021 16:16:48 +0530
Message-ID: <1615805214-24857-4-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3293cdb2-7cf2-4b75-588f-08d8e79fb7fc
X-MS-TrafficTypeDiagnostic: SN6PR02MB5613:
X-Microsoft-Antispam-PRVS: <SN6PR02MB56135BAC444C1C8D1FED07E1AF6C9@SN6PR02MB5613.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: umTXFQAGf+dK0tyv1uX/dYVAK8sEG9tUWuhNCA3SPH4hJYFEYQaOrtCLB2S3cAqPAQktDro7ocC7WUSQu1N+7WzD3meJbeuKALdBIm4sTdWZHmFZ0SGSXDdStyvPiuHm4rFPTjTHxfJxzUgZy10VDsglCEkDcOQfSY05uT2FZQ7ABHsJzfG137pIA9reWKsL8vSopKKmdXHRijdAua6W1BnFEDH1irMux5lFho20syUOVrtYBMcmRkUoTxtDFP6Zj/GBtY6/HskIH+tbeEXe8ogKN9tQvOlXtfDbQgv+VeElrQFj9yinGMZFJekILJp9CjaL/Jz1QA0RmbQf1QOHgqR9+boOrlmFRCT58pKf+n9HgFbqdEVX+tsyZJ5gZt2XSro1MNxu4smOBHefPs9Y4ixPLkeJoYwSN67Bhj6dSmfPx9rLFuly9/3YU5zQnKr+Y2hdyy5db6Ui2RKjNu340fPlXNjJkgHY96gdkHRMy+rn8xSO7P3s1D83/JEy8MsW3zgJgwDDYcqmGEDDib6yskLhw9uO1G+FHBm2SDjhujrKfx9p/s6Kw/D2t6BvZb7AgwX4G1SzWdo3b+davGp5QUAjsqurZNGjWLkzBuzmEjPgSxZ2QDUIuZqmbHBMk18p2YwxgzfvFk0GkyCkWlRd4v3+NbruJ+RSYHSXnzxx9XlWXMlwkzJvxORXQQJ8qY8H
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(110136005)(426003)(8936002)(8676002)(7636003)(82310400003)(36906005)(316002)(54906003)(356005)(5660300002)(107886003)(44832011)(26005)(47076005)(9786002)(2616005)(82740400003)(186003)(83380400001)(70586007)(478600001)(2906002)(4326008)(70206006)(6636002)(6666004)(36860700001)(7696005)(336012)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:24.4880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3293cdb2-7cf2-4b75-588f-08d8e79fb7fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5613
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

This patch removes pr_info in stop function and adds dev_dbg()
in start/stop function to display device specific debug info.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 0d7df2370db7..9e67b598907e 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -50,6 +50,7 @@ static int xilinx_wdt_start(struct watchdog_device *wdd)
 	int ret;
 	u32 control_status_reg;
 	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
 
 	ret = clk_enable(xdev->clk);
 	if (ret) {
@@ -70,6 +71,8 @@ static int xilinx_wdt_start(struct watchdog_device *wdd)
 
 	spin_unlock(&xdev->spinlock);
 
+	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Started!\n");
+
 	return 0;
 }
 
@@ -77,6 +80,7 @@ static int xilinx_wdt_stop(struct watchdog_device *wdd)
 {
 	u32 control_status_reg;
 	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
 
 	spin_lock(&xdev->spinlock);
 
@@ -91,7 +95,7 @@ static int xilinx_wdt_stop(struct watchdog_device *wdd)
 
 	clk_disable(xdev->clk);
 
-	pr_info("Stopped!\n");
+	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Stopped!\n");
 
 	return 0;
 }
-- 
2.7.4

