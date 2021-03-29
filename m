Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D213934D4C2
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 18:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhC2QUt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 12:20:49 -0400
Received: from mail-eopbgr700060.outbound.protection.outlook.com ([40.107.70.60]:10433
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230323AbhC2QUQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 12:20:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN9k/C24h52eAQuxVVOLFuadq4Bger296yFkJIxISznwbZ6JxdTaB/gbQvlEAAMZRfdQSwtFqEeXUBdqG6eERhUGdN7nuBOcu6Y/BOPkbdEc0AmuQaawZUyUKz+GCIhS8gFZ4sA3Ax08QMC1up7mQeIQ47E7I7bC+VZuvF637wEbx2Voy1lMUuomqqCGL3VtyVcpsK4vPeZeiy0ftg9zlugYXByGWztZLSXwLYRW7/DBbdYif1lUp6hbwLXA3C/hrF1MczDE6/mViF0/g3WITFN1iLLoJNV1Yu+8rmOdiXt3JtmyowbRHzxRxGiw3WR3/VzS5gEI3l1QJC2MwxbVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8m0cD9wEuxA6bSr7dj7+X/XTAvngObNdnLPFOgaLnI=;
 b=Z14947sGZbL/27D2rQfkE2hQbnEmEAUgj7ZfBrqZ2EQE0Hyb/NNYxIFtobsdplkzOPLvTkHRbdO2IIynnf63KgzplLyAkr16N1FnX7H+pvCMQE7EkQpA1stc/323aVE0XpWAkmiGB3w37ep0GY9ZJyY8TviNhAnt8/gzSmEhbKO4AVzYa8QbsgQTrR9bFTiazriQjldi2EBw0WT9ZH+NH/YbOkatj6Rt7Tk3BK4LEHKpcUydaim2CgOEeHmSIKjPkP7aO/OnUqtf457BPHuAk3TnxNA+AYRltRYo0qHBjbD08h7poXNT0VtPEkGTrPh+gDOXwBnh78Zir+joVEPisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8m0cD9wEuxA6bSr7dj7+X/XTAvngObNdnLPFOgaLnI=;
 b=I5N6SHof3uK31RvEEz4JZ2Wa75UzdLvl9b39aQmg020EElu6hCwWOnLyFhkPxD5QI4C5qvf9TTmwcRgOWktcs+oe3fRaaJfzRgpXUi3JBpCC1tqjNSoQhwXqq6JmXUZb+0OiT4sAdaJo2vjjKV/Q4W67wd26BgQDIXitm/p+PVc=
Received: from CY4PR22CA0081.namprd22.prod.outlook.com (2603:10b6:903:ad::19)
 by MWHPR02MB2799.namprd02.prod.outlook.com (2603:10b6:300:107::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 16:20:14 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ad:cafe::24) by CY4PR22CA0081.outlook.office365.com
 (2603:10b6:903:ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Mon, 29 Mar 2021 16:20:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:20:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:19:52 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 29 Mar 2021 09:19:52 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=50308 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lQucI-0002qR-VS; Mon, 29 Mar 2021 09:19:51 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2 2/5] watchdog: of_xilinx_wdt: Used BIT macro
Date:   Mon, 29 Mar 2021 21:49:36 +0530
Message-ID: <20210329161939.37680-3-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
References: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77a3ab91-8518-4613-15ef-08d8f2ce889e
X-MS-TrafficTypeDiagnostic: MWHPR02MB2799:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2799D36A1A2DC27E42666362AF7E9@MWHPR02MB2799.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPxXaYbi5wqO+hoGkPURZ4+VqeS41p0GDRnR5GQM6bW/Uf/ofNV+MBn7iwPPIzrf214RGLx1Z0LeNNhnAnEdb9Te2/6KSgV1xEcrwsnUP/FVcbP7L0rbkEJ0av7rJHNxggcT1h5FbO2Z4osa66z9kuhaiuz+XbUt+WZ/n38WQwi2gzH35v1Jiw8NLeHIH5send+UaKzOLzLY6JYqo9n/CX+Xt/gJ2GIZOcd89C0OjZEu1H88wSFR5TTPWPWZnN78QRDLniJ2uyduooDxC4lUGz3f7v36C9NpgU2i16b3f1wM1+VOnCgDbTHv3YW/tEcxlYNdrtnXMHqq7+TEBWsTNVDq/cJ/qPy4MW2s83Gmy6pK3YoD08NP5FB6eS+6cE/1G1x7P/TB9IqN/Zs1eT0lMw69Vw6OVLvExOr6+s2bNyvaGHjvSUtkEEe4h/Uxj+rvs9qx9MW7l0Ld7mJbcRcNU4MvhvEZ7F3Q1vv6/cd8N3A/B9+8+/xWT67K77ZgeSEvEgT/m4UkOQFg7V0OTbEaMPCrGEbrxIegtHVaUYOfTN1wgOStmKgN8qdxLRyh6tjCp2Sq3l60qIubiN+Wxx/d/Hi+5aRvMaBZ+33BL8CGLgvjVTfpXmxI8vL88fC0lZXyeXuSoEf65o2YlwerM95OiMQnpfW/X7gX3TqyfNlQUA7twcooHjbKThx/NxCMjTdO
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(47076005)(82310400003)(83380400001)(356005)(7636003)(36860700001)(426003)(2906002)(186003)(2616005)(336012)(44832011)(26005)(110136005)(498600001)(36906005)(107886003)(4326008)(54906003)(70206006)(70586007)(6636002)(7696005)(9786002)(8676002)(8936002)(1076003)(5660300002)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:20:14.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a3ab91-8518-4613-15ef-08d8f2ce889e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2799
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

Used BIT macro instead of mask value.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V2:
-Included bits.h header file.
---
 drivers/watchdog/of_xilinx_wdt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 00549164b3d7..f76ec56859a4 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -6,6 +6,7 @@
  * (C) Copyright 2011 (Alejandro Cabrera <aldaya@gmail.com>)
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -24,12 +25,12 @@
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
2.9.1

