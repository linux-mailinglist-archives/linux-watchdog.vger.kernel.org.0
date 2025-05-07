Return-Path: <linux-watchdog+bounces-3445-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C75AAD495
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 06:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06BD3B985B
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 04:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9F41DBB0C;
	Wed,  7 May 2025 04:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tuhh4po4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365001D7E5C;
	Wed,  7 May 2025 04:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593042; cv=fail; b=MgopMi3VANLLKMiqzWXx83Zo9f2PdoiB4Nc3jrj4c+SJMVEmJQ3B21evOvXeNtsHDPJag7PRZYi2jwW3Oi49wS77Dr04MqFJ6to4Jp/S9d1CTn8k39x+x+iggE2qSA0OMzu9tCyFLeL5m/5CQpnzIOShZBJVhlTrLtFzlPcqwpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593042; c=relaxed/simple;
	bh=UMo4Y4r4ZzKFwsXGWwiMsFGIPwoqDbjXApxcgVESqyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRF6h94fuCfpq+jgO59r1Ny8uDMQoE0vBP8gJYoIYOoXskOF8vfnDM6vEQ1/GyKmj1uD1zNzusqyaA7DvTFA1wB1Wd4Rs2LRyfFdJvEgOgIdL++MwoItnI2TatxX4843u4ZdAgJfJXyBhecDuAAoFrH3GWbQDa1jWI6HCUAgYHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tuhh4po4; arc=fail smtp.client-ip=40.107.102.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkJryhUF5TbCWcPRp/B8P/LF0zkvexd7vVI29Uo77YzZ8d6fHgLXFXmp4PStrEcsvrqrSGjStQuPxYSEpdiB1xv7lbKprrWgPY1w/NHvkjCirqobD7CQ18L/WN4RKa9mrOt/dByfwrrozT4wvGmV8W3sVCptJdZ9y/fq5mT1R4okcb9RxhgIHakvqfKuIbLUpoxgJsYLbpp3f9XKwY1wU1MzcZTi1TTQ7bFvXY6CsUafD+7LTSCfwcBxf4CC9dV84a2FffGsWItJvMiJ87GWylPvtvVVBojrz9T4FFYUHzNI07nGTekXdM0dqjB1LgSSgsQBtKCbfCI2TBEOAQEJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtH1HctqGusKQVbHpRxzvC6m4xIQzNiC+AjgoB5FGkI=;
 b=dIwjJVWc4BX9Ca9owbWULDUzQe+kBTyN7X093OQf50xgFLgIvAZGNPNMPypCCuQXiPnaNpY+5Fw+g1UxM58j/foO4ted9StRyiknhKxPoexUQvlEtImkn1ZoQ9GSC+VgdjGB36egSP5eTZHxwn++dnci60d22BPAmvwPDRfxopf3QWHKTf5U969v/5JZxuEV3WLuu8EiIoqZraqwY4TA50ZcMgkl39Sgo7Xfn3InAr5qztv5jmXhhp6fuHOcJJf88CM0K0rrE07p5EDZMUKt4xDa0X9+CdLR7rfdi+NpBvehrKcnnajNQbcyRxjH9U7PR37EEyBhSsVKiHHU80RaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtH1HctqGusKQVbHpRxzvC6m4xIQzNiC+AjgoB5FGkI=;
 b=tuhh4po48NR7eUvdrPYw/hKPlqO1GkkknN+RHUmax2tyXjAESATjl4+vGclWPUzRWKhuLHFiTVhLTADzu7HBJvX57F45LWbTERE4oQI1ebEAv5r6dxQrXr+QanZ0OtERWt30NE7KULFdCK3DIvwOlicq9QYah1CvhXqTcNOV8uv96907L2bubP7R0rOTygUNIsT+8/eLE3hxlU6BnMljm82zLVnHUht3nzW45Xa0Av9A2nYvu1ic5TM3WjCtpGGDiLbg1WE5MSJoBumq28v1b2ipMiBeFKmjOUUxZECT5NeztrXtlcWj5ffNF+hTqh7r2cUEUdbNQ+E1qyN6hqW0Zw==
