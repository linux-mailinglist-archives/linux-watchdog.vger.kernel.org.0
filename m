Return-Path: <linux-watchdog+bounces-1330-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A3929EED
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2024 11:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B30991F20F2E
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2024 09:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D311A3D0AD;
	Mon,  8 Jul 2024 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NzLsbWBb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD52433CA;
	Mon,  8 Jul 2024 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720430415; cv=fail; b=sv2MP1imRPxiRnKF+7d/vYWYXcBfem8hSLWcpfrZDit50zQeXmyqrcBl1rqQTOAbV7KWLPyS8pH/h6cMSQuYUW17tEqRbJk8ovBPT9sw1DctAQmJnqapkNrW8D1UI8oGDe/Nc1++z0F3yoUpzxc36HEgJP+gA14HIzmBCvJbuVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720430415; c=relaxed/simple;
	bh=vlO0fiIEhkSlPVBdjBE4pMxW+SEGvN2grc5A5GSiZ0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kflDpU/kCpriapR008cUKzORfOGPfxrC3KwjLEzKbRU6R3jYfXqFf3+UX2rysm26E6N/Htj3LaQ6sEFfxievlsRmdwoDnTGK9i8j/IZFWHnU9uspgQbZ4yBzQSxDUG4PnqmTkJe3Ecqus3V1HXGm/Bpz2vv7iVoPcfKMppG0rfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NzLsbWBb; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgLSSLSMVIoGT/IL4QFeVe2DLTz/Uu8woyobONX+pw2Fj9WkOB2HmTgLpOjDgxT0UgKhRd+zDt/eu2HPeiBzHviSeX0V4oGpbUvUfYpeYYCZs7+lvFJoEdLjfdPP1RTyCr7vlg+wZ/cQtAy9iU0CEVCamxKIQ8uwoqqg3aoXhgKvAs/N5KSdqq+9vNEGYWjRw1pE9OjozWJdRmp2PZCqKHiDyLqe6WB91hFuoJ6MnQdsZADtCfrG6KE0LqhhysknHTmn1XtHFQEaVECUZ+LW30opMmlLjv1np3RnMCMeJ5TAJfa3v1s84ZOPDo600pcOxHpxdOWbPApSPgsKxb/5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYB6hKaKfnsrUjVGbWWC2UuAf4u72Vulu+fCpvLPRWw=;
 b=ARar8i6jWpaUS6NTeJN8wA7VWkinoT02xsdrNGl08YLgmQyayOwyiKuwupw/TLaAYJ2STgodD+mgcQawaKx+diUYcnno8acB6YYk0fnEEZkO2lTEjSy7bB3BUIXEDMJFpE+OnyfCr2JNMkJwXoHu3Kz8GMnDnZtbBaI6/ETB4n13hKMSUbHFNyVr/pSxVtr+0I5g6524MA20cJ6M44m4Z/rnt8dFsKd0i2vTKU+qwwamASMfMYBJwKsKPeBrYbji5Tb16w2fiRQR9GmI9nCCGKt2Bp8NHCCP0X057L5pVHKZcBxC3SD+knV4tsbnD/8eLBvg75uslaLU7DFwW+2c4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYB6hKaKfnsrUjVGbWWC2UuAf4u72Vulu+fCpvLPRWw=;
 b=NzLsbWBbhmEsVQcDICqFnSlW1McA8uGVYqX4dqSo4m5zlKFituhlT107T7VmQO7AYBZHaBm4BhBBMuRK5EGjfwneuVgX9pDKT8YKwezQ46JlMyIN7LSOqJ9uHE+jlUjDa3Jg43BAXZTaVIUx5B9AXIDcSgpeKYcoOxGoGcfkQbA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8512.jpnprd01.prod.outlook.com (2603:1096:400:13f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 09:20:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:20:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v9 3/9] watchdog: rzg2l_wdt: Use
 pm_runtime_resume_and_get()
Thread-Topic: [PATCH v9 3/9] watchdog: rzg2l_wdt: Use
 pm_runtime_resume_and_get()
