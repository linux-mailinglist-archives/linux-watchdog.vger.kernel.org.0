Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DFD284A50
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Oct 2020 12:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJFK35 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Oct 2020 06:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFK35 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Oct 2020 06:29:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4591FC061755
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Oct 2020 03:29:57 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kPkEB-0002pn-7r; Tue, 06 Oct 2020 12:29:51 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kPkE9-0001fV-Pu; Tue, 06 Oct 2020 12:29:49 +0200
Date:   Tue, 6 Oct 2020 12:29:49 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [RFC] Using a watchdog as system reset
Message-ID: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xd3j2q4k5c5c4sfg"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--xd3j2q4k5c5c4sfg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have an i.MX25 system here with an external watchdog (using the
gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.

The problem with the unused imx2_wdt is that this usually provides the
restart handler and now a reboot ends with

	reboot: Restarting system
	Reboot failed -- System halted

until eventually the watchdog bites and resets the machine.

I imagine that this is a common enough issue to warrant a generic
solution. My suggestion is to formalize and implement something like:

	watchdog {
		compatible =3D "linux,wdt-gpio";
		...
		provide-system-reset;
	}

with the sematic of: "This is the dedicated mechanism to reset this
machine."

(OK, I could enable the imx2_wdt driver and make sure with some udev
magic that the gpio watchdog is the one being fed by userspace. But
having two watchdogs fills me with some trepidation.)

Having said that, I wonder what the typical restart callback does
different from setting the timeout to a minimal value, start it and then
maybe call delay() to not return until the watchdog triggers. At least
that's what I would do for a watchdog that doesn't provide an explicit
=2Erestart handler but has the provide-system-reset property.

In my eyes this is somewhat of a hardware property, but I can imagine
that others don't agree and argue this shouldn't go into the device
tree. @Rob: What is your position here?

Does this sound sane? Do we also need a property like
"no-provide-system-reset" to better maintain backward compatibility?
(which then would result in not registering the watchdog as reset
trigger even if the driver provides a .restart.)
Does someone know a better name for the property?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xd3j2q4k5c5c4sfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl98RxoACgkQwfwUeK3K
7Al+3Qf/ZCUOLg44Cg33EwF6u5IWJA3Ro+w+Z+wDjXFF5Mg/KVs1hyii8JMXL4mc
Jxyxoyu1QIbseYlx5lBRawY2bc+8FZ2vVEY8+lk57dedzVzbPli+eBvdafc5ygog
e0j5WxnvKkjDoLf1arwlhnoQA3AxLZ/zuXORsEvBgviiEWv/RRgdVxY504UHV/KF
0IchvTE+5wCKtx/uaTIPoQYLwHFrrSUGbd5TVlRk1F+gRBy5ysKtAcyTfb2DEUD0
Fht6LnLp6Ttha990OSCD1fTKB2+xa1PuY2S1+ft9iZszG7BBX7eTgv6SHZjUE9FP
LTagZz13j2gr50qr/lfRgJSqjBblvA==
=vsk+
-----END PGP SIGNATURE-----

--xd3j2q4k5c5c4sfg--
