Return-Path: <linux-watchdog+bounces-4743-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 055DBCE71F5
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 15:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4021930141D9
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 14:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E41A329E5B;
	Mon, 29 Dec 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="IGJ2pnmp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936C329C6A;
	Mon, 29 Dec 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019813; cv=fail; b=W0TaxHSFxKTSDmQqrFqEBtE+SArBz/O9Nr2o1/ZDPAFFkbG+kv2UmUsKMS8p6CIeETjwfhI7OvQkomnUu056F04f+UCmEwjBzA2O2KEJfN1lnLZcModcn/HTQh1+bn+7jXpxmEs7z+3R+hG3S6yVDon9vv+TS+gLwVbVZBge7dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019813; c=relaxed/simple;
	bh=nVrm846pIWwu8ZPCG4QtnUTwFjvIdj1VkmJsmdjTGKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjkPAvfkhOL0ohT/ISEcvl+UvoRLOkOtrlnPYI1ya0HprGedatFAhje+qiuRgs9YuXNbQ8AVcS4cs06ERmH1E+UERDS/PrCSp6kCJGVzc02Rlt0S7CmQcPIob2ImLBraSUQVq6TfMPg2Qi4P5464V9OiIxlvzMNKwwy5QVRuuN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=IGJ2pnmp; arc=fail smtp.client-ip=40.107.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX8/stty6FBcrZuK8ridPpEi9GnY/zGDhuRswMA7G+B55Cue69ZkFpvgGk7zNlyLD7Amg98UNMbuFMKctm2RGyyZ4zmZse8wHlD1hFtyOBe85ccPiKqHKfInX68qE4nyPOy/GAHoLCGYJMsHF72yMXPr4wKS0XJVCplE413cLFFDQtct2CQprEi8ZTQmuidP/z3POdZUd6x8jswKMVWLPB9v3aC6V29YMWYK1OoMhzaPHU6YIzECi2E6+dj2P0mQcTj+K09u8SrMX198RRF/GTAwTGRYSihSZUIqAwD7aVZGHv3+gRGoiI6nOezGkJQQZZLE5Vg2YuHoR5D9/5bCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=K9JenpNqHrr2AorcsW4+Kt7I+g/P7cJFw8jeJxcIZc+fWCHuRte00EP3hcHm4tj12qvYuww3SbJV8P45xRL6wZxJahA4A/RNsUBBzKoP9XzqiVfXF9BsXRpjYqFQaKaLAYCcJYES6BV7sKspVnrHUOluvNx3O6ihsIpHEmeQWCDzNJUa1ZogrXbPqcc8EdYPdH7M7nJYNKSlE9i4/GMaoUgDF/XuCMyIfjhWf5i/DvmqoEeeB59ls8ls+vE/H4m7EpI3oLIlWapygu3PMvKcy4zJyP3FyMbaoUQ5DmFVo/3Yx/Q1qQLbiy37OWkUvo4sC9tC42YRPefrmlBWX3nr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=IGJ2pnmppP7NHoTcNmCZrcySHzlDYkOzGXmepVEGoOEnIlRFnGu7PAcSjef+ORc58BvY/1hF1IJa0OYPhcY0mdL/fuH/5HK3fKRHSe3KQ5TAu4gddo73mMvqKuzQRQo/GlKW6VhLhpqjn1vsM6WSwwCljfVnVA+YqN7JFTxppiqEYizDYrMhhyid6sRcs51atCgpF1F65JUQ9o6ZJHJvaPZM3EWjOIfSSeSAV8MQXpIAyJ9WZ70qxZuCJHUIKo468ftmuVAG9kdl6aDqq7QMpGGmObN1R9I+gASr1i+qG0LKnuXEoNOIrUv6DrOMjZCUNPaOVWHkj/i3Do0EWp5f2Q==
