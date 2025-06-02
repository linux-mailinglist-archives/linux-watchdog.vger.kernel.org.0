Return-Path: <linux-watchdog+bounces-3603-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3FCACB01F
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Jun 2025 16:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE61B17A012
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Jun 2025 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7AA221DAE;
	Mon,  2 Jun 2025 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I7MGl85P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25911DED64;
	Mon,  2 Jun 2025 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872812; cv=fail; b=ZjW+4LUVo3XwFTceC9B7RLudoggCMQCUKEDGdIIEJVWaXwzdZv1r2EHUV0yS8gy2G5nOkHR7hi6lcNNNFxibBhXSSBLyXZCKe1gtoXnIkjyuaydgGqssrLEC9hPv1Q/CHEt/H0GSnuHrN05Mhpc3ZKLLOp/vYZnOtUPE8j6YhEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872812; c=relaxed/simple;
	bh=P8F+nZ/io3tldaCivKDT2d33y1hE1BMa7NwaeTEqSAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ITYXzDH97YsVWPDQj2sMCd+9qovh6aIpBGZrC+xKNVSPkr/oookMNhOUxfqGidVrqv6yhtb+2UjGtiy2ULzlsJgSSumE759vyhd4POi5fgT0tq92FBEC7pvtM9spbi0pNCvQXO5xchhdNFUOPpfl6dBoCO7tgjaCf2v3GlsxFO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I7MGl85P; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmY7sV0HTpteviKLy3jTpToI0lNFHqTUB/Ijg0QG56dWmnnUhj8HvP+l8F4lk8vcVc3A4aQJZFPF0JuQa4FlWjUEsjJPXdWmk8LFMNtRp4qV89gnXi4njMtrFd71ijmEyL8DyemCWxu+prxQ8kpdV6K/PMwlfH8IKMG/whaKsBqzBolMtR8O8knT+50c1uWEREVaDxlTnW1kosMzJUx3vit0z0XPutV50D6Qe+WXPB6UBP84t8PxUetwNxs6iVpIMRAj3ISC6g61t6vooYSsGjsqArh5QUcptRD2YeMlqwOEPEG2cZ9bdOq3yTwoBGR2xIrFc5VhyEaDC0lKBcJE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubuq1oWGFPygU9+kkJnXTyW8EJ9fbDciR1svnYc67NI=;
 b=Lo4rUYs8VlELqT5yO7av6bw9P9AWT2IAHFrHLpNpypWgqCooff55Khb9+oehjQy6XzhJ7G/6ON8RUBky4BVOB0HBOwo0iio2C4nF259k8bAIJNKsvaSdlHDThFWh4GPCTakFgczTUfarBR2bitoqQfQ/Iy4Fc94KArc0S8jc76FsNcBw1rs0x7kgmPQfdtCb340e3maDqHgj792D9oJUZfaF96QG5VAMuj3Pp8RmbtCtnBSwQU5p78SUjGoCfAr0A0JRQoasjSziXxeAVIj0TaAqxbA+0lkcuvLAVBcuq8GkEL/NJz2Qp3qa2QOnSObYRweCBx0JnBdXxfOjkCNvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubuq1oWGFPygU9+kkJnXTyW8EJ9fbDciR1svnYc67NI=;
 b=I7MGl85PfUZjtW8sg/YgCx/YBrfdmSohvg+gaWfELVnc2XyFm8Lw6myct3bWR2ZJVVQIQtM6DiXTfqq17cI4O7rBVEdPJ5B8i9j1ONrWdJdkaLscso4JlAyKFRgrFw3QYhNtkuNfjGgxzd3Uze1nukOKfal6/NjNP9uZxpP9f85LjHXqzS2K7yji4jKOlwd30Zu3+HOx6hJUOo1rIOSqgakh0qOX/EGfexRF9ZFt6j5oIKCNjIJMq3kgx3ptS9lsaIEBiyKr6F4vAGVx7Ulfk5Ishfzui8VYBuVIOEg2XsxVKn/MxnTSg8FaThZtpsEoHOhabsaAFzldQPGpakOXzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10761.eurprd04.prod.outlook.com (2603:10a6:800:27e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:00:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:00:06 +0000
Date: Mon, 2 Jun 2025 09:59:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Meng Li <Meng.Li@windriver.com>
Cc: imx@lists.linux.dev, linux-watchdog@vger.kernel.org, festevam@gmail.com,
	kernel@pengutronix.de, s.hauer@pengutronix.de,
	wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
	robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH 2/3] arm64: dts: layerscape: add platform special
 compatible string for watchdog
Message-ID: <aD2uXSJV9vc0azRi@lizhi-Precision-Tower-5810>
References: <20250531040213.2589292-1-Meng.Li@windriver.com>
 <20250531040213.2589292-3-Meng.Li@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531040213.2589292-3-Meng.Li@windriver.com>
