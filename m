Return-Path: <linux-watchdog+bounces-3442-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD947AAD48E
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 06:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D741637BC
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 04:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB161D6DB5;
	Wed,  7 May 2025 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BYwoS1a+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816DB78C9C;
	Wed,  7 May 2025 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593034; cv=fail; b=CffxBAQBR6+7DvHCTV9dAI6cBQdWuqsMjMLl9WCRQcamtDM8sq9gnora/TIULmE4gx2f+gF4QKDqwPNCB1PcGsNNISSINd9CyD8kwfJQZAgFztmuUjMLpF+v2/1vZh5BOuRMRRezMq9zFJ5agcRlL3GS8UjQkETfpMEDOfhDza0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593034; c=relaxed/simple;
	bh=54riDDuwwmDz2UFHRpGNoT64RGGqY2jc5dRI+jibQ04=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vg+r8Elq2lCP1PBYZNyq8q6RHNJQICJG413wZjHTEwxGtumBUDVt6MI69OZ9yHRsUNNMKc1QX4MZP89MubLmgpjCQ4qJ3YSzTOx7JwuMprtDLvsxzARW9RZv8sj7KrWizDS6mxTjWT+XGM+2ETZQLjfnauqp+p3bXp36l9T/U9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BYwoS1a+; arc=fail smtp.client-ip=40.107.244.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSC4kMRZ97W41JCNAKAxqPO3IrtUhzM32Tcd8JOKhso6c6X2QIAwOzqXkN4w1S3RldL+w5lmFlU1CFeADNfukyZ8ZU+57MhN3xA+9m60cAoocokRwltFrfII5aKA4qCqanwRFVbTtYD6qC5xMQulGR1sWpCvREUrgJBY8pksNFz4UWUy2V46zGEeWOBS/zviBFGz32AMLjzKA+saDBd60LyRIEsysrAj/+sNdDhJAnXvoiEl0jAos+mv0a35sf/Ii8VGPMMncNfXir+/CvkHi0fCYMvtRE5Hh7Mprtr6ktOPalUSlCM/sXJ/j8dH/hfSob5YWmksuiQ67rHJ+nqTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVRJREJZPYZzgsL3NWismhJ+iWEkv5S5b4Cekm0N/vc=;
 b=qV9IJmftvAkFWKJkU+FqrgFWR/bmt+eZEDwf4Rh0Zt37ZR7laMJk1M+731p1DegK/vQMTpF2JAqRiLZbtu3z8bdHcnwVkaKLZFperKqG2Ua7W839N8NHEfoBUfowblxEqdcWSlfqNSQjHByNBY5B5H6R4sIbXce8cgzULDd1I6Yl+3Si85TWDjH6wk6gC2hMHa6oS69dUeoLXmQtpwUin8sYQXRtAHpcqVpJmzwBOukZ/rTzxhOAbzhmppvFjnVqJIsIql053aIXLJPTIl21dD7+w562m2aPIP6ts5w/WUsiR8LTjsuvyHn9+qZ5lgzysxlGiMMbQsKsT1DfTdYp1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVRJREJZPYZzgsL3NWismhJ+iWEkv5S5b4Cekm0N/vc=;
 b=BYwoS1a+X4Q9lhXugz4a/qU8BUMqA0Wr6R7zmHwRI1fV7xxvJlrm1Q9kC4alp7M+I4SAo5SMUNqUT61t66e0EYOGIKg03XmMZ3enExZh0GKjHegjq5pvJSRAEvUSycadZmgIjVfqzrGmnclqxfKC+FlaAy2kYs3gxFNUCSxVNfVYfC6lOsjj3vp376I82JDJDNfSapyQscTj111watrVqXtOKBiCyqQhNNXb03JnpDll5/v0P/4M7ObzUFJkN/94i1VWuUiz4jks8TYRZF0lWLt9eLWN13UtuAEg8U0833MSA3/gh7q+EZsWk/eWgxHPSh7fimBFoGgV6z2hJUzyaA==
