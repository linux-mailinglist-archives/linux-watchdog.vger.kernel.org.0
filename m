Return-Path: <linux-watchdog+bounces-119-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93E803B2B
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 18:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C583A1F21259
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 17:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6E02E63B;
	Mon,  4 Dec 2023 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naWk9UmZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E42557A;
	Mon,  4 Dec 2023 17:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C692C433C8;
	Mon,  4 Dec 2023 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701709834;
	bh=YUtRTPoK+tW4AtegcB6or0aHS1jwSCry6p86GjMrycM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naWk9UmZ+0O0Fr45lIji8VEMQ0cPq1FHELZdFD9a7vEd5KGbcTtbd5j79h0XLikRP
	 WFJOe0K44PXgHROCohlsHUdFxIYONO2IWD+c9JJOj5wWGfv0PdoQpIAl61nwxNh5pl
	 loC8u+T1HDSKzBTnPGRibHd7m0ryl7vcVt6Wr80eHfQnNFYuluDUhzU5J0CCGbqQfK
	 1pVOf0//CGLT0SGWEf92zjsQ7Jee/FjdubSZufoP55M/K8Vi2UW1clrWhMXviDYlEk
	 42Gacx/dNeHsHhvTVpqKMxh00YM7fTUbyCZt0xPHlvQCM8hKKoljzNergTmcpPK4Ah
	 l+qUR9SQLwsoQ==
Date: Mon, 4 Dec 2023 17:10:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Message-ID: <20231204-wrist-docile-d6107670140e@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-2-biju.das.jz@bp.renesas.com>
 <20231203-daisy-palm-9e97126eaf3f@spud>
 <TYCPR01MB1126961003EB5830E645742BE8687A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB112697ABEBD60A1ADB32ECA248686A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M8mGZHn7Y3eYQmc1"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB112697ABEBD60A1ADB32ECA248686A@TYCPR01MB11269.jpnprd01.prod.outlook.com>


--M8mGZHn7Y3eYQmc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 10:55:20AM +0000, Biju Das wrote:
> Hi Conor Dooley,
>=20
> > Subject: RE: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdo=
g:
> > Add fallback for DA9061 watchdog
> >=20
> > Hi Conor Dooley,
> >=20
> > Thanks for the feedback.
> >=20
> > > Subject: Re: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-
> > watchdog:
> > > Add fallback for DA9061 watchdog
> > >
> > > On Sat, Dec 02, 2023 at 07:25:25PM +0000, Biju Das wrote:
> > > > The DA9061 watchdog is identical to DA9062 watchdog, so no driver
> > > > changes are required. The fallback compatible string
> > > > "dlg,da9062-watchdog" will be used on DA9061 watchdog.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > v2:
> > > >  * New patch
> > > > ---
> > > >  .../bindings/watchdog/dlg,da9062-watchdog.yaml        | 11 +++++++=
+--
> > -
> > > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yam
> > > > l
> > > > b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yam
> > > > l index f058628bb632..2b71fdb9251c 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yam
> > > > l
> > > > +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog
> > > > +++ .y
> > > > +++ aml
> > > > @@ -14,9 +14,14 @@ allOf:
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    enum:
> > > > -      - dlg,da9061-watchdog
> > > > -      - dlg,da9062-watchdog
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - dlg,da9062-watchdog
> > > > +      - items:
> > > > +          - enum:
> > > > +              - dlg,da9061-watchdog
> > >
> > > If there is no da9064 on the horizon, I'd just make this const.
> >=20
> > You mean since it is single device having a fallback, define both device
> > compatible and fallback as const instead of enum and const??
> >=20
> > >
> > > > +          - const: dlg,da9062-watchdog # da9062-watchdog fallback
> > >
> > > The comment here is just noise IMO.
>=20
> Yes it make sense, comment is not needed.
>=20
>     oneOf:
>       - items:
>           - enum:
>               - dlg,da9062-watchdog
>       - items:
>           - const: dlg,da9061-watchdog
>           - const: dlg,da9062-watchdog

Ye, this looks good. Thanks.

--M8mGZHn7Y3eYQmc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW4IBAAKCRB4tDGHoIJi
0kE8AQCcC7P7CwbjI8mpyPErFJHTFEwz3vrCNUDGiTNrth5GGwD/TI9FzFZQsqoN
zDBdPRztUuv2Hc+3w2sYVRWR7YxnHAA=
=jkrD
-----END PGP SIGNATURE-----

--M8mGZHn7Y3eYQmc1--

