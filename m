Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C00033B03C
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhCOKrn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:43 -0400
Received: from mail-mw2nam12on2073.outbound.protection.outlook.com ([40.107.244.73]:50144
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230020AbhCOKr3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqbsnUMTGRY0y5/oHjVJK47YtGBbV961h9TxZH6rDycdZnvdpYYBmdXbsPaB5nAHse7YvD9CdrZROkzXC5ob3xhGPyofUWL77eG08xJuccM+6w6JHA54zUvDawy90Y52JgwT3SHjnUOkr40OMSC41bPa0ENboEwIjVBGAsj8El316d2b0dDOJ+ZCEVyqNZtyNrs4dp4rOGED3pZujglLItFaw9Aj6i2BbWeIVM6PWWxLHsHBwsreG+IKPwoiSZ0Fjd6OI5IYqB8KJwoXueDAvTEeATzPVkJUYbbQTVbPID3rQQMW5VAF8WSY2Q7nsZREIRkE/uCQ7//CnUSBJxaiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLSX4lqAHRVVZ7wS8+l5IRJMy0gApdNzhJ68ZMJIFSU=;
 b=kvJ8GJlx2VhGvwOyz9/xsQnHl26CdsZqpGuR/yn2c49KgLpfcOaLJbrok20NBCkBAJZOfm4U1EbTo5en07fIzBv+2irOHthgk2tZ4yqEjdkOI9C2HRL2X5Ma05aZxm6ZRwXTx7U+oeKmKGgYZWa+jDz+aW1ezU+iaYE0ZWg5d0xqO+bm/qh1rxfHsLN9GaWPIy4fLFyO9UKds3RERdoSS7Ji11ll0RoM4kl7hvS2UAvnKy1KfwnCC458e7UlD2/FpxE90xOgh/YkzDrqnDOhChMIDf6/Wf6KH4kEWIMJD+Pe9tUGFyOqLSL3Es/faC9GIpt8a0NrFYDXDF1NqtmRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLSX4lqAHRVVZ7wS8+l5IRJMy0gApdNzhJ68ZMJIFSU=;
 b=lWSvHBJOHnI3jT2ljW79KsV4b61cv43eoJLm3HDQlERJqMgraLtEvUbA0v0QiyYI/+LrffrnPxxLkLHcjMPcXmhYVbyWw8q4J/sG9+p1bYxX5QryiJmBKIL7KWcblwSNu1CLG6JnKhWWyvIAa8t9RN4dciicZMgO9JC4QuDp860=
Received: from CY4PR22CA0044.namprd22.prod.outlook.com (2603:10b6:903:ed::30)
 by BL0PR02MB6497.namprd02.prod.outlook.com (2603:10b6:208:1c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:47:27 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ed:cafe::7c) by CY4PR22CA0044.outlook.office365.com
 (2603:10b6:903:ed::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:25 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:25 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkku-00055N-1x; Mon, 15 Mar 2021 03:47:24 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>
Subject: [PATCH 4/9] watchdog: of_xilinx_wdt: Initialize watchdog via data structure
Date:   Mon, 15 Mar 2021 16:16:49 +0530
Message-ID: <1615805214-24857-5-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 443f8470-4c83-4d3c-9af9-08d8e79fb9a1
X-MS-TrafficTypeDiagnostic: BL0PR02MB6497:
X-Microsoft-Antispam-PRVS: <BL0PR02MB6497B30C076D3E6C840E4A1AAF6C9@BL0PR02MB6497.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNlJ6VWjR3kD5CHPsaCE9K6OxPNlGqyGPR5joMM1U668llN6KeFKoV7Xkxgg4Nt91R/jKRvFafbMNxKIDRNl0gp12M8XMHDrPyRgF3ec39//hvB6xj9dkOVQi3sK2hqNFkRBLy0HPOux/tyypAk3dh5gUvxAz1NAFrg9PxEqWvXtz+RHLDMuNS5lqGu9rde/h4LpfLj7dy3Ok2mIgMKD+80fr5Fl4ajEpAwJOf+eBu+JaMHaiDyq2VFG/f9BXT9avsQ4WUs+2cNnhkdOcMNReAVK/JsGEcIZeJ+Q3Kftw1BaY4kmS5MRyO7fT3I+3uIa8XM/2HV62jheQiVqKdCxacqOk5tWAd+xWYxbEMAY2ElXQ81T9kgTpYcwtSTro7fkGc6+E724TB3NlR6GObDmppxVfmkBNIi94N5r44eNHShjP/mgr1oHzeTUfTdybatt4qiuFvRxI+IvmAHOFCG9RNROh9hBzoWq5qjQRrBeYXwH6YsekovGhLvu7t2n7kDE7T0aEPhPyAoq3cUVw20bDoWMyG82l2KyLtBg0FoY7/VZod+NpNfyDvgnR2ahwWMY6SKsZbX3uAMchlwF+EjM3rNTuSFSjx8xJicbhYjLqs5b50icTQaVxn1HRxitpeUioSygW7m5Sks9gJQG6a2Gu5yE0J9pImQqSxbppG2bxTs0+NUj0m/YwmEFyzVVnSz4
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(316002)(7636003)(110136005)(54906003)(426003)(478600001)(82310400003)(186003)(356005)(8676002)(36906005)(36756003)(6666004)(9786002)(4326008)(82740400003)(36860700001)(70206006)(83380400001)(2616005)(336012)(8936002)(5660300002)(70586007)(47076005)(44832011)(6636002)(7696005)(107886003)(2906002)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:27.2487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 443f8470-4c83-4d3c-9af9-08d8e79fb9a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6497
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch is preparation for adding new watchdog based on this driver.
of_id->data is storing link xwdt_devtype_data which stores watchdog
info and ops pointers to structures.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 50 +++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 9e67b598907e..b2ce1b90237e 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -37,6 +37,11 @@
 
 #define WATCHDOG_NAME     "Xilinx Watchdog"
 
+struct xwdt_devtype_data {
+	const struct watchdog_ops *xwdt_ops;
+	const struct watchdog_info *xwdt_info;
+};
+
 struct xwdt_device {
 	void __iomem *base;
 	u32 wdt_interval;
@@ -160,6 +165,20 @@ static void xwdt_clk_disable_unprepare(void *data)
 	clk_disable_unprepare(data);
 }
 
+static const struct xwdt_devtype_data xwdt_wdt_data = {
+	.xwdt_info = &xilinx_wdt_ident,
+	.xwdt_ops = &xilinx_wdt_ops,
+};
+
+static const struct of_device_id xwdt_of_match[] = {
+	{ .compatible = "xlnx,xps-timebase-wdt-1.00.a",
+		.data = &xwdt_wdt_data },
+	{ .compatible = "xlnx,xps-timebase-wdt-1.01.a",
+		.data = &xwdt_wdt_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, xwdt_of_match);
+
 static int xwdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -167,14 +186,23 @@ static int xwdt_probe(struct platform_device *pdev)
 	u32 pfreq = 0, enable_once = 0;
 	struct xwdt_device *xdev;
 	struct watchdog_device *xilinx_wdt_wdd;
+	const struct of_device_id *of_id;
+	const struct xwdt_devtype_data *devtype;
 
 	xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
 	if (!xdev)
 		return -ENOMEM;
 
 	xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
-	xilinx_wdt_wdd->info = &xilinx_wdt_ident;
-	xilinx_wdt_wdd->ops = &xilinx_wdt_ops;
+
+	of_id = of_match_device(xwdt_of_match, &pdev->dev);
+	if (!of_id)
+		return -EINVAL;
+
+	devtype = of_id->data;
+
+	xilinx_wdt_wdd->info = devtype->xwdt_info;
+	xilinx_wdt_wdd->ops = devtype->xwdt_ops;
 	xilinx_wdt_wdd->parent = dev;
 
 	xdev->base = devm_platform_ioremap_resource(pdev, 0);
@@ -264,9 +292,10 @@ static int xwdt_probe(struct platform_device *pdev)
 static int __maybe_unused xwdt_suspend(struct device *dev)
 {
 	struct xwdt_device *xdev = dev_get_drvdata(dev);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
 
-	if (watchdog_active(&xdev->xilinx_wdt_wdd))
-		xilinx_wdt_stop(&xdev->xilinx_wdt_wdd);
+	if (watchdog_active(xilinx_wdt_wdd))
+		xilinx_wdt_wdd->ops->stop(xilinx_wdt_wdd);
 
 	return 0;
 }
@@ -280,24 +309,17 @@ static int __maybe_unused xwdt_suspend(struct device *dev)
 static int __maybe_unused xwdt_resume(struct device *dev)
 {
 	struct xwdt_device *xdev = dev_get_drvdata(dev);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
 	int ret = 0;
 
-	if (watchdog_active(&xdev->xilinx_wdt_wdd))
-		ret = xilinx_wdt_start(&xdev->xilinx_wdt_wdd);
+	if (watchdog_active(xilinx_wdt_wdd))
+		ret = xilinx_wdt_wdd->ops->start(xilinx_wdt_wdd);
 
 	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(xwdt_pm_ops, xwdt_suspend, xwdt_resume);
 
-/* Match table for of_platform binding */
-static const struct of_device_id xwdt_of_match[] = {
-	{ .compatible = "xlnx,xps-timebase-wdt-1.00.a", },
-	{ .compatible = "xlnx,xps-timebase-wdt-1.01.a", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, xwdt_of_match);
-
 static struct platform_driver xwdt_driver = {
 	.probe       = xwdt_probe,
 	.driver = {
-- 
2.7.4

