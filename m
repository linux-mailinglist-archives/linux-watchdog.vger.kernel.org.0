Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9AE34D4C3
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 18:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhC2QUu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 12:20:50 -0400
Received: from mail-bn8nam11on2051.outbound.protection.outlook.com ([40.107.236.51]:4128
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230415AbhC2QUT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 12:20:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asAZHbu1pv37Ix8X8e6cQQhDkweYNHih7pi/cSwEh5zeIJS41MuJU1dhjDzyxBfYYw7L5vu0WnD2Cu8RkYIoK6RgTx2R9l4JMexvEyWaIYEfacW0xVyPo+JlJikyZ9ndmsWeLu/7Xqu63ij33iyIryC1vMWC+gFQ3X9CD5soWY/JN++LXGLOnI+ujp2KjeAWArVSzgRMnkWOyuFfM02zXt7xTalOkQo0Arj/9PmK85lQWPXVdU4FFPopKSQ9QRIUvv+HaGWvI137pVONijUxHTi/qrPYn+h4PoBZVMLOaO9UsiIsQ7mOefWzPOF/sPnZTtCz6TQhGVCb1bP5Hd2k6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8it9juZAXpUWUol4IqQ9nnZXcfgkro1GMaXOFeJGNxk=;
 b=eHlYP85Vpp1kShGXjvKXAYAKQ3olFxY3Z3vubMQ6y0LUJuyKntq54bKGKpuNRmupA9+N4l1yDzMKJXgE6iSQb9K5mjuCwdnwPP7NXkGLwQ/oSJaxwVuEBtaclIZ66CLAd62cXYaTjuBR2OasO8zKzFiypdLXx51EYP6lJMS+h3Ngh4NMmK3SUUHfuMbLtl02qL6kZzMiigtHb8UIz9JTpgnJ/vdAgzhqPJbbsJkwcd1kNfP7OnnjsplvtqKzHTWakvp9XtMW5hOaip2xoaK/uAF7lnEs7DAkOSwxS2KNWrFv3XCpS79Igp9a71taTYTluOUwIKGzSt+LvHWTDcjl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8it9juZAXpUWUol4IqQ9nnZXcfgkro1GMaXOFeJGNxk=;
 b=ZjrTbM4Q65LHuORnZesePx6WB4HWIlhkM1W4MStGGCCql9AaDReDrDnVKIxiS5mMJOAJqizV8RXpfYOMHiyGwBcgmgmKWIQ1/FKLMZpabs2Ui8hLSk8Cw2XI+sBi1LeG2Q0gycm7c1NjG4+jqrkA7p8NXuAQIJv/0wuaZOPY4yA=
Received: from CY4PR22CA0092.namprd22.prod.outlook.com (2603:10b6:903:ad::30)
 by BN8PR02MB6001.namprd02.prod.outlook.com (2603:10b6:408:b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Mon, 29 Mar
 2021 16:20:17 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ad:cafe::6b) by CY4PR22CA0092.outlook.office365.com
 (2603:10b6:903:ad::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Mon, 29 Mar 2021 16:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:20:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:19:57 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 29 Mar 2021 09:19:57 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=50308 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lQucO-0002qR-LT; Mon, 29 Mar 2021 09:19:57 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2 4/5] watchdog: of_xilinx_wdt: Remove passing null pointer
Date:   Mon, 29 Mar 2021 21:49:38 +0530
Message-ID: <20210329161939.37680-5-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb99ee30-e123-42f8-13c9-08d8f2ce8a5f
X-MS-TrafficTypeDiagnostic: BN8PR02MB6001:
X-Microsoft-Antispam-PRVS: <BN8PR02MB60017778F1D5FCFEF98CEA00AF7E9@BN8PR02MB6001.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c04vHBmHYR3o1HbzFaw2v2BR8RmIK3lt5SBmDfZQFEZBnmtjjinw+uq/Swqh/hcGEV+xwoNrNZMvAeWZpZehQw99q182r5Eiii+eyJV/n1cLA83+iRjy2+kx6yCxBzOWLckjforJtaPb5/qbCAwfiL7lrKZp8eVAwUuOdNu/D/cQ4EszhJjev169AxbKXLMDhnQny/G6GzIQ+M2mSk7iAzadfYn8oGP49Rvix2y6YSnXKVbhNCcJiHSlTQe8VOqTR2dlDrl4zAdC1RpCH62V38t5mhFk6NjSYQWxPToWMjHYvVB2dmpsHaaNNA1/aeyZvxUzCK6w7nSbYcBZ/kPaQETcPnmCGL3XT8L2V4IE8Ayb2HcV6piFBduDMLroYSIgykxYJw2GC45C1pCBeYnr5TVWs/20yhXdWwSikMZZC4PrvAr7DH9ipUSHH2ImKJ1BhR03ASW80H50kYhbdmTU2z/Xmzm1Tg3W4tYqPVkxIzGZfO+1J8DjDRPNzAtjTzDl2J3nhQ4MDxY0T7O6lD15y8N0rlLpCG/cfeTYg2MI8YigTLm/WzSIcN3V6RpJS/3j4Oo/UvlQNxTZYzg7Bs6t6pKJHzC8V8TRdo/62U/+WjvsXY1k0C1z+bTmRDBdUgYKnSd/cLsUD/FekiVO1xeMaATrnxKXIGRFEyrYOmMqUb7YQslTCVIxnQWeMD3tI85F
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36906005)(498600001)(6666004)(8936002)(356005)(44832011)(110136005)(1076003)(54906003)(2906002)(107886003)(70586007)(83380400001)(36860700001)(8676002)(9786002)(5660300002)(36756003)(70206006)(7696005)(336012)(82310400003)(26005)(47076005)(6636002)(7636003)(186003)(4326008)(2616005)(426003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:20:17.0977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb99ee30-e123-42f8-13c9-08d8f2ce8a5f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB6001
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

clk is an optional property, if clock not defined,
calling clk_prepare_enable() and devm_add_action_or_reset()
are not useful.
so calling these two apis only when clock is present.

Addresses-Coverity:"FORWARD_NULL"

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/of_xilinx_wdt.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 5f31fdea517a..afbff79cce42 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -211,6 +211,15 @@ static int xwdt_probe(struct platform_device *pdev)
 				 "The watchdog clock freq cannot be obtained\n");
 	} else {
 		pfreq = clk_get_rate(xdev->clk);
+		rc = clk_prepare_enable(xdev->clk);
+		if (rc) {
+			dev_err(dev, "unable to enable clock\n");
+			return rc;
+		}
+		rc = devm_add_action_or_reset(dev, xwdt_clk_disable_unprepare,
+					      xdev->clk);
+		if (rc)
+			return rc;
 	}
 
 	/*
@@ -224,16 +233,6 @@ static int xwdt_probe(struct platform_device *pdev)
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
 	rc = xwdt_selftest(xdev);
 	if (rc == XWT_TIMER_FAILED) {
 		dev_err(dev, "SelfTest routine error\n");
-- 
2.9.1

