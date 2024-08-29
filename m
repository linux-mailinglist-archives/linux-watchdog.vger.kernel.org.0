Return-Path: <linux-watchdog+bounces-1635-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6375965293
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2024 00:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5991C249CE
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 22:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9551BB688;
	Thu, 29 Aug 2024 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YYOsw+Dn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A71BAEC8;
	Thu, 29 Aug 2024 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724968867; cv=fail; b=EEYOPEAvLKA4SIOc0fh0yK0lko5gDzRVtBZqb3ZKS05Rlyfgt5NV3ZtlCZiHcVatWrfVKfH7L7UKdZ7kBHgUKhVAWvvv5w9VvILYAciik0/xeOHrxyOH9kXTAt7ekeb51EI3ELhZQjGB3Cg+MUj8mjT+QPmTDHhQydsPB+gANBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724968867; c=relaxed/simple;
	bh=Wk64ta0iJfSK1W/mqKyM+dF84J9+EQwinuXF1qhfBq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HGB5+8aQw7+NlooJHvtnJ+p7u4sOTiXpYWf0nX8LwZnhBAgkMKT4rKGe7DDoQ6IZCr6BRa6Wk8uehMwHo+RqtKwEwO2ykrv8ezkpNUbKVhOVhMNEjPFOBaeKfQIoRxixwyL24ASx0VDvnJ0LkOjjhSgvQp1I4+X8mTUcq6HxO9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YYOsw+Dn; arc=fail smtp.client-ip=40.107.241.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfRhHHRBTBtZTcV3PS13h2Slg2M1prLPzGUGwW31qad8Srbhbr1qGPthr75NF9bEbRmbFawiVgpeShIMfwp0H38V3rfuavZdN4E0gpWeff2oWv1anZwrh9wSYZVBgsJxzZfRanMCFEReO1mLWUgzjAfd7wKmVc1oPrKOQlKpiW6TqtKpRF8d6qOkE0mL2bD3wr88VzGgwFy/3VpTUusg7uoSd/7Ao62xba4BPVWbtqWzOFueKEvVykJRMSvOM16AHFZwAr5948ORqruvl6oITViYyFxxdRynDfJqeDEcq8OR3OLUbHKVP4W+ghdzbbKEgIZfTSi03cBOkoH8HNqqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s/rTSHPBF/g0T1U3Tw+A6CXNyzCswGc3yTk0lB1dGo=;
 b=RcbVT/s5vfDrcIz2pYQYeCNJTtmE1wYbLkF1uopfsHugCdvdMyp76kkS7aNim9KGmJ+PgDv789vIYWHsWiYjpRJFWXR80TUExf9a3Z85Egzd99WdNiCN3ZEarM+IZJT/hZcCHRydw+fSGLEA1qMsVEST7V+KSt8QA7DTb7FEmsof2NCxL+QsEM/f6WeCsdPe4OcHCz5K2f3G1lYDNy7UbBRgd9BDW3uY0dTVo2SF9DL+L4Ky4wuZ6AEh/rR1j3ncDCev521YX3v0TsXjFxbDURw76QUuXOUgxFCGeTRN7gWlZEuMlJg83YAjyjm0qUXNzcxUNflaHW6Tj+cIJaPhjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s/rTSHPBF/g0T1U3Tw+A6CXNyzCswGc3yTk0lB1dGo=;
 b=YYOsw+DnsDk49ctZylgoRu90I0zSn1HX4OClOZ/ZB7nvTU3kcU9ignJJP55EZIzAsAD2WghQU6PB94MRtjndwAo+/W+8xTud4PBDU4bcZMiJcI0Z4HB2bJAEx3wU6S/IsvDzBuZT/lFZvtZvTk1tijwyaZpYT60csz9LYGBi1gLqv8hbi4g9Pip9c7U8zGpAw5EjCVJpFAg2KKMH9UjyY1EvVeBB1p2SmMt5XCfV0Tam5B7o5FH4dZqp+bxjBKGyOi4nL8uOWaoHI5RYrrsEbxwOzDpved/kSvmnULfJSrBysjgURrSJ8c9YOdcXQS/+M0iKAJnmfDknVlNt4aNS4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Thu, 29 Aug
 2024 22:00:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 22:00:58 +0000
