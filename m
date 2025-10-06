Return-Path: <linux-watchdog+bounces-4318-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069EBBD017
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 05:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 109983B6D16
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 03:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55F078F3E;
	Mon,  6 Oct 2025 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t+fLBcrT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE61B661;
	Mon,  6 Oct 2025 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759720656; cv=fail; b=NRwwFXo9EJtCQZW4z/jHX4K8vNKohjgC/ZXDpYK35e4G9cEDEpLNCSbeHTV5l+hHIQdlRxo24I/r9HivCCqbduZk0UrNnROWdb3ySaqtPK/wtXYbaJgHxjB6hqxOC1TJ67BlCEYfiC/NTZlgWYDxMAWlGV2pr/SyhgJ/qkR4xxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759720656; c=relaxed/simple;
	bh=MzHYFwCBdDJrrvWNUO04NQplMmd/ALLFFV9ALNC0xnY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fjIkFkfyUxIOQXIRN/CF62LQSczwB0jVK3w0Qos++leze+Eton4B4jLv0hJ2JIAZKojsR1CKhrXgaK9lR+hgd55thqZvvuGK7M/DYweN4FgkB4JDSWAI4iUqcsouMkNAXjaUNojLXY0Cl5mMhbGoI/N6Yd527I+Op8iEKvGCwXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t+fLBcrT; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTqdxdJjn1dJTTxq4gcM0G5/+3d2RzVMLeqNK3TFhGlHO0RnTlp2uP55PVSGRgeKKx/ls+mLPDgoB24bO2rIVIySHNgra9iheCd5gBHg9+Ee99B0BpRRrvpEda7oyLb6YE5pxQ6c4r7AGm6FVuZRvUyPqrLBl4ihtWsYcOdKYVqT5yxy8UyDx+qvMmGDj/S/iA/Huc9vpXz6tnaRO3dW5B8ds72iY6E/R0TcEqf9U48f5zLUppK4MpiKPzSsjjrL0oO3ocqU/bpvWLj9TaWKnYmFT/9evui4gbz9fOfc4E/Rd6Xq+h2/DFCP3d0n9DBrVkEO2APN2RsMaLlx4bgMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCy7Chv1BrTLQIGNpllHR5aOmWiey7ujvC7xmqaWwwk=;
 b=SuJ2QPgfzIPUHTJhTFtQseTIT2kEms3R40h2R8hU+PaST3hk8Us0n3fRDpUoiBbMJ4rBOd9xmHHyzLNBaNMg7OyaVTV7dxmgTuw/8W0g4qXVYmVzXwYoQEIoUl9Zh9Y5rPFjwcTn21W/9oLP3l7HATCaM3FbVXFZA9ZfdUK2vHQQkXYkFrAxScwaeRDY5LnKOgR40kwK0RwidtIyJ+1IfS7+H55VdDEY39IWrkq1Q++TF4rtwhJ9TW6nhyRWHbo2+5AmmGXVLL30YpkJDAQhLhwoyEFCbLtgvRjGxQ40pmKrH5yVBRviCa7WmRuEUaDTVoYPjWuF2wzZ2134WMyL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCy7Chv1BrTLQIGNpllHR5aOmWiey7ujvC7xmqaWwwk=;
 b=t+fLBcrT1RXaXKrY3bgJ1mLF/8MV/PprXHgK7gziXuD+4zDeBrd5t5w7gGstJhok16bb0hG1Iq5e5j99TuSXDM4KzejQ3GDjhcNxyu4CWF07EcWE03ADosdHmr7WOIiuBQAXXmdHczVU4TdrFwkzIHD5hOq0Gs7iQKK1G3VJPrQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12384.jpnprd01.prod.outlook.com (2603:1096:405:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 6 Oct
 2025 03:17:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Mon, 6 Oct 2025
 03:17:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Prabhakar Mahadev Lad
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
Thread-Index: AQHcNgagQ5/85CLbrUmtG4qDdk4zRbSzt7/wgAAD1ACAALcMwA==
Date: Mon, 6 Oct 2025 03:17:26 +0000
Message-ID:
 <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro>
In-Reply-To: <aOKajKzRlrQD7plt@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12384:EE_
x-ms-office365-filtering-correlation-id: 7c4b663e-af73-469c-0e8f-08de0486dfe5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gwtQq1ghVBzG2C2R8ikAuCadsD+qNlmOOKOIhhjPjTUj9W45+i6RD6E1dO+D?=
 =?us-ascii?Q?SZPnuuegC63MhbiOkYODEWnOzRYlKLkNvUCciblt36QLELKeuTB+b1jhEC5K?=
 =?us-ascii?Q?02vmeMdtb1/vsz12eFo4+TvE+TyAkEu+vVaBMjnyH5UUpkWy8WgMzVzbUH8Z?=
 =?us-ascii?Q?8srr5O9K0OYF+tEA0maI+luta+xc32sF7Bz/oLeegLuVy/gA8voftXU+awsv?=
 =?us-ascii?Q?ewj5DNd8WixVHSSIhI12Ax4+5CCT72IqZhVvX/gjyNWbARohWuulLXmrgoJ1?=
 =?us-ascii?Q?dFzpvdDl3r39ym+TIF6c76CgW8hAZUoOMnXyjw7SgW90VK2KpW4GEiSl04C4?=
 =?us-ascii?Q?rlMgjsmF025l9aOiZz5DphQIic0MV1jdj2d00Qe1tb8qWwco8LhDnEZF3i4Y?=
 =?us-ascii?Q?UOtrJpcL0OvQyHe10aTi2pwOskbyaW/s2lpQlVnY/K7kya1ZNcDxu9k/Mytz?=
 =?us-ascii?Q?Xqs0rr7bXNv/FWkqLDghYELmKSg9AgoiIivMKIUSGi26EGkYx9YQMiubNbxi?=
 =?us-ascii?Q?511mJ+QWsV4lJjll0rgMLHElXj1pbMqU0pnBLVuUecVF0zJYatOPb+p6uzX3?=
 =?us-ascii?Q?QDJBzyFMDpfVjdZN96ilwF6C7DFhf3ZXAOB1R01OD2t6PyKQOwTswPJhBKgA?=
 =?us-ascii?Q?6hLRsMSicBDC75Dp9Ftl4wmvwvzMNz0I1bD9oTWfmkdHe00ZnB84T+ZIeV0V?=
 =?us-ascii?Q?Kc5v5DjFA7EwjDBuSUP2UL0rGlhQmYYCZsIP/OBKySuWv88JDfbDItgQ9W9W?=
 =?us-ascii?Q?ylFg8L2PXwcWvm1UFkh1LMCYhgvTWwZC6jmylHCSOJHPX7yjLVeMRY+hOvE+?=
 =?us-ascii?Q?7Oi+ucjFMq5CA47W20R2pYpiHepSkLtZ4y8aDEIUr6tAREEOI5jxj9Kbo6DR?=
 =?us-ascii?Q?l2lhK5AGOJlHkS6/91oWogKNJce0l4/z5NKrqdSHtfNlyQaSXc6+LzMMERi2?=
 =?us-ascii?Q?GxDyRPzoS0wU8IrSrde3Jk0RyQ0hLXBaGSMo707p+QvGJ6Jwk/ZQIeLXkim/?=
 =?us-ascii?Q?JpDknn4jzL4o48sx6rsPQ8I04dKhHl1B7/5/rCNS0nShepjCP1JyTf2S1lo2?=
 =?us-ascii?Q?wEPxBID/c1gDfjDZsAeCnlacPdItmJf1rGcYrUY5sa8zShcE6JYCnoHHuGcS?=
 =?us-ascii?Q?4SRquRh14B47cA/3k23m0+ApnRGt8Y0Q9UeGhzUhIHe/cPhyHM0in7+dr/vQ?=
 =?us-ascii?Q?NKv5Rl+r1DsuYfeYxSJbbl0G5bbiHI1CyqvFzy1FSfjFxSrhzXCuQ/EcrwEd?=
 =?us-ascii?Q?XNasqKVyt9B7hxWR/Hx0XYQNMr4zJaLCyoHV3zNPfzutdD9A+ryEpTATiZd8?=
 =?us-ascii?Q?RACVoK2Px+hydTku4Mgjs/yV0ftmjX28XBBGSsLcnLZTANnLbpnTQoK2zt0M?=
 =?us-ascii?Q?VItpFiSh44W/EYFGs1xrZtJnPHWFS5uO5GZakk8LX6Z39Nso1ZNLT7u96Tra?=
 =?us-ascii?Q?QF/gYZKx0T5JoVHpT042p4R8TP1GoJe+oaQW6h2qXnDiYZGOHc69MemJG7kG?=
 =?us-ascii?Q?F6oV4hwmsFc8MNQZ1KbXMujWhAsKQft4kMlQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?k7vnOSUAdBJGn7ek8R8gypOoGtkucLz6XhIX13Teo7P/QEwAbHlZg3SAaRkk?=
 =?us-ascii?Q?CZNWMkfQUvTY7JTQSqJz1B8e0zG9X1N9PgNCMedam9GTsVC9+Bo25iI3++3J?=
 =?us-ascii?Q?qCb3G8INaCbctZp4ZMOkR7lFFyKa2oQ5syS+2lvE1Zadra7CcBdgtnrSYr1N?=
 =?us-ascii?Q?tbmfERw27/ai4V8YPNtoNuTEpGnttPbwYN5s9HQoYnTlm2LwJ+RiXMU2Ix1N?=
 =?us-ascii?Q?Kqiyjlsrv49KjLae33ppqGg+OcYvIcUIevQhm9mgaBUiK4H4dn3sdvmdUZSU?=
 =?us-ascii?Q?mT+o9FI4PAS05cNR80PdHl3gVxvFpABlnX0vbZKqiiYA9NyEeYvD0J1VxuO8?=
 =?us-ascii?Q?4nYHjNoklwh6CXhma/1uNtS759blo9fAt15300BKCKPVjtH5nUc1VzObHSiM?=
 =?us-ascii?Q?Y3LoCVmevQ1gT6A0xfXNeb68KUyl04XxUeUvzNWE/LjNFBHEKTZweUr9plYu?=
 =?us-ascii?Q?0rB96YoqB/czJ/AnILbRuLX22oaJGruZTtPTKATdsTBg28UnHjfY2DonbuM9?=
 =?us-ascii?Q?CgoC7aSfXMx1u6xhcV7LAOQ0hn5C009U6jMgdGDLO3+XixjI594QNoTaSRB3?=
 =?us-ascii?Q?PptHfJ4HuD2Q9SoDWWgEJXTK22caQxwgYdpHn++bM5rs6j8hxRwEgTkgra2X?=
 =?us-ascii?Q?iQOGWJ/+AO8O8MVSbm1PJlY+kwLfyoJ47zSxhKbkjl+c+PhPo//7FRPzPSTp?=
 =?us-ascii?Q?gEl6f0cC8sKKHh/EHAi4GgtXEyzdq3w66tJiEQYbtGPuHfj/ck4ipAUqk6Fd?=
 =?us-ascii?Q?d1xLWUFSBXoiQNhlm9LAtvC6lTpFREvtUEhUwAn99awBp8UPY+F9JQGwxE1x?=
 =?us-ascii?Q?2bi4hBhL0O0yQTXSne2wa80sIsoOh/+SFjWNubOV3fk01I6t3BVRfEyasLwX?=
 =?us-ascii?Q?QGvs5krNavqYGhBQyu4K9zp8wbsX9bN+heM/84q6ReK+GnXu2w+xq8y7/mne?=
 =?us-ascii?Q?TkvDMKsAgReLySjsDv3mAWD9RCD3u4TKx4WRqY7DJDkLd0v1UUTVilbPkiWS?=
 =?us-ascii?Q?LGN02yMNkmjIdgpEIQBy9wZ6RJVx1GKavbsFTXFUgbnIX6hHfpwCVz+gsRX3?=
 =?us-ascii?Q?LaBFmeRqtSwMSkMLjGlNfvsQ5+EI3MtC55kSTskqWGT0GVUiODIXcPHmVRR7?=
 =?us-ascii?Q?gUScgwnxz4P7HhoSbq+eLLhxNd77uAwhhTlrhoc05nAyi9arAhRh2hWJ3mn6?=
 =?us-ascii?Q?+v4QPJKHrxA5wf1hol5a84FfWE004GTCkbBOkfRNKdI9fWww5cq64kEhlHO0?=
 =?us-ascii?Q?7LXDcepKks71k16imD0fQK/L24b18UBUtDbjcHwa132nupSZB4N4oCAXh9rS?=
 =?us-ascii?Q?J8a0T5XomHCIa8M3BiPzFeTDDgPUb7TlqOQs/iGPwL+reMtQRpvWlLPLzfBu?=
 =?us-ascii?Q?8sb+5zhQf76t8kyNu3RG1FX6L2Nlqi89/WpAn6QYB6UJWO4MLjf28rH6K6Dl?=
 =?us-ascii?Q?124PwTfYxPaUIPq2HA/mZEgA/qiH7fx/3ITmQ0MAqROqkvXGnA2rBKbLZQHs?=
 =?us-ascii?Q?9OhwlKamkjGRMGgV8YQ2O+41a7cVOT34vBARh+1svB4XPrlQ1Nq752RXDO1I?=
 =?us-ascii?Q?QfvYY89vt3wcNENdEDUF/Nub4++RAVkLjPSzyYBm?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4b663e-af73-469c-0e8f-08de0486dfe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 03:17:26.1253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzUBg5/Z7ZdXAwueylprfrS9zePWghFjXbaSJSyW6dXSfOK4NE0Od9gbfiulJRC8P7nK0OuJi5uy6uGlJHggbZgWxvjRX7dgp68ClsxIHDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12384

Hi Wolfram,

Thanks for feedback.

> -----Original Message-----
> From: wsa+renesas <wsa+renesas@sang-engineering.com>
> Sent: 05 October 2025 17:19
> Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) w=
atchdog
>=20
> Hi Biju,
>=20
> > > +      - enum:
> > > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > > +
> > > +      - items:
> > > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > > +          - const: renesas,r9a09g077-wdt # RZ/T2H

I guess a comment like # fallback RZ/T2H here will avoid confusion.

> >
> > Looks there is duplication of entries for RZ/T2H?
>=20
> The first one is plain T2H, the second one N2H with a fallback to T2H.
> This is how I read it, at least, and how it already was in the original b=
inding description.

I agree.

Cheers,
Biju

