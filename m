Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64BB129967
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2019 15:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403894AbfEXNwk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 May 2019 09:52:40 -0400
Received: from sauhun.de ([88.99.104.3]:35754 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403843AbfEXNwk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 May 2019 09:52:40 -0400
Received: from localhost (p5486CF38.dip0.t-ipconnect.de [84.134.207.56])
        by pokefinder.org (Postfix) with ESMTPSA id 1746D2C018F;
        Fri, 24 May 2019 15:52:38 +0200 (CEST)
Date:   Fri, 24 May 2019 15:52:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: support handover from
 bootloader
Message-ID: <20190524135237.GC15892@kunai>
References: <20190415105201.2078-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline
In-Reply-To: <20190415105201.2078-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 12:52:01PM +0200, Wolfram Sang wrote:
> Support an already running watchdog by checking its enable bit and set
> up the status accordingly before registering the device.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

After second thought, I am getting confused a little. If the WDT is
already running then

a) before this patch: after successful probe, RPM will disable the
clock until userspace opens the watchdog device

b) after this patch: during probe, our default timeout will be
programmed and because of WDOG_HW_RUNNING, the core will generate pings
until userspace opens the watchdog device.

So, b) will protect from a crashing kernel (no pings anymore) but not
=66rom something like missing rootfs, or?

The usecase I had in mind ("give the kernel <x> seconds to boot into
working userspace") seems to be achieved by loading the WDT driver as a
module then, I guess?


--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzn9yEACgkQFA3kzBSg
KbaoxxAAmNzBr8nIyVpn4VwsM+e96vdFObgJ4pbSmrHNVlf11gMTd1Db21Fqxpjn
4uMiX8v/ArbG334+6aVj+qlJ5rD1nwuRsnchQzOgMbDkSL1kH3+e2Rc3cSwqu8A/
WKf1Fgr0w8AQxEDZLYKFigOLL8uAaC6gV+g/pNg5AUPXSaqu2DIqXYBn+vvUNy1k
PH9T52wwM6MLvlfj/LfBJ7vYqknzoj8CvSybIxqnVS5jtILzGtnmGNxXqxtbNoQp
LTdoDbcFDbIPvE7nRR8XhjFIuoWCYY6Cy7byw/6WXE9sFDF9B7K8ml3zdeiYDp0i
UOrggMJsXbomDjq0qVI3zmsaTB5qQDW1LCD0nD8yDnVmZOO7WItsh2zfefUP1Avd
ivPvcR5/XSNPq+5JgnSAGhK4ha9CHsHG/6raS/Zwjeka2DF82mgWUGV+7qGtzumY
Ldvo50/7CDoaWS9Md5oBHyrEGX/tugnU3Mtv+0jbziu5UKzMiuhbQ0OhwZqjgKGk
Rvny6OOg4/pCeYOm3kJfhEc0CysxKcY+2NveP8azZc+pRsKEWvCtYLG1cRo5QSID
ul3U8ICiTOYuwU8yBPbLfJgqJOCGRUgU4Vhkp18CfLXRy4/kkt1F2AW8kPambG2H
INYmYJ56tk+Z9U1QAKx57H+SXM6TCTcXHdocnEzUGdSf0jIXCMg=
=bUm+
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
