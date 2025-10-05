Return-Path: <linux-watchdog+bounces-4314-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26435BB9930
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 18:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C329D18910EB
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054776F06A;
	Sun,  5 Oct 2025 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NRIxUyWQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DD634BA39;
	Sun,  5 Oct 2025 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759680264; cv=fail; b=q/c+JwGb8qHhjSPnckIxwMpFYVvrx3SdwhAAHQQ80fDh9mF6hUfsP4VKrr6285bPMZf0fY+9V499QQurUmcI5MCmMUmsXlues12JaL+yw8agS7XBMNHB2bLtNX5LXHzPdU4KCTDnttaQozrwpmu6T2RBsaEUM/B9PMePghAbGeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759680264; c=relaxed/simple;
	bh=4IUc2LrOmbQ+vZP2wP5LeQtAAfCjny1MLF+vDylZBX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F3xIZKMMAo79o5ykAFdXuriHIFzUquR0JLE1cxoLwkflTAKwTZg2fzGK8NdqFGLbmx3bWWM/+8KrNqsaLK5XYe2POXuC4dNcOKpC7qf98RG6XF1doF2KLshKyIPUvuCdxy2mDJFD9RNpIv3dUMISihd9u3KvQYk/KBuYDeu/oCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NRIxUyWQ; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZTiyVx3SKUz+og2GUr3+9HsY1fJ4ACNxVLiyoGeam4mqKyD+yABF1tXqb4DzevMqqBT/ZPLlnqP7QI5JpdGm9yssWsYS7sBbX4AmYI4c9/NUFTAvicxCDf0+Xm3t5ouxdY0IvhpLNACPgHbJmAFZqcwH76Lxkw/277W8aI5e59/Zk4pRdSLHjZBYvUSbg5yZRnSNIIBWNHWnYSi52fHVYCACRN9pg6FodrLW+bQiGLw5LGLGsDRpr1WTqJioXsjK6/+YbvkZ28k4Nzpxg3JAZRnhlkSKoKii/U9AVfIxIyyAyVhinqQLxEd1f83y0y+G9plWoxwFz2h8WhuA7S5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQHzZirqL59Na1wyoeuokiqrcQSE2j+LngBI7GETWVg=;
 b=nRiilPjKaPzpoS3VCMUjLvyY5XaYAGacRC1aee0+47kDT6CrtXQr8QwkokFn4y6fN4hl+9vFCuONfmF8FqC/lphge264kLSRv8UTJnQKzNm7ekm+l9Lv9YcDqQNQ7x/5yhy6VzKYkRBdnhPsyW2i0nU267VZcWcpkwlq9L/UBsKpm1UHBQxXB4XLImxfq+VeWJMi2Yhf15evCaTYVDDxzFV4bV9S2veBIeb0caRlmVroZ4nIb5ZIuialBlGUXRxRsaOgyEOE29DfloQ+PwAuVy+VDP6gmkdKakxvk22WgTrR1BFWeZqiNoVENnznS2Wn+p72n2mR/pPyx8eT673Xmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQHzZirqL59Na1wyoeuokiqrcQSE2j+LngBI7GETWVg=;
 b=NRIxUyWQ2rlb7l/1CeQtL+eLscq8lIByzrY+K7TUrFH3jYNqgyE07HFMP7n6Jm3SImUg5mRwc9EkGTfhTdbHsAH9S1Ah6kpyXm4a9IeAedfYILu8XzUMQqiOZjLnKG6xH6QMLteXKuzeHEvBvvKb+UpM/hZ0tGyAfbsM9Xxh7D8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12618.jpnprd01.prod.outlook.com (2603:1096:405:1b7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Sun, 5 Oct
 2025 16:04:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Sun, 5 Oct 2025
 16:04:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Guenter Roeck
	<linux@roeck-us.net>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 3/4] dt-bindings: watchdog: factor out RZ/G2L watchdog
Thread-Topic: [PATCH v2 3/4] dt-bindings: watchdog: factor out RZ/G2L watchdog
Thread-Index: AQHcNgaeipcqbDF7rUS+l/fSR77ONrSztoyw
Date: Sun, 5 Oct 2025 16:04:14 +0000
Message-ID:
 <TY3PR01MB113469BD1696EB12CA778796B86E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251005144416.3699-9-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12618:EE_
