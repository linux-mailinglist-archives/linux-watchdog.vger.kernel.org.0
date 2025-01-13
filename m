Return-Path: <linux-watchdog+bounces-2682-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193FA0B5D9
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57DC21884854
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B040A22CF0C;
	Mon, 13 Jan 2025 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KS90K1Ia"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B6122CF00;
	Mon, 13 Jan 2025 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736768295; cv=fail; b=FN25NaGhRFqU1PY/1EEN8KTNhKIcLb7qz2CJ1FqSiy1SvSuz3TfzQFew1SPj0sotyalzbwtzKUsPWZnaA4Lz/hWKmnZPw7zB2sBn4IWUIW2LqTlFvqrMHYC83h5m1T3gB6lYxyMdsL3z9woXp0VegJ9wDrVwZpXDVm2qZRWKodc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736768295; c=relaxed/simple;
	bh=i2ZVMAVomVWOUbLLMOyZpXeX+aGNSzmDh/OoAwNGLkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a7Hasr3QmfESPDLJQzxGB7Sb/idQ0YwjZDYSKsgXVTfEfzAc4V1eutGnsve6aTT+aak80H0HHFBjkFoLC4dfF6ffDTnibL0kAdG2ybJOKp6ZTPhwgpOZvF9Xf4HvZ0Md/MsboxHEFzodz4OqePDBMTTqV2/AAOmUtni1cgjEuCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KS90K1Ia; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsCr6C5seWZ6ohpdgaUK6V13i14LX1UrlroD9djSfOp8Pp/pCfvxtAorUqwVNbnv2zecWChIvNxGF6UZROyaaRxCj+r2IauoIqqVaI99ah0X/p4dNKBOsLM3bFl0Wf1m6he6Nyk1M7kCuI3O2yau+RXs76O9uYawKe5+H+woG6ccPQljGxeQK3ecHzYjdc8Kzs2KRl/Z9SA6mkRa5w66z5ydzmzV16adDies0hrDDlq368PWE/VxCG6CEx/vRH2o7yoxyvkAoTyfv+SGKDtkj7XjAIoMivA2W6oiO2xw4/xC5dxXf+/iU/ap3sgJnKZEzFzF1Lh7NLvEIhWXsTCz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0mVGfF5zl7WsWqN1T8oj15BwPJaSnf/4aXJK5dQi4Y=;
 b=JIVScS41NYtNctX7PLGJTR9qDbZ62geF1OHvjAEvFEVWPzs71yyCCg+VbpQDyvF8TE7l5TJYWdmUo1/Dekh8NeJq5rc1/2B3tpfKfpmXRvorcgDdb0saUQibGmNiYgfl/onZzIWtn9lQRfYp4M6VXC+lFlO+d3MwYPt66iaqnArYvnQnB+qczqYFQOjy6RhuIkd+RYjM8dirZZWL0YZBPwbSf4TvgWbTj5SNwtTf3vtXxiE9B08O97rxkZR8de4trYsqN9kwb3LRa1u7nCfSuFFjbaGILAc/S7YkGC1B2d8OR1onxKfCO56pqcbIt0e/UgUoYy24LYPCqig9N4XeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0mVGfF5zl7WsWqN1T8oj15BwPJaSnf/4aXJK5dQi4Y=;
 b=KS90K1Iapu+/n/vsbGBZ/6vRUP8yAX928kuJRNzqaKPJvxtEUpJppUJx2p5IYtoSBd0Fb/Kja15BWwuxUdicihcj8aLKhQC8+iScZS+S+UkstAQ+pBq1HfSJgL1PBqz/fflFVDHqbC9kp2mzuappjaTEUek+ZgtJwJBSdQbezmc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12242.jpnprd01.prod.outlook.com (2603:1096:405:f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 11:38:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:38:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Magnus
 Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
Thread-Topic: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
Thread-Index: AQHbZa2mzHd3tjC1ZUuh3r0qDg28ZLMUkSHA
Date: Mon, 13 Jan 2025 11:38:08 +0000
Message-ID:
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12242:EE_
x-ms-office365-filtering-correlation-id: e04e64c9-21e7-4bdf-a4e8-08dd33c6c0ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?K/PxpifySd1MWuOvYPmwoRd0QM/WeNuYiu1pfphrj8etu17x6ADuLcAAJbNI?=
 =?us-ascii?Q?JO0R1Udtd09sB3yYBZbtV6SRVYTbdARcWgIefPaA0LTB+BykE0GiqY5OHxfG?=
 =?us-ascii?Q?74b7Ecg1k5SdVBatKmTMKaBx/FCwLeO1NJLmcoq0yPYKxsx3uC6qUsyDl/FO?=
 =?us-ascii?Q?nlGgkPlkJJE9urSBY9M2LGDwG8t+uZ49yh3XrhkFXD1+27H8bkabCdfksidx?=
 =?us-ascii?Q?zP5J1bQSjj148RHV0YbeGYYHWCuOM0uumTfOqtPJl0zSP+D5ijyY0ORTxDk7?=
 =?us-ascii?Q?Nrzgjz5jA+i5frkWLsiQmssk3m5hEFayQx4ICEslaJsG3ubNzb8q2Eapt+Qk?=
 =?us-ascii?Q?MQutdwQ7PWq0BiVZIjuRNaKULojWOexECwPu6z2Hg7X1ySM2ZpDuO02vcmc/?=
 =?us-ascii?Q?Qwv1lC3NTSOrZ9gAsQSnfmMJCnEZGNhltyGT3RLd1KGAEN41ZEA6n6X83OAt?=
 =?us-ascii?Q?JCn8dTQYvd/Y91Qc66ku7n+pjC+KOuQLGY3ZPwIPUBx7lE0Ijos0ZQkYV1/5?=
 =?us-ascii?Q?2YNnIcM8oykKbxzRNe3+Gyvx/zQ/QYkjsjS5VAGp6Rt1dSl+EJ2WyrbqSuSo?=
 =?us-ascii?Q?fwd/PuRsiMLFVRD39iE8o/X6hnGuq4GrI8O8Bn2XkUONhpbG6kEOz4RQPl+h?=
 =?us-ascii?Q?h5eT/JxNprKQAgT3STaJ7o365aMydTkQM+sM9aneBlOJCvvIop5QRUQIahY7?=
 =?us-ascii?Q?Nk1ZkaUhUKmWN+Fmi4LDSdP/pIXs0riXjuD7b6smZhyy37au9cthfSSLGlJ7?=
 =?us-ascii?Q?SvpMXzzfFhxxbgTGEwaEIN90gUHrh/71BsUOrhwGv9Rdn9NRQiUko/Bv7Ogg?=
 =?us-ascii?Q?6CZ2i6TfsBmzgsXfVx+rUt7WUuFMKnogj27olUyAyWNjCzDNdGZD5rEzOPow?=
 =?us-ascii?Q?OfISe/Dd2YCgh7BGsjany1fRs+eU3hDbErSfV7kUTUS5xUqqY/XDaB9/sfNe?=
 =?us-ascii?Q?PJL/d9iyD9NoSrft0cKV+SkH7rqySG+uvk+HwN1VSNZxk58U6l0bGXn/lwWC?=
 =?us-ascii?Q?NhGh6FSC2vo4q9HA0yvC2CHW3nqajIi/tUMsJdHZsfRHM/nBHgDA/DGXqZWm?=
 =?us-ascii?Q?WheNOGYtFofXM4ZRkwgaegbfN0AaFXmHzeHgEET5TtXFeNucp9Lfdtc+CNrD?=
 =?us-ascii?Q?XMZ92UqSryI1vyvuuGFzeNETDnnvYVZax3sMmQT9TqLlOaflJU6rEtLwFiHO?=
 =?us-ascii?Q?CbvfpmlLN2ofu2MBLvk1aK4d8C0yjQbOG/FbHCElOxFCG9OphK5mKSmvEkMW?=
 =?us-ascii?Q?S5B7jmE3pe6lbMCM51pxoM7Oe4LluQQ7m6REfuOUAttbBNkPg+kGshnozPtQ?=
 =?us-ascii?Q?eGhy0W8/0dEiEEjIUe9nsRRlG0Tu1JjiVC7RG7H90SIyzdXdzDmSJ3xvUgmM?=
 =?us-ascii?Q?qubjSLSL8roZ9450MMGZwCdomLykFLmL2vuhWYirCUK7ZGfso1TmjEwXl/f6?=
 =?us-ascii?Q?GUuYnvTBJ1M6+x1QHaZ67UgXFQRJYiqWVgflPmW+MQjDz/hOlZzRtQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nWe0BL4wZOUcH3HqS2DPr61c6LYEM7eEfKGHKyphcaEpdWqVz0BIRjwqUGfV?=
 =?us-ascii?Q?jDC6pjPUx5qibUvR6g7rl2gp+csAtEIyR915fcjizYQoXYfagdjA9RwdJvot?=
 =?us-ascii?Q?rVLdrHxP6HxbwyyxbgI2+fOuzLX/H9usRk69TKVopWJ88FyJ0OMFp+fV4ryB?=
 =?us-ascii?Q?neXDEKspWvZSYJwZfKh5R6c++KL5fDKcToRavE8Szh02oOZcE0Nlwo/ZD5H2?=
 =?us-ascii?Q?WuaT/Zms0w6EZ3x/Q17YgfuFT0yPpLtani2AYTbHB+BtMoZk0SjBg+RG+/ML?=
 =?us-ascii?Q?SMpzNMB7L4Tfy8nrUSsT/UIl4xuXikiLtmRNWKj1IYobB1N+fnbff7p+jB0K?=
 =?us-ascii?Q?ZdZMSjbmPXl4GOXDADanJyFt7QSzy8IFqhc4dBDtgVB4zZ6eyazBFE/bmNB4?=
 =?us-ascii?Q?FbpRtaLIZlShhToeWEf4QUC6xAv/pYtrC/Lhi4G1mRcyxyAZfL+hnBLdOupZ?=
 =?us-ascii?Q?2M60fjhumEhANZx8LUaHvS4QDRyAdPYwz1vi8n06ecLHuRp+egwJG4917+px?=
 =?us-ascii?Q?hrZL19Ul2lPlJnJSD2SsvwydjFp8c2pIX9Wmbc6VaRJHEugEq7DxsoKZaxoe?=
 =?us-ascii?Q?YAgFbJWXOfKznbmbOe8V5uy/WxI8P2OyPw3gXjYA9nYcix6mVOVhDY7lIS3t?=
 =?us-ascii?Q?q3Zc+aLwm/Fci6aZ4xwD/5jZuJdVXSqnewe1NCu23I7zizRID3FsmpsGIiub?=
 =?us-ascii?Q?MxP1h0TkySVcRKGp/L4vUGJ9hAKqMob+0FdzTwcxJu2ZUrFKuI9kwtEQ10Cb?=
 =?us-ascii?Q?LvNcAm+mYan5rJYie27IbjlrrtwxRx0GKSKiVkyNeMKilY+qpyUIir4x7Ue/?=
 =?us-ascii?Q?NR3eZXK5xnhTGsw64rk58YbBoz6B0oelq2Acc54gmlmUa70lnNeipJfj1b3I?=
 =?us-ascii?Q?Bgx5+gQQyjZXMksJdKRk9/Kvpn/UwJz7J0sZhZWCk0j00KBqhzMeZvj48PgC?=
 =?us-ascii?Q?/Tct89u4RntWk5LQXzfav9WxOpeqMxMIH3LCjKU/yWnbjKYeuXn/uF9zBx0T?=
 =?us-ascii?Q?z/YuFsx7v83C/NVS2zZN3S2u/EtJAj8a5BOWwuEhTw0iZ6WbfjqnoWo9Iya3?=
 =?us-ascii?Q?6p8P8wblCbyhNGbx+ysWmdamVQ9SkzuH8h9pmmzu7Dc0XZbKVEYTYLNm2nv8?=
 =?us-ascii?Q?mA3unVTrODYF7fCnmgsRiIivvdKFz/bM0E8AwUjBXXtbwndu+J5PJii8Eb1Q?=
 =?us-ascii?Q?sapfk7qDqeLvIt4k7v7RASze/943JT3GoNxZsdNEhKOoLYRzvygPHYlgEQGj?=
 =?us-ascii?Q?n/++uRZh2PuvvzSmYXbuSEa1qEl4B23laedjqk1hPARlHOEY9YutraxplB/F?=
 =?us-ascii?Q?z+lxQY7Y0ziFhmfli9ju3gcA81RjGSI4XRjR8jox6XwErWxrTitYaUCJ6uPY?=
 =?us-ascii?Q?zQoDMJ6nl002BqQYvcJKWIBfTA5JQr6t+JcrxDPvuQMMZn8pvYrzA/g9GWVY?=
 =?us-ascii?Q?EU0vqm9YfBTxLDTx9/FpGva220CUPw8Fl5UIlutq797iRdMdUn13TfP6wfUW?=
 =?us-ascii?Q?ZpaetcOcwU1g2Rhuudzfk8llTxmSicioi9ZMPKoa4EKVcfBs5ApWN8Pzt1lA?=
 =?us-ascii?Q?09vyKNI8zMNe89uoFXtWX3d1nnAuEjpqkVKvE1Fx/7a2tr5Mdd7RIymEItAz?=
 =?us-ascii?Q?Yw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e04e64c9-21e7-4bdf-a4e8-08dd33c6c0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 11:38:08.7323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SY4KUN3ztcig18KT7NmzDhcy24DAD8dLAClNpDov58bK+zVBoTx9DzJJDdAD8nE48QHPlR8h8bJQhyDtYmUvuiDaDKydi9WncVTpiXieP+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12242

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 13 January 2025 11:24
> Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from watch=
dog for RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hi All,
>=20
> This patch series adds SYSCON support to retrieve boot status information=
 for RZ/V2H(P) SoC.
> Summary of Changes,
>=20
>     Clock:
>         Add syscon compatible support to the CPG block in bindings and
>         device trees.
>=20
>     Watchdog:
>         Document the renesas,r9a09g057-syscon-wdt-errorrst property.
>         Update the watchdog driver to fetch and report boot status via
>         Error Reset Registers (CPG_ERROR_RSTm).
>=20
>     Device Tree:
>         Add the syscon property to CPG and WDT nodes in R9A09G057 and
>         R9A09G047 SoC DTSI.
>=20
> These changes enable the watchdog driver to identify boot sources like Po=
wer-on Reset and Watchdog
> Reset, improving system diagnostics.

This means that, we should assume U-boot/bootloader should not clear the WD=
T reset status bit.

If they clear it, there should be a way to propagate it from u-boot/bootloa=
der to linux,
otherwise, we get wrong bootstatus in linux.
But the clearing of watchdog status by one of the cases:=20

1) u-boot identify the boot source and clear the status bit
2) u-boot identify the boot source and does not clear the status bit, but l=
inux clear it.
3) u-boot does not touch WDT status bits, but linux clear it.

Cheers,
Biju

