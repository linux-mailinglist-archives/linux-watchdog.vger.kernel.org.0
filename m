Return-Path: <linux-watchdog+bounces-1323-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 311E9929BC8
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2024 07:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB49328139E
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2024 05:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07469BA46;
	Mon,  8 Jul 2024 05:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u218QpYg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C986A171A1;
	Mon,  8 Jul 2024 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720417797; cv=fail; b=o7NyPWH4NMymhFljVUpEL/wjyjrajF9Y3lPessZMXNeEXobyYE17JEKJAtAjPJSKshU0TRVgJyd0vdRzq2fCFJ+n+xpEpcR7b7WelMbQvM+iPu9eCstkDEcbCpY8E2ynWE4YlplMpNsD685aNzcCcP0g7Uj8VS4rEABiY8NasCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720417797; c=relaxed/simple;
	bh=bhnruczJ6G7VeTtavRqT8/3QzNUb4k4LmyhITQW0toY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M6iGPYoaYmFVigo8ekWySJgGTUAxSDlRRc0SMY/YabQa0sdFEvsCXrfR3Hy0xAw5Gs68Cr0w/2O9ioKGJvQWVt8izD/jj2Hy2aOfwwHoWMi6S7qxBRiSY8XW9V1WlYdVD+/w3W2g69x0xixrNuljD1kJh6wTna9HBTOSfkcLpJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=u218QpYg; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQF6Q9d8K9sKzozQdjAAPGEwQoJQMD3Kq1bOp0VxyI+c5gEuSriW2uv/yRYQM3v9O+k/PiQqieg1ThpTxCZOiqIgtVGKDkBNoAs4KoCBTBHecy0Gl/HtZMkqi1Fg34Y7/SUfx1RoFZnG7zchjTg8cPaHzgv/fyg1bTV448678QkeLVm8hNn+AEgiPdm7G7bQBhrfpv3F27B8yKaD8P5dIwg6jE+Ja5+Tcgcxt4Ta2cJjQvCjP+13NR/XdqB1cY6xFQoPuqyp/NAIsQh+YjRUi2QeaJJpUWgZz7HTF1O5FLHMYByJ2bS6jMSkeTIEGhcZPF5h7zuq3MWu8Nt1ypIMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69v0Ecb1V97sxoZS2prJIF8dpJFPyUCiiVKHbXELj3E=;
 b=CAs7HTme3mtyAqD0ghM6j4HRQ2fN4WDxl0vgXZgP1wfYTJoBspZ1GjpZLQJnZ6L1r0cUGzBJ1UnxW2jTTmNvzPaLUo7tBe6tW+fr8GKDzbPLMGyY/0pxdCF7f3LssUrL4lNYxjZtKvZD/xN2939tb7AdQz+IRtattgKKCuRZ18Xx7f7LHQiCxajswp3mGO7mqY5JpldejspTQVDjoAAUr9uVR7GzkAQEQIbLAX1nx0gcNQalTFJZtI/B5sq5hLTW15C7pKV+8n7PbtTXAl0Xy2bMe1nSVs/lf6un3I+wovP1YIg9VlpoQhuBEvip5wkff+U6q3Dcxuqwd/qLAooEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69v0Ecb1V97sxoZS2prJIF8dpJFPyUCiiVKHbXELj3E=;
 b=u218QpYgmjfrIvbTI9d70xe9si7HzFOGTnVhLhRhvEXlnuD2BiIGYL6rV5yFH2lS7mayREFVCi9vQT8c6iK18H6olDW9ibVnVjRgQsfiQ5nDGIsDHNdTXTgYQKe4cw2xk5W7K61dCnoSt1dFDyH+zQoc3WSVxufwsUyCYmTNakM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8325.jpnprd01.prod.outlook.com (2603:1096:400:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 05:49:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 05:49:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
Thread-Topic: [PATCH v2 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
Thread-Index: AQHaxluPD8e/8wTjTkShg0nws3niO7HsaFkA
Date: Mon, 8 Jul 2024 05:49:50 +0000
Message-ID:
 <TY3PR01MB113463BA0262EA0B73AE2990186DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240624172509.106912-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624172509.106912-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240624172509.106912-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8325:EE_
x-ms-office365-filtering-correlation-id: 05bbddb0-af8e-4649-fb58-08dc9f11c8b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pbK6srzAz9JVkCHx9e7NUuZAXRn5Yf63ApP/pYIToMtPZLuo0VDQ/VOTpRM6?=
 =?us-ascii?Q?mS1vfEBI+xbTqvVR1MF82JbKafvBvth6dOz4ImYua5sXb4IorvGJen8ceR64?=
 =?us-ascii?Q?PHgtXxMJo0umeFXS0lT7nS4zblysuThRlOOgygj2BQ0FDszcXgsvrFBgNS+i?=
 =?us-ascii?Q?9Vfkrc9S8LCyM53MW0y/HHFS9E57pGGwz7kmXK9uBY7svRUJuO3UokHgf595?=
 =?us-ascii?Q?0x7Bp3NOu2wpjcnTDOq1t3UvnU6fNhHjXsVAty1uJ98oJ4gZQmj/c5iKdySB?=
 =?us-ascii?Q?FIuJO702cmzT1548LEwjquY+//F6N1aspC0J9VNyAwyPr+TXcmGHF+8QnEa2?=
 =?us-ascii?Q?P/Viiemyr612MTT8vQWHQzrbHZYDPGIk5AjqcSkHo/jKMZU0VNXzmbjXzPOo?=
 =?us-ascii?Q?oZ/WiVmm1a7Gip3wwA3v3AkZPKPSmyPOvgsCXfOtOPvxm/OK2ENMcfUDRw/C?=
 =?us-ascii?Q?NY9RKKz6o+/xRg9CPFPZd52VJw7OU7E+1Wt/CbxdYITgfgbRVcrjn3pvsSXG?=
 =?us-ascii?Q?uBaiKF/tpWe+TdCBn2NrvLDUzXBXaycBP/2kgzicxNw+5SRH9ByMJSsY2L8v?=
 =?us-ascii?Q?2H2c3BjPen4VYabemaLw2ytsBn7ZZJ85CDJHIA4TUNoT9uyzm2HiiQlWwiDg?=
 =?us-ascii?Q?ZBipWrVhTEYV44lsNAHm4kMmTIhEGM6V1DQqXgo0RcP83ajTeEXGX6aFInhE?=
 =?us-ascii?Q?f6qRgP8je/K/r6cGOxHbxirpfqa9t7WSBcKXBL9W7Z4XKZ98dHt0I+DXToii?=
 =?us-ascii?Q?AS28HYmuGEcLXSEEXoCBYObsTwiAbEkVM/06alfDjQDvGd9mLWarEctnILwZ?=
 =?us-ascii?Q?zV8eCxUzNgkdp1kT2Pqt56y8gWRp3Q58xHKAaFH1eEZEuNLs5X8wK0v1Oci+?=
 =?us-ascii?Q?GaBO40bBKxS7FYezWpiGqKFPuuuybCqwR0l3YHrkMEigrz+NyF8X6Zm4kJtA?=
 =?us-ascii?Q?XmyTQy/0TCL8+K4ja6QttxIpUVY4CKOWX86uXC2al9w0WCD+KXNdLJmd+Ok4?=
 =?us-ascii?Q?InCBPd0Qdz7US6oYzbqus+/1xMuA3ssfjis1uP8HZCoePzULMhT6dvqcY0fv?=
 =?us-ascii?Q?sTzVWnHgR6TVkYarg5ks2/YFmz9L21YIAYvLBFDlejZjbJOxAEZWf6L/SwJ9?=
 =?us-ascii?Q?j1dddBHZvbKu6xTeW1LHRjhaQVHFxtHr8N+kf+YUML5gkQEUxkAhSYNmUhni?=
 =?us-ascii?Q?oF4ABqFQTs/mkSnziqn0vpUwFM43CHXRwNtL6kI3HMn53z0vVG4VLPg5RQUC?=
 =?us-ascii?Q?igLeZLGrJeLJsugwiHGuLPYQF2oFLJwJVuWZHNobEZ+syaOijTgc+Yn3wsCp?=
 =?us-ascii?Q?qxVAHH0Y4vN3unO2Fwj3qYm+pcjbGSxkmE8z2qmaqr6++bx3QR67OLzWCcni?=
 =?us-ascii?Q?IRupXvE7qTVN/a9h1GCXcaCrNna6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6cE9VmKSi+Xj3/l4cp1ZcSLSChUVDZD1dF+08eJDSLtA0DU2YGxt+HzuvO2v?=
 =?us-ascii?Q?YJbZXCmuUwC/AOndVc54PYAHU7A3tgaHyVYovEOjxHEWsBDf5O57goEptj9o?=
 =?us-ascii?Q?8fgmUYTnvvaA4yhu1G78Ma2ZsRTJWQkv23goici8PtBGnTJ7B6GvR0gZXNk0?=
 =?us-ascii?Q?ZgW/ZMRoNjpz8lHDcbAHZD3gvtnJjXkZCgw3R4ezyYQc8DYn+D/QUZ0nSlVD?=
 =?us-ascii?Q?nRcH9Bk4wcEeIpabcAfAJBSRRZf0TnUgaOUFQEhEtDPbPOTQ+kanuiiLlMIn?=
 =?us-ascii?Q?hRXBzUSFM3tDvoozESlvou4gRK0mmsMmxDXs8yodeRISUgGfCAOdQr3f/Hwl?=
 =?us-ascii?Q?WrExKWvQmgmPRGfi0ZJs659msTEORLRbAcvJMDhI7uXA7/U4BtnbdmDQrJDj?=
 =?us-ascii?Q?Pad+Tn5unRoCKaW+XxAhJyn40PC9LjpQyZ/0q6HEdhTh7PhZws3S/Qa21wyh?=
 =?us-ascii?Q?VPW6m/rajtD+i4lFKdRh7HItwxRlHybP2M189FOLRm6yk2OBmn3XYhGDS3q3?=
 =?us-ascii?Q?z5a2Teq13RytRhySD5v0lvfizR8kKjHX5VyKbPcUnHFRUrl65VJ95ldu/X1y?=
 =?us-ascii?Q?Mgx076uTHYsa0ADrZSsEyx5KpeFripC7fDZpkEHJqj/zuuRcYwkvYA9sf6oa?=
 =?us-ascii?Q?sHjAXoWOvk9MpVITxOsxFgl2E6F880XjFmyF+IIbTfwuLah5N70zMrif1YuS?=
 =?us-ascii?Q?+N5myV8TAnTExUtBodab2IiRsO4/QeH9+ri9dvvtUy/kOivNuMlG1isbZ+JS?=
 =?us-ascii?Q?XhmfP0kre7q34bAlAnPsUbpyg4YH7iFCa7YMI5h3FM1YzBI4GK/BvS/SO0HI?=
 =?us-ascii?Q?eQDHl7iQam9WS+ZvMVbJYNXj7ZoU/Y1pL10HDMCMQDW1vaYC3n8ZxXQBwztk?=
 =?us-ascii?Q?gJtFgurn+mO+AIOPpRE3w5w90Q19xpKRQzATlxZr6w8v6SHy/uFoLVGDrq8w?=
 =?us-ascii?Q?UIsi/rg4BBzJ0AOqCnraHsj5lMCv0rfSRdfXzqjox0Ok0myuH5uG7EsWyGlg?=
 =?us-ascii?Q?pPy46mNZ2mr/VGStdaq7Zs/XoFYNp/i6EU/40s4DL8h8PtFGMkx8s9yoSU08?=
 =?us-ascii?Q?2+tuCzc73CKUoozqywALl09jVMm9RKnbd/lH7CVydl+r3PJDoAftoTUMhDTm?=
 =?us-ascii?Q?yOrm8f28Vof9Yt6BIJMUNXAJjsHDrJvZEhNrFWAsjF6V/G/RS3KVw7P2vvQ8?=
 =?us-ascii?Q?CfPkkRQQ5SKnLkCOyRqbNDkx8K916kp2qhqwOVRKBMyvLLj1cgwbUmxkcP9w?=
 =?us-ascii?Q?JnE2i2ILJL4TF9Hvok8ZcWRgF5VMlFG3IlmraRgev+fWt7ykp/NKwwda8feF?=
 =?us-ascii?Q?SzgLY5ZAL/7kF9cW8lPMSiptycKMZa6fXFezftMThhJ6Zt1EVXtwT5f4twW3?=
 =?us-ascii?Q?hS3+FBRclh/diydO/lRJuAmpbksfNMOaHDvX6D+jU5bRLI6rUy6FPgXYb3Mc?=
 =?us-ascii?Q?vwmnDxQmTjisILfX798CzS8Sh7/m4ShHIS5to5sfmY2/5yO/4dN1ljZbXEJW?=
 =?us-ascii?Q?b344kgguA9BpZxrESKljP1NmKNQ3DnjLPjUjCJ0Un1k5nZ+J83Y07TyyoHSy?=
 =?us-ascii?Q?tioeMpO3FtFU9zFPcPWsHztIb/+eSeVFIyW5ffh9M1/ETGl6jjR8OvZ5M8Dh?=
 =?us-ascii?Q?Jw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bbddb0-af8e-4649-fb58-08dc9f11c8b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 05:49:51.0053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTb5LDMEr2WBp9CyRTXSjNhiYOzJ9azBHAN48VePm3+QZP81GR295gmjiU8DwZZxOEgDKVRaHrAozQ4LfCXP3g97o7OjbQNZcKFL/w6zE4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8325

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Monday, June 24, 2024 6:25 PM
> Subject: [PATCH v2 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add Watchdog Timer driver for RZ/V2H(P) SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Stopped using PM runtime calls in restart handler
> - Dropped rstc deassert from probe
> ---
>  drivers/watchdog/Kconfig     |   8 ++
>  drivers/watchdog/Makefile    |   1 +
>  drivers/watchdog/rzv2h_wdt.c | 251 +++++++++++++++++++++++++++++++++++
>  3 files changed, 260 insertions(+)
>  create mode 100644 drivers/watchdog/rzv2h_wdt.c
>=20
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig index 85=
eea38dbdf4..e5a7aaa2edcb
> 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -938,6 +938,14 @@ config RENESAS_RZG2LWDT
>  	  This driver adds watchdog support for the integrated watchdogs in the
>  	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
>=20
> +config RENESAS_RZV2HWDT
> +	tristate "Renesas RZ/V2H(P) WDT Watchdog"
> +	depends on ARCH_R9A09G011 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds watchdog support for the integrated watchdogs in the
> +	  Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a system=
.
> +
>  config ASPEED_WATCHDOG
>  	tristate "Aspeed BMC watchdog support"
>  	depends on ARCH_ASPEED || COMPILE_TEST diff --git a/drivers/watchdog/Ma=
kefile
> b/drivers/watchdog/Makefile index 2d1117564f5b..295909a1b3b9 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_RENESAS_WDT) +=3D renesas_wdt.o
>  obj-$(CONFIG_RENESAS_RZAWDT) +=3D rza_wdt.o
>  obj-$(CONFIG_RENESAS_RZN1WDT) +=3D rzn1_wdt.o
>  obj-$(CONFIG_RENESAS_RZG2LWDT) +=3D rzg2l_wdt.o
> +obj-$(CONFIG_RENESAS_RZV2HWDT) +=3D rzv2h_wdt.o
>  obj-$(CONFIG_ASPEED_WATCHDOG) +=3D aspeed_wdt.o
>  obj-$(CONFIG_STM32_WATCHDOG) +=3D stm32_iwdg.o
>  obj-$(CONFIG_UNIPHIER_WATCHDOG) +=3D uniphier_wdt.o diff --git a/drivers=
/watchdog/rzv2h_wdt.c
> b/drivers/watchdog/rzv2h_wdt.c new file mode 100644 index 000000000000..c=
950d73ee7a8
> --- /dev/null
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) WDT Watchdog Driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corporation.
> + */
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/units.h>
> +#include <linux/watchdog.h>
> +
> +#define WDTRR			0x00	/* RW, 8  */
> +#define WDTCR			0x02	/* RW, 16 */
> +#define WDTRCR			0x06	/* RW, 8  */
> +
> +#define WDTCR_TOPS_1024		0x00
> +#define WDTCR_TOPS_16384	0x03
> +
> +#define WDTCR_CKS_CLK_1		0x00
> +#define WDTCR_CKS_CLK_256	0x50
> +
> +#define WDTCR_RPES_0		0x300
> +#define WDTCR_RPES_75		0x000
> +
> +#define WDTCR_RPSS_25		0x00
> +#define WDTCR_RPSS_100		0x3000
> +
> +#define WDTRCR_RSTIRQS         BIT(7)
> +
> +#define CLOCK_DIV_BY_256	256
> +
> +#define WDT_DEFAULT_TIMEOUT	60U
> +
> +static bool nowayout =3D WATCHDOG_NOWAYOUT; module_param(nowayout, bool,
> +0); MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started
> +(default=3D"
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct rzv2h_wdt_priv {
> +	void __iomem *base;
> +	struct clk *pclk;
> +	struct clk *oscclk;
> +	struct reset_control *rstc;
> +	struct watchdog_device wdev;
> +	unsigned long oscclk_rate;
> +};
> +
> +static int rzv2h_wdt_ping(struct watchdog_device *wdev) {
> +	struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +	static unsigned long delay;
> +
> +	writeb(0x0, priv->base + WDTRR);
> +	writeb(0xFF, priv->base + WDTRR);
> +
> +	/*
> +	 * Refreshing the down-counter requires up to 4 cycles
> +	 * of the signal for counting
> +	 */
> +	if (!delay)
> +		delay =3D 4 * div64_ul(CLOCK_DIV_BY_256 * MICRO, priv->oscclk_rate);
> +	udelay(delay);
> +
> +	return 0;
> +}
> +
> +static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr) {
> +	struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +
> +	writew(wdtcr, priv->base + WDTCR);
> +
> +	/* LSI needs RSTIRQS to be cleared */
> +	writeb(readb(priv->base + WDTRCR) & ~WDTRCR_RSTIRQS, priv->base +
> +WDTRCR); }
> +
> +static int rzv2h_wdt_start(struct watchdog_device *wdev) {
> +	struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret =3D reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_runtime_resume_and_get(wdev->parent);
> +	if (ret)
> +		return ret;

Checking ret will lead to imbalance. It should be ret < 0 as ret =3D 1 corr=
esponds to RPM_ACTIVE and the API does not call put() when ret =3D 1; see [=
1] and [2]

[1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/ru=
ntime.c#L778

[2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_runt=
ime.h#L431

Cheers,
Biju

> +
> +	/*
> +	 * WDTCR
> +	 * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
> +	 * - RPSS[13:12] - Window Start Position Select - 11b: 100%
> +	 * - RPES[9:8] - Window End Position Select - 11b: 0%
> +	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
> +	 */
> +	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
> +			WDTCR_RPES_0 | WDTCR_TOPS_16384);
> +
> +	rzv2h_wdt_ping(wdev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_wdt_stop(struct watchdog_device *wdev) {
> +	struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret =3D pm_runtime_put(wdev->parent);
> +	if (ret < 0)
> +		return ret;
> +
> +	return reset_control_assert(priv->rstc); }
> +
> +static const struct watchdog_info rzv2h_wdt_ident =3D {
> +	.options =3D WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +	.identity =3D "Renesas RZ/V2H WDT Watchdog", };
> +
> +static int rzv2h_wdt_restart(struct watchdog_device *wdev,
> +			     unsigned long action, void *data) {
> +	if (!watchdog_active(wdev)) {
> +		struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +		int ret;
> +
> +		ret =3D reset_control_deassert(priv->rstc);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D clk_enable(priv->pclk);
> +		if (ret) {
> +			reset_control_assert(priv->rstc);
> +			return ret;
> +		}
> +		ret =3D clk_enable(priv->oscclk);
> +		if (ret) {
> +			clk_disable(priv->pclk);
> +			reset_control_assert(priv->rstc);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * WDTCR
> +	 * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
> +	 * - RPSS[13:12] - Window Start Position Select - 00b: 25%
> +	 * - RPES[9:8] - Window End Position Select - 00b: 75%
> +	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
> +	 */
> +	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
> +			WDTCR_RPES_75 | WDTCR_TOPS_1024);
> +	rzv2h_wdt_ping(wdev);
> +
> +	/* wait for underflow to trigger... */
> +	mdelay(500);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_ops rzv2h_wdt_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.start =3D rzv2h_wdt_start,
> +	.stop =3D rzv2h_wdt_stop,
> +	.ping =3D rzv2h_wdt_ping,
> +	.restart =3D rzv2h_wdt_restart,
> +};
> +
> +static int rzv2h_wdt_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct rzv2h_wdt_priv *priv;
> +	unsigned long rate;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->pclk =3D devm_clk_get_prepared(&pdev->dev, "pclk");
> +	if (IS_ERR(priv->pclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk), "no pclk");
> +
> +	priv->oscclk =3D devm_clk_get_prepared(&pdev->dev, "oscclk");
> +	if (IS_ERR(priv->oscclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->oscclk), "no oscclk");
> +
> +	priv->oscclk_rate =3D clk_get_rate(priv->oscclk);
> +	if (!priv->oscclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> +
> +	priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +				     "failed to get cpg reset");
> +
> +	rate =3D priv->oscclk_rate / 256;
> +	priv->wdev.max_hw_heartbeat_ms =3D (1000 * 16383) / rate;
> +	dev_dbg(dev, "max hw timeout of %dms\n",
> +		priv->wdev.max_hw_heartbeat_ms);
> +
> +	priv->wdev.min_timeout =3D 1;
> +	priv->wdev.timeout =3D WDT_DEFAULT_TIMEOUT;
> +	priv->wdev.info =3D &rzv2h_wdt_ident;
> +	priv->wdev.ops =3D &rzv2h_wdt_ops;
> +	priv->wdev.parent =3D dev;
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret =3D watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_watchdog_register_device(&pdev->dev, &priv->wdev); }
> +
> +static const struct of_device_id rzv2h_wdt_ids[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
> +
> +static struct platform_driver rzv2h_wdt_driver =3D {
> +	.driver =3D {
> +		.name =3D "rzv2h_wdt",
> +		.of_match_table =3D rzv2h_wdt_ids,
> +	},
> +	.probe =3D rzv2h_wdt_probe,
> +};
> +module_platform_driver(rzv2h_wdt_driver);
> +MODULE_AUTHOR("Lad Prabhakar
> +<prabhakar.mahadev-lad.rj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) WDT Watchdog Driver");
> --
> 2.34.1


