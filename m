Return-Path: <linux-watchdog+bounces-1054-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 684658C0AC4
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2024 07:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3A76B227C1
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2024 05:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6664149004;
	Thu,  9 May 2024 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqZUvz5O"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5E148FFB;
	Thu,  9 May 2024 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715231298; cv=none; b=g/QgXwWvduHNFwktoELsyvrvJuVEiySxeK5q4OgNisrq45CJ+vGk1Gw5fYoB1lypS1kD/NAfyBnUzZn/IcAG05pmsQDkrOclwPPuN6ILDd67vLpvnCoIuzCCOSpsU12vHe00lSuueJHR+IGSZQ/JEklUW84Hhe74Twm6L+C51Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715231298; c=relaxed/simple;
	bh=S3wo7d6dVVVHJbHfUlKIIqEpnUYGY2iZwMogOjuJGx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbxQqzwcuAAcpVW+SyZr2GP81mXqH3fDOebXt+o3HPwcuHlWZniKiAQbOBSSGuOhoh+PrOx4r29s+MuXEmc+NoDHK4AEISnVwsWVZb8z74F3V0c2WPF8fMe18YW4/9FWfELZ19p5NpSEUnICK1bI/9fUChYn4G7s238RluMErfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqZUvz5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1BDC116B1;
	Thu,  9 May 2024 05:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715231298;
	bh=S3wo7d6dVVVHJbHfUlKIIqEpnUYGY2iZwMogOjuJGx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqZUvz5OrJ+ljxY18xYa63gis6+nDn5tcioIVdZDq8ho8RI6U5ijznAFS4hxiR60f
	 LfV01nYVRzdQrQ0ATJcuPgPXTssf30nrDmi/evBw6Q+CJtIeqM/88fb91zTjdr/8Po
	 q4uNnul58qGMheBbRlZ4cP0mGEPu+8G3zASJ8VF67CxTZxe8tyOdwdWdYKGe38Coyx
	 WdRBOZCE5XXrSxQI7wAyLPZmZHp50ejFkSlSjllcNKS/VX7Sq8XVvU21u5a1yPV+tx
	 b0KLCjIGyK7IN/xntAqgcFEvYqvZy+1uZrtL4PaHtIYT3XD7ZOx12YRQrux1z8hDv8
	 Od5H+knND8F8A==
Date: Thu, 9 May 2024 07:08:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 0/6] Support ROHM BD96801 scalable PMIC
Message-ID: <ZjxaP_BNWVufJb_X@finisterre.sirena.org.uk>
References: <cover.1712058690.git.mazziesaccount@gmail.com>
 <f7d454ac-6ecb-4431-a1de-c9b5d1240969@gmail.com>
 <eb03ec33-0627-4986-be04-8e35da390d6b@sirena.org.uk>
 <b6279be8-cf7d-4608-b556-3c01587f0d43@gmail.com>
 <f1e3d31d-8c24-4cdc-ae26-747f383a937b@gmail.com>
 <b6ded975-1d16-46ea-84a2-8799b36e1270@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/PL7cyDLGd10Dqzd"
Content-Disposition: inline
In-Reply-To: <b6ded975-1d16-46ea-84a2-8799b36e1270@gmail.com>
X-Cookie: Sorry.  Nice try.


--/PL7cyDLGd10Dqzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 22, 2024 at 01:52:27PM +0300, Matti Vaittinen wrote:
> On 4/5/24 12:19, Matti Vaittinen wrote:
> > On 4/4/24 16:15, Matti Vaittinen wrote:

> > > > I would expect each parent interrupt to show up as a separate remap_irq.

> > > > So if we arrange to supply a name when we register multiple domains
> > > > things should work fine?

> > After my latest findings, yes, I think so. How to do this correctly is
> > beyond me though. The __irq_domain_create() seems to me that the name is
> > meant to be the dt-node name when the controller is backed by a real
> > dt-node. Naming of the irq_domain_alloc_named_fwnode() sounds to me like

...

> If we wanted to support multiple HWIRQs / regmap-IRQ controller, it would
> require us to duplicate almost everything in the struct regmap_irq_chip for
> every new parent IRQ. The status/mask register information, IRQ type, etc.
> Naturally, it would require also duplicating lot of the data contained in
> the struct regmap_irq_chip_data. I am not sure if this could be done so the
> change is not reflected in the existing IRQ data initialization macros etc.
> Furthermore, some API changes would be required like changes to
> regmap_irq_get_domain().

I don't understand what the difficulty is here - we're creating multiple
interrupt controllers so I'd expect to have to have full definitions of
each, and since everything is referenced by name from the root
regmap_irq_chip which gets registered it's just a case of supplying
different names and all the helpers should be fine?

> Thus, forcing the regmap-IRQ to support multiple parents instead of having
> own regmap-IRQ instance / parent IRQ feels like fitting square item to a
> round hole. I am sure fixing all the bugs I caused would give donate a lot
> of EXP-points though :rolleyes:

Right, my suggestion is to register multiple regmap_irq instrances - one
per parent - and supply a name that allows all the display/debugfs stuff
that currently uses the dev_name() to deduplicate.  You'd end up
sticking -primary, -secondary or whatever name was supplied onto the
names we currently use.

> Another option I see, is trying to think if irq-domain name could be
> changed. (This is what the RFC v3 does, [ab]using the
> irq_domain_update_bus_token()). I was a bit put off by the idea of
> 'instantiating' multiple domains (or regmap-IRQ controllers) from a single
> node, but more I think of this, more I lean towards it. Besides, this is not

Yes, register mutliple controllers with different names.

--/PL7cyDLGd10Dqzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY8WjwACgkQJNaLcl1U
h9BlIgf/efaIkV0f4VqTTEAwN9jK2xqYQzUU/QYaEluaoaVtgKOVZ/Y2CA88QkDD
gOs5ZkvkmijhpvI96By0iwMdNHM7St2qpr+QBOrRx1eMEgffLgVTTQC3L3ob+N5e
/igyou5OM/aoQmqWKDpB3xbNrt3ALHZ5wkl4RM/bs3gKax7Nu2JuOTgK2LKqaVqL
H2zf8A3U1HILV+T9CLWeF0Hy6euF1CaZTaAAhgDNVoyOKbV4BvyjRqbenGsMhhAa
PjGnEt/d/o/zyZLwuIOz2ysbl0rsaW4RtK7zpTYFSjZFGCGlTCPWAfu1PrqD865l
Q4d3hwpxu39VfTyfjb6bZ7JLfMbQHQ==
=iZw5
-----END PGP SIGNATURE-----

--/PL7cyDLGd10Dqzd--

