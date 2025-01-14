Return-Path: <linux-watchdog+bounces-2700-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E5A10363
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 10:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C7916172F
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0371C2500C9;
	Tue, 14 Jan 2025 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n11l2/uf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A7224D6;
	Tue, 14 Jan 2025 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848525; cv=fail; b=ISnxXM20/XlhjGBo+ggXp5uTiA+Y9X8tvgap/q8U7ndxMeXUvHDooMtztUKIXIyDFKv93reZOWLk5ZtpHGx3klbF1nKyascGmiTo9AML5imaAfyCGeICK5YW1QrPhyHrPWb7ZuyzuRP99KYYG0XHXKcQOiR1LzX8v3/6MjkhjiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848525; c=relaxed/simple;
	bh=Kd7BFn4WmmIMXm+YE/jq2Y6EfSle+paxmfBZKb1Jls0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WsgokyN7JCA2UIuu+6jelm+XwDSRDmTpNUxzEoRDk1oHdgTyH3QzfAhxBNoeLPo7jsSW1VPVt9PWnTbXJ1ZMOpgbYkxGKb+DPJBMG5oY2sIq+ogHjd+zjy1gAge4k2+Fge9v8GrLGuLnI9toPvuL0MkiPKh9I/1irq6PBicsSq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n11l2/uf; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDjmvxoMFiBw037RIRFF6ycfz0cVqZK4laEQbEF1PFwmT0/UmLzaKg8RrM48jGONryAL2hXuHx4+GNe4UVzgd8DC0H6FzLoUYk0gC0gYkmc0ZEFRXGKmEXVLrS1Esq4539BJkdNkRb5PsgnULB2LymhtQcghbSQ99MWa+4SHAU6UEZoj+cHQnk44zhrVT3xll5DhPCYjDkm6hLxBWV5ndnWCcD6zK6LPTbHoQ0ot34Sf6Z7Cix/ro4RKdi8dlIxQv7kjglY1u0CjHUhKwJwiu3ANJDytAD6vju0GDDwTLIcuZqz466NXf0eu8kToOaxQWXaEaWbt8fvyBPXuevuJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd7BFn4WmmIMXm+YE/jq2Y6EfSle+paxmfBZKb1Jls0=;
 b=WuENAuhxU5+k1EgHUx4jJ2q3Z7w5TlvxKWE/y5mk8JWAw5YtYKR9kuDAfoQXYFbprZxjA5b/paSdG2qQlkkzukJ2YlkWv3HbiLNSqb4a6FgLLYmFywIsBB4z0ClL9xZfmOqUaHQ7WxeOxYT4UOq6Kd8YtOVCui4CnB0C6yGLB6gbHTXVbfb9pFtJb7pg/XVHjJsoXU3V24hR4HxRBV1+ErjLFZy0YcamSINzfanXiRiPsoMSFdr8gkH2cxqMaQAsW9qUf/IJ49Pexmjqv3lJ9ILU8l0GDxheizl+C/eOgowPzD6G6MCMKrbL+6Uv0TkibOK101beePNe4qpBNf/tjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd7BFn4WmmIMXm+YE/jq2Y6EfSle+paxmfBZKb1Jls0=;
 b=n11l2/ufzD2u5i+bRVp/pn8nWivIJIIwmxU6/6uhNT4ZRcfuTdCpVu9gVeCGQe1n7aL/EJQJHJK0ZynOwLTEhjvG4uP6OaWvIYWBGeLhFg2Aaw9cP2PZLZ30nxpXINFT4PoygqRDxFah1ujQRIv1+/ElX526SE5ZN7S40J//dpc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6171.jpnprd01.prod.outlook.com (2603:1096:402:33::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 09:55:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 09:55:19 +0000
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
Subject: RE: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Topic: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
Thread-Index: AQHbZa2pJcErpOPUlkmwa7Z9oLDIg7MWB25g
Date: Tue, 14 Jan 2025 09:55:19 +0000
Message-ID:
 <TY3PR01MB11346890814785C2150BB484D86182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250113112349.801875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250113112349.801875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6171:EE_
