Return-Path: <linux-watchdog+bounces-4798-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA966D12B1C
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 14:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6091D301F267
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50210358D2A;
	Mon, 12 Jan 2026 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Pl78TWWt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78443587DE;
	Mon, 12 Jan 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223346; cv=fail; b=G4MGQbQiSd09DRGcvwe63uXoaCoQhqjUyO43f1uHiGl20EGVLA4DWjz8pNgGSyN/RqlpQgHHENvD0K9xTUs311V8eKm1fgjuBsLYhfsDHA2gM5ZsLEVcswEbu4EGXkTLsjAj3Q5TME8DWqLVC0gvcp35YFq18ogluod7zHm2r8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223346; c=relaxed/simple;
	bh=6ilqO8WzrwxgcSRRgxQibGOOKms6pZyXJ/QYcExUim4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NC5KYHV0IvWfe437IQswrOKnHWN2STQ/p8YCiwckXEdSlyLa8vVnXXteGi+7Pval5BLLPKIRlkAv/ysJk8EQdvOTLULhRd/0xCueXy677omrOGVq9PiKXa7TiwDZq+W21Qt1SJFCzO266Dtq94zXovLJiXeqAlNNv+R6TcYFWvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Pl78TWWt; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYeyh8U8Bwa4jV64Kd1kwqXsLPeLTJjAKm4rydEE1EmMEPG2dssXSXowRCcuN/XOtJWTbVNcrvdt3y3MhEghOj3+grJO7YTjqTUK7qL+zo3YUMoWZGps6lBf7JNyqzvCJF7sCKey67DwTsrMQkSBvqCkEUJ1NPnTAKrB7qVk75M7kEo2QsGBbkiiGt+9fy2GmawXY308h8rX69Ho+G72sWWipSxQaxxqxe3VmQP6qq5LPUs7H+ijryLB7rAOkLcPvY27e6ur0Xb5gx+zLvKASTY8OfG7AI4f2TF5eGQpAr2B9gAOU/w2QWqYHhXYVNpV/fZRJqF9Oay+aM6uhcqRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=;
 b=AKLYRjxAtccZcAPOBjsKJno4O+Ds1r05fXcRkKxG01g/WPiLQyGWI3x1nBvpi8pG1oTbFpL3LhmKirqyv4yweUQ5R5NdNzteLtttTa4fF7peb5WK3Ct7xyqybGGq2X4COt8Ff7PhuWnHhLJ9cEdTxztdtnZ0x/vJGVJnBjmKZ0TCWg1qNNbFMw513Vk5qGJY4pfwAx2robOIGe32ffiPAjVCiyg6riPWlPxO+0EmI1S+TzCu63McDuoRTMKUNUmHLeKvc+Xn6UKpB+uBT74fbZGRGqXwhnU3W8yjDQkKKjc6vje6ysyg0yGq2H9qMWJJMNhc3uqL6uUrNFAnXw56Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=;
 b=Pl78TWWtpJvrhKT682dBGI6uF6ueTgSK/+13O0MfKe+ZhAoMReMyrwoerZiCLW3/sWDg9G03UnKkt78wdzLnEjS53wixI5ezb6cUXUC1GJOR7GqoJ+Nh7a82hxB2lyeIm5urPCswwqTprJ0zabmprNp0D69IeTxZ2vyDiM2IxUCBmTrVwbZz0H/oBxK9LujQv4AaEV81QnjrWIzJ1xT0NzFsXJLBStQEjLCusIqXedPF4gT/H9VxdLVMtkEPo8bOctv91H8A5TMy+c9OOKFtUalYrHv+iZh/T2OOXVkGchIt1X2X1ovUIppLoveLjMzyBDXLNS4M3xlaXaQ+/efUDQ==
Received: from CY8PR12CA0030.namprd12.prod.outlook.com (2603:10b6:930:49::8)
 by PH3PPF880B0D3DF.namprd22.prod.outlook.com (2603:10b6:518:1::6bb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:58 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::f2) by CY8PR12CA0030.outlook.office365.com
 (2603:10b6:930:49::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:58 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id C8BD3F2E6C;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] watchdog: imx2_wdt: Allow to run in low power mode
