Return-Path: <linux-watchdog+bounces-1459-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E89494D4
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 17:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45E181F2255B
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6500221105;
	Tue,  6 Aug 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DDAWHrvR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C96F9E6;
	Tue,  6 Aug 2024 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722959398; cv=fail; b=WF+fP7EVqAeih0DPxzitKyI0WhunFg5WNlWsdKz6psS0l8zJ5FmlRYf12xMqnl05iOprBsn9mEuvX0gONzXTZOPO9rOIejHnWze+btd02cqZSGRH/eXwLQa+EWfFTe3pLr6zxlFp6wPhoM5TfI6j9VgA8LVvKHgwgOCti56hKUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722959398; c=relaxed/simple;
	bh=xN4iBYlRXfC3nR0F69ESQDNZeGhOJCZt9SSvt3YpHsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PsMyWn3YpvPrfMeDDtuJS7otWPi/5dxHYLI1igbz/PHt8JOxO+wHRCrRveF2x1dtLpIDvwpcZyftwdmfaObJL12f/qWIo3FFbMOKdLejrIaE9e/1wXXCM8FriN5V1mLlEb0OywlfEiSsElcJKhxU1ndvEalNL0hAgYxR0a+dA8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DDAWHrvR; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aiw5jl6fOnYKqPymMyyijs6gh8yKOvoIOm2E8OvPVUgiJl+g4Lo9azTnWktP1LIRDjUrh6PoVxdrpxZcb8ynAR1CwLazz/Vi8Z0k78lY5CD33zfwBTHnZloDIHOWRIB9kp6lM69632cZh7BfrbCvnb44iQOsVW1ZT542eATwnQ00/uv5RQ41dN1g9d2LcDERzm3WltXwGxb62fc/t/hh0OY3MydL7AnUsECwS2pJdvI6vpG5E04zaI//f3kPOmlOoHKQASEhn4bVFQIRzjbEiESmyNhaNVnJ9nYZ81eYXyxi6wUz5PNscMRcHDNb+nbNmkg3uPl/OoeG2es0d4HqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN4iBYlRXfC3nR0F69ESQDNZeGhOJCZt9SSvt3YpHsw=;
 b=UMGiA3dDSapKOaWk/kHt0ZtGTg2KopKutPRNyIKcCXUGN1gYm5G6CtYZ6P1Lzsb47teSuWUz79G1fLmuodutJG8OVwVQFicqLlGTNrS6Fnxy7UvK7YT/w6fg6TG4wPgGjqDIENA2DnA4Dsy7YY7/YLbxKpTvJWf0GAscBhRJmd+D3DqGFEKmLjaWVHVnrK7olkfRFzlypasaz1j4TGZfM+/HT1gh881WdqPcjv3Ng+7Ah1D176lpDepTH4D8j60hNGRijNZNnlXKILm8ri+OIEK10NUNUqIHr8PSyVSN/ZSfyUsYgaE2svqW1k9pRhK0BAxRelVPMSMa+PAG5GlSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN4iBYlRXfC3nR0F69ESQDNZeGhOJCZt9SSvt3YpHsw=;
 b=DDAWHrvRuAbxwyV1H/pgyPm/wzqc3Sj6Eii+cbfzh1RfM/w6apCY08mCerOG+9zMLlOzW9l+In4miR0ZHtl0ICzFov14FkGTld7lEAd1cuBb0Ud3B3vzh/0h2jyjZZfWJCnZxiDfIlGXcn3xuwk3UG+3P1uQnb+7i48cHWSJY8V9hYOg2grQ7oo3tOnWLtM6aX1JGZX2xDoEl4pem20Ns/sth2e0w4OzyQaqDsanW0t+1V7Q/YLa0KUGRJb0YGtlKh66RciFOqNDXo5JCzT+8OgTXyIy9/4ZupZ+IkirZ6BwZm0dPdcbolaz+LH/GrNyzuh621D+6/1+6TxJy+EApA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7784.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 15:49:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 15:49:52 +0000
