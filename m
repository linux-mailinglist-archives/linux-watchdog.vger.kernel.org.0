Return-Path: <linux-watchdog+bounces-1393-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE6931CCF
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 23:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6393D1F22744
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 21:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375C013C9CD;
	Mon, 15 Jul 2024 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="o0z8Tpu+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6F49650;
	Mon, 15 Jul 2024 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721080617; cv=fail; b=csSO0r7Wn9biTPbXssXI4BoShE9qG3dOwfsFzc58Zo2Y4Hpmr3SBoAC5oCi1/2vz22UKwhPg7HBnkU4z0uz9RpwcAAfN3Oy51Rxu7y6iIkwersR/iREVNGcaLoOLVn3pxf0yCrPLbXrfjm8QL3HqGrQe2p7ElXr9sE+YoHlUF/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721080617; c=relaxed/simple;
	bh=3gP9l8xX4eMNvY9A+/yQmE0x8ORK/GQO+OGilj85KRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=olTNvJnepYua9C5+pkQNombKJ6zN0LgKFAJYu+VEMk3ko6lxuFK8SuBYWeuCf/x8uCOOMUBfquDal6StdHp6Ex1uERr3Xhphs7J4GVT52TpftNwBxYEW7XOMNsqXIXEGjXeL15WjviR+Bgb9LvFZf0eAYi/ZMV7en12N6qDI4Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=o0z8Tpu+; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLXXikdzVg1YbM3x+5H9hO2vVZ4vk/DCyH479QcDeH2SWODzXtHNTnF/NYCDXTBQ1QOGNFBKP9RUIgCYCqQKGGwqclUMwrNFvOqWptepwU5QgaRZle0IUhcuCfCywZqQfHD6m2N9fAhdAuon8Pwt5r1ikgPtM4KK0ZNiznywHTqvsHo87/iYm4YmpZ3mz9VyEii3ad/HJ3cBWxfeXepiCa0nt/0FLD4CylbUNnd6+4c4T9oWvQZwtoXxloJRYEuis7u3supGTZOvZ8e1LQPaiGbAJy6DP/PAqbt3vraizg9qh5d7Rb47AumNxuYZKLzMiTa9nD24KvqVZwX/xXOOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCjQgWDYP0ukvFDjUhH7aBUBNwWQHpuUSNq1abBPNJk=;
 b=x2jgH1ZUNKMpzs69GvgmIlvkWF6KGqhASVUb8BtqrxhyC14QeWeBbbn0m7+v+/egM1I9ASxcQbBti1RVADPJkDV73cPuuXdwYd45b/76lWl3NkBiVc03waJpeDwgPoTWerxD+S3IlwYMZfmJlS2xEcRAywu0S0o8EuDUT/d/mqpXMzRp4yfJA9rDK0u3MDyTG6CrNwjmmzgqoYx6GLLKpbONblCn9/+ELDxosXDvEIP0TbxuhVfEb8pWV9gnfCfmSg09fcl40LthmeHGJ6zt74V8NhA/bxROCb1VbQUNTKL1Zcr1uBxngDRXWn+HmWyYmXImrodGv6huq9Mc1//IEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCjQgWDYP0ukvFDjUhH7aBUBNwWQHpuUSNq1abBPNJk=;
 b=o0z8Tpu+fNkze91VPjP1J/XRD9R09/CqQ7M+4QGi5pzieFa+BVtIQIr0xCndukHZdqGWffTsXjXY4V32txj/Kk4DjlSB9UliNtZ9MqbTHRuQSk7aQ15yGQAREYKViW1haMU7L9tGi3VecWrQ+uFhEvgJH7XxPRKRUoQCFVVpaps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7585.eurprd04.prod.outlook.com (2603:10a6:20b:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 21:56:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 21:56:52 +0000
Date: Mon, 15 Jul 2024 17:56:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org,
	ye.li@nxp.com
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <ZpWbHLid9du0tdlS@lizhi-Precision-Tower-5810>
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
 <3ae98ea1-23a4-4e0f-9a1c-62eed84b42ef@roeck-us.net>
 <ZpVryrvsypzFrbma@lizhi-Precision-Tower-5810>
 <1829e700-6b0f-42cb-8b08-81ca2bca4e24@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1829e700-6b0f-42cb-8b08-81ca2bca4e24@roeck-us.net>
X-ClientProxiedBy: BYAPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::43) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 053d407f-5e8b-4779-137a-08dca519090d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vwIwnJLQYR8eraD8i0Ig7pkWJZtl0Pi3hD6QEGkbMzRY/vW+s+l+l3TcWMyM?=
 =?us-ascii?Q?vmkCon4F6QIfRVMyKNi4qsnLg/VaVlqfRlv47fuwCLS9+DowbhLFR7r+Yyzb?=
 =?us-ascii?Q?17Ws0TPysQYv9y5v5ci2aSdze87ACiQxt1MHGWTUXF0frADWUwf1SE4X0b/t?=
 =?us-ascii?Q?UDcm7K6FwyzzUFOy2F+gUejbg4TUBz4nJDlH9RWm8eCuk4n68XgsuITHhdOK?=
 =?us-ascii?Q?Yws8zi6djZ8MioQis6Q2bJdY35yfhJHuqslxPO7Jpvg2GxZdKTZEwO2b78EZ?=
 =?us-ascii?Q?9k52PuzpEQdPa6LU6d8A5drPjMn1DiDQB6+wC8HJzgBZm81zKqH7Mes1eXE/?=
 =?us-ascii?Q?k+PqCPtqSvlvhWkpqAqYQ69Opc4o4+T3EITyMu+YV1q7/YpZTvwmu2opDDJ+?=
 =?us-ascii?Q?NuGGDlU7SFS5oX8ylv3Jr/NmhcX9VDbhKhoq4AK0fzFxyQQZAJ+3t0P+zBrq?=
 =?us-ascii?Q?yNu7GF5R06VxHpXIXPy/SPU1H7x0uktGOwVEUaX2M3T7tg6al3l5XDp15XJt?=
 =?us-ascii?Q?1gpGatUtG8a1Xhq8AASrCjRMvptM+zT281ok2MVlRXrkivpV2vtVmyM8vSj/?=
 =?us-ascii?Q?egpw1xxCsPczn7rLuIX0LwgK3enB9NeENokHRixb1Saqfk9/GH5WS7Qorfvw?=
 =?us-ascii?Q?q4QfEeH+F+/5jxKIQGwDwFzbkQaUyUAf+imcLDRNby33R+s9ldydv0mh4MeI?=
 =?us-ascii?Q?5t09tZupds+fowLwo3iPzyQGChhDPWmNcSJUlxh/q8hrksSK/NOsILibkU8v?=
 =?us-ascii?Q?CwlP1rwMFdJdK0XKJTH88gsGH0kULpE9FZCLsH8lQ9ivhkD5oIA8bYsTkmlN?=
 =?us-ascii?Q?1B6fLjviyMhSV1fOrKus7m6iD4nMTrMxxQMbko6dDcwamjA3bouyU3w1h9d2?=
 =?us-ascii?Q?zdJYfulUdlldfZDpAvf7aYEvObz4ypddOdtfv7QA+ue+Qa1cHz/ET5I/D0wO?=
 =?us-ascii?Q?JusBn4uPdh1piWv/IGrWrbMd+UjkN9DW48OotlQyZYIZDsuE6gc9YZp2joRh?=
 =?us-ascii?Q?vr5zspLJCqmZ1yF9Ecu+H2pKPhbsfzJah52mbcCWHs8jEwXJhit4ouwPjx2i?=
 =?us-ascii?Q?a5BaYuLSA9lh/jmemoroiJ+riFfjhVGL0xiWj4lgyhPZgK/MCc4VS9UjvYl0?=
 =?us-ascii?Q?zo9TTF++P5oSPgyS4UvsgzQXlSHBfc7O//pqyWA6zx7iPFHbjdaHR/Iq/hHp?=
 =?us-ascii?Q?NKrIzbAOoaYbVEUI3//c1U8qtxG3o0bjdTIZ4OuObSyfAg3ogo/e2jxJsV90?=
 =?us-ascii?Q?ag+YKWtRYqCUpcVGuVcz6bNJxquN441ntSZkdR9xX5LCmphrSboPZG/7QBlx?=
 =?us-ascii?Q?/YVGuPwsrkwW7ovpIiUymh5UrwkipTsI6EwfJZIn0QOKAr12WZqiGAK8ATrq?=
 =?us-ascii?Q?WyUEtrHqsyjgnEUPzd1lcYR+rUp38fXJSCZ+v8ISv3nerx9rfw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQ51ifw9j3nlLg5g6JNYjg4wwQARlQWwQTJ/PEQypZj7k6FHnZUCA10ZGm9k?=
 =?us-ascii?Q?6p7w7aFXBvN9aju1DYB1CIqwdx6yIRlR3Xmir3f8821WXzt7fUg3vu1HKa+w?=
 =?us-ascii?Q?zSqESgDLaFg+mgpIw1MsgjEfqAR2qADoG3lsa+5AuEtkBkDznd2L/Xw+bTKf?=
 =?us-ascii?Q?v6TV3mmgWtLDlv7bayRUuQdHolN3Ehe9e7DIes+ote0V0thh2IWlu13OTtIn?=
 =?us-ascii?Q?0+QjMRm/xJ2ohVLYCH57wdhU14gefAvsmRwCTTbGvN5Ai1j7OkScOMd0ozcx?=
 =?us-ascii?Q?K4AV5jYJVCc7k9DJ6k6zrCskGbU/YHw4uD6n2FNlxuKU2tY6UaWGzo4PJftS?=
 =?us-ascii?Q?OzUOCbFG8+24UBsj2xP9HQd6upQI1PKC9Ymf94imeg4W99uvB26kbnD6pdmz?=
 =?us-ascii?Q?I5HG4spFUX2QhwWa/bOSn6xzhmn1nCpInXu/YcyMhlfp+MNPk/HDqIl581SK?=
 =?us-ascii?Q?H8Nq9Cj/JHoqusJAj+0ZLGkGjKCev9mHhr+hWSfnTnANctnz0PK9+ukPGeM+?=
 =?us-ascii?Q?6Ic4UGOK5cD9tt4vFr77jT0y4Kx63W38i7Q4S3/fjVs8TQ+jxb6DNqjF4GRH?=
 =?us-ascii?Q?Bh4rDvkDQMy9gdVdVuXIYydClB9mx10n8zWnyKcwsi7Z5psFnQRb70F3f9+N?=
 =?us-ascii?Q?Z8qyQYDUbzhJBWSIJUSaKXxpvS75DWZKS0vgU+17PwP11rnucgNNAnJ9I8kE?=
 =?us-ascii?Q?P4mCSb+AblV6bt55qVP1g6q8bf8/ZucSvPemTPaRc3+8cP56kwbDsPscJqw2?=
 =?us-ascii?Q?foknPrkYuV5ZONDiQeWAoF9bX19WDDz6ix5NkGyYcbiDIpo82T6MOblnuT66?=
 =?us-ascii?Q?ZhJbZzffezHqGcR4CgK/8uAA38bbakc9yOdz2pftJYfCgrRw2QTVy/Ca4B0H?=
 =?us-ascii?Q?8DidvYze05lOqYYQ48WPvki2sMvKiuOpkOq5ojnAqt3Sw2WCW05tSmP/Rc0K?=
 =?us-ascii?Q?8mLENoAwauajN87C2TsKJtYOu1J/9xFHX4+46ev5lkG+pC/ekcYo96hJNM7A?=
 =?us-ascii?Q?O0JcKJURFLT9fUEGs4b4LydYpQzVz1mMedoiRYzxFOxeovahkNkS4JyuRHf9?=
 =?us-ascii?Q?oe0gcXj52QUD7zSO9ZnA3DFVJBRrvHPPDP6Kv1jupamNVX5yZggthK+ncFJC?=
 =?us-ascii?Q?yXBhZT1Jh1oCKHiovAWWskkwyVa/pLensFmmrQxPqvfeNz6wEGsFqh0waqHk?=
 =?us-ascii?Q?Qnjw9FWONFp4bhReK3/rqmsMKhynj3aLrxZ32s6nBfofxJaLVcVpkCRXAzEv?=
 =?us-ascii?Q?195vhvCbw8dvVsC+2Lgh2H285TQCWzfOHPQBprES46FYRH9t0wLWoJphOT+I?=
 =?us-ascii?Q?FXuJ0OWhecgsvtPQQDZ1Syba7iC1Ug+vfl5741TgyuhYzVHH2/nAmWCfPo5Q?=
 =?us-ascii?Q?OwH0E/aepa3DeZ8jSARADrL7tDOegoA8+EE9QW41JBYfbI9IBpWw5d6/Du9U?=
 =?us-ascii?Q?g+fmxbhbKYcmhjDScF2soB09I4uJkx6VU0mmXz2Qs3VqoT4RKl6ns2pGCXrJ?=
 =?us-ascii?Q?5TOwUt6rrjWCbgVA/LB+oZOODyTXs2ti/JmDrH4U875GNQfgSFcv8rQiZNO5?=
 =?us-ascii?Q?5ahc3LqAES39qL/REwjCYZYurGokuj+oL8Ha861P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053d407f-5e8b-4779-137a-08dca519090d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 21:56:52.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qdDyfhnlykmIWZufCqaNWqJ+q72u3lHC8LFm9JtBBzZSSJ/4CkTZfZ1+l69L4aRSaoxptFtupUB69nqY1PpuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7585

