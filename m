Return-Path: <linux-watchdog+bounces-4856-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGQVF22ce2nOGAIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4856-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 18:44:13 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574AB327F
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 18:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2980E301990C
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 17:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B163542E9;
	Thu, 29 Jan 2026 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KQbA1xMO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F102238C1F;
	Thu, 29 Jan 2026 17:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708491; cv=fail; b=NEpZAIydaz6Ni8BNvKwWzpHMQdKOAFXsQd/JwVDCxScG1lgzsYiDE6OaC0twK6BUzvcCEzZFdv81f1zP2pc9oRS2jj9ZnzbIiw9s8gu/5tHIgYEShGijCio+5eU0ymJV+WDrxcPh6XrcVAHVtyiVPEvLomR5RxURdoyw822uQMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708491; c=relaxed/simple;
	bh=w0H4gEd6MH5mqvFXMHJiTKUdQNREBBhaKYzS9nofPM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vbut0xOkAIC/6TqollqivgYhVOLMFdNyn1HG1Rmf4QYdyZ9z8ZRm8eWlGp2PDsnjMxOIg++k01RnUMaexcio5z2gDdBcVAJQLBawq6zbjIXVXaNvHGDonHrC53VUntefd3T3DmtOWxLBMd5+Is0NeNhOVglSrtmwXz/zJPax8q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KQbA1xMO; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlBtn0YMnyXhegM03bncKo9LiBXTxOyDN/P0dIpLKp7XhTjc19Pmf4t4vmNJUNU9vEe1PTWJyCsC12nRt80Zijrk79FEdMN1q3qDTiBlI6U0M3DIYwVieIV5CpCvT8MdU/37UKYi8NmQAml7OJPw9fL7Fsr2WRx6mtw73OidWLV5T72cwjsEw6nksBOh2Ba3i+unEhacGDW5Vq3y5y1fu57r4DTeQ17NaylsWHuzxJVOC0DllKrWfdgPLCfrfeBlrq8kY/sVU5MuOnDvbjNSBoBMhgZ9AIp9Gng3FkRyuuVvT55ZaVWTvQNf/k95ojNFb17KtfInFhi3ZbFf35CDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeraS0THDeE0oxiRIQeIexbjPRdbUB1ErauoGPnZ2/s=;
 b=C2jPybQpZEbxByoLHqvS1Fp0F5PLJi+9cCnlFqDfjbrovQ9ahfxPPUOsRWqYU8H25E1QQGaL9Mcuy5yRpm7O8b6Nme4Dtxp+Jg/kmWQDC64BI23uEiAltfg3k2xEJvoYmzo4GD6sR9IFZKozzPIbPzlSN70ABjVCemd90hFZlk7DmWg8N3spyOmyrBN4RNmrjd2chYgoGvJtBNNS+DpHSDiOZ+JmnYYu8NutmHsmtGdztHepbIBLSaguH8uuruzkZHAxoHNRkCJBieAVwfWGr4kVqtte9nIKpeKDzBDA5i3cVDzkSHFpce1iTwcmHRhfQXKjA9Fk3IZjA2kLo2CZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeraS0THDeE0oxiRIQeIexbjPRdbUB1ErauoGPnZ2/s=;
 b=KQbA1xMOJIdj4M4b8MrYfNEeCR3nqbFhbfpMaMjDcvXMItw2T0KnksSW2HrG2d6oAB2mPxOz8DsPx2c+wR98FAu5vrXD0IkbeNNoYroV6rapWrDA4pID892vYoOEpp1dksNjj8qMoUCroQHOznxmr+xaXxFl1YQEsQ99rKjXvXA=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS7PR01MB17352.jpnprd01.prod.outlook.com (2603:1096:604:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 17:41:24 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 17:41:24 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH mainline-linux 1/3] dt-bindings: watchdog:
 renesas,r9a09g057-wdt: Rework example
Thread-Topic: [PATCH mainline-linux 1/3] dt-bindings: watchdog:
 renesas,r9a09g057-wdt: Rework example
Thread-Index: AQHckSixhybCfKhmjkiQZdP5ZFOH47VpahKAgAAAQhA=
Date: Thu, 29 Jan 2026 17:41:24 +0000
Message-ID:
 <TYCPR01MB12093454F70F32ACC87A7A4D3C29EA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260129140731.12633-1-fabrizio.castro.jz@renesas.com>
 <20260129140731.12633-2-fabrizio.castro.jz@renesas.com>
 <20260129-stapling-nemesis-66ba56d68967@spud>
