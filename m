Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045E233B04A
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCOKsP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:48:15 -0400
Received: from mail-dm6nam10on2068.outbound.protection.outlook.com ([40.107.93.68]:25024
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230108AbhCOKrs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ob1IM4tda1ex5Q5Awb0zy37ECM98oehX36EwugkXlowTBcHbhE4Jgx5ANXeIQa1nBSrEomZSFua4vrTUXtlsGOpJkeUotVcE8imNCAgYlKm/E3idkEyA+J9wNOlPHd2419OyvxVj93kmm758IaQB4xEbrFfL8pyO3iBfbtnDml8x4C11GP33Z8bY/l4VImZwErsTXoI2GIKg32y1WYjQmml1ttVq4CigNgF+l8LLZDb+eLiy6nmS4WGWkFmcW37dblO3UUu3p+q5489+3YHlAdQUSGBPeUJYuSjp2U2UUBCPmT23A0V3Cl/P/t9m1ugVS4lf1IVaY9qcfmw2wps0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdsY9hka6qUPc+TwWvuLFBdy/7CJ6hYdhlepGwGPJYQ=;
 b=HW96BW8gsZGBsBJtS05ITHzvy2a4lTETp61meINbw9Ra1w37oITuKaLl+SlNwqNrAxQ+xVTGhNjbTM5ANSj5LTOTaVEcHcuo57lRzirThx7/sobEP7B8AalDnYKLmFvmTVNNHWPez9Q6BrV5H3QB/LD2SFAL90RIjJCFSxKlxcXFv3hdCAO7Wz5pq+mm8/tRyTXt7Jf58CYGEiyEVZe+YgHNK6ZE68oJp4aG/AOcPW/CVd5x6AbFDg4rIGLcS9dCOqmKVBIXxC5vZhk8DVAxS5c2CVpk3sy9wJZ5OrwwtC8HN3mshf4BxDH3JSuT6fClpjfw7HDU0NkWV3Cqxu8WDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdsY9hka6qUPc+TwWvuLFBdy/7CJ6hYdhlepGwGPJYQ=;
 b=ku+J16zwiI2o85oEBkDm1j+t1LGQEAC3lKJ9cB1Oluv2aRENseSJgtEg1qXhVW+Zb37LdQB7BBgVQu0/xhV8vcaGWp8c9CR95W4qF7WWdDp8aLclrgYao1TuXxLgY879V/++rxx7UkOeUchMiBB+HNnn9sFUsoQ6F/GTa9AysDc=
Received: from CY4PR04CA0044.namprd04.prod.outlook.com (2603:10b6:903:c6::30)
 by BL0PR02MB4929.namprd02.prod.outlook.com (2603:10b6:208:54::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:47:44 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:c6:cafe::87) by CY4PR04CA0044.outlook.office365.com
 (2603:10b6:903:c6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:40 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkl9-00055N-2j; Mon, 15 Mar 2021 03:47:39 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 8/9] watchdog: of_xilinx_wdt: Remove passing null pointer
Date:   Mon, 15 Mar 2021 16:16:53 +0530
Message-ID: <1615805214-24857-9-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50658cf3-fc3c-4e18-be3b-08d8e79fc37a
X-MS-TrafficTypeDiagnostic: BL0PR02MB4929:
X-Microsoft-Antispam-PRVS: <BL0PR02MB492962D7875C5683224994BFAF6C9@BL0PR02MB4929.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cfwi1DBxu6OicpnuaoBl6kp5QEE0bf21UIZEuFF09rcKSoH2peUz9IvPOtjfs+7I0zpD8lVa51kIfpTqT38XrrkjzX7/iHWPn80jDrgZ4f3hlf+TFCvGOCZrPYOwUvxEtHjM32KSjCHiF2LBjSocjDc+TwBxTTDJRrHYHe0WWBzWNBIR4M8+nOSUl5hkFbi7gGIh6OTdpG6D/73bTwKx5ijcFHrsDvW5TxkA55Ah0q43jp6ZTMA+epLiI8uvnTGz8pNc/RmvbtRvKiNxwmobr8uWqxv+Pjss73oxn+gWRaiD3KB05v4mhpAAiovIV40mTJ5HvqO0NH2WClXh5CXfbgpuXO7+ppjFZontlXSDhzIKro+HsSGooliDLt/zI2uTo1fynmqOjoRzWhHfABnp4WW6MdBh/dq84w791eGNwVeWgxemF4Qx3rzXsf6B0ha8xyjEmvhSvFeo5CJ807LtHJU+0bmTj79tePvFcMDL5Fb9dePp0UpWFCAeLs0TVVag+6qOHNJsL7jTev6eGXAJBw1m+Zt4LvF8eRG/3NPg8oAKIc7HiU9NSPw8jfZS3jB+FLsPIrbUNilo2MMXlb2YLIWbifm5X5PWbo5N16ktLvHqY7XFf4y1Kh2FtoPR98fm/iduc1i9FMCe6baceoksYdMB7L1VUDaVMPIoEyrluqZ1+lD09+TFWdiEZnc39dnB
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(8936002)(6666004)(2906002)(7636003)(82310400003)(83380400001)(36756003)(356005)(44832011)(9786002)(2616005)(70206006)(8676002)(70586007)(47076005)(6636002)(54906003)(5660300002)(36860700001)(426003)(82740400003)(36906005)(186003)(110136005)(26005)(107886003)(336012)(316002)(478600001)(7696005)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:43.7713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50658cf3-fc3c-4e18-be3b-08d8e79fc37a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4929
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

clk is an optional property, if clock not defined,
calling clk_prepare_enable() and devm_add_action_or_reset()
are not useful.
so calling these two apis only when clock is present.

Addresses-Coverity:"FORWARD_NULL"

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 3656e716b4f7..ad35c93b7684 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -520,6 +520,16 @@ static int xwdt_probe(struct platform_device *pdev)
 				 "The watchdog clock freq cannot be obtained\n");
 	} else {
 		pfreq = clk_get_rate(xdev->clk);
+		rc = clk_prepare_enable(xdev->clk);
+
+		if (rc) {
+			dev_err(dev, "unable to enable clock\n");
+			return rc;
+		}
+		rc = devm_add_action_or_reset(dev, xwdt_clk_disable_unprepare,
+					      xdev->clk);
+		if (rc)
+			return rc;
 	}
 
 	if (wdttype == XWDT_WDT) {
@@ -554,16 +564,6 @@ static int xwdt_probe(struct platform_device *pdev)
 	spin_lock_init(&xdev->spinlock);
 	watchdog_set_drvdata(xilinx_wdt_wdd, xdev);
 
-	rc = clk_prepare_enable(xdev->clk);
-	if (rc) {
-		dev_err(dev, "unable to enable clock\n");
-		return rc;
-	}
-	rc = devm_add_action_or_reset(dev, xwdt_clk_disable_unprepare,
-				      xdev->clk);
-	if (rc)
-		return rc;
-
 	if (wdttype == XWDT_WDT) {
 		rc = xwdt_selftest(xdev);
 		if (rc == XWT_TIMER_FAILED) {
-- 
2.7.4

