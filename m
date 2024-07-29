Return-Path: <linux-watchdog+bounces-1440-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547E940038
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2024 23:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C3F7282397
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2024 21:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F24187555;
	Mon, 29 Jul 2024 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XyO6gXct"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F217187350;
	Mon, 29 Jul 2024 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722287815; cv=fail; b=QG8kjxbdWEuvUDQ3PWdZHdfcXOt/YTAUI7nTfGvCHAhIxjimb8nfRfC16UZr/ysIOZH7y7g5dXe4ZNUmplTDKp9dGmcSOyA7dyeTdh6tctIxo20D6PNQf8RDwrFTBIbaqMYTrLXUed1+4+ONjbiQxFn9rcpQUnc7Papi612yKnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722287815; c=relaxed/simple;
	bh=daqazDMDLJh5ZxWNM9JjrcyizSMqQ3O6q4gQJsKRSUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W4isZYES+TBmb4yrlIB8DzDk3LgxdcfhuHscH0nm3yDo3Ia/I9iYNZyILuWge8c0von60qOMyCnfYy8OaLLi9rzTgBBtJOhcTPrC8DIX0zIKQXsL4QHxRN3JR7Wc3EjQdiRU7uMVRKqaZ6xZNpYEDKIIuhbRBedTRONzrfWN2bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XyO6gXct reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjyviWwzP2+9CrfulhOfJ+9Cq1U6Sr7Ta9vwhmSM2AProU9FrWSz9jzpia/IcPTZEPtNF1Mz5prYCoXxHfwCGNC2ixbzjje/eX3+ELWZAOfH74N53cOPZ00cIz38ipxyAYCIjcRfU5Ze6xgkYXo8gvv2fcDPaZX/1YUiKU7aADgCSnUfHhZHYx4NL6BuzMWC3weiFCTGwa54HiKvSwLbjo2c0LJ3P1aNGLurT6d+/rhfgwS+Pzfv4/ivg8Lew8NldNZ2C57Q353RoJbYYacwogOXjyrKan8yENyLKvyuNwqPQ2NbP/hoHFO6irwN61IYECVU0ZaJ5R84GeqymzcInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Px9qktkK62dS/PPsmtxdli+ncCOZGtP2m4oEkwEVue0=;
 b=g1UHI8ntZjW6kYsU5NpfOlJ0PkWQCwt2sRA8haGrn1Bkl0+Vp5b5sg049w8fTaVumriWuFnGJH8ry1gXfqiVekSCSmDR/k/OBBzGkY8GKaRUOL+Ls4IhxA3c3BZ8JxQ3dutim3QvNIeTbVvp/l5f3xE4ILPsfxAWOQziB69uag3n9tK5hPA+wTem07y9OSDm32FqIsa2iQ+OR+WVXjOZqteQBnwnyGC89pcosXch+sQspReQ65UyUtvTHFpZKs3gyTBOxFFQfKNRlrHuU0lIqUtNntJXFN3CfvFJ86Y/XlkvpNDkFxg3Bi0IsUAEJEu1gE281SyL9WZwH5NPF5xJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px9qktkK62dS/PPsmtxdli+ncCOZGtP2m4oEkwEVue0=;
 b=XyO6gXctd7nbFWO/ii7Mjb0VYHX5W+7+8RU9WPLmRdardWuNwTKdV2T6NNXllcsPg7XyOY1M21R5NPbhF9VT6BHWCF/rvvlpIldb4aOzEt4bBVOzr4YUcwoQHZx8/dgj0BeOD5p3J6UbPPS6RHVJMI+A3TGnJ66XRJQKAh1NtaZB1n7hNXRSlrsXEC3LV3u2zqMj0peGFY+GOnNzjem157rN4A5saU8vvhOEZyy++lgXolMeTyt46A8jo3Wm7LBGQ1Qpcr2aXtuEJKeRYV7bcJdCDos3Q3uHe5m5p5ifjLLSWLxvWB3qAsCOYDJ2gIZM81ApeGPNdcVIkeTbMfPZnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9873.eurprd04.prod.outlook.com (2603:10a6:20b:672::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 21:16:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 21:16:48 +0000
Date: Mon, 29 Jul 2024 17:16:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux@roeck-us.net, s.hauer@pengutronix.de, shawnguo@kernel.org,
	wim@linux-watchdog.org, ye.li@nxp.com
Subject: Re: [PATCH v4 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <ZqgGtzLvV0QGR0PW@lizhi-Precision-Tower-5810>
References: <20240729200601.1995387-1-Frank.Li@nxp.com>
 <716b9d31-f978-4384-b605-64896f8b2643@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <716b9d31-f978-4384-b605-64896f8b2643@wanadoo.fr>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9873:EE_
X-MS-Office365-Filtering-Correlation-Id: e2654837-2ae8-442b-7313-08dcb013c1d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?h6TruY1dAwqC1ecbh1a5NNU4iLOBeT0xqxhUduSPSf/GOP/K7AzLwdJycb?=
 =?iso-8859-1?Q?0KgJa7bWexXeL5m9v3Hwr6Lh/949ICBeemIKt3oJDJwagm8fvMGSaftgyH?=
 =?iso-8859-1?Q?TkKFgQEoSeekrseIPX7Qe6PJ/Xh/rI5YQHnPvKkmvTRGWM3fo+Fn/UuTXf?=
 =?iso-8859-1?Q?Rqws4d4lsPLfWc6HWFG52WXrVl5iZ7r2iZ2fGGCFpCXR4+tY1Y4404whN2?=
 =?iso-8859-1?Q?kZ3QQ5Rz5EcV9HSvkjNpW66RovOHKWUI6p4w+nyKS8z3hh3QxNcrvEHDzK?=
 =?iso-8859-1?Q?62+vMYvkmbHnHFyBX1EluUdmU5g7OvO1/LqkbfeQN4hvSV/44ekYJqNbT8?=
 =?iso-8859-1?Q?6l3QSN76HP7wXEA/LIW/P5apt/Ph5SOPr6045YsUd+XZnPPgdE8saqjLeH?=
 =?iso-8859-1?Q?HNWah3J5xWtF/VxAD9wI7yiuqEp2Nhhk6rOWWbpdbglxTwldTzFRtUcxDM?=
 =?iso-8859-1?Q?0jX4PP5vfcp2eD9zNPwW2DFELlBxsjByeY6bpwWgwUd3Y2v+caITNBULMW?=
 =?iso-8859-1?Q?R38tfyiv7XLQAsBAxdDEKAW/eix7kRNPCa92XjNiPGvY96qhNEptgiy2Ix?=
 =?iso-8859-1?Q?u8z1CIvW3u5ku/oWclI+giN6toWWsew+YXeKW1GCDPBWHdyaRyLNGHJfEr?=
 =?iso-8859-1?Q?IBszYs9IeJZtX6masJ5zvab+MTXDnJWc45gjNbL/JoZa7oFofI8GSZzUEo?=
 =?iso-8859-1?Q?HgexR0viEyoTnerM6JeGqnynIhbAUcgWvPjmHH2Oy35FkXS4OAWzxQpxVV?=
 =?iso-8859-1?Q?3+NfHXMpPzMI3iYry5/KXezS2UdsyrdgE61UtC0SOomP3K4Xqb1ZLh/yyM?=
 =?iso-8859-1?Q?fc1XR07V+M0HAQx1fAcpKuWUhH6IPLpH0FRhc9glyPGzsfdYT+oH9fTO1D?=
 =?iso-8859-1?Q?NWxe6de3t81rF/608z39Ynj6pIIKoGATkxmT99c/+INsYSSXVRv5YNFHFR?=
 =?iso-8859-1?Q?ccfem3tf8whlE+YsQPLa+Mkav4VTJyYru/pfF00wpXx9jZjm9tW/Hhjupk?=
 =?iso-8859-1?Q?BnP7/+YQj1cRnPZaYNynsWaZjn3U7QhtWCK9xxJDMt4QgrRORr3yBBDF+g?=
 =?iso-8859-1?Q?8Ec2kfTBypyT8mOu8KN9K3N8rgB3FgzUliuSN7aqwrBU5M+9xzkP2/gF9z?=
 =?iso-8859-1?Q?rveulCabi0X9hmXBXam9qRC1k9wrPGjzttIoMULbLf3xfg3zK5zZ8ihe5z?=
 =?iso-8859-1?Q?aJPU9ftry2Gpa3npiQ+aGLDCFNNGxwq+nNGEjoPP0qmOUbg6vm7V8PYRPE?=
 =?iso-8859-1?Q?gxRoBdiVwNkt0yXsVQ9OFAoPXWqeuHDTslyw3NLqCp/jNnuDyf/r9D/iXN?=
 =?iso-8859-1?Q?mWdLYdjNZ3EmBACiDbnRjWzDKYToY+EPZxpc4QwklOOChMy5sVMgJZcuxf?=
 =?iso-8859-1?Q?/qUzd/maX0yOI155FOzp0Ns+y0tTNRItKMLET5ghHukhrAyCaUHg0BlFGD?=
 =?iso-8859-1?Q?rXJUNtpdgB3hDv8+h9ds38zYvGutD52G8w0iaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?D921x1dqyBzS1awu34ZdIMyspNq9966SS/J6bG6c3Z71N+kTndAOMkWQqV?=
 =?iso-8859-1?Q?0sBFryitxtQncYSWM2kKFR3EhSMvO9h/uQiu/wyvfsg5RMjuzcxh8vrbXa?=
 =?iso-8859-1?Q?pVZKsN7KCqljFRK2rm4uJcjjuEbIGjOQim4fPGJ8VwtjmroMleGvQ8NCzb?=
 =?iso-8859-1?Q?iaqT9SMDdhhduM2VP8Z7ERJT0hjLTurRpMi65YNzXpQL1bWyIiLJwgH3H0?=
 =?iso-8859-1?Q?NGBAt7gvfp5UjWnqCIUOPJtR7k/volcVxveYu0oemHNBxOrobw6GsBZQPZ?=
 =?iso-8859-1?Q?I420y130nkzEdC9/W0E0w6bedAuzOGurE5b2KK9WDCVy5Z+cFToI2rLH1q?=
 =?iso-8859-1?Q?DS6TXiWp51owGa6rT4f9TMU2OuyT6QZhAMJBTjXtaWTxvNXRwHVfRv0RZt?=
 =?iso-8859-1?Q?EA9ejrg3RMcaONgB57VAvUqCYjaoOrgor2YjiWQn1Wl5bgh7JOwls6FCOF?=
 =?iso-8859-1?Q?mhc/rCfkD5vFmAr7zZ/3SSV1fE+C7x6bzQZ1akw4Pp7+v5dHVBgokbBQ3g?=
 =?iso-8859-1?Q?cDeFulFTUOGXBRi8Humo2rzr9hIPhhlMmXLppOvhwk1k2/Iq68y8f7sBJx?=
 =?iso-8859-1?Q?4fiOOPA8lUuziIeeD2MI4F7a+2M7nwQAaUD4oFXOxf4EyAijTRN1gqpQvC?=
 =?iso-8859-1?Q?DWi69Herflo7oSg7N2540kafrvGRa7RrJfeSG8zNYNmf7NR/iu5DQXbak+?=
 =?iso-8859-1?Q?h3luu4CF7s8gWkvK4dHO8pWhiuQ+yOxPd+kHxyMobYSJCumE8mVEIYJ6bE?=
 =?iso-8859-1?Q?wBU4s7b63jVsUGLfGvn82YnNBFqgvuo3Nc+HUnozbrRCjvWdWIbAOmEf02?=
 =?iso-8859-1?Q?v82LndmprZ/Fsgw+0uU2FDNetMVll+f0V8hn8QCXxrkbIrvYf+qDBeDxv4?=
 =?iso-8859-1?Q?6ojmVXnV6C4YaQdyaIMZRYlhzMEoxZlkbMYTO7TluLlBGSuYL8vi4/oK69?=
 =?iso-8859-1?Q?a7QWTQulSRgCB9Jkb2tDb/uofAmfxpLiGQKf+si7r6cOj01is5CF8JQ3C3?=
 =?iso-8859-1?Q?Uy3mWb+JEaamqLxaOE0qGMv1CTky4Ok9jqLjrn1zJ4G3c0KXjuoVgkj4v0?=
 =?iso-8859-1?Q?koEdJzKhOsDvCmJPW5ZXC0Ziyycpp7pHj7DWDQXlekIupqiNE8D9r1xv4r?=
 =?iso-8859-1?Q?F8+uIWBH3q4dh/Y9ncIFSSUCSnLTaPG2v7OdV3TvcLgzVRvn4WumkvRiIY?=
 =?iso-8859-1?Q?K9kQxJRQPasqQdhYbV6TqWpynFCBF+0+wQpBShNKb2B56+vbzlWABuYZI0?=
 =?iso-8859-1?Q?U+A6+gNl91WIwJ3fGbHVq/Pr7P/iwm8CIkeE3gEl2ju+at3ydFjDORVY7B?=
 =?iso-8859-1?Q?ChJIE1G787qz2FscIwd+VA5xCNuWCCnGk4mgbv/0iEVYJ/9n0sR9SaxRdB?=
 =?iso-8859-1?Q?tzQlzZ8lPRxvNUEje28NUvpH8zw3XQpk+CutuGoRDK3RurbE6ETTSaekJZ?=
 =?iso-8859-1?Q?jqwwbE0gISvJko/3IKh8x6oGQcWBmvrb6WbgqKSyl1Yd4z9EVUKfIzGdqA?=
 =?iso-8859-1?Q?NuLXto0NyQGZqYmWmqC0e8n2zat+2uxay+9uTHNcbfXJiswtNN1WXu0w5e?=
 =?iso-8859-1?Q?ruEYnqXtwa9JrMGHEjrtyZVunRt5v4gxkazoxddXYlBR4ikm7DMDmD7Hl2?=
 =?iso-8859-1?Q?uUIq9IZQ4Yi94SIxRxD90/O1CeyV483d0o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2654837-2ae8-442b-7313-08dcb013c1d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 21:16:48.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nox1lXuo7eSZ98cwn4VWvf6pLfG23V5lVVhqGOeZUQa5wyagMkV+CTGY1Pm0gCrgzp9i+6D2Tm7H69ZohWRI8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9873

On Mon, Jul 29, 2024 at 11:12:13PM +0200, Christophe JAILLET wrote:
> Le 29/07/2024 à 22:06, Frank Li a écrit :
> > Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
> > difference compatible string.
> > 
> > i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
> > post_rcs_wait.
> > 
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > Signed-off-by: Alice Guo <alice.guo-3arQi8VN3Tc@public.gmane.org>
> > Reviewed-by: Ye Li <ye.li-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Chagne from v3 to v4:
> > - Go back to v2 according to Guenter's feedback
> > Change from v2 to v3:
> > - Set post_rcs_wait to false explicitly to maintain code consistency
> > - Add Guenter review tag.
> > Change from v1 to v2:
> > - Combine to one patch
> > ---
> >   drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
> >   1 file changed, 9 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> > index 94914a22daff7..3a75a6f98f8f0 100644
> > --- a/drivers/watchdog/imx7ulp_wdt.c
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> >   struct imx_wdt_hw_feature {
> >   	bool prescaler_enable;
> > +	bool post_rcs_wait;
> >   	u32 wdog_clock_rate;
> >   };
> > @@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
> >   	struct watchdog_device wdd;
> >   	void __iomem *base;
> >   	struct clk *clk;
> > -	bool post_rcs_wait;
> >   	bool ext_reset;
> >   	const struct imx_wdt_hw_feature *hw;
> >   };
> > @@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
> >   		ret = -ETIMEDOUT;
> >   	/* Wait 2.5 clocks after RCS done */
> > -	if (wdt->post_rcs_wait)
> > +	if (wdt->hw->post_rcs_wait)
> >   		usleep_range(wait_min, wait_min + 2000);
> >   	return ret;
> > @@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
> >   	/* The WDOG may need to do external reset through dedicated pin */
> >   	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
> > -	imx7ulp_wdt->post_rcs_wait = true;
> > -	if (of_device_is_compatible(dev->of_node,
> > -				    "fsl,imx8ulp-wdt")) {
> > -		dev_info(dev, "imx8ulp wdt probe\n");
> > -		imx7ulp_wdt->post_rcs_wait = false;
> > -	} else {
> > -		dev_info(dev, "imx7ulp wdt probe\n");
> > -	}
> > -
> >   	wdog = &imx7ulp_wdt->wdd;
> >   	wdog->info = &imx7ulp_wdt_info;
> >   	wdog->ops = &imx7ulp_wdt_ops;
> > @@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
> >   static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
> >   	.prescaler_enable = false,
> >   	.wdog_clock_rate = 1000,
> > +	.post_rcs_wait = true,
> > +};
> > +
> > +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> > +	.prescaler_enable = false,
> > +	.wdog_clock_rate = 1000,
> >   };
> >   static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> > @@ -411,7 +408,7 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> >   };
> >   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> > -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
> > +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
> 
> Nitpick: while touching something here, should imx8ulp be after imx7ulp?

Yes, it should be better. 

Guenter: do you think it is okay to move it after 7ulp?

Frank

> 
> CJ
> 
> >   	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
> >   	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> >   	{ /* sentinel */ }
> 

