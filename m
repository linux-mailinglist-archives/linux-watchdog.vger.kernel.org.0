Return-Path: <linux-watchdog+bounces-1493-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B76951EB9
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 17:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F08B283C87
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 15:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9431E1B4C54;
	Wed, 14 Aug 2024 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H/Yiv8Qq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2069.outbound.protection.outlook.com [40.107.247.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE31B4C34;
	Wed, 14 Aug 2024 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723649860; cv=fail; b=W4HsRZyr14Sv6LgbBscJT2tC+kHXg6xZCZB+PM+gXJjdSuBTHeo7W7Bb0dXttCtyjRC6TdUgjiABtapG2NZI2vUE8nAoLtMpDAdzrQYA1WWTIF3xCw497C1vJa6euFrODDclf4VwDjSSdBvyEDqsHRGzdh8OdRSoD3kjM15CyR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723649860; c=relaxed/simple;
	bh=ee96NNav/Yu0HUBRj6AH+EgUx4X51rGeQaXeXQSq98w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TSjTj+0iAjtPCNl3GxwxtcvRZ9x01MOVXtyP7N6kWnht4hvKPS1VqliNTB/ZDL05s3p0ZEjrNE6acoZOgV2aKLl1wYAS3nbhW0+8BgW4I116traOWFYZHu6uUVLcrflKtHDZiGk8NAUQd60J3U6IGmHE3mwoga8YZHgwAwCR6hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H/Yiv8Qq; arc=fail smtp.client-ip=40.107.247.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d33D+AmHrnIOk7zIbwqMQLvE/PHGvaTz0RPlQb4DK2tM8UU3XGGZWg4UonPe6i7FzljAnzKe58PS89Bb+agwSTzvrBii2HoUenPUp8OlwgIHfydCVdIQnMDv1N1sVYcrfYNQhYFIWdIdEAxkEpxmP3qAZ0p5iHWxsVjF8Hv4n3AslNuF03C1pjqsUJuobV8mBni9CKDeKlGHxnysWst0aLvox50wAwy3CvmRwqJW2NqZEU2vGDtTw8lmxgYKGbuRV6mP6BDI0kfw35jaHqLyrwa5TTmRZ8veFZLDXmjfQocoUZvRm+530+zenUJfa//M4jaLi2JVU/ibQJsd94VuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sf5RVy1JZMXh/NCRnmwejz/QZtxkanez5aNDwDwL2k=;
 b=HCeK6Eiljmmo2FSqav4pQBDOo/4X1j+zAUZfeHg1YWNrqaEwLjGO1Tzag5QpxKW75ixf4OUb3kEbKBYn+KJel4t1LxwvjHgoJmCv5ThQ1+YpbE/XUi8Uyjc0eYH23IeCBw7Ddg8wRcFLVIAY8RtGjEigk0EDxB1OT0PntiDkj82iqwqLABL23C+2VmcmZgWWEm/2aPvntnTel4CRRQGHz7cHbfA9aAbk6A1aXMXFYKFi09BdXpPQ/ywePgDhQI8lPR3HMQeLiqQu1kUWU3P9mnGau7vkGtwhS4Qp6Ko+nV/e1LckFy+DX5xpaevRALqVgjXfq07UJK/+HNq0fNsHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sf5RVy1JZMXh/NCRnmwejz/QZtxkanez5aNDwDwL2k=;
 b=H/Yiv8QqGathSGS42mKUo3poqx8Q2V17d24LkPRBo4QNqWtFuIygeHvEyId35jIlSsxlY7WlcQTC26vNvOf/9OvsZ3YBXXEZVv/jSwkBlhGs8qvG1zbPwAz2elaDbdOrYqWudO1f5wcOgih1A6m5tVgtmTxiLpETMSrDbdslo6nS5udmz6Cyhsywz5TPqiUd5pT2I5/vq6uqKqlwdeYaplfkjzEckBti0zwUU4Bhbb9dBoxnJF3G7SIyvCdMCEPR2lZy/fAVr3Nm46KSPprP05mSM5pR8u8KUPbfLEmgtWOH36oxr8rEOKQ6KMI6juTKdIaeO94LKZ1dtyJ2iZyFyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 14 Aug
 2024 15:37:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 15:37:35 +0000
Date: Wed, 14 Aug 2024 11:37:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <ZrzPNmXLsqxjzM+J@lizhi-Precision-Tower-5810>
References: <20240806103819.10890-1-animeshagarwal28@gmail.com>
 <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org>
 <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
 <a03c0609-cc13-457b-84ec-5880fc553bd8@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a03c0609-cc13-457b-84ec-5880fc553bd8@roeck-us.net>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: cef15126-6970-49b3-0cd7-08dcbc7704e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	94Zx35VCGJdKj9KC3NjM9utGDHgvkdwo7Us0BnWvKY77mKzjQwA9jShhIR4PN1Wzo3OwiQ4ZLmQwJzwlJN6PUF4d3KO4viDMCMcH1TWC6f4aUqSKUVlgIkgPUNdBbE9+l/E1CaL2DPWDEH8FTQDMeY5E5D3afFp9NkyVi57lTTBJ+O1AlnKsddMW8gpA5s+NyXFcXQ6JWepqLOqRN1GDXk72Fhf4w1wa3I7pjx9oMDiAGghAugZ0FKdnYz6TBNx0TrvapUZXGK5oCLoS9NMAgfJcCWJzDfKQHH5sku9Uit5tjuAZuOuA0Qqc0GUHeuxjO77CjVR1D3jyshtXs7aopzotD9RxlLdFCcGhPThXd3hggF9ViwurrpmWhAefUxit80ElqLBK/BmPQKh5yPL3X1y9Gz6KUb6ptPd4IaLpS4EywdwtEwd9evbRJ3IwGOW8lxSOTgA3b4XO5NKoNlDbr/1EnmH8zr7RQs3Xc4RnhFcvFzL6ITdA8yfEqPuvyIGJNdyjjGIEIV0rDxM9EtGdVxDjEL8NCEENyyTo78YaPZIrwtJOqB9OgkEH4zPlSHgr+cX+tYA78NEki4yKoksGPv8H68dT2WMSKyMhdt1+VnUDYpD8kfq+PqCMlZYzox1EW87q+sX0mvJBesNZOHqWIdaHp7msCgVN+TnDWvLFjws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sTQ0Qvw26eVu4a4HBck9blWlTBhn75uhvHlKievXanmNMZ6DknAhg8zu8zAT?=
 =?us-ascii?Q?oCRuv89njjvWJvG+bcaUd9m3Hi6RUcD+shq6Hl/r1V3jVoRRybiv8Nfh9e50?=
 =?us-ascii?Q?laHZhqdQRemQAkznJ3faPFcWeSd/x/ecRdWJiLB6sbJk1kJcmHmlZJPBjBl5?=
 =?us-ascii?Q?dTh7tKb4SgbCHYd7/7/hFxJSx2T+hArtVOtrxH8URsnUNQKyxZZRsUCqD35n?=
 =?us-ascii?Q?1rURIu2yp7XbIGe/5NvNgJwIXOhoKvnteTYpXWfmTsPTKdiXcNwqXMc4EPe2?=
 =?us-ascii?Q?Xhe6uKdDW3HqUYqayO47v9u1IdSuaIPdpUdIf3+5AtmDICxFex/y73R2kSsl?=
 =?us-ascii?Q?PyNmgyZqRPSgc+lGDPl+bTcqi6lCoiKGP+eQJELg0zgALVJTVgMNlIxDdOjf?=
 =?us-ascii?Q?I1uwW04Xtx5ykHcy3IFlQoqd2wgMZRmbF5Hoy9GlQu70jUcx8ew3wSzHQWbs?=
 =?us-ascii?Q?skF9Z6l16e76v4Nq/r44MIa/rlK914hfrQKnnONUviC5GBZcup0s8bxCGfzP?=
 =?us-ascii?Q?rBifZplHqOL7Wzprv/oWxQxu3urD0p2kjtJA1YfAvgDtbtJRt4pO/n0VyAvb?=
 =?us-ascii?Q?QVQRKiQxNG5xkuDtnfj7GDvplVc4zRF1Sby7jk0Cg2mmG7gb9skeV3kl58IG?=
 =?us-ascii?Q?M9GtEld4IZ6nNXzrlml5iy/Ezj6WbZ93FqvB0plp1GhihIoIGSEQIMRDKmXG?=
 =?us-ascii?Q?eooQCgmDFB2LMfbwFBoI9JmN8eLYQMhRK4znE9TVip2O09lJZBWSo1iKD8bD?=
 =?us-ascii?Q?YuVuNPlvvUXk9OEffQO8FoNTk6R8qrSaERQ9z+FdZt7H0Wr+bUb+purmN7iE?=
 =?us-ascii?Q?gE8Az4QMQh5fX082J4AqGxzcU7GFx7aanTS6oumpyp2obQCWOy+zgvmvWrec?=
 =?us-ascii?Q?CONym2iYVaTTqm6hjKowe9zBaRpUMl7re/4wJ6kIkz8zgvWJZFnGRrtVw9cO?=
 =?us-ascii?Q?woi1de6Lyvi8/SovWGaESt0kmUxCGPTl1S1LJnErK3nZMSejaoakMySiml06?=
 =?us-ascii?Q?2FGl4s/vvOW7QAQ1YqH7uiP3LiFhQWxw8LSdFRIiRmsQC91O+HNDj5w7Xw3p?=
 =?us-ascii?Q?yH9KgmeE3yRCe99z6rjMndQQhttrxXt6AtAoo+HbQF+NSyzGAbKJL0lrFjBP?=
 =?us-ascii?Q?gn9LYWFZeutP9bhJ1wHm769zeULJLFi0Ml7fhZtdLSKazg7Ku9MIpGkHieAS?=
 =?us-ascii?Q?prYzZ54raBZeb/dozN7QGPwOjLFgX1oO3xcq3O/CRb0deWlEH4hYIz4Y3OEO?=
 =?us-ascii?Q?fOs238laCYbfXunss4lz4jWT2mFGml53aq4wuPA3ul7UfK6U7l9eLyT+rOft?=
 =?us-ascii?Q?YYz3iPcZXsSwAdnGxqsXLTHbXS02mKK0gAiYD0jtK60sLMHRWPrMO6WjIvY6?=
 =?us-ascii?Q?HudFO/v8lwQADKq+DqKGHtGxqoGLhOpAvN24WcviqM93EZz4jlV+cEdqrWxl?=
 =?us-ascii?Q?lcbrvp9Y5fCXePy3lHp3cdr+MZ2CAOi59+ka3FFRHrg6lURa4YYqVsbLD9Kc?=
 =?us-ascii?Q?E4RqDHlPrWF5Zd17z7480yzdF9CK0Hud64V0uCTyXjv0KWrTYnMWsqRWq/BB?=
 =?us-ascii?Q?D9rHIozW/ENBLXwjQVI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef15126-6970-49b3-0cd7-08dcbc7704e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 15:37:34.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeuEAkPv24ZAvGkHpCMlm8MxvpoCCIyV32j+iCs5b2d6Pc+YAZP1/5SylBua3raThJkPKIeI80KNuq3pdj+WKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228

On Tue, Aug 06, 2024 at 09:44:16AM -0700, Guenter Roeck wrote:
> On 8/6/24 08:49, Frank Li wrote:
> > On Tue, Aug 06, 2024 at 12:43:07PM +0200, Krzysztof Kozlowski wrote:
> > > On 06/08/2024 12:38, Animesh Agarwal wrote:
> > > > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema.
> > > > This fixes dtbs_check errors.
> > > >
> > > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > > ---
> > > > There are 12 similar errors related to this missing property from
> > > > different blobs.
> > > >
> > > > ./arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
> > > > Unevaluated properties are not allowed ('big-endian' was unexpected)from
> > > > schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
> > > > ---
> > >
> > > Not sure if this is correct. I mean, technically it is, but Frank Li was
> > > removing big-endian properties so please choose consistent approach.
> >
> > drivers/watchdog/imx2_wdt.c never parser big-endian. I suggest remove
> > big-endian in dts file. I suggest keep big-endian only if it really used.
> >

After Alexander Stein point out, check spec, and dump watch dog reset value
at ls1043a platform.

0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0

It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian()
to handle endian.

So this change is corret.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Agreed.
>
> Guenter
>

