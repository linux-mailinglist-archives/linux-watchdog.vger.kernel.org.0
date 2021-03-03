Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F6C32C89D
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 02:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241843AbhCDAvk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 19:51:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43408 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387635AbhCCTea (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Mar 2021 14:34:30 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1509A1C0B88; Wed,  3 Mar 2021 20:31:35 +0100 (CET)
Date:   Wed, 3 Mar 2021 20:31:34 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Message-ID: <20210303193134.GB8720@amd>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-3-henning.schild@siemens.com>
 <20210302205452.GA32573@duo.ucw.cz>
 <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +static struct simatic_ipc_led simatic_ipc_leds_io[] =3D {
> > > +	{1 << 15, "simatic-ipc:green:run-stop"},
> > > +	{1 << 7,  "simatic-ipc:yellow:run-stop"},
> > > +	{1 << 14, "simatic-ipc:red:error"},
> > > +	{1 << 6,  "simatic-ipc:yellow:error"},
> > > +	{1 << 13, "simatic-ipc:red:maint"},
> > > +	{1 << 5,  "simatic-ipc:yellow:maint"},
> > > +	{0, ""},
> > > +}; =20
> >=20
> > Please use names consistent with other systems, this is user
> > visible. If you have two-color power led, it should be
> > :green:power... See include/dt-bindings/leds/common.h .
>=20
> Well we wanted to pick names that are printed on the devices and would
> like to stick to those. Has been a discussion ...
> Can we have symlinks to have multiple names per LED?

No symlinks. We plan to have command line tool to manipulate LEDs,
aliases might be possible there.

> How strong would you feel about us using our names?

Strongly. :-)

Do you have a picture how the leds look like?

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA/5BYACgkQMOfwapXb+vIK9wCfQwnYrmkVRInVpriJCbZaZoMW
uVcAn0kh4wxyuJCBuz8Fi4tylz+NNX38
=INzV
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
