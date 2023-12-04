Return-Path: <linux-watchdog+bounces-118-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800C8030FD
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 11:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F271F2102B
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 10:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F9A224D1;
	Mon,  4 Dec 2023 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fVeNxCgg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EF2D8;
	Mon,  4 Dec 2023 02:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0OGxtsBzZTerWGjcKyQ1tyZ51nPzw6b+7UoVhaquDWon9MNwmHMT9sMVz1Mzdhm8O/UpYSRx56lv/CA2E+yytyR75FvvFkLnMnv4tDRjLfzygcjUKEIWG15cl6Trv0R2uViEWVtAophtWXek6B3B844S9nBr80NddCgDl3eQ2cQY+gPM2qJCscS6uiqfbb0fa3kBBM9Bao4nOyHPnDZL4HVtV6Ji45IIa00zDPl2Zw3xITiXJCah1wIScAKgNYLggFPXSRztzDMWVrwbYWyRaD43enhM1qxN9JpUJFMGnoHY9Ruyd1LOjjF2cT0a1pqrU82v6nicuFywsj4Qq/HQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSNiqqH/G3POGQ8tT0bVHdcyW1ZIQCtoJ1qKjafhrF8=;
 b=TKJC5HGcPgFWRHwoN6SUr0+5HIQ9kGS6PDhRtbHXiUV9tlLjt+9DM3n5lbub6ONHoNMJKVDQc7XnbR6IwVFEB/UXrlnsnz8xb5PFF0ja35DRuuuy1v1G4JV1zEaxWtrNVhC6f6sgKmQokoyfK1J3FpoQkmv8ST/yXmqO31v6pqwLRABIvo8Mu6A3CmQlNTv2n3/NJesCTDxry/CUsqdHtQvhDC1NS2g7L2vBi+McfDBnbLOZFE8aGbJId/iFTPLsJYfEeYfeZOAvITqa7sLHBKAz8HXYk5w1tstq0QZxwN/87zE69h4U6/g9nfw6Q3SCS4h3oL5pxmNq6s5VVQPHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSNiqqH/G3POGQ8tT0bVHdcyW1ZIQCtoJ1qKjafhrF8=;
 b=fVeNxCgg8aPHk/jbS66fMCU7TjVN6Gpvw5VXrkul8jIkbpz7XZIgmhEBq0BloidJi5OHtg1hkArVp6iNBjB+tTQF/nH5++7bLKQnP0Y6IuUDYAbYi2ll8wEpfHOGzpJ5VSYCJxO/5mnW/pA38+hS+SN5lJvvAJTh0cHQGs34PX8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5988.jpnprd01.prod.outlook.com
 (2603:1096:604:c9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:55:20 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 10:55:20 +0000
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
Thread-Index: AQHaJVVfhIVLPKLVkku/odkls1XUQ7CXbpEAgAATpsCAAXNLMA==
Date: Mon, 4 Dec 2023 10:55:20 +0000
Message-ID:
 <TYCPR01MB112697ABEBD60A1ADB32ECA248686A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-2-biju.das.jz@bp.renesas.com>
 <20231203-daisy-palm-9e97126eaf3f@spud>
 <TYCPR01MB1126961003EB5830E645742BE8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB1126961003EB5830E645742BE8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5988:EE_
x-ms-office365-filtering-correlation-id: 279a3640-99d1-4f97-bdbc-08dbf4b78273
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QwNbrm+t1Ln/boG9uUBnQUOcZMBxAhMl3qCqsIVPehmovc9fa87o6vYRsdTv/FPt/auQGILapsVISw3oSSIP437dYAThg8J5bowEa7AkV+6XtB0Hrgf2bWAx7TNAjIUOCn7rlDzuWlGT3JuDfodm8B35YhHvzJAcXF5SvQa9b6jG8rNbE8HZF5EBFvzoiNgzHChUnVVaOvIo7XaujsLO8qduRPFgXlHK6S/pdUgw55Mv/QydKA/tKzK6aY+UY0nQlHTSh7rnsOx3cX1b8yl+Vrb4CkSDE4I34o+ggB5il8DbEjME0+53Yi1FxQVP766bFDkz6SH7xwsrOYHw3pB+1zNW4ypiF90KIx1PgwGIPJUj9l7XR++3yTnG9tMaVLWiufjVBE5/TsqIm8LgDK6TDMCX18gKQgx73jhjK9kTciJ6zJ9x4mWfC4PDJ6Zm00VjLSI+dJiIM1Dpm7RDuaF9eGeYc47zSvfNLb3MjfGQ7Z8fv4CKgjKAtClm4QNy1StjdyjbKbVJ6AaZkBh9uvxAoTAE0ag+uwd8zkdmbwrTXU6jV3esKj5y8qhuj8m7L0af9c30mzl5uw5B659FDa1JuLM9x2oqnnzd9gaMJT4GwJqCvDKgY+rgOff5Puvc9sHL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6506007)(7696005)(52536014)(9686003)(478600001)(26005)(83380400001)(55016003)(71200400001)(6916009)(66476007)(76116006)(66946007)(66446008)(316002)(66556008)(64756008)(54906003)(38070700009)(33656002)(86362001)(5660300002)(41300700001)(8676002)(8936002)(4326008)(122000001)(38100700002)(7416002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LRjJWuzyUVDNqAnx5Ir5fV7BHOq9Tmd3PMX1r11DNINMhAAhYfGpaA8Bgi7x?=
 =?us-ascii?Q?d/SslGoMGLNYSWXqTP/0aagSekTKX8PnpQVIHNcw5+BNU3uRiZ3j5Bt+gGDO?=
 =?us-ascii?Q?ZizyorjcSC7Z7MqJWRSK90NTbf78BBDvQXhRNVPSu22fefwE89u9j13Lkwwh?=
 =?us-ascii?Q?jKN5kxt2lu8o3ZKBCv5oKD7JkgJg+JnSk/P07jI2gwn18/YUPS2EFMcCzPJ8?=
 =?us-ascii?Q?jReLv5g28SNi5Wr5QVkqZzgV2lALjR0x8hGPNOjAhnZ90geGyylzfoTmJ8Nm?=
 =?us-ascii?Q?xqNZ/D4EMbPpRGLAHgVmlRw1PdFzTVCM2vkRvSxXAvl2G7WoOtKUNipRb7eC?=
 =?us-ascii?Q?SofoTE6XLGKjoD7FlaZXSqalR6vIBshtTOO564utllAhOpWQV6nMimvv4IYn?=
 =?us-ascii?Q?P0yLzXXUGKUTVenbb9b3y9Npot+gPhhTiKy8WESP2kS+VnSZqQmn/C/jyUsT?=
 =?us-ascii?Q?ondHpE1utInVXKHpAZLw4RbX32+o9FQ8v9T2fOZ8ah2n5N1ebpKJjOo/7Arw?=
 =?us-ascii?Q?upM7sI9Eo9+TIyy9gViZC5eQApiK3mU4b7ZBFunsyEYDxm74+tLyOHOVlDFz?=
 =?us-ascii?Q?64EcFliT2JoCkrzNev578qSdUHYOFrlA9WE7LD6RIitYFC5YXKRutco0gh60?=
 =?us-ascii?Q?W6t1XFR4/30cor327p2sLC4WJrL7BMoPv0cGmhpzo26qn1uLYtduGR05St9s?=
 =?us-ascii?Q?X84GNpzyL6tOWKHsiIrbnMFNCJW3kJpOk/lcJhE6MaC8Oehqm5XInM1XT6rp?=
 =?us-ascii?Q?QfGdq+txq5DUO67pcLl1yaKPgdAr9k0mndkjmKEWuUkdTPzKYNvRWsr7val/?=
 =?us-ascii?Q?cJTPGMZ4YSDKlwtNrfaHRLX/8cTKaFb7rarbq8APQ86DeMPgx0OcxWVglgZk?=
 =?us-ascii?Q?0kzICLK2SFg+BapXjPOEx6QsGmHIXNi+R8vZ5yjvZM5WWTEYBjN/CSZLhvcc?=
 =?us-ascii?Q?lCdAdxTZLrkP6Vf9hpqUrtNKZWN69GVKf9Oqi8QEx5mC72YQHvAK14Z6/1gE?=
 =?us-ascii?Q?P/m7rP5EQmXnsKI0TUGX38nhBP5stJ2YnlRz7vr9+dRT3P8mP/kn6zCywqC9?=
 =?us-ascii?Q?yrsK5INclX9c1J/lvxgF/krDhI5nwNY69t6awBsviBIl8ipWXkD7UFs0554C?=
 =?us-ascii?Q?DS3uB6CO7xP9BfMBYaD/Sv3M9k2Iep679UbRT3WDbNxEnOvlPRKMbUVEfG+h?=
 =?us-ascii?Q?/rLGcLyZbBhyEAce4OMbJscMhns7DQJyyBdQFivaInc7JO+/D9QVuv6VP1j+?=
 =?us-ascii?Q?LLwDvxmfHNHfJfXN22/WMvAjXlYBAahQjMgQzsUqkCJ/eYJ60eJ9o0HPai0j?=
 =?us-ascii?Q?SFiTppHJJcNQXNEy1XCxkqOlHtTIJ/PnM6c0j4aW7GGiKWayrYM9ZUsQ1wMJ?=
 =?us-ascii?Q?sNny2OqSdpS8Y5LI8tqVTANEDuPACQOiraORfor9uFVmmTLWt8uL/tt5G87h?=
 =?us-ascii?Q?w1NVdT9B3wUGGAnLYgFnCMD2APfiSkDtdMD9wCxWee0dj60aX0c8SUT4rX3o?=
 =?us-ascii?Q?vTm3gkbtA4685vtY4W1VFo+ldh+PdCAH3ORC+xIxdRqBdG07w9SzXggBUq8v?=
 =?us-ascii?Q?jVAiehAUDsNrauPuhpJjol+r/I2bgPaToDLU2xpSGmb2MOxTOUcTMz+5j4fh?=
 =?us-ascii?Q?QQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a3640-99d1-4f97-bdbc-08dbf4b78273
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 10:55:20.7683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QG8HNxNkTcusKNdKsQCI66e4lKJdiVfJxCZ/ZtSBvRH2HiVrxey7+ppNV8qXjvgJP/O4Wl9af+2ZxQv2qb516bRwz99rqwv//CtU7n/nuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5988

Hi Conor Dooley,

> Subject: RE: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog:
> Add fallback for DA9061 watchdog
>=20
> Hi Conor Dooley,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-
> watchdog:
> > Add fallback for DA9061 watchdog
> >
> > On Sat, Dec 02, 2023 at 07:25:25PM +0000, Biju Das wrote:
> > > The DA9061 watchdog is identical to DA9062 watchdog, so no driver
> > > changes are required. The fallback compatible string
> > > "dlg,da9062-watchdog" will be used on DA9061 watchdog.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2:
> > >  * New patch
> > > ---
> > >  .../bindings/watchdog/dlg,da9062-watchdog.yaml        | 11 ++++++++-=
-
> -
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yam
> > > l
> > > b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yam
> > > l index f058628bb632..2b71fdb9251c 100644
> > > ---
> > > a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yam
> > > l
> > > +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog
> > > +++ .y
> > > +++ aml
> > > @@ -14,9 +14,14 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    enum:
> > > -      - dlg,da9061-watchdog
> > > -      - dlg,da9062-watchdog
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - dlg,da9062-watchdog
> > > +      - items:
> > > +          - enum:
> > > +              - dlg,da9061-watchdog
> >
> > If there is no da9064 on the horizon, I'd just make this const.
>=20
> You mean since it is single device having a fallback, define both device
> compatible and fallback as const instead of enum and const??
>=20
> >
> > > +          - const: dlg,da9062-watchdog # da9062-watchdog fallback
> >
> > The comment here is just noise IMO.

Yes it make sense, comment is not needed.

    oneOf:
      - items:
          - enum:
              - dlg,da9062-watchdog
      - items:
          - const: dlg,da9061-watchdog
          - const: dlg,da9062-watchdog

Cheers,
Biju



