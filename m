Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE51733B0D3
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 12:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhCOLTX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 07:19:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43934 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhCOLTS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 07:19:18 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 336A71C0B78; Mon, 15 Mar 2021 12:19:16 +0100 (CET)
Date:   Mon, 15 Mar 2021 12:19:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20210315111915.GA14857@duo.ucw.cz>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-3-henning.schild@siemens.com>
 <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       struct led_classdev cdev;
> > +};
> > +
> > +static struct simatic_ipc_led simatic_ipc_leds_io[] =3D {
> > +       {1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1" },
> > +       {1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1" },
> > +       {1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
> > +       {1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2" },
> > +       {1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
> > +       {1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3" },
>=20
> Can you use BIT() macro here? And can it be sorted by the bit order?

There's nothing wrong with << and this order is fine.

But I still don't like the naming. simantic-ipc: prefix is
useless. Having 6 status leds is not good, either.

> > +       struct simatic_ipc_led *led =3D
> > +               container_of(led_cd, struct simatic_ipc_led, cdev);
>=20
> One line?

80 columns. It is fine as it is.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYE9CswAKCRAw5/Bqldv6
8tJBAJ0QMrBemQByIk0eybhiAr+UntP9OwCeOLQPeLwTNXrHjtUcD1y+OCeIVgE=
=4CEG
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