Received: from DS7PR05CA0061.namprd05.prod.outlook.com (2603:10b6:8:57::15) by
 CYYPR12MB8890.namprd12.prod.outlook.com (2603:10b6:930:c7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Wed, 7 May 2025 04:43:45 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::2c) by DS7PR05CA0061.outlook.office365.com
 (2603:10b6:8:57::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Wed,
 7 May 2025 04:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 04:43:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 21:43:39 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 21:43:29 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, <linux-watchdog@vger.kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, robelin <robelin@nvidia.com>
Subject: [PATCH v8 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Wed, 7 May 2025 12:43:08 +0800
Message-ID: <20250507044311.3751033-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|CYYPR12MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: c29f3cd2-d0d8-40a0-8a82-08dd8d21c036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cckRCWyknU+d7mokEaoIzczXVP5sIVfuq4/M2mkqYBA4+xGHBF04vLJdyPzu?=
 =?us-ascii?Q?OzMvDYEFqa449oHpVulRkcKpBxGpcjcmJR2D7zN+9EpSzGx3TJ1gSf2OlelL?=
 =?us-ascii?Q?iVAbb3uksp2yWS8gHaU0qzgyZHIm+SPQg6C1jjkmaTrXFcafRP3tjzRIr/mY?=
 =?us-ascii?Q?u9dfqBRcr3KaKPnfmOOWn7i0YdcSMmiffMFUJycbP0/4iDrZRZy58z3tSdVN?=
 =?us-ascii?Q?Ean2bDRJhV3NNcpHX3NTH1kXTIi5lvq5+1RMKgQdLvrn28GL5x0H37T6e2rT?=
 =?us-ascii?Q?IjswuiLluYzlyZtDs/DqPxXAdWBjLyb4G0SAdy1wG1sPUmAEnx5LULgdH3WR?=
 =?us-ascii?Q?AFcecyh8M96/HhnG8DrruX0PVL673x8CxHVBN5OMLQA/ikmY43Lel5ZcaCyO?=
 =?us-ascii?Q?YhGl+NNe+ssWcuXXQWpuyZm93WuyObwi+ZeerQoDEhA/BDm3RH8QPwCSj/Xq?=
 =?us-ascii?Q?6rGCYYgS4Dt6Wvj1iRMkc78+KPWci7XMc7FsikTDROazz3hZbpiCSBGYe/Tl?=
 =?us-ascii?Q?kxEEaep2lMPnSFkjJ98dSiGKZ/i6weDqnbIr81JoZGkuYe3Qi4fpjNnBTZpU?=
 =?us-ascii?Q?K2V/90KG+lSLPkQGjuCbbPRzkS5F+wob/V8zTfxhMWo6bw3pqWnqzeeHKB2G?=
 =?us-ascii?Q?Amg9oTzZa+6DYkUKjfEfwwrlBkQfNIC31Wm8ba+3lUvA2Xkeey7ooXR4q0By?=
 =?us-ascii?Q?lFo390WdpQmp36qeFMR0o3ZbsMBhTMeHCeev3jfKu096MT5MOwoBonQjwgtR?=
 =?us-ascii?Q?b7dmm24S8ZOINtrA9RcqgSAl6fxoRG99SoOUh94u+fkOj+snciZfVl6dcZJq?=
 =?us-ascii?Q?/Z3kxZriI3qWAXerRk0AWYXt+3oeprKtO08aHroR0cGFieVmvvlDkeBy9gEA?=
 =?us-ascii?Q?qGE+8HswVf1hWDSk7LGdwDCBoFNSlNHxPN06HTlEnEapfA/0zbEcX1jLptnJ?=
 =?us-ascii?Q?NbAverZ532jwAE0z5wleiTvWzEBvp6oHVPH1Gm8Cd8fnozFkxhVpe0kBQPpX?=
 =?us-ascii?Q?2iWv/GDgWRTy9zta0C6yvlnhSwzpOhGz56/3pcsb2j90aL7Gef7GtFYPJhae?=
 =?us-ascii?Q?Z7ut0s+G/XdhpDXxMRUSK9lYlGv5WoacQKVrkYjQFXls7H5k1iHUwzc3cLkI?=
 =?us-ascii?Q?T9R8ArKwrY6264GP9/3AxlwNSBlhJV+X9KxLEmmLm6recnupoVoazBYtVtrt?=
 =?us-ascii?Q?GRLgG4CUmzHtdIW4urRPi/cpm9yP4V/fKMsNZIKg/eJvu6+9eH/pCKqab3q4?=
 =?us-ascii?Q?aHZjqY+YUEQQeWnFSPcN//2kew68EJDKZeS9La5qEymXlXFl8yH4uXi4BIrc?=
 =?us-ascii?Q?MU735L4E8DOF9Ra5NGBHdK29tMnoQbjY/kr1+AFaKAw6PJuYE2+U8E3SR1s2?=
 =?us-ascii?Q?styX9OiF/EY3frM68Z6NXMpGKe+lT1Pupt5V2In7GXyfflztlFlw1ui9XHVu?=
 =?us-ascii?Q?phOM1klJ7ld9bl4C8NZXIOv3Iel+fdxOQ1WHz4FWZJYgJaJfEDwoakF/q04E?=
 =?us-ascii?Q?Nn1zulQpLkrPD3AyFraXmI1GopRmQe0A69AC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:43:45.3251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f3cd2-d0d8-40a0-8a82-08dd8d21c036
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8890

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V8:
- Change WARN_ON() to WARN_ON_ONCE() to not spew too many message
- Use pre-exist DIV_ROUND_CLOSEST_ULL for the same math operation

V7:
- Fix formatting
- Consider overflow and warn if happens

V6:
- Fix timeleft value addition using unmatched time unit
- Use u64 type to maintain the microseconds value in case of overflow

V5:
- Print warning message if get unexpected value from the register

V4:
- Improve the precision of timeleft value
- Fix the unused variable warning

V3:
- Improve comment description
- Refactor to fit codeline within 80 columns
- Remove unused if(0) blocks


V2:
- Fix a compilation error, a warning and updates copyright
--


Pohsun Su (2):
  clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
  clocksource/drivers/timer-tegra186: fix watchdog self-pinging

robelin (1):
  clocksource/drivers/timer-tegra186: Remove unused bits

 drivers/clocksource/timer-tegra186.c | 100 +++++++++++++++++----------
 1 file changed, 63 insertions(+), 37 deletions(-)

-- 
2.34.1


