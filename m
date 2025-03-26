Return-Path: <linux-watchdog+bounces-3153-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1ABA71D92
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 18:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A677189D3B3
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 17:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100B02405E0;
	Wed, 26 Mar 2025 17:42:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DAC23FC42
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Mar 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010929; cv=none; b=O79Qqv4Gx9PtgcQj9sHalxHaaneg5swcmjufMPw8KmzKQOZMAK9legibRRC6+zmLO2vHzQRdXSsGut7+cdMAT8JdAY8dxSakeDqHz6ebIHITiVZA21PxAPAT31cwUQMYOYHEzOjao0AeDud1X80QCWX94B11mHvG4+gjv28Qh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010929; c=relaxed/simple;
	bh=Z+kmXHGClhFpLj7Nta6mCo6WFt55JgT1HnxwLsMrksk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrLq+vhKfZouWJBWf4KEQWD1WrJSCgooeTvZRjnrLfWp8dznCG+UHVsb/rkiwfdY4fJMePWsKaTIGfZQbh5Mxp+lZ7lr0WZ7OLhtedYY+Ah0cCWc/PzLboNNsY789ANBQNp5u6bDoV1OC58HsxtLZFbJ7bTNhQbhXPFzIlOroVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1txUky-0001hP-Qx; Wed, 26 Mar 2025 18:41:36 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1txUky-001nIV-1O;
	Wed, 26 Mar 2025 18:41:36 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D680D3E7735;
	Wed, 26 Mar 2025 17:41:35 +0000 (UTC)
Date: Wed, 26 Mar 2025 18:41:35 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
 <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
 <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
 <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r56ki5hqfoc5hcq4"
Content-Disposition: inline
In-Reply-To: <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org


--r56ki5hqfoc5hcq4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 26.03.2025 10:27:03, Ming Yu wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:21=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > > > > +     priv->can.clock.freq =3D can_clk;
> > > > > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nomina=
l_const;
> > > > > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming_d=
ata_const;
> > > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_coun=
ter;
> > > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTI=
NG |
> > > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> > > >
> > > > Does your device run in CAN-FD mode all the time? If so, please use
> > > > can_set_static_ctrlmode() to set it after priv->can.ctrlmode_suppor=
ted
> > > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > > >
> > >
> > > Our device is designed to allow users to dynamically switch between
> > > Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> > > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supported, and
> > > can_set_static_ctrlmode() is not suitable in this case.
> > > Please let me know if you have any concerns about this approach.
> >
> > Where do you evaluate if the user has configured CAN_CTRLMODE_FD or not?
> >
>=20
> Sorry, I was previously confused about our device's control mode. I
> will use can_set_static_ctrlmode() to set CAN_FD mode in the next
> patch.

Does your device support CAN-CC only mode? Does your device support to
switch between CAN-CC only and CAN-FD mode?

regards,
Marc
--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--r56ki5hqfoc5hcq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfkPEwACgkQDHRl3/mQ
kZwXaAf/a0RArL3RY/rCsvGqnhAz/Nk1ljI1/sjXn6b6BRnEzwSev7b8LpGNMeTK
ygCzVEDcFHwfjhcV2/C2irc0XtxnLLmh3YqpNF54IY/vAAFDzqPGqzOHYPiOE+Al
ZFK6zjj26zmBDh011lfjyWk9EYvhDUfZNCUAX6N8Cdic+9wNGDiN9HKVfz6cUj9K
oGTTUPVTU0Nh7bwnuHLuj5IIruIQlTPH6w0Yd56Uv4TvGZ0cQ+S9hgGvY2J6v4f8
tdvZIe+xMQTR2d4kaK/HU+wA0iMdSoxKyu9sCszU3tWGH/Yb+UAF1/gcdc0f5Gk6
0X0j7uJgXLMbbdpHbsWypGiIkORpqQ==
=mUFO
-----END PGP SIGNATURE-----

--r56ki5hqfoc5hcq4--

