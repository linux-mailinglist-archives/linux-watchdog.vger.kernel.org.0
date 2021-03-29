Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D35234D4C1
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 18:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhC2QUs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 12:20:48 -0400
Received: from mail-dm6nam11on2078.outbound.protection.outlook.com ([40.107.223.78]:31905
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230248AbhC2QUQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 12:20:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J06dUG6mb2Z0HEmDVVcINJ0BMs0EFtmjpOhhQ/qtZU9eNN5GQ1oEQsMdVQyJjJeEYLX7EZj1qcOLLrdvNx3odx7Ga305Sog2eLZ+3ew7qXzBlubKxKRf3cePeGJC/aNKx8nrv32uKg75xdAhdQCgZ6KOHWZG8VV4GLNyItxYxh111e4atI3VpxLgkuBM7VTfX1a2670e/Z+1ZHX6QmBhqlaiNuAbakAbeEiauXDR0VT1oTZZ9x/LVm+0vz3z9G5HUgYYvF9bBNCwTJNMlZ4J5q/LvFhPsQskVMaB4eeUb3BbY4fdodeS2ifqpI9f0SbEtO9DVnYewJCYp3FwDpIQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA0XV+Gknyqig2JLsiLL3A/TgDtxmHbHg/MTSn9A2wQ=;
 b=EZ1UfGlgXfq9Csuy51pj0TDJt4fPKgEadTq7b36F0Drr3SHpOJRsOq5Na8ioH47SpbwEbejCsCWiH6PLiT1BwEC763XQpChxhYfrvEaQ3qmXZnQbpi4gRbwpMIPahWzWV09TfOqpA7UpagbGNR1unA+TGApgno6cqUGtweZZHyOpx4Dp8qiJX1rwu5BnFzfit15qRGXJut1Xh8MEzCfilTjWUnr5whvDqD7QL1qCS+x4r0sYYEx6YRJlzv4XHVovWd6ZDoMGAHje2biToXU2hU881UfQVOr6Qsgpmxb42D+RFCrjyuxbXYv9hNYCDw1H5NRiNt/5V8pCXOG/ICw/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA0XV+Gknyqig2JLsiLL3A/TgDtxmHbHg/MTSn9A2wQ=;
 b=nm/QSmGz0+5bLA8gHaO4rQabbjCCqrBKjo0oTo9lnMyvPSJc2RhjSPUV0R5IJjIZKHL4BmePGUB+R9r5T5blHJi+rKE8huPSglLeS+VlaxrTCHtHCzA0r1gyt4bCmaMZhKGpxVuVpROqQFJvhG2jMdL4ncBjaPWy7mnfs7NxKeo=
Received: from CY4PR22CA0044.namprd22.prod.outlook.com (2603:10b6:903:ed::30)
 by DM5PR02MB3702.namprd02.prod.outlook.com (2603:10b6:4:b3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 16:20:12 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ed:cafe::e) by CY4PR22CA0044.outlook.office365.com
 (2603:10b6:903:ed::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Mon, 29 Mar 2021 16:20:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:20:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:20:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 29 Mar 2021 09:20:00 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=50308 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lQucR-0002qR-DO; Mon, 29 Mar 2021 09:19:59 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2 5/5] watchdog: of_xilinx_wdt: Skip printing pointer value
Date:   Mon, 29 Mar 2021 21:49:39 +0530
Message-ID: <20210329161939.37680-6-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9416ba6-76a9-414b-d9d5-08d8f2ce87b3
X-MS-TrafficTypeDiagnostic: DM5PR02MB3702:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3702D7D2B3BBAF25A24BC803AF7E9@DM5PR02MB3702.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igpZQrgbM9HBXjUVkLzHI2O7FV3YKAaxpridshMbOEfqBN+kwwTrRlEX3DgwtpVuOs5bfS1z5jcjzjx7tdWbG4NzdB360DIckqL1HuqevMe3BgJGkA9ALLt3H8orpNfwgr1LyhSlz2rJvADEQh7rs9yIIZ35EryulIeUTYIoNUU/LmfKJFePe3LfRSz0GpSWtVMhLCopBx6486ekbrOc5mvdPx+pj7oxqfmDHRjas0yUimiSMYXq89PfOdE15JxAFcDIvMstD7BE/2LRE1YPjy219cYw587PfJe+YoyABTj+dC7qTfA+30vebzfE/TGKOz9JAk83o6alqDJU/zltd28JBdxWdyV4CJicbBjnv8HVbv88wFk3QJdko3c8NNTYpiKVfleNcL19lZ07dUeWO0M+Hsy7hnzLa9BfE4TfkLYt/kAC1LkH4Qv+F2mgK4Lm9AxdsfN/H0P7Htld7hQvx05nWdnMD+C/54me5Y4Fo3oAxAKayFo7Zp9D3Le+vqW5xHfBYIaXCmG7O8QTmCRzKhP1tz50mpnc9LMI9Z9L+Ix7Kc6iHIrytvSZ5LPUkbugvQ5YvL+nDjp5ipA0OpHl9si2qBvZxdLkueSCO2FJ0tlOEesDV01LxIRqyTRTsGiEE2OAFJ1ml1yESFq7UzWJNYYa1pRdvzkrFp1tAygA353zkLyG4UDGlU6RHWTOrjWx
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966006)(36840700001)(8936002)(478600001)(26005)(36860700001)(107886003)(6636002)(82310400003)(426003)(82740400003)(9786002)(36906005)(54906003)(8676002)(186003)(7696005)(2906002)(110136005)(316002)(70206006)(36756003)(6666004)(4744005)(70586007)(5660300002)(336012)(356005)(4326008)(1076003)(2616005)(44832011)(83380400001)(7636003)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:20:12.6181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9416ba6-76a9-414b-d9d5-08d8f2ce87b3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3702
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"%p" is not printing the pointer value.
In driver, printing pointer value is not useful so avoiding print.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/of_xilinx_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index afbff79cce42..3318544366b8 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -245,8 +245,8 @@ static int xwdt_probe(struct platform_device *pdev)
 
 	clk_disable(xdev->clk);
 
-	dev_info(dev, "Xilinx Watchdog Timer at %p with timeout %ds\n",
-		 xdev->base, xilinx_wdt_wdd->timeout);
+	dev_info(dev, "Xilinx Watchdog Timer with timeout %ds\n",
+		 xilinx_wdt_wdd->timeout);
 
 	platform_set_drvdata(pdev, xdev);
 
-- 
2.9.1

