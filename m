Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2393113DBB2
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 14:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgAPN1e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 08:27:34 -0500
Received: from mail-bn7nam10on2050.outbound.protection.outlook.com ([40.107.92.50]:6117
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727032AbgAPN1c (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 08:27:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ype1loshTZIv+h3aZ9MXKbXBs/neJywdL14T3Q+B/U0TCsmxc5c3V5cJU/BWEDMSjY63/XNBDRaJcg6geql+8nEdMc6zk4qdtqag9cl6JIa6+2/b8yrHPsb7s1ocHH/+iTxLi21ZUOG5XmxQ+7Sn4/f7m/6gLS37GcA6Ri5FMU83ZOYAuIQhi0nypIsvgHSLk/HQVc1bY0O9uzwjXTQfx+qlg/80evX/daXRVTvu3yH510Ul9LbVJ/enUUj6xJRe5XLQxxUv9JXr1km0gLZboy2Bc83ZApjOHIjoI1GOppYoospHpvbv6P/vGG9d/1V5J7ctXroEYvftwF3CgNzu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLSX4lqAHRVVZ7wS8+l5IRJMy0gApdNzhJ68ZMJIFSU=;
 b=RJ+tO+0+jA3VU1HAkjBhxDH3ylXN12xX8xcn21L2fEAYwn4uUKlHTvnmh5JRkaZBNqqSCq9A39NkIS0dazfcvq+o7TuNCml7WIkjEE2oMcCu6P6Yuc3Ac2mzFBZpeDM1FrDfhLv6hx4JoY1MvzLX2yyvfirtD47dt/Lq3+QMNBQAjnw+mr7fHdYeziAPvptl0d4rNAK9HYxz77LjHo/pR2qgSI3lO9BReQ8CwDzLZAsj/JqU5fnHLMFZrGu8ApycCHmObkjJzY7/6PfXoh0S7wWBLrmymyvc/niM6DVeQKoq1AONH7bQgQaWFLd16mL048vrhtJMDjEppQdud21mlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLSX4lqAHRVVZ7wS8+l5IRJMy0gApdNzhJ68ZMJIFSU=;
 b=ioNLtmytN4Fw+qzsqNLlkhwOBVrT+6M4pLpLSJtwNy6hSQo5CrzMlkNr9jIhOk6z9EkfqhJJVJ4+pmXJX8znvsR2DvomWrUVA8meJtWL0bTh6cluRPlLejFAvbwMl/XdJBfJjDENL0/pva1nS3gEPJdc89mFk+3IRb9XKlFkkUI=
Received: from BN7PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:20::22)
 by DM6PR02MB4666.namprd02.prod.outlook.com (2603:10b6:5:ff::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.14; Thu, 16 Jan
 2020 13:27:29 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by BN7PR02CA0009.outlook.office365.com
 (2603:10b6:408:20::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via Frontend
 Transport; Thu, 16 Jan 2020 13:27:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
 via Frontend Transport; Thu, 16 Jan 2020 13:27:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BI-0005vl-CZ; Thu, 16 Jan 2020 05:27:28 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BD-0001Df-8u; Thu, 16 Jan 2020 05:27:23 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 00GDRCHi016370;
        Thu, 16 Jan 2020 05:27:12 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5B1-00018J-S8; Thu, 16 Jan 2020 05:27:12 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linux@roeck-us.net, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: [PATCH 4/9] watchdog: of_xilinx_wdt: Initialize watchdog via data structure
Date:   Thu, 16 Jan 2020 18:56:52 +0530
Message-Id: <1579181217-31127-5-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(36756003)(81156014)(5660300002)(8936002)(8676002)(81166006)(7696005)(316002)(4326008)(356004)(6666004)(44832011)(2906002)(70206006)(6636002)(26005)(426003)(336012)(9786002)(186003)(2616005)(107886003)(70586007)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4666;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8016dd-e2a8-4007-1dd4-08d79a87d581
X-MS-TrafficTypeDiagnostic: DM6PR02MB4666:
X-Microsoft-Antispam-PRVS: <DM6PR02MB46660CD43FE036696E155606AF360@DM6PR02MB4666.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 02843AA9E0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXZeCNs6Yps6vvHKRwWKxKglbm5+v1yegorHNj3F7rAFTBzh++YLiI52f5Mm669+4UWV5srn65p2AgljwpPB8IkLhZgjMi7Gh0SI/vumhVIJ21S2/jEqgBGWNzya7JypC/wQsx5v3x5XRbu2l6CJr4fk2/y6/7nD+5vO4AyymNVdJV4elk2CbzRyKsMsyDSo+Q6b2WEUvu9Gc3ieDhkzzxaYhsT5kXd0cV1tjzqOx9pEd9WRTWtz/vrBRAcAsZbpTHuSAAOqOccd9midI31D2KBbfWNiIEkfiDNeJPr6mWW9ORtTd+1S0GHIatT+e/fMGElCOjqDybs0Jpe6nSCip/uo3l7L1R5EP2J0mo4dAq/qSL9JKmKlFZn8HOXwaTCBg32xxJBDHrurMuYd8HGWJ9VORiKTN8Dw0hxOJqNUipQyDlVVMcrxQsui1t0Izvul
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2020 13:27:28.8014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8016dd-e2a8-4007-1dd4-08d79a87d581
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4666
Sender: linux-watchdog-owner@vger.kernel.org
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

