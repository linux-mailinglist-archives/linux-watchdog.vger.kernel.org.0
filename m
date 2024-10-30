Return-Path: <linux-watchdog+bounces-2383-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 647259B5FCC
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2024 11:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E7E28474A
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2024 10:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BD61E260B;
	Wed, 30 Oct 2024 10:13:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675113CF82
	for <linux-watchdog@vger.kernel.org>; Wed, 30 Oct 2024 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283211; cv=none; b=IxbMSqJlPU7CLJdPQYagmEs+RNeXLhv44RVVWPSw5nrdMe8ClRuytu9/Igx4Cmj6cq7Y9LJWpBdq+IPO0UAU/ViWfltG4nqZeLI6kE1szwcf021rofliLud5/6nkuUI/9nj0V4mxQgb0FL2B8qigPBsqiF/bh7Iq/RmuMMgtluA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283211; c=relaxed/simple;
	bh=d5UJW7t9fo/lwYCkIPNEd46l8GiWAIsHzZ3+8jA04tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCWGSOT+ZlAxlIq7kxpOyeza/2jM+osU9zDQ8hOdVB0N+xpfLhh9ogxWey6DHEqkMQd9RjPbiXJRQoqy2z4YW//XvFzt0IgUQmhYHTit7w/hl0uM512OKcUs5c4iqgblfh2SEQWbEqoxpIdwrfvMNAzyZb/NUkgcIOF3MUjbEhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t65h1-0001bM-Mj; Wed, 30 Oct 2024 11:12:47 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t65gx-001B9S-3A;
	Wed, 30 Oct 2024 11:12:44 +0100
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 837433622F0;
	Wed, 30 Oct 2024 10:12:43 +0000 (UTC)
Date: Wed, 30 Oct 2024 11:12:43 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
Message-ID: <20241030-industrious-sidewinder-of-strength-efbe4a-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
 <CAOoeyxV4K=jR+tofeQtsMB7+smuu+Ghas5Tqfx4JvhuVK8dXrA@mail.gmail.com>
 <20241025-modest-hasty-angelfish-1e9193-mkl@pengutronix.de>
 <CAOoeyxU9VwsM=mRZy5AtjH=V3iSGQxkKw18qL+yeUxkh1OVHgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="frl5xcswfbpqjn4v"
Content-Disposition: inline
In-Reply-To: <CAOoeyxU9VwsM=mRZy5AtjH=V3iSGQxkKw18qL+yeUxkh1OVHgQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org


--frl5xcswfbpqjn4v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
MIME-Version: 1.0

On 30.10.2024 16:30:37, Ming Yu wrote:
> I am trying to register interrupt controller for the MFD deivce.
> I need to queue work to call handle_nested_irq() in the callback
> of the interrupt pipe, right?

I think you can directly demux the IRQ from the interrupt endpoint
callback. But handle_nested_irq() only works from threaded IRQ context,
so you have to use something like generic_handle_domain_irq_safe().

Have a look for how to setup the IRQ domain:

| drivers/net/usb/lan78xx.c
| drivers/net/usb/smsc95xx.c

But the IRQ demux in the lan78xx only handles the PHY IRQ. The ksz
driver does proper IRQ demux:

| net/dsa/microchip/ksz_common.c

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--frl5xcswfbpqjn4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmciBpgACgkQKDiiPnot
vG8nUQgAjlFmdH0l/1kIMmisd2Oil+MBaXTjGPuahpQda7WUz6pZi56UHxgat+ZF
Hr/eYxOz73BjWGuXCp3FfL1Mqp5NY66h0ZYdjgItMGN/0Dic5naFg/RnfniUnSUE
rPYn+MI4K/R/n+O7ZFzg6LTU5isPKsCfmJhD1M4WXpd/QRX7Jv5yo6qdtlfwYFM2
sDX5CRR4iyfcdaM4kyF/JCfhlzYqDBEQG2tLdJfU8zlqm8SW+CNGLDs7uWOIguaA
SINbHFo2E4UONkdEhDkgn4seDDr4ykSKfazN/YbvhimF3862GtEUbeK7R8l8SJN6
r76RxQK4oMaCy7/ydWFpcaOqfWG4qA==
=BTYV
-----END PGP SIGNATURE-----

--frl5xcswfbpqjn4v--

