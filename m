Return-Path: <linux-watchdog+bounces-2978-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5253A3D911
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 12:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D9E16CD83
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 11:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1836D1F3FCB;
	Thu, 20 Feb 2025 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j/PWta96"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188781F2B83;
	Thu, 20 Feb 2025 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051667; cv=fail; b=VLkggAyi3OHXmGc5to3AVUuk40Y1t8iiePHommUpOLKMzIo5PRf9PAgmQ1wVZLCpbW60rxTqYUnCgB1l+WBeRkWtX5+T1VRKk4kesh5LcRxt5c5EdoAGAOI1/fEh1D9fBVntqtq5obu96ZCejC1xmzr1yG3KsozYuQBL9bJ7UJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051667; c=relaxed/simple;
	bh=WX8zprVWpvFHjgJB7Agd8gozOvZU9D8x6xchM20aMLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qt98yeKFxotkHD65dtowvwWw+MkfpNduSdPrUtuF/QkGYaivzc/2Fs5BaII4sOJ3ygPz26OkeCev0/fViCZLVUOTlxp8VPAbq0/htED0VlQeoEPJTJ2S71S0lCrSUljVF/baR69PX6V2D7nVyLkPxpNR5IAYTVGmKKV+1Sy17Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j/PWta96; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0GPuiPtn6eD+5FAEnkHwVoA5aISwrtMdFoSQgSu81nNvsfkk+5pqCvVmWyc9Mp32wi2xwg9qo2k1ogRroskzViI5E9lAQVHVQcnF0wPzcXIbSeBAF1uE4L52mDqRZFHE3PhzZhOtRzGtuspRn+DOGrfn3sPYIrmebOB2W7fPkvoUkUxokwwlMVpLABu6aqMEyaKjus1GnmZe77cQKOGrIJwnCKCs6qt84Hu+aj7Mb5aFJ3q5XNPnLjSFUO45l7CEkQbiA0YFt015vEtzaF+7pTIyUzC3Ij1Htn87txtWlAk6157PSKN2YPyGQnLfvshDQbvwT6fUvnT0e2fQWTFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=506A4UMbvJ35JlKBIBz0NlfnxA5KGM8zuJlnuyNZDAo=;
 b=sHBVz0QJWmNmb0c3nPx8XDXs6xTPBe2IqinWhpHZeI+T2aZfZOVUi4tUa+Li8+m6PbS1cZL//QCSQHL5S1yNTTIWPLRCLVhUC4Ac1XS3D7/Fn3qMrGiNbbAzgy/fZdrlYAZ6qE0r8aSArTRaOzMkhd7iD69RLEF4KNMpeG6CpO7aaYS/OU+/1Ageg3o8xtDmc9B90To8U3tOqYujgXJ8NTTKtUsIvrJuPyDEk9kKdwJISTY5fu5b8J7JU2z5Sq4exULQDKeKUVnzkDFZVZeqLYHHxyCZoV+mgyX7iYzlFKuzG3Fnq6cImcLmOMb0rTakScOQPrscvl5vohc+Fpw1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=506A4UMbvJ35JlKBIBz0NlfnxA5KGM8zuJlnuyNZDAo=;
 b=j/PWta962F+sfrYnM7ikCmi43GGq5KBxfNE+pPlW3Et/GZi4drusZ2PlJ1wluzoubz5i4q3czaeFA26Cv0eF+gpKHuaBGuSPmsTTTjuVg58meguoqHH8ac4uQFM2NOL2k5ir8hstoW6THIZ0xjSYRsAbP7EA9P5MF9g5jhlp5Rk=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB9805.jpnprd01.prod.outlook.com (2603:1096:400:233::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 11:41:00 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 11:41:00 +0000
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
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 0/2] Add support for RZ/G3E WDT
Thread-Topic: [PATCH v2 0/2] Add support for RZ/G3E WDT
Thread-Index: AQHbb/X45Tmuum+LzE+mhttDRxt79rNQOItw
Date: Thu, 20 Feb 2025 11:41:00 +0000
Message-ID:
 <TYCPR01MB1133215EC9887878F8A85DC6386C42@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB9805:EE_
