Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C0E33B048
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhCOKsO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:48:14 -0400
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com ([40.107.244.52]:18296
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230115AbhCOKrs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNSMcBJ3taDKAkS1Ag5APAzx6Hpau9KerV7+UTTqMKAMOIv3SronLPGzMwToxEuPnphOF0nLRlWhJ/lRrLPqdfkoH5J3jL0F0O4N4Qwth7qg73Sj/rFRnTPh0122r0k2udSeG6L3GKoqBtbdzjGpvfx3viN5YC7Mr+U8HkRSZYq+B6v8mItXrXyLCIQEeaJyd9Hc3QktYRdNmG3briW+ncnjyotF8vZBzzxAYbul/vPTXcgSETN2JN9F3l4030l3zhiqt67QDc1GRQx+qPraBNzlgIt16UlIbtoXw2FTPjzW0bWdD92/37hdzif/+D/gOtDebm6Ib7bcc5N1S8XayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfZvIvygELIpyD3Y6TV5MSep40e5DYmsoi6Z/Ufld1Q=;
 b=WeWEJsMqjB+c4WaZGxBS7/YMhaY0wzprLijtN7S1L6WuQwiekCq4IuP/6qxPJC49ZfsuieVfnTzLKPvgA1necpGCUPiLav7Yr7xNSZJky+oQXu/+5d8m6xHe+G7XWAHH4z5rGGifW2UWqCpdfARnMLQ636i3XaISDt/vIInJkq9SmCjyWzPhbPE8jUvjJObGRiRl6P8CNvZs7iTYEMpMCMIAnKO/4Kd4UZvkaoaalQBR7jhj30MrHe6InGo7j+VbKEUj0MyR5vRTslyzk34C+L21Q7YB/epcQhzTptiSNCio0xjGYqjSXKadDZ9DWy+fE6rO3EIAyc/JyiGrG2iNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfZvIvygELIpyD3Y6TV5MSep40e5DYmsoi6Z/Ufld1Q=;
 b=c6foquGW+fqFhY0NP38CY9GY2TYEvVtjn25fXe9gLfd7ZJrjCnHDEgSdkZ28ITArZed9rTYx6Hkeh3MbjJ9WBDrqCIB5DtUGTt5bJFaAzbN1TyzLxKljHvsEiKGVelAAZwv9RJtaunTLJ9HqfLJ2jOITcDPJovebhbcoBjgjf+A=
Received: from CY4PR04CA0045.namprd04.prod.outlook.com (2603:10b6:903:c6::31)
 by BY5PR02MB6387.namprd02.prod.outlook.com (2603:10b6:a03:1b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:47:45 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:c6:cafe::1e) by CY4PR04CA0045.outlook.office365.com
 (2603:10b6:903:c6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:43 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLklC-00055N-16; Mon, 15 Mar 2021 03:47:42 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 9/9] watchdog: of_xilinx_wdt: Skip printing pointer value
Date:   Mon, 15 Mar 2021 16:16:54 +0530
Message-ID: <1615805214-24857-10-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7caf91c4-bc3e-4f95-3773-08d8e79fc44d
X-MS-TrafficTypeDiagnostic: BY5PR02MB6387:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6387D102F48BF0B580C5B69FAF6C9@BY5PR02MB6387.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fpz4ur1LgoNXNOPlDdTaU4b3NneunAiAHpob5h1yAiZaaemdhLXwoRlguvsSTSSBlcDBiMPaRiQ7rC2U26HRGcYpLorjxJsd58AzXubsEHXQfsbWfDvYCGWxCRh32e2Bl5D3KGQHlym2EGNSAKd7pG+FFougD/KegvK9Ki/mFDT6SDinPPBJV74lkTwIyq2mSJ3zBEjOFRdRwMCl9h1BgnYddICdZAfjFVpED3CrGLKCbuWN6oQ88SdILzkR2GvLnfVGxE6B9uU48TP3GFZpJ3fnbISXlGuGODgboDz6cdtMVtWItuENSHb+JunrJMTxqf3eCRDjFOuaKc5HBYITIW8K/GxfKOefMvApI7XmTRb8wR30sk1elwiQKAN+1Wl1l/QJCmDn6PRDdVgw3HoD2ClrrqB/Pnj5sq068i3ZC7CWQhc94hvVyhAUAa5d2K5DyPG2XcypBUKea0sfvAeutx9PyDezweXrP695oVPRSFLMNX1sv7VTmGo9NyhTR3ZWSL7z11o3zosNP0bR+QT1x3TSjOIh5I0H+CRU+jmrXuvpzSUymxun/uwBSqKu7jUSym1Zgz3tK7waMcOTBCbaDIyL3isusUPzXBganN0jrjpZkcOjjZqDKnnn82UrWXoqhJJcjC8MRoLVskBMuhCc1GgHOgqUFif2v3ilt2WcD1KW73Dx57tHk2qHS4VzcZXf
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966006)(36840700001)(82310400003)(110136005)(2616005)(478600001)(54906003)(44832011)(47076005)(70206006)(186003)(356005)(8936002)(8676002)(426003)(7636003)(36906005)(316002)(7696005)(4744005)(9786002)(26005)(82740400003)(2906002)(70586007)(5660300002)(107886003)(336012)(83380400001)(4326008)(36860700001)(36756003)(6636002)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:45.1506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caf91c4-bc3e-4f95-3773-08d8e79fc44d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6387
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"%p" is not printing the pointer value.
In driver, printing pointer value is not useful so avoiding print.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index ad35c93b7684..df84734eba68 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -578,8 +578,8 @@ static int xwdt_probe(struct platform_device *pdev)
 
 	clk_disable(xdev->clk);
 
-	dev_info(dev, "Xilinx Watchdog Timer at %p with timeout %ds\n",
-		 xdev->base, xilinx_wdt_wdd->timeout);
+	dev_info(dev, "Xilinx Watchdog Timer with timeout %ds\n",
+		 xilinx_wdt_wdd->timeout);
 
 	platform_set_drvdata(pdev, xdev);
 
-- 
2.7.4

