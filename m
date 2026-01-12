Return-Path: <linux-watchdog+bounces-4797-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F9D12B19
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 14:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F093307894B
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 13:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFA3358D1A;
	Mon, 12 Jan 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="H0YIwPNC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61D358D00;
	Mon, 12 Jan 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223345; cv=fail; b=FPJEifniI4BYOCinofeQvUKBwjFFF3jxj5IIUGdR1xs1P9SgZtK4LubeCeoQJV5jnxiSObTJKW/PS+aDpIvhrK53WfZxBpMRYbbVYu1DUCWLvObK+Us6dCaoUabX4Pb/LN/iRKg+rfmh+9KdSRq2JclS2XGCU77Z3aYeX80xBX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223345; c=relaxed/simple;
	bh=nVrm846pIWwu8ZPCG4QtnUTwFjvIdj1VkmJsmdjTGKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQivvA3pdveu7HI3huDUfi9CAAH4MIOCnZYOp5O7HapJGkyC2paDyZADg+whqn/nL9AOcuWfeXGNbEAjzqE34GBMvOBSUPbbCLbUCwhjMnfSFKAtoaZ1cm/EaoyqHh4H2xerVkd9a4aB2JFDGXErJQ79knD3t4ilv/mEPdX0rpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=H0YIwPNC; arc=fail smtp.client-ip=52.101.61.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaJJP+tad1StwSp3H6KllR8ehTYjejtaFufHFmVeK5gQIVFkIIJe0e1XIcQKrGr0Z/N/wlYldA2Kg5sRRJQK3O6LfsXYaewMlfJY3fLwZL0IfzkC9pdkud5LVIvnHWyS/DV1HSvlG4wxGJjXuOfVk3YuotEoZ9sToYzC6fKu4jedLqCBFw6W9aMozXgV12UVuqNpkqSnavLk815YwkhYcjM3RMG2cAJQlfpXcKDoc8z5LIk8euLP8oL04LU/nV2xzQAbwkDwwcSaYRlNd/gX9F5ViaqBKUsgeGuZ7eT/aEOIcj7CsoPos99VebwkVmw68rwCcg32v73Zd8fVl6xGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=A7v8N6VCfdta1U8yH87IYFvHWkVWWNjBLVhepIdaB2zin6L83iCLRj7mlH5GJOGKnL41Z9/IMdqIa1F72ln13FF4+C5QV8/Wfo+vLBJXxURsftsK9mQf78taCL6wqVT579upOZcB/KIJMlB9Jeib2FvimpyUbFOM1HlQbLeAOuPcvswOk7QbOcLitoQKbFpI9ItmFMymCNcMT4N8+wQdrU/qEj+6M/9iUN8oKtDj+3IA11IrYxl6hKZnHj/2DU7DFzC1ST0t/UP/ocNeq7pCSLYd++YEl7gYvEcfgUzvEgszxo3G2JrCigz37hPEh9qidcsxkMn7mdEBAsO/RcZQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=H0YIwPNCYbfIfBFJxNBOXqoq8rW6zdReA0a7Sdi+YA9BrHAm2Uk3GZ2xj6/iBn83iv8tNDkbt4ZlPw/pC5komv9lVUMHJDMfmxLkQmZDC9QX0Gt3/tZU7vMAjve32BPrem1B5pDzSSWhChvFQk+6RMemTaM26bsJtaLDkb6WYYVGyqWCIpgaHoN3RJn0JD2mizYMZYgbOR14tCN9AWG6vZ2/chdeLGh/bBNNy41lfTu7c8dbwp6LwyceY6XeibNuEfZ3EQyUl6l16eV/yMnoLf9IoLayn0ssdZ4BclQsk9tpjgYFm2Q8GTCVnpMDbLh8J60cvWsBrasDwo6gKCHoAQ==
