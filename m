Return-Path: <linux-watchdog+bounces-3822-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A57AFB0C1
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 12:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0C1C7A37EC
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 10:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0407B293C4D;
	Mon,  7 Jul 2025 10:07:49 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767CF295530
	for <linux-watchdog@vger.kernel.org>; Mon,  7 Jul 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882868; cv=none; b=SgO8O/1aarRXGYH3zzc4WlpKvCsLlV4xiAaVZ63Xx1EzCVnX1NJGa2CB1k5/1iQn1thfLspUaJODLzDoX98OGj04Qs5YUxQXIrcOwFdUDQXpDiMluYpe0Ox3uJs8TYFPmXVve/kRLxfJBeg3YGDiYKAoIIB55Nelb9voaGwRolU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882868; c=relaxed/simple;
	bh=FtQESEScKEGm4ZZCj0RN7mGsIyE/eoEObXJoSKFHpWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKu1qxN1+ADraT/wEyLgFBfJX/m+8xbvZxbrvFLpWfBsRN9LaeQf2N7qkAZpwenj9j0Wda20dFnFZSRZv4O4lD7OQSpXJeyNzlkgiIikRzEQRdqbL/Q/C2L+SNL49Sg6ivVXq0PKVYjaK9+NOoCl6L9BvVSMlCcH5DRR/kFbEBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uYikg-00055p-AG; Mon, 07 Jul 2025 12:07:10 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uYikc-007EDt-2n;
	Mon, 07 Jul 2025 12:07:06 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6B531439509;
	Mon, 07 Jul 2025 10:07:06 +0000 (UTC)
Date: Mon, 7 Jul 2025 12:07:05 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Ming Yu <a0282524688@gmail.com>, Lee Jones <lee@kernel.org>, 
	tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250707-new-psychedelic-termite-a309d3-mkl@pengutronix.de>
References: <20250627102730.71222-1-a0282524688@gmail.com>
 <20250627102730.71222-2-a0282524688@gmail.com>
 <20250702161513.GX10134@google.com>
 <CAOoeyxXWbjWvOgsSvXb9u2y6yFExq347ceZe96bm9w+GQAp2Rg@mail.gmail.com>
 <0360d2e0-e071-4259-a7c7-23c31e52e563@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kr6nkexyn6izj5au"
Content-Disposition: inline
In-Reply-To: <0360d2e0-e071-4259-a7c7-23c31e52e563@wanadoo.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org


--kr6nkexyn6izj5au
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 03.07.2025 11:44:27, Vincent Mailhol wrote:
> On 03/07/2025 =C3=A0 11:39, Ming Yu wrote:
> > Dear Lee,
> >=20
> > Thanks for your feedback and review.
> > Currently, the status of the sub-device drivers is as follows (A/R/T):
> >     [v13,1/7] mfd: Add core driver for Nuvoton NCT6694 (- - -)
> >     [v13,2/7] gpio: Add Nuvoton NCT6694 GPIO support (1 1 -)
> >     [v13,3/7] i2c: Add Nuvoton NCT6694 I2C support (1 - -)
> >     [v13,4/7] can: Add Nuvoton NCT6694 CANFD support (- 2 -)
>=20
> For the CAN driver, my Reviewed-by can be interpreted as an Acked-by :)

Feel free to interpret my my Reviewed-by as an Acked-by, too.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--kr6nkexyn6izj5au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmhrnEYACgkQDHRl3/mQ
kZz+HAgAo6jP3UtNysl6cnqkkovHfol1pDeGThMia/s6eTksN4DY0u5zqdBI03dN
dXpm+0P8HVf83Alft8JysqSicG3HxMbdHs8En1RAlkkWYlr/kkL8zfEM06mFYVdL
6EqNun8pwyIg9PrvRFwslkSTu6zKfqhafW8ouC9+65btTk0MG/AgbUgCLX2fe14v
5jBv/B8OS97ARLf8pGTDQDqO6vXO2imOkP3Td+Ik61oUgLiQhUxLQVR8RvDKbuEA
+iyqwWyWKsyoiF+0sU+mGLy0ejmuzh+PSvo19hzEE7ic08gZYvB4BA5pxljMiGAR
1NJdMVxN2BILPjtt1d6e95y9ZqFOiA==
=dD5C
-----END PGP SIGNATURE-----

--kr6nkexyn6izj5au--

