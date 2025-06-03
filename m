Return-Path: <linux-watchdog+bounces-3610-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD6ACC9AC
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 16:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2EAF3A54E7
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Jun 2025 14:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71832397A4;
	Tue,  3 Jun 2025 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mme0rYQz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54F15624B;
	Tue,  3 Jun 2025 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962513; cv=fail; b=cx6XIGnSMX30W3gECGkjhzq9iAo+i5hJDqjPuwg6OMAClna9xPf6h0CLFwD62mpk7EVBgjxYyNxshSZaf5wlnn07fuywApxL+7mf4hk91g0Jt7jh1E4rpopy8H0o6qHBivxtjJCzMZsCv5DaZjgvnzeNF/XW+gYy6nd2lToISHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962513; c=relaxed/simple;
	bh=GfwcheA3hPrm119B5jApTKPi6VTxbnbV2emlTC9lPbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ODevG7AjLOoEvb7XCBcZKTv0FtCPPYBlHGOtkprw2YpOwcMq/jQs0ixOfSBEOMS2wyrCXXDxHZncW45/HkBKfuPR2Aa0Vv1uEKQkhRYXmHvP4L07dQoMfick6zE0R5eITaLhxO5Gef2wOUk6iaceQIprLp2vur2W9Yxq3Dvoulw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mme0rYQz; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qlv3xwHGxI21zL3ISmGcpDkzTbIfOBy8rTDg68HCl/1kzZlHQWm1I9e2HYs/6/Y0QjecDEs8ldFnw1zqz0Vq+QcGtM4Tm1nxaxZM70g4vICIOTn2CtKhFwyqz2hUP2Oa/vhFdj2oPKtxb2TINtPaBNZtUOpXQG5Fjo4NPWdev5gVBzI2jGxw7PuxDYO4nTFy08tiZy1blSkSxazJJtcrXeL1MHtwi5o4lLIL3nU6xag1towUfXuiETbsnZ0P9Cp2npY5Xd72hULWWUCYW0tR5Xcz4tq0e3YsN8UJAfTUg3AimFd6lU3WhLv4G+Hm2vei1nf6E+z8vzeHRrCUlwZngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o56m/f/CczpqNkoEOjwYkr+X6qyOA/Dxo/4e3Ca8fc=;
 b=r5CwDyQmNdXJ5eRlB3xqLwuAI2SMtIeq6I1Z/u9jP0Wi6icL2+QXJ72gTMzacXgKCoGI1D9TYCpANDafXFEe2fXbatRRzxohA4paLkd2p58E6ew7jpcXMua7TkJWJLGIUJWnsJGOCW5kqOzwj5I2uzpp/mDBOJ+BwuV36fusLpUvEZOFDNn21vLsbXqTzC8QN/ZHNzcb5lf9e4DcArhzZTEM+IRdW0y4ANMxmOtEJR0NmI8E6tVwtvGvJB6YNQANhlF06F4UsDAOCXHJc0NuuP4CipSX/IRJxBU04jwMZfmtCuCm5H9HFc+XPr014AEZu2UW/Nxkjt0canW7QJ+Z3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o56m/f/CczpqNkoEOjwYkr+X6qyOA/Dxo/4e3Ca8fc=;
 b=mme0rYQzIDAQR/N4OXWrVertFfoN8dVCU0wpGUXVbCUJCk762/A1tEXAtsCfCpdJr/XNKdfDTq8bJoQ44PtSkwYxxITQ2J5Je09cFUoK2zU0zC1wQc4CWCfkMJ20kuBEqbxWPiru89gxDrmD6nZUtBYWZX2Ead/U71Y7tHbRnC8/XA0ZYWNp6V35Q1VGznSaUJSAGfeR04F5Ha53En6GWu5g8N5vmVnyDNaiQv2layY2hDJl0Y/SVI3ido4/4SCGtYyq7f9ex+J1/fWL3AVkas7ZC+kBEOVIWsOzktVw7DKqABHapplToW8cfbGUWp8RoVtuwokcirdgvBvJPr/6qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7891.eurprd04.prod.outlook.com (2603:10a6:20b:237::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 14:55:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 14:55:08 +0000
Date: Tue, 3 Jun 2025 10:55:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Meng Li <Meng.Li@windriver.com>
Cc: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
	shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
Message-ID: <aD8MxZUCkzRR0IWt@lizhi-Precision-Tower-5810>
References: <20250603040230.2012772-1-Meng.Li@windriver.com>
 <20250603040230.2012772-3-Meng.Li@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603040230.2012772-3-Meng.Li@windriver.com>
X-ClientProxiedBy: PH8P221CA0063.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa7062c-46f0-42bf-5e94-08dda2aea23d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0eiAhbyXK6EKM6bRVwR1RMOPGSwcXFFDW6VM/6cy5Eu3inZCsTqC1jufkxEJ?=
 =?us-ascii?Q?h/MqDoZ8zZraE/Qg67c09Bwlemjd+wQQXGSejPM7eFw9ZHzEZEgQqwYy6B0Q?=
 =?us-ascii?Q?RjS5h4nsFyNCeNA+nEAXnoDx/4y/y7viHEo5ubws8P1WjeevNhcGkvdmCEvW?=
 =?us-ascii?Q?Lw50i4tqeXjNtIpggy1yQFoBnQ99DWyk8RsDnmXk5HBPom1cLDVgyc3Wphiw?=
 =?us-ascii?Q?GCJU+vlHP4vsaHGrB4XgirEMsUFgeqZZVgOGrZf/UqNwAd0SLjj4Bfmeaj2z?=
 =?us-ascii?Q?3R0JKn6zHNM06Og/y2s+7C/FtJM8f44+dRiJnvhGNN+lq25Mp8M+Ip2b5D8F?=
 =?us-ascii?Q?+bi5uixRLKJUEhzYMR+UU+QqqenTevwoVJN2H5lqQYdAYtXxtaoL/mlm5WvE?=
 =?us-ascii?Q?85AUISFSEqiTvsmA8hVKnDDY/VYq1z8GwtOxEgFTYIhk64a6LelvT3b0X0l7?=
 =?us-ascii?Q?AszS3H3raUT5nz4dWafNktyG4mXdru7yyd0V73ILw/6x7I7kgh7hKAy5BW46?=
 =?us-ascii?Q?0H2A8RiYMgHKSWBtvcdYdXZyLfSce93IdBx0wL0uzjgTVYhffCJMoF3OUxCW?=
 =?us-ascii?Q?eymC7YFXYMRoGy6qwwcT4V+JQ2EAWS6joBwU9wVxU9Isl2/KDj1RS9a+RTfc?=
 =?us-ascii?Q?KDiuBp84uuRdUn9RrRyanWeNmmEEyP2oJhKAisEABpdBbSLLEVL7ix+kCKnX?=
 =?us-ascii?Q?Lz2wCgkU/aNu5B2tudgGqmKMpi6qw/W85ECZjhj+Zk4jiNaL3484/HIDbKKT?=
 =?us-ascii?Q?n20vqeaYeD5GfVuVI1s9y7reQosiH7eFoITAHGU1bicFzTI1GWHASqV+cnSy?=
 =?us-ascii?Q?RvRCRF5qHtfwUsRLHL7CcbFNqJsKgJGGs0VdDHZjJpiTQbxIn9z6fqtMJ2FW?=
 =?us-ascii?Q?KO97zRzlryDzQuipyBsePSsKVcgVNU19vmYZ0Y7t3GYRULbA1IoZ+Wt3WxAO?=
 =?us-ascii?Q?tP6+/Z70roemto9701gFBJbgFp9dn8VetSkLdq6aYVWTb7FFJ1C3PjBE/3sm?=
 =?us-ascii?Q?W6BvtjTPrVINwdE7y5TlV9Y8i1vGCVzQ3vo5uonlAhn8HzEoan/AnWpTTB/R?=
 =?us-ascii?Q?MQKQpIHGCw9eRD0Um0BONbjGnfIjIieDmyRcqLqYHujeamIoQq4ZxSIoTOvd?=
 =?us-ascii?Q?UFfEvUL+1lZfFlBdgZyiP9GfSnPKSqoAgGN8m5VoDvoeIRriXc/h6VNfqCot?=
 =?us-ascii?Q?3sKdehCkLUfz6koaUa0XKAd8e6+hmtdfE/Swle2nnFOSYvflVTwoazul/fkO?=
 =?us-ascii?Q?knsDWIgkdh8OrkfwjkrmB9AisGAja67LMqV8ch9FXfRX5srCPtdZZKKIbyaA?=
 =?us-ascii?Q?ICvrqkqrtIGJH0K26HonbmA7smf0XGOb6FkpzxvzHjgH7HsMo9dBwNATlD5k?=
 =?us-ascii?Q?duqD+CznaR8sTlKBP98vGDO3PvjWGi+Hn0JynDmJC80bZoBYk1kv0zE0bRcW?=
 =?us-ascii?Q?5aZGza2Z4hT6ThyJqE28YWmJ6tCGNrENqgpyvpVhtJ9xiRqqgU2zwg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?15LCTuwKDSNSudgVkVEQzww9dDOSQT4g4Eh4eJgwMIzsVsmi/Ic5IWzuzNK4?=
 =?us-ascii?Q?ngMsTPQYf9mmgFdiHnYhSFNPmA8K/v9JcaNoP6gSxN1jt2NK4POUOuZ5imEA?=
 =?us-ascii?Q?IqCCMM7UCPoyyvHniCf5hYLZ7/8fJTF5bUEQUv0KxnVl5ni4p2WqxIUzQOWV?=
 =?us-ascii?Q?yBv4K+WiNgiAZShUCF/ZnK5xWPpjN5ZrJB+5DAxw270FZZXTMrOiC//SX8FB?=
 =?us-ascii?Q?tTF4WY1PXmJIzXmadoCqP6yS+tum49b0knOkaeDnAlxtMgTEkBWzy0mZIvMQ?=
 =?us-ascii?Q?54JJKYhxf9B4A+K9aAh6fYPg3iY8WaZ6zWoor/bewYLRoXxJldFY0DuPRMYx?=
 =?us-ascii?Q?+qV/rLUOyLbbX0eKsq6AJZGpAED49Kn4+dCYq5vkV5PKRPFEojPXLR7lOSxl?=
 =?us-ascii?Q?0twQdim/ITpcw7RfD8QEHQhhMkywlnEothVIaIXqNDOR4X58/BMezggCKutl?=
 =?us-ascii?Q?khCQgZTlEftIE+TgBWeSJZpUO2yDf3hi5DXXVqjJE9u3LUTAR6VowAQYfLE2?=
 =?us-ascii?Q?jPT3kLDuCOVq7og2zscF1E9KPXTWyRq4/pMj1vd7a/Y4oEpm/m1mmdJHKZ76?=
 =?us-ascii?Q?uQtqXFek/eL18T1nmgyVxWpTv0IraXKfcdFaU2n8eFsqI5HVkRyti1oCShRp?=
 =?us-ascii?Q?hwggYfWMOT/Lk92CWZFIodi/jWDX1RUvtkTrqY2msEyN/b+2Kt4QoE+4l/fj?=
 =?us-ascii?Q?KpmLge0eDUYZ8z6/A6K60jD2h6fwg7KiKqSnKBDfzxz29U9rzPr7Z+QBNqXk?=
 =?us-ascii?Q?zkMf85EiAOL8wJSHXJIgAi9TJnQVgtsmN+5Z9pyaXuQoZtWAv+8cb0jE/I7b?=
 =?us-ascii?Q?HtelstM7fodcSTUvMH7aeqoFklrtK1yor8SujVxQ5JPjk329S83itQMyTpsu?=
 =?us-ascii?Q?PKaq5WkKlg5nKuX1F/VJN6YpLEzh9yhoLd0f2rebyYvhm7q/G/fRcmYtJt4m?=
 =?us-ascii?Q?Cg28GzjS6J1ZHdrGrBX/sRPX8zO/N51uspUUVLC1ujFO187YQIMTfKf5tp7d?=
 =?us-ascii?Q?qv0Id8WMewj/fTc57nu6MXFaE6yPi08ZdqS51D3EshTGtU2bdTQuHwIC0Cid?=
 =?us-ascii?Q?529+EP5r/PN+TprKyrHClIvcanLWhZQyMgotaTWw9lPewf3aEz47pD2mtiQT?=
 =?us-ascii?Q?HjUHJP1j3isRdkJYVLUejKqylTzd5lvkdjqfoRPKUD6Bff+vAtkViCe/Ux6J?=
 =?us-ascii?Q?XPwkfQMVcf0ejUYWL7Ci4UJu061f4OGrYaUnWmNEQEI8Y5wIKhh/6MyZ4+N0?=
 =?us-ascii?Q?T5Xrqrst9i8XtL3HGallfMO+O6h2RsimBOcYdGWutZz+efGak/WEXd7kbS00?=
 =?us-ascii?Q?NEVQXakaLBItdxBQvRdNCrF0+y4WJqONQ3dU0gGTZtvYt6hcqSXm+OXWZWja?=
 =?us-ascii?Q?XNz+QRS+wAkY1YT5dwDBkiRhh0LVCIlBXhMq2JXIRKX4+3PZ9D6YrPgMIJ97?=
 =?us-ascii?Q?cNZEISFUeP1OS6D4p87m1KJNgzE0OOpYacGuUEMO5aCeYs9j4wG6xjhJQ9cg?=
 =?us-ascii?Q?L7LRuMXK3hBPByjDSsq3SN25sXrh6U1OHqD/VOPPhdCpXbpBkZOYXRE4FdYe?=
 =?us-ascii?Q?Kdc+Okfxe72RpP7A3ggepK5aNKSGM/dmSv+OOKSO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa7062c-46f0-42bf-5e94-08dda2aea23d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:55:08.8143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a04Hf45z4n/eB++QO7axApIsXjPgmvKXaxX/UA4JkAOQmblZBvOraI28FawSOjLVhw5ALV2zb8WdsrFBa4yEoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7891

On Tue, Jun 03, 2025 at 12:02:30PM +0800, Meng Li wrote:
> When verifying watchdog feature on NXP ls1046ardb board,
> it doesn't work. Because in commit 7c8ffc5555cb("arm64: dts: layerscape:

Watchdog doesn't work on NXP ls1046ardb board because ...

please wrap at 75 chas.
> remove big-endian for mmc nodes"), it intented to remove the big-endian
> from mmc node, but the big-endian of watchdog node is also removed by
> accident. So, add watchdog big-endian property back.

extra empty line here.

> In addition, fsl,ls1046a-wdt allows big-endian property, so add it into
> compatible property.

In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
property.

>
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

after above small fix

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 0baf256b4400..983b2f0e8797 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
>  		};
>
>  		wdog0: watchdog@2ad0000 {
> -			compatible = "fsl,imx21-wdt";
> +			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
>  			reg = <0x0 0x2ad0000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(2)>;
> +			big-endian;
>  		};
>
>  		edma0: dma-controller@2c00000 {
> --
> 2.34.1
>