Thread-Index: AQHasyfd9vnzWl5dOEmcSeWB9khhq7HsjeMggAA7jOA=
Date: Mon, 8 Jul 2024 09:20:10 +0000
Message-ID:
 <TY3PR01MB11346A460DB4209BE98DCF8B486DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
 <20240531065723.1085423-4-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346FEA45BED2B843076F8FB86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346FEA45BED2B843076F8FB86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8512:EE_
x-ms-office365-filtering-correlation-id: 7aa5c5ca-e19c-439b-ccf9-08dc9f2f2a51
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IglWEGDhBx6sgo956E5qbiOUt/QnRTdEoAvHEj6DZ6UpyLU9ezTcTKn8PXF1?=
 =?us-ascii?Q?pVJtNgtmEuYmNjzBmNUrFHs7VAz8o2Gx9J0GPn7P5KSqtUBlKd6iDoiLTpO3?=
 =?us-ascii?Q?fQLe3WSBhAryD1XW61gJ19fq+sNWAjNfm26NwwwLZATVbHdOlH+KZECA5BiG?=
 =?us-ascii?Q?vmJh/DEqHrhPODsAvwpi/TFQsTS325ZZqhtL8Vl8+7SXa5uEliSjZu0y4vdX?=
 =?us-ascii?Q?wP5Do+l+jCtIj9ahTnAf28P7Z0gq60aXJeWUTHQIEkPKJt5pLwN/eE5jFLPX?=
 =?us-ascii?Q?2tCF6orjXfVaESUxfLdJYvQO6ZmR239yC6YyQcf+VGgVJsQDhi+RDVT700+y?=
 =?us-ascii?Q?L+nUui+0G+BIzNMPvflUhwfBbD7iUJfzkDHZKM8YGeT486BHcZaCOF7LOFgN?=
 =?us-ascii?Q?zL55FgC/5Mcl4VIk54FmLX8N91QXwzbNnG8B7UrNPsYZx5zjnxNlaILMNv6t?=
 =?us-ascii?Q?3kEcBQ0ep0ZvIWDyj3YdncszxdPczu+Pwa1VxadwLEfm6UhqZZbX/KOI3jTd?=
 =?us-ascii?Q?o4HlJxlXWDIrhJgwoKJWthrK5sSNrYXoVdD/AHUgqikpjGdYr/UklfZ4jwy1?=
 =?us-ascii?Q?T1AP61kHK3+sbi3B3JS7Ls6lPRKOVYpiR54sZk1hoctLP0p5BeyINw5f3iDI?=
 =?us-ascii?Q?/jN2FNwuyYreJbSuTkEvoXCVVatm0FvTJ+RxAPitBKcdTsgMYBMtenlrYcqs?=
 =?us-ascii?Q?ggdHxrAKyLSeaFiOgwJpghE83ZEE5jshn4J7w7KobCrOwuri9+cmL3KVa2Qg?=
 =?us-ascii?Q?CVTPu+ktf3hLfOe2OD0bKO/rQB3ICi1WiejxG6MUko0ALgU1PD0MZiFFTPhr?=
 =?us-ascii?Q?THnfVXBoTxuxlESzWIy+eKLchDzNiugx5VP8XZHyKxKAW18vDnE26DvR3bII?=
 =?us-ascii?Q?3/8T8g1cGVWmvM7ofYxUvGda0a1G9UnJsgUgNsVN7He+xFp+01xXFGyvz4E3?=
 =?us-ascii?Q?85v007spgRwDdZJvV2eUA1yTYGTzORhnEwYjKvQHXILo2UIOUe8Z4XHdxMFz?=
 =?us-ascii?Q?qKmwLHptsMTrV6tXCv8xRvum6ioYO91xkgoF+2s9Ve8RhUFEY1CwHu3+wqOU?=
 =?us-ascii?Q?6ZB6SoiXPj6GHd0B9Pr/fbxq63yfu0ZvkEqpvbRP+LPJILXgD9/cxsfHa707?=
 =?us-ascii?Q?hh+lVqu7WgjiCnONqaFReeTJzDcHqKOpxzA9AwSqwlNLJiu74jDplLf7inp6?=
 =?us-ascii?Q?SwrkvPQCTyBWB3lugXCBsTjb/Z6sfPfFkoUpTx+RvQ+uobDSosHT1NATWpZ5?=
 =?us-ascii?Q?bje02t4eQ+nsMZVW3Z6Tk/EsOLMEFJ+a87Rc3dSzeRN5enqOmZ8u0ncux6rD?=
 =?us-ascii?Q?PEDVd3BsJsIZzCiMKOZXDn4ucsvtVivYmMcF8Pm6FDZAvCqL81GEt/IB1H+R?=
 =?us-ascii?Q?4R/TJtQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CijHKhtAQmtO2VEFSamZqiDIgRiJoBaxi5CLdBzJzjYNuyyoHzpCWXCOyjNK?=
 =?us-ascii?Q?VmL4GYxqtKfbHer/qkfpx/GSHJyAi3XAl6rmICBIz6KyBLR/TfNMBE9PRGom?=
 =?us-ascii?Q?HbQlLHduKjgBNA38sUaAuyAIbLVY1QGm1D9+E8Z9kfqFNQKYQhwKB7UP0eoE?=
 =?us-ascii?Q?Hp7kP5C1J4caj1gJB2rb9JBCDV9A1Ay/viLgiHQuz8ZKgj528gXNFgcikQ8/?=
 =?us-ascii?Q?zxxwt2E0tX2+NPSuzIoQ6XKpc8w4HyzwJo6GBoGExNjmUPJFzLDOb++Ir0f3?=
 =?us-ascii?Q?y8bVQWrXa5Q9Q5rdlon/W3EkOkxToCBjOfNfXNRbyLviWIrkEy4527268cUM?=
 =?us-ascii?Q?X3w6LkpTo8l6+XhH49tZfeHes3J20MErlV9ibljdRKQg28L6B/rqviz8SJEP?=
 =?us-ascii?Q?SylVNwx+DYrjU2oYsO+lqdkV9nqDCiAr8AdMawuhjnt9v3NB4HnCgwhNECU6?=
 =?us-ascii?Q?XVLrLvVNVMrsCaJbn5teVI9A3cV1HmFCtYLtj7ZMVU994g1gIpw+1YGgbTnJ?=
 =?us-ascii?Q?q/x2ti/b1QAs22UPG+k0WNO0jXsI3iwNkbYWtjxfKucjByXQ+A6aib+1A83X?=
 =?us-ascii?Q?IeJRtEumfZEljZCWubrMa9vwlNceX2VaG3z8qiLOwTjXSw57ezXqPk+M86Xk?=
 =?us-ascii?Q?u/HeGMlSZenCfDh9jhv/am2ljLdf7fQV7l0Wcc+4WAiozmV2sQqOMgjQbpwR?=
 =?us-ascii?Q?TPLSd3Y8rFvllRpZn8wGMJ3NLyclKvyqSoXEnDU6XNnVwC2B7RyYKpG25Sq4?=
 =?us-ascii?Q?E/3X5di1Tz4UR+qAd2IefmkycAZ8QJC4ezppQ5rPXoEKgURFd4FYJE9aaUkU?=
 =?us-ascii?Q?76JrPDBu8S6acoKzXWlP6tXV3Cw/cIcDHkJ9sI4YDscQDQRf+Gd9JIj3+wfi?=
 =?us-ascii?Q?p/QBkE/hhFwzFi6TZp6JYtVsWUbE7IvTmAy3Pk4227v9wHSI9E2elVnX4bPm?=
 =?us-ascii?Q?XxlUQq26yorDb9+EAqjaAY9HpPhm9IfXJmxqdWfYxD/f48tkGLRdwde1qEBG?=
 =?us-ascii?Q?6EBViPSzyi+uKZ0necGyyWoyByA51dutonC5lrgO5Za3wf7zZBib6mUyTEw1?=
 =?us-ascii?Q?u/+Z7VTqOJhQKB2yx7FmQ+gQFNWsmxKJIT/rJLH+136RnrlLeLPCEKDMmG6D?=
 =?us-ascii?Q?TDqa9JNCx2ZsIHfYzWxCqlP6bVELksJLY+8nyzp0ZFkSI9xGhTmAyTZKhBEj?=
 =?us-ascii?Q?9+YOw7EZFTezYl1e8eXD39TuEmxtAh9Hl+0R54eF29dNsvii4f4BqUpMvUzb?=
 =?us-ascii?Q?nWKMn9p90Ya6+Klg6cA5sYHABXBl9TRlYcDSg1P4MJUpm2zQ1sBHmlz7bXcb?=
 =?us-ascii?Q?hwIiEtTSNixjCFx337M4eRKVD3P3DFz5r4/ok4pM3pdWMafeAbb/sNgzR+0m?=
 =?us-ascii?Q?taA6J2CkRqdG3KuV1Zzy/t5VUdGw0X6F6a5fHGLzj9FRBecGJJWf4Yy/odv+?=
 =?us-ascii?Q?a26+yquMuSg4CMk9yV18soxmRGDVsyZEe8s7K8BTh0m0zFTdBdLx8q2VsbJ6?=
 =?us-ascii?Q?bDxBOk2P/XsEjiUyezb7zmhSmSnmpCX6WhZoPIfY+wA5o4arwyeZCLIrJq3Q?=
 =?us-ascii?Q?2tFrt6yqij5KP8C3IJUpCfN73gzUYjjDrVI+jThNM+M0moVl1C82ZlnTLtXn?=
 =?us-ascii?Q?Mw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa5c5ca-e19c-439b-ccf9-08dc9f2f2a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 09:20:10.1470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJsSZbjKQmS3jVlSD11EeM+gpqvzOGpsK125zio7Ogvg58lZVO0iz1kjLEDU2Ln/FyJmaa0awNAuPCarqaskJQ9608Jw/0/Lyo34U3jzlL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8512


