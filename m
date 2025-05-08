Return-Path: <linux-watchdog+bounces-3450-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 198ABAAFF00
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 May 2025 17:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AB12B42C63
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 May 2025 15:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC45A28030F;
	Thu,  8 May 2025 15:09:07 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEDE2144BF
	for <linux-watchdog@vger.kernel.org>; Thu,  8 May 2025 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716947; cv=none; b=LOOZN6NJsRs9w35ST0Ryk43U55C9LFoazrjR995M906Odwc5I07fFiKtFVBcI18G2G+WrjXO+g9oE6lVm/4OOyDM3SLq50Yy7EI9BKwGHVSIVnlj1U5dxhO9Jp658VyzFCAs5hE2sr27wuWXS9F7sJ6HoEbVgLgOkfgzvd3KQIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716947; c=relaxed/simple;
	bh=EUta3aTRjT21bXtQrcK4rhz7dH2rAHVXhefracRyNDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkGuMEArFUgo1vhsRj0c+LvG0sr0CdTjsxn76fsJLxwcWeDzxVVHQqjn/5OfY1g/QYagciiezxZ4UlPIsxMc+HdWrlCOnut/jCJUDECvkF0loJFRV6Y+WJ9QrWjRMVbfBi0xK/d8AYbcSDDk1YQUnbFMiG0gkhhVP9mC9qaXFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uD2rJ-0006ko-49; Thu, 08 May 2025 17:08:25 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uD2rG-001kE3-0o;
	Thu, 08 May 2025 17:08:22 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CA5A940BC73;
	Thu, 08 May 2025 15:08:21 +0000 (UTC)
Date: Thu, 8 May 2025 17:08:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250508-prudent-festive-puffin-83f666-mkl@pengutronix.de>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
 <20250423094058.1656204-5-tmyu0@nuvoton.com>
 <20250503-fulmar-of-sexy-upgrade-1184a7-mkl@pengutronix.de>
 <CAOoeyxWbr6jfZjPvYFD+vHKMZ9CpM6SLt+2xo-4E-NnhGinfvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkxqes6nz57lm4hv"
Content-Disposition: inline
In-Reply-To: <CAOoeyxWbr6jfZjPvYFD+vHKMZ9CpM6SLt+2xo-4E-NnhGinfvg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org


--fkxqes6nz57lm4hv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 08.05.2025 11:26:09, Ming Yu wrote:
> > > This driver supports Socket CANFD functionality for NCT6694 MFD
> > > device based on USB interface.
> > >
> > > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> >
> > The destroy functions nct6694_canfd_close() and nct6694_canfd_remove()
> > are not the exact inverse of their init functions. Se comments inline.
> >
> > Please fix and add:
> >
> > Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
> >
> > Feel free to mainline this patch as part of the series outside of the
> > linux-can-next tree. Better ask the netdev maintainers for their OK, to=
o.
> >
> > What about transceiver delay compensation for higher CAN-FD bitrates?
> > How does you device handle these?
> >
>=20
> In the CAN CMD0's DBTP field, bit 23 is the TDC flag, I will add
> support for enabling tdc, and firmware will automatically configure
> tdco. Do you think this approach is appropriate?

Can you configure the TDC manually via USB?

If the firmware does automatic TDCO configuration, does it take care of
not enabling TCDO if the Data-BRP is > 2?

BTW: What's the CAN clock of the device? I want to add it to the
can-utils' bitrate calculation tool.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fkxqes6nz57lm4hv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgcyNwACgkQDHRl3/mQ
kZzE7Af9FGhvmDVRrnQ/F4bSbWoG2NTq/f6c3fZSGEWA89N5tefMfjZvh7dlyYji
VaHiukxhQV4tR1h1zXxI/eZ9VQA3NyE5dv4XDcTtPDQILQ03+/sEQOOCSoI8Nb+d
1WJ6Wvj7apYZa6Qvl+s9K5JVrgaRiQOBFXeKIQYAqTaR0DpQ8nB0gYdClnRowTeB
gTYVRD/j3fNoE6Cm2DTMs/rzDxp57S/RTZTWuqpbo6i39xQZnv4c6IX6kRHS51Lg
pQQNi1JctlAO52n2YZnYbBVa3P6XM3f/qLDmL7PYzYFo4v5O19avY0wiuanBk+hK
wllO7zAOx6+Zxj0ABxJ9edXuP0H61g==
=EkV4
-----END PGP SIGNATURE-----

--fkxqes6nz57lm4hv--

