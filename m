Return-Path: <linux-watchdog+bounces-1385-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71639318F5
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 19:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824E82826CE
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 17:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A594436C;
	Mon, 15 Jul 2024 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UXu8Q+FN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD8481D5;
	Mon, 15 Jul 2024 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721063259; cv=fail; b=Rves91uicl9dotOB2gYJ/g6STRxqoJm4kjp29+RcMkFo+Lv2YC4Nc4VtlaYFX142o9bE/9gLclG7nJKVkEgonLpj2D8M8lhIuOWJBK8j4tsUBCLPseZgijfJCaMacBgcbxmgd25QUL35Lyinn/vAlPGha9ZyEVBqrpBYWIVkacY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721063259; c=relaxed/simple;
	bh=q93P879H3QqIZQaVGpdoSJXX7TzJukxIO3aSV/NfQv4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ybxhdmes3lmDzAqL9SEWgqDqnLyF7vD66NlVHzt80RgEqQkf51QObXEqbEvD5sOmNDkFKVntsnu1Ewyl+F95rkGoIiQswx1FevzNzIv0+UaOzOGyOjyVGKDFLL52IFT/2CcNUgohqeZXo32DXrKFP8chww3UKwiRucxBjNDtMpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=UXu8Q+FN; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksd0XNNjujoen9IMzAzfxtRAOAEKnn30K/BwAU36+XUeaW74sfcPhizK0Mou3Tk8ADz//c8xm3aNsTeB0k3c0bjqPwk8RcJQXeOdmDEDcmfG4L+fM5F8zajYVR0dctsinkaONp559Yh3q+gbxuAe/i7TqTL6UU5BUm12hsnL4xnFrlAUZsP9sNxX8vqoLDCKTjW6zlWvHy09Kdqg0fmdXaq9S/qCjZ/QryKAX3eUsk/fmo9XiIec931Wsf3fSqX3WqQe+E/TXnRCVvkzFlhdXJuZN4rSPnZg3Aq1Fjn8abBGeDNt/GLLgpsrraACpo+HUyrCpQ8AVdFODM/Av+s7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrEoMJJve6wI+fUv21eSJCWBRFRgYgWHvklS1wN4yUA=;
 b=jCzrSMeYGUXXSJ/S5olzr0ifqD2dDPccs7YH/JO3968NKsLDaPn9xjukFwX4b/7uPqK2MvMkie+b67qIc4oTRAk/A/OcisQKoUoTF0dvF7FsnWzuQNuSsHdCnxzSzeCD2agT5udlO7v6po9iT3Q/3aH2xihZFfjsGHUw64rgTjkE16XMKnsYWpzd7iBfgrqtqY7zrmScI4p/qQXklNjggDLEVBbluvA8t0CxfXaDzjE21snJaVilk1ffQTY6Trj92zUpMVKH8DnFYN0yf5medoyEDQ1e96Fu65KVVOptDMKc3TYQQ+4fnrRe2QdO2IUfY3tA8gav82BpiHsznq/F0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrEoMJJve6wI+fUv21eSJCWBRFRgYgWHvklS1wN4yUA=;
 b=UXu8Q+FNoahSgV1BXZn4okg6LjEjGb20ce/JeKlYef5jKesnF9CUtgjck6tlgS59UiUnzuKgHA9QtMCKdaWHMvRmF/KBT6hKFcydw1oUzrux8mcPusWcEC4GgBh1ROS6JjjHXs4GqTjnNPLA3bbRrqih4bnqQ1ZYNNALkxy0bIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7956.eurprd04.prod.outlook.com (2603:10a6:20b:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 17:07:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 17:07:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux@roeck-us.net
Cc: Frank.Li@nxp.com,
	alice.guo@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	wim@linux-watchdog.org,
	ye.li@nxp.com
Subject: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into struct imx_wdt_hw_feature
Date: Mon, 15 Jul 2024 13:07:17 -0400
Message-Id: <20240715170717.2490688-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 206ca358-0958-4e59-ef7e-08dca4f09f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IUq7e/4wwa/Fy/vYI8aGCpnkxrLCakmTTIZ7oNbUjf4JeZ9TrfH1/98Q+fAJ?=
 =?us-ascii?Q?x0ARnbBnmOTD555ecY1PQ+xpwI/N1wk/1cjRyfvqyf9fIH6CqDx/76tFHelq?=
 =?us-ascii?Q?BBwTAbILLidLuL9hgGZZjS7eHzeqy5ys3nVw9p160UF2hnBUE12K3KoIMEE1?=
 =?us-ascii?Q?vSTMeNDXiWl5pAXvG2xI5ET/EnNvro6gWk1lG6j5GsUSLnlS+XuXagB8KLmD?=
 =?us-ascii?Q?JCc3n2h6OI3oz0FGPuEs2OnxHgGiHdoFPMQvZh3A89Ejx9B1wgQxHC6hLCAA?=
 =?us-ascii?Q?jEJ47Cnx9mVeOPzCSb69t0YC/Mm9EZwD0NwknLPMRyVCtva5o5OUyDhf8gIf?=
 =?us-ascii?Q?Q+N0ryOjucEdfIb3rPO/h5DlIsu8UZ71Kfqo4a4M8ET+w17lvDU/cQeJgVjn?=
 =?us-ascii?Q?JVd16oEyQRm5KROVQx4ydlIR0c+CtayVfIiVChwJ9SS28HZM7xcuvtL1nvRH?=
 =?us-ascii?Q?nKISfiFJ0lbtbxFK/WbkqF3YBAt8oYRpaDb50hUBRwT1rLccUqc2N+gQzStQ?=
 =?us-ascii?Q?3Za1a7Tug7HveRJEP1m1GAFfY+OY+I/Cc/f1USQJFpx1PNV2YPC+vXx33yWF?=
 =?us-ascii?Q?ppkn0rMhOrWRURaQpcJb4gdAQ3q0QZbtnXXspxb28NcRZKQKSdktE786jPUf?=
 =?us-ascii?Q?mnHOyhe6iCIwsBW9S0iLQG251K5wUzWVtw3yZ72IE3qw8Ntqx7yzWRYP+mUV?=
 =?us-ascii?Q?9Qeu9nF+HZL3OtNpixrot/Zh+pHrI0SxLOXxCLsab3cqBgXJ0wBPxoKXZfPT?=
 =?us-ascii?Q?ABwkWWokkQS0CJXbs36ZWVOZN6WR/4YtwSV/4EG4rgLGBs1DoE9+ay4hNfzf?=
 =?us-ascii?Q?5l17feeerBo7M7rKn0CjjEwcbeauxrevN3EhKbCIN+amceR4WileJsxrFW2V?=
 =?us-ascii?Q?7+1b67ciqm2rbuITTBvTw2JBmog4X5U1xSYkOcN2hmWDx20sUZZzEvtojWKI?=
 =?us-ascii?Q?jwGEBI+GNxEP58PZ1X31E6cpw+Xiv6xePc8ah1bIdcv/R+LhdnAVTtRoNxqV?=
 =?us-ascii?Q?S9qa/DfubPuiG7Dyd2fVEQlotkr3cy+A6LTvHW2jarYEihsSDjeL52Y1mhpH?=
 =?us-ascii?Q?S1ksMjh0qY23OnIx4lQhUsahaQQU55Tymx+BOHCsmH7taCIOYeD4lwTNIq7d?=
 =?us-ascii?Q?erncXF5yBXMusA6nyHF8raQi8OXrWeIfWNYwQbmPpeMEeQ78m5iIfhjYNht1?=
 =?us-ascii?Q?1LTqoLGvC5eSkC5jA7QtTjbfLT2VtHIgHgxICMn8yStG6SR1Kle/DY6X1z40?=
 =?us-ascii?Q?tRENCQ0HaXw5zWTndIe0aB55WWkW2bxQPDWn48HrezP0F9Yjjpy2NxnQaIAU?=
 =?us-ascii?Q?28+Ez8t76oc+jaqVeyGYoxZY+ogVy58xZRr4PirbgBKzzyVR70kia+DohBHf?=
 =?us-ascii?Q?iCmhgW5J5ThlA2XZrGRkBYK8ZxqlIMuM6I9qvsnHzRMSmOJgtw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9tEAacI3nc13l017T22D+pAJc+FMp2iY5EbgQUka5NVYsFKmMwLlqbkhTgOm?=
 =?us-ascii?Q?y3dnxud0rb+mGGFxXTWndHAHcDBZg5wP9fKKo5svhM/5VmGpkrs0aMIVHIrS?=
 =?us-ascii?Q?A8mKKr8K35qQxcM7+asH7oUippOk2uvEz567J6nxm6G9QoyAnxAAf+PuRSFe?=
 =?us-ascii?Q?cNgQotZLEfclF6LY/PPOnyH/RX71s9EEBCxMsGuI5JWmm3/M+H4dtI39xiQX?=
 =?us-ascii?Q?sXvQ32KWKDmd44HFEDRW1qb4OZ/6ZFUn4AoM8Zwyy5yGNyTx2TZUxoCSOqnO?=
 =?us-ascii?Q?lgVuLnk0C/16WP1WqRp3o0rmYk7uU7AeTbkEhQ294Qzs2egD8+cS0s6aCb1V?=
 =?us-ascii?Q?jAVF7wwwD8zVyrFzoytPvMD+7nnc+RwcETQmhpqRIXfw4wr/YQyVtdjRCfeH?=
 =?us-ascii?Q?sTtiCWUlZljT239JOcdhbPz7v3NkSC1aXHw/bSOJ9LrpD7tZPyDMWAjfBL+U?=
 =?us-ascii?Q?5DsazrPZV5spQ6sEBJudMTPDp5DlWdS5qwDmqlHYme3CwCw2IjoD2/DwkXVL?=
 =?us-ascii?Q?vNy7pkcSvS+gBSoxnzF5nzFKL1k4HpT710ykqD4GB7W7JPHU9ysaKaBb7zUH?=
 =?us-ascii?Q?0+kRkWvrJCw3k2DRSqCBoSR1SsPcfavsAdQPWjUEvV4OM3QRo8G7UashoyEb?=
 =?us-ascii?Q?iKgYEGEtoniCHxqAAj+85HCEuIh6T1FeMgP+6YaJ5G+k5fpdjVFU135D9XI1?=
 =?us-ascii?Q?KLDJ9e8nRoZ7jBpE8AHKgabT9I/H/j6CQdF/7IDMfdBdtwbzVQOOwhXdwjX+?=
 =?us-ascii?Q?97p+zby082b2cJQbGQLtUbQqvBLZApRIZ7K0bJdfz5oV58Pci5qddVILzcob?=
 =?us-ascii?Q?3OH164XdG07k3uRDj4pmeMaQrGcEZMQ8TONK5AapFujB5doJ4QXsWtOf5wRp?=
 =?us-ascii?Q?8LOho8lwHFKPbHlRUoEodGpSpp8t7hw4wXAp/gZe1fxIGZYdkfsd44H1Z8rr?=
 =?us-ascii?Q?Y92Qks+Yhg1J2kjMiCQhkLN1h1RpMaG0vtCEMgSY/pTovmsya6Ijawpe4Yez?=
 =?us-ascii?Q?/zw/nSiGSsxVANjYuXTrXzzsEVBXzUHqPTwyCs18bHEk35yAnqxiJ3vvq+cM?=
 =?us-ascii?Q?x5dASA/L4jAWRVynlIrMAkc5ZAdgsYyvL0kDbOrjW9DD6/lv9g9er59T4HUJ?=
 =?us-ascii?Q?GUNVaYTxPwh1pqPNYWKQH5Wu8strg1vxDwdEIsoFIPc75t0eLBPXjId4r+AZ?=
 =?us-ascii?Q?tdfmQAZfkhCwOTdAoMn3YopjrihWTZvY6KblrZzy2W3eRRiXJfpbyIXME9tZ?=
 =?us-ascii?Q?7JehGw8kwgAwWdKN4x/P/SZhWT0gm82uho2mIkg3nIPgjIIGzL3y/ekik1ot?=
 =?us-ascii?Q?y5oo0UPjdiGLdd9hYKCpslLWPNOhw9wnquR2uHYX4IcEeAM2KU4/Z3m5EohB?=
 =?us-ascii?Q?4ao+Dphp8Kk7OJOXjrx/uQvzspNiMT4+++IGtyw2tpDJhaUwZ+Bw0IaoIvm8?=
 =?us-ascii?Q?lsgD8d6fP+TDdWrJcwBbfOkM337lhTIEjdr1ziTT6ywm+EaOblqUYZ4NU/bm?=
 =?us-ascii?Q?DCneb27sdR5E7Aj9+dPXpMW4Yq0giIogb5B0xcLOqDhES+6upLm/b18Y4mpA?=
 =?us-ascii?Q?s2Qy/KpGq3UWotyg+cdIJF720L/7G9ehpKKud3zp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206ca358-0958-4e59-ef7e-08dca4f09f01
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 17:07:34.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Zehx4j5XcceZDIrvcF14I298umdqQWSnjx+HwJvziMlCmpP1AafNHMkTM0MDpWpk2vIS2O+rjcY6nzMKksnEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7956

Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
for different compatible strings

i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
done. Set post_rcs_wait to false explicitly to maintain code consistency.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- Set post_rcs_wait to false explicitly to maintain code consistency
- Add Guenter review tag.
Change from v1 to v2
- Combine to one patch
---
 drivers/watchdog/imx7ulp_wdt.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 94914a22daff7..a4aa02f388b15 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 
 struct imx_wdt_hw_feature {
 	bool prescaler_enable;
+	bool post_rcs_wait;
 	u32 wdog_clock_rate;
 };
 
@@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
 	struct watchdog_device wdd;
 	void __iomem *base;
 	struct clk *clk;
-	bool post_rcs_wait;
 	bool ext_reset;
 	const struct imx_wdt_hw_feature *hw;
 };
