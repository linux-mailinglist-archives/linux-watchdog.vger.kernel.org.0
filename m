Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF133B039
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhCOKrl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:41 -0400
Received: from mail-dm6nam11on2086.outbound.protection.outlook.com ([40.107.223.86]:34809
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230002AbhCOKrY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiQp7IWMwYRclMVAVRSismVFFX+ajLLz/pTVnwX9ukzHMdfP+A6nMifov3thuv1KVFB1RdDAXUXwKKP9Z8MteIAciwy9BUzWg2INFvze5spGmCNl57IGKWlKBhk0rd42IYSY5PaUHHBocCEHNMDLWFlJzsWsuO0ftXRjPR4W9ADpZLbOi/tnCP8c0152vcz9kjEO5wGETpyUbBMQRXDmZCrp/1TNOxHdcdgorjyi9FfucQtbMYsOnMbwubqz2GUn+rejn0JMhc4cRZHc/LhNJMOrWa6xkJHayr+K3XlJ916ZPWyAXx1HmUafdGLjCzSwqff3r0uic0PNFazoi6R/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+St41h16lx3eOLcbriBkxDc2LwEYg1dz45xs2HifVWc=;
 b=cFbgAqXboFGdtuAW3E0PiEmAMktT6xeXFQzlud6jt/qLrBe+Lzwtk9qnEo65g9gWx7usljkXLoPLlEzxFEVKExXy8WfUqdOpcolKGU7iIy2j1qsl5X0qSSh0EHWGDyHY6/yzNHcHU6puiPyc4DIR0hefl6A02z8omMQT2AdqnAc8463Ks40hO9/BnYjmKxHbrlK8UyyM0GQAQVqg2WBsH1rTo/duT0uSjNZdxl3f6i2lMY6lkRamHeMV4rhNebaGE2/OVbmWsuPHHs0CIE4EdtqhFQ/zoywRlRIecsqCfexPK4LqtiCpaqGXiYGLYhNru3ubIAtGdXI8CxT4lkinSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+St41h16lx3eOLcbriBkxDc2LwEYg1dz45xs2HifVWc=;
 b=hV3Fnwg7TXcaXsyJguh94CRKoMY6RzEjtmhNT7wjV4/sPU3CSMFQVME13T15WwPJ8d+HF2xqOSwiBwdp1LxGAvCcRg7hQ44isb+jmLMcPxfC6CCJcpNFlOsRTDaj6s56BqS3cm3mQaPpBm9Bh8AR6nlQZARkm/J2F7aTztyrrm0=
Received: from CY4PR14CA0035.namprd14.prod.outlook.com (2603:10b6:903:101::21)
 by BYAPR02MB4583.namprd02.prod.outlook.com (2603:10b6:a03:12::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:47:22 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:101:cafe::9f) by CY4PR14CA0035.outlook.office365.com
 (2603:10b6:903:101::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:15 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:15 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkkk-00055N-Ih; Mon, 15 Mar 2021 03:47:15 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 1/9] watchdog: of_xilinx_wdt: Add comment to spinlock
Date:   Mon, 15 Mar 2021 16:16:46 +0530
Message-ID: <1615805214-24857-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67ec6a80-a737-4599-cdd8-08d8e79fb662
X-MS-TrafficTypeDiagnostic: BYAPR02MB4583:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4583DE01BED7AAAD3E41A759AF6C9@BYAPR02MB4583.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROconV9d2zhrhUnpNE+ppEfeytlT9uLBxuLyAa83nHf/HZUWVFUEleKRyaCOlYEfcJn+gh3oiKHC1Nmbk21h56Y8qzNjYeXb77wzfDLfYsLnu850YJX4HJDdX+MqcCBUBLKpJsDh5zFn9aYPluM1q7XZA6KXlbnwaGFKF+myWZmK1qJ9XRL56IxO3rga03ELxMe4PDpq6/+MbFksYLWNWPxHirmSOKg/h8GHuUCEU3+n5iSP7SsIm+0Tk6uee61bLiZlBUbpL+oP6uV4/kDEhoBQpVXq7egbMgNQjhMMDonzlrpcEmTFbXM2dPHHQz6Q6UOqzAwGu22j5AsVOhy8XqQjpPJFN6O+8barHMdscOPvdCKiH1GQdgZ/5tgXSLnR0cgB9Ysj4037hD3FuVkIF8wnOSdrdhET93SrqDcud3iJI8Y0bz8e0YYezbv43Uh8sRL0WQjimIfetOYD/sjZD52pWPDZe/rQUjuMOV6oIq9f5OGvpOOGasmGLRNbnVw/ZMT48q9cdl1CqAnd1SoqDfLVfmge3OoTkS/RHJSANDeEznh6BA07ZYbHF7EhM3LkWTnok3ULyF8GfqFjog3EqxHGIpByZghe6UmZHABH10maG38zZJbNjGI9T0rkMn2H6quzNMbIOXZR1xZmC+DY78HINwygvlsiyjFoT3Mw1XnNIhiNIMOmTMYFZcS+D3EW
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(36840700001)(46966006)(110136005)(82310400003)(54906003)(186003)(36756003)(70586007)(70206006)(82740400003)(9786002)(4744005)(47076005)(2616005)(107886003)(2906002)(44832011)(316002)(36906005)(36860700001)(356005)(7696005)(5660300002)(426003)(83380400001)(4326008)(26005)(8676002)(8936002)(6636002)(336012)(6666004)(478600001)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:21.8020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ec6a80-a737-4599-cdd8-08d8e79fb662
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4583
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

Based on checkpatch every spinlock should be documented.
The patch is fixing this issue:
./scripts/checkpatch.pl --strict -f drivers/watchdog/of_xilinx_wdt.c
CHECK: spinlock_t definition without comment
+	spinlock_t spinlock;

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 7fe4f7c3f7ce..00549164b3d7 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -40,7 +40,7 @@
 struct xwdt_device {
 	void __iomem *base;
 	u32 wdt_interval;
-	spinlock_t spinlock;
+	spinlock_t spinlock; /* spinlock for register handling */
 	struct watchdog_device xilinx_wdt_wdd;
 	struct clk		*clk;
 };
-- 
2.7.4

