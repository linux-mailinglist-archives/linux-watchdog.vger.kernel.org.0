Return-Path: <linux-watchdog+bounces-4390-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF23BDB661
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 23:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDD624E6F0D
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 21:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ED424A046;
	Tue, 14 Oct 2025 21:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OGq5iQIP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1E2BE621
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476755; cv=none; b=F5SxQqYwYoK2RXtqPFQEk73n23EnAuem4ayiKuKR2z6S48BMSmF/+XjqQsCIndIsZBey/ugvH+gTqU52kdayh+EzwkjFyVaGPcRDJBzxucr5XMLobr0n1HxWuPbxkG2JThKv/ZnFKXpt0boBUJfmRTLDxTp22O/egbKcMy5RJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476755; c=relaxed/simple;
	bh=rtcWfF2CJG4UfdkStsN0qU40QNv2gyT4/cyk1CSmtPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeObfPS8IP1Fv9bKyCGt5exXzxeyFYdZ4hbpuTg9AjbmSy74h16gt8Nt/SoiC09BcgWe+MnVWSdkc4GiUoJMuaffhxJz5nIz+9uVIm89AJZjD9GJJoSk97ZDPedpsr41RiFtUqHQ0ZxGcr7h0TS1F23hpE5KMtSUwo8l0tRA5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OGq5iQIP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wie3
	0ewnpbJMhb/q5roHmb383cbBrWQqYoih5Xyva6Y=; b=OGq5iQIPOeSwEKgRF46O
	31/ihPW7aFs61CKnTOmCxIrf6KVsUJQn1kN5v2COkpjh9Vsic1ae7HveaqWsX97z
	H/B7/9AIuSsX4y2KJN53v3gIeEeKMVL7uyospCz35cUzFxsctFEIlkuMIdYi1Cmg
	6eIE49zZ3Ei7VtNXR1QoF4o7eerdIiZJkFBotoONrH126yIlBwQD+4T4wCqjzpLv
	yuNYbPMplcxdyULbfeY8yrIRtFgySde7J3/oBNT/NVG/H0FZPSjVJ4TXWkojkMGk
	lrVyFA2fsPWZA0jTPrw164fRNTGMKX9Fe0lz5gy/W97p87bzgNjYaW31b0K8g8L4
	zA==
Received: (qmail 3122260 invoked from network); 14 Oct 2025 23:19:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 23:19:08 +0200
X-UD-Smtp-Session: l3s3148p1@4wo37yRBPqMujnus
Date: Tue, 14 Oct 2025 23:19:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: renesas_wwdt: add driver
Message-ID: <aO6-S6uC1aEsAsNL@shikoro>
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
 <20251014112953.25712-6-wsa+renesas@sang-engineering.com>
 <9c1a61f6-f9aa-40b8-9578-adf0e443d790@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27Mnf2HWpD03QQ8E"
Content-Disposition: inline
In-Reply-To: <9c1a61f6-f9aa-40b8-9578-adf0e443d790@roeck-us.net>


--27Mnf2HWpD03QQ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

thanks for the fast review!

> > + * The WWDT can only be setup once after boot. Because we cannot know =
if this
> > + * already happened in early boot stages, it is mandated that the firm=
ware
> > + * configures the watchdog. Linux then adapts according to the given s=
etup.
>=20
> What if it didn't happen ? Is WDTA0OVF set to a reasonable default in tha=
t case ?

It will overflow pretty fast, but it will be in a working condition,
generally.

>=20
> > + * Note that this watchdog only reports an overflow to the Error Contr=
ol Module.
>=20
> Kind of unusual. Why not panic in that case, and why have the watchdog in=
 the first
> place ?

We have multiple WWDTs on the SoCs, namely as much as we have cores. The
idea is to utilize one per SoC. In normal configuration, the Error
Control Module (ECM) gets notified of overflows and will act
accordingly. It has more options than a reset, it can e.g. raise
dedicated pins to trigger actions. Sadly, we don't have a driver for ECM
yet upstream, but we need to start somewhere.

> > +	struct wwdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +
> Maybe use container_of() ?

Ok.

> > +static irqreturn_t wwdt_error_irq(int irq, void *dev_id)
> > +{
> > +	struct device *dev =3D dev_id;
> > +
> > +	dev_warn(dev, "Watchdog timed out\n");
>=20
> So the pretimeout may trigger a reboot (panic) if the pretimeout
> governor is set to it, but the real watchdog just says Hi.
> Does that really make sense ?

It depends on how the ECM is configured. It can make sense. If someone
misconfigures, it might not make sense. But maybe we just don't use
pretimeout here because for Linux this is system-wide while the WWDT
usually has a smaller scale?

Does this make it more clear?

Happy hacking,

   Wolfram


--27Mnf2HWpD03QQ8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjuvkcACgkQFA3kzBSg
KbY7Yw/8DGYhw3FNFL9Vd4OOLftEuySc+swrEjsGYk+aeLwCyke0kyl47nJrbzMb
UKkgcoTEB5j+/oGziwsImlFp3RtwjTSpSX+7QPQkEcSD1wMmLmzWKXYNhaf0u5XR
b8N/tnop1Bb1bSNqjhIzTuO8WBpcLblG7tvHSwnF41rbNUFh6/faI8ga86z8bzAL
1s+FwONGus1Ego9JEG9bT0Tk9xLK8D1NCOlW6Mt7VdvxcHBaJRfPaZMtOfXStoKb
wdmQKyAQE5QW8gx536AmmeoCU4CNczEX7gg49mUlqX/BkmUxxYikocE2RYGNCV91
bZK8O+NwXd3REi0Kn7B1NHilp2aufqjaqhC0RqrW7VFAxNxp8czh/D6ZxNolalu/
3JRHKA/rbHyEzIiiUIksG87WRa5IiAih2z8KtFPwNT3prmGL2ixZZKo7gsYGexkx
ERyOh/mu0MkpAsoW7W8K+Bhaz4d38UFcrNWonJrSX+/SV+T8ZzLq6nss3bph9sne
rXMwXeetGhbWjpmZkTm+6IKbm4IIprZEV/4KnmZi3pYNFttiuiIZ/KrYV1KAuN3g
sO3VsD4/zp35Vwucs8SVmJGYppciyauDC+JeKwS0pqZH/ZPm5ZvQfiK9IUqaGJkz
7OTKWfIUTxL+QTPgHhV+yg+ur5JmTZUvGb17T9lfIJHQQ5GX3Ng=
=Zs6O
-----END PGP SIGNATURE-----

--27Mnf2HWpD03QQ8E--

