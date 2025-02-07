Return-Path: <linux-watchdog+bounces-2857-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6764A2C7E8
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2025 16:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267F23A4AE2
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2025 15:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DDC23C8B1;
	Fri,  7 Feb 2025 15:51:58 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F123C8A8
	for <linux-watchdog@vger.kernel.org>; Fri,  7 Feb 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943518; cv=none; b=H2J4wst9j/Y17QUfYJCHZ702yboSP5LqE8f4/cZCtz+LRAHD0Y8y+zClrLMShZNNouiDtYv5/RV17LI0iFxnwQIZNl4y3pmxRFTKVB6zrE58mKH/+RmZjgLTdGaqrVrCf3Jlswd0U/QdwUYRI0O/F3lP8lzpOryiBBC1X+neUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943518; c=relaxed/simple;
	bh=FYBzQWrbc5BZbG36FmSxvb/yRkK3m4dSs/j7WyRK1LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAMEAoAoxTHIykdTJOfmCFY9rJsuHuWgX9dowaZhgSrLLN6qbYXauDdVeFXk1r7R6KxUkI1bLXi25vRWj5cx0rffNnk71PnmGGQgxXgDoleQhv8qdRpWsskaUBiO/tDe5+msAHdbzgdFgq/pVgV2ucD4sgZV+/O5ApJOl5IAWGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tgQdX-00035S-1R; Fri, 07 Feb 2025 16:51:23 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tgQdU-003zzi-0y;
	Fri, 07 Feb 2025 16:51:20 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DAB1B3BC4F8;
	Fri, 07 Feb 2025 15:51:19 +0000 (UTC)
Date: Fri, 7 Feb 2025 16:51:19 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250207-fair-active-robin-30025a-mkl@pengutronix.de>
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com>
 <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
 <9a3f1242-794e-41f1-80a5-bc6d18ff6641@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76ydemzthxfsfgeu"
Content-Disposition: inline
In-Reply-To: <9a3f1242-794e-41f1-80a5-bc6d18ff6641@wanadoo.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org


--76ydemzthxfsfgeu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 08.02.2025 00:00:43, Vincent Mailhol wrote:
> On 07/02/2025 at 21:15, Marc Kleine-Budde wrote:
> > On 07.02.2025 15:44:59, Ming Yu wrote:
>=20
> (...)
>=20
> >> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> >> +					  struct net_device *ndev)
> >> +{
> >> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> >> +
> >> +	if (can_dev_dropped_skb(ndev, skb))
> >> +		return NETDEV_TX_OK;
> >> +
> >> +	netif_stop_queue(ndev);
> >> +	can_put_echo_skb(skb, ndev, 0, 0);
> >> +	queue_work(priv->wq, &priv->tx_work);
>=20
> What is the reason to use a work queue here? xmit() is not a hard IRQ.
> Also, the other USB CAN devices just directly send the USB message in
> their xmit() without the need to rely on such worker.
>=20
> Sorry if this was discussed in the past, I can not remember if this
> question has already been raised.

AFAICS xmit uses nct6694_write_msg(), which uses several usb_bulk_msg(),
that can only be used from task context.

You can build a chain of usb_fill_bulk_urb(), usb_submit_urb(),
callbacks instead, but that's hard to read compared to blocking
usb_bulk_msg()s.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--76ydemzthxfsfgeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmemK/QACgkQDHRl3/mQ
kZwmeQf+K8g+Oy8vCIUI/Kice58VwDSu6EFa30wRLM0oqjCgE4LqXapNiSB1F8iJ
sDm2IyQER6qNYSLqzeZWG/bMyJwfHNpKjfXN3RImtyTXuN4nlvraaQabsV1bEY3y
rNGHojpZqxDXCb3Q9B5GLjNhdZldM4T+Xrs8gG+7Zv4jBxjNxn8J7Xz+1BpX3UqZ
ql8gENFEAe9nb6O5ODNVcGTnU+SzGWvy1VsEz23VcvXWEKbyyObvG+e0yUoYEi4y
s2MbMh1xxkTliIXn7GvqIdMj6/RSPo7xLoShAalHzurN1mey2u5PZfQapk718BEx
Wj/o/s1vTiX+qqRfcgpDz3UvoRZEtQ==
=0uK9
-----END PGP SIGNATURE-----

--76ydemzthxfsfgeu--