x-ms-office365-filtering-correlation-id: d05386ca-e57f-43be-b441-08de0428d4bc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?l2QycDIbh5l/8BpO1u1SktYBd9G9m8ID/r4O4WGzLnoRjRoVR1NcOiAQTX5n?=
 =?us-ascii?Q?9wmBLlEloHBlbmH0cio/QjO1cB5JCSX01p7w2LH9lhH/qcnyb7IRpsCSM756?=
 =?us-ascii?Q?VhT1nMaSJMovRz/ber5tuDuAtA4HELHVkQzWI0TqU0pEtcE05xxi8i3qaN24?=
 =?us-ascii?Q?QYZPHoV/ExzzJOGGIPmArUNjUov/LrJquiF09DT2qHdJ1DzbqWBcM7ny0obg?=
 =?us-ascii?Q?JUg4OzpQJTrIFlLkQFiZl4SXwq5I/hoKbeQ0S4qVX53mi3LadjQa3ChSre3I?=
 =?us-ascii?Q?/CZMv1DPbsVwWVpd/y+wWP7swAhn5GVBknHyqwTSO+k4FMfAQ+EBXaju7Nzu?=
 =?us-ascii?Q?g+FsA51s6wFa01H2JHy05uiYI7TuH5bBP1w4zggbRDC6JWnNixyvhs1rLIvo?=
 =?us-ascii?Q?CcdHNU9BWTYmXJ7n5acP8QhAl2jMMPnk0bzisdjjvh+VK40+jq6lNFC9xato?=
 =?us-ascii?Q?n2gToDV2Ip0x1VloDjHI8oBXvtFtZPhE0JWiWmXGUgFwF1v7cVUq9OaUD+pt?=
 =?us-ascii?Q?1sid81vewwifQACAPAEp2FkMViUULI/8Z+4VmT9fdx3kwO5hyKC/vV6flftd?=
 =?us-ascii?Q?NtZW6V2B7PNfr0rktB4xYAYUg73G8lo6DHrxq32A2gah9jKTV1qE//qhCYU+?=
 =?us-ascii?Q?sz0WUbxpD6CFqeCXLmm720iLUPcgR+XdLFr+Hh8A3mrmO1Lan3h4tAYqeho4?=
 =?us-ascii?Q?UqayGjTQI1y/2A5kVxUaJdso/K5a10M2KPy7AC76zT4OSkvj3xt7eqokBe4U?=
 =?us-ascii?Q?5H9uwTR7pzl0Sn9FkaEgloDW1HzX19AaMtxLiML2b5hwIC9lPCPJ3QqPfIRD?=
 =?us-ascii?Q?HUoKvTwmOtBlDSp85HBieM+vK9GWmIsegCGV5HdVMVp6DT5HwuRvWRo0cQzM?=
 =?us-ascii?Q?kXkX8tmZsSk+eCbqZFvgU7G1aOcUDkB4TR7lnIJbxQoOIZhT65j2OV/7rI5h?=
 =?us-ascii?Q?pkfINlKmoUjERcKXV996LCVAEZisq0D1zlYEd/7Msykb8ugckJOYbT7lpM3F?=
 =?us-ascii?Q?Xh9OhYxc8a63FuTt3enSQn9OJEeKs3mpRdKMVKXiJWFtnpckvG6lA6Za7c4a?=
 =?us-ascii?Q?O+LrUZSZUbm7GLL1BkN6J4zNVgjGvBDOuoqY8H15rpvt7ChS5zIOxvFu4dZW?=
 =?us-ascii?Q?SE8x6gv+r5cLNgFeb46wKR+TzEt43ZEiXnCAGu20LHMeydfynEsfEuYAKXnN?=
 =?us-ascii?Q?j3F8byfuFMacUw8bshoONZHme9sMAamT0t+dBU2/9q1FvB4NLGxfEUtkNWjB?=
 =?us-ascii?Q?4hKRsk5ETxxJ5AXW//9EeTFKrtFadGgqdwXYseKypeaDPCDvSI9Y21xg1GRl?=
 =?us-ascii?Q?HHg+tWgHAsCauPH3vZZabv7zBffVeaEvxYP19/8Lnv+clU2hTG2g4Ts+R3R3?=
 =?us-ascii?Q?5ioLZEdZAE3BHs0HSov5BMPjlFiD2AWUpB1xqWvwNlckRmhrVYELmVJKkXd5?=
 =?us-ascii?Q?ftlD4YpLeElcuAo6/Atvxm1bIX4E47NKTZby0TyiKFn7lfLfifHrPA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ArbHSZpecQ5kUJTKqLh3/U+Y/CiDkYqfjFl0xbj+3Eua0DbBjNyAni9bFY01?=
 =?us-ascii?Q?H04n0U7DDK8ewizZ7Fn+97SCblyWPLGBpvomm0IyBfyc8xiGNrdqbKT7+5vA?=
 =?us-ascii?Q?tww6V0Yfv05yWGBX6U8xhBK0526VBSzaVs4dH4j9u0+7EsRD6GQAA980TXxy?=
 =?us-ascii?Q?XG6LQ2S4DvIi1F6ErY2R0XWwLJQ2BK0pENubaLOkyVJFyoSSNJh42oqpOCYn?=
 =?us-ascii?Q?GNgAW3z9VsSBeEXH8JhtR8OnlYtNNod3wDlfD39ghoNKP3VkWWrLuDU1ndts?=
 =?us-ascii?Q?Ue1YoGubsKG9OxbhixvD+EeZLnD8bnQr0HZQWVjr/lmDmYDJTRtU1fMPq7rv?=
 =?us-ascii?Q?sgGaN2H24hpjRxJMj5mnmpVaCPs94ItqkXBjCbDFZaJ9yumeMAc71kKD4C+P?=
 =?us-ascii?Q?6etaCtnTom6UrzHF7t89x9fG/OLl9GAsrjkiRWFx+6x3daeU965bOfIhXdS1?=
 =?us-ascii?Q?nYNjsEdyYaw7K7K8YcYGTD6z2M0BpvuDAvmF0X61eOZTmlJDanT53LwWrp1D?=
 =?us-ascii?Q?H9esWxNQHbqcy2sj2zRuGLDCu6NiLvX78UOw80NzR1r0IOUIwjZDtk+djc+d?=
 =?us-ascii?Q?bMzsUG7kPoG1ai36pgU6cDa4mkDN6G/ExcM2oSwXENWd9GB1qvkbQYu5/DyD?=
 =?us-ascii?Q?rHYwz9H7ynSUdqgzely0e6QfhiN4pf9G37qHSuMwOqfZ957KpRi3qrOYQEfc?=
 =?us-ascii?Q?q2IXXzu1VHKxGsAKj++H7rL9eXgqdkxhl4W4araC+3nG5IzOaEPObJnF6KoG?=
 =?us-ascii?Q?+snV6WnF7Nj28cYrvJAN4GLNwolG2wgSFrrTcVeANi9GykDTkoUGTlM1Lagz?=
 =?us-ascii?Q?YqsEzUtB/DSPo+rWXtZsF0JLmXVIc4+KJ2nORASqHjonzcchgrIbAOwvlHIF?=
 =?us-ascii?Q?naSOaKnBhdTWx+CnO8Tli7+vyOerBtI0URvjo/iBFcjQ4+Bd/vm4VjapXSOd?=
 =?us-ascii?Q?4+izSo0+BBob/O3ayswcqcMbF0cpScduWc+7KKzRn1S+NiGbSBMqMEHAyLU3?=
 =?us-ascii?Q?zXxSM0McvfnISS7FBipWF0/nxVgUnHotGXoDGg+K+LPER61RbsVE6gnsNLFR?=
 =?us-ascii?Q?ddhWsVtPtTYB+WlPsxGxedMvOWDLoOiahNKycNyCQm/lEbcckK9gbOtctCEU?=
 =?us-ascii?Q?ZfmgAVqPy8lUhahEHcm7AzkvZyPcpEQ9msIdkNlOJh5V0RnjenvslG29TY1z?=
 =?us-ascii?Q?oJ+ovFepf204+UwrqgrYW1j2NPyr6IhiBvwVGH3MQa0uo6FNd7Rz2zTkHquw?=
 =?us-ascii?Q?yziC4tvvmsrhJn5xh7CBnkNZEXHh1s9BLiNK3M6fjaaajyjctxh1tX+syb+g?=
 =?us-ascii?Q?yzI3rzWxc9jkuiNDTb+LdZ+K9sw1wrPplETjb8PQUZB4ZhGA0Mm9ScfLuphV?=
 =?us-ascii?Q?uOh2QQGKUwZzIDR7BjzksA10A7IR4XT+SvtGJx/nRDy+GIcoG5jHE4MUbcQA?=
 =?us-ascii?Q?iE/6Yt0jshhK+qnnvpkebRDQtRsdNVPZPImXjSm2yORiBUtIGW7a1AoeNaBX?=
 =?us-ascii?Q?AxyXLMD0hc2l3wZyPpKiiTwFri4Lf1HfjdKrrIFZZzB701W9Ho8RZQJIGCrZ?=
 =?us-ascii?Q?xbbRWvW7IjyP4IAseRofb771U+76dn6mI0/s8pdc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d05386ca-e57f-43be-b441-08de0428d4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2025 16:04:14.7355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3mg9EjanxPe+eYlqrdmjZ9LMhPdJDQh370mecVu2Bbeodu46Ct1h6H8pP+AwunRCvdBKLarpG5qdrwcrggjHhyIKcgPq6TIsP0UV08/xkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12618

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 05 October 2025 15:44
> Subject: [PATCH v2 3/4] dt-bindings: watchdog: factor out RZ/G2L watchdog
>=20
> Renesas created different watchdog IPs but they are all handled in the sa=
me binding documentation. This
> leads to a lot of conditional handling which makes it unnecessarily hard =
to add new items. Factor out
> the RZ/G2L watchdog to make handling easier.
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju


