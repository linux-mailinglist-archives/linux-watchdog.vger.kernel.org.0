Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5792494967
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 18:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfHSQGd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 12:06:33 -0400
Received: from sauhun.de ([88.99.104.3]:53122 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbfHSQGd (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 12:06:33 -0400
Received: from localhost (p54B3355A.dip0.t-ipconnect.de [84.179.53.90])
        by pokefinder.org (Postfix) with ESMTPSA id 2A2C92C2868;
        Mon, 19 Aug 2019 18:06:31 +0200 (CEST)
Date:   Mon, 19 Aug 2019 18:06:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] watchdog: renesas_wdt: support handover from bootloader
Message-ID: <20190819160630.GA7590@kunai>
References: <20190818180007.2258-1-wsa@the-dreams.de>
 <7d1611dd-4f9f-6385-8454-22edf778d6e5@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <7d1611dd-4f9f-6385-8454-22edf778d6e5@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If the HW watchdog is running, the start function should not be called
> on open. It would be called after the watchdog was stopped and is then
> started again. With that, opening the watchdog the first time would not
> call this function, and started_by_fw would remain true. Closing it would
> then stopp the watchdog and call pm_runtime_put(). The next open() would
> hit the above case, and not call pm_runtime_get_sync(). pm would then be
> out of sync.
>=20
> What am I missing ?

Obviously, I was missing something. I didn't see that the watchdog core
calls ->ping instead of ->start when WDOG_HW_RUNNING is set. And once
I knew about it, I even found it in the documentation:

+  Note: when you register the watchdog timer device with this bit set,
+  then opening /dev/watchdog will skip the start operation but send a keep=
alive
+  request instead.

This makes all my code to keep the refcnt balanced very moot.

Sorry for the noise. I will fix up things and retest.


--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1ayQIACgkQFA3kzBSg
KbbTBxAAjtoThqUsP44lndqKoaEEAt47AFch2a+Ic7OI5T3PR6QUhQ8SYHocMlFV
Kk1V4Ye+icT+ozU4A0EaWgETMYQ4/4LyLC0PFJdPhJKUGyVQ9v1UDpVhMKYpY6GM
4fwI9UhJ1UYFKyMnRAG8YgKlDGcr+qGFErSXcw51cG60NRscq6ycmDiVcj3ieAyy
iXgb+IUf5hJX/G8w5Aw0KcZdB2W/Rl9z+RLYhWRBaOphP/lI/JSF8sy/IQ78PIkH
NvMrWp2yzFmlve74O/V7dt0B3TL6PWmYT3FKQl+rZtmIG44xt7AWiXGCiIoOBXla
DkOh6V0fUIkdXi9lywbH37DyLVoxYODCl9DebRhs3Bwzavtgljf8R4lkbahDOQ7a
YPzeu3LAIZ/AWsJEoZ+TVoidHD/BGCWQoKnqRK2QMfHbiAYJ2BMvFS8OmOJajTmZ
fHoNRYdk8WlFeeSedyii+5la7IGSdPGQmRUAwTfpoZiR9dp4/ocw2ktREnvzHITN
n6tQDGE77eVc764M+0uyHI0Wg16pdfeZj/WvcAfn4zAwXCs0PV3JxLhV3RNQN1jZ
LOxz1VuPhz6l7qNhgFxuq3h/CXGpe72Zbk8/a9NjknbUiDMsjnZCIcZdHdzrjbGh
JSOj756wI9LxedDsrqWmC5o+e58HAPzc2irEHDu00t4g9vQ7Ok4=
=tmZx
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
