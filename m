Return-Path: <linux-watchdog+bounces-3066-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8747A54EB0
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Mar 2025 16:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E30441744F4
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Mar 2025 15:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018361FF7C4;
	Thu,  6 Mar 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sWGIJNeE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7443713B5B6;
	Thu,  6 Mar 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274101; cv=fail; b=dBjJoUlT46yD3YaaVlko99tlm9i9MpApvaZWpwgnHRfXTV2xnhjOO//ROpblyoc9Yrf6Mi6mrOObg7plSiEoVtgpUPgcqNOUbeig5+VoiQeMHr6LDb/U259dLuVHYxpH0UaoM51TCJnbwQ2VieMaXT/AFZ+ZRxXC7kzytSUSN70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274101; c=relaxed/simple;
	bh=q1wOorIL6oluZDWKtBKX8Um6hzwhmE30YiBG7VBWQRY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ip6dqKz2PZgFhuOh+8u8cE8L4e5XRunQodqChsa9cYyIc6rZyCIQnJD08SwTKYOhOsrJbA+ioyuv7qP+NM7L94GgbM9WRYjVuhxvOJ8qEur3GGuMg7l1jlXSisDa9bT5ttlYaFpbFMim+K+hWBv6wDFa+Ve9vjoASMYSzJZJN4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sWGIJNeE; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzjUTd+z0UKVO5zR2gK3t9cMmbIfKgVYdTtMFeadEHcXnD61opvV4u80ECYYnFAlt+Rial7qypnUIP2ahXOM8+HpzLEPZNHXh9vYTBy/8cEUhERbhL6ajs+VhnLwn5rlTR504u0Tn4B4wCcz2Azy0kPvtel5RSm3iLmpGPFD9DZnEGBwiwvCT215qoNl24INq2vKndaLR0RVthfpbEJ+9io/WlFWJPozW0H5/Kd9sYh9Kr7Pn6UFrPMlzhtwgsvkQtkpLZd6DhOlP1gRLdtgUVvCgpfJdyxBKur6LBMnAz9zxAF9A9xDu+tiB397N7Csu99j+MNRUoiC4h9qIERVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE1C6PjTyGJzFSWALvPTXQ1fC0lUbYM2o1rs0SczZQU=;
 b=xGvosBivDGQSQpb1IvcTz4+PeUD1L0z5P+uVmf3oL0QJxDQ2W2djfYm2mkLV8e5zAfos9q2YPtL0LnYB528M8nr/2nTGnAvoY6s1raGI0+eTxcI5Q0W/HNmsHFZL6G+E+c2GwK/qVc20FTIo12m9FWjMTqVlMXVvnhkPXeSBz2Zx0ZBZjxxRqu8wmrtPaEJd+L9jtDDvyHqoXRkQnt55p6qri1Ueh8kdFZlNjdvniwksi4UWlrJhvroRzf+sAb+j0ObnhztTG9O5WSqr0hLxwRTsfCb/JaSYxIkh1EfOX8idF36T6qzs+niw65FtYl5Psmpwei9M9otyOPbqO7D12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE1C6PjTyGJzFSWALvPTXQ1fC0lUbYM2o1rs0SczZQU=;
 b=sWGIJNeESOw8FOq9s26TyBOr3HQQS3lH764cEMbneq4O6xFZxgiPB4YXecKmU8zNDDGWU2t4kiN22lYf5Dv1U3/85+5rL6o3tCwyFSVQbiInxWp9HeOFybouoVKAjqZGxiAJ2TBJqHM18xRTJEjN+Dfz1IwlBEvQhJNtf9RSuf8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10229.jpnprd01.prod.outlook.com (2603:1096:400:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 15:14:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 15:14:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 0/2] Add support for RZ/G3E WDT
Thread-Topic: [PATCH v2 0/2] Add support for RZ/G3E WDT
Thread-Index: AQHbb/X45Tmuum+LzE+mhttDRxt79rNQOItwgBY8TaA=
Date: Thu, 6 Mar 2025 15:14:53 +0000
Message-ID:
 <TY3PR01MB113467F76EE48961D62EB63CA86CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB1133215EC9887878F8A85DC6386C42@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB1133215EC9887878F8A85DC6386C42@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10229:EE_