> ---
>=20
> Changes since v1:
> * dropped 'interrupt-names' for RZ/V2M (Thanks, Prabhakar)
> * removed unneeded label from example (Thanks, Prabhakar)
> * added tags from Guenter and Prabhakar (Thanks!)
>=20
>  .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 112 ++++++++++++++++++
>  .../bindings/watchdog/renesas,wdt.yaml        |  45 +------
>  2 files changed, 113 insertions(+), 44 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt=
.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> new file mode 100644
> index 000000000000..7543e6528f48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> +              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> +              - renesas,r9a07g054-wdt    # RZ/V2L
> +              - renesas,r9a08g045-wdt    # RZ/G3S
> +          - const: renesas,rzg2l-wdt
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-wdt    # RZ/V2M
> +          - const: renesas,rzv2m-wdt     # RZ/V2M
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Timeout
> +      - description: Parity error
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: wdt
> +      - const: perrout
> +
> +  clocks:
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: oscclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    watchdog@12800800 {
> +            compatible =3D "renesas,r9a07g044-wdt",
> +                         "renesas,rzg2l-wdt";
> +            reg =3D <0x12800800 0x400>;
> +            clocks =3D <&cpg CPG_MOD R9A07G044_WDT0_PCLK>,
> +                     <&cpg CPG_MOD R9A07G044_WDT0_CLK>;
> +            clock-names =3D "pclk", "oscclk";
> +            interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "wdt", "perrout";
> +            resets =3D <&cpg R9A07G044_WDT0_PRESETN>;
> +            power-domains =3D <&cpg>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 12ba07781763..2a15c012fd67 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -13,19 +13,6 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> -              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> -              - renesas,r9a07g054-wdt    # RZ/V2L
> -              - renesas,r9a08g045-wdt    # RZ/G3S
> -          - const: renesas,rzg2l-wdt
> -
> -      - items:
> -          - enum:
> -              - renesas,r9a09g011-wdt    # RZ/V2M
> -          - const: renesas,rzv2m-wdt     # RZ/V2M
> -
>        - items:
>            - enum:
>                - renesas,r8a7742-wdt      # RZ/G1H
> @@ -83,16 +70,7 @@ properties:
>      maxItems: 2
>=20
>    interrupts:
> -    minItems: 1
> -    items:
> -      - description: Timeout
> -      - description: Parity error
> -
> -  interrupt-names:
> -    minItems: 1
> -    items:
> -      - const: wdt
> -      - const: perrout
> +    maxItems: 1
>=20
>    clocks:
>      minItems: 1
> @@ -140,8 +118,6 @@ allOf:
>            contains:
>              enum:
>                - renesas,r9a09g057-wdt
> -              - renesas,rzg2l-wdt
> -              - renesas,rzv2m-wdt
>      then:
>        properties:
>          clocks:
> @@ -155,25 +131,6 @@ allOf:
>          clocks:
>            maxItems: 1
>=20
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,rzg2l-wdt
> -    then:
> -      properties:
> -        interrupts:
> -          minItems: 2
> -        interrupt-names:
> -          minItems: 2
> -      required:
> -        - interrupt-names
> -    else:
> -      properties:
> -        interrupts:
> -          maxItems: 1
> -
>    - if:
>        properties:
>          compatible:
> --
> 2.47.2


