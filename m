Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D267434D4BC
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 18:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhC2QUQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 12:20:16 -0400
Received: from mail-mw2nam12on2069.outbound.protection.outlook.com ([40.107.244.69]:19105
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230397AbhC2QUB (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 12:20:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NP8mcjC4XlfvvKk2LtzFYD/4Bh1MsVrDb00SykgnJtZcAbuMuIS+N/oPa/PLJPr71mDtCoXPVMchpmSBECQB7ZuGkQU/thbxArwJPbuN0mOcUysw2BFDmVleedmWAow3TfvanAD3CVLu8VH1KgcXZbd4wrpYyQznkOSYF/A7RHCRoFlCZvyRvQSZBwWq0uC0RmiF0UcOPg76M5/jtiF60s5Lfv2C6IVtFKGyFw9d55F/KJXttGGIUzZnaJDOAueGYbp1HSuArIPnPIbLozAuJ6+s0u+e36A2bS46ktZxENpXauBl35upq4m3jvPZUDUjaSvlRlUpJqDZUW4IInykHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZnI2rkk3qtBrTzecTCr/PKsSPaVMywOsYWLcMfwAQ0=;
 b=gIWaO+t5IP7qSoSeUQN0bsdSfPaH6E+ldxN3rKJhRErIBnznS6Y9JddyjgKnJa7KvvPAR9tXqAnyHbJ2zFg2fAHlc+TF3ctDCgwTLDbBMdNFr7IRqod3M6c7kyPVmdHITmpjdvnhORzkXK0ShzF7acKb0xmnPZtAiSVOFg96Kn3GWeXAp+XQgw1sPy8yzy+exqUxRXY/XLPMIOzeZfQSqvkfkxDCMd8HoX/Yhlg++94gu0o3x5s+q9iD6p3W9QgfkWpzVQ0qPs0AZjGb79s5fJR6c/LONPrmMU+MlTWxb2zFkrrf6zkz/G9qaxFkcH/s8cgtd0y5DOfxkGmBPMIkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZnI2rkk3qtBrTzecTCr/PKsSPaVMywOsYWLcMfwAQ0=;
 b=SFDs51iCFOWcxE0oEncIOTlKjnVE0SStPBoQwsOXoXM8oBs6ZyFdyk49TlzY3P2anK2ragcH4ScOHJH1MP0+/jT2oMPhyIL4rpSnna6ExaluYWifI93z68MwQfH31xx3Lz/hadku9A7qVX7+DCBnZxTv9r8J8KNFLYHyDmonIzE=
Received: from DM5PR11CA0012.namprd11.prod.outlook.com (2603:10b6:3:115::22)
 by DM6PR02MB6793.namprd02.prod.outlook.com (2603:10b6:5:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 16:20:00 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::25) by DM5PR11CA0012.outlook.office365.com
 (2603:10b6:3:115::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Mon, 29 Mar 2021 16:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:20:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:19:49 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 29 Mar 2021 09:19:49 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=50308 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lQucG-0002qR-0k; Mon, 29 Mar 2021 09:19:48 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2 1/5] watchdog: of_xilinx_wdt: Add comment to spinlock
Date:   Mon, 29 Mar 2021 21:49:35 +0530
Message-ID: <20210329161939.37680-2-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2f84a60-1c45-4c46-01de-08d8f2ce8051
X-MS-TrafficTypeDiagnostic: DM6PR02MB6793:
X-Microsoft-Antispam-PRVS: <DM6PR02MB67937548A2F6AF1F0758F3F8AF7E9@DM6PR02MB6793.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DWUuYEJXtIUeEbyn69l4TNLUJyKpYpYwooIUSueZbDJ2frfSAIFtZU+ZWGNZFN6FY498VaxWAc+aSYP0ib0QvcWce0ndax5QhtfCX4RJMhpz5qtXTH5Uae/thWJHten8xkrffXBuLo5xxr6gSO56E8kSQecXKvyozUyLResnWr5Pw8haBZAn7/pDpectigLbHHcrcTgGM5A+9y9W45E0g2mBCr7/dxSY7VfZ67v1xTW/UGp+YhK9kUmf9cZjqlzWMsPDwPuu2NwARwXS5DhNMVzLKTtY9o1eBd1emwQ/w6jaKie20Pv9OtFgFwv8D4/b6jJryqHnjk9MkAHImil0LS/sPo/29v/p7BsbJ0pghRVaLex3Or+MvNMN03qfh3jfbTNZMh6KPXU6ihIlsXQnvZxI2FCgvJxdeV348gmhq6wt1zwYvmfgDF7EHwft8Z21oAYK1gPke3PdgvGRj0+fUTKMz5XEiE2W5bfVc3Bf4XK7tKR9yi55gJSDVehgawbd/bM9smrB/Qtj8JKzrL7Qqggj6y4lEpCxfnK/tRNEZNqYhDfazOqfLNxm7O8FNcJD1X7xvka8AX7VnR0C6W/nl8Em3A/IzygpwMSth+qkDrITeZH18hkzVTZoK56br/a3sIrRlChoNWNwOKPudnoRh4HB3f2dKF5eo8djwENQgduhPDvw2/WFtooZHcUTOwg
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(107886003)(7636003)(426003)(8676002)(8936002)(9786002)(6636002)(70206006)(36906005)(316002)(47076005)(82310400003)(70586007)(54906003)(336012)(1076003)(7696005)(5660300002)(2616005)(6666004)(356005)(186003)(4326008)(2906002)(36860700001)(26005)(478600001)(82740400003)(36756003)(83380400001)(44832011)(110136005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:20:00.2272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f84a60-1c45-4c46-01de-08d8f2ce8051
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6793
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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
2.9.1

