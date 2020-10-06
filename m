Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205CD2851C9
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Oct 2020 20:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgJFSlk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Oct 2020 14:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgJFSlj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Oct 2020 14:41:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CDFC061755
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Oct 2020 11:41:39 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kPrtz-0005tA-HR; Tue, 06 Oct 2020 20:41:31 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kPrty-0002dP-9P; Tue, 06 Oct 2020 20:41:30 +0200
Date:   Tue, 6 Oct 2020 20:41:30 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [RFC] Using a watchdog as system reset
Message-ID: <20201006184130.r2lajves5l7lm2qk@pengutronix.de>
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
 <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
 <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ya6u7uqnzt63dfrm"
Content-Disposition: inline
In-Reply-To: <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--ya6u7uqnzt63dfrm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Tue, Oct 06, 2020 at 07:29:11AM -0700, Guenter Roeck wrote:
> On 10/6/20 4:56 AM, Guenter Roeck wrote:
> > On 10/6/20 3:29 AM, Uwe Kleine-K=F6nig wrote:
> >> Hello,
> >>
> >> I have an i.MX25 system here with an external watchdog (using the
> >> gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.
> >>
> >> The problem with the unused imx2_wdt is that this usually provides the
> >> restart handler and now a reboot ends with
> >>
> >> 	reboot: Restarting system
> >> 	Reboot failed -- System halted
> >>
> >> until eventually the watchdog bites and resets the machine.
> >>
> >> I imagine that this is a common enough issue to warrant a generic
> >> solution. My suggestion is to formalize and implement something like:
> >>
> >> 	watchdog {
> >> 		compatible =3D "linux,wdt-gpio";
> >> 		...
> >> 		provide-system-reset;
> >> 	}
> >>
> >> with the sematic of: "This is the dedicated mechanism to reset this
> >> machine."
> >>
> >=20
> > Some systems have more than one means to reset it, which is why
> > restart handlers have a priority. This in turn suggests that we should
> > maybe have a means to set that priority dynamically for the imx2_wdt dr=
iver
> > (or for watchdog drivers in general) instead of having it fixed at 128.
> > That would also solve your problem, assuming there is a different
> > (currently lower priority) means to reset the hardware in your system.
> >=20
> > Alternatively, can't you just blacklist the imx2-wdt driver ?
>=20
> After having another couple hours of sleep and a coffee, I wonder if
> this is already done, and the reboot just fails _because_ the imx2_wdt
> is _not_ loaded. Is that the case ?

Right, I disabled the imx2_wdt driver.
=20
> If so, it looks like you want the reset functionality of the imx_wdt driv=
er
> but not its watchdog functionality.

My thought was to use the gpio-watchdog as reset source, but using the
imx-watchdog only for reset but not watchdog is an obvious alternative I
didn't think about.

So I either want to make the gpio-watchdog provide a restart handler or
use the imx-watchdog driver to only provide a restart handler (but no
watchdog functionality).

> And the above would be a suggestion to add a "generic" restart
> functionality into the watchdog subsystem, one that uses a watchdog
> with minimum timeout to reset the system, even if its driver doesn't
> explicitly register a restart handler.  Is that what you are trying to
> suggest ?

Yes, every watchdog could provide a restart handler with just using the
watchdog callbacks.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ya6u7uqnzt63dfrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl98ulYACgkQwfwUeK3K
7AkygAf+OEk6ImbusYPd6Jvwhg3R3F+0IayvpjxUYq+kpknUgisrU5gp+HE1p7CI
3+OviwFD5E4Tj33n6Qgi/EhO1ZEIQCxiTSqJ0siVNb/dfnp1eQTgiZzs8NmcSbfs
3hGihUKPUOP0XQn7T3MSwvIXS8BBg4op2KOk64RPDchoQD97bNHZBbSu6AjUMMHD
cLhI7+eAjFwU6aRSTJuospzB4NtdrYOEWtUGDVpWJHmfhePsf1vBgCDCRhzMMA0f
6spnMRCXJesNvxOFaetaEoqDVdaBBYS5ZlwVex6jQeYIONa/fyde6K2J6ax+74Yt
qvX6UNg/weHPMA0TGBsToOurhXJyCw==
=7F4A
-----END PGP SIGNATURE-----

--ya6u7uqnzt63dfrm--
