Return-Path: <linux-watchdog+bounces-3085-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C4A5D951
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 10:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B2B93A65A1
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 09:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0106C23A997;
	Wed, 12 Mar 2025 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N8ERiRqM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA771D79A6;
	Wed, 12 Mar 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771457; cv=fail; b=Zdnm6DmHDRNqEAH1wxSO5EkCIWd9YBTIIqAxyEDJHcYfYv9AtME+vos28a8L2xeKODEX9isFJZWdVHNPOiuIs7Sq/64HGO6NO2VFH6bqj7jVzCYgT1Nu+SSfIW2klRYcohwAe0NDSjeWipvOzAnj/Dm0UDJiMEBazbuKBl2feEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771457; c=relaxed/simple;
	bh=VLvb4VF1W5enFzFo83AqaVoxxsPdH3QQEawsJFdUBYU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YFUhNkdQv0jxaBpON6BZ9rTM/B0LXkrZ8Wdp1DwrvptmxANC7WQ1ZPhWbE7vCukOHpNzFBWfb/owJCPHiCXCuVKfIyQblkSmgFEOmyWJ14tVK17/pE/QEykBA54QwDplK8aC7PiMopY4gfuq15ErZQBRnsGcw3keM+biYFVm5G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N8ERiRqM; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiJutOT6WyC4rVnMHpwNJLLm7Jkxy8Fkuebd6vkBOhVPhcnxlaRb67dcBnnRx3eX+aI0V/1p3MfaCwNye/ouF2Xcf44U7Kbo0bjgvAN/f+gVs6SgZQwGsy0ck8rQc0xMie/r7ZmVIOu6e7Ah51vREn4Iw/hb8mMBt/mca/X/UF2MUQo9Xubn/gMdvNA1/Al2ezIccAn9sn1RpTA+pxomW9fNrhlmtf90SKxxAvjAnxujzpct9xgtsqJR3N4FEiMcnFtD4jPMdZ0bMcmi5vgx/5w8I5eqv6wOxucWdyW9XJeQnL37TinRE0vc42zk8MXB1bzShVxbC4g/nO8iHIpVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnNZNdW7fHrRxCHiUynvnUe9/XvwqzUQtWAaVerE+dI=;
 b=IBKQYWXoDx1ddPdEP91zx1rEgOljenZWa1FVZ8HbW4uw2J4LaRWnE+QwTanosO8/H6k0LBdSOdw4QoHnHLzSrcsL5qMhK4GEi5uBYGYuxlqfbJbkYVCG4RGNmoeDbJJJDoxrpdI7O9UvmWLj6GTDkSPms1oW0UML521PXCtAA95sOzfW7CkhnkDHCCpqku8eWzOassjD5oNKUMMpO7BMPl3knKmDeMUIy9rQK3rh5a3oyOqxtJrC2D2bjrpttgByJcuq75ZvRmuo1N064YTr/74XYIhXN5LlC+0RGvkY9ujRymSk6hjCAXXdMnZVZnunksjKKX7+QbIEzEkLmGQBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnNZNdW7fHrRxCHiUynvnUe9/XvwqzUQtWAaVerE+dI=;
 b=N8ERiRqMUI20qbTulJoq4HnhUsM7fMQ41/iEJEMijsCu2V2cc4HomkRA2BW1OeIGEzbiOqKpA27qaZceJmJDS1wGkOkJu7Ex49GEgYNuOIzeoEIIqU4i88wnFprNGrtopZbFnfgWu53FWgb4/ZMCjiLrOzo0o4V3Y2TjQT8fzUI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB15939.jpnprd01.prod.outlook.com (2603:1096:405:2c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.18; Wed, 12 Mar
 2025 09:24:10 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:24:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Document
 RZ/G3E support
Thread-Topic: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Document
 RZ/G3E support
Thread-Index: AQHbb/X7jW4JnPj2FESM19KCnUSNd7NvgE/A
Date: Wed, 12 Mar 2025 09:24:10 +0000
Message-ID:
 <TYCPR01MB1133249AA08160DABC40A31CD86D02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
 <20250126132633.31956-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126132633.31956-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB15939:EE_
x-ms-office365-filtering-correlation-id: ae804423-6c22-481c-5fcd-08dd6147a5b5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zBTkY3/7Tl95f2fIi2nRqK+KLUaxvp6Zo9uYF2YBdshWGgJCjVp6zVFcPA/Y?=
 =?us-ascii?Q?0Bd4LU6Ujk121pF13RDg67WLs7xS5RJFgS9k+SGs2EJ0CKuhuGA5YXoAnotX?=
 =?us-ascii?Q?18JvuoIW+rWIBu4+ZY/pWKxrIsTTTIlIzWa15IDaUjMdBEgeFS2oM9brTWvZ?=
 =?us-ascii?Q?HVC2TNlW2Y6B9JYbcWEPHdrEyfPZXW2WVPdJONzZCaVe/Tm1w/LjIF1G/sfK?=
 =?us-ascii?Q?78Xwm85ASgKx1xC1v85mO+TuxBgGxAILWghjJAH2CVpGjrkT5WOOfqqL3Io9?=
 =?us-ascii?Q?c51aIhLiD73tZX4IUHJxYWc+QXjUNbF9Zsv8CukGaDSn1QwH1Z85Vypv7vhF?=
 =?us-ascii?Q?4W+2sxS1IrqFvlRTv6b1B3Afr0tLNJ1+MT8P3qZplT9jPqddAu7T4uH2dg4X?=
 =?us-ascii?Q?+jF4AQafYYKnlZgir4+1R1Ayc5KeVKqOIyHuvo0vkUZ2w9tv0HOzfMQHLPO6?=
 =?us-ascii?Q?2/ig47LPbsu0RNuiItSR7iKM/lR29duXhkaN1INzG0aMXDjxx8UjTra1UCZt?=
 =?us-ascii?Q?l3LmjxcPxK01V3n6bZ+0WcNAcPJohDmRCs6Yu1/hcOTFAoMd2tbJlrhUnLWU?=
 =?us-ascii?Q?2MythiO3Xx0tvI+LHZwmuSPo6KpENo8Kg9eVFno143Wks4iJbW0SoNPhfHdI?=
 =?us-ascii?Q?z2sFELGioOWfKmqjVobxCzwHIkJY8YP3IN6ehktn6MpNPeX5AlBQtzSmyukK?=
 =?us-ascii?Q?4BjyXPalrFs83pqqP6u6ai5ua1Lxv+s74PHkrjiu9DkUDzOUfAujXMXYbvN6?=
 =?us-ascii?Q?8+I0f6HNv/X9QHTEvxCHUdWbFlSljB+ukqdnH+hUZqI3JVzRIYUYhyjXhQQi?=
 =?us-ascii?Q?pAPckY5wMBEt7F9gu7AjXowZpto+8yKhvzV/lPx3ZNz0nCU1A0dS8ULXGvtP?=
 =?us-ascii?Q?FkAQPJkxbRQ2waM3qx0SrLsF8lSEzBisTUOo/3lpznaeHzVJ9DuTmDyOJS3s?=
 =?us-ascii?Q?QIEAiMtdVGVBhmpuH/2PV2azEH08Pqtfh+twAi2X/3Y+eHNqwNk4FawfuCEg?=
 =?us-ascii?Q?MqvJjt2WlO82EjT8PznwoRkUj2NdOb72ARo8N5b06hmhxVBv2qPS4OB0CslT?=
 =?us-ascii?Q?zzBYG2AKz0jygLrRakDvpUhhr300zRhX0Xw1DI94/gxn0luzSvjafQPZdJ5h?=
 =?us-ascii?Q?wyCqd1A+ckd6SrPOdCFrgTvgeqaThoAUqKej3F8jNbimCK6cWZQdxwMUrpTz?=
 =?us-ascii?Q?ZVT4aodxuv7laSde/UW84cvXxtBXv5/2qcz+MbMKtABPpWgHqZOnrXIoyNo8?=
 =?us-ascii?Q?T4yXH0b6yqQzaGwvqQWPX3DhLE9d1BwiaXKpN4p1CHAvPp6IPIULoOChsMfC?=
 =?us-ascii?Q?kF00H6rpVe7HlBAYZDIWdqQLeEfhc+iXtB6NPEuowe7Bn4lY46bA+LWj6qcl?=
 =?us-ascii?Q?Vd7azAhtLDf824s8tPOK5slmeUUoJIXrEFAWySO9BpWgk2neXQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?x11fJsuENmJtt/sH5DLrfLIw2XiSAfdbJ486qusyyJXDoPcexYj1p8leE6Td?=
 =?us-ascii?Q?+406P9a34oLEw3UcoahmMfmfVpFNoWoeTy8u3S4GJW6+ciyYpNSnckdy5Kik?=
 =?us-ascii?Q?AK39fMGd26VOdZlC5YqplAasq1bRGbvNdTKAbO/cKDArCZg2ektvjpyR7Ngu?=
 =?us-ascii?Q?WYX+djL8rhL/TgnvjPgeXvAoqNiiE/7opJoFoxZlbm/GrnJ5DwnGs6w5xkP4?=
 =?us-ascii?Q?OpmvrGtVzMi3MHMGCJKTfIHOPZkmTg5t0Dl+a48xlWHD54EYNv6A9VtM1R5J?=
 =?us-ascii?Q?DkssDop9O9m9PBT1VcMsyKz5GO1erwe5zMdyaaYiiKB/IqVpuHG3ND8NmcLW?=
 =?us-ascii?Q?BVT9asCQKmIi+OiVir+0K1Z0A6os+NTbvRB/3XKmdE+w1KvjAPEYVHPR62dv?=
 =?us-ascii?Q?qAc9mmeAoTXNjAnkK/m8sXIfkPITWTapympckMKeKkLJBzk37KsgA3Y1K7rs?=
 =?us-ascii?Q?vZNye0CLCLanaGYQ0R/5AFhKOKcVQm/puhQe/HX3392tFB5rIgJn4pS7zyI3?=
 =?us-ascii?Q?V2YiKGmSNUMu3m9woq6+lclqCyGHSuvZaAIAQqWT2vCgB377T6xmWBW+MEAv?=
 =?us-ascii?Q?/Mpn/rTNuvP9zwEVI8RPkx9Oj/4yc8u0JRePOGJELSo1PkWeOiXmmh7UtHbG?=
 =?us-ascii?Q?jJSQ8NFkVaVY9qXDLhRG4KF99yCfNsv5j6IIBnB9sUqmDlNeyA5Y+1L9yt5o?=
 =?us-ascii?Q?ATaqn+akObmF0DIVQPJrpur7Jp3E5p9oRdA4xmkLS5giR1CsBeIaaddDEbYh?=
 =?us-ascii?Q?IvtLwQ+Aa5meXfhVVG3Gy24X7CWPCwXUIEspNbQ+O0ARejABfZ7C0QHCg95B?=
 =?us-ascii?Q?oWYca83JPKvuKB6TkOssO5gH9UBPCetPHMSI1sUYyHtsF3oT4n7eEJvO5yQZ?=
 =?us-ascii?Q?j4r3xWhjqw0RI5yxJdbq8LXeHoIo6BvUHGeRHwmgg4S1W2yCaVKy7zybdlD5?=
 =?us-ascii?Q?EVi0r0QEZnHE3dinRrbozzOu5qyGv8U+KK83AXGBmKxG7icaRhZmHsOKyVw+?=
 =?us-ascii?Q?Th7/0pGhIkfjKFLZnAGy1pty9INDPZiBSE5lCva7/hxV31nnjoCRpakNipt7?=
 =?us-ascii?Q?EO//jMriS/kL6IONS/z3SetQ9YnGDkttRUz0E2pb3AG1aY3zD2WzUIrl2gMk?=
 =?us-ascii?Q?IiGpIg9yEc1WtVYi3GBJI6kWPhoLOyy+oTQB9JvK9nlNVgeRlGrKJMOZMPsp?=
 =?us-ascii?Q?+sQBFh8JzAyFLoL9UwymucjPqxLCNlUsRqUz7wtyaaTEks5ENPrQl6IJzEsF?=
 =?us-ascii?Q?YFhgtfhweMimF6yA/3eikn9VWgbc95+PIP+lzXtec0A4YR3px/UM79YIbNGo?=
 =?us-ascii?Q?HkwoXHP9JgNNtJPTGHIOCRkzTdR8/PGXXkzS0Tx3w7StKU8R+1E11JkBsULb?=
 =?us-ascii?Q?YvRAKQCxBTrqI3kNdBEg5Jt1GNzOFGZBqidIzbbSGHuTlTHm0AcvTO/ngOuL?=
 =?us-ascii?Q?DTr8RCzCyGxFH2cBSkfPPcr2tOeYlqUQiqFzrwHHnTq3Qh0alJTCx3o3Ny9N?=
 =?us-ascii?Q?gUEpPCuu7AH0+F3hTssX8N0OZ7hQ+IiEy2/Lx7KoVZjPGRMlkkNmhYdYaAYJ?=
 =?us-ascii?Q?5KfBgygU9X5nARPh5LcKNMwGC3FhmS02Ui7i5cSx/DF2eWLfCxtlke14N3jM?=
 =?us-ascii?Q?vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae804423-6c22-481c-5fcd-08dd6147a5b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 09:24:10.6691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CijN1LGdn2W+o/bbDt+O/9OPcIczWAFc6/bZ0s8LRbm4oU8+6EFPWeg+/M+dbZvEXAKRGi1LRpImfE/JXddcfLUtLPXL89feWrKWzqkI1pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15939

Hi Wim Van Sebroeck,


> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 26 January 2025 13:27
> Subject: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Document RZ/G=
3E support
>=20
> Document the support for the watchdog IP available on RZ/G3E SoC. The wat=
chdog IP available on RZ/G3E
> SoC is identical to the one found on RZ/V2H SoC.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tags.
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 29ada89fdcdc..3e0a8747a357 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -75,6 +75,10 @@ properties:
>                - renesas,r8a779h0-wdt     # R-Car V4M
>            - const: renesas,rcar-gen4-wdt # R-Car Gen4
>=20
> +      - items:
> +          - const: renesas,r9a09g047-wdt # RZ/G3E
> +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> +
>        - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
>=20
>    reg:

Looks like you missed this patch from the series as [1]
hits in next or you expect it to go through DT tree?

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/?h=3Dnext-20250311&id=3D331c8349605c8fa2f9040c39fe8c40afe3fdc3c3

Cheers,
Biju