Date: Mon, 12 Jan 2026 15:08:47 +0200
Message-Id: <20260112130849.3748465-1-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH3PPF880B0D3DF:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12ff7b70-fda4-46ec-bf48-08de51dbbf69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IgQK+2s7i0JnKbTCjKSSv1D0DnYJ5nGiexo8QumUnSxE9XtekbIgwHBKROjG?=
 =?us-ascii?Q?XCQCSJz78PkPh4FCgE5t8ynTxmzGXLT47XgpIr1mU2NehcIurPauGDBNHobu?=
 =?us-ascii?Q?0bezGDSUp64AWSB1mNr4SsGki3e5VGfmibzKuUuZ1lDgQEIWrZoD0rmmNN+n?=
 =?us-ascii?Q?OUPvfIpereC7kxE7wsXgMgH6yHfE/DciE4ZvbxfCF+5E3gA7A2WWIHFJnQeX?=
 =?us-ascii?Q?cf9h/9znC8ETBs0xt4BT1JUV5XpcwIneeqKV98c40a08VVaGOdnYcMqcHtjD?=
 =?us-ascii?Q?QUx2BOZ1hDVvVOb9SerstrsEV1ef7WmX4mNCslOlnt110moiyUUpqobZVRVD?=
 =?us-ascii?Q?oPe15k5WEIUf3yJ4ToQQKEXVoRUo1LtgmV9QN7uSWwRn1Opjjb2Bp3RZN2cB?=
 =?us-ascii?Q?V5REO4F/Lo4WDpSmrO5FzVPGpPHk/bviX0i6VpV5TZirEnePGL80jGqya2IH?=
 =?us-ascii?Q?7Bhpm7jyi8A45XN9yUlYx3UB8MhK52zzuHX+yWBR3gScILiG7pXitDx8oDUR?=
 =?us-ascii?Q?szLn8gcKm2jol7+BCVlypULfTXCDVh+QZcsmbT249XEuOPT5saVxO51sscqi?=
 =?us-ascii?Q?jRnc+u6hOJC7xqXOL2S5UY/Ww4jvGo/U7ronMhZBJzqTAdfj2/JdG3Hk7Kg4?=
 =?us-ascii?Q?KF046d/9aFMWZJwY4ypJkVM/BbAL+ztDdg37k/IhoXCQiRC/NwiDkWXITjJR?=
 =?us-ascii?Q?CYyzWbUG458NmMdtFhL6r7t2DbBQiHdsf9hVU2Fw1DePJ0CN21U5vPNziqUr?=
 =?us-ascii?Q?VEyjCLsmh0C3NJUgEMok512N6clhdi/85Ea+rV+Zm6JtB6/SRix5XQsc6Qi6?=
 =?us-ascii?Q?GLxKc67TrziyIhhPXrWs26917EwFyw4NTZKNkE38WZpCEUbRYFUwmHL6FixV?=
 =?us-ascii?Q?CJSVqjl/ywdDkvQGpM64oqm41mmZQDArB8C5FSyPPZbR99nsG7GHYhGWUjpW?=
 =?us-ascii?Q?UdgHLi+yTWNaot6o2Ubv8a2jUkvKtZI6OiOMgl81XMewzVX+tbGgogIqVscu?=
 =?us-ascii?Q?PX28GhjpVcEvOW31tAfcD3hNJX/hVz3hiFT1UWPBmAVaFEFUwjSOZKJSpwqM?=
 =?us-ascii?Q?vbZnbjJvyWmLUTA2QKVt9wvSn4Mt/CgBZyhP8U7/JWmbI6iJvsvPphK/i0Ly?=
 =?us-ascii?Q?UXogotDhm9ljkA43XXTbcAyLHsWnDA46QJrOzhV2VIV4eOuNhsZLTeVsFcT+?=
 =?us-ascii?Q?Ok22eNkstrGiMOQ3tqNbFbBLurX/jm+BbTgAMkeiAYU8lYYMMgV92rFoivRa?=
 =?us-ascii?Q?GJPPSJejCfZJXKyLLpBpMae2DeUEbOxTx4Z43EtvqtBAHTX9NFks45NsPNbP?=
 =?us-ascii?Q?wec49RpTHsVMbhKzKFLNY5kk5J74i8cugZvZvyYd79WEad0fb5mkwzkyy+5u?=
 =?us-ascii?Q?r9VmThLgB+LlhVJz0VmZvJSZFq0Q/sK+mQAHUqZkWAJPpIbcBdEI3wpSAjRg?=
 =?us-ascii?Q?vle4dWSceqa6XIbuJDQOimsQMRjWcgM5iSpbPx6473pFaRNq5vnnbzfmuNTN?=
 =?us-ascii?Q?F0j/pqprktzQJR3lbpYqyafFA98mga/g2ytjGCdI4CXvQgirUHVkj1R+zuFi?=
 =?us-ascii?Q?ChshfKm98soFaskW9FA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:58.1304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ff7b70-fda4-46ec-bf48-08de51dbbf69
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF880B0D3DF

Description
-----------
Add the possibility for the user to allow the configuration of watchdog
in low power mode.

Testing
-------
It was verified on a i.MX7D based system that once enabled the watchdog
will reset the device when the system enter in low power mode.


Changes in V2:
-------------
- Order the dt-bindings commit before using it.
- Small documentation update.


Nandor Han (2):
  dt-bindings: watchdog: fsl-imx: document continue in low power mode
  watchdog: imx2_wdt: Allow to continue in low power mode

 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 6 ++++++
 drivers/watchdog/imx2_wdt.c                                | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.5