Date: Tue, 6 Aug 2024 11:49:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
References: <20240806103819.10890-1-animeshagarwal28@gmail.com>
 <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: fc87b3df-46f4-4e65-0d29-08dcb62f68f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LONWjFwx2dmHQoCwzHvkxReV3OqwC2lp4XmvZbNzNykqJ6Hb991xOFvp7vio?=
 =?us-ascii?Q?XS3nB1+3d4V2p8C8oxbvSUZ3OD3/2kRFR5HIfoigDGk+MHaqG0i83gnS1iIZ?=
 =?us-ascii?Q?Y9Jal7AC3EKmWSIB8Tv2niryRFJgfTSiYwI589KJ0n0h0fQPO50TO6Zs2G8o?=
 =?us-ascii?Q?WNBonNMK8P9NUOLcE7qMxk/2S49Y/SDl6FUVxrkyJlLLaWJ6FucWgkSxfFg0?=
 =?us-ascii?Q?ZcF1eLkKAEw84prmvy93Qw/DO8YNsPjXX0DGbxfSdh2IALtTocgx8emJH/yI?=
 =?us-ascii?Q?05YZ8R/6OxMa7RWOPAOR6WYhkeC587wYTYHpRyHU/j1Muo35R9fkEazEvY61?=
 =?us-ascii?Q?qkfIhDBp3HNT9bZ17QkohBMZ6pxuW7+myFcVq+G1HJ9M52jFE0S2PeeGMO3y?=
 =?us-ascii?Q?X+mvFLGO4nDSHM3Fn4y5hSgX119NoivAKO03cOLdP30Rz0UTKmh52tj85CiI?=
 =?us-ascii?Q?Wzi7c/cpnh6oNUTnre/sws1hwuNdUEKePX9qrJLGmdlWwmbAfC/f/xDiGC8B?=
 =?us-ascii?Q?PUDXvCkM18ykKLH/E4hhOa8gRUlIGKi/yPyumbeAkKO2P3xhUuCyjYDbOc5i?=
 =?us-ascii?Q?ADUhaffVOI+/qSr9n7BbkU+ZvAvc5gRBAK4ZfaLKvbqQN6g/0CPBK5BkCCAs?=
 =?us-ascii?Q?eCLPoRaacdmwLKBi1LgCyzMKXBQF/T9PKKxe/HlQriZtvCMuPvtQER9SwZQc?=
 =?us-ascii?Q?aCEByfmj2N0ZCQeD//fi5tNlIibrjYpVPic3k883sYFLsnGzr3LRd+j8cpDG?=
 =?us-ascii?Q?/Ktmz7/0Vmbg3zOTlwTG7u5qrSQq2PD4v9+7jWYMD8r+IR6L2wYDHZ3Y5Oup?=
 =?us-ascii?Q?uriJckXardaN53PMtfpie7I1nVAPJqV8YgrpzV5Woh8imPPzdjtbGBhFmfsw?=
 =?us-ascii?Q?/zuM84pgkBsBAWpUReqfUpYYzYIn1khZwz+opwcs07b9o/EiQqmY4hF0aeZt?=
 =?us-ascii?Q?c1a+1Y8nIyaKHQTfk349PROerfOV3ga9LLzJHUQp807bLWMWMZYCVjcJ5gex?=
 =?us-ascii?Q?CplpLgLwREbxwB87lSCsZItW1dkgjTguaclp/o55E/3WrJz9fVuWWzWjz7E7?=
 =?us-ascii?Q?Ja7DRt1hltrdc/BSuqiQ6aDaT8KpSW1uOCUTvqkjA6xWaSCegEIGTZPV0ppA?=
 =?us-ascii?Q?Eu23dJGTDvaLt2DTzBPH/U79jkJ4wOXTZvW/eeUxP9CdVqQsUPQOkeZl9u9U?=
 =?us-ascii?Q?v/Mf3HgLTkCniESDoVRqFgmLW38JKseO2rad1QjO5cfHdYmRQTlqQ8tj60DM?=
 =?us-ascii?Q?IbYfQ9xXcfT7iZAIUeBMiJHqfNcc05KBJs8dNjguqNc11pp+NLwAyfLXOScc?=
 =?us-ascii?Q?rBwM789QauwS8UaFDHR5owjzQXA1VPeG69yWPNX5Clz4ODhaxJnDNQIoSmcj?=
 =?us-ascii?Q?wAn8TbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n/HLuqo6U0CS/GdqLIhINUYwnqZjRuXt03IHNrHfkE93cHCtZFyl9G+n2zGN?=
 =?us-ascii?Q?vqUQ0Kjc89x4+/LpieliRd/Z8rTlFsD5YQRJVj8/KJku0dMt+K49xIaRG1Fc?=
 =?us-ascii?Q?RLlplFgxOQl/lCBXkrmjOw8BggRPNt3tKxBUxYU9E2l+nZkoOJMtJup5tUOf?=
 =?us-ascii?Q?vF9TVnxvBn5D8DcBs/f2y5QTAXhVuwwuhwmVA3VMsG2OWyt/X1jkt/UyncZF?=
 =?us-ascii?Q?CQ84QDinR+/q7T9EF2zvrvea+8QdTSRjVo32HkfIaqEd5D5y+8HX8mgdDiD1?=
 =?us-ascii?Q?FI9ncez+C1uvv/PjcbwvDZCnWYjK+wRCHHhfSMwKdUw+tKzZ6R7o20vhINDT?=
 =?us-ascii?Q?pobymIrUmJOWqu1MJ5R24LmxJBRgMzzt1wDYR4w2siTEMt6kOozrS0zYBukT?=
 =?us-ascii?Q?foXqnjaB+v6q0iFloQ78iIU9rbz9kEBIFu3g5Hnmo7yJdBInr2LjWllhQmqj?=
 =?us-ascii?Q?FVSqqSQWYryOp+aMATrD8D3wedtzQZFhKfW45ynxcGSDm4K2Gr1hWFNOvCPf?=
 =?us-ascii?Q?UuAH9YlVoPfO18RnN/lHO/sgPVzArZGfRTQ1JzRp9uZPZFdY+fLMTjo5zDup?=
 =?us-ascii?Q?YXZ7pPdURbmVuwDscKgaD5sRC1ui0paH+odlBbiAoFm56AgWr+1WF9/YmtYJ?=
 =?us-ascii?Q?TvFhlu4HhzypABvPVdaS0lC/wLhu1w8pyAS1yr0yQC6WHvw6QVWtteJ4uQrt?=
 =?us-ascii?Q?RNvFPtiVx3BAt+IDKFGJ0lkiD8faKTsMu1VyTZOZDokyuI0o1nb7kabbfFZK?=
 =?us-ascii?Q?+2oLmyYgnaMpuI/GGHntL2YSe4KTfJjDKLFLwC9gCfc/bobYaXyXlnjEvugE?=
 =?us-ascii?Q?RjAVAFHO9/Xykc1xjlPkP8L6Tn4IQW+VNxKS6VR/UJ+6PLifVQjnOgWQcAym?=
 =?us-ascii?Q?rqacLpT0645cEp5Kxap31PSt7FYVP2V5AXzGDdZj/Sm7PsCGQJoaUUPlonte?=
 =?us-ascii?Q?p5eVBLU3ws7xFag2f86YQekVBLb1CxJ+czxNyYP9yqC7ByPhG+DQsD9CRMzV?=
 =?us-ascii?Q?6zv3eyJQjW44bNy0vUE1SeQpseF22swkkeaE6tTj6FGpFf6hMHqmLm1Ew5v5?=
 =?us-ascii?Q?arKl/jsl9qsCI4u6z/o/17jBbERB4b9iNjsqLdl3R3xdf7EIu+LlJe84vF7t?=
 =?us-ascii?Q?hTFtaBVtsdgE/Kb37pOPWaY81P0adgZ3qgQCzzO/eaZ7X2CZL1nPH2sSkG1a?=
 =?us-ascii?Q?S+m4HmSFZ+KIopgGDzK2ucdGk2upW+POvFoGJ640lkw+nejmCj5whTmQoBPr?=
 =?us-ascii?Q?cHBf16CnnQuaZ9nUlSARMuJz3H64RyQBqKTs/umf89vBe7PgwDDbJHPwYezq?=
 =?us-ascii?Q?NyBGpXH2FxAc1jsIB4JRN79XIT+J68ssdxa89uRlUTPO6iqMM6Om8yOzQHE9?=
 =?us-ascii?Q?J4QkgBSvOBs1BUBb8+qsYmwrJwsqyDExHRnJnVUndbQeKg16/SMCjBimKZLs?=
 =?us-ascii?Q?Fk9BKdFwbFeh3GndcDA9JO4RgN5WEEr3yJUb1yK4pnTUXO++HSYx2KZOhXf6?=
 =?us-ascii?Q?tQbNYRIpkrcI5QDQK7+RJXQ5ybbp6tyc66n2vIih+zvlMv9Wtu54gRVQfkj5?=
 =?us-ascii?Q?MQm02XKKRHLikvGx4xHrDFGNgzblhk6ynXMb5b9t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc87b3df-46f4-4e65-0d29-08dcb62f68f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 15:49:52.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4tIscGIHjovE0fkoO5/0QoQNDOH3PrPqoWpsPnWu1/942u5LjMRm5Fkdsx0KRjvFl/HqnwZ5za6WeYX3GD/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7784

On Tue, Aug 06, 2024 at 12:43:07PM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2024 12:38, Animesh Agarwal wrote:
> > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema.
> > This fixes dtbs_check errors.
> >
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > ---
> > There are 12 similar errors related to this missing property from
> > different blobs.
> >
> > ./arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
> > Unevaluated properties are not allowed ('big-endian' was unexpected)from
> > schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
> > ---
>
> Not sure if this is correct. I mean, technically it is, but Frank Li was
> removing big-endian properties so please choose consistent approach.

drivers/watchdog/imx2_wdt.c never parser big-endian. I suggest remove
big-endian in dts file. I suggest keep big-endian only if it really used.

Frank

>
> Best regards,
> Krzysztof
>