x-ms-office365-filtering-correlation-id: d09de0ea-ba9a-4558-e152-08dd34818de2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?koi3A7Hjr0lfXctiv93yQeT1N3SzY17c3EkfO4XbwJzvnxLGXpxLBjMgJ2mP?=
 =?us-ascii?Q?HtRWo2ASo5GA8MWm6ABQjd5kXmHGOh+y5zhoi6QIrj0rk7h7VsLMm/aI0baW?=
 =?us-ascii?Q?ZN9h6bu7vCaVNBXV28N2IDmTB+Eiifmaescd19tn6q49bPE4WZgvPS/ATmk0?=
 =?us-ascii?Q?kbstssQpP4JnzFamLQ6ZCYCb3gjBnfIY4+sN+nJaosAdjhr/9kXt94qFG4vF?=
 =?us-ascii?Q?QciXX6p+vpDSlrZPNTTd7TEY06RSiz3NW4aoK3s050VCOBLpykOAu2yFmCps?=
 =?us-ascii?Q?zzChfCIRPpOYmXTIb6ZbWbKD8N/LEqn6/hGK6C4AanKbbAWU10IFAObe+QVJ?=
 =?us-ascii?Q?CLSyjITpuVYr8aGeaBt/dt/yUfFfMjuiSACzyDCo8AZaRmLaACt9y9ho+z7X?=
 =?us-ascii?Q?dYXkYtjCZX7X/lc1yZeYUz3fuFdOa3GEGFoW+N5rgLG12Oz5pzy3drIlh8sG?=
 =?us-ascii?Q?yLFuPlocvUdrN5qA+rfIXcEC0LjP7NA9dkGGvFP6tfZ7DzxaDf3L3qQEohk8?=
 =?us-ascii?Q?2u942HvFCIAOT94InW4n+S1gdavfpZua252/lHzoXJJh4HPIL+Jj5wvl06So?=
 =?us-ascii?Q?pCn4BFeCCudXVHTeXf8E/PgWuPLYBOlXWefEVwYigyb1S6LOpXYey0yjYgHZ?=
 =?us-ascii?Q?xQ1/9aIT5ytR2bN1x4zvUf/jCBFjN+RaEtMo8L3miFqPvM6KQvRiaGrS/BI+?=
 =?us-ascii?Q?kg6Vddlzzv8SW7s0QF7qKF9PHmCGimJXQsJ7R5fy+KQcWL79M3AGd7S/zkQb?=
 =?us-ascii?Q?Ur8CYQVkINZquBKcYtWdoHAcxujx1t/+FqxQuXovNtWoFj9LwaC5f4+NPbWI?=
 =?us-ascii?Q?IMbfAYirVway3ZIhl2niYSqCpcwKCHpojvLovZ3S5dWqz89uIMXaLGuysK2L?=
 =?us-ascii?Q?PQx5pusti88YZfO4uIihzb8MsmSDJZ1Jsw/iqNQ5Fmw4VRn+pakrEmWgqJSL?=
 =?us-ascii?Q?Kvh5aMIBQYYvnlCLOoVBp8UWb+owrXBrcuPZeH4RETaaE3XVY7TdwF5ouFh0?=
 =?us-ascii?Q?lwKeouODILbTIT9Om9h70g/py+1JwkW9MiU/vMxU2B7qTf8sNpCLaagjb5Mj?=
 =?us-ascii?Q?Q4J9NMeY01Kwe2ZYZspGOnTKjnjzeOQ4hnDwfJDpJgaaryAwFKwuz3h1f9k9?=
 =?us-ascii?Q?oGfCvrJXmk1hBEDxdVxnxsarr7uqpBMF9SHgSL1Hk0I4JbJI/NY+LAYZgheX?=
 =?us-ascii?Q?wunaFCEC+DtghoIF6Wt66uALSKHNj6IoyvokcsXGUJ2wnTjVhn3dP6DsUolp?=
 =?us-ascii?Q?D+sf1ZQhd2odgDHbwFeP9ZpSwpmM6We0FdmXvGGpcJ4agC5C3VoqdkcyWToi?=
 =?us-ascii?Q?7HuGsMz5dfZGcz4XbvUBNuC5UH7TWrG+dRK9Ow/n2KZcnqGZx5pMjHFCNgml?=
 =?us-ascii?Q?x2LA0DL1FyjEc9hKsaFHDcragJeD5o89p0MVt7fDKDAonPE4EnxHcq8Zu3qK?=
 =?us-ascii?Q?2x2uRq5YKfkw4i63WpcD/XlGwESik5stzBEHi+MgVX34tabgXuzcEg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bLjP0WIN9g3wChmSx4yKq7yzn8YdvOjlVq9jcCAM79oe/RFU1PygDhVozU/F?=
 =?us-ascii?Q?XazD+Z0BokMIo0Lh/4jc/ZP4s1jygtF5APZ3g8mLzPigCJsfp0/hJaBYFW7t?=
 =?us-ascii?Q?0v+jDMzIfN6EO9aNdkzkz532Kb7SBvfO+abke4umnQdiy+L72RJqf+u2NNd5?=
 =?us-ascii?Q?w589vsAjF5mt8Nlmm5F665hJqzzqQ+IE+KrtA7HdgyfMcieDOqqCxaNluEgL?=
 =?us-ascii?Q?z3LxYTMTI4VnF+zXE7Zq69SVR7BGftqxOSbYFj6b0NYwPu9nJ+aVrH2D5nma?=
 =?us-ascii?Q?16RcRsQNLsA3P/W1nYCwyRjvvVeVIANtdY4UVA0L71PamrSkirUp/5UTbg5w?=
 =?us-ascii?Q?0u/ltgNU97wICEd+QICy8XZBfmH3wC0EjYf6gBhiQGGBWYseSfKSj3Is9Eew?=
 =?us-ascii?Q?JSb42hPkjMlvioI7muMIhymdcJHdBwL+usxHNe0ePMe4Y7cpWhEq231V2ozi?=
 =?us-ascii?Q?58R0drmsQbkTMy2j8J2EsOrRmqWKu+Ca28i3VdrkM8D5jo31fvdUglZvhwZT?=
 =?us-ascii?Q?IlxSdCUapBc52OtQOofdzTkAnFyhbiTzLi4HTyirJIxiNzCoN3XPV8F2UzDC?=
 =?us-ascii?Q?faUtD44J0AMVTDD4vdx1zaqPctnvdmBsqdYE0TQGq7+o0zcEc5Io0n5EXFMq?=
 =?us-ascii?Q?/drwHKoK29AZypfo0tnHfq/+MDDxZTqRNdMFhvVfUANWV/h2tOPUZOkw0l0L?=
 =?us-ascii?Q?oGHZjLQCW1ezPBI62/iUmE19v+NzH0/UqpH5vfwPi4QzgHKkR6QhWWhcUgXs?=
 =?us-ascii?Q?ewe5Jc0DBwyEzKjxbnAbJruIUjUvYokXbBzIWPcWCX+p8quQPe6xuSRWCLSg?=
 =?us-ascii?Q?DAkUvf6wR4zIdzW58bx6Y4PhWPTLaE4G7GM+TIE2OU8czwmzvMzWNppM2OHz?=
 =?us-ascii?Q?jAdvoTJihUco53xlHyZo7qrl9H5MUIsDCHYUQPwSGGBfabQhU7YLrvt7nIvb?=
 =?us-ascii?Q?yIr8jpdM/4bwICK8CuZu8aV3FqMIWSETKj6jkFdor5UkiETZ1iWl2lYQi9sr?=
 =?us-ascii?Q?eY2qpYuW+6AtZ9x4BWPEJQwtHY6aoq/ttgWhhraS1yheyNzb3hfMlv/Yv0Lj?=
 =?us-ascii?Q?xym+9q8TOqrB4GnwmY+3qtUXImXjioInSxO/r72+XbpwynHC8jlKU9muqn9E?=
 =?us-ascii?Q?bIifVSUtQJWxIfbCX+xOCUN7VeRi8yXbOSfwjkm3QfUXK6fL4AB0/pQipp2z?=
 =?us-ascii?Q?S2EWGUiJlC/hitUKFQIullNiXXPEDirJ4KKvKaQA30Jx1XBfJYHtNWTYzrm2?=
 =?us-ascii?Q?sffRuC1vj9b70rjZ/1Z7uXKjTIMNyQ+aTb/MwZ1atm7WScbMf6IUZms2JB6O?=
 =?us-ascii?Q?kL6vKTUi2fGa/7SboNsQoPJNFXTHcqLBTQagMs3lUp2905WhqJBzGEyoKWkI?=
 =?us-ascii?Q?7hia76JBigmx/YJ+0I3rvLunKlJxeKBf7hiWg0xHnUXimMOzq/omm8R9fQdP?=
 =?us-ascii?Q?MtZ5Pi7w90+HjygiBcAD3WAgoYE2Lf+74XmUm0hCzs2keGlMfXK0r4rjLe7j?=
 =?us-ascii?Q?G5sRNL1LEvTOl21/7Dono/VmITnE4RdJG469t1xoI9VjCTavJyIlOFLNrbcf?=
 =?us-ascii?Q?rDJklyN0Pj3SIbSZWr/e33QGQ6eho7VCnuYawlDCi5FoynDzmejDXNilL6Xi?=
 =?us-ascii?Q?1Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d09de0ea-ba9a-4558-e152-08dd34818de2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 09:55:19.2080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBUKPHaCXPo/9fIZAmM2stFUrrS+zuIsO7jV/hLi6oW65hJ0imYRekN2Iu+183w41Ps4bTBxK0its1PNIW/sp2cZ1zvl7zzcDbykwfc2Utc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6171

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 13 January 2025 11:24
> Subject: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the =
bootstatus information
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> On the RZ/V2H(P) SoC we can determine if the current boot is due to `Powe=
r-on-Reset` or due to the
> `Watchdog`. The information used to determine this is present on the CPG =
block.
>=20
> The CPG_ERROR_RSTm(m =3D 2 - 8) registers are set in response to an error=
 interrupt causing an reset.
> CPG_ERROR_RST2[ERROR_RST0/1/2] is set if there was an underflow/overflow =
on WDT1 causing an error
> interrupt.
>=20
> To fetch this information from CPG block `syscon` is used and bootstatus =
field in the watchdog device
> is updated based on the CPG_ERROR_RST2[ERROR_RST0/1/2] bit. Upon consumig
> CPG_ERROR_RST2[ERROR_RST0/1/2] bit we clear it.

As syscon-cpg is available, can we get rid of Linux assuming TF_A/U-boot fo=
r configuring Error Reset
Select Registers(0x10420B04)for the watchdog to reset the system?

After this, each watchdog device node will have, selection{offset,bit} stat=
us{ offset,bit}
renesas,syscon-cpg-error-rst-sel =3D <&cpg 0xb04 1>;
renesas,syscon-cpg-error-rst =3D <&cpg 0xb40 1>;

Or

renesas,syscon-cpg-error-rst =3D < &cpg 0xb04 1 0xb40 1>;

Cheers,
Biju