Received: from CH2PR20CA0012.namprd20.prod.outlook.com (2603:10b6:610:58::22)
 by MW4PR22MB3085.namprd22.prod.outlook.com (2603:10b6:303:169::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::97) by CH2PR20CA0012.outlook.office365.com
 (2603:10b6:610:58::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:06 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id E5540E8F49;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
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
Subject: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power mode
Date: Mon, 29 Dec 2025 16:49:59 +0200
Message-Id: <20251229145000.421426-2-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251229145000.421426-1-nandor.han@gehealthcare.com>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|MW4PR22MB3085:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9f1207df-c056-4572-3f52-08de46e98ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3csV+oAP4jbTTp/1tlcOSCS1K1lgxhAGy74pl8QN2VVV+YsdE9JMwOFXru7v?=
 =?us-ascii?Q?RiWk8Jy+b614Jxnv+GfyN+eM15lDC0R3jvo+3nIDlpO4PLa2tbueuXJaU1RT?=
 =?us-ascii?Q?1LUeqmUYZ5KuErOqKjSt7QyEnQhhZU9hE5st8WGA0HJVDwzfGpqeqpWN/qJK?=
 =?us-ascii?Q?25oLIhgSAmslLyxNtQ62cgna54hcYqBlzr4m6oIhAR6Djac2nQJZBy8Z7M6K?=
 =?us-ascii?Q?O1GkqvWSRuCJ11r/9OREgmPLXrM1w/ab8Fv528L9IxXf4foU3f0oICEfS8zh?=
 =?us-ascii?Q?aE8Q7jYxyRCA+rWkvg6s+UlDyw2TljOvh9AEvjBAZwh31t/Yo0yUfmaNlqUm?=
 =?us-ascii?Q?tfPRPmwAOBfTZeAsTxkmLzOoSrqwbtmehQu3eSF1I9SwuDk/UlQOLiPSVZyO?=
 =?us-ascii?Q?Pvdm5LtrUtwcWV+/qIuHRvC0iVpkmdMWyMY4Y3dzs47LMPYEHG6XducT749b?=
 =?us-ascii?Q?ZbCoYHmnJeu97/VW35+4EQMISvzAElUNDzVuQCNmSM+4MQG/3ie0OoWhdCyO?=
 =?us-ascii?Q?RG0tJLAHoFXRkRr4eW/aV0D6H7YM5q9eOUFDqLtFnueIUhRqW05Rb29p98Nf?=
 =?us-ascii?Q?kw06ApYjqGf9hdZj+YWwnd4G7Nt9xexz6T5So4q/KYQvK5oYtnmdPcm3svgb?=
 =?us-ascii?Q?1iP9Rx6P8qfbaoxsdvxQXTrgkO7maEqp/2fflF+994BuMXzszgK1ewMuLPpg?=
 =?us-ascii?Q?F4zoi/t7+zsx4RawwsFWZkr03/1YWeErrniwr/yIMRl3q0Q8n7Tdm2ujJ5k4?=
 =?us-ascii?Q?jo4usbjwVfehc7rIYLjPbQBRk9vmmtWPs76ZqlsctX+JC4j8Omh7lsn1vDdL?=
 =?us-ascii?Q?lGa1ngC+2al+QpxnWy6Lf+L2OIA/OAwOn7oUUTOwCTeZ4rQ3JjQV2LF9GH+W?=
 =?us-ascii?Q?VsHIjCGExrwUeqe2Bl0uR1KiyWyU3WNsV2sYjFHVpZfcQsxCEyLOXatNmLTN?=
 =?us-ascii?Q?Rb8rZjb/1HZVa7rczIv5n6cxTbVm+7tz2zL9M7eYKvdAXQjfbrZNbV30WC4v?=
 =?us-ascii?Q?P3y8ZxG2wCBtgnq9dbrSQYysEaN0pzTEKKWnOzURQmI9n449hxox3dCjq6Je?=
 =?us-ascii?Q?e7v+VFXBcpnAvbXFbQZk+EgwupPkt77DxEyG4JeP7BAmQTEslKF1qaQ4cgdH?=
 =?us-ascii?Q?P9mumMTtKGOFHvjExG3UPHYe8oiqLncv3Pev4ljyPmGSdo9mvnPEHujAOczR?=
 =?us-ascii?Q?dAPJqqmBiIVLljtW1jNHnKpJ0BkjZxORyFZyabyY7npRMLMzHkDRUnRQL7+Y?=
 =?us-ascii?Q?c/tWpbah4zMVZ3O87bfyUDKkeBTJT2+hlNgcPdJ7bXldpPK60bpC3FSf5oy0?=
 =?us-ascii?Q?plNe1/ERIRjtnZtkg5sU/SZVrP7fFQD2YqfR4cqPJnNQps4HsjQ35ayyKpKo?=
 =?us-ascii?Q?s6kRJuuy4SMTq4QopT5kvK1dhvhDC4Un/9Nnj2UZ2Lha/qR0+asQnsRYxLmB?=
 =?us-ascii?Q?2zAa71EMYEYMGroTf1Y0RLNYL++ES71hrtqJc69q2z/uYEXf961ZTkLWydem?=
 =?us-ascii?Q?2sC/MlHVTSeaZ0ybzROTjYmYGJcFykcVE+On6OK1MK7aSvcCZ94uaOX4ITFE?=
 =?us-ascii?Q?kmOZUy4dK/msS/SxRKU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:06.7112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1207df-c056-4572-3f52-08de46e98ec3
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR22MB3085

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


