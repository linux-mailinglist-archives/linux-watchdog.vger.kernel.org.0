Return-Path: <linux-watchdog+bounces-1438-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956F93FEB1
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2024 22:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4DC282FD3
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2024 20:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00802189F30;
	Mon, 29 Jul 2024 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kCUy3d+E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2089.outbound.protection.outlook.com [40.107.249.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0A84D02;
	Mon, 29 Jul 2024 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283583; cv=fail; b=Eu/WlW/VPid6fNv6pdg4AEdDS/5fGmFwuGTSMeItdlArQSeqwbjTQ+SO6BX2GFhuHfC1nAd1OuJSQkThLigvly254WMapaikXHiE3KHvXv0IJVI8NfIIfcfIy7tT5/OCwbidWE4NnbCvbNBE3vCTqVEf+dfOZkxMZBfnNGcL8oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283583; c=relaxed/simple;
	bh=toYGtewRxIE0w1z+/mp9A/B0kJ+hMCBCMMorpOY18gQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Fg9KToqroVpMYmF6j+kc0XU/0Ayg6VlORCWe2y32qfEeOaU9m3CDUHMzl0dNIK9L8V9O4WV4g3JHGTu6KQkkcXZZiesJ0NLVlwWNEGpfN4mFossMzY8N/CnbSKQC38AJ8xIa0IognT774kqo4LadMBPtqPfYboyFd+6NFw5nlu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kCUy3d+E; arc=fail smtp.client-ip=40.107.249.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4I4nrWKS+9LThf+dsaEFhvoWvJOV/Uo0JYdkhkGFEFiX4wFEkk7z9ZSQBnAapp58kMYI792EZwlj64cWPSlKbUq4LZ9kcLW/Xx5RrpNgeBKa8S14O7GW+ttoVIHjvm57n0cF25KB9M4Ow5/73t1oZ24MGntDktZ3ebQDkoH01xQQK4Cw0J6Pfv2bQovh7dwJHdcQ32NWtGV9THVTfnKzp/FsJT0IfhYHO0lUTgrBzpopD/CwSHJI0YCovbJ28Z4Cteqjks3Oy2VuCmsiImK0wAGJX+yvC3H3K7sMKdWr4P3E35m6gJyFeXUSDWyO7ne/dfqRbcsWP/7qMCuI91oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bb/z57ZWW+QfUw0pe0UhWXMof84AjZc9frniFjotkn4=;
 b=Zao2eDYwHDsqso5YrxCqrOYvdC25pQ69q///YcLrCBzRBgQYOpLxrDyb8IIcF2h85zjhm7LlkW/DtJIXatoJ/eu4uzz/a876xP7yUcdlZd37Ixj+oSTEPKv1hFGCImpw5RXOXG72ZMWDmR7EOQ+8LjAwlG3pYPUuyR8UeqgtEFSD6kfllTrW+6JEG/MPqWpntQf8nxbBzpcn+oh+h8Ll5xki2b8ZXeVpXM/CPmBal+ZFcjybZA7qEAFcrcOcftAEeBvmiLK8t9DvCLF3EGrw+qItqnkvmsby/taHjExOfyCbyQrizBUZJ4t7CemyJBEQNYUiC5we1X+VYXfyXa3ZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb/z57ZWW+QfUw0pe0UhWXMof84AjZc9frniFjotkn4=;
 b=kCUy3d+EuPM9khQFkuZ5NUgU7CKO/87u6tUSewclbHWthmsrArAOZpq8gHfgaWlv7eDh9SsWR2s7POU1/ejRvesRGMtuUdzGzKhrb926mcXlkR2Rxc/zZnNEey2KWRlQ14Z6w0tdCHUIEAZK3NuJHx22cC9YvpKyzpmzEAG+TbZ71fzAhRgSzZJqbbxhedn6Ul/qXHhBkdwYUpN3yTKhq0Nc+qYmydEjphB1bpRvmDSE58nOvRrtY8uDUMUE0zBlP/xzCH7zUFebdF4XOmtQ/w4LoxvrhiuUENdH22R3YuN6hWfYe/FKhShOdhnDbP6VIocpoWnsXF7bW3U6I5+8DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 20:06:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 20:06:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux@roeck-us.net
Cc: Frank.li@nxp.com,
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
Subject: [PATCH v4 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into struct imx_wdt_hw_feature
Date: Mon, 29 Jul 2024 16:06:01 -0400
Message-Id: <20240729200601.1995387-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e7bd2c-c1a4-45e7-0c1a-08dcb009e7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sXvx1cJYOFqwSQ0VJOOyLf8wSOT3oNMwSH5i71Wjl2nudtydPWICTLQJKmnx?=
 =?us-ascii?Q?3LwWmPr/ExME4bv1DreqSodyZaHTd8/js0FzSO5w5QazFS+hPBhCfAiFql6h?=
 =?us-ascii?Q?kGC66pa2L1bYkx7Edrw3uAolu0tNAra9n5sxGJ/LN6li/kkNA8mjvv0qDM8V?=
 =?us-ascii?Q?tD6rsf46w9rVBiIo0jgAtcHMlWX5xisG/67/kwKMB4odrCUMmTGtbfqtDjIO?=
 =?us-ascii?Q?BReFPUlgRJQ+IJsC3odJQGqRKQnDUT7sRW05/SICPJAPnDrawgztZlEKHdgd?=
 =?us-ascii?Q?mphw/o/qdimZJbTevFkoOPnt0oFP+aGL3lvI6hp/nEFPp7mv78N/U3N1KuDX?=
 =?us-ascii?Q?Em0O3I7TsgwtiJbZR5HKvBE9wG7aSPd9yoD9cccnzKH3KnDXUpcjNWj/d9ol?=
 =?us-ascii?Q?ZoAMd1l3DsX2/etsANlJHIsdr6K/4LUT3OPKaeHmINmkIi+NuzPQ+pY8rmqx?=
 =?us-ascii?Q?kZM6I+LqHY4mPLFyob4Ayw4I/IE5mkIzpmCLP0OhvOqvoAmTMCQJgbGG5vOc?=
 =?us-ascii?Q?Vgy1j9aAINu21MmalJcVCj4LotVcsXMt4gJ4kl3p93sd3BpVoLElDKTJ3N0e?=
 =?us-ascii?Q?AxYFP6ySS+X27u6C4JXSyxDXWqB91QNfXuU5yNTu/7Sz/kwMjEODrYrzWMQU?=
 =?us-ascii?Q?R3HcQVDuLWxgEAk0/P6Gej2F5oXfnpfY3ZC1rxOp/FlF0itJplK+7ih7yMhE?=
 =?us-ascii?Q?WqgwOwJ48EfSH+kWmwKiguTfj/ydQ3oG3MnqBKYFrFsSeY/wi+9Rzy1IRbKT?=
 =?us-ascii?Q?t2l2UuwnBDPcekCB83pYBPB9SB++lfc10/P2MxmSrvtAvgXgF/K8ovvMLm34?=
 =?us-ascii?Q?fw/LjgWyxNoniZKVxjdJ4GRmb/i8Kj4W5RoqjytimxjvWErGzeQPGLrqNuuh?=
 =?us-ascii?Q?5utkmkIdS1nXcQ5rBC7mrFh/Ry3Y7V5fzm5KbsyEgTQc6E1BFoJ+yTuPBuzo?=
 =?us-ascii?Q?620gw904Bg342/IGCkddU4Qck2IYI0Ez/+0pBZcgcp6UIkbdp893/ascn8uX?=
 =?us-ascii?Q?GemogZGjibqhdU/oFjLzGqNhev4lrQf9/XiRw7cmf0qrrmO8JaAjGaGUKMoW?=
 =?us-ascii?Q?yOsKrvobp5ldo+wRJKiEwX3T6+w86ccgeGrOoVWlb07We21tgr2lPsQ5SbM8?=
 =?us-ascii?Q?ET0V3YhPzAKBfBITn0ORUWgEVfFsB9ZlRsFQGzSjoeq64Dc2bs5rlg38qDX/?=
 =?us-ascii?Q?A/F1jQNXgliDMZVF4KO2O0VRhtYm3gaUAUKjyzTNXbOYJrOOGY7sUNSy09iQ?=
 =?us-ascii?Q?JJS7AfzPv/NtmTc8l4LDG6JoBnKcGffpcymQOFju9DMmFcsvFJFrn87ieNYg?=
 =?us-ascii?Q?UWzcdZRQUlEdS9HL71SEWmE3Gl46Dk+JSXzgeC6WfchR4F2CMYXtFJIeD46m?=
 =?us-ascii?Q?fc59fqpyjOntdASD1YoVl15QXtwKcK0P9w27B5GzhHHAAEPgcw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aA6RfxmZc0Zz34AsL1m4S3yoCKr5SkSkX5XnQgY72dqTA1A691Rx6/cKIX0f?=
 =?us-ascii?Q?1dszMqxjLRKR26mEWCHjseFUjZtjJ9p51t/iY0ETonQQBJEqfLpD2TBkKLyQ?=
 =?us-ascii?Q?XC9Mw2Mt5HTaavxzx9WbId0GGoly33D3S2KA4vQX5HbSo9nJ9mIoOiKmpL0/?=
 =?us-ascii?Q?KlbA6j/uKPPY5/n2Tw7pGT96ua6Nc1svs4dXlABaamIGng1aqAdMorngdIc8?=
 =?us-ascii?Q?GdsfL3aCtZuS5QJkUGbwrt3smHTrWwd/mq0LbBDRUVEkIrHdjkhgaW5rr5qw?=
 =?us-ascii?Q?y11lA5sxoYzdT5dM52t5WK124IvVoA5QTCEho6IEYVURNCo/fAHm6PXXiDxN?=
 =?us-ascii?Q?gKGi9NQpF8Cnax5cevMX0/7GCxlgzgYRZ24scQy/JVIqbm2PbJayYLB+5oew?=
 =?us-ascii?Q?2b4nNhGmwwvOAVNkFaMZnp0piE37P8L1fjKtk4VMG2jK8oOhYG/3GBjCkdAc?=
 =?us-ascii?Q?3PKOZiAyqVUiIAvwo4wAKSrKTboY/7ugSesGStLAZN1MZpa8La7QxQ0z2nO0?=
 =?us-ascii?Q?xsH+j+vGI4xF1StC8qRN/PsMTRdQ0VyNocPXfRE2QQTeUh7dLhs9BbDk2YY5?=
 =?us-ascii?Q?VILqjmEnNgr6uoSFzFMGmKDvA0U1WuSQlirPomRfu2C+So5rsYSpjKzvQgES?=
 =?us-ascii?Q?Cb6rUvP1LOlfvXYOhVdoOmCoYCMilm7IS8oBhSrNajxuP8zyLziH4ar/zdta?=
 =?us-ascii?Q?FfSBHMrCJ2NyGI/wVDKacy/vrHQMm1Dvqt8ZQMcEJbFkiAQ8Zu61ltkkuoqY?=
 =?us-ascii?Q?BbcPDa1z/uOnL709sM5g+Roq2wKotw7lqgcbkXLPuEbsRMQ1RFYJ/m/JuT0v?=
 =?us-ascii?Q?x4f1kEO0oZFvUaEWe8iDb1PNQ1MoGbkoYd2dPXNIblg/alzfrqJMy/TUGtri?=
 =?us-ascii?Q?tUNumSgznWunQX93IDGGnDq1eqE9keooycqthoQTkBTw7nZN2IXHQMMzJR+6?=
 =?us-ascii?Q?/9ExVozmrBV9TAEgHF4hsbsC64hyN6nuKvh0tN/LEn2+YmfKT/HqYHf8Cldw?=
 =?us-ascii?Q?ZmKwGMwkfV9qbJHCJjUNzYo212psOikRyHw/sCJ9/5A8AKa94BVz43ZCEZWC?=
 =?us-ascii?Q?LFTawIlJgrbEfcIvu0NbCnxcO6Rut68ZvbEfGK0M5Croes95BR2EpTfoin0G?=
 =?us-ascii?Q?lc3ilEjR2f883iQL7SFKf26txJm4RfW8ejUVKiPscWNAWhizAwqGNeqoMu7+?=
 =?us-ascii?Q?ZNPQhPS96DB6Yv/dasGUotms0z9yzdcDpwZfwabRHHykGTtauqJH1VUyegf5?=
 =?us-ascii?Q?acnPPLIia9kTsu1NpNcEV3ot7ZDoEXTldQP3huWIq0fSj/R4RsX6nOvHrXYX?=
 =?us-ascii?Q?HebutF/UTKMNposQ1sYXv3QYPDurGNodYMa6dy43/TMJGLTla/PMZu53RdsU?=
 =?us-ascii?Q?7yrVtG4o7Afvua93dsAgySm9PWas1A/hOufiasVP5C+VQulquxnlg7SYW+a5?=
 =?us-ascii?Q?vuxXzfkxbZAgIy1sl2QtYbLXEVyCJgGmzZdiIEqtwTnfrpD2J+iaYwxAhmGj?=
 =?us-ascii?Q?vKfJ8QxXyX9tROB343Mz09mhi8H8gbaBL6qNa5LILrL7MvdyGJOz7BcPR3RL?=
 =?us-ascii?Q?gGyqZnUjKBvOT4MEicCxwexI8L5zztl2W6X8jns3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e7bd2c-c1a4-45e7-0c1a-08dcb009e7d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 20:06:17.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v0/BHkcw2EOmgLwnqidhD0bqr9cGCzRonYT8AiB5gz1cq3z+gDZzWzhVrnm/R7qobKO/VlaOT6c/nKZv4gEhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
difference compatible string.

i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
post_rcs_wait.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chagne from v3 to v4:
- Go back to v2 according to Guenter's feedback
Change from v2 to v3:
- Set post_rcs_wait to false explicitly to maintain code consistency
- Add Guenter review tag.
Change from v1 to v2:
- Combine to one patch
---
 drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 94914a22daff7..3a75a6f98f8f0 100644
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
@@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
 static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
 	.prescaler_enable = false,
 	.wdog_clock_rate = 1000,
+	.post_rcs_wait = true,
+};
+
+static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
+	.prescaler_enable = false,
+	.wdog_clock_rate = 1000,
 };
 
 static const struct imx_wdt_hw_feature imx93_wdt_hw = {
@@ -411,7 +408,7 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
 };
 
 static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
-	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
+	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
 	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
 	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
 	{ /* sentinel */ }
-- 
2.34.1