> Subject: RE: [PATCH v9 3/9] watchdog: rzg2l_wdt: Use pm_runtime_resume_an=
d_get()
>=20
> Hi Claudiu,
>=20
> > -----Original Message-----
> > From: Claudiu <claudiu.beznea@tuxon.dev>
> > Sent: Friday, May 31, 2024 7:57 AM
> > Subject: [PATCH v9 3/9] watchdog: rzg2l_wdt: Use
> > pm_runtime_resume_and_get()
> >
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > pm_runtime_get_sync() may return with error. In case it returns with
> > error
> > dev->power.usage_count needs to be decremented.
> > dev->pm_runtime_resume_and_get()
> > takes care of this. Thus use it.
> >
> > Along with it the rzg2l_wdt_set_timeout() function was updated to
> > propagate the result of
> > rzg2l_wdt_start() to its caller.
> >
> > Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >
> > Changes in v9:
> > - collected Guenter's Rb tag
> >
> > Changes in v8:
> > - none
> >
> > Changes in v7:
> > - none
> >
> > Changes in v6:
> > - none
> >
> > Changes in v5:
> > - none
> >
> > Changes in v4:
> > - none
> >
> > Changes in v3:
> > - none
> >
> > Changes in v2:
> > - propagate the return code of rzg2l_wdt_start() to it's callers
> >
> >
> >  drivers/watchdog/rzg2l_wdt.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/rzg2l_wdt.c
> > b/drivers/watchdog/rzg2l_wdt.c index 1741f98ca67c..d87d4f50180c 100644
> > --- a/drivers/watchdog/rzg2l_wdt.c
> > +++ b/drivers/watchdog/rzg2l_wdt.c
> > @@ -123,8 +123,11 @@ static void rzg2l_wdt_init_timeout(struct
> > watchdog_device *wdev)  static int rzg2l_wdt_start(struct watchdog_devi=
ce *wdev)  {
> >  	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +	int ret;
> >
> > -	pm_runtime_get_sync(wdev->parent);
> > +	ret =3D pm_runtime_resume_and_get(wdev->parent);
> > +	if (ret)
> > +		return ret;
>=20
> Checking ret will lead to imbalance. It should be ret < 0 as ret =3D 1 co=
rresponds to RPM_ACTIVE and
> the API does not call put() when ret =3D 1; see [1] and [2]
>=20
> [1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/=
runtime.c#L778
>=20
> [2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_ru=
ntime.h#L431

Please ignore me. Sorry for the noise.

the code for pm_runtime_resume_and_get() seems to be correct.
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

Cheers,
Biju