On Mon, Jul 15, 2024 at 02:42:23PM -0700, Guenter Roeck wrote:
> On 7/15/24 11:34, Frank Li wrote:
> > On Mon, Jul 15, 2024 at 11:01:04AM -0700, Guenter Roeck wrote:
> > > On 7/15/24 10:07, Frank Li wrote:
> > > > Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
> > > > for different compatible strings
> > > > 
> > > > i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
> > > > done. Set post_rcs_wait to false explicitly to maintain code consistency.
> > > > 
> > > 
> > > Why ? That is not necessary and typically frowned upon for static variables.
> > 
> > Some maintainer in other subsystem like explicity set to false to read code
> > easily even though not necessary for static variable espcially there are
> > already one which set to false.
> > 
> > I am fine for each ways. You are free to pick up v2 instead of v3 if you
> > don't like v3's change.
> > 
> 
> That is not the point. The point here is that you made an - in my opinion
> unnecessary - change to this patch while at the same time adding my
> Reviewed-by: tag which applied to another version of the patch.
> This is inappropriate. Please refrain from doing that in the future.

According to my previous experience, drop review tag only when there are
'big' change in new version. Of cause, the 'big' is quite subjective. I
think "set false explicitly" is not 'big' enough to drop review tags.

Frank 

> 
> Guenter
> 