In-Reply-To: <20260129-stapling-nemesis-66ba56d68967@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS7PR01MB17352:EE_
x-ms-office365-filtering-correlation-id: e1d3b850-6b19-480e-6504-08de5f5d9f6d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AdydWqRigSaRACVzgs5NaMk+Dwa9xG/m6QXIT957abgpuUZX++JS7HMHVAC/?=
 =?us-ascii?Q?N8oBhQw0IC2JC+iMocmVnZwJcrb1uWXAnRPbM3s1F0eZILEBb1Ri/pYo1oUv?=
 =?us-ascii?Q?nMhLXEm3BZWkBKXjNiVOm0Vt4UzJPy9FPsu3f1mCOZ7uDoBJkjRQzd7s7jI4?=
 =?us-ascii?Q?vWbLj9WT2qZZf7lCAUEnn9qP8l0JPPPtjY1DySrjpYoXJl0AonJt7suzkMKZ?=
 =?us-ascii?Q?P8f0TQgxpPtVFM5vv5SbC47ciOakRoFc5PB+Fb5VH9qmBd2p6xqbOP/05vXt?=
 =?us-ascii?Q?6JoFXjAEKbbtW5nDI8l1z5j8jtZ8Pc3TKSqNNKoBAsFEWHzvisZLqVJa/LiF?=
 =?us-ascii?Q?vmIBXzIb1cVNliHBeJ1dbvGYOiXJzs8YY2cobZ4l10dBoR//RbHNt6HYcdTQ?=
 =?us-ascii?Q?OFQhDuTdwngbbVlrD3g1qX86jCVONjQRYY3fEOzUVZnMnFlHwTvALaKZY5bg?=
 =?us-ascii?Q?A2WtYAtfqvaz66mycGN1XPNOz2VRCKM2J6sWmsWyJjQOR33FXirgB2ZFw+VN?=
 =?us-ascii?Q?xqyhVcQV+VbAE/QOxHjQybye1wZ9KA0TV/zqLhN02NflJMdKOIRZ+8q7Jwz/?=
 =?us-ascii?Q?xbeDnUeVCMUU/wtkpPraAmt88Yg/pYZntP0budLDjG+Nm1hSP40gQiiMBrN7?=
 =?us-ascii?Q?ct/0ZF59rEh+t86DKMJVRFOKqtQSMtFApOq+cgvKlDXPRiTK+0WI9iTdOviu?=
 =?us-ascii?Q?P7Ojqi12ibpiEmaa5dPmh0nhyoUw8ZlxVfgTZg5UDVzlFhxry2xKqYjV2f8l?=
 =?us-ascii?Q?efJYBCaEYekAkLNoPsmg8OvbDPmvw93EYTNJaJjZOrAWN2lMCRc/dWwJJKPO?=
 =?us-ascii?Q?XRK/mkKnJmGKl7cVz+I8bt+GvnshmVmLSks7tDXvDZxAAYfubwcIK2oZt+Ja?=
 =?us-ascii?Q?DOpNCBwpNb6or1PkPCJb3P4+R9XtnI9Bd67IcykRo84LmuDf+2/vb2OsFabJ?=
 =?us-ascii?Q?sj7XERYNuRK8p76xHoSCgPRHo6oPFHU8dFZpmFesJomIAe+F07LVJ7r6eqE0?=
 =?us-ascii?Q?q2aW0XKiOBmjyeY7yG8ajV8TabXpISyvYCcyF69lU2YNhKnyGTVFsbSf2bab?=
 =?us-ascii?Q?gaJ7bW/3+udw6/R8BMw6uKwXaeMpozAswCnYGaf1+PESz0GF3eTNhlTLz0/V?=
 =?us-ascii?Q?6B/+kmoBeXhCWy8Om/zYSxD1ud7m08w8C2kqAyPA5wqLk4ijTXmYkawttFVo?=
 =?us-ascii?Q?ZO1aw4SStOzmN2aFidIa23WzkRxwZC/hqB+iQqT/58L86yZqDKiHM34dFI+e?=
 =?us-ascii?Q?MCMP0uh/1dqwmgfroD9GN0SeuzDdfMrwdBS7JctU7gjGm/h84qCJ2slbwJha?=
 =?us-ascii?Q?/h9o1ZhPLA0VzK1mGVvgFOwmJgaVBYy/y2dvsvizdPkHL89zEjLBcbc3SLnt?=
 =?us-ascii?Q?ljC8y4fV/tA3gD1TBJPO5O4zsyEtX1ZZlhoXDZM92lbXLS8QMQ/RKjArJRdN?=
 =?us-ascii?Q?rSUS5i6tEFyypWBN/kR6VaLeCKeTty4o0U/tUMCVSxaF5nZREAvkRaZEqVna?=
 =?us-ascii?Q?gRnV1MAf5zvkQBxp3KfRi/O39Ctth0PkzWm0bOhZ8qJ2VRsAROyXZ6qpeZ1d?=
 =?us-ascii?Q?muRN/Z+rdCioT0LptQKiAKJy4VnLvwDWLDfnrFhpEX5yKptvGwxOh7/ophiD?=
 =?us-ascii?Q?MR8hxQ9PWC5YaEtG4pgTZ3Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?flUQ/sBCM4nzHlft0yg50jO9UXyOg6+/S4vqNPZyss1tiIzNvoWSbUKAKIkD?=
 =?us-ascii?Q?wOXc0CLDNBFfM+1B4qHtlnKAC1U8JTaDmUgDkCmMwng8RlYwUiKsmkS46kw9?=
 =?us-ascii?Q?3kbr6sHz9DhL1f7wV2eNAKS4qGAbt3JdYgOa3d04uLvlECqaqe3H1+MdZ/xd?=
 =?us-ascii?Q?N8MpOgmZ/pyfnm7zylVRh7zdZVEoro9ooj1+ej6yMPi8EzHRCoHAfBPJsD6l?=
 =?us-ascii?Q?03foIBt3gKmfSNVsvXC7i60euX0NIdDf8pi0Ge/Sv0LvaJH4IAa13zhsEgii?=
 =?us-ascii?Q?lSKD58bqc3J8VPaqtwaoMuw99VFKt498yfZ4Q9aQkYtd0UCey5o7PLEVCxbg?=
 =?us-ascii?Q?OEfFmjEvEEwqoxzojvbx4LJXbO4yepeDVbWQUIhOlsusqwsb//UnLP1mt1at?=
 =?us-ascii?Q?/HG3RRbhW5cMH5W36ROZa/qhtbPXg0go9d+m3szJDzVQoVdsgVz+6FfVWSlE?=
 =?us-ascii?Q?5krgCO7va0FBpbOyd8O5r7g8o0Tm/ixbpnixB42pYnVoi2of7XbqXAYa8LFQ?=
 =?us-ascii?Q?h6fBWALCM74S6pZirqAAFE+4iH78zNygU1rOlNaC/fWsAWEyoddQE9em01Z6?=
 =?us-ascii?Q?cc/8Jn+Z4/qojD3MhCY+dopu6p30OmCsyrP1emLDNe4iazqCJI3Gzi64pZjJ?=
 =?us-ascii?Q?JLGDZdouO+GeMC9wZQoPtzFKGwCmVJZ/4m+loD51zxZLDYJkdGL/aY80RZnC?=
 =?us-ascii?Q?kurE+kt6zydRKJ5jbkR35KgHzd1rEvBl+Xh+C6iTjpHEdYtr/O5qrFPr0sJJ?=
 =?us-ascii?Q?kxLTrxGO6YyV3YXzb0mb45D9ZTAQEcwnTjjSAt5842Z/sMtKce/lzwUHrO8n?=
 =?us-ascii?Q?t4DvhXQMrlouno5td1F7hK+BT4fiCeuc4RLsLAQwQ85f1ipA38jt+qJ8ZGrt?=
 =?us-ascii?Q?iIeHj2sn9Qu6lkmziEcS8DGim6pitYr+TsQvi5o/e5Q7w+3NkNSnr21MvKho?=
 =?us-ascii?Q?1uNxiygBhQtfI96rxCb7W3cNorjnvK4Onq+kbRcW1AXFgCsKvJ2RieMG2T6R?=
 =?us-ascii?Q?Zn6yoHVRcoisT3uk8Q22TYPWqFztdf8RLGy8EdaUf5+JLBhdUbEx83ch6AqG?=
 =?us-ascii?Q?HPDG2e6cUYleinWTTANcMPEhcKbQ/UcUEOFkADZzYgjQcFoJ5MhrVWjv3H7i?=
 =?us-ascii?Q?HyXq1+MScFqZ5mwUJ/GwE7aZszoKu/8GqDLr3XWLKuYQoFgzKqG11W9QFvE/?=
 =?us-ascii?Q?Nhp2OhQJ26a1VSKYCbaI6sCJP/fGKCqqTa0nwZolmIKh1K2xiBAI0cv3HoAl?=
 =?us-ascii?Q?x9mYkXcQTccBd3TZOIzPUNFhvrI31hcZw28KmSiSB2/CUu7Qsr3lDibKlO5/?=
 =?us-ascii?Q?IczrkoNsa3RMbK/WM2ZqtYIP1HZTvN3P5do/RiGSTRsyQGwdhFVOLwOdAajS?=
 =?us-ascii?Q?oJeURjftm7X8TuQn0K3LJV01dNJVNPIpEIaqPlCumZ8aef9xhnVKAXh2uDs4?=
 =?us-ascii?Q?iEzFKru2Vr/q8u3e/prfA3fveMKx6+oB8fC+yAabF+K07viUYVvr0fnJ9rdr?=
 =?us-ascii?Q?hY4TInILWaywNhf11LJpXHHjNRpISzLvJuO+Oky4ZglU02gBevUjwpUvxBpP?=
 =?us-ascii?Q?5dNKyzdgxmzKM41ktYD6gi4kh9yxgvjY/bP5Skyw71OfRsG6EWNlWbjI4ZI8?=
 =?us-ascii?Q?GauzOLmn2wX5/o+6NqIa21ZbwUK09EoG9gu7U3qTJ2AAg+L++O1Sx2sb5wbt?=
 =?us-ascii?Q?/Jei0bW3heWGvyeRYfl+tzrN9UJlOfNrIHx7trzZhrryyxK8v5cakqdhC5ka?=
 =?us-ascii?Q?zEe8oFr5MzLbr1frd4Y2cFMW3MEpKF4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d3b850-6b19-480e-6504-08de5f5d9f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 17:41:24.3998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIZsjZb0988v++uU2NaDDE6jK6JlzAG3snma7zM/vqCtBicL9eNVPf/K1P28EKrbp/wN3FYzanCr6xVcwfI67U2Frc3mdKSazC4C8KQvSOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17352
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4856-lists,linux-watchdog=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,11c00400:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,0.219.186.0:email,sang-engineering.com:email,renesas.com:email,renesas.com:dkim]
X-Rspamd-Queue-Id: 0574AB327F
X-Rspamd-Action: no action

