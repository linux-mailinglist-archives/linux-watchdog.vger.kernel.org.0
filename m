Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8295832B560
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Mar 2021 08:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbhCCHAH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 02:00:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:36108 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381321AbhCBU4Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Mar 2021 15:56:16 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0F40C1C0B81; Tue,  2 Mar 2021 21:54:53 +0100 (CET)
Date:   Tue, 2 Mar 2021 21:54:52 +0100
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
Message-ID: <20210302205452.GA32573@duo.ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-3-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <20210302163309.25528-3-henning.schild@siemens.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.

Ok.

> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2a698df9da57..c15e1e3c5958 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+=3D leds-turris-omnia=
=2Eo
>  obj-$(CONFIG_LEDS_WM831X_STATUS)	+=3D leds-wm831x-status.o
>  obj-$(CONFIG_LEDS_WM8350)		+=3D leds-wm8350.o
>  obj-$(CONFIG_LEDS_WRAP)			+=3D leds-wrap.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=3D simatic-ipc-leds.o

Let's put this into drivers/leds/simple. You'll have to create it.

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

Remove?

> +static struct simatic_ipc_led simatic_ipc_leds_io[] =3D {
> +	{1 << 15, "simatic-ipc:green:run-stop"},
> +	{1 << 7,  "simatic-ipc:yellow:run-stop"},
> +	{1 << 14, "simatic-ipc:red:error"},
> +	{1 << 6,  "simatic-ipc:yellow:error"},
> +	{1 << 13, "simatic-ipc:red:maint"},
> +	{1 << 5,  "simatic-ipc:yellow:maint"},
> +	{0, ""},
> +};

Please use names consistent with other systems, this is user
visible. If you have two-color power led, it should be
:green:power... See include/dt-bindings/leds/common.h .

Please avoid // comments in the code.

> +module_init(simatic_ipc_led_init_module);
> +module_exit(simatic_ipc_led_exit_module);

No need for such verbosity for functions that are static.

> +MODULE_LICENSE("GPL");

GPL v2?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYD6mHAAKCRAw5/Bqldv6
8jccAKCW5J5k8GW26pDj+wn7z3ClTwgz9gCdG2YoZJI2nYD8w2mz8d3Xbt3YS1w=
=iNci
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
