Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB0634D4C4
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 18:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhC2QUu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 12:20:50 -0400
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:57056
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230399AbhC2QUS (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 12:20:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awX48N9thbjASUrdjfHU08Y9WeWg+tpY0Ez6ivRm7+E4vekVr+/HnWK/pNSs3w+e1KwWfZuZZq28y3Z4PTdAiMO4v6fF1IvzfxnT+FysQRqTyuCMQDcyhW19TVmXBst1Taka/3xKIqRemOkVIBivkJzBD4x/iEMv/PR5cwBBO/P3LhZLLw97UFQZR62FprzK14skOaM+2BPdT4Ki+AO/cHkZYEz0/SPWhfBo3dVd3d/0gLWiGh+FcMiZHoVJVDh0Ye8o6FmXDspq33HvcEmB4HKfoGGsHV9SbgB7VO+lh3n44eDqGAK6+8lWpz0RWxEuNbNTcEDbarHjfzn7ZzI0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe5DPw70EUXqevLT7Mwr9qTrImsAq1HJ94uLtEUhAYo=;
 b=CYT8+uz3e780oXsGkoCDw46pe5ktx8lDv0IcURLmAn982qjGzL2akVGiqfMxu3L0XwKYWWQh866HJ80HEoJ1bbFsE0vw3V757mF+Pk6smsmR/tl1rzJuldzIk12UGXQnFzDEth4JGYIsSSSYwFkJ5wLIZav7meIZnUaeTMd7BDMFrynkkGaVKfAWkH18AMC4U9loGn06V6lvnv4Mjvgj9jvIwFq0xrYa/VcIiVNUZuo4j6dZU7CSxF8OCePihcCT4jbYo/edLiLjF/9CXo4X48GE93flN09zXa9cVuRSvcEirIeg0D6tR3dMWmNs9OkyMtZsXbBA0UFLPlHLUbsiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe5DPw70EUXqevLT7Mwr9qTrImsAq1HJ94uLtEUhAYo=;
 b=aGF5KbmYPsMQfU7MGGhgggwS6Dibl+OsqJFAZuzOvIpMGP9FyQBkIkLiK+aHAS3GxugKHFDItMs3A9U/O4rNFz8+6M/TNDJmxqLKkFGkaA6XbvwCJ+ASZzoNCoaM0bk/h53Slsh1c3l+XT2gXlDXBhPSyGXPvjxD/400L4G3lig=
Received: from DM3PR03CA0021.namprd03.prod.outlook.com (2603:10b6:0:50::31) by
 DM6PR02MB5211.namprd02.prod.outlook.com (2603:10b6:5:49::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Mon, 29 Mar 2021 16:20:17 +0000
Received: from CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::1c) by DM3PR03CA0021.outlook.office365.com
 (2603:10b6:0:50::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Mon, 29 Mar 2021 16:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT055.mail.protection.outlook.com (10.152.74.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:20:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:19:55 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 29 Mar 2021 09:19:55 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=50308 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lQucL-0002qR-Tu; Mon, 29 Mar 2021 09:19:54 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2 3/5] watchdog: of_xilinx_wdt: Used dev_dbg()
Date:   Mon, 29 Mar 2021 21:49:37 +0530
Message-ID: <20210329161939.37680-4-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bfdafdb-6cdb-49ab-07c4-08d8f2ce89ee
X-MS-TrafficTypeDiagnostic: DM6PR02MB5211:
X-Microsoft-Antispam-PRVS: <DM6PR02MB521143695138B8BE19C44CA6AF7E9@DM6PR02MB5211.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BILbD2ucxD/mmxQUrImjwUWOX3JOtsJ4qp5lVMaukYcAvPiDEJT61mNMCcuVQ3eE84uEnw8R7PhzSg33beCFpxa689BTq8+ugj8czG1fnafH6Z+4zURl75w2coECipJBw/EbCt/DCAONZAk6g7zsiESWaz6tPQG6re6BnRw94qS2FNTiTNJP8uPBOS3mh6J7lR9Tk/7OsEDBDzIKJ/15Ut92Sv6tAVdP+RpIN9TA+WUQNw+zSy8myS61OAYzWtkokYiCVGEU4LoI8zSYxAMyPNHY8D+BTsCkYIP/nGyiOD3uQZcIpTxoovhKHKKRoLPDPRChsXmlWs2oeXkrfqgXk9sNwftDD+/8YUfnr8H69lr9C5SPHygjqG1PYJdfHte9MxCJMZcw22TDCPTo9QFYyXV84V9NKtqx4voA4GuZKo2Z0Kb8KdRx1JVAbtB5ZHUS2v0KfYrhWkHDKsbnD+6BAwzmsmK70vx7Fv/p/A7YKKf7wWQyvYQ+6DaYq3vHweVBnmQ+rDgMtT5AYFxuZdzzjNIi9jcJWazgg/WTiFSWUpznloKf4xhJdpTFB+EHdy77GhoiyC4jDOUbgLIr5hocJhxrTztU8vk0ED7yDj5GKPkOsmvqBv0go2jm+A2EREXye+lqrw35UIFWtOhCJ0WVlz7rI78tv7znd5Pngioytr5RqUYJSPspVvCHHTpRXD3Y
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(82310400003)(7696005)(336012)(70586007)(7636003)(47076005)(70206006)(82740400003)(4326008)(107886003)(9786002)(8676002)(356005)(8936002)(186003)(36860700001)(426003)(2616005)(83380400001)(5660300002)(110136005)(316002)(1076003)(2906002)(54906003)(478600001)(6666004)(44832011)(36906005)(6636002)(36756003)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:20:16.3459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfdafdb-6cdb-49ab-07c4-08d8f2ce89ee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5211
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
Changes in V2:
-Updated minor review comments.
---
 drivers/watchdog/of_xilinx_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index f76ec56859a4..5f31fdea517a 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -71,6 +71,8 @@ static int xilinx_wdt_start(struct watchdog_device *wdd)
 
 	spin_unlock(&xdev->spinlock);
 
+	dev_dbg(wdd->parent, "Watchdog Started!\n");
+
 	return 0;
 }
 
@@ -92,7 +94,7 @@ static int xilinx_wdt_stop(struct watchdog_device *wdd)
 
 	clk_disable(xdev->clk);
 
-	pr_info("Stopped!\n");
+	dev_dbg(wdd->parent, "Watchdog Stopped!\n");
 
 	return 0;
 }
-- 
2.9.1