x-ms-office365-filtering-correlation-id: 80ea9985-f275-4d39-ea8a-08dd51a372b8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?w3OEGsp5AI3Yjk+DS4b8VTEAFCpzQAlFxHgQYoRv+ppd7tC82JVrQ1GYhcMv?=
 =?us-ascii?Q?quQopgPeQrDe2PjNssSd7K0eivp1It9wxgW30Cv3UqzwBDdjkdWD9BYJwsT/?=
 =?us-ascii?Q?w6z2Krr7tLbcWHYo5oA7BzHQsqtpI00jNSrpUKIPNAatr8b7oR2s+DQ1ME4u?=
 =?us-ascii?Q?2xOMdPJmHr5w2S6nEzaKN9TLncYHKHNV3oaxqehOQJ/0qIAfQGNC/uER5+SX?=
 =?us-ascii?Q?4IyUlslWy3Ih45Zldq4X31WcNYCqQhee9MOattaYWNKJrKZgqDrtIV97a6WW?=
 =?us-ascii?Q?gMzfkqy8VGj10U/5KeBfcPC97qAXOlQgvcFBWFAhRZcXjWzeqzZHDsLf533M?=
 =?us-ascii?Q?FvZofcQssvXJjMhacA4Ptjy1YM+ymc4V1vm0mj9VHJBf7DqPFE+6izOO1Zg8?=
 =?us-ascii?Q?1sFNTjYSoFgMQ6hKs4HUaoYl+j9gSFxH0HibpzGlE9uteLxPWh35V7k+dw8k?=
 =?us-ascii?Q?7TF79LlG2wB/dNq/dLtiyXlrYrAAQVm6b4c3NIg2kJBBaD4gOV8moywsDxz9?=
 =?us-ascii?Q?uYGQjgJsQkGPCbMe+LZ7XF6UY4AYoOlbsOhQYHHzn6Z11f88b1raLzZTfnS2?=
 =?us-ascii?Q?Em0HXUKrbWFkfOjU1GjmHN5R8daI8wT81mzMI4FtUfsYeCHfOtevoTCNBv/n?=
 =?us-ascii?Q?LmQZ+1Py6EP7UBfUC33Pm4i9cNIjStavwcqQ6vhjsU0NFUDeGXOfyN2mJwod?=
 =?us-ascii?Q?vsCS5iHOufeFYvVXYomNp6e0n/Chn9gnbObQ/rA8l+pgixsCQ19TXKbXOXkf?=
 =?us-ascii?Q?7CmIQwnCLm/1od+sL9u8H8wKQYWGHylxAmkF/yWCfVsgbBsEGtV1QBNy6B7X?=
 =?us-ascii?Q?ZZWz14UK8+6Ix7EG80SBEM2rv1g7oGD1FV73YlzzIlIwVMJOzi6qdeHokMZw?=
 =?us-ascii?Q?MrxUpS3uIj7R7DoebP2068Uhrtt08xAfCTGH10+aYic3j+xlbWuUAkWG62Aq?=
 =?us-ascii?Q?iN8+AabaANQEFt2i+K8KQ5hL2kKFee+C/DjcfPZPC0SLG+f7EP2fNIxr62fE?=
 =?us-ascii?Q?syQb13CFfpmlUAqeY6RnAXOuBzN3NbFFx8o4izaYVP++V6njg1/mOoNkB+Qj?=
 =?us-ascii?Q?qsYDEICmMBnIpfrAjzyH7lU/b7YoaG7V2qIHzPsoJJFP7hVJZQT3c55pwrw5?=
 =?us-ascii?Q?OwnudK6x2J59vN3wb7WN51Mp4kjujXVMxiVggWXf6y4zZrHZDeMoFYrHQpzr?=
 =?us-ascii?Q?sb1BeVoU8H2YJOHiR3mFs3EnhP8JqtUSHzStrnB1LYw69bhPAvqqH0+tF93c?=
 =?us-ascii?Q?dWfEksnIWuDYmAKKuAzJCYtFQYUMy4ZzsnhJ/X51wC+UgQ6eUK6kgFL3vep/?=
 =?us-ascii?Q?xR9rvAhxXUtHLD4CEdclxz937QW7uupLSjHIUNDH/k9FKAaQsQpg6QtW3mm5?=
 =?us-ascii?Q?1DR9crHqClHWTRRUhxw3SQN9wFWSh04i4+nlMcuXeKquCOW4Ner7qB91e5f7?=
 =?us-ascii?Q?JEvq+ZEv+QKyR0SBdIx89p5nX2if21B2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lH1DAzjh+zHr1c1zhweqtQV+ByO+ABzb2YQVh5rWOImjccoDcDBnoda/qE/b?=
 =?us-ascii?Q?n2GgNpiWyIODTeE79fqtN59TZMqLm+eoa76qXIIuRw61bDCmFLv6aCMTs/UJ?=
 =?us-ascii?Q?oUrSdwmh0vhV9Nkj9snwPSzz/N+UxDt6L/VrV5hkcmKCaeLzpkPG4Bis0XH7?=
 =?us-ascii?Q?srMWO+AZ1/dIkqInYXJHa2N0vyjMbJlPGK+vRUaNSUginxqWb4rBphYqsOZv?=
 =?us-ascii?Q?6BDV4iWZ9Nsvgq5zT7i9nMsyIThZUvcVFvwVv33jiDoCof1CtVm3P8lQ0tXw?=
 =?us-ascii?Q?sJTxFJ5tUKYNdGRlV2t1gmoaJQW8hD0eer9aW8LwjQO0UbCAqn1NUCO8R1RA?=
 =?us-ascii?Q?T58/0AJOx7gPJ7QrGpUpKG4wDFtfGNrhFUbHTtFYoHeF8VFKCm7RSugW76GK?=
 =?us-ascii?Q?tyq3ExFr6KSBbiBnyl2CPNpH+g0Gb4PkGLCW7dtwaLY1CdC3lqwZXuL+fPtA?=
 =?us-ascii?Q?MmryL3KWWVITQ1PEvjmUlbsR3/y24XYO7Wwj/lUeFKcLeqlB8UAXNxBEpZUP?=
 =?us-ascii?Q?+AYT/gVb+hCdqEBq6TKi05UlujEIwfG7hLP3XQ6nQZUHnMWiqjYPYEyjR7Ia?=
 =?us-ascii?Q?HcYiK3+uNS09E6jrO7rhr7vEzfEnI+VXnZFPu3RaEM/lR+pbPkaCBNrJ3jM3?=
 =?us-ascii?Q?599Hy0F788R4Hz+uLxe8ttYA1zsO/FDly99Gj3P/5W7e+pfXdLzp4Fs9y0Y7?=
 =?us-ascii?Q?7xfj084QGVHceQeowBWYMPjQKoIrRd5n0KqCMBwQIzqDgaY/v6v4/IgMBxTC?=
 =?us-ascii?Q?j7rtM8xh+F5TIdpHB0W9YD5SX3v9js+8aygkPWOHGDpQjJge+6jwGOhLEO/d?=
 =?us-ascii?Q?DAbPL/oLbCFmwpoQJQyb7ybgXkeWunE2gIgYIYop9wrYmKR5Qmpe5pCDxvE8?=
 =?us-ascii?Q?e2CQli/fDT+kuo6PM9dwdhZOxTMHvS15Bdu9szyE8s74I2qP40rERo1XP6QV?=
 =?us-ascii?Q?AvZgR+I0x8l8d7TMRWOv21g1coYe/7uYCr+wFBXKGKZajLNBRhWVnvLMgpjT?=
 =?us-ascii?Q?H2RmZCka7npJlUFG4m1Tve8AsuArNL08s6ZkEqvI9m/mwoshD4VePeeEkEiP?=
 =?us-ascii?Q?LygRr7tlfpkRPKzTCitsaSN9KmuNpAzy3gka+UrZncovbus5KU6hzn4+2Iwc?=
 =?us-ascii?Q?Mc55ryv+dJP79j7FGAA0ckyeSXfVRCgXKYf8Co3xlXexR6ay4YaXwp5BtlnU?=
 =?us-ascii?Q?VwGKYzpPNG+xyEx7h76KqhHbRb2gRplT5JjpYF1pkj6gfBsBPvbZ7tal895Q?=
 =?us-ascii?Q?q9bmFwePoMbmsfn+JqN2h3GomOSDsAk+zWKxlewFHMPd/tuKwyhmOwCEnNxQ?=
 =?us-ascii?Q?FEVnGFY3vpdEBEIuPVpB8ulnlfJKH+7+hzphALgtei28yT7+leX3pDX59wyW?=
 =?us-ascii?Q?a6oWSwQN4K0QJUNYnep8hlZ+Im4sU3tSZNAHaXNkpD3XcOf3xsJ1w5qgwka1?=
 =?us-ascii?Q?QuChe6669K2YJwExONq4dHzmdRdf9fq4EhGF1kBXQHqy9oKDPyMRpQMP/6MY?=
 =?us-ascii?Q?0Da0IdkWxTK60D1D9zQ9ERUSe7mAvWIh+LfyPQ5roMH9YNw8aOyJ1yXqoc/o?=
 =?us-ascii?Q?0wMkKR9qX7hwsrBDv5ypVLXhmH+j0XlVVFho4lPvYoq4dnR7r0xAuxhMsDMD?=
 =?us-ascii?Q?lw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ea9985-f275-4d39-ea8a-08dd51a372b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 11:41:00.2583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIdrEMKfyvp9m6BrBWJmjovfMwlVgDz7WbDtUmasb1MEcge8VIiL2YZBqwMZlM//X3uy0q8IwUDSXZ7VXtZlMZVHxPoQI1b7LCDIqINbFQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9805

Hi all,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 26 January 2025 13:26
> Subject: [PATCH v2 0/2] Add support for RZ/G3E WDT
>=20
> The RZ/G3E WDT IP is similar to RZ/V2H WDT. WDT0 can be used for CM33 col=
d reset, system reset and
> asserting WDTUDFCM pin where as WDT1 can be used for CA55 cold reset, sys=
tem reset and asserting
> WDTUDFCA pin. Other 2 watchdogs can be used for system reset. So define W=
DT{1..3} in SoC dtsi.
>=20
> v1->v2:
>  * Dropped patch#2, #4 and #5 as it is queued for renesas_clk and
>    renesas_devel.
>  * Collected tags for patch#1.
>  * Updated commit header and description for patch#2.
>  * Replaced ARCH_R9A09G047->ARCH_RENESAS as both RZ/V2H and RZ/G3E belong=
s
>    to ARCH_RENESAS family.
>=20
> Biju Das (2):
>   dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
>   watchdog: Enable RZV2HWDT driver depend on ARCH_RENESAS
>=20
>  .../devicetree/bindings/watchdog/renesas,wdt.yaml          | 4 ++++
>  drivers/watchdog/Kconfig                                   | 7 ++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>=20

Gentle ping.

Cheers,
Biju

