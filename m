Return-Path: <linux-watchdog+bounces-3444-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB9AAD493
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 06:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78F23B9457
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 04:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D947C1DE8A0;
	Wed,  7 May 2025 04:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JUgLRNUq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD481DE2DC;
	Wed,  7 May 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593042; cv=fail; b=uoBlVRBt3jt1aOMU0Ej6uMa8WR92d6DfxolqT61iaTiUKPOwSasdqRj4tH+cg/udsGJPvR65Dq+newG/CHgtwsgCN/gDgImz8jE/OUkCpSoeZbSi9EU3lDeKa0pLYjNU6jwrRFIA07KMAliRiv3t6jq+URThIVvwD3D3sALkmqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593042; c=relaxed/simple;
	bh=9vsnJCOrlfdQsXwktUfBpPQ9RvGoLgFDhG6siVslIOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3Ukh9GxYI2m9QE6qdD2+GTXgzyUXiPWMdSnrem0LJuvV3/IgNM0TJH3/DJbbooDgjveRaJXa3+sr6z62US39Ys4hCrRUDc1Oy5oL325Q7PeCmDmLRziHdtQDZ7icc6Zw0T5l1/yHAwBm90hKIXmzBgDR88kK86aT02PcxA57Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JUgLRNUq; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvbsTUBfLsTAlVORYmTbAjqFPjqZkstUyoDMOQZYDsPI+qRCGirghQmBcn0+HxwJOF/4w2Xx9lyMMLX2xsi78aHB3E6Cbtj6MicxtdkaNMZzvM30TfOvf6bcGSKwaM2kEhzXXrckVjeW2eCXyn/p2rfIzbzmPXBC80VT6wKhTL4yl8kjDflIYEqSS6eZkbVsBXrj3zj0Qx48sCl9IwIuRbGvckBt3GI5qGmjruquXBWBeRkdqlnpErzH/tgj067DHcdtHfb9klyJu9hrjmvw8sX6/zR5GBMLYbbtRJhhZRLOkP0+ttjIXH3gjXt1lTuN3Jp+I76rQFwgu4XUZjoQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIdARNvH4c1WtkELaMno/yp3GqMWO2Rrs/jaK4r7lzc=;
 b=A4Vytzg0qBXKJuhLaq37m7YKi20wahYwLLoHt6xAVx0Upcyb72o7cg6PPxGaMxe3GhRE15XwTFcwY3redBMgJbqVs+fBhr6S+3Dm0hvzrwcGRTEjfzj58Mw7BiF50jGykY514cWSO+wbTfCAJSO2g2yhx/gwPwDFqbb7oBi17hwWQ5odcw1cWXmCYi1y0rFQHKCp+skBdMLNVYzJcxPEpErLvJU9IFPds70VQJaGvhzx2plQw1jWR/V3Mi2pecCNxgpDSn+D57IF71a274/4yA/NzM3wKngTTRtIfv0JJlGXfKhQU2ORyGn9niIqcaJ4zQrpcJ2Mt18RUG5CcDlVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIdARNvH4c1WtkELaMno/yp3GqMWO2Rrs/jaK4r7lzc=;
 b=JUgLRNUqo60T1tyWAV9QfVQJkcbAaDSQ+nFeuW9URctUrDrrUurImcF89phjDHmn+s0o5+rSFC4NpAfEVQsA/qJQbK1T4iPzZRzQz+2U0fspwOcKwIYvBvgILIA9I0qTjg+A/OWektvG/7f+hPlaqO4+ECrBknSg9rLOCzeGaKe/Elu6BVmDdeiFpwS1C/QuUWCSqaVHEQa+e+xMdKCxZ+vSBSHRbOha3BzALR/H+ci+cutv3sAl36XPlTNaTGhTAPvp+FJAWxS1WDrbu+jI9z4enwISOr4ENDtnI/9tL90prT07bkOYaCSimOOgEUzzL17pt7AUbQueNEk+B+1kRw==
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 04:43:53 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::ce) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Wed,
 7 May 2025 04:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 04:43:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 21:43:50 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 21:43:40 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, <linux-watchdog@vger.kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, robelin <robelin@nvidia.com>
