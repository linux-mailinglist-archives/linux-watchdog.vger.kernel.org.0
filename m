Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61E8371633
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 15:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbhECNuQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 09:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbhECNuN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 09:50:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72917C06174A
        for <linux-watchdog@vger.kernel.org>; Mon,  3 May 2021 06:49:20 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1ldYwl-00061R-U4; Mon, 03 May 2021 15:49:15 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:1b0:e062:be12:b9c6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id C345661B229;
        Mon,  3 May 2021 13:49:14 +0000 (UTC)
Date:   Mon, 3 May 2021 15:49:14 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [RESEND PATCH v3 0/3] watchdog: f71808e_wdt: migrate to new
 kernel API
Message-ID: <20210503134914.nwlw3sc7c3lq3sy4@pengutronix.de>
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
 <20210503130948.y7w6a2wbonr6zxzu@pengutronix.de>
 <9b24f6de-c989-8055-25d7-518ff6cc3393@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cpg45mua3la2yfdx"
Content-Disposition: inline
In-Reply-To: <9b24f6de-c989-8055-25d7-518ff6cc3393@roeck-us.net>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--cpg45mua3la2yfdx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03.05.2021 06:33:21, Guenter Roeck wrote:
> On 5/3/21 6:09 AM, Marc Kleine-Budde wrote:
> > On 13.04.2021 12:46:43, Ahmad Fatoum wrote:
> >> This series migrates the driver to the new kernel watchdog API and
> >> then to the driver model.
> >>
> >> Main feedback from Guenther on v2 was that I need to split it up to
> >> enable review. I have done so by removing the extra refactoring for
> >> now and focused on the functional changes described above. The diff
> >> is now much better readable.
> >>
> >> I tested it on a f81866.
> >=20
> > Is there a chance to get this series applied and mainline? Is there
> > anything that's blocking it?
> >=20
>=20
> Yes, time to review. Sorry, I am way backlogged with code reviews.

That sounds familiar to me :/

But on the other hand I have a co-worker that's interested in watchdogs
:) He'll try to do some reviews.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--cpg45mua3la2yfdx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmCP/1cACgkQqclaivrt
76kaewf+K6SGrz7WudPxFt90uyPaEQZHJzsjmJFBeEQHQ1kOm6Rvl0T9ik2y6jNN
KIZcc0wvSlD3Pfnp4xbzaZ670IuZIReaJvmDHE/zO/fJk+GmmFmrbMnYhYCvD+fe
4husKhqOI2jLcNu1Axzqu96eK5YFy1mUE8Tcic5MKiOoh1PNC1gbQvDe5jn1jf4u
khosprwyGJ05nsesImrOVPQ83xn9lTmm0C/gqq9cZPCTbrAtdNXbFbM/SFIoWvJW
+jTZzMB+eBc73LbJciak0DMFUmlwLx+Ocosd8yjso2ibifCkkEBhgDtL/VJWyNTp
38PgmQQsSbuySDcm9Lb6+mIviOy4dw==
=3v58
-----END PGP SIGNATURE-----

--cpg45mua3la2yfdx--
