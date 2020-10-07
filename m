Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDB5285917
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Oct 2020 09:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgJGHMl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Oct 2020 03:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbgJGHM2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Oct 2020 03:12:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8F5C0613D3
        for <linux-watchdog@vger.kernel.org>; Wed,  7 Oct 2020 00:12:28 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kQ3cd-0003Ue-VK; Wed, 07 Oct 2020 09:12:23 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kQ3cc-0005VE-De; Wed, 07 Oct 2020 09:12:22 +0200
Date:   Wed, 7 Oct 2020 09:12:22 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC] Using a watchdog as system reset
Message-ID: <20201007071222.pnftcuezlricotq3@pengutronix.de>
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
 <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
 <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
 <20201006184130.r2lajves5l7lm2qk@pengutronix.de>
 <c989af68-fa7b-e6cb-9306-a5f2e196fb20@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bjndx5i67lt63tje"
Content-Disposition: inline
In-Reply-To: <c989af68-fa7b-e6cb-9306-a5f2e196fb20@roeck-us.net>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--bjndx5i67lt63tje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Tue, Oct 06, 2020 at 02:04:10PM -0700, Guenter Roeck wrote:
> On 10/6/20 11:41 AM, Uwe Kleine-K=F6nig wrote:
> > Hello Guenter,
> >=20
> > On Tue, Oct 06, 2020 at 07:29:11AM -0700, Guenter Roeck wrote:
> >> On 10/6/20 4:56 AM, Guenter Roeck wrote:
> >>> On 10/6/20 3:29 AM, Uwe Kleine-K=F6nig wrote:
> >>>> Hello,
> >>>>
> >>>> I have an i.MX25 system here with an external watchdog (using the
> >>>> gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.
> >>>>
> >>>> The problem with the unused imx2_wdt is that this usually provides t=
he
> >>>> restart handler and now a reboot ends with
> >>>>
> >>>> 	reboot: Restarting system
> >>>> 	Reboot failed -- System halted
> >>>>
> >>>> until eventually the watchdog bites and resets the machine.
> >>>>
> >>>> I imagine that this is a common enough issue to warrant a generic
> >>>> solution. My suggestion is to formalize and implement something like:
> >>>>
> >>>> 	watchdog {
> >>>> 		compatible =3D "linux,wdt-gpio";
> >>>> 		...
> >>>> 		provide-system-reset;
> >>>> 	}
> >>>>
> >>>> with the sematic of: "This is the dedicated mechanism to reset this
> >>>> machine."
> >>>>
> >>>
> >>> Some systems have more than one means to reset it, which is why
> >>> restart handlers have a priority. This in turn suggests that we should
> >>> maybe have a means to set that priority dynamically for the imx2_wdt =
driver
> >>> (or for watchdog drivers in general) instead of having it fixed at 12=
8.
> >>> That would also solve your problem, assuming there is a different
> >>> (currently lower priority) means to reset the hardware in your system.
> >>>
> >>> Alternatively, can't you just blacklist the imx2-wdt driver ?
> >>
> >> After having another couple hours of sleep and a coffee, I wonder if
> >> this is already done, and the reboot just fails _because_ the imx2_wdt
> >> is _not_ loaded. Is that the case ?
> >=20
> > Right, I disabled the imx2_wdt driver.
> > =20
> >> If so, it looks like you want the reset functionality of the imx_wdt d=
river
> >> but not its watchdog functionality.
> >=20
> > My thought was to use the gpio-watchdog as reset source, but using the
> > imx-watchdog only for reset but not watchdog is an obvious alternative I
> > didn't think about.
>
> It isn't really something I would have thought to ever be relevant: If
> a watchdog can be used to reset the system, and that method to reset
> the system is known to work and supposed to be used, why not use it as
> system watchdog ? So that use case is quite odd, especially since the
> watchdog on that system can apparently be used to trigger an external
> pin.

The motivation to use the external watchdog is that access to the MRAM
only works if the external watchdog is active. And (if I'm well
informed) this external watchdog was introduced because of some
regulation stuff where it must be guaranteed that there is a watchdog.
With an external watchdog this is much easier to do than with an SoC
internal one.

And then because using two watchdogs is ugly disabling the internal one
was straight forward even though it works just fine (apart from enabling
access to the MRAM).

> If we assume that there was a reason for not using the SoC watchdog,
> we must also assume that using it to reset the system does not really
> work (otherwise, what would be the point of having a separate gpio
> based watchdog in that system ?).
>=20
> With that in mind, your other option kind of makes sense. The only
> question would be how to express this in devicetree. I am certainly
> open to accepting a patch introducing such a property/functionality
> into the watchdog core.

OK, will try to come up with a patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bjndx5i67lt63tje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl99alMACgkQwfwUeK3K
7Am5mAf/b8j724HIwFsKOg21Bd7xjzF9gZV6QtjaxSsReitCRVq3ORpVJq3uDYyt
DeEb51/BFh6OQKu8s/EkYA325fGnhtWvSko/9hp9ZrJoDa6q//uCtEHuplZGaQq2
24ExMFVlDwLlL2Zl2r+lR/PiaEWg8nhkRzloFYsdy9n5EJ9eL3NbIFjOCuJdFKkS
8iL7xnbuPJj+aoewDsNNZuu7rLWUx1vzUVfJp4vjq4ls84oLhoTGz7hmnktmz/W/
s5H4T9/QQao2XL7py5d0Mb5H1IlbYpNKMqs3+NzNOrlOBPloq9urXTGtIrEg2NB3
Hrf+nZY+WZZqbc/tYkXomgas5kQ+ig==
=Zziv
-----END PGP SIGNATURE-----

--bjndx5i67lt63tje--