x-ms-office365-filtering-correlation-id: f3615b17-2c27-4f0c-f91a-08dd5cc1a5d4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9y7LKDhPlZdzpkReWdGWuACLGJsk7lbOU1QOUCMxP0GbcHfEJngz/EDVTLBk?=
 =?us-ascii?Q?MHU3a+zlfmlafD5VtA7Xu+MqmzGpkaU/ksalP9HGXdH0cGAWEhYZkHSXhHtA?=
 =?us-ascii?Q?zN/1CO0fmlylnFlnzvbe3mlIouX5sYwAOsMkaVi5m9gC7PD+CneurZRvg6AG?=
 =?us-ascii?Q?VtxmThMDfmHD+UoWJj5uZMzmn9DI1jdUNZFWzt64FbYuMunrDdafk/+KIecF?=
 =?us-ascii?Q?NAC9Q1TXFGAgGUCAcWlQsh2w3eNVbhomUQW6WwMViMWKbaTqmzRMkmOkdqOo?=
 =?us-ascii?Q?5ZX/WnNQuPhmw+M1q/Q8YRoydcvuNXNOvjcE79IdsfrjfhD6DxDsCw2OVc/0?=
 =?us-ascii?Q?egcDHbwja+jqcR3kc+4u+aSKEi6+hPHVw3HYRtVTNdBJzoYPMyZf3ZONLp6b?=
 =?us-ascii?Q?9Ff/W6XS66g9iWDrwFoR0EIL/jDWkTBaUwl11OPnhgTToHnmW7wjpj7YX0YE?=
 =?us-ascii?Q?ZErlxSP1+frXdMrsWPAMht2pU5CQjG7mcwDVt3L+0SEt+KdaGP8mrM1Pn066?=
 =?us-ascii?Q?SCwcRvJ7UQKVLeVFRN+OK/0tMUCAFFl7E0QxlVAl8Uf9hGMD5aiXdl35VauU?=
 =?us-ascii?Q?qAl7vugJ/Xi4Zw91FXUaJFBCTiKfQoSIS4XbgCBske11OJixNSfbJ73D8gnd?=
 =?us-ascii?Q?X96yjAPx58UN3KJ+0eMQgnpnHIo25/aniUtOIWlWVcGrQPAuDX7gcIuV1eh3?=
 =?us-ascii?Q?22UgVQH5v4UuJULuRb/VgUjcQU8NHU1A2Kk61RMRt0U8A8KQDsXmBAW1oX05?=
 =?us-ascii?Q?1PVh/y6SqBfJTp2YawUXKCJnUiuCzJHTL4nxvYe+kVmPOCv0gARAUkhAn6Cf?=
 =?us-ascii?Q?xo+MHqCFYhuu81eQAsYIW0OGzZEgAMENJw3DMWMWxAol477eYJfQBW1UETx5?=
 =?us-ascii?Q?1BCvJ0Fv3NMzXxuQRdfexhekk/OM3eX4hcprTSN1LP2OKfStZucVeSsc64hv?=
 =?us-ascii?Q?C2QOX9Myr3huV5+JtlCtiflHucIWEGPmKBBku0aIjD9SmIDVEDHud9rC1BlY?=
 =?us-ascii?Q?+8718u5mj63naXokSEP9YX+0B47POddoNV55AIHbZUE+Rq6KL6fFTkK89Urm?=
 =?us-ascii?Q?8JKKcdQieJPmOtiFjWXqfs2IuUFrSh7ZqvgHdl10u1VI0b6qmXcR8lOfxZeF?=
 =?us-ascii?Q?S73xSBpAxmY3hfmXfsfliDMk3IBX5d1lO+ABE6b2us3doA2KEmulSAivjmy/?=
 =?us-ascii?Q?s57nNLn9XYM+T/Fuv8XoNUA4MaLXXRrPu0b/9vAWobfDsp7yMS3bVu9BBkWP?=
 =?us-ascii?Q?HMcsb2qrKo+KopfTVQV334t880VavT4rZPv8XDYkDIXUsKsPfoXOpQXnGQxX?=
 =?us-ascii?Q?+chZd+khCYXCL3h46+Fu0cwRVwVZXklK86C11eBD96qhMURreTswIbFKU7hH?=
 =?us-ascii?Q?jRR83GcEvd6GK5BICxqVSUNOn/uPKVCnJtlxTD5apYEvQxw8SJKSafdtKKTi?=
 =?us-ascii?Q?dou08/VSuFON7yAyCaxKnTvhWT8JnIyE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FLFyzp1YJE5+ThfESwondl+QxGNvbn3OHST6oww+VkpdtckiJ5z+5Idv4LCO?=
 =?us-ascii?Q?leipbCYSnovwd7nFdjgoh4SlbVkvjyFRnMYgO4EO/RI8rReUSrLyjXx7CVnH?=
 =?us-ascii?Q?nzrEZeB7pV8+s6LcbT5ya9ORbCAUDzV9CuN0JStDPklxxDPabueEwDaXWAKD?=
 =?us-ascii?Q?NjC0uWNrzTN5AoxhLooiZVTw2P3KhRIfoshvtj0PtxGc+bwjVsAFyT1OhCu5?=
 =?us-ascii?Q?N5K6Xto2qNo774I+KAdToWiWPQWFsqd3ZakDx897IHuWXeDUNicI5SYczoN0?=
 =?us-ascii?Q?xBhbw1wP0wcZ1+t9CEnGmnmZoANZUwPi/Xc2P2Kpp54cyuBqxu8O3v0sQ1UW?=
 =?us-ascii?Q?5vEqjkc5RnEFgAY6/O+j3vxI5SKu4wCfMPKT+FHQk9Ji3Umo5MlXm5i/Ayyn?=
 =?us-ascii?Q?ShRrz5HJTBrUJUFXFig/v16EnE4xj6wN1o4h5/nN2v66M1hTFGuVQVZLfGgb?=
 =?us-ascii?Q?85vsd56CBw7WV9m0BjEPG2WyNmyfEt+b7+WDjQUYOdPBpc6ViOwPvY+o/roo?=
 =?us-ascii?Q?dI28EZ1enHUg/LR+4ezK6y5uAJ8+ETnddhKvqc58XZ8MtLXFjMig5FtTQRT3?=
 =?us-ascii?Q?sEJe+tOc1NNX91usUgcddJ1qEzsx79663u950zIBpO/teGI0oFsSk8R55B3R?=
 =?us-ascii?Q?yK3jRDaEI4GRHDF+0tkVxmoUAlPUwBtz+wTDAQyqj30rhKaWVxcvzlZxc2uS?=
 =?us-ascii?Q?7yCWGZo5KxoPU5fNHFF/qWAhiHHZaKmINXQfYySobzw8ZJfettWm2yTK9yo4?=
 =?us-ascii?Q?aQzLSVAy6EuPHePcxjPGJiHeIEWHAKkZg3iQpxeSO4lPmVPnh7nwZGMfy0h8?=
 =?us-ascii?Q?dGZsw8W5SvYAumBBM1fLu4ROU0RJRhQPsIoZzD4xKWumRr/2XVHi39Dm6ILK?=
 =?us-ascii?Q?88lFOsfhE1pglxBLjq//f7CUHI1aMdxxkejvXug2I9A3Vu9xqg2dIgtRkBPS?=
 =?us-ascii?Q?hi3YDbXiCc0QOOs6069eUISMT3wJya3mLaTUiGXKSw5PKeAc77I91hqR8b5L?=
 =?us-ascii?Q?OVyaxqUsUq+peyjLfdTaaB7hpwIpbX4pZdVOLcjuEJBk44C6wS7VbYatnUik?=
 =?us-ascii?Q?gZ5hikGZpohK79bjl5m2UheiYOKayGF378MaIaaBPKb9ajvf1wUM9phixg41?=
 =?us-ascii?Q?pM4quIM8cq4TN3ptbciirzIQBxd0GUg8F5wRZI+a57NB7sVJQ+4jTlv4fk2u?=
 =?us-ascii?Q?0iKtbo/AVHMGDNDtd8WZdfJfEDr6GbWlDnjoJfMZrWuzPZvrmKnaioq2awjM?=
 =?us-ascii?Q?0w6DW14lfRIcdDPS8itX43Ui+RCdF4Pk3GC/Uabw+J0yEdgtUIn+vc3qIkQR?=
 =?us-ascii?Q?To7RKhqkigy/qpD4FBTF27HfvVb78dkWMBDjMRdlZyaoHWGWogCfwmMobVMn?=
 =?us-ascii?Q?HE10+O1HCww7a/ZTPBd4oAT7YhXZcZ3R0jyDnx9QbAbdws/CG/yn6NHeX9A0?=
 =?us-ascii?Q?tp6cPn6VwwfY7ywRCSZvyJ/Q17eSx9argeMYVj9ommLsgNlQK1f8OB7gNQNw?=
 =?us-ascii?Q?XV0gNf1bH4A29E1nPDR/ADH257VM3+vC2WI5krEHAFmrweTSotSGfq3WBenI?=
 =?us-ascii?Q?VjC7rLDwlAgMgx3GVR3VREiujx43qO8/aAekxg9wQis25LUBKpCvmEk3fsrl?=
 =?us-ascii?Q?sw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f3615b17-2c27-4f0c-f91a-08dd5cc1a5d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 15:14:53.6490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wiasxdtl0LZBiqSDPEOfOtjkzcQb1V6ZS9VAX43otCJyHKfMRVUamYVfvEgMy2+yj1W+hwKVynCWio/r4muIe+iiDUBM6BC5DKU/8At8GuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10229

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 February 2025 11:41
> Subject: RE: [PATCH v2 0/2] Add support for RZ/G3E WDT
>=20
> Hi all,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 26 January 2025 13:26
> > Subject: [PATCH v2 0/2] Add support for RZ/G3E WDT
> >
> > The RZ/G3E WDT IP is similar to RZ/V2H WDT. WDT0 can be used for CM33
> > cold reset, system reset and asserting WDTUDFCM pin where as WDT1 can
> > be used for CA55 cold reset, system reset and asserting WDTUDFCA pin. O=
ther 2 watchdogs can be used
> for system reset. So define WDT{1..3} in SoC dtsi.
> >
> > v1->v2:
> >  * Dropped patch#2, #4 and #5 as it is queued for renesas_clk and
> >    renesas_devel.
> >  * Collected tags for patch#1.
> >  * Updated commit header and description for patch#2.
> >  * Replaced ARCH_R9A09G047->ARCH_RENESAS as both RZ/V2H and RZ/G3E belo=
ngs
> >    to ARCH_RENESAS family.
> >
> > Biju Das (2):
> >   dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
> >   watchdog: Enable RZV2HWDT driver depend on ARCH_RENESAS
> >
> >  .../devicetree/bindings/watchdog/renesas,wdt.yaml          | 4 ++++
> >  drivers/watchdog/Kconfig                                   | 7 ++++---
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> >
>=20

Gentle ping. Are we happy with this patches?

Cheers,
Biju

