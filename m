Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64AA23971C
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 22:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfFGUzr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 16:55:47 -0400
Received: from sauhun.de ([88.99.104.3]:45984 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729891AbfFGUzr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 16:55:47 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 4742B3E43BA;
        Fri,  7 Jun 2019 22:55:44 +0200 (CEST)
Date:   Fri, 7 Jun 2019 22:55:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: support handover from
 bootloader
Message-ID: <20190607205543.GA957@kunai>
References: <20190415105201.2078-1-wsa+renesas@sang-engineering.com>
 <20190524135237.GC15892@kunai>
 <20190607204111.GA19123@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20190607204111.GA19123@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The usecase I had in mind ("give the kernel <x> seconds to boot into
> > working userspace") seems to be achieved by loading the WDT driver as a
> > module then, I guess?
> >=20
>=20
> Would
> https://lore.kernel.org/linux-watchdog/20190605140628.618-1-rasmus.villem=
oes@prevas.dk/
>=20
> solve your use case ?

Yes, it would. Thanks for the pointer! I missed the
"handle_boot_enabled" parameter, too, for some reason. I think this
could also be enough for some scenarios.

As a result, it seems it makes sense to respin my patch, and test it
with "handle_boot_enabled" and the patch series you were pointing out.

I'll try to get this done within the next two weeks.

Thanks again!


--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz6z0sACgkQFA3kzBSg
Kbb0ORAApbdwUuNxLYlPqM5NrLK6vdEx54x7pDnRCWlbPStNHyYXe/KeP+67kcJt
Zixh6h6IxD7oMCGtL/KClaJszIDx5wt8L6kqt2yiF+Kj1c7M4cPLrbVvGVoF8IDf
Ywc5IbVcIlwet1Kp6fxMSNuKKetVldjG5r+/iIFGb6YmvPCzJ0iHR7XqI1MO3Z2j
aH5rmwMaXLziDom4Ee6hHhbNXLdDdSKUTRLW0eo7p09DHR1fgqhDPiIniwaTnW2T
sVjsFKYokRq7vlixG7YPVF9zZvYgrQFltcCOE4vaZ868WOmHth9nf94hwzY0yYYI
88OJS+noWzmDoc0g58Uvbp7/O0DJpfApl+BnIjooxOAn5rCatmHnR3KY+kITYPeH
UBL9Ga0WRt/cEDmCTXAXFG+PmmlJIzW+RE1QskvOycJQ9r43zQ49Uu7/dLUTLlsm
4UwF3TltkCaZH3O+3jrectA+c7+N+deU+pWuEaVtn1vsAcH9qHeBBqTcraffndfb
SLiSqVqYPuv3qUGNUKO5kF9Jt+o2oP8R60FMQlhDNUe8AHAnugaw2XWXHnwAr+00
OFWBHqCndMER+QlTkzMQn3uEWoevwrYOZtFUsvLctzaMFCORO4++D9vR7eW3MoDl
SHgEWC3Q0qJCMr81ckul04cPsKSA+L84dXWUSygHbZAoCxIbME4=
=VafG
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