Received: from DS7PR03CA0034.namprd03.prod.outlook.com (2603:10b6:5:3b5::9) by
 MW6PR12MB8949.namprd12.prod.outlook.com (2603:10b6:303:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 04:43:53 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::f1) by DS7PR03CA0034.outlook.office365.com
 (2603:10b6:5:3b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Wed,
 7 May 2025 04:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 04:43:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 21:43:47 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 21:43:37 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, <linux-watchdog@vger.kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, Robert Lin
	<robelin@nvidia.com>
Subject: [PATCH v8 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Wed, 7 May 2025 12:43:10 +0800
Message-ID: <20250507044311.3751033-3-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|MW6PR12MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc2bd0f-be37-40e0-9b5d-08dd8d21c4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XzOqXEuRjQeIlboK5iuuf0JtBQM0k2PZAaxJUUxFUgcNvua/1AGNukMvs4eG?=
 =?us-ascii?Q?Z+eEKlDQuMglTsaHdnGA1ifPyQZoFccU3IDbxDEFTl6tqa5bLcBih4N7FO4s?=
 =?us-ascii?Q?ebQycumzRB0Bu88ShG+VYt+EuLiRR3NpO1PBtMNZ4Wan8WUZAozDo+pShUPl?=
 =?us-ascii?Q?EItsE7j6MIZPiZb6oK+LpcUDYzxrhSH0sNyyzu5w6lxgecDgNJuMaDSdhSIK?=
 =?us-ascii?Q?bvoDabbFI0KxJogFqvrhtnlqoR3kc85ieLnB/z4dxx7lg9stzmbtTy++pE9N?=
 =?us-ascii?Q?jPHPS58hDONHqdSNrpBRe1SxaTbpdptwMoyUTBg7EHC7LNqi0VvL7skzHmFO?=
 =?us-ascii?Q?Ud4NT3Q9c9tdCL3H/2wba8RfrZeeITcilqx2qjWFs4+eDJB+hyp0R7kbN5J5?=
 =?us-ascii?Q?PfeeNoBQR5p3vudh+YkQmYY4NXl5JbypsksGoa4POXO2lqhRQjvZPMQY9Ab3?=
 =?us-ascii?Q?vlenwEvc0C2RmA71wD8QSJVkLgZb0TAPz3FFAwYVCJfbKpqDwzksimi5t0hv?=
 =?us-ascii?Q?CBQJsTnMkMlvcWWUg5PTZwxy7Yz8R3iVm3KKcvdi5GgozOJkgb7TG0jAF0eX?=
 =?us-ascii?Q?K1Wa3H9VmP49pCa3RSdp/YXeLz3GNpQSPoDhd643PjP5Jhy2qWikv00rZ+Au?=
 =?us-ascii?Q?CHWL3+dJMXJvx3ja8JhUHiCNrzeFsKfJHzYzCS5jA8q3F4WNtvnxjujPqMcY?=
 =?us-ascii?Q?4HyhUEwSnoCw/tIXPTsbg745habjwGbNYArnm0fH+ZpMlgXPgsy6tfwH0SIE?=
 =?us-ascii?Q?4yW4jZ3ljrxj9i58unRwqPrZXhJJGstVWetJ2UqVZ+LrSNjweJB4Zqu85z1g?=
 =?us-ascii?Q?ah40XvFIQ3iMsPiQpr+hFNvRM/r/WYfupAKa55P6j7lAcG97FAHtaFQHqMvp?=
 =?us-ascii?Q?M6mRKB9m3sUUz3BMz3emiL//KAT+v3B2p3Bj4mkZrfGzk52h/ILcr4loGIEi?=
 =?us-ascii?Q?Y5T//qUT7t031fAmafuawEdqXNOiYUIGp+3sIl+5hPWwHHiD/yPjpK1pRfIm?=
 =?us-ascii?Q?9PAZ0oeB6cOnk8PbEbbOFdvrcTs7SemhBv54PT0j5T72/or+ks8CSqBTS7/r?=
 =?us-ascii?Q?vsOF/BHaX+KuhW03xilld0zr2RHLDV/Dh/YGfwnMtuVKx4P08qLbo+hQMswu?=
 =?us-ascii?Q?amoW9d6qlRtU09fiwsPKhKj1NHN3WYQ1vqvTxSZyc/c+CnCbVxvaVSAjHP++?=
 =?us-ascii?Q?FjQ4LRBpG4ednTSI/WRuPJ90H8a5jvxHWaJr90+hvcYctOMzFNHD2xkyrMtU?=
 =?us-ascii?Q?Mgqn+YLXiuhxgO3zCMczsZb7JTSwW5GCZzUvv9lVd79PTO7bL8bNRDlklbsV?=
 =?us-ascii?Q?GMtoSc+xb32Msf4LTNo6YZCSU+7SHbFe4oOhr4hV/YXZg8dcFZNuFIulusaB?=
 =?us-ascii?Q?0JmNHldsDoKgEhO+zO1PtePfdfmazumYKy1Wa9olZKyZfoU/5eGHEVrNPhKD?=
 =?us-ascii?Q?o0K2bJo984SqaQboLh28BRxBZX5z2BuBCnGs+WeKsCxakypAwd8BgsZhCSus?=
 =?us-ascii?Q?rUp7MpRV0GO91BxRuzT4p1IUcu5zslW+6F0U?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:43:53.3195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc2bd0f-be37-40e0-9b5d-08dd8d21c4fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8949

From: Pohsun Su <pohsuns@nvidia.com>

This change removes watchdog self-pinging behavior.

The timer irq handler is triggered due to the 1st expiration,
the handler disables and enables watchdog but also implicitly
clears the expiration count so the count can only be 0 or 1.

Since this watchdog supports opened, configured, or pinged by
systemd, We remove this behavior or the watchdog may not bark
when systemd crashes since the 5th expiration never comes.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e3ea6110e6f5..20685d122b47 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,9 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local interrupt for WDT petting */
-		value |= WDTCR_LOCAL_INT_ENABLE;
-
 		/* enable local FIQ and remote interrupt for debug dump */
 		if (0)
 			value |= WDTCR_REMOTE_INT_ENABLE |
@@ -428,23 +425,10 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
 
-static irqreturn_t tegra186_timer_irq(int irq, void *data)
-{
-	struct tegra186_timer *tegra = data;
-
-	if (watchdog_active(&tegra->wdt->base)) {
-		tegra186_wdt_disable(tegra->wdt);
-		tegra186_wdt_enable(tegra->wdt);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static int tegra186_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra186_timer *tegra;
-	unsigned int irq;
 	int err;
 
 	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
@@ -463,8 +447,6 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	irq = err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -491,17 +473,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 		goto unregister_osc;
 	}
 
-	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
-			       "tegra186-timer", tegra);
-	if (err < 0) {
-		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
-		goto unregister_usec;
-	}
-
 	return 0;
 
-unregister_usec:
-	clocksource_unregister(&tegra->usec);
 unregister_osc:
 	clocksource_unregister(&tegra->osc);
 unregister_tsc:
-- 
2.34.1