Received: from BN9P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::33)
 by BY1PR22MB5489.namprd22.prod.outlook.com (2603:10b6:a03:4b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:58 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::71) by BN9P220CA0028.outlook.office365.com
 (2603:10b6:408:13e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:57 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D4AC9F2E71;
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
Subject: [PATCH v2 2/2] watchdog: imx2_wdt: Allow to continue in low power mode
Date: Mon, 12 Jan 2026 15:08:49 +0200
Message-Id: <20260112130849.3748465-3-nandor.han@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|BY1PR22MB5489:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 69e709d3-e779-44d3-2e76-08de51dbbf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gNWG5TofsqO8v1O+d6xc+lFLbUfkBWZxmzdgpjA5FL0E4HoR3qE4fqE4+AO8?=
 =?us-ascii?Q?U7nRmHSPRbuTR6J+A5VYNRVLt88JKVq7+229uPePIpUc3n+1jgTxvYce823r?=
 =?us-ascii?Q?ezSiQBYpkhyNaaqCBdnohxbumXT5gpMAKYwfXSKzlIbNlJwfTFqFCgSNOG3U?=
 =?us-ascii?Q?/VKt2e/fDhhaY9u7WYz7zEPszCe//zo6/xnNbasrRDWGCp3nVm8T6AXwd0Yz?=
 =?us-ascii?Q?xzzFCj/AcM3NXu8u8QYy1fA5Pmc0BMXeOoCFCmxHK2ddFdXK3RQcO+fyKd9O?=
 =?us-ascii?Q?FfHXRqqZV14DewdvUg5sURQrWUKVr3bNqSbIkDPrsRlv96QqYssHyGjtRzLG?=
 =?us-ascii?Q?2NJQsV7CTHLo17c46lrMY8141bIookrfWVelUb9o4w6e9oBLTzN9eSw85GSc?=
 =?us-ascii?Q?tIUp50qLZY/TvamCKV358HI8dP3gDkFTGp7upiXz36ozZo3BKn5LBaYVUUHG?=
 =?us-ascii?Q?sTQg2ovCgrxJLq8HzlKstugYnG4vM8wIc6s8xU5hEDTa/s6uH+5FNWOlN4ec?=
 =?us-ascii?Q?VzZHyqcSUE9rqbqN2DBGHaruNvAt97jomrxl4Z3gwOV4saHzlAPE+8i/IKYa?=
 =?us-ascii?Q?D4FPTmMOpMObb/WEWFNzw2rTyH5JdUm6vPzEetr5efeRZTPr6pZnbrHxUabI?=
 =?us-ascii?Q?v7yMdtBvnfymD2rOzVOG0xhdvJKKKwkuCXj92h5KzLRJOYvQTytjjlVMkY7Z?=
 =?us-ascii?Q?/AF7oA9r9NjuuAfZ6/l0ktIMZihD269UCVZQghGWhtMRQ5Na2fjpo5BziltI?=
 =?us-ascii?Q?blaRUnVEmsIovODd662DIGOFXNKZkQPb1b+mSsPcP5OpyUpajgy9VdZ52FDB?=
 =?us-ascii?Q?WmbpCx4vcFsTj+G9VfKmZlx+SFMBQHseevVZYusoAiLrsW2sxHap4gVojxsY?=
 =?us-ascii?Q?I5N5fQT3skwNZfm5iLYxWLcRb+9v4iwf41pnc1RLFk+cOKs6F+aYrkOAaTcs?=
 =?us-ascii?Q?2FvpC7RXXo9HXWOxjXJX2QqPWiu42+7z5f8n1sv0FUfj0G5c0b103jrKXnYa?=
 =?us-ascii?Q?4XwAbWwXt3SXU6f1Qi8giXjIxYgeFJtFRHpl1TBxuZ165adk1a0YWAzsPs0p?=
 =?us-ascii?Q?S8j8iv9cMb/S+YIm1aOSM83j2hANqTtbVz75djtsHsknBv6aDRBx4m7ke+bI?=
 =?us-ascii?Q?e+ZuCr+ux6wGE1Ay8jyHazTmWMq+EzWfFenVsArEbSJdx5pBeWu3+T+HDL5q?=
 =?us-ascii?Q?94VfoXVn9sw1dv5M6K8AfRy7aoBySz5JnToUqyovHBsX2rh4MnQ8PvlpnR2h?=
 =?us-ascii?Q?q9HHXj8fBY80H1YmEcOVlFcNuoTHzV81TTBuF4Zp/awo+7EuMS73y7lT8bLG?=
 =?us-ascii?Q?C81SnTxBkUoLd3SzRsdf4M8bmBtnCn/LR3v6kQFh+AIBLBbHjlZzMK5yInoO?=
 =?us-ascii?Q?NHdOyFNrVp4o50nlWJI+fsP8O96vgjehmBCq6Y+N5AtjMZBVZWTER+lLV1FH?=
 =?us-ascii?Q?dw0CHl+0wH5U4IlQ0ijCIHTREN78331fsYPum7/QwULeOyHZ8OBeILo7vf8c?=
 =?us-ascii?Q?MJu+ImYfLv60mXN2NacumieVyHEEF77D7bjrUeVCLKueODSLWusUbRlofDJt?=
 =?us-ascii?Q?x6aufTDXfZ7RPhIEwJg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:57.9583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e709d3-e779-44d3-2e76-08de51dbbf4f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB5489

By default, the driver suspends the watchdog in low power modes (STOP
and DOZE). In some situations this is not desired.

Add the possibility to configure the continuation of the watchdog timer
in the above mentioned low power modes.

Note:
Please be advised that the difference between the variable name and the
device tree option has been intentionally selected to uphold the
prevailing driver functionality. This ensures that the watchdog remains
suspended by default in low power mode, while also facilitating a clear
and intelligible device tree option name.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 drivers/watchdog/imx2_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 4b3a192ee3e8..6e837cfc3c5a 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -71,6 +71,7 @@ struct imx2_wdt_device {
 	struct watchdog_device wdog;
 	const struct imx2_wdt_data *data;
 	bool ext_reset;
+	bool wdt_suspend_in_low_power;
 	bool clk_is_on;
 	bool no_ping;
 	bool sleep_wait;
@@ -135,7 +136,8 @@ static inline void imx2_wdt_setup(struct watchdog_device *wdog)
 	regmap_read(wdev->regmap, IMX2_WDT_WCR, &val);
 
 	/* Suspend timer in low power mode, write once-only */
-	val |= IMX2_WDT_WCR_WDZST;
+	if (wdev->wdt_suspend_in_low_power)
+		val |= IMX2_WDT_WCR_WDZST;
 	/* Suspend timer in low power WAIT mode, write once-only */
 	if (wdev->sleep_wait)
 		val |= IMX2_WDT_WCR_WDW;
@@ -326,6 +328,9 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	wdev->ext_reset = of_property_read_bool(dev->of_node,
 						"fsl,ext-reset-output");
 
+	wdev->wdt_suspend_in_low_power = !of_property_read_bool(dev->of_node,
+						"fsl,wdt-continue-in-low-power");
+
 	if (of_property_read_bool(dev->of_node, "fsl,suspend-in-wait")) {
 		if (!wdev->data->wdw_supported) {
 			dev_err(dev, "suspend-in-wait not supported\n");
-- 
2.39.5


