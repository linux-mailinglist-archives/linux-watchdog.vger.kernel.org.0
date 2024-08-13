Return-Path: <linux-watchdog+bounces-1487-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2056950A34
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 18:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCCA1F26FA6
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 16:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A1E1A08BB;
	Tue, 13 Aug 2024 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MNR7087N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF67370;
	Tue, 13 Aug 2024 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723566770; cv=fail; b=mYXkhmb/knvJVH9sqi8NpiUTARgEOllsKfPqr0Cp3bX7OIyvJ/CwSooYg0T32eOJx7QdNFLJ4XXFUgy1c6tiUFkrWLizu0PXjQjHaSwanJqj7ALeP9eUAWg2wMlUtupzXdxXh2hHEt/vXeaGEOaJQmZX3riwuEe34EG9JaLMXC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723566770; c=relaxed/simple;
	bh=zyuMdmUUAZklwvLo0/4MDbah0ZuEn7II9aNtcYHQqNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JDQP04554qFq3KcJ7i1T6bkHiIxrBwj4PcA4OMbrvqckCnelAsbT42zi5QpuwORHaldaUYh7bY/06qO747vCjWlI/PxC5oT/Zk8ur02Jz0301jPoHSH8OqfbnrXC+33EsRdNqdoGjLHJk8TwBbbKHK9aSndVEoDz9hLniUobsTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MNR7087N; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQW06pLuSoB7qNhKD/yKXM23PxHiAyLXtrvKKNr1m2C3V2dYwx8vCDDzVOmoecQouNBU/wGSgykJHW+NFN+ojK6dfDXJzrRAJMC72+1uqB7XlB0efXX7sEzx+vJaBOoSBzujSjtBCEdDLt9p6fnoE+1buL/1tIZpMNLPUgye4wfM0Qa8Yo9qX0Q8vbDkg6Scr7BU/mceSPNiXaJ55JqnLsx0OSZaTJtDlNueKxCX75FMA0li/ENdo6mV+yF8DDO359J3NQEjidJJ1O38GVAS/ClFigmeaNdKUoV09IsHu6diwWNTx97mnEJkI3aQ3hP8GXqv+LYoLQs4uPvC7X3y/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3k6auTpKCtcxZqwm5L6eNUmOmLGCOeEUb1ARaQ1Xzyw=;
 b=hmYv1ZsbDPGGa533IfFBrcwsWG+RvpCgFbdV1KdvLW8Aenz3jq8dI8hlvDnLBr5BBcACyIJcAWPTQjfDCyT970Q2MMcphshfsRVSTgUpfDPP2GE4h3cDzI+slLD+BL3b/sOHB/onqdMaUvpEJZtSTCnaDznSC9EeGswBG2S9iZBbC8+SbbtoYMLqBVy+gDah6ko6vI2QHQ2Mm616nq7lLJe3MMYWbQZ4VY/IdzzjYQycUkO6q7bjsNgL469EI3be1Tf42SlthaQGU159vU4Cws/yh0daRk51Wg6Neq9MusGAy2TDJFeilPNJ7L55j88XWqOU/7zDUOUaBkvtX7gB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3k6auTpKCtcxZqwm5L6eNUmOmLGCOeEUb1ARaQ1Xzyw=;
 b=MNR7087N98kB4NSoTHBjLt4uh1PnqG2tA5owr7DiXteu/pN/SDFqPjzS6jlxqKldDIuk7emrNy/MR1A+NnFrM/J+ExG+lFemT9DjGNJ9coIobLFx/iKEMJKcWVQQaoMoMV6YLU+62SRaVMsA8biyArgDZxLj9z3R5G5suofs5naQPNhDFKTehVVMhC3GfuIju4ee3Awz9OmFE4GudxNl7xsKO1wRzYbr2Hlz7sPFWvvTG/uNvgANBtwIla8hYafynHadaEm7a5lwKiuLP1WHemScWpd06TpHjuEvHavn3Wd3Q+wMFFnCrLTa0al3OnMrLBkNPsm7LNTsoSuqnhR1qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10295.eurprd04.prod.outlook.com (2603:10a6:102:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 16:32:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 16:32:44 +0000
Date: Tue, 13 Aug 2024 12:32:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: convert ziirave-wdt.txt to
 yaml
Message-ID: <ZruKpJ08abhe9nwV@lizhi-Precision-Tower-5810>
References: <20240812162810.3812802-1-Frank.Li@nxp.com>
 <20240813-trodden-paprika-b2c95d1d265d@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-trodden-paprika-b2c95d1d265d@spud>
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: 762459e2-29a8-4738-a64b-08dcbbb58f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2HsA6uixBOyBhu5xnZq1AIpwDjVhMS5EQeMG9VZ173p8WXVu61l2uOqallIR?=
 =?us-ascii?Q?nesp5Q9KPcrk1F4OEbQrF2SPC1XrqUSMwqenXDfNBVRUkDBOsBAxnOajWUxY?=
 =?us-ascii?Q?drjlAcw0M8MFWcekiWR6RWVVddDUAFkcClUO2sGFRvy9w5pNbrvsoZ7fS5yX?=
 =?us-ascii?Q?0GC8o1i6DyF+zSZGuErYEdDVgi3SUC0JwX72vpljZJy12nvfspTNs9Jv4Nx8?=
 =?us-ascii?Q?U5cmXTM9JDBzJY4iQ44tUDJdzySQP/Y0qIdoxVdJZkXbxNuATGZjd33MEDiW?=
 =?us-ascii?Q?n5sr6U/48+tcjw43+01odOeUwUtcuUo9+BtnGaTHee6lfqgieuKz8wC69h7Z?=
 =?us-ascii?Q?zJWeqKtyIhnYV/R+dmtLQzcKea36DM4mHzWTiq0aIv6oTYYnm8pzBTHLGP+z?=
 =?us-ascii?Q?/eYlAxmPYGzaXlUEmdt/1W42brx2KXk/CoM/jLTcmUUBxsrIUh1arLug4cmt?=
 =?us-ascii?Q?cGVzzfMGfSfvtpKs7XCrNvFQGyOpD4Oo6ARJCUTtgN3KQmcm/iHQxhd0+jw5?=
 =?us-ascii?Q?tf8JAHrJsIeSeEnbGZuQz8ZUiLWeIW1quF5MIE/aD5UNdLLSzXOj31U4XBef?=
 =?us-ascii?Q?iyYB1n8sWkp+ZAhF6iL3lO1+Ibsr8znfzT5piZIZmQSmeTvlLeS0argBkapy?=
 =?us-ascii?Q?QePTe4vNrlePCfFbk7S3zl7B23xK0X2IRaLzOijpmD7k6TfCFvJSw1nfP7vw?=
 =?us-ascii?Q?baZYHpdL9UDAwgqzslf9CghUVQG51Mso6aLLL95sgmXSjDHkGHugYTBmAvKk?=
 =?us-ascii?Q?QE8ugAQZfMEyJE1i8nXxlMVc5FxNz0HXw9gIA5BKgf8VplD1qzZ68me8Ofkm?=
 =?us-ascii?Q?zSgpWBmocTaW11q6dA3DLq+nU6naYOpDKK8sOfCAeuEGhEU7YswyHqHS8Ezx?=
 =?us-ascii?Q?Z0FX7qUBPSSSsXfaMaSwtXx6LV2fxKX+PSXIa7sHciI47DaM+7VU8SUeemq/?=
 =?us-ascii?Q?tGjA2zPTIAQxzdy6eH272Y0auRAmJrsuU2H7tJ6wk+1+2ab6Jj6tdnzCRdBs?=
 =?us-ascii?Q?KJklFWVTMHr3XM9Xo8pHBmmFGiqKa3K3wVPijv2nJ1PiwOVnBSP9BGTRtDWL?=
 =?us-ascii?Q?J1zN8I+W+DEXGzIhMIGIgrQxLJT57aovA6FcNBFnjipAllSc6Lkqd5tChjJt?=
 =?us-ascii?Q?ikBuuyNsumRdwD6QMm2UlED2/kU+l5Gh1aWA4h4ZSFKyorEuabZxBBQc6ylq?=
 =?us-ascii?Q?pzoeCBNA487ZPdKS6+T+Dr49GMDGh1iedprLCQPviTy45oKjD8s5qHaFVvWZ?=
 =?us-ascii?Q?FaJJJg6DGJAVGtf7b36TSQxnuySJJu4PGSEVYwMY2DuprshR7cfFEnUW9H/I?=
 =?us-ascii?Q?oPLh6LTU/W5LvSBdG3CA2JFecJo1NMTBCnoqBTD2vbkBdVW9j1rX+PBGfWc+?=
 =?us-ascii?Q?J4bErs4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgSmQ8anFavoiQDZl2Qb7ezqBj2KYQ8NcCPIhw5eDMdWcY54hpl7qZv4XZSg?=
 =?us-ascii?Q?oaD/VboDyFSQJsU1pv6s2fKp6tiho04E8GYvGW2jwKv8YKH0tXKC24V6RCPg?=
 =?us-ascii?Q?YKvS4czeI0v+kS+eSM1eb4sA2rbNc8FpzXkKB4qM1nC/wN826JeOc/sVFBTa?=
 =?us-ascii?Q?vpNIWQ8KCy2x1i7YWhtHaLiTxy+1kRfuYvJMqotgWp0aAlGWs1MQF7/FKJ+z?=
 =?us-ascii?Q?SBlC+qo+AHji76Y7VpS0IyY+dhG6APGooFiMy4lnVa3JBtVwUxIXJAhlqA2n?=
 =?us-ascii?Q?8KqtNKI5iOAdptspytMdG3nNgwUFZbmfAkm4/48zIdd4xHr+qCxWDXQsU3oy?=
 =?us-ascii?Q?iaTlBVBReQeo5wqwlxqXqzBbIn45fYGFK8CGzAzfhFhp+NAYWIYBck/NkCA8?=
 =?us-ascii?Q?XjZUVW359MbWODjTYK56CF70OojzvCe2LYUrTTiE5CTvYuQO5B5MnIoCJ4YV?=
 =?us-ascii?Q?4drRzpZoSbKbZkUS7K6AJu6YzV8Udq9g/pDo2qt2o39jQ40iZDpThGOYTbBE?=
 =?us-ascii?Q?xBH/XeCD8EfD0Y3UkR9O4UlaasC9K674+yyLBaGrO0G1m+ORz1MOBKWFSq1R?=
 =?us-ascii?Q?lsocrlEFiBBgWwTmPAJz1f8a3+frOVo7RC2BhnRsc9ZPquv9Q+zkW72TaLpI?=
 =?us-ascii?Q?ciiC7f1osc5lwIaP7LFBnz3QRSFcLxsbu9WGl0A564udmf4t0Bw5Xim2xkOw?=
 =?us-ascii?Q?CJbUUrJeM5eiVkUvHlTbBDX3FHSsQofAlpy5Vkke2mlDNKb2m9Smnd9oS4BX?=
 =?us-ascii?Q?7ZIsOqYgianebNglRDVWz7Uv9uK33a7LE0h/hBvKuiCYBnLI7ALP5uk3fCg0?=
 =?us-ascii?Q?XTl5GpjQtdcbIZFCRLk5HhhKdv6YbFzRfmmAk6YGpy8CGBolw/F004QCERFJ?=
 =?us-ascii?Q?U2VjW5re0UJ0aMGOaMffv7jJEn1OLW6qK3jyVGrsFDg0a3gBEx89dJxHICyu?=
 =?us-ascii?Q?nK7ltkBVdPO8l2SkzVY7EmKcpQ8SH39dCi6Bce6SHUM1UyabxUHPeTEXmZkl?=
 =?us-ascii?Q?kBwNpPWRJid5VEw5mYsGIRiTcgHkKkcZM4cjRKGVvF6TgNEvy8yIOv3qW+Ke?=
 =?us-ascii?Q?ZAG10+dyyz7G1flsa0qeVUffZ78PE62OLB9VG6r9Hws1Jy2BMq14qflthqpG?=
 =?us-ascii?Q?0x5I1TmYwi+KhUFQaN4Nho2KHVVbdbMH1Bb1stIf1AYk8fLI8zPXf+OmPvtK?=
 =?us-ascii?Q?KBbs0/0o+aR4dVbCopTfOri9mYc/hmKzVUwh3gTikDKnqCWf1xScEbNS2i/H?=
 =?us-ascii?Q?v7+zNx6N1PAP4qOlEVslIJ/qmEE+sn2683IYPAZSmShbPtOimt78vCFT11mL?=
 =?us-ascii?Q?HffdSnw3gRgn+ovQt5rzt3p4Oa76bb0mE6wcfBvynbLJPcMoA4/ZEIc88Gii?=
 =?us-ascii?Q?X7IG60tbl6CSbXu8ftNcxiIoiBQr3ef7CaD9+BHQrc0B3g/Pleusm4h6QHAF?=
 =?us-ascii?Q?AyXF+U6VrIW3LyO4ylpnDqzyeoNH54qYzhwS7rePZeKLlLKfR+F2OpJzzCxh?=
 =?us-ascii?Q?fWDbWdFVkfYZq/qzYsYseZSNohk2AQgY6rpixaWpqXo0FRLuSzeMSwQaiTkG?=
 =?us-ascii?Q?Yqw7rTr3UaheNqThFn1HwIj9b5Mex/Wb2rI2TM1L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762459e2-29a8-4738-a64b-08dcbbb58f56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 16:32:44.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VUTX+mmbcTweJXveo6kxjZc1mqRN6nowhEHX/tEG8uYy9lcCUjorczZKPYsU6XziJ2VU5FcaTSLza392uPqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10295

On Tue, Aug 13, 2024 at 05:09:52PM +0100, Conor Dooley wrote:
> On Mon, Aug 12, 2024 at 12:28:09PM -0400, Frank Li wrote:
> > Convert ziirave-wdt.txt to yaml format.
> >
> > Additional change:
> > - Add i2c node in example.
> > - Add ref to watchdog.yaml
> >
> > Fix below warning:
> > arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38:
> > 	failed to match any schema with compatible: ['zii,rave-wdt']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change from v1 to v2
> > - add ref watchdog.yaml
> > - Remove timeout-sec
> > ---
> >  .../bindings/watchdog/zii,rave-wdt.yaml       | 47 +++++++++++++++++++
> >  .../bindings/watchdog/ziirave-wdt.txt         | 19 --------
> >  2 files changed, 47 insertions(+), 19 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
> > new file mode 100644
> > index 0000000000000..0206d9ddf872d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/zii,rave-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Zodiac RAVE Watchdog Timer
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
>
> When you're converting bindings, listing yourself as the maintainer only
> really makes sense if you know/care about the hardware IMO.

I faced this problem. I am not sure who I can put as maintainer. How to
decide binding doc maintainer? same as driver maintainer?

Frank

>
> > +
> > +properties:
> > +  compatible:
> > +    const: zii,rave-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: i2c slave address of device, usually 0x38
> > +
> > +  reset-duration-ms:
> > +    description:
> > +      Duration of the pulse generated when the watchdog times
> > +      out. Value in milliseconds.
>               ^^^^^^^^^^^^^^^^^^^^^
> This is obvious, and could have been dropped. Keep an eye out for things
> like that while doing conversions.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        watchdog@38 {
> > +            compatible = "zii,rave-wdt";
> > +            reg = <0x38>;
> > +            timeout-sec = <30>;
> > +            reset-duration-ms = <30>;
> > +        };
> > +    };
> > +
> > diff --git a/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt b/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> > deleted file mode 100644
> > index 3d878184ec3ff..0000000000000
> > --- a/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -Zodiac RAVE Watchdog Timer
> > -
> > -Required properties:
> > -- compatible: must be "zii,rave-wdt"
> > -- reg: i2c slave address of device, usually 0x38
> > -
> > -Optional Properties:
> > -- timeout-sec: Watchdog timeout value in seconds.
> > -- reset-duration-ms: Duration of the pulse generated when the watchdog times
> > -  out. Value in milliseconds.
> > -
> > -Example:
> > -
> > -	watchdog@38 {
> > -		compatible = "zii,rave-wdt";
> > -		reg = <0x38>;
> > -		timeout-sec = <30>;
> > -		reset-duration-ms = <30>;
> > -	};
> > --
> > 2.34.1
> >
> >



