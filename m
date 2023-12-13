Return-Path: <linux-watchdog+bounces-311-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF581199E
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 17:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0415A28251E
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 16:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E7735F1A;
	Wed, 13 Dec 2023 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojrb3u9z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD133CC0;
	Wed, 13 Dec 2023 16:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B68C433C7;
	Wed, 13 Dec 2023 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485343;
	bh=4LXlGDFMgyr68Nnysznfjyj9ckhbpcDnviA5w6YqYzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojrb3u9zQbEZq88mjdLSFt5osphF7b828MWOhnBscWwBAZ8xZF6XPU3IRBBkBuO2o
	 hCgyXMw71QMwJUg4ysh0+QPM/jK2h88qhJvtroT74Tv4efhS+T2K5GzqE1z30bkapu
	 5oToqrR5o0k7JcHOhMdVBWFkUgr0FT05F/s/iAFwpO7UcMLlYmjnobt4SeJ8lm/Wi/
	 m5iNa+//m1cUgpflGCMlshdaJEHCF5hIv78aL8yV2HrNLp73uPJYdopBSXuFUy5EXK
	 Ey068CDzxzK7V/C2PpQ8wRX9xZuKseAegY0x+yqwEDxTkcJe3LRuJmrw0Y1vLp0Jb6
	 ZSaVIevfjeZhQ==
Date: Wed, 13 Dec 2023 16:35:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, leyfoon.tan@starfivetech.com,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux@roeck-us.net, robh+dt@kernel.org, samin.guo@starfivetech.com,
	wim@linux-watchdog.org, xingyu.wu@starfivetech.com
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Message-ID: <20231213-rectified-unmindful-4064c852930f@spud>
References: <20231212-shout-bazooka-714aeda42ec1@spud>
 <20231213025759.812453-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4L9gi5aM8FSFnIIA"
Content-Disposition: inline
In-Reply-To: <20231213025759.812453-1-jisheng.teoh@starfivetech.com>


--4L9gi5aM8FSFnIIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 10:57:59AM +0800, Ji Sheng Teoh wrote:
> On Tue, 12 Dec 2023 16:47:59 +0000
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, Dec 12, 2023 at 04:46:00PM +0000, Conor Dooley wrote:
> > > On Tue, Dec 12, 2023 at 11:17:31AM +0800, Ji Sheng Teoh wrote: =20
> > > > Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> > > > watchdog.
> > > > Since JH8100 watchdog only has 1 reset signal, update binding
> > > > document to support one reset for "starfive,jh8100-wdt"
> > > > compatible.
> > > >=20
> > > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > > > ---
> > > >  .../devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> > > > | 2 ++ 1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > > b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > > index 68f3f6fd08a6..02572b16ac08 100644 ---
> > > > a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > > +++
> > > > b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> > > > @@ -27,6 +27,7 @@ properties: enum:
> > > >        - starfive,jh7100-wdt
> > > >        - starfive,jh7110-wdt
> > > > +      - starfive,jh8100-wdt
> > > > =20
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -45,6 +46,7 @@ properties:
> > > >        - const: core
> > > > =20
> > > >    resets:
> > > > +    minItems: 1
> > > >      items:
> > > >        - description: APB reset
> > > >        - description: Core reset =20
> > >=20
> > > This relaxes the constraints for the existing devices, please add
> > > per compatible constraints to avoid doing so. =20
> >=20
> Thanks Conor. Just to clarify, are you suggesting to add what was done
> in v1?
> v1:
> https://lore.kernel.org/all/20231209142723.2060196-3-jisheng.teoh@starfiv=
etech.com/

No, but similar. Add numerical constraints that vary per SoC without
changing the names of the resets on a per-SoC basis.:wq

--4L9gi5aM8FSFnIIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXndWgAKCRB4tDGHoIJi
0iCLAQClOkC/ciob6Ansbhsbnv/f61iWTxGEI3jkSQ7cRWPsTgEAmuoWCDNApKzV
SQLPa7fNyKAA6scBpe1/INPPGNoU8Qs=
=ygGO
-----END PGP SIGNATURE-----

--4L9gi5aM8FSFnIIA--

