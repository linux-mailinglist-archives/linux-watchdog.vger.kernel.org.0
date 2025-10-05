Return-Path: <linux-watchdog+bounces-4316-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06EBB994B
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 18:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE1714E2523
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 16:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E428325A642;
	Sun,  5 Oct 2025 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e4dKlFTk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C2C34BA39;
	Sun,  5 Oct 2025 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759680691; cv=fail; b=PMadDlWeCOcilwTTfICpzQKN+DBNaKE5ND0orU436Y7Qi3UkFNlBNq6RXsCiWa3RuPRaBLy38F0HjF7kZkUa3r0SJB60ny7MivDFlMCawCmoEjgzbBm/jZ2qdQmgu8pV8vOk+6nW1OxnpwTSFdHecw8Xmz9f2/7FGS66WQ1XnZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759680691; c=relaxed/simple;
	bh=sUZ4dIOVg4PF8oTvPiWKoTfENg5Tn1wLgO+XNqjBclY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z4/liomnUpy1aady1/P8yxoucW6Xv9kkqmq7bhoLY5HSKiHeWe0EcE/sk8z00frcMVdS2EwGN8PgD7NWRC0RV7Mj3KoOIhlinrNIxfA3Vx6FFTlOEbAfIM4hdKr00YjykOiLzNEZN+4BZOJRhHmC1gJUPYLO6toe65i9TRUIkoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e4dKlFTk; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFK9hWTft/c5Z91qP02TbIaIttR2JXx/zwaWiiANvGLLcTOyDhNe0n5kkAj/zwMG4e+Mrp4DvO2QsYxcRkT+fEejJWUFkNzNXzpj4xn8lSUGcwWNY08ohvNVkbOrvAc+UK1W4xIGTiNFeNe4osoVJWw35Pqu55/ZVggtHTCNOYgXvjztdJffnCfGmq9E0pCBsCH+Pb5KkPIV4RSZrj9+L4scNa//Lc3TPBbCnNGXMi834lXpPsbAbYX7/RaIbrIH0tPAhsOuUxBSQprXRBdNPlV8mSdE9o3Iw7J1O6KeWhvE9O8oK/68EWUFiLQGKzOmpwEIFLUuwNmX+BX2gG/WSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV30+8GAVsq2YZF3NisvtNU+fZlio3FjRP6ovgMhSlc=;
 b=rc2vKqATPE8izoqPG2rdbcPj45wLqm/g6/Ta3dSZrWfSOEQRLxXu2UIoGgnzq+SNJLGCmkkmCK2iTFzGljWPmYGgIbj4Rbvml2c9oGvO/J9ZYatTXPcRTfBaTSyHeH5vzBNqcmWBakZABFj2H405PM3hftI6TzJ/3Iko4iT/x24jnk6/rla990eGPDqky5flYHZ9a04HfM1K+XSaR1iFUkXdZOQZe41A5H+Uzs4+hiWb8aIEkKrLmsSVgVb5l3yvfbFtQqOlQ8oUowi2ZWWZEmEGOhg2gvt8nz1IbBlldh8zLuRM3F8bjZjSqJwN3DvkQO3hyXsmQKssQol2d3d/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV30+8GAVsq2YZF3NisvtNU+fZlio3FjRP6ovgMhSlc=;
 b=e4dKlFTkvcrUUsSSnxvtg0mr9DPT4RA26sUmKm9Lm7fRbycMVWtp7henEV+cbO4hPS0m2wTCKyfhtOm5NbYug3ZjFJoQwKFh0d+v4g/qEdlVXz5cR/v4xH70wM48rducqYxgykuo/q+eBie1xw/Yd2EXzHCmA/NbljhZaesj6Zk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9979.jpnprd01.prod.outlook.com (2603:1096:604:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Sun, 5 Oct
 2025 16:11:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Sun, 5 Oct 2025
 16:11:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Guenter Roeck
	<linux@roeck-us.net>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Thread-Topic: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Thread-Index: AQHcNgagQ5/85CLbrUmtG4qDdk4zRbSzt7/wgAABGoA=
Date: Sun, 5 Oct 2025 16:11:15 +0000
Message-ID:
 <TY3PR01MB1134694972447DEF27DB31EF486E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9979:EE_
x-ms-office365-filtering-correlation-id: 18147b4b-a214-4387-1bf9-08de0429cfc6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hw34mgu+cltDDklYHtoeAZT3lX9xGv6zMZZQdeFpGV0XcNeu0Lt1FJETYfFk?=
 =?us-ascii?Q?KpPqGTtSZ7AKDMvelfzpDCBrRd1kwzuDjmPsYNlv5Lp0gc8gUkfZjcuA7DSk?=
 =?us-ascii?Q?bKJXivFMi3ceT40sTYt9fqY8OSH0nyA8WnTYVsiGDFZbg7ht6yj4lIPe2wxT?=
 =?us-ascii?Q?+QgyREzpJQguXQY00tZcOgy5vUTHems9gqXzEJcyZ9pDl40/QDDdiz/wkaeT?=
 =?us-ascii?Q?funIj+c31EL/3nmZByARzpbExdg4nyO5BIr9oV4//iYSMD8OOYJegGX2rVQW?=
 =?us-ascii?Q?q6P5kmDJ9YVcAdM7+WwMGiQ/AHzNeQUvcmarVl2GEg988k+n1WxM8cYqgAxP?=
 =?us-ascii?Q?OafzEqK2VlTDJ0D+Bht1DCcSqdlXkIAjPCVukKrC4GsdbKbcrtLfG3RSRKSa?=
 =?us-ascii?Q?O+WwFj0PI8/NEA0k7eJsG0r1oaebxDvjeMyJwgePwYdGAXM+r/lJSvmsPt0f?=
 =?us-ascii?Q?KrFTN06jy2AffrdeyJuSJh2EgYcOwfRDX1NvZROofDuyTiUdp8lmNIvBiNCY?=
 =?us-ascii?Q?QLhzLFruWkC1d1yIGgJlRLxOOHvbZnrfuJpnG8O3ayfMnHrgKCjl0AiZCkrU?=
 =?us-ascii?Q?INmGFF1zQWYsOP5g7/Rg/I+lcCOEp1EWNB58YvfBD9+IptS2y7ZVrn7T7Hud?=
 =?us-ascii?Q?BvB8EAAA6XsfLpSPZCxq3m39XarbDfyEVdKtrZ87ypaPCQE43Iui6V1HJvbU?=
 =?us-ascii?Q?+Yuv8/ZV1Im8ZBSUGkf71OqZFu3ifAaPFrH1nAf3PO7RMY/2Tk8ffMTzxMDY?=
 =?us-ascii?Q?Y1tMiQ+FqnHNE2s8/55CCGT4YivJjRxZska3vDjWGBrwL1juiMJWG57SFg3J?=
 =?us-ascii?Q?kNhX05wbX661mOrX1dW2U3u7gywp0LRMtdOS7bBfuRZ3NoIibhZ35pt8CarU?=
 =?us-ascii?Q?JNBOn7zBk/owSY0eJoxD/wYA/X4jFcCxMDpQV4EscQq4as3GrUr44flkiewN?=
 =?us-ascii?Q?V4EwsBKU+ThgbUzGmOBBmALRFkKb45uqpgCIu94ZvpaF5tSbEPz0goWPB2dv?=
 =?us-ascii?Q?fTQj72A12IGvwddPDMrqs5BhTGscIilGZ36VgwWOqOvaBn7wZt3BJEwWJSF2?=
 =?us-ascii?Q?cwx6JVSebbpLyrUlqmFYcAxevMO8JdFbhMwgJokzJEHGqFjtDdXK2p2rBv2F?=
 =?us-ascii?Q?mShp1wbRAmFijiQ/Qh8/R3eKcqfO/E7hQhOkHiMJfivplZBD48lhf7+xXd39?=
 =?us-ascii?Q?T2BX7N7yfn2BEGAcdFs+h1z6dfdZKawHUpmf4DScwG6850X0DXR+2oivXmad?=
 =?us-ascii?Q?8Hl8Ld+ipGlHkK/yO0gtkUTRke0EG3izUM/ibks/HbvtbV/4o3fVSiz0oCfj?=
 =?us-ascii?Q?7tyf/FzX7ymFJcv4SE8x/6ZHlG0ZWvDpugjjZlO38iXuY/MB/krZHisplwHz?=
 =?us-ascii?Q?4N5pbbNb4iJycVtOaUdD0gIM5YOzjq/otj725L9PjHEdHHSbKLATl2ENEBjT?=
 =?us-ascii?Q?5J4pw/Nhx7t5j1L+yXBhVPKbPPYy/Wvv9JV3E9v0R7vtGwjv+Uc2Kg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?V/846JgV+bIxHArMJDPOin5wl4K4XOnAANug0d1x/mI/s6gOcRHDfj7yaIBE?=
 =?us-ascii?Q?Qf8kEcaYKg6+z9c+lgiCgZIcHy4Ml2mTEdINoGZ7zicZ5omqrmmlkGPNhk2O?=
 =?us-ascii?Q?xeMRLRwzl8jkNmuJYUUt482dPnIssR7QmVmcObiSkA9V4ZmtiseQm4fB2rb3?=
 =?us-ascii?Q?6ORBM/fvPGUU8wKaup8OwyklL/fbF24ChSGZeVls9fXHUNLdoO+XnZNHH4m3?=
 =?us-ascii?Q?gAEsolBob+RLchdRRi3O6Y8muhPy9Ib1JkcOWOZRGfc7j1F94+7x9uka1wfO?=
 =?us-ascii?Q?5cFGzmk/AgJn/rbT6goh8guukyUDwLAUk90TqjiL46abMyhQ4MVN/Et57RGW?=
 =?us-ascii?Q?Mtp1wwEpCnuyEQ5+ttU1HAksTDgXZtuQBQJVOAVpi+6iPD/cjkOsn0+90lEU?=
 =?us-ascii?Q?36mXIaiWjKvZGLdv552RTeiJoNuhq1yWThdov1K2wyWpZHUVGgjGugq6sz78?=
 =?us-ascii?Q?DmB2WngLMbSQRtL1tm2shzOJyZbNrD/ULdrD8bEjlHDjrwYC8YNq7ZbKjgdo?=
 =?us-ascii?Q?jheIXRu3vENqQiEYsNBCsjckY4mHx7JPvKRPpd72fMLLgTZ674qWohdbg7tG?=
 =?us-ascii?Q?YL55TWCcjwnbW62WfW0fuOcoqzdyL8fA3AWM2vuQDHwKpb+IrfNqjAFI0gv9?=
 =?us-ascii?Q?+Ps52JTfJamuyXA56xvqUwnBaBgEaO3U80JLUXOnsDn82K24xASXioKGjCX2?=
 =?us-ascii?Q?tR12fR3iluPZYzy/YJh64cEDFEedZYTBaY82ibrZEITU+V6cMlZlxM/yhUmy?=
 =?us-ascii?Q?Zl6PavCy8Yi8QtwMIPzkdcUb6URw2osS3R7WiHTQ0DkMS2dxOII7jbORGmWe?=
 =?us-ascii?Q?xh71wj6YQBNfDLySGcOEfmFbaD3mu5XKiyMbRqDUhvPYMN4ITdoXqHH9ujre?=
 =?us-ascii?Q?15jJJRwS1yuQh/w7Z+wr9b5+z2mO+JxKDNFNaF5G1Nq+aEATVFGLO7sY/QdU?=
 =?us-ascii?Q?TiT9c1e0rTXxt6X5GW5z5RDL0HTyoQbPLRNutSDR7MUrVvIsnrm8fzE4e2Gl?=
 =?us-ascii?Q?DaYF/Fk+xE7/R/cfHkPAvlgcwRpUeY+XtNuC3Q2QtwW6H5kmqCatU85C98VT?=
 =?us-ascii?Q?JIy96GaVrVULB1JuPy41No+zIS229rGEbi+y6H5oVhFWO0AmsFjAE6Vafxer?=
 =?us-ascii?Q?9HurhOrYgacG9a0MtZxtk85nlzjYBHODV4pqmGequMo/cq1qQP1WtD1bpWSe?=
 =?us-ascii?Q?H5tvyfMrzxe2WVdUuBIE4sdnzAhT/9IfUohwXWtpDkDyu3xeAspB6co8ewcb?=
 =?us-ascii?Q?Tlid+JLjCKdHwgerMPZo4oeINExxsNTJxC8gZicJbp5MkRvmfwDenRsFaNeS?=
 =?us-ascii?Q?shaFOqem6W/fIflZ2uiFP9d1iaxeqURxCybZZPWFfzUGBPw5I6PlrwYyQngR?=
 =?us-ascii?Q?WmPIxBKnQFb+j6QX7C/mAFHp2uH63H/R+fdBjduVR6pGHy04jrp79cJ/xZxm?=
 =?us-ascii?Q?VNpxf2StihtmmLPltZvro10YAwT7y4yuGEraZgELzBB7UDB0kkPo4DuXGtak?=
 =?us-ascii?Q?+/4YCVnUd259l+TeiKUolLSwb/pTb3bTUINvLxD248PRbU+6gxJ3M2J3gn8R?=
 =?us-ascii?Q?mjRmAvVu1OLr+XXiT1PTROnB0B5atRu+AYAf9q61?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18147b4b-a214-4387-1bf9-08de0429cfc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2025 16:11:15.8919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ium6QaKdJQI+UvCQAHItJiZIWEzcQ0XzVRddE1EaPUdeKKczvPfn6dHGNSXUQq+XYOf4/E0D8WV0+BzEoBS9RiNZPYR361le//WqmE8tp6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9979


Hi Wolfram,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 05 October 2025 17:08
> Subject: RE: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) w=
atchdog
>=20
> Hi Wolfram,
>=20
> > -----Original Message-----
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Sent: 05 October 2025 15:44
> > Subject: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
> > watchdog
> >
> > Renesas created different watchdog IPs but they are all handled in the
> > same binding documentation. This leads to a lot of conditional
> > handling which makes it unnecessarily hard to add new items. Factor
> > out the
> > RZ/V2H(P) watchdog to make handling easier.
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v1:
> > * moved 'clock-names' and 'power-domains' to top-level 'required:'
> >   (Thanks, Prabhakar)
> > * removed unneeded label from example (Thanks, Prabhakar)
> > * added tags from Guenter and Prabhakar (Thanks!)
> >
> >  .../watchdog/renesas,r9a09g057-wdt.yaml       | 110 ++++++++++++++++++
> >  .../bindings/watchdog/renesas,wdt.yaml        |  97 +--------------
> >  2 files changed, 115 insertions(+), 92 deletions(-)  create mode
> > 100644
> > Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yam
> > l
> > b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yam
> > l
> > new file mode 100644
> > index 000000000000..1c1c464b95e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt
> > +++ .y
> > +++ aml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g047-wdt # RZ/G3E
> > +              - renesas,r9a09g056-wdt # RZ/V2N
> > +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> > +
> > +      - enum:
> > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > +
> > +      - items:
> > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > +          - const: renesas,r9a09g077-wdt # RZ/T2H
>=20
> Looks there is duplication of entries for RZ/T2H?
>=20

