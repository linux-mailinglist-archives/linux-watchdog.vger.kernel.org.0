Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B503715BB
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 15:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbhECNKs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 09:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbhECNKr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 09:10:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE57C06174A
        for <linux-watchdog@vger.kernel.org>; Mon,  3 May 2021 06:09:54 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1ldYKd-0001Sp-1K; Mon, 03 May 2021 15:09:51 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:1b0:e062:be12:b9c6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 72B8161B1C0;
        Mon,  3 May 2021 13:09:49 +0000 (UTC)
Date:   Mon, 3 May 2021 15:09:48 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [RESEND PATCH v3 0/3] watchdog: f71808e_wdt: migrate to new
 kernel API
Message-ID: <20210503130948.y7w6a2wbonr6zxzu@pengutronix.de>
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m5s4si2wk44k7sv6"
Content-Disposition: inline
In-Reply-To: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--m5s4si2wk44k7sv6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 13.04.2021 12:46:43, Ahmad Fatoum wrote:
> This series migrates the driver to the new kernel watchdog API and
> then to the driver model.
>=20
> Main feedback from Guenther on v2 was that I need to split it up to
> enable review. I have done so by removing the extra refactoring for
> now and focused on the functional changes described above. The diff
> is now much better readable.
>=20
> I tested it on a f81866.

Is there a chance to get this series applied and mainline? Is there
anything that's blocking it?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--m5s4si2wk44k7sv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmCP9hkACgkQqclaivrt
76mFPQf/dyETqSrsY3TNgxovhg5po9jW/0ufUVSxsio8zvSBjZ1MzOoiiFgd09Lu
LKSmzBnM3V7rQnFeDRx+pZKHrfLKrW+3Wfy58pHx30l1ZU3av16QvOPrdR3Z6JyB
xw4kmbQNhhTJvk9R7sBqkJXht/BHSLjRiGt6GoWTp2fsWFbh00f1CJHXw1L6C/zr
z3nKTmU5QlhjUvLTDr46vxC4vnp0iTYPgnruc2r39F1QLSG2gvaiQlrbb4PSo6a+
eA4W5h+588HECa83G7F7rIHiVVLPrgy8cGp5akXPv4VDvsvV1g1Hiq8r1uNX75yb
X8hAaUE1jcP9GB4qq7jO5sIB0EbRSg==
=q0FO
-----END PGP SIGNATURE-----

--m5s4si2wk44k7sv6--
