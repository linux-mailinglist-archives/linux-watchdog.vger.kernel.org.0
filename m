Return-Path: <linux-watchdog+bounces-3299-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63115A88753
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F90189F5D0
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 15:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BB82750E3;
	Mon, 14 Apr 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g7na2JkN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68327464E;
	Mon, 14 Apr 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644347; cv=fail; b=XIxEsqozGLsrcsYAzlArvLm0aqizi00oxJV5LrF40OD6kYILym3r4tA2eDgEOmxFnfL5VOCs9Mq/4OoicxSQxax7mUUFjtfztuzMX+ptJBPF7gg5f9WJ1snMl2935CuZEJOa0q6WMNnKgsmj123UJT1xpBMX7YhnXWX1T4XUg+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644347; c=relaxed/simple;
	bh=fJr+D9tLOGrFoB/q5AU3keW43rowXv3QgXcDVj7H6J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LDTCzB6d9M953gt5eiaAjmCIZFFG2kaW1qWdNfrr8O38BitpXxKqv9/yYtf9JSe99XIsYBClU+62uyaYmzjtNGHOcwcXhMVY+kj9EyGjvb2uF6hlv4ENNA7G2mBdUgXAS5SNcwsLeKaQIKVrmb+YNdS5UBQ3vjS+kMjMUcDXyJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g7na2JkN; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK8H8VDcNuiFGZm/inNY5D4wkpA/SELNpZ9cu4RlU8XPgw5lI/PecjD65nBPklfYMDStUGjPZHFBK+cvYUObnYqpv3KVXYrrKJ0Zts+rBtGdgSJXG8F8dvhSlJrkF7VcA7QVa3uVhvy4H2V42H9FszQYu8eqf1mPKsL67GXU3+KLottz5wQKptrTjxdTUlYHTEZu5uX34X3qDaGNb1W0VonHCRkc5uRoOtouISRdHRpq8Qqhc/TfSRcFroMJ5/kxRzDLyU7X6HQg5QnWGTznrecKjs926tBCcMb5MyYOtB/XmxP4m6h9Y/H29AZmrVlYDRMhIIHKySAC++BkElJBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfUQi3pjQeIkpxM9t1dZJOmIQgLeVqeZe6yX0IxvAtM=;
 b=c4ruryZz8SZP2RaBVBTGQzaIYUpHwQPZ1JYh5cXe6ukcay+IXZ1YFpKzoSgXg33sNahcD7hJTa92aPb/LgfsqN5tD4CDNblm2hwyATXKkcMZDcj05JtPKpkc6QNSeACIAyyGkEhVWRu5Z47rUjJN4IhrQFtBZHfQbVcX4bub3wFfpzXxXkxeGop6AgQkiiA/6k41e25TBr8qy8KPOQlnSFzCZ9306kJZSU5tc+eJCmh/irZQqm0I86mPT6AWuK9nS41ze3UH1/NYiIPSVmPLZ88RlRKcJKYS77Dw7rhB651neuuDnlXz9nQW1yuABZPjRtrkjncZoL14xKCE4G5A8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfUQi3pjQeIkpxM9t1dZJOmIQgLeVqeZe6yX0IxvAtM=;
 b=g7na2JkNdSSZ8HYLQ+pwk8WQecF0HbXbAQbKDqWoj0dXFMfnwWWhYDQ5cC47dE2w4E3CedIqf+3CnUPGiAVuZqyOcGAcg8a5J7RPkrn6JBCEFkWpfy11IgeMuhAVhUzKGbbt84ZDnlDV77aSIR55cuAUUNYwHxcqOGZXqhOt22eUxV4ZDIMHknqrGu/4BijmL9rfOMIyJiKuF03KrhmR24sqMhBy37kKUc2IFlLHP4uyz0IK+h+vKdyRHnZcyT3J/H7sm9UbWgFyViEEAZOUX7Cqg1a5gTYb6YFvDdz7fuhCsgHuGxvMhkGG1YU/dJVb+EhKp4uyePCesiTy16fQIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7623.eurprd04.prod.outlook.com (2603:10a6:20b:29c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 15:25:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:25:41 +0000
Date: Mon, 14 Apr 2025 11:25:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8qm: add system controller
 watchdog support
Message-ID: <Z/0o7J2JMTagobih@lizhi-Precision-Tower-5810>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: fe755d4e-1b67-44f9-3533-08dd7b689e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g5TTqkswkBCD4l/9+v5i/wgKbbJb9AW2pLh0/5k2XeylY172+cSw56dcv44T?=
 =?us-ascii?Q?f2imAt6xFBLbehUU6xec/IAE+VMmg58oFLAFhNbD58+9uUGLHZ3E3yMW/jfL?=
 =?us-ascii?Q?QaPs7z67a/PO6sfP+od9b+3uwZiUJM8HN+2LW+4pgsuYpjWOBxC2HcBgDxZJ?=
 =?us-ascii?Q?x7s0HGVaa0XRix/35NjCX2qFBg1tLMJGmzzttyIYBbhbbDBVoctdPhFb9iRF?=
 =?us-ascii?Q?7LLs8+2InkUS2mpGhttyNCxV+C7ZOHhmQKpIpVtW+ZiaL6X+dN2I86/wVPl8?=
 =?us-ascii?Q?J55G03nZHwjZecT4rmwP2wx7uQ1l6aP4QAHT7Swk01xfWfPwm69r8Wmxy9NW?=
 =?us-ascii?Q?K5vLtodTV604D+TIIjoF8oEK2bFvDXGBAuG/g5+jsnNX4exb+nrYgoxBcFF4?=
 =?us-ascii?Q?1pL4SU2qWchi3E3ZpyWVyRa6EnLvIRyS7ZHjh9xkFM2VqmUR1JTzujGUcJtg?=
 =?us-ascii?Q?DVS6fENnfYe8bEhFwdYEqg8yu3JcSvm3UE3sgAkmH2FPn2HC3KTScYoH3wE9?=
 =?us-ascii?Q?FafZwNkSTzB98xdXQl0H3vOAypi9qDRKscC/ie4kSwhWJDKGf+qk9GOKXZ3X?=
 =?us-ascii?Q?VOHzVL0VWKpbnZJ7R3nf9dcCdSm0QXe4pw0OD5vNrFCRMItnykx8mr9LTCXU?=
 =?us-ascii?Q?MSkb3uK3AdZp/UDoyJQaSe8lHNgaeukyo0/7tn/dmCnSAOl2bBHIGH+kZeXM?=
 =?us-ascii?Q?BUEfDO17PD7gydoSHilsS4BGlUOS7yaR8EGmnVXOEGHi7iNlsy/0FPOJU8ws?=
 =?us-ascii?Q?Gdv23XxZ7vd+mf1qkvOVBib/kxu6MfnMvmJONG0DlWSNojG0oeT8Gbkoxv2r?=
 =?us-ascii?Q?3ZpcWcue46zWVeKHxTvk555SUF7Ry7azkgQsAh1VnUIWPA201pcAzz2ZDGmK?=
 =?us-ascii?Q?8itrySLVNsO8lU09eaVp/+uBSZlNFqV8X8LEuy41au2VnVVhuq09hwmho0n+?=
 =?us-ascii?Q?NRWZLqgzHl3XMUKlOq6i2qC6bZ8PBtLwNEYcBUwzZJHaF5N4f67ixw4b4nvY?=
 =?us-ascii?Q?vTSRLKGiOoTnEgO7ToZVOMhtnBZjSk0Kf3yTZvW+LcPGc85XsLdQkldJAvZO?=
 =?us-ascii?Q?GPJ+wNgPdMBL0/+h4m0xgpiMGTSvYVhomkMtC4foVMJytVbdIoo5twnqIx27?=
 =?us-ascii?Q?KPQVPczWrvLnTsY9P9ZOCjK6B1zubFmfFflVTx3JXE/DZefh2agz+Bl072L1?=
 =?us-ascii?Q?fIkdd4Y8OekPLFRHHRRxXivLo0PZJ/SAIqLWQAMeNMkypDxfzM062Bye2HAI?=
 =?us-ascii?Q?W6SA8HHzVMIBrHcekFiWzGJYe4zfhcFqKRgKkd7W0wghWktm2o//EKjJph+k?=
 =?us-ascii?Q?+cVQCR73/pIwgMZDH4JAU5R+2iW4XkOelVdFw5ug2LgdYGxHdd5jM7lYsPAQ?=
 =?us-ascii?Q?US1vRgdmYWFQlTc9yOhFJAnRE48iBlAxsaiIPi3tI8091Cb5wvMqWt4hUCLM?=
 =?us-ascii?Q?+2z/YuHh/QYHLLC2IKdiBd575P81j+clYTkY2BGGT5UXkN44TYPqRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?auzEHRjXCLAsSO0hXuu0A2XRshViAz7IcfDs5TCggrvQEz8Ray1SQxQv1ku9?=
 =?us-ascii?Q?CAAP7UrllSiGP58NJtYMeEzARpN7TgmpbL5CtRzlzBZ3oQrR7xOaRvNlq9DQ?=
 =?us-ascii?Q?UKKcNaalrFbW5R/4YNmuNNAx/zlZmjmNPDr5nvAXgtwNgJXgDy1oDErbRKnu?=
 =?us-ascii?Q?9ZEk3wmrZkVqdPLaOn5ylRpjfvV4vkZULJqRzxKMhOvvmMh+IxtaJhx5macA?=
 =?us-ascii?Q?wx2eDTLNV7+PkQdZE5AAEAxZF60RXpX+u7LT6vAZZLm5eA89/oLkNtFjIXf1?=
 =?us-ascii?Q?jvThSPgn4L4yi5R72JaoHb/WXxghqcMd3ocxnPcilW9rLurNJIlwbaCbPugi?=
 =?us-ascii?Q?730OszgfPP0WjfNMnvEXA1ZB6Q1/mL0lOILk5M4yPPOd0dgUSFIQEIVEdUt0?=
 =?us-ascii?Q?o+QCZn8NJlJnt7TiwiEx6xaOkXd3vsWgcWVs8wBQ2+hZUNK2fAl2RG45CMWJ?=
 =?us-ascii?Q?UaCNwW7CZINzbb3cQLuBFk7nEyUoCUMepPEayfSJbaU1dLRptVV0KUZO+Zl8?=
 =?us-ascii?Q?0iDjuEli3f88vgFG4tiaPvynOTuZwTwhJxGuicM7eWd5aKFBbw+LUYOk75ah?=
 =?us-ascii?Q?en1kNw6m+QW/Kxpr25XbmZOuwbZTOZxaLoLAeDrtRuTR8cUl2OTUzaxRMS18?=
 =?us-ascii?Q?eoJxDr3FhAmvvUwuuC1aJpGRUAuCGLP9jMR2FeUiI+PDO1DJaeIrc7xBZaZu?=
 =?us-ascii?Q?FOYi/bx9rMcQIKpLv0jRZmdJ+/vDMt6ZI+zuhvNV1pf1U3f6OUCcGx7Y3CF8?=
 =?us-ascii?Q?8mtiP8jlXpntDyZ9vTWr0z7ibVXVsq1BTBCbCwDjJgvm6kt/vysm8AkwxeZN?=
 =?us-ascii?Q?XSBlgx1WNfXiBk506BCGSrfuUbOFpET8QJIcnDngeIHeVFpIanuh3OQab7CZ?=
 =?us-ascii?Q?BRaYEvbtpXQBlUi3YuIT+wGCevcL26HqYw0jIcNJc32WSHVEiUcomO4Z+1+Z?=
 =?us-ascii?Q?y0ZF8inAZ6Jw45AoQ9yV/rM9fWTBeAoyM3DDTNEz8DFKCw90fx8gSmeYXnJO?=
 =?us-ascii?Q?qs06Edtmt0zJ9RlwIQgh9vfh1fDqh8bwn54nWJP4GtymF/JA+r6QP5ByP8rB?=
 =?us-ascii?Q?qNsqEjY3XDRjY+Vn60/wwEiQjj5z6DGVcvGPVnrWUa4jaGasNpMVCy08zbnf?=
 =?us-ascii?Q?sAkGRLB7LLf9WH2DivpfI9lfaPqQlZccsA0AFKkNW6ap3cADxwiuM60y1IHs?=
 =?us-ascii?Q?dspM+Wh22/mI7wwPAPHobfMHmUJuHS+M0yUc8bDxOc/NtDzaHeCofLQa6In1?=
 =?us-ascii?Q?44xwiMr0iMFQfCmHxJl66u8FAtvHIBEaYZ4IiFQ9wJzpgnnBhS5Txe19Lpkq?=
 =?us-ascii?Q?Qmq+Sq10iWUUUsaE+LvHXGojQd95Iad3x10HqnTMcsdIS3Q3+uwZIZX/0EUN?=
 =?us-ascii?Q?1nTe3cCCwLhfZGOWfdB4clbOySHbwYtGk7fzds46O0wtnxmPc8l1iyh+sgIv?=
 =?us-ascii?Q?96FRDp+/s6Y3VnqOkvvOsx5+MBAQwVfdNAT7A0dZzCnmZZTZM7GS6Gp0M91A?=
 =?us-ascii?Q?TJXEYyDmKnChI7CMzKzSTn2Y8OBKETCz+PFP47/HJ52WaeSrQdB7hAOVeaRx?=
 =?us-ascii?Q?MlQ9zB6EM4oiZzSKnm9mTdhvl4Af4Zoy8nw6JLqs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe755d4e-1b67-44f9-3533-08dd7b689e23
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:25:41.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSg/YO5asntyQniXVH9RP5KIZro//Shy3ApyptzaCsH2xdPlokeKWI7BsArHBFXrxkzvq2VWxj1PGajpKA9ybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7623

On Mon, Apr 14, 2025 at 04:57:25PM +0200, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8qm.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> index 6fa31bc9ece8..11527050ac8b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -356,6 +356,11 @@ tsens: thermal-sensor {
>  			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
>  			#thermal-sensor-cells = <1>;
>  		};
> +
> +		watchdog {
> +			compatible = "fsl,imx8qm-sc-wdt", "fsl,imx-sc-wdt";
> +			timeout-sec = <60>;
> +		};
>  	};
>
>  	thermal-zones {
>
> --
> 2.39.5
>