@@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
 		ret = -ETIMEDOUT;
 
 	/* Wait 2.5 clocks after RCS done */
-	if (wdt->post_rcs_wait)
+	if (wdt->hw->post_rcs_wait)
 		usleep_range(wait_min, wait_min + 2000);
 
 	return ret;
@@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	/* The WDOG may need to do external reset through dedicated pin */
 	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
 
-	imx7ulp_wdt->post_rcs_wait = true;
-	if (of_device_is_compatible(dev->of_node,
-				    "fsl,imx8ulp-wdt")) {
-		dev_info(dev, "imx8ulp wdt probe\n");
-		imx7ulp_wdt->post_rcs_wait = false;
-	} else {
-		dev_info(dev, "imx7ulp wdt probe\n");
-	}
-
 	wdog = &imx7ulp_wdt->wdd;
 	wdog->info = &imx7ulp_wdt_info;
 	wdog->ops = &imx7ulp_wdt_ops;
@@ -402,16 +393,24 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
 
 static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
 	.prescaler_enable = false,
+	.post_rcs_wait = true,
+	.wdog_clock_rate = 1000,
+};
+
+static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
+	.prescaler_enable = false,
+	.post_rcs_wait = false,
 	.wdog_clock_rate = 1000,
 };
 
 static const struct imx_wdt_hw_feature imx93_wdt_hw = {
 	.prescaler_enable = true,
+	.post_rcs_wait = false,
 	.wdog_clock_rate = 125,
 };
 
 static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
-	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
+	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
 	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
 	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
 	{ /* sentinel */ }
-- 
2.34.1