X-ClientProxiedBy: LO2P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10761:EE_
X-MS-Office365-Filtering-Correlation-Id: e265b823-69af-4506-0dfc-08dda1ddc6d2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?pgSWBlKQagjcCnLVaTvJecIie2LKcQl4ehU8Xl8W3V/nqKylAs7jXOZ0DNXi?=
 =?us-ascii?Q?t1zSk715TyKtWNC8wb75JKCrh10YpWICsCrqM2C1dBhsCcJBY7TtKSb0WJ7/?=
 =?us-ascii?Q?AnwVTEjm3lvQCkStq5ABP03TeYWbXvxStaKctz9cYWVL4O+IkRTBvgXp7EeG?=
 =?us-ascii?Q?ZoBoyRahTOyi3+Tp+d73DbN3gB7XWDxqbuuiCp0hOUqbWmjx6Y/4pAi9ij3Z?=
 =?us-ascii?Q?/V6n0gQwLgiIWqSXzh5o7JHnNUv19vbUiXsDHKTdgSfrTqJMswvXAvtsTnOe?=
 =?us-ascii?Q?0SlgurIIsHa5XQqlbMagJJ1LBP9sMIHksZS9ADJtzckuW9EYavbN2WiGXS3C?=
 =?us-ascii?Q?Cu0VMNMxqipcg7/FwiKJYqImKOiiIO50IxOVEXZFxe/b1bkKI3UIbpvABsiN?=
 =?us-ascii?Q?y9euyk5jBCIJsntVSwBCXNkzH9tX8xUovk3Pga9B69FdhV2+m1C7TgFrx1tr?=
 =?us-ascii?Q?Yz3vXiOlWkXGrhK2kMigIe8yIVJs58AXXAHoR+TMDTmf3WsnGE4OKCb6PC6e?=
 =?us-ascii?Q?nB900pfEQ6QJOAIay4fssubZE2d8v8BuBLFnGO0JXSgwtJXweYFwVUTlfr8T?=
 =?us-ascii?Q?y80lE+oQMBYKmNrJWEqXAEXVWl3ek7rjo7J8HY69OuvsTDHM4GhSa+9+2vhK?=
 =?us-ascii?Q?m4R3tOEZsKDsX4Y+bJwiRQhJbMLRNZYw6iCzJab3bYjCGJvw+DDW67S9/MpR?=
 =?us-ascii?Q?Fzq24k2U3QKMcDD7IOl1hDGT+OeHRhMFsozDeBrA+/eFQNxv0P6d9zBrkHWZ?=
 =?us-ascii?Q?TFDeqfaZb4lANH6MDM6r1R6BzLZbnsfEcYyyM94is7G7I5zc4oBNvneJlFls?=
 =?us-ascii?Q?Lwr081GqneLHwAPx6bubtEwbtmgHA/OHCVOHMSDji+DbKhVKhsbJtXBQ8oAQ?=
 =?us-ascii?Q?42EaSYm4rcaoB9eQjATSgnJw9RWwb93F1ByYSwnt/Uly5pUBDQ56wygqlNIr?=
 =?us-ascii?Q?y06P6O5o7UgFVQX4EvLWwAwbGsGbHxDvv1uKwWICSC93FknFeV6ya7MjWxsE?=
 =?us-ascii?Q?bd80L93yi2DoFdbpLM3KNUqOQtNifl/vlf00J/Tu9QQmc3pN5V9LaPJ7O8dX?=
 =?us-ascii?Q?e17/btH4297RcxpsBWQE6wo35tAUv4uCHDL2h4XnTsng76oCorbTwN2EGYJw?=
 =?us-ascii?Q?JcBkVrpXcbrMpa3jcdAhA1gDqrwydysJAJboNY2FPlvRxEudz6+fwTyOCX70?=
 =?us-ascii?Q?pSG/htQjuUayzawLNimD0SRK0QPgfq/xrzs+fo7wPZ1LizPZA2uDD8vUEa+Y?=
 =?us-ascii?Q?WR1zd0aUDcaPcjv2qZVQKRf638i6AGHKFA13XQchRuGoTl84UiVK5nsYWGVy?=
 =?us-ascii?Q?YtVBuzZvRCwoQBE155XIUiKtBjGhVISpF1PI+n1sXWx4tlGkLZKbM5053XIn?=
 =?us-ascii?Q?eNg2XNzkFpqewkXlnQKi6Osv94/yp6aWdMX9jPKgqM+G5amzgfKbcXahgt1P?=
 =?us-ascii?Q?nnvlhByRUt9X61NpGYyodB8gOPXp8gsdaqTG4nBtFL3pdrJbfDs1Mg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?i5J/vjASgxFPDrigaEy7XOPWY6YGnpBR725KwDPx8KTyvCl/TWnbVyx7Upyt?=
 =?us-ascii?Q?heu4FytMaYe6TZ3nmRUaHGzu3H2CYMpQqdm2MVjcbb9YsZPLgyLEDqcJAa+h?=
 =?us-ascii?Q?N5jrV8tKxXar9XzIwRMEhXJzKlJHzhMJxSqBErrBXfjICjpVdlsSDVKiwjxU?=
 =?us-ascii?Q?2J0F8MVripT4zXImlNPTQ7nK6hUU2YD2YbWuJkC4R+l5/MBOb/seth5oh5Vn?=
 =?us-ascii?Q?Dz9gpMuRgw49FpmrUTIhlUUcK7mjIunS460moWzcvfZuS01wWahR/zrR2SL1?=
 =?us-ascii?Q?r25sYFgBZiYBxSx6ohf82Eht3hwNtHwwtIxiS9pLYL8gC5e1r8vi4Y6HXoE0?=
 =?us-ascii?Q?eFlZCi/XeXxf7YFE/gdh//yYwsl5BJDY6GzYOQgaVIcLeGd7C5ki4QoHKL65?=
 =?us-ascii?Q?yT9OiHceUjT7ptES0pLT1Pa/EiHF7X1hmwPINYKEHx7BrvKZVZ8xQxj6PqnE?=
 =?us-ascii?Q?c528TKHuVLDiiICZ49ZnXZAc/KYpI8sMDZemD0NQkMy9naXJgZ25bg0ZWiXj?=
 =?us-ascii?Q?vOKxqXCMzW9ZpSqKCsKV8+a9HD9TsVXeswgQT09pmkh/ATOVoLGsb7FEG9d5?=
 =?us-ascii?Q?DsVwXUP1Wr5Tq9rt1GGWkoMKOOOmtrbAM+xoxDtI0tdr4XGoOmyLzw/+IIdS?=
 =?us-ascii?Q?4PCNuhUrI2txnjPF1mtwZfr/7bqU/e1bHKp0/u3G8m+koxnS6CEu+iwDY5nQ?=
 =?us-ascii?Q?PJq9VMgS3XAq7bCn5oCTChaZfExEAvWtt3l7auVoK3GyTnyCraRMn2JVXUfJ?=
 =?us-ascii?Q?JCA4X6GDnjk6qmEy2I1hvFPNASx5eNuops4ITHz6YBU/U5/jLSNN6USBs8E1?=
 =?us-ascii?Q?9OPGd5nGRt3Eh2UcBbiS7Y3sC2sAl/FEve/ygfylTpcPMWpKA6+ohm65N/0A?=
 =?us-ascii?Q?gJsJ0k0HzbAFdBQVSvVsd1LzOdIf/9TnafUAdAwt4l1zCdOdhE3u+MSIg8W/?=
 =?us-ascii?Q?HphKL1/CcffjA2FwYOPwyqRe4CyYxvzgBVylQQmfWWgKJ9/GeoAtRj+rX54s?=
 =?us-ascii?Q?+osqU8V0g03SBLseSkAM8bq8pVhUDZH5qbTcHNVFY+ScCRepsgV+Fgh7Cmj2?=
 =?us-ascii?Q?N2cCGBdO7JRSlFSWP1BUPZgElbHUZWPMxNbdAj+VxD8AuQKgs0bFom9l5pKD?=
 =?us-ascii?Q?ejX3JN83n4yt4OpktLQCnZ/B/GuM1rR2ang4eVoaE4ISYPDE8lLWqdS7kh4t?=
 =?us-ascii?Q?a7iu3eULF/r+0whpqDwHePaLDfLvNwTtZ9zI1JmlTMfOksZ248I1TuPUF5BE?=
 =?us-ascii?Q?ZsJANVdXLoUfHD/HzKCVD6TQLKlstDZjwYqkVYZd0ZRBB8Xynd61GUsWTCsF?=
 =?us-ascii?Q?6X2qhn20iu9zHn3zHWYOdAmFoZnddQyehmyEWvb5GrItwI1ffhySsm2HglKi?=
 =?us-ascii?Q?x4ZptZ1h1H+BEebuQuvvGdLkorj3ZQuFAVptoisksVK6u3RkWeajmxEoLFaf?=
 =?us-ascii?Q?dO0Q3Lv8nm/5Kk0NPjYU8j0ZNFtCDOxhAR05zwYrY4obXcd8QFhzfxWE/uDV?=
 =?us-ascii?Q?1hWEaJUUhK8IA0A5tz7KhTtadXC8jKg1ExekWXtyMi+p0am9EU3skhS8jjOu?=
 =?us-ascii?Q?n4mTblSaQeNUC5BgPmvVGpCjf92kbRmHOrQnqsfE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e265b823-69af-4506-0dfc-08dda1ddc6d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:00:05.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAau1zJ4tAgQo6YGYAchQiXNVaEkNPiANHZzGrQ0+xgmr4pqnlhMzQeacxA+xSWCOLClkdSJ8MZucZlRQjx+lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10761

On Sat, May 31, 2025 at 12:02:12PM +0800, Meng Li wrote:
> Add "fsl,ls1046a-wdt" compatible string for watchdog node, and it will
> be added into fsl-imx-wdt.yaml in next patch.

This patch should merge to first one. And move binding doc patch to first
one.

Frank
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index d1c64d97bccd..983b2f0e8797 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -687,7 +687,7 @@ lpuart5: serial@29a0000 {
>  		};
>
>  		wdog0: watchdog@2ad0000 {
> -			compatible = "fsl,imx21-wdt";
> +			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
>  			reg = <0x0 0x2ad0000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
> --
> 2.34.1
>

