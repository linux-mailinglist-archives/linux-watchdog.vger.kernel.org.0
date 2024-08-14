Return-Path: <linux-watchdog+bounces-1492-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737F951D88
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 16:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B901B1C2263D
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 14:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459DE1B3F3B;
	Wed, 14 Aug 2024 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhWcVm+h"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC91B3F37;
	Wed, 14 Aug 2024 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723646589; cv=none; b=DwH0BKmLt8fqPdsNhrUj9Q3XS0w0OuoWeV/A841+V37g54wSdy+39g3mSTHsh1fpIZItrhesqtIvk7ZjSuUnG9yaTPUeAX1d8f5NUV1GH8MuC8wF3nJlOmpgDn4GSCjZqbpQBH9D3GQH/exD6Xz1tz/itc20iOM3zAwxPD6ez/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723646589; c=relaxed/simple;
	bh=x7fPL+bwLSTy0AhoWvi8WRA52g+funPHmtROdmC9cHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYIPaSKt3kIVeCTRjgkZUaeL2UCQptyNdl3AYpGrc+JIqcpyy7UlIgtsUYOoQRxIdND9IF+GnYb3xe8GMqSuqH3gg1MTgGwKynWJLLPI45OPMDub4cbY/jhm0Rnx81VJSMqinlSGoe6QdOy87v9VqkGUuAXLcd+ZuG/Hy/ySrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhWcVm+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9235AC32786;
	Wed, 14 Aug 2024 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723646588;
	bh=x7fPL+bwLSTy0AhoWvi8WRA52g+funPHmtROdmC9cHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhWcVm+hYgd4TspJLkG6ywlJGj+41jj0M8iqAHmFQ+yAjzFMgKasJ/iMT1CU4FHZm
	 IwiEw9ahgYmLneFzD6qc4y6tARjw/tu0Kwh/NVuB5zaJ1J9dcU6DAxgj+yQv63dXPH
	 hcrai/pnLAVRYHdrCJPliKNemphefKwfTwR613dDSvXfO5M//kJRELNv2RTqqbsvng
	 WoZgXx7kSnjXa2D7A1HzqCuwBSksNSgTyAvT4A1MGNkDEfaqEBARac69YdxdR3BFf0
	 ubpaeJKCJ9uTs08/UZDyz6/AlBgoBvKrCqX1fPOaWMWpPsXfo9BtjNsKetM2WzHGZ0
	 25Z/MGq/AgIQA==
Date: Wed, 14 Aug 2024 15:43:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: convert ziirave-wdt.txt to
 yaml
Message-ID: <20240814-fragment-stegosaur-9e143e30e0f0@spud>
References: <20240812162810.3812802-1-Frank.Li@nxp.com>
 <20240813-trodden-paprika-b2c95d1d265d@spud>
 <ZruKpJ08abhe9nwV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kyRXdmJoyeqQbhA7"
Content-Disposition: inline
In-Reply-To: <ZruKpJ08abhe9nwV@lizhi-Precision-Tower-5810>


--kyRXdmJoyeqQbhA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 12:32:36PM -0400, Frank Li wrote:
> On Tue, Aug 13, 2024 at 05:09:52PM +0100, Conor Dooley wrote:
> > On Mon, Aug 12, 2024 at 12:28:09PM -0400, Frank Li wrote:
> > > Convert ziirave-wdt.txt to yaml format.
> > >
> > > Additional change:
> > > - Add i2c node in example.
> > > - Add ref to watchdog.yaml
> > >
> > > Fix below warning:
> > > arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@3=
0800000/i2c@30a40000/watchdog@38:
> > > 	failed to match any schema with compatible: ['zii,rave-wdt']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change from v1 to v2
> > > - add ref watchdog.yaml
> > > - Remove timeout-sec
> > > ---
> > >  .../bindings/watchdog/zii,rave-wdt.yaml       | 47 +++++++++++++++++=
++
> > >  .../bindings/watchdog/ziirave-wdt.txt         | 19 --------
> > >  2 files changed, 47 insertions(+), 19 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/zii,ra=
ve-wdt.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/ziirav=
e-wdt.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.=
yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
> > > new file mode 100644
> > > index 0000000000000..0206d9ddf872d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
> > > @@ -0,0 +1,47 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/watchdog/zii,rave-wdt.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Zodiac RAVE Watchdog Timer
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> >
> > When you're converting bindings, listing yourself as the maintainer only
> > really makes sense if you know/care about the hardware IMO.
>=20
> I faced this problem. I am not sure who I can put as maintainer. How to
> decide binding doc maintainer? same as driver maintainer?

Same as the driver maintainer is usually the way to go, yeah.

--kyRXdmJoyeqQbhA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrzCeAAKCRB4tDGHoIJi
0qejAP4uXSfpi6LFppWMWwl6LOta2Y24Jt4g/qINXUyyTi73zAD/VlvcoLmO2l9L
QyYf22aNJfoiRDS/ZySQNEEmFip23gA=
=80iV
-----END PGP SIGNATURE-----

--kyRXdmJoyeqQbhA7--