Subject: [PATCH v8 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Wed, 7 May 2025 12:43:11 +0800
Message-ID: <20250507044311.3751033-4-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507044311.3751033-1-robelin@nvidia.com>
References: <20250507044311.3751033-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e61634-58ec-4ed2-58c4-08dd8d21c4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h0NhpQz6bE0Myt/uQhLggAWamKrbvapBx2DC20uvPUd6MEjfvdzm3/9cGvnj?=
 =?us-ascii?Q?4GmCSqI70j1Rasoma5T4I3PxTQvrqYcZshb6arGQmZat2TjfY8B8jflX2Ht2?=
 =?us-ascii?Q?MoAYpy8aP4IJ5W4eLnMhzqDZNGKfK7prAJlG4/qLs7YtvLlSdK2BuGEjENXW?=
 =?us-ascii?Q?5DVXDpYfqXZujbWqsZgAbBDvNqq+A0QnBi7+qAaxU3/wOtzItEiLfb+P/FHn?=
 =?us-ascii?Q?jSdCJkb62I2xfFNd3FD8eEOSzIE5At2dmWX5RttvwRsTkJwsQuSDFZDcPenn?=
 =?us-ascii?Q?P+pJ9hkL8clDNfb8As5i4EPWh1SLauVpQO6SMqwE809m0w7ZZcOge/JSGBPO?=
 =?us-ascii?Q?teK3WyOQlemKFkgEdMQOkfb3boKLnMwAYgFBzIuIFUQVfV66OqCc0i+52p94?=
 =?us-ascii?Q?x7vSKAzqw7gVsMWEO7chfHyvEyYSYTVorBpmXddCkdRdtEQzvTY+y433Qr8g?=
 =?us-ascii?Q?PMNZh9SuRBbvnPnuzl9HF9R8/mw3M2NGSr3WbAAwadjOuFxv2fIwd2UupH6B?=
 =?us-ascii?Q?mQYk1FFg2x2WjIEnbgS+J8uar0eqst7b6YGtbqAn/fc4HqakOQSSFjm1i47G?=
 =?us-ascii?Q?l0U2NgQjoiIqzrTWih3GipTsNgKtvlB7i6fW+YIHv95h2gBa3Cq+HtwPhGc6?=
 =?us-ascii?Q?MShVxCOdLVOJTcnHJmOVsP+wMYkqP+aiTdYevhR2Bvq9M+N+VF+nVbBAWSOb?=
 =?us-ascii?Q?p7Fr4a9lTif/3WoPTNpGWcEqLRF3/Q0/ut078SfjBH4zUY6gOhqGP2F2urej?=
 =?us-ascii?Q?PMGoVH6fnDbx/DQO0eQP3/wHGELpOjfP86jhCWR4QI1clXoWXg6agHc7FDm5?=
 =?us-ascii?Q?njdXQ7awzedbCzy/ohR/Vzr57OxtjWL1ANur6Ro+ca0vSew+1Ru/P4vEuBdH?=
 =?us-ascii?Q?YOEZcVbIPajGFIbPhn6Gw8x+E2rt9UgCSn7KUXBnH5AwzCd9cMUIKqiKDU/W?=
 =?us-ascii?Q?QjL/If9obmoZWS/hF5o1vI6F0FcWH5DYz4YxRwmcHxPYjeWqLjaC8uCb6yP5?=
 =?us-ascii?Q?5A2sj3K2XfCRk6002OZohkrJghdjEoPMXTeRmQQwyyReCNAPPukAexwoETI1?=
 =?us-ascii?Q?Vjenj7dMgi4Ck51jGVe8SyG1KHGcf4sh9J4vFh7iL+7e5b8zTbzJUmX8ZkMv?=
 =?us-ascii?Q?OLwOmmI4vfsVkrz63yXs1caR52yiktRRI7Z5E3/dkMolhnQ/Lo1VSYm7zxYD?=
 =?us-ascii?Q?A35xp3XsTJUAEugcJD+fgPFTZrsueLxJGpINWqAJTqBETClSIqJzmNviOEed?=
 =?us-ascii?Q?fvkL/A2DDn/2rJw95dkz27Ngq6wDh9NNnFsgs1AWuMyhZ60SNSHTbou6SodZ?=
 =?us-ascii?Q?IKt9TQECG9Mx5EdBNSyNFwjsal53eEyIw9QIxi0sYmT4tDPbDjK9VX0Pbd3K?=
 =?us-ascii?Q?9rGFEpu4ZrPMkqqxlLQe4P1xiXmV0488Xjos6Pg4H2cRAq2k8j0PHqpMH57G?=
 =?us-ascii?Q?8QlIyiqA5AHyNU49WNdvI/DUT0pY0aA+mr3G1sS01uj5Y6lfCd9SlN13nsxW?=
 =?us-ascii?Q?cQjJckLnEfh6Ma6amywaJigEk8yeVzIxiyjC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:43:52.8887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e61634-58ec-4ed2-58c4-08dd8d21c4b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 20685d122b47..940168458122 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,15 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local FIQ and remote interrupt for debug dump */
-		if (0)
-			value |= WDTCR_REMOTE_INT_ENABLE |
-				 WDTCR_LOCAL_FIQ_ENABLE;
-
-		/* enable system debug reset (doesn't properly reboot) */
-		if (0)
-			value |= WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
-
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
-- 
2.34.1


