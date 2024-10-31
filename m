Return-Path: <linux-watchdog+bounces-2393-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D19B8301
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Oct 2024 20:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CC21C20B64
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Oct 2024 19:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B931A1A726F;
	Thu, 31 Oct 2024 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UWPD2vE8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F0513C677;
	Thu, 31 Oct 2024 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730401385; cv=fail; b=UIqZDGR/cPSwEptxvc8ahgOmiS3tvzbFWHoU38/Y3OvWWaLeU6afWRojeqFGaKqqo+YYYIe0yt+8yviQDSYFkwKV/0pMLo6T9BYsQPoJtWeVloJa8GtBx26ivQPRM06mINVjx/V75OMbgxJUscl/sHpiL04p2pfEF1rwRzSCK10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730401385; c=relaxed/simple;
	bh=67V3E1NnGaF4eqfXXu2p4tJ0dYb7qqNrDlv8b86OjMg=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lMgCIJnkMV40L/xuD1904LS6L20LlnRwTLxvwhJ3pmb3jpWwZivcsEtqDk+Xa/TPYyDTtu0rfnK1pu2j2zOOWDOyCo5kUkKk4+vXTwx30XYI+XtIfsKKz4v2pCsPovXh0/lp+sENJ4C4qsXfEMwtXfxDyCciYEmCmzmipxI+70k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UWPD2vE8; arc=fail smtp.client-ip=40.107.247.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfInTj48WfZtnipDF5aUeyHe2SU82ytJ6FZnsuEt/lsnaSYMSLFtOi6NEUuVHUIkEDbpyEujMcs8QX/jSykcfpWdBTEn3ItYYfqmjWyS038UKbonmjv+KedLFwPk2iJqYtDi0WHh/GpGNEVfctR+gsJdZqYhc8awf+XW+lXhyKnu2xFyAmj6VFeeHRiSSbGPUfHW8n7FPlIOJvFGm5Enq7smDnI20CQ4VkFwq4o8sh434KQUB1c8EFjW3h4VBTLHnjRzZGkGgqpnl7RGdHjW9UqoltA79DbkOkH6lnf/L6gscm3SGm8YvNhIwA0yhO4yqrymwRWpqa8U/EtrUL0aAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmwEDjEhky1npU0l52dn++FA8KIwOqeSnDkn9tc0g/I=;
 b=yT6jwVr1j0DwUYrth2JSAS2tA/XnB8YULfjwUIcikvPYf5dkwWZBWnED6McCzODM3MhUyy4A7vIDwY/i9wARBsaYc2BYx1WV3DrSNslRuRgMpJmU1YgLN0JKrFW5GKI6ZGrfFN9vUV/LLr80S1suYZlm8sEGzM/KOaJ3VFzqMYVocOIC9UMFYPsowE6XKQlclVm7oy/DCrIcGg20c3KraWy3xMcXjlwhT9TjBIspyTWfr+1gD0rSODboagohVszLeeOLO61zGl7rYh1rQqsgGFMsTVT/zjhk45X5PswMtcrtv3ONVJbg7xeRgOVrt/eMH3Ncwr1FJqA7kNo969o1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmwEDjEhky1npU0l52dn++FA8KIwOqeSnDkn9tc0g/I=;
 b=UWPD2vE8kmFVIh00swXwa8xzLGs9EnGjGX5hVXplLhehXlgTVE/1od0BaaioBdh6IOQQFPbIuQ9DsTQdfgwOjBMk3chSLRTwAPhGNAhENJd496U7LKl5JACl9kvCnBc7O55ZMyDwTq8JHhUFjHwcWoYKEDKqJvE+k5a5GEpdGYN5wpFhiKrdd7hmpht947GcJJjOWgtQbdx1IcehbFlAI21cBmD4DYjIt/O/KZCPtmDRhrKPWz21x3kJBgsVrlZIG1fhvGCsobI4zkS0bW7RcYbjBdLyEaiXGZfaP8hwPw3N/SVnNtCkYEDr5CURB6PEXfGC4ihKRfXIoHfa+nmxtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9475.eurprd04.prod.outlook.com (2603:10a6:10:367::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Thu, 31 Oct
 2024 19:02:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 19:02:59 +0000
Date: Thu, 31 Oct 2024 15:02:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
References: <20241007212434.895521-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007212434.895521-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: e8be4432-7d86-4059-e4cc-08dcf9dea2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aDMaxoXx3aFwlC6T+x4Wendc9MJ8kgi1NZXIdPgU662nqrPpNwgHayXodHMd?=
 =?us-ascii?Q?nptBb/IVDS+IuLDauLBt+PurT9vuFhRKouZLEe0/5fupQGRhJ4EyEPTll8eO?=
 =?us-ascii?Q?xOYADFHc2XpA6YoFqNSsmA/inI+Lcnr4bLi88VKoalL98dUvk5xFNG2fsSt3?=
 =?us-ascii?Q?yp5RpUbYmMeKVhxL5C240UyW6LYuSMcxEwBYnmUf94clN4LKxttEKO5sKNfU?=
 =?us-ascii?Q?mvQGYJJnHUVe90c6g/PwYk4lu+UJVNFbCYolrj7Mu7LaFXhZx/KipSBgUNbK?=
 =?us-ascii?Q?SvVBAuH5Ck1h5nnb6GSDQLk8KxpV9JQcKqaNDeNKwATbe9uBevCi45LUST9d?=
 =?us-ascii?Q?ucURc0QcAljmN2P3UjglehGACsMxHmrsFRlPyo58tntS+p7s2DU2ypLMX8Fk?=
 =?us-ascii?Q?vMaEQf+iEJqgPaRSd7M9mC29S+1pw0p9OdYs0i7VJXBWRDieuhgI2s7Tllqq?=
 =?us-ascii?Q?auL3UCklXlA6Arb7VLC2ZkVMVyeuYrDctYfhZj+Hzn5wRhpqyAHQgLfo0uiO?=
 =?us-ascii?Q?nQsAW+y3Z5WEga/9yK6cUv5knrJyPaUJtjR/sf2hQ5VmaH9oVjdODqD/gyXZ?=
 =?us-ascii?Q?fq9EMSxcJO8DsvKQaRWIFjPArLhpTmllFspGttdbQFNa2WjTevGBrHoyH+d+?=
 =?us-ascii?Q?d71kbLBwqCXzRuaf9LZx4TyxIImMZgKlh4jEoRe/V8Q5ez8SWlopygwU5C/j?=
 =?us-ascii?Q?SGgLThu1kO808rl8xVKDOMP/wetQ6Isb73kd9K9CWjve4BmGpTXmjZyEfujt?=
 =?us-ascii?Q?2jv3zgOuxgHjBGeEGZrEz00EBOtnVaVCXdpvqHtjc7z41S22Vc7WXxvWPYAu?=
 =?us-ascii?Q?Lq90hQrbfbt1Ma7JRH1YwaftLnmzkqFc9Z712yiYQ6ZRpK0a8xEfMgjpvS+L?=
 =?us-ascii?Q?124t+pGhn1gtNgHLoP6lxG9EDc6qwW0mTdvtc2Vcpnh/fj77EvemridaLFH6?=
 =?us-ascii?Q?KHBFOjIM9eTY7sgtejZRBnXI84aSCEOxO6AeSdxg9/TtXKW8ie4j0VItYNIP?=
 =?us-ascii?Q?1e2c+aXvyaDR9/DURfcFbp8+OUsQIpbIvcxGUOqq7NAcQ8fUbHM96Xs2U3YE?=
 =?us-ascii?Q?8+EXaKZjmSXUrgdgYybsgH5Qb7kqzVDwQioQULV4x+h3jGhvE5s6Hnp5OZJh?=
 =?us-ascii?Q?8bzOGpM6tKZFC8pSTFlE7KvT0qUjUfLd5ffVIROo6x9KErHuxbkNQh6h0mrh?=
 =?us-ascii?Q?+2qdnvbMiXdBQ3oX394PcEPm10DL2kJRH53zwjnYZew2OosVs3q69Z1HfSoA?=
 =?us-ascii?Q?gqa9qCKtSUF25gV+6WM5MXR6BlKyadoUisKEbJ8s8rVIQHit2J8oUaoozh2/?=
 =?us-ascii?Q?t8JYCIDlzN/wqxbZRIvci88oRKkF4015USZkkJfIX8V3FrzXUq3Yvp5VybD9?=
 =?us-ascii?Q?l8gR/xAL3RoTQbfB/Qku61bZCmPXNFFWR6Q9jKtiKonJ4Gjduw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sVl5Q40X4NHKbj63XJrnjRgZ3Z5Dxc67IDxWJwMVlo19LSeu3LaQ0Ufi5Xye?=
 =?us-ascii?Q?jeNKN7ujFOvAmzHxG2n31ydZoJqkJNbsaAo3KstRr5JUaql2TG8dd7+L960m?=
 =?us-ascii?Q?GRpEkP3N4UvVBtLdFQUnbt/IFTcPgn9mITpgS2zjCEW1LxpTaC8gNRNBZRIo?=
 =?us-ascii?Q?OjkfChzWWeY+P7tXkBW2k8U9WGucLT7C3hsZVkaiDXuR/MO5AdsPmpHg2EaF?=
 =?us-ascii?Q?AnWz31nJ3q5rEbjUXtY9H9EwJHWEc2wnAnOqcIDNUx+75+TH9Fab11dQaAMa?=
 =?us-ascii?Q?NY7F+VMPc1mhe6beErJa6f7dWs5GC7pXnY4yorOjr+qvRPjPwN+G4CYVEvPn?=
 =?us-ascii?Q?3hWhKAiTQl9Q60/VALhq1wXs3Vk/sF5M/hoY6cJm5UKzUzdM4wqdmnvxEPdd?=
 =?us-ascii?Q?2VdggDwz5/Mcy478r1qLxi/NUy7oUtquMpBdnCO+icHh/oeoSdoxq7N2/1o2?=
 =?us-ascii?Q?a4kGDZ/hHZWLQ0hD/zRmcxsetp8qOfuBP3kR/VQPlDXEyeL0xrNmbBGl9jcP?=
 =?us-ascii?Q?adJy6VEOJWoC9TlunS3O3KsLe5tmP/gdHfSiEuzHTrcBGcN8D57bVdBXqdid?=
 =?us-ascii?Q?TRkkkQgT0jG5NWbvUimDHkkCJ9W9pBfs/zMLFp/I44ygMJjenIDYWzMXViZ7?=
 =?us-ascii?Q?vJipWz4Y+oVQ2IDhS+fn3DIu5U5Zzj2rmSwcszhkLishtAyFIOTuyw+C+Yjs?=
 =?us-ascii?Q?5NMnNxUBmSw5Ng97lAKdpHXIzmEmSGr239BuGOf0SEN07nD4p8pjKTdLBgw6?=
 =?us-ascii?Q?21H7k4fwseieuW4ldPjXYOjIxtWR7ssUQiyA2/Nmq5f/Tu4ciZSscY483YVE?=
 =?us-ascii?Q?dg5xdeR8bjHYba/uXPRIstyJdHxIW05q7JewTT7uTdNNd+2HiqS9/vIP0eRB?=
 =?us-ascii?Q?4ghEFpecl8t93unIdUrXoTM+BdFGIaC9dUJXIZ3VdyVxeRPzZ3IEPE+cN7a6?=
 =?us-ascii?Q?355zOrPlZ+yH+olH/wmf64IVzt38aedqFrQSY4pC1GBzaP0hHGWckmmDhY+l?=
 =?us-ascii?Q?CjuGoAZw/BFuNxR0kQpHbx7/z07ihluYD8S1+zDsQzHZPesdjYskW6cwNEN0?=
 =?us-ascii?Q?/GIYSnbwV1H4fVamKav7tIqRKoJeox07l9ZBR3T/iYZANyRI4IAkRkrleYAX?=
 =?us-ascii?Q?5I41dZ15cFlpUObYkTHuTKB4Io1XVIFzSNgD6B6LwAcFl+jqwZVJ8mXLwW8a?=
 =?us-ascii?Q?ZNgfcOatT6ohMA1xXgfp/lqB+7p9AaBHQFOBBGi3y19VN0406nyWfskXU4Db?=
 =?us-ascii?Q?ftDMBUQDN6dksV2HfJY/P8XBbTE4ivWS6iD0uC9gIzk8b9qZQ/iAKd91uKXs?=
 =?us-ascii?Q?SgVu/f12K9lvINFfnLFH7IQ/Jk5nvnn/FayO0Cv+Tvsb05oDo6Inpt4cRQws?=
 =?us-ascii?Q?sUISyUcH+8YCTQ0at2dZnzQHfrZOK2swqRvonWZDDdATQ6lYs1eh07x5vVTZ?=
 =?us-ascii?Q?8qgrsej8W65aF93Gw9nEo+6OeRbP5m6mlVkuQFp8F1vOx8bBeP1sPmr4S5ms?=
 =?us-ascii?Q?dhnxei0j0ttJY3kk4XeQiKrHRGsDEVrbt/q1Dg/5/WiXJI3MdgEfuNbgOMKp?=
 =?us-ascii?Q?izdcaimJuYSkQ2JWsQk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8be4432-7d86-4059-e4cc-08dcf9dea2c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 19:02:59.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5ylSS8m+Ga1iasC6O67givPs6+UCN1gZkTQR+Ft2gcQo+MuB3QdthY4+FiizggShnmTGr/SjhfyUDLOooz+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9475

On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> From: Animesh Agarwal <animeshagarwal28@gmail.com>
>
> Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
> allow big-endian property for ls1012a and ls1043a.
>
> Fix dtbs_check errors.
> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
>     Unevaluated properties are not allowed ('big-endian' was unexpected)
>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Wim Van Sebroeck:

	Any update this patch? Kyzy already acked.


Frank


>
> Change from v1 to v2:
>   only allow big endian for layerscape platform.
>
> previous post at:
> https://lore.kernel.org/imx/20240806103819.10890-1-animeshagarwal28@gmail.com/
>
> check spec, and dump watch dog reset value
> at ls1043a platform.
>
> 0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0
>
> It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian()
> to handle endian.
>
> So this change is corret.
>
> big-endian for wdt is necessary
> ---
>  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 36b836d0620c9..0da953cb71272 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -48,6 +48,8 @@ properties:
>    clocks:
>      maxItems: 1
>
> +  big-endian: true
> +
>    fsl,ext-reset-output:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description: |
> @@ -93,6 +95,18 @@ allOf:
>        properties:
>          fsl,suspend-in-wait: false
>
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - fsl,ls1012a-wdt
> +                - fsl,ls1043a-wdt
> +    then:
> +      properties:
> +        big-endian: false
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.34.1
>

