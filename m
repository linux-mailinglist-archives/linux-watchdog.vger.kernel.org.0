Return-Path: <linux-watchdog+bounces-276-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936080F382
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 848FC1C20CFB
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 16:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE61D7A235;
	Tue, 12 Dec 2023 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFYe3wPM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A47A234;
	Tue, 12 Dec 2023 16:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A676C433C7;
	Tue, 12 Dec 2023 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702399684;
	bh=aNHGA0+OP2YXIV3jh4hVPbn2PRXP966VFGwAlUTm6OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFYe3wPMn3Lg3ndIIfcU5/QNd4Hro7G6QeuPLJluyf9mGilUtpinEgnsnB+fDHv+D
	 7l/2bca7V3e5KvIzg/hfVHk4ZSqfZDNDnzEgF0BV6B3DdcYxGNXRL/CPyQtuNsJddh
	 MzflMEUzxV1Hjt+tk6kWy4IoUjd+3xgAw3/mAtA5YasDuIIQmi77Vaho3sgMTkKyjL
	 4Qh97xnK4IZH/FOZVFrwn4RClguppq0gSuG0kXGhcs/yzsNahmIM9tHOon1OJc6nbu
	 MA7ep0eoK2Vz25gl0AQNtSgye3/5yRtw8vlwpzIGxAnCx61hHaVUF/92fjbLPQuWeD
	 K+wAFGSyStZLA==
Date: Tue, 12 Dec 2023 16:47:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Message-ID: <20231212-shout-bazooka-714aeda42ec1@spud>
References: <20231212031731.2498584-1-jisheng.teoh@starfivetech.com>
 <20231212031731.2498584-2-jisheng.teoh@starfivetech.com>
 <20231212-reverb-daisy-4574734ae84f@spud>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lo0V+T4OZHJunVRD"
Content-Disposition: inline
In-Reply-To: <20231212-reverb-daisy-4574734ae84f@spud>


--lo0V+T4OZHJunVRD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:46:00PM +0000, Conor Dooley wrote:
> On Tue, Dec 12, 2023 at 11:17:31AM +0800, Ji Sheng Teoh wrote:
> > Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> > watchdog.
> > Since JH8100 watchdog only has 1 reset signal, update binding
> > document to support one reset for "starfive,jh8100-wdt" compatible.
> >=20
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > ---
> >  .../devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml       | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100=
-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.=
yaml
> > index 68f3f6fd08a6..02572b16ac08 100644
> > --- a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > @@ -27,6 +27,7 @@ properties:
> >      enum:
> >        - starfive,jh7100-wdt
> >        - starfive,jh7110-wdt
> > +      - starfive,jh8100-wdt
> > =20
> >    reg:
> >      maxItems: 1
> > @@ -45,6 +46,7 @@ properties:
> >        - const: core
> > =20
> >    resets:
> > +    minItems: 1
> >      items:
> >        - description: APB reset
> >        - description: Core reset
>=20
> This relaxes the constraints for the existing devices, please add per
> compatible constraints to avoid doing so.

Also, you do not appear to have implemented the request from Krzysztof
to express compatibility with the jh7110.

--lo0V+T4OZHJunVRD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiOvwAKCRB4tDGHoIJi
0herAQCODs736+Qe5j/hkbfNeI7xdVcGRKkurOrjX+4lQhNvpAEA6MN/UHKEuQ7A
3lki7S8WsCrF5mWZkZpNa9mg7laccgM=
=4sul
-----END PGP SIGNATURE-----

--lo0V+T4OZHJunVRD--