Sorry for the noise. It is fallback for N2H. Please ignore me.

Cheers,
Biju

>=20
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: Register access clock
> > +      - description: Main clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: pclk
> > +      - const: oscclk
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  timeout-sec: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a09g057-wdt
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +        clock-names:
> > +          minItems: 2
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-wdt
> > +    then:
> > +      properties:
> > +        resets: false
> > +        clock-names:
> > +          maxItems: 1
> > +        reg:
> > +          minItems: 2
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> > +
> > +    watchdog@11c00400 {
> > +            compatible =3D "renesas,r9a09g057-wdt";
> > +            reg =3D <0x11c00400 0x400>;
> > +            clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
> > +            clock-names =3D "pclk", "oscclk";
> > +            resets =3D <&cpg 0x75>;
> > +            power-domains =3D <&cpg>;
> > +    };
> > diff --git
> > a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > index 2a15c012fd67..08ba128bf442 100644
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > @@ -51,38 +51,14 @@ properties:
> >                - renesas,r8a779h0-wdt     # R-Car V4M
> >            - const: renesas,rcar-gen4-wdt # R-Car Gen4
> >
> > -      - items:
> > -          - enum:
> > -              - renesas,r9a09g047-wdt # RZ/G3E
> > -              - renesas,r9a09g056-wdt # RZ/V2N
> > -          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> > -
> > -      - enum:
> > -          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > -          - renesas,r9a09g077-wdt    # RZ/T2H
> > -
> > -      - items:
> > -          - const: renesas,r9a09g087-wdt # RZ/N2H
> > -          - const: renesas,r9a09g077-wdt # RZ/T2H
> > -
> >    reg:
> > -    minItems: 1
> > -    maxItems: 2
> > +    maxItems: 1
> >
> >    interrupts:
> >      maxItems: 1
> >
> >    clocks:
> > -    minItems: 1
> > -    items:
> > -      - description: Register access clock
> > -      - description: Main clock
> > -
> > -  clock-names:
> > -    minItems: 1
> > -    items:
> > -      - const: pclk
> > -      - const: oscclk
> > +    maxItems: 1
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -96,76 +72,13 @@ required:
> >    - compatible
> >    - reg
> >    - clocks
> > +  - interrupts
> > +  - power-domains
> > +  - resets
> >
> >  allOf:
> >    - $ref: watchdog.yaml#
> >
> > -  - if:
> > -      not:
> > -        properties:
> > -          compatible:
> > -            contains:
> > -              enum:
> > -                - renesas,r9a09g077-wdt
> > -    then:
> > -      required:
> > -        - power-domains
> > -        - resets
> > -
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          contains:
> > -            enum:
> > -              - renesas,r9a09g057-wdt
> > -    then:
> > -      properties:
> > -        clocks:
> > -          minItems: 2
> > -        clock-names:
> > -          minItems: 2
> > -      required:
> > -        - clock-names
> > -    else:
> > -      properties:
> > -        clocks:
> > -          maxItems: 1
> > -
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          contains:
> > -            enum:
> > -              - renesas,r9a09g057-wdt
> > -              - renesas,r9a09g077-wdt
> > -    then:
> > -      properties:
> > -        interrupts: false
> > -        interrupt-names: false
> > -    else:
> > -      required:
> > -        - interrupts
> > -
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          contains:
> > -            const: renesas,r9a09g077-wdt
> > -    then:
> > -      properties:
> > -        resets: false
> > -        clock-names:
> > -          maxItems: 1
> > -        reg:
> > -          minItems: 2
> > -      required:
> > -        - clock-names
> > -        - power-domains
> > -    else:
> > -      properties:
> > -        reg:
> > -          maxItems: 1
> > -
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.47.2
> >
>=20