Date: Thu, 29 Aug 2024 18:00:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: christophe.jaillet@wanadoo.fr
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux@roeck-us.net, s.hauer@pengutronix.de, shawnguo@kernel.org,
	wim@linux-watchdog.org, ye.li@nxp.com
Subject: Re: [PATCH v5 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <ZtDvk02cvKCemYbN@lizhi-Precision-Tower-5810>
References: <20240730145610.2177627-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730145610.2177627-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a820525-5b93-4022-ac92-08dcc876102e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KdWO0+W30E3+ovn7NTTsbamNLvSVQM8qStN2yRDycctEwBAPUoiBzcw9AZIO?=
 =?us-ascii?Q?e3cXrDwS5sfdK+KCWicL6+1qlQp0cAIlXi5zX08WsGy/+SmNpa4O/0NPQO33?=
 =?us-ascii?Q?JG3ibzOCC8FcYt6rD/cHqAS9+VHgicReR8GQO7iyF/k9Pi3MNCGpIJTTMqsf?=
 =?us-ascii?Q?zFC2VPqHhW93RadyuxogQ6vWTbD63e+BqUUqeXXmb7GUdUdDrrmCFJf6FxIW?=
 =?us-ascii?Q?YqOl/C5hsc0jdQuMvOW8WQ9EWOtW4oAZOY5/8+ke5wfp2JzZMUG9tKkNTikh?=
 =?us-ascii?Q?uagJUDapkW2Tib9scCOo+plBrx6jp6WqOMUsS0mPnS4lV6XvUTSHpzWfH1Sg?=
 =?us-ascii?Q?5F+kT4V6KPegB1mbD9b/Vu2CcVjMplMnejmb3BJndJdDN8+ZIn9yq/20MHHa?=
 =?us-ascii?Q?fxOM9uiXW6Yh8vXdOlXkxcWiN2j/PDBRloqNJkPuVknpGH5SgeRYDZDaHJG/?=
 =?us-ascii?Q?XUQMcTrMNx4fW0uILpUTvSS1yFjy7p2fjIBcWXAVaVUnF1Xbq2KuuifIzQe1?=
 =?us-ascii?Q?NLinYMSlSfrZdtEKUHOMU8nXkTMSzQ03ciI52/2yikBLcVmAoFaHxmdN+mHk?=
 =?us-ascii?Q?1XJIDz68VjEdNn2I2sOn+uQ7n2Nqio/UPZJBtgpprjDf/4TO0r/8i6GtHxHs?=
 =?us-ascii?Q?LXvkaPy1cMNiEz7cErtgeDD2zUqj/cP7L/UTiOEFxCqltK6fUkGUryiLbeEq?=
 =?us-ascii?Q?ChsHFvlXamSJKLmV/MjDukjojGLvEgvwKb4K4sW+6GnMi5DXyl4xC5q2iGw1?=
 =?us-ascii?Q?bVgi+VdVaEvXXmhjgvZ/x/tganZCcaN5gGLoIt8DngKLWZ9LTniBpiI1FjOU?=
 =?us-ascii?Q?wIT/fA8ruG2ilLVdOMsQ2P1or+G+fAnVGc6VHel9irL+6LPMYMlA3tWAlMlh?=
 =?us-ascii?Q?KIvVi4ktQXZY7F52pbOSiRoWTSz7+IKAH4/PPF1QplWOslkrpJsLZHBWqK2G?=
 =?us-ascii?Q?AzsaZo/Nt6HKZRV5iCeBfM88rmAL35Jm+qtfa9v2aVg0WzIjXrXWoNWFgbxg?=
 =?us-ascii?Q?G0eCQOxajzx0nRn55EDOIN7KZdhAkMoP9LCLgDnW/vPrrdCb4d4nH6LEbOoj?=
 =?us-ascii?Q?nNsnKqJl+oKOd6NQL3EQyrOabyU3JJTO7TieUrXGzkzBPptx6kir6a4YVFlU?=
 =?us-ascii?Q?OXiPVT8RrjtDCEp6PQhn9NmNDAZ93WaqgvidgeP/vbQhtP3SYlWC0AWR9rjQ?=
 =?us-ascii?Q?T3xYnP8vcONNzpwsPJOvaXsOKWK7hQuSwUfA9STztmRTU5qGUVsj5J9PKxdq?=
 =?us-ascii?Q?r23W2RjP2MHpRmqRj942K4BSf8HGxVQ1UEB6VzhTtu1vpqsmIRIjguSovNdT?=
 =?us-ascii?Q?fCVThrfXXdTnE1Mk/Z+I2iQrZz/epup8Yd3M5hREXMeX9LDFE4x7btLFwn1Y?=
 =?us-ascii?Q?FP6TpSh8IoX37ChQSgM4Oh0ppStgelUndbyjpVpFI5t45fPiVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nRTY7WsAdTbXwNHEvVutWpf3QSp+WZaGoe9nPqIR1/EcRxK5CcoB7S4YWNtF?=
 =?us-ascii?Q?zuESMAn1HUe84oplDAa6vZ0zOAHVAhkkqIzRe7rGNehG6IboNyTd2z5rRLb9?=
 =?us-ascii?Q?8FnwrmpSd1qgiafOJFfisTVZo3hz+CEB/I3LJ7qf5LNLuq2WNUh7dg3JD2Vk?=
 =?us-ascii?Q?JXYFXqOqruUmDCfb7+yuLW+1DzerhAbea7jGVyAB6OTp9uOAEKsfUmYDHbOU?=
 =?us-ascii?Q?xUCSzU9vMjKclYYt6WmDbI6zO5sehAdb/4HKvwpN7lXWszzNEV0LZoKwgWgL?=
 =?us-ascii?Q?3O97d0eQhE71auWrKdQ3wGZaAytPKFzMk4Kg2Dl/9WX5LMBeFS1BAg0N4Ar2?=
 =?us-ascii?Q?bPdXSzFrkgsqvGA3XMAq3FtRC/nBhLGwn3gc4YMbKF8N3Clt/UXe9ElX42+U?=
 =?us-ascii?Q?llA7VYQBmF/U2rdgYseLrch+dGKrnr8eUypqu3SqSkIIcLGAbNiLv3qzh1D8?=
 =?us-ascii?Q?jBslCAKtdWcXy9VNZNAsDFK/bbe/cJKXXt0mTnXUN1wmMhIwPlSew9ZwDQhK?=
 =?us-ascii?Q?ViqbSXeDTVxVxAikDJQ2flORZgxtQXWdsn8SJkE7T/hsgXxh8SRGGfpn4DZ2?=
 =?us-ascii?Q?OzlwPPKq19gKhjspXb4jfSGcSEXCS/qRWpAOKcjcviIIfjyhsQCu8eyHd6XW?=
 =?us-ascii?Q?2EQBJVSKfZsBWIBFuKJYyujuD/VuX6nFFjzH0hHC9wwoI+bhNK+TXUUNJacy?=
 =?us-ascii?Q?txcYuBj4FnSZggjBvQUb38dZOpuZnZUuEaEQtRk3AymTQjUyWDAIQ1foINDT?=
 =?us-ascii?Q?688SeDEwcIhOsYf/s3AuodOGYgJJeigUecCLv8XcCA+wqHmVd2X1ch3ytAXl?=
 =?us-ascii?Q?AMn5ydtegvw1SZD7+Ld/i75Qb5NuXDGPnuNx279oyOWJjnRRdtCAo3hjJ5AL?=
 =?us-ascii?Q?LJr3Tk/6CD7O5ea0nbczIgIRclDCnkB0+aIst8WdXG0GzAgdsRdnStUSDzS+?=
 =?us-ascii?Q?C/jaZGxpvP6jZkecgsQKTKYoknc0dLmnSkO3li6130wXiFBU57nLmL7XwV0K?=
 =?us-ascii?Q?AmG9VC0ZWkXpoK+n79CHk7kRJ+RE5LcU0XCkYK8eymLIoG4p+OXgLqokc873?=
 =?us-ascii?Q?jMNx+zFuOobJFZVX8TUXqTv2Mxm6PCOTqcHkGQkA3Ig0EilSwu2Fo7oZB7yH?=
 =?us-ascii?Q?G9N5dYjuSXb+25ACT0LfkrtPlgEu9bFlImFSkCSxPpw9kYatOuitf8GlIhuR?=
 =?us-ascii?Q?Babnp3HsA85DP4wO6X3I17b807xbIqqChavai5GdAx/pimG91FF9GEo/AuIa?=
 =?us-ascii?Q?peGmd1RZ/wgZIo+bj5XMbLDUnQHN7al8dZqyv+1YcnqsONLR4HAsK3FXOD4x?=
 =?us-ascii?Q?NeEL5TaezpOScE28XVLi9Tu7drlTLzmzaX9sYajXZIApMR6ycZGIJj+sbTt6?=
 =?us-ascii?Q?fqJqUsa4t/+BtSEHgnmT10xlB8IcOyqvt2UOeXvSDynSG4hzH4hx8WYYlt19?=
 =?us-ascii?Q?nSeRKnPbGkiVUH6UpepFUYRtm+hxoKKvkaHStSa0SC4D2x3MQ2IDg9DRVrdN?=
 =?us-ascii?Q?utc+IL1toBD1IovA+CsywOy3gsg43cQgh2c4N2QF1OBgV3Tgj7HhCKSPgxIH?=
 =?us-ascii?Q?zmETDx6wwkt1LcHoiCc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a820525-5b93-4022-ac92-08dcc876102e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:00:58.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuF9PzN8jGB8u8Z8aDqIyUPglGUkJAcXQMjq67irlUTahmXzKOcMzoszj7p1KUh3i8JKTeXtr2eAy/SSrslEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

On Tue, Jul 30, 2024 at 10:56:10AM -0400, Frank Li wrote:
> Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
> difference compatible string.
>
> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
> post_rcs_wait.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Ping?

Frank

> Change from v4 to v5
> - move compatible string 8ulp under 7ulp
> Chagne from v3 to v4:
> - Go back to v2 according to Guenter's feedback
> Change from v2 to v3:
> - Set post_rcs_wait to false explicitly to maintain code consistency
> - Add Guenter review tag.
> Change from v1 to v2:
> - Combine to one patch
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 94914a22daff7..0f13a30533574 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>
>  struct imx_wdt_hw_feature {
>  	bool prescaler_enable;
> +	bool post_rcs_wait;
>  	u32 wdog_clock_rate;
>  };
>
> @@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
>  	struct watchdog_device wdd;
>  	void __iomem *base;
>  	struct clk *clk;
> -	bool post_rcs_wait;
>  	bool ext_reset;
>  	const struct imx_wdt_hw_feature *hw;
>  };
> @@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
>  		ret = -ETIMEDOUT;
>
>  	/* Wait 2.5 clocks after RCS done */
> -	if (wdt->post_rcs_wait)
> +	if (wdt->hw->post_rcs_wait)
>  		usleep_range(wait_min, wait_min + 2000);
>
>  	return ret;
> @@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>  	/* The WDOG may need to do external reset through dedicated pin */
>  	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
>
> -	imx7ulp_wdt->post_rcs_wait = true;
> -	if (of_device_is_compatible(dev->of_node,
> -				    "fsl,imx8ulp-wdt")) {
> -		dev_info(dev, "imx8ulp wdt probe\n");
> -		imx7ulp_wdt->post_rcs_wait = false;
> -	} else {
> -		dev_info(dev, "imx7ulp wdt probe\n");
> -	}
> -
>  	wdog = &imx7ulp_wdt->wdd;
>  	wdog->info = &imx7ulp_wdt_info;
>  	wdog->ops = &imx7ulp_wdt_ops;
> @@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
>  static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
>  	.prescaler_enable = false,
>  	.wdog_clock_rate = 1000,
> +	.post_rcs_wait = true,
> +};
> +
> +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> +	.prescaler_enable = false,
> +	.wdog_clock_rate = 1000,
>  };
>
>  static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> @@ -411,8 +408,8 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>  };
>
>  static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
>  	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
> +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>  	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
>  	{ /* sentinel */ }
>  };
> --
> 2.34.1
>

