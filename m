Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7161B6D22A
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jul 2019 18:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfGRQlG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Jul 2019 12:41:06 -0400
Received: from sauhun.de ([88.99.104.3]:45990 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfGRQlG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Jul 2019 12:41:06 -0400
Received: from localhost (p54B330C7.dip0.t-ipconnect.de [84.179.48.199])
        by pokefinder.org (Postfix) with ESMTPSA id 41ADC2C2868;
        Thu, 18 Jul 2019 18:41:04 +0200 (CEST)
Date:   Thu, 18 Jul 2019 18:41:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        "kernelci . org bot" <bot@kernelci.org>
Subject: Re: [PATCH] watchdog: digicolor_wdt: Remove unused variable in
 dc_wdt_probe
Message-ID: <20190718164103.GA849@kunai>
References: <20190709203409.117123-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20190709203409.117123-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 01:34:09PM -0700, Nathan Chancellor wrote:
> clang warns:
>=20
> drivers/watchdog/digicolor_wdt.c:121:6: warning: unused variable 'ret'
> [-Wunused-variable]
>         int ret;
>             ^
> 1 warning generated.
>=20
> It's unused now, remove it.
>=20
> Fixes: cdad26977e3f ("watchdog: digicolor_wdt: drop warning after registe=
ring device")
> Link: https://github.com/ClangBuiltLinux/linux/issues/591
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Oops, sorry for missing this. I wonder why buildbot neither did find
it... Anyway:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0woRsACgkQFA3kzBSg
Kbb09g//SoObFICctqrhEHVhQ753Wv3K79jfQPucvzg7oaXPMuJHWaBw4W3E/Z74
62+a4s0JcP8jlrvWuueOOv9ie/+gqHdfsPG8p6D36Zoq75EWztTbEOfEYosCoJEL
NbzaAq9oDIii6abqYH+dX/BbtX+ntHUfNhs8GJEILf7WPRCaUyG0Unz+rQCImqSJ
7UCy2xwvbvzX+2QNzkV1t2TSuyVsC8HclCR8qBeBtBJWSnRJlP5Vh7s1CJ9mEtxg
yikAfhJ4//1TWUsoBiAsX1eDiIVsE/nt00kAQseJGImpkKovTdqGHDz2gZVPuEcY
mA1xNmNnJDfuTSsgswj9N/yW8TWsEwF7Bp+ojdUv+UwL+g+sB/hixH+YU+GjoXt8
zahT66grEXNdyDmMj5Cu1SGEZCf4DbyiApRp8FJqziU3bqCpNckjZiDWbL+jwR+I
LTCyFeXuRHloBJqwsIfWn2cl4a27Y0k5kyy2UCjmm7ii0owDOok1+6846W83QL+Z
swU9vzfSJkRPYCZ2mXctDnjmij/JTIe5hkf6FrxVHd61f3Fu9Wd8yEC7cNWmLKct
WWZMG+4W/KyeN+JxfWgpAtGOHfePWaY9vuFfYM0S57o3ZHfLbpKKbbZ0S/mnZ/4X
EZ0q3uvD5SLzhZ5Jsbu/TwklkEpXKP5oSn52wlOD44eHmsynV+I=
=ZaSY
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
