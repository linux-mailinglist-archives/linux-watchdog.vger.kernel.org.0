Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6141633B03B
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCOKrm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:42 -0400
Received: from mail-dm6nam11on2085.outbound.protection.outlook.com ([40.107.223.85]:18496
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230016AbhCOKrZ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VP9xLJ/vjLjiIPRVMajIW/XeGv+V0CJBhGsjh5H4Ay2oynRksupUSCK+bn7j3fYXXUnylTJ12+nzxAKfg5pNp+khjhsYxAaDvAVhKRyI1YQ3Xbjw0o4YAjhv9LbD+k7mexZy/TxsOUfR9lTVlAoTj43dmSoWPUOfFQ6+utEVmmsiVYf/SrN57lsxm3CfmgqWXh1tF1IDQ/gtoWtGNAe8a7OJUAbVA8dIZgr7z4glz+1AioEAyneVk837o+3cdpLOVwYNTED9rDuGnsCtbG6YkVvz2zw9dJVDABESOs1kgbYqX/BpSRbmucH/PYGMyWS81lSvjRSbFPOr+dLp00RmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/mBarU007hWExIircirtxwR9PahK/xaH4jnUcpjS6U=;
 b=SI+5DcJVs0aXQ1xlHtiO5t34n2sb5kYqMnloV6mPK0IJxyA5zI6b45eqpcSfzihRs7HlsFOvMK+/z6kdAvJ5j8WnZJVII7TDNQkLhEnjGzhasu412l9jZLhGDGC56GZa3okoCbcu8sUNfx0FOdPL7aQSUdtKYGcZFOfAZ3NgREOqZwan7uE/TS3AbmnMw+EM6sooZYQY4mizE37+kse9ZN5EDSh44KpmbDyp243nFAfZS/ckQmB3wM3WPvFonvuIXufqd5IHpcWG6407wyTlZ7WskW8SsXEsJOXVc4L6+KRZ98ML3DiIW2KFB5uzl1gZ87sKkYtuVLp5UqTyAf5Hqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/mBarU007hWExIircirtxwR9PahK/xaH4jnUcpjS6U=;
 b=ebZGoqwb+TIlIV9vcNeR8XLsrQdQEefUox5gqxPV7OOlZVJlms/10wmGeqZhR1VWIBPoVmrNa6tryruluFGWOHQ5mKAcGwDHcLhEV0MfLmSHJALW9ULDE6y+JszUKREq8lNGFLsGVM0MtuYrfzgEQqthqFAzoYk05D7Dqf1f9dE=
Received: from CY4PR14CA0045.namprd14.prod.outlook.com (2603:10b6:903:101::31)
 by DM5PR02MB2188.namprd02.prod.outlook.com (2603:10b6:3:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:47:23 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:101:cafe::95) by CY4PR14CA0045.outlook.office365.com
 (2603:10b6:903:101::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:18 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkkn-00055N-Nt; Mon, 15 Mar 2021 03:47:18 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 2/9] watchdog: of_xilinx_wdt: Used BIT macro
Date:   Mon, 15 Mar 2021 16:16:47 +0530
Message-ID: <1615805214-24857-3-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cd74a4e-b3db-4974-e9f4-08d8e79fb76a
X-MS-TrafficTypeDiagnostic: DM5PR02MB2188:
X-Microsoft-Antispam-PRVS: <DM5PR02MB21888A61306B62C1E44E7339AF6C9@DM5PR02MB2188.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vURGVF2vkVda1czP9Hz1jqbSi2musnsrtWGhsFOPrWIkoUd14II46kJ62zL+SAMGhA/Bnre8OHHG5TS8JkGewesoe1apBlQoE7ao4aFaUWB4QDEhXq+4hjEM8PYA2qdxRER7RLhuelHGgez6qy4Unlwv1GvN7LyG1VJVjLPhOY65HiKlTKvVEfymnfVB1GeyZFCOyk+/z0lHTTACiibAxCgf5RMM0hU4Tawi4QAfZIFq1ZLT0Nl6BoQ7S5JnxZ51cWEHQIYkGC2+DGJT7OdsK1OjFnsMl8k4fn0D7erfRKTVQaCeDUb6zLbyZICBEDSZZqzjYNibXRywND+Kxa/f6DpparH2sauvavHNpMmg0cgNg0jlhM5HfdxlNDrnvQv4iFjekH4buDD1rsTldTa4M8ewONZAZFGuBvydmFTdZC4yLy8MRhKrE//rorXkYG+O9dFwKEHpnUFb8ibAykFqhNtNfxyj80wrale6cL1p9TEGUokxoJSrTt3fxPzzrtEBBjJdOO7W99exocUrmefb66oOgAwfJC2G5/qe7yPYd5DDqZFE5EclXouzbDUA7sc3S/Oeo+Id+C56BC53OTcdTOgl00A3/uitsxLfdVtiih1tnAouDSATBwXjCPnCrwNx8BrlBugQGD6/EdMKIiAq3+VeW132Vu9l+HrC4WZEIT1EyU2B3pjuP9uIP96NkLr
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(110136005)(70206006)(186003)(82310400003)(9786002)(2616005)(70586007)(36756003)(47076005)(82740400003)(7696005)(54906003)(6666004)(8676002)(107886003)(6636002)(2906002)(5660300002)(356005)(83380400001)(478600001)(426003)(4326008)(26005)(8936002)(336012)(7636003)(316002)(44832011)(36860700001)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:23.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd74a4e-b3db-4974-e9f4-08d8e79fb76a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2188
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

Used BIT macro instead of mask value.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 00549164b3d7..0d7df2370db7 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -24,12 +24,12 @@
 #define XWT_TBR_OFFSET      0x8 /* Timebase Register Offset */
 
 /* Control/Status Register Masks  */
-#define XWT_CSR0_WRS_MASK   0x00000008 /* Reset status */
-#define XWT_CSR0_WDS_MASK   0x00000004 /* Timer state  */
-#define XWT_CSR0_EWDT1_MASK 0x00000002 /* Enable bit 1 */
+#define XWT_CSR0_WRS_MASK	BIT(3) /* Reset status */
+#define XWT_CSR0_WDS_MASK	BIT(2) /* Timer state  */
+#define XWT_CSR0_EWDT1_MASK	BIT(1) /* Enable bit 1 */
 
 /* Control/Status Register 0/1 bits  */
-#define XWT_CSRX_EWDT2_MASK 0x00000001 /* Enable bit 2 */
+#define XWT_CSRX_EWDT2_MASK	BIT(0) /* Enable bit 2 */
 
 /* SelfTest constants */
 #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
-- 
2.7.4

