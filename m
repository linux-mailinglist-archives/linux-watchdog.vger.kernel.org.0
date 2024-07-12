Return-Path: <linux-watchdog+bounces-1365-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F292FC5F
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 16:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA852831B8
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B715E170844;
	Fri, 12 Jul 2024 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TBSVb5sn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5238F58;
	Fri, 12 Jul 2024 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793949; cv=fail; b=maI1o6mrVL8pNU1NXVZFpjJqbuJnoKXPhWNZ1G/6nZr3O0VDioyl1OlTMNV01G9SpgPFz4kMo3py961reU+b1f/HM0llDHfX+3fDPhgxfGGTR6SlNP1E6t7u6b1dFwRU9mFQt+bZ7D36VDrmrCR1cRu4y91tSysxkkeCHFMHMFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793949; c=relaxed/simple;
	bh=WUrgZZMJU8yIvw2rH5JtanTwILW+7USVQe/unVbm11I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ij7OQVZa4M16i2GbP/tKNrB5/YnoiokQYPChUf6spLbMZ17QnspT1+SawG5i1J+aBE5l7W85Sy/xa7u5gNheJzm06VakavXf1gItJIER2tOD/mCYJXV0XyEanauUZRAgLaJQGBcq5mwm5Nss7JHHdg6si7RtGhCISoNGdpIzJCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=TBSVb5sn; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owMNZXGdqI5DmKHaQp05iwWkawmqxs1KVsteosvIa/AWpr0fdggg2uZsXOCfsZRj/9iwluF8NNjVYcPn66vgiodOzt85j/G+5rLQcyVY1f/F35To8lovw8BE4FPj8U19GyIOQPe5Bb3WI8Hbl7Nja2W34xFQCJqGDPsa30QPd8RmPlPKVNvmSoVWgdjHnxaXAyCDdIQj6bTBRtYAn+HfQitVexit7R8Ag7cURj9a8NgcUljko5pDJeptUmh/f/CK36oWp6k2/60m59pa/tar+EuYmPlsBtwtrfLSecSnOPdGEAgz/c4UbZZfc08oV71XOe0vbWRp8JHnnJhFkE/o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AulT1rV9EalUSpn2OcVEXeuDpSLFEhivsjP9C+z/PSc=;
 b=pxR+EHL5BypJjKaTWb2I/S77HnUaOPLW/FvQsxE5LNKqrVrgufn1YwIhCV9HomEaIJlKMGVrsgmbswP+44yZ2FxgY2Y4hKuwYp2qxGo1qaD6VouEMcqNzUj5EN/1pF6/11TtXBZR9ipKUKQIjMBgF6/52UfDdrhaAeaKwaG5uOkovSntCgHyiHNenBxf2ZQoxI/FHWoyG2hZReRlzr6SM6+Au1tQSMBFw8r5zxcNeJoNMs7ejyvO0Y7wIHqKEl+h9SbJTLFmAFYTSTn6styW0V304RAmtpMpbYMmyVhidmuTNzfqA4VxEwiPzUL/x7cgZZsmThYJn/e2FcbkG/IGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AulT1rV9EalUSpn2OcVEXeuDpSLFEhivsjP9C+z/PSc=;
 b=TBSVb5snMOiW54N0QGkQycoB6f8zqoGCm18tQHhuDuMu0YYpMBpiJpUEokcgJ94ObhdtIFLmG1ePUis/xNf6xbjRN1xsoWJ/f9+QsyI9V0kYElAz/H11kjbHYdq7CppJYEPi4nLFtlwoCj1MygbygJOK9PdQwRFN/MoqCGHnR+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 14:19:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 14:19:04 +0000
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
Subject: [PATCH v2 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into struct imx_wdt_hw_feature
Date: Fri, 12 Jul 2024 10:18:44 -0400
Message-Id: <20240712141844.3274214-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d06a56-98ae-4bb5-ed1a-08dca27d9598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhjTfPvbklgajsDZJanMFiORH3OhKZRX/ta759a5beCylZgScgDyH+L4/wat?=
 =?us-ascii?Q?849AIPtWaMH93KnwiOiSzXQkSX4yVV79AyVdsOiLGMJogbL+BN4WmajaNiIf?=
 =?us-ascii?Q?tdKQd43Xk/d4Xx9is/zC1f7wM3hP2YO/YmPzuwzvt1wyQxWfKlJ/3bZM2q3Y?=
 =?us-ascii?Q?ofq+QbwceZNOATtMCBAtAm8Tpo3ErNcG8l5LtVtCl+RlkFWzju+f3DAQCZl8?=
 =?us-ascii?Q?IWZ2OoWovO6m/zehxi9i0BpWr7Y4qqc7CXQmTM1ivmaFNPMoXRAarlri6VO6?=
 =?us-ascii?Q?35I/tfJfCHdo/42HAvmtue3kY3KUx5aUeoUYmPsKph5EtLTKAlpPm5CkX2Wv?=
 =?us-ascii?Q?dRzw96SrzCoOpt9b6OTKL15qyTMIYY8HNAcGsgzEcvvixKcLym+Vf5qRoFAe?=
 =?us-ascii?Q?Mye7rQphiIQNhb6p28ZXYT3o7D2mI0mK8x2CuIue91u/QAs00Ynp0nE+mqxs?=
 =?us-ascii?Q?ZaeuxI4LPBd1tKCB1lnR2Hw9YqOGdImHlfDx+K7fIgaJCrNcXxOugS74WHhe?=
 =?us-ascii?Q?vP1SgkMheH17uu5kEwGAJTwBRWvD1+z4Jlwu1z+O2O5IOiz18XuZG2QILw4Z?=
 =?us-ascii?Q?th738FkZWUASB8gmPSiJkuGffx16Cr4W41+WqXur6xwwkxoB8vB5X8M69Ksd?=
 =?us-ascii?Q?iLY7jYBWJ3oEEB4vEwVOAiox5jUwXQmcY2HtTRsNu6PMUB/qBdU4dfP9+Zlf?=
 =?us-ascii?Q?fXZEay0vULmsMPrMqmSaHeYL4FYZ9vONLLQ152ZzYZzu1eryUc8oNSeSKUi6?=
 =?us-ascii?Q?lxmgKCPXVXZ4KkRm3knRv4pG/uHkstJbZFM3/1aHTcS2gtUnHYgMG+rNXbTq?=
 =?us-ascii?Q?/TRq7sfNn0EV97XSSA3+1TscdaLYjQGfy5A9EXltyXqWyHe0RmKbnMNd3y76?=
 =?us-ascii?Q?aV/WFdvjFJ2uJ4uw0mX1u6XoMgkChWdki/9UDrXfzATNji7vBNscHz4Quvio?=
 =?us-ascii?Q?7RsFyUMjYh/5xpqCjU9HXpy9qBGUybJM9qjQgkI1ratjyKdvK5hjL9n434mR?=
 =?us-ascii?Q?oEv8chnT41ZNwsY6BIax3vBz7je4Q9z956BQfSi4ypZObSuOf7ruIMkjS2zq?=
 =?us-ascii?Q?rJ46vufWYyBgIN7P2QAsqgoANo+74V863FXbRxZB9X05Vq9e2gX9VnwO6EW8?=
 =?us-ascii?Q?JBTXnJHchiTxU9BRfMJGuHDZJeyF479uTLXNcnK3gEMmGOUXxNTUyUnD3NvF?=
 =?us-ascii?Q?Ke2p0GQCZv/eC9QvE2I/q5yEh4/kha6TUvIcGv7NNY2xtd44Tj01Rpz2D/BB?=
 =?us-ascii?Q?y3YNABfo4Lr5uHVYMXfuhLCMmcdaWUNUaJtWpKIk27qHd6bMHHZIseUVYnv8?=
 =?us-ascii?Q?GyxKbQTFcxBG24dwcG3R6hRW5XmpkRIRcVVIkODaxpqGGoloy9doqenLdHrl?=
 =?us-ascii?Q?sTmdURxVHDYIuZYWl5a1FY4/MI66NZnhd+GJWeZxfV+Xw7L1YQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TwIbI8ZQktHlipE9F0xM/2PGclKJHcrNoYOfZ6F+QuIuPeShs+YaPVzVEEaX?=
 =?us-ascii?Q?WXh9aRo/7TwLDhRWGTm7+DwkelUzRE73cUIuKylFUqieGEu8eRcnfJBxjcJd?=
 =?us-ascii?Q?GsloX7K9Pir4RsyDMJ2X3oGzk/JlA39h9tcazmHFisIZ8k3wzml1CfIcRGEZ?=
 =?us-ascii?Q?MGQWBHpQNa4AqU+Ebvu8K41wRqB45L9HzlOGve4MF1ray717E2qlsVRbXG9i?=
 =?us-ascii?Q?u1PS+K6o59d5yFdwuPrYKbJ+DNCbMm6fVA9o9xJij/iC1iWXwbfzkdemO0Vr?=
 =?us-ascii?Q?XLisnEtJ/jlvUxY/kr6ccwGQr59cfIzOoOzWEOeA0HJmw9OsDdza6eHqRQav?=
 =?us-ascii?Q?ip6O3ml/hoBpNzGh1m9QwhPPi8rjEBKZZPCIq63YtPBpLMzyi04tqTHXQR4y?=
 =?us-ascii?Q?zso/7LrDAb7yW/sGzn47Fo+I4NzjfHRaCjmErJMVcim9piD/S7CtBsJgI/bQ?=
 =?us-ascii?Q?0IoT1Rf9+XgjIATlIjkRVsWvweRR8UbrWJaOkCxBfxNkH19/bcwUdUwPGFb/?=
 =?us-ascii?Q?TD1rwdA3ngZR+MOrO0V6Y479BGdsVf8r3CyejHmtGne4KWcD5MGum81jzQ+G?=
 =?us-ascii?Q?momhCjR2Kcenln4YwTBrccMlaDja9AZjbISsZZ86bM6iW5zbRKcCb+ZszozD?=
 =?us-ascii?Q?cARATD2WJY6T2Uxb3/UWRV+aui16HEz0c4+3to33S/apq4qXCWZL7Pul1wAN?=
 =?us-ascii?Q?iV6IG5E7taVZgXr531j/wOlEaSR8UGKkKYliCFUghbep4K+LbX68NI7dnHpU?=
 =?us-ascii?Q?2dQbO4Ct7a8f2KRh3IMcmGipOHQo25nJK2PCdw8iuNnzOVup2fDIhcXdgCzJ?=
 =?us-ascii?Q?OkXPSwZb8s9K2EJcLIfnoo6uKe+6ZLQdPelWzRdhac+pWfuLKl4euYiQR9LK?=
 =?us-ascii?Q?yE1VZU6l/lvGv8qxL8E4EVidOsZPwGFJow+0vZotavAiq0JCoJmB/NftVkGW?=
 =?us-ascii?Q?jRKUlcKfimBsyrlKaGHeaOkDMOzoWFDu4f2ElrB8vBxxAgvOXRSiGIL0Fr9A?=
 =?us-ascii?Q?6GshisJmZFg8NWrQXhXj/jRTldswNmF2RAG7pPj5zVpbn+zn6BdP7w/Vzx/K?=
 =?us-ascii?Q?RF/uCl26xJikujrM1ezraUKc75phBWRGNXccEJIGanJYx7Kla//5+VKRR5fP?=
 =?us-ascii?Q?/1bP6lgT1UCXBOr/F/9Xi9Xqq77zTTXq/YBiC2LMMg0TTKiirFXXt31hDdJb?=
 =?us-ascii?Q?1zKdMn0GpNym21aPhxZjspGHWVYsp5IcB9hyPeYyBX4rfkMZ2oCMZa2c6Jok?=
 =?us-ascii?Q?W0Dzw/5VyFW7Zftz9/FpQSBbR0lpRldTDoxII/HiZuQawTvPL/LjtDyff+FE?=
 =?us-ascii?Q?3YkxL5opMANXfI0iJxdSE54Y/K3dftRZox2IQ1TEKeREcy9hz6WcR7zpezv6?=
 =?us-ascii?Q?+pl5ajf7dgc/quufadKCn778q4mRqJZOcjeQUuVj8KqG7wV6kOGFuYjq8C1O?=
 =?us-ascii?Q?lWNWis2kEia1iE4XySuUCd0SI2GhyNquEPcM4RKJRQVdokkkeh476yQZLyrE?=
 =?us-ascii?Q?RfjDEwdo83VEGF4i74S+lL6PqJWFPbfoQNoPkkBefg6zrviKVAhBF88sv+Pt?=
 =?us-ascii?Q?8srPN2BMwm7isJAuN2Bcku9VIo+3tFhKVlPOt0rH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d06a56-98ae-4bb5-ed1a-08dca27d9598
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 14:19:04.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG5P/Bs1VU2Kk1V8N98uICzvnVhjofaDjys7RvXVTsfiNiKf3eiVrWlv18qbvhUqz9rRO6jDd7PxdW9y+OlUcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
difference compatible string.

i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
post_rcs_wait.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
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


