Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89AD813DBC5
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 14:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgAPN1e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 08:27:34 -0500
Received: from mail-co1nam11on2086.outbound.protection.outlook.com ([40.107.220.86]:23705
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726378AbgAPN1d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 08:27:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKrjp7kGAciGnk5idcqTkat1aqDaBIK2XafRKdNqF4wKKV3w9TgmpDPvh+xT5P957QX3F6qpuZSMvK99OUlWnNQK/t9dzPSBDTvd2SRmO1CKGJ44amb5449HjH6o1KGDkS3uPdmCS9yvlWEGhBQAXHI2nzMiaLM7rsL/bQvbGljWXl2defHecb1jJ5CKtD1NUteF/zjsJMys1XwdicoHe5vI5M4RsDGXlVZFiZVYIgP+nuPYyh2+sgT/7N2aJ/WbFQjBMpWtYu8xMIb2xkDktGXlyU5DTJWCpD2jbKqy5TENvqMVgs8kCp+YEWUJH5JSe2Umdu90YPgD1aXI8wBjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOp3IYe7EGQb8A3JI35dveDYqbkTKZs9bHvKTu25EWk=;
 b=OC9F8AO5CAcmPnJ5iSLJYV1ECHNG6AjBRFgpznawnnaNpRZEgNBhajW+a1bh80EtJNBti1De9wGQpBl2AR8Hu0ICAb1Os6bK6qwXDNQFQiNsUC/+xxDKur1vyFUYkvjipgD7WsLYeC7QO9Ttk9jZgc/+z6V9KVaEV6xCvHmFfwdWi4Y0bMYO29D3hmYLsIvM+9wlT7xYckOVxqAyTls9kx4FIy9MABPGAZnu5QgxS9clFgPHara59liQEHITJrnSMZ9u0RL0dxdHRcFLHQVV+QugBRL8evnxZYjzBCXak1rW6M4WKhHxdBIy2EKAkyBEmTvFyUgD+1xqCPByjH/aXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOp3IYe7EGQb8A3JI35dveDYqbkTKZs9bHvKTu25EWk=;
 b=FDk7ERvPbzUPDpejcBLh38qfaphq5UG4MkaE3OmY1J9TdWfPpdnwjiFfT0P4pkIVrBLdOagbMzhsSRXfqbpgj4dQ2cDGcaV51GG3eowGfoOFz8wHaqXaW/eMt2+k4BkUcEFCX3kNwH58yhVjraHvtfkzeh0Avvr3NRmmdwtC86s=
Received: from CH2PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:4e::22)
 by BY5PR02MB6724.namprd02.prod.outlook.com (2603:10b6:a03:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20; Thu, 16 Jan
 2020 13:27:29 +0000
Received: from SN1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::204) by CH2PR02CA0012.outlook.office365.com
 (2603:10b6:610:4e::22) with Microsoft SMTP Server (version=TLS1_2,
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
 SN1NAM02FT032.mail.protection.outlook.com (10.152.72.126) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
 via Frontend Transport; Thu, 16 Jan 2020 13:27:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BI-0005vm-Fp; Thu, 16 Jan 2020 05:27:28 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BD-0001Df-CB; Thu, 16 Jan 2020 05:27:23 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 00GDRFn5015685;
        Thu, 16 Jan 2020 05:27:15 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5B4-00018J-L9; Thu, 16 Jan 2020 05:27:15 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linux@roeck-us.net, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: [PATCH 5/9] watchdog: of_xilinx_wdt: Introduce wdttype enum for identification
Date:   Thu, 16 Jan 2020 18:56:53 +0530
Message-Id: <1579181217-31127-6-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(189003)(199004)(7696005)(44832011)(186003)(70586007)(336012)(478600001)(2906002)(4326008)(2616005)(36756003)(81166006)(70206006)(9786002)(107886003)(426003)(356004)(6636002)(6666004)(81156014)(8676002)(5660300002)(316002)(8936002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR02MB6724;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1056e9cb-f23e-4fd1-6e84-08d79a87d58e
X-MS-TrafficTypeDiagnostic: BY5PR02MB6724:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6724A195BAF52904852A594CAF360@BY5PR02MB6724.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02843AA9E0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XyXKuMTOjksSK/vVRF42/d2odaO93yDA+2NZ3LGfveL0VPU04Tz+vtSODkWMx7j8gFmkqIGEqBNmYEiyLzoya/zr2UhBVOtGLzTZLDTj1b4LnEo2VLFB923XFsh+zFtuHSX0zKUWshcFTE5BP1y0H5ys5FCIWvbxGnnA+Y5ihlwZr4MZcNueSL9xUkQU329OGjQi7h5tB76mmLXryY0yudgaLGKoXHLm0NK/nx/2vvRD7QAJUm0s+DMmyUTzfLIBH3QvDYCoagcDZ8wXM17gTiuhAhmUY5ps4P99W7PKiz6PjUKHGDR0EUtYqA9c6hcs9V6ppgDHLySt7qK9ajD1MyFCFvp8KhPOKZCLgyETOQkUx4FCt3RUBSVp7kqFvhXLUZaINbXJcZPt2YQn10KWigckuxzWY8lAY/vd9pN4g2lcO42e+dqfJiSoKl7aPvVA
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2020 13:27:28.8877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1056e9cb-f23e-4fd1-6e84-08d79a87d58e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6724
Sender: linux-watchdog-owner@vger.kernel.org
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

