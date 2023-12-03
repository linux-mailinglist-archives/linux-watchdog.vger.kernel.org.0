Return-Path: <linux-watchdog+bounces-108-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F08023DE
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 13:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35F831C20748
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 12:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9F8E54D;
	Sun,  3 Dec 2023 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EYXp2NdZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6D9C2;
	Sun,  3 Dec 2023 04:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJQ8h5fzjzI0yGiwvg2JfW7SEjkzBw6B16crnkfQx66C/xUJCKAV5CjsYFeh2N9HyRv1cuDIJI0xIgNQ1WcDDGPTplyWTTzU2R3ZepQEWyjBBk9RaUG+cEBNtMWVvsskKka7Qb1oPvY6qpJ/YXvr36ZAAxOEzPqJ+QTNp+Xsy1zqygYO5mS4gcF3cJDUbZKioilDx2AQPdwnFZaql2Qs5NTgm62+kOTDfGlEVdDdLc0HEC86U0g2xOlFFZU8VLWacUzH2luHPYTAh2ZmsclqqHgrf0SM6eHU1zoJj0jI2+wCp6pm1hEw17d4yIxkzAfFKMy6tFJxIx2Wnn17zvosjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rur1f8g2OpqrzlDAkHPlYAJsNQid0ZwqDeO/iKrbmk=;
 b=MfOXrPCAkYef5YOCERQkzwH3DTQjUo3KiHDAS9YlBNZssKmakwRZAbty0kGSUzKgAkcbPnlydg4TusNnqjLxoKZ5ppcmJQzlFIMqakaothPuk9RrRmVqIRAeKHaNv1MPORCpoXwW4XqZ+7QylueRCEDgMzVAR90H0+1BuUKxJIReBBDXtkU8+B1bBdejeS6MmaEKhk4GpU21UT9TIhWGsF0GWyGc9OyPusvRg/XchBL9umCC+6aC/FnkfHsAIE5QMonE4UW3IhYV70s+nTuhbN1FBkiFc1Wp55MkrIIr7afshk+9sMxGCITTkB8dpyJN5j0Vgn04h6qcW5hPT6GYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rur1f8g2OpqrzlDAkHPlYAJsNQid0ZwqDeO/iKrbmk=;
 b=EYXp2NdZZqpIVryKHF1ED1bpBsBrKKZppU4EUoetaVf+kjkAapneThY6S04CvhCLnGiAlSD1pqoTSqZ0CjuPRDWkUE8LZO5KZS+IAVotuqxSdFlFsxCGusQkmOo9gR7BZCmdH4nZoyN1d00ZqXvzZUWmb/XyWDeOmj1/68uldY8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB6280.jpnprd01.prod.outlook.com
 (2603:1096:604:e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 12:52:05 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.032; Sun, 3 Dec 2023
 12:52:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Thread-Topic: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Thread-Index: AQHaJVVfhIVLPKLVkku/odkls1XUQ7CXbpEAgAATpsA=
Date: Sun, 3 Dec 2023 12:52:05 +0000
Message-ID:
 <TYCPR01MB1126961003EB5830E645742BE8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-2-biju.das.jz@bp.renesas.com>
 <20231203-daisy-palm-9e97126eaf3f@spud>
In-Reply-To: <20231203-daisy-palm-9e97126eaf3f@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB6280:EE_
x-ms-office365-filtering-correlation-id: 0a010a40-557e-47c3-4f45-08dbf3fea735
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 05ack6dCFbFMclwtWxBLbvesi7B7nLCkMM5Gdrc5cBNgQHDlC4aCjD7wYOdCN1MIm8uQwHVo+6w6J3bLdiJELaT9wOWwM2VrBsTx9Je2LXjE925K3D0z2tdENt0zxdD0Fi0ABcXhWBYaY5yAIHkGZ4iVhwDl1dahhZVVWtQWKX7rVjaHRTOhZ11PN+gPFycahMKTnT0gxOVbISQeXySSkLrPfuFM6p2YmdjkdGVLEmEI38hFSaxMokDAKQD9DDOg58cj0PgDNkXR4CZhgLcl3hX4SwYPmo5VKotwe8lztZvI63wZ2rA9BXGS43s9AgrFDclbO6umrPCz2PaS3dN7v1VXGKZyeBvQrtGhEyaqKjdgr37xfQYk6ZMt6JtI6BFdJ7QZtU77NzPyJPdNDxJT+Q7cTxWvaNohuwrgBRBN5jqFGNV/2+MgZ2kcizFrUFJC9YsEQT/kyUm+l+CGeywcUu7LvR+8Ki1gt4rLbhqjxmlZUU+s+jCRIZ+8bibgSSs96Rp8uwpGrVjQZPZca6ABYfGik8nuhL19HNkpbr/wuG3sVbkFojmnCv8vagZbHuOhxhTTo7NNbXaD7lMYiAlTNlXdiZz1AkGmInYOr203vqITM+klRFDQ66sRpXZcKkfO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(33656002)(38100700002)(55016003)(122000001)(38070700009)(52536014)(2906002)(83380400001)(5660300002)(7416002)(26005)(6506007)(7696005)(9686003)(478600001)(71200400001)(86362001)(4326008)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(316002)(6916009)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IyKyy2Uqt/bTFP8aFDF4S2teMz6AJYmxClmq14PgaAJ3x1rE+XNOeZRFz91J?=
 =?us-ascii?Q?OkjsryQ0uOLw4n4+nuTXowXfrqSQeocQ9GRLE9xWhnuwBH6YZ6evjKZNaAGT?=
 =?us-ascii?Q?4cn8GdZ8lNCeOjUG4UV86kTDw3VX/6nnv9WYJwi31rnHb7veZMRaN8OR7FOW?=
 =?us-ascii?Q?PZvLqh0ppZ5BO5ECGMq3V1l+3UbniycJ4s3H0D2WRAHYTJBsp/36+g7S/7m9?=
 =?us-ascii?Q?WHFxJ6V1TyYUsQBr0xc/QRZa1+duUuxXeRqQAGeEAZdJMfKkb1r8PXf54Ykp?=
 =?us-ascii?Q?tUaTmsrO3ypQqI6yX9jjZt4pxMxheyyq3jU5WeSh/OzysGgy2ArSTHlarGxm?=
 =?us-ascii?Q?0ZjUV184VyES3qQka4Z7WMpH5GuHGBjool7ArAmBLXn1ScwbFwdMVNtEsb+m?=
 =?us-ascii?Q?9FbqEqiHcl0rQJP9dqjCdESiWDAemavEi6UGYH5/3llLsQkWwh2EFZF0fxTk?=
 =?us-ascii?Q?uddCH9SDtG1nLWPOVGFm8XDjl7mFjcg3/xN+8pF6422/fPCVcPOY7cIlTh8H?=
 =?us-ascii?Q?sWqEbCpgpX18UR8V7i+g6sKky/6UZlPffFUwb1rQcfdiZlvmzqr/a0Xho4Vd?=
 =?us-ascii?Q?IQDqVJO975LTmh4O+e/MNJp+4qWF6mTZJ4rUQlfFYb8j9J6AJUoVivcR7QSB?=
 =?us-ascii?Q?MbfqR/dmRmyGf9zjeiJHmXx6IJL6fKgUuctZ+tWKg/KBA494//ibzq7giNH8?=
 =?us-ascii?Q?tY9adoX2D/Jw5x3zGsRQdqvzdUH9vgfw8HjX+y8cmaMWCC8RaL4GSfbb58Ge?=
 =?us-ascii?Q?bESY+aOtKdoqAa3o5pBxifhgEBwa2dCaKvZWjyOKqo+Cuqe8xpf7RvykMvKH?=
 =?us-ascii?Q?b9ZaBzO02xnj0AqZ4b4R39xHAwR9s54Jy/p8rqNdD5fPRdraQo9hbIjl5ZJs?=
 =?us-ascii?Q?dmJHQ6+/BUgW/55OGz6sVUMye43fY/5ox2ixFi0rkAJ23D29rmUGZxgBv9Xq?=
 =?us-ascii?Q?GUoEpjoFOGk8zlZJiRVmTJp+p2ALgTPIXIhWJPucRxZCCE8YHNPde06uOYoF?=
 =?us-ascii?Q?fkrzVHXe0P00zPx2cgVSjb6/wY1fKA/umJGbAFjTM8OmBzRSU8eFVz5DDiJP?=
 =?us-ascii?Q?yQJZfL2Geo9zuDB9Hr2DUyF6Z2kBsLNgi6mZBgu9VU4bNrdPtc8UF7FWbiRi?=
 =?us-ascii?Q?5y3aepYPvq2w28W9GI+eGJgzTQQwlLjAwdZ6EzAoUJO1k8KqkwSDOT2dp2LE?=
 =?us-ascii?Q?/rozr44M65I7RYU/GgFUoNTDF/dcj/UxcLKH7BfnbEC7IY9o/tm6aosBoPnF?=
 =?us-ascii?Q?d1zugKVp0pkKj1bTT4Pc2JGdtfCYpfTODbs82LwOkjQeYtDdUhPeaws/fyCS?=
 =?us-ascii?Q?B3lXWsFGiq/vzN0v6MzeMMC8NFLhaea168WU8GX+RWvbYAmz5760SG/urJIe?=
 =?us-ascii?Q?Kw8pMLMh+eODnBTSNs9efZPv+Wmt264TDDpa2yINQ+A5bdDtbywg22f58xSw?=
 =?us-ascii?Q?lZRpt+Tvyb/Nf+QToYmDEllLFMAbAo2Cw54fnCwxr2vHhOkgztI0JT9KhKli?=
 =?us-ascii?Q?OjRbf+9spkqNsAQpSxtXGFDp9J+RolqPwBtztZ5nSjy3z4mQ4Xb4L3DpiBwT?=
 =?us-ascii?Q?vY683860DSAzs7mdJ50cR10sq75dVfdvQgMoF9VUlNr72c9R5TuyqGETlWaX?=
 =?us-ascii?Q?AA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a010a40-557e-47c3-4f45-08dbf3fea735
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 12:52:05.5051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KaUPJsyKAUF1Ym12Z35YkchDKNhA4nrdHVuU8Uj8QL/o8IX2iSpMAk6Ky7duK79/teNirJVG7sbXsMrCtSRGDY0/lV9Hq6BWZEaMxaIsmWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6280

Hi Conor Dooley,

Thanks for the feedback.

> Subject: Re: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog:
> Add fallback for DA9061 watchdog
>=20
> On Sat, Dec 02, 2023 at 07:25:25PM +0000, Biju Das wrote:
> > The DA9061 watchdog is identical to DA9062 watchdog, so no driver
> > changes are required. The fallback compatible string
> > "dlg,da9062-watchdog" will be used on DA9061 watchdog.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2:
> >  * New patch
> > ---
> >  .../bindings/watchdog/dlg,da9062-watchdog.yaml        | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> > b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> > index f058628bb632..2b71fdb9251c 100644
> > ---
> > a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.y
> > +++ aml
> > @@ -14,9 +14,14 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - dlg,da9061-watchdog
> > -      - dlg,da9062-watchdog
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - dlg,da9062-watchdog
> > +      - items:
> > +          - enum:
> > +              - dlg,da9061-watchdog
>=20
> If there is no da9064 on the horizon, I'd just make this const.

You mean since it is single device having a fallback,
define both device compatible and fallback as const instead of enum and con=
st??

>=20
> > +          - const: dlg,da9062-watchdog # da9062-watchdog fallback
>=20
> The comment here is just noise IMO.

OK, will change the comment as generic fallback. Is it ok? Or you want to d=
rop completely??

Cheers,

Biju