Hi Conor,

Thanks for your feedback.

> From: Conor Dooley <conor@kernel.org>
> Sent: 29 January 2026 17:39
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: Rob Herring <robh@kernel.org>; Guenter Roeck <linux@roeck-us.net>; Mi=
chael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Wim Van Sebro=
eck <wim@linux-watchdog.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Geert Uytterhoeven <geert+renes=
as@glider.be>; Conor Dooley
> <conor+dt@kernel.org>; magnus.damm <magnus.damm@gmail.com>; Prabhakar Mah=
adev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-watchdog@vger.kernel.org; linux-kernel@vger=
.kernel.org; linux-renesas-
> soc@vger.kernel.org; devicetree@vger.kernel.org; wsa+renesas <wsa+renesas=
@sang-engineering.com>; linux-
> clk@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: [PATCH mainline-linux 1/3] dt-bindings: watchdog: renesas,r9=
a09g057-wdt: Rework example
>=20
> On Thu, Jan 29, 2026 at 02:07:29PM +0000, Fabrizio Castro wrote:
> > When the bindings for the Renesas RZ/V2H(P) SoC were factored
> > out IP WDT0 was selected for the example, however the HW user
> > manual states that only IP WDT1 can be used by Linux.
> >
> > This commit is part of a series that removes WDT{0,2,3} support
> > from the kernel, therefore the example from the bindings has
> > lost its meaning.
> >
> > Update the example accordingly.
> >
> > Fixes: fcba2855251f ("dt-bindings: watchdog: factor out RZ/V2H(P) watch=
dog")
>=20
> Given this is an example, I don't think a fixes tag is appropriate here.

I'll take this out in v2.

Cheers,
Fab

>=20
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > ---
> >  .../bindings/watchdog/renesas,r9a09g057-wdt.yaml          | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g0=
57-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> > index 099200c4f136..975c5aa4d747 100644
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > @@ -89,11 +89,11 @@ examples:
> >    - |
> >      #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> >
> > -    watchdog@11c00400 {
> > +    watchdog@14400000 {
> >              compatible =3D "renesas,r9a09g057-wdt";
> > -            reg =3D <0x11c00400 0x400>;
> > -            clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
> > +            reg =3D <0x14400000 0x400>;
> > +            clocks =3D <&cpg CPG_MOD 0x4d>, <&cpg CPG_MOD 0x4e>;
> >              clock-names =3D "pclk", "oscclk";
> > -            resets =3D <&cpg 0x75>;
> > +            resets =3D <&cpg 0x76>;
> >              power-domains =3D <&cpg>;
> >      };
> > --
> > 2.34.1
> >

