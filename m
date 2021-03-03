Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD4832C89F
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 02:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241832AbhCDAvk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 19:51:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:32854 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241641AbhCCRoY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Mar 2021 12:44:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F25D51C0B8E; Wed,  3 Mar 2021 18:40:40 +0100 (CET)
Date:   Wed, 3 Mar 2021 18:40:40 +0100
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
Message-ID: <20210303174040.GA3305@amd>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-3-henning.schild@siemens.com>
 <20210302205452.GA32573@duo.ucw.cz>
 <20210303183714.62c0f06f@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20210303183714.62c0f06f@md1za8fc.ad001.siemens.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > index 2a698df9da57..c15e1e3c5958 100644
> > > --- a/drivers/leds/Makefile
> > > +++ b/drivers/leds/Makefile
> > > @@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+=3D
> > > leds-turris-omnia.o obj-$(CONFIG_LEDS_WM831X_STATUS)	+=3D
> > > leds-wm831x-status.o obj-$(CONFIG_LEDS_WM8350)		+=3D
> > > leds-wm8350.o obj-$(CONFIG_LEDS_WRAP)			+=3D
> > > leds-wrap.o +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=3D
> > > simatic-ipc-leds.o =20
> >=20
> > Let's put this into drivers/leds/simple. You'll have to create it.
>=20
> Can you please go into detail why? We plan to add more devices in the
> future, which might in fact make this a little less simple. But we can
> discuss that when the time is right and start with simple.

There's already way too many drivers in the directory, and your driver
is very different from drivers for camera flash (for example).

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA/yhgACgkQMOfwapXb+vJwawCff7t7AFisGfmOn1cjlZXTC+KH
ZiYAni5b8V20pcW5uaex2w2HX/rRX3RA
=W9Dz
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
