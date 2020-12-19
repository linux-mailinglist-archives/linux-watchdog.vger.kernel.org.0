Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93ED2DF0B0
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Dec 2020 18:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgLSRai (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 19 Dec 2020 12:30:38 -0500
Received: from www.zeus03.de ([194.117.254.33]:37500 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbgLSRai (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 19 Dec 2020 12:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Z6tZtYOMIO68S2OacNmHAMoRGJaF
        hZxDM1z+iFO6qyE=; b=z7zBnZnOmr+AaUfoxTK+//d+hT4qZC+wzYoOjzG8Sjc2
        qURr3fhsFPwM7wltbbIHvsOLtO47hQyqMeHRbqEK0xAcQLtwji0lpkjr0ovST+7u
        GVoYEvfAvbEtCXH4CtwNcqA+qZ/UGtwUXXGOJv8nYdPO+Eaw0y94y6UspWEL9aI=
Received: (qmail 4184351 invoked from network); 19 Dec 2020 18:29:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2020 18:29:56 +0100
X-UD-Smtp-Session: l3s3148p1@zdObktS2EKEgAwDPXyWnAP8QpIJSuVO+
Date:   Sat, 19 Dec 2020 18:29:52 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: don't sleep in atomic context
Message-ID: <20201219172952.GA15530@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20201002150944.9696-1-wsa+renesas@sang-engineering.com>
 <20201002164722.GA46009@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20201002164722.GA46009@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Convert usleep_range() to udelay() to avoid the bug. The downside is
> > busy looping when the watchdog is started or stopped (64us or 96us in my
> > case). However, this happens rarely enough, so it seems acceptable.
> >=20
> > Fixes: b836005b4f95 ("watchdog: renesas_wdt: Add a few cycles delay")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >=20
> > We could also add a new flag in the watchdog core "IS_RESTARTING" or
> > similar and check that in the driver. Depending on the flag, we use
> > udelay() or usleep_range(). Not sure, if this is feasible or
> > over-engineered, though. Looking forward for comments.
>=20
> Seems to be neither to me. I don't know if there are many drivers who sle=
ep
> in the stop function, but even if there are none (today) it would be a
> generic problem.
>=20
> On a side note, I am quite sure there is a system wide flag indicating
> that the system is rebooting. Maybe we can just use that ?

So, it took me a while to get back to this. Yes, we can use system_state
to determine which udelay to use. I am working on a helper for that.
However, as it turned out, this driver needs a different approach
because there were multiple issues with reusing the generic wdt-start
routine. Proper patch will come in some minutes.

Thanks for your input!


--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/eOIwACgkQFA3kzBSg
KbZhNQ//WVwjSDlA1PwTCJMyaGYmhncv0Tg42W8a1GOMmf53SIb4Vh9Bu+K4DGOh
2UKN2+CBZiDcJ1DwC+rVBHnYm9b/PCL7cmefkpyzZ0A+S/s8XRRrCGEJoGADwN2/
gQs1025OvyjDd4eh53vCA37YM+MByLYXYjj3lPXPoV8IJmcgTrbf3jcMXTN0IHsq
LSwZgs1Vk31S7njNWJUwMHgBrD9/nSRfTKhZRI4mlMty0ZKjLtURFzxjQgm18l4n
+b+tHZ9jVf3LkEboYWljP9R8JZFKVeCEuGk4ubXtDykOWvgwXksoylcwfX0XR3cL
EZU5h25kdhZqrbFkldEymes99hXoXr10XDPiJ/f31EAb2/BnK85smYoAi112qjpi
B15elmHt8aM+DVIUA1mBF9+g+pXg+RPdKgORUDEopbhZmXF7z882ALd2l+BbzqK9
wCFDhthz/hIS6rsGSXHZ8b9SjpcLOH3MD7B1s1SxZxTR9Q1XvsswRSl/soaLmB6L
qHOqLhatk5gutrgqwS2r067tJSoUmgU86fh655QBEQ78Tjy651R7bQROhlrbr2pQ
tL35yURnGpkfu57kWmctclYxPxKxrje0V9+KBIPzLaQm84LSc/LNes++e47tqu0X
0gQtcYG8lT6Zua3TCrS9KT3HeWPI1PpwkLW/EEFd0xduoS9es70=
=E9E2
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
