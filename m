Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F87B33B041
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhCOKrn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:43 -0400
Received: from mail-co1nam11on2087.outbound.protection.outlook.com ([40.107.220.87]:45856
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229905AbhCOKrf (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bezgp0FxcG44DglPNnYaaD6KIzyNl3Jf6WF/S+1MKeo0iar6mXrQTRyUxxi5btaKeZioBBZnePTblm/xpc71GemGqwcIDFfIduGWLqlezqSa/+0IygcZT4U6FvLaso0j5oDIwdzxT0foFTxoSkkvtY4NkMtHzMxX8TCo9my9lkc6i2FHUTQjY8dkkB4zTwmDfgR7QnDDkgPdS0cHJc6jo8tXscfXh1s+CZHKa/ailAoWDOku9hXtP4K5efPDdHOLZ8vBKt6iVLOf132EeoguqCumlqQ9OPcM8Js+4LNPmrF9n+mlMppuG45/W7cIecHX8eNg4p6UJRZ7xmVdF2eH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOp3IYe7EGQb8A3JI35dveDYqbkTKZs9bHvKTu25EWk=;
 b=P2Ka2QdWhn/1JigyEDzcAKzhTLEWLDYmEbnjIQk9vjBKjbCCLiK4JPBJ0bG0wcV6Ob5aFP9xnC5Sf+AytzgoMdIATZPqyX3ETcaSHjAK0JLyadwGT765voYxmy5r5xSF5oO+mfd2j61NN5ydoGZ67t5zILzxeLEfeb5RtgBn8tYcdbGSJn6VWyP2TcECljRrlAro9aw9K1euyT5PxMOwWrmSaRN6RtPFN3JPGRwlKSg00i60QDTFeGt9rI7EGBi6TVDxV8EJ1bYLYvuw0T24ypDI2+T8+Nc7ocW6vONcndSXz02kzI8343KRcg1GnYR4i0N2EOoUgZr7Ip/oAbk/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOp3IYe7EGQb8A3JI35dveDYqbkTKZs9bHvKTu25EWk=;
 b=FuSwvgEZcVMz6/hiTQ2H6PmFqqC/gF2E/qt4xXnigB9o7Zq9chCnMiexhBnd2scKTOMKjUx+5zKWdbUk3vWubhua0NYFk4CtHTe6sHcZgy/7P687VE1cZeCBAtAMo/fKplV1Jki6Zi/jqXMge0QuRisvkLQziZIp4INnh3W3OKc=
Received: from CY4PR22CA0066.namprd22.prod.outlook.com (2603:10b6:903:ae::28)
 by MN2PR02MB6192.namprd02.prod.outlook.com (2603:10b6:208:181::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:47:31 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ae:cafe::cd) by CY4PR22CA0066.outlook.office365.com
 (2603:10b6:903:ae::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:28 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:28 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkkx-00055N-7E; Mon, 15 Mar 2021 03:47:27 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>
Subject: [PATCH 5/9] watchdog: of_xilinx_wdt: Introduce wdttype enum for identification
Date:   Mon, 15 Mar 2021 16:16:50 +0530
Message-ID: <1615805214-24857-6-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16523573-06ed-4d5b-7124-08d8e79fbbe1
X-MS-TrafficTypeDiagnostic: MN2PR02MB6192:
X-Microsoft-Antispam-PRVS: <MN2PR02MB619202F5B899BA190199DAB0AF6C9@MN2PR02MB6192.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGzm5B/UptU+Gc6pPftHP1i5DVLZfVZhx6CBCIMF5pkengNrSyDGl3rdl20z0SdANVH92A3959KDPqfK7RIuZWmjY62XuNF28rjK5HhtAuU3JRv3krdsgczk1/U3OAT10ZDXVupE+87XiJIO0odFxdOz4+I/oxRpM42kDjnDMtGHBxQ4Fw9iF57dSsXyKvtb/bCtA+zt2pWdPDaALF+H8K2vvRxkaqaEaMUNwq1izgPMuC11ufuF+mtkkE8yQGDoc6v3DDFGtSEEn4enTZj1wExTHwbbUFNWt1IKw7F8HxCxPropwNzcMfnJgsa/jKCRFuLB8BQT45Tmc4QmxioW/EL3o9yOMDsKtWo0Al3G8KUyRXKvfdZpXhRNhU9uUBVrfSYCnbiAUGmwN3n1zfFhyJHrPzaUNRN/Wq9nFl6FeSahP5puK2rf3lks9SAV09xBJZVp9UrS1WSHP7d/KxuF2oMsbZMitLnh57Bo/EaZLZ4fO2O3PUuDp5RErsTc53HEllQEF8Pje/0FgUiPrBaIiuUkYAGnZdPJ/kp5J23HH93wJK/WSGtogEG3tV3AbLG2+cu14ouN95o27ZhtyrW3FSvSufeh4K10Z/Bfw4RkFHLT9T7HJg5x4Gb5T17zDUneh1P4nQC2/URHDsoC8PbLU7I5T4vSh95IMggJgXuTJRhNHp0rNoGi/IIpQ6AmSSfl
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(36840700001)(46966006)(478600001)(426003)(4326008)(2616005)(336012)(54906003)(107886003)(186003)(36756003)(316002)(44832011)(83380400001)(26005)(7636003)(356005)(82310400003)(82740400003)(36906005)(47076005)(6636002)(6666004)(8936002)(2906002)(9786002)(70586007)(7696005)(8676002)(5660300002)(36860700001)(70206006)(110136005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:30.7716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16523573-06ed-4d5b-7124-08d8e79fbbe1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6192
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is a need to identify watchdog type that's why new enum was
was introduced to cover it. Move functionality valid only for this
watchdog type if statement.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 64 +++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index b2ce1b90237e..3b93b60f1a00 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -37,7 +37,17 @@
 
 #define WATCHDOG_NAME     "Xilinx Watchdog"
 
+/**
+ * enum xwdt_ip_type - WDT IP type.
+ *
+ * @XWDT_WDT: Soft wdt ip.
+ */
+enum xwdt_ip_type {
+	XWDT_WDT = 0,
+};
+
 struct xwdt_devtype_data {
+	enum xwdt_ip_type wdttype;
 	const struct watchdog_ops *xwdt_ops;
 	const struct watchdog_info *xwdt_info;
 };
@@ -166,6 +176,7 @@ static void xwdt_clk_disable_unprepare(void *data)
 }
 
 static const struct xwdt_devtype_data xwdt_wdt_data = {
+	.wdttype = XWDT_WDT,
 	.xwdt_info = &xilinx_wdt_ident,
 	.xwdt_ops = &xilinx_wdt_ops,
 };
@@ -188,6 +199,7 @@ static int xwdt_probe(struct platform_device *pdev)
 	struct watchdog_device *xilinx_wdt_wdd;
 	const struct of_device_id *of_id;
 	const struct xwdt_devtype_data *devtype;
+	enum xwdt_ip_type wdttype;
 
 	xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
 	if (!xdev)
@@ -201,6 +213,8 @@ static int xwdt_probe(struct platform_device *pdev)
 
 	devtype = of_id->data;
 
+	wdttype = devtype->wdttype;
+
 	xilinx_wdt_wdd->info = devtype->xwdt_info;
 	xilinx_wdt_wdd->ops = devtype->xwdt_ops;
 	xilinx_wdt_wdd->parent = dev;
@@ -209,18 +223,20 @@ static int xwdt_probe(struct platform_device *pdev)
 	if (IS_ERR(xdev->base))
 		return PTR_ERR(xdev->base);
 
-	rc = of_property_read_u32(dev->of_node, "xlnx,wdt-interval",
-				  &xdev->wdt_interval);
-	if (rc)
-		dev_warn(dev, "Parameter \"xlnx,wdt-interval\" not found\n");
+	if (wdttype == XWDT_WDT) {
+		rc = of_property_read_u32(dev->of_node, "xlnx,wdt-interval",
+					  &xdev->wdt_interval);
+		if (rc)
+			dev_warn(dev, "Parameter \"xlnx,wdt-interval\" not found\n");
 
-	rc = of_property_read_u32(dev->of_node, "xlnx,wdt-enable-once",
-				  &enable_once);
-	if (rc)
-		dev_warn(dev,
-			 "Parameter \"xlnx,wdt-enable-once\" not found\n");
+		rc = of_property_read_u32(dev->of_node, "xlnx,wdt-enable-once",
+					  &enable_once);
+		if (rc)
+			dev_warn(dev,
+				 "Parameter \"xlnx,wdt-enable-once\" not found\n");
 
-	watchdog_set_nowayout(xilinx_wdt_wdd, enable_once);
+		watchdog_set_nowayout(xilinx_wdt_wdd, enable_once);
+	}
 
 	xdev->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(xdev->clk)) {
@@ -242,13 +258,17 @@ static int xwdt_probe(struct platform_device *pdev)
 		pfreq = clk_get_rate(xdev->clk);
 	}
 
-	/*
-	 * Twice of the 2^wdt_interval / freq  because the first wdt overflow is
-	 * ignored (interrupt), reset is only generated at second wdt overflow
-	 */
-	if (pfreq && xdev->wdt_interval)
-		xilinx_wdt_wdd->timeout = 2 * ((1 << xdev->wdt_interval) /
-					  pfreq);
+	if (wdttype == XWDT_WDT) {
+		/*
+		 * Twice of the 2^wdt_interval / freq  because
+		 * the first wdt overflow is ignored (interrupt),
+		 * reset is only generated at second wdt overflow
+		 */
+		if (pfreq && xdev->wdt_interval)
+			xilinx_wdt_wdd->timeout =
+				2 * ((1 << xdev->wdt_interval) /
+					pfreq);
+	}
 
 	spin_lock_init(&xdev->spinlock);
 	watchdog_set_drvdata(xilinx_wdt_wdd, xdev);
@@ -263,10 +283,12 @@ static int xwdt_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	rc = xwdt_selftest(xdev);
-	if (rc == XWT_TIMER_FAILED) {
-		dev_err(dev, "SelfTest routine error\n");
-		return rc;
+	if (wdttype == XWDT_WDT) {
+		rc = xwdt_selftest(xdev);
+		if (rc == XWT_TIMER_FAILED) {
+			dev_err(dev, "SelfTest routine error\n");
+			return rc;
+		}
 	}
 
 	rc = devm_watchdog_register_device(dev, xilinx_wdt_wdd);
-- 
2.7.4

