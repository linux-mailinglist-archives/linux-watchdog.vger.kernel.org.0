Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6AEA6AC93C
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Mar 2023 18:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjCFRGy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Mar 2023 12:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjCFRG2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Mar 2023 12:06:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB05764A8E
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Mar 2023 09:05:59 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZEHO-0003z0-4j; Mon, 06 Mar 2023 18:05:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZEHH-002If9-91; Mon, 06 Mar 2023 18:05:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZEHG-002kzA-Js; Mon, 06 Mar 2023 18:05:34 +0100
Date:   Mon, 6 Mar 2023 18:05:34 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Doug Anderson <dianders@chromium.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     kernel@pengutronix.de, linux-samsung-soc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, patches@opensource.cirrus.com,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-rpi-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/34] watchdog: Convert to platform remove callback
 returning void
Message-ID: <20230306170534.vap4z24rbexbjj76@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6lk6n3hldynfzkpt"
Content-Disposition: inline
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--6lk6n3hldynfzkpt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[dropping Leela Krishna Amudala from the list of recipents as their
email address bounces]

On Fri, Mar 03, 2023 at 10:36:42PM +0100, Uwe Kleine-K=F6nig wrote:
> this patch series adapts the platform drivers below drivers/watchdog to
> use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>=20
> All watchdog drivers but the above mentioned one returned zero
> unconditionally in their remove callback, so they could all be converted
> trivially to .remove_new().
>=20
> Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> a remove callback that returns no value") that is already in Linus' tree
> but not yet included in a tagged version.

This is fixed now, v6.3-rc1 is suitable as a base for this series.

Guenter pointed out that for some drivers it is possible to make use of
devm_watchdog_register_device() and drop the remove callback completely.
Also there is an alternative series that gets rid of s3c2410's remove
callback.

I'll send out a series converting the three drivers to
devm_watchdog_register_device() as Guenter suggested. To apply the
remainder of this series you might want to do:

	b4 am -l -P 2-7,9-25,27,29-33 20230303213716.2123717-1-u.kleine-koenig@pen=
gutronix.de

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6lk6n3hldynfzkpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQGHVsACgkQwfwUeK3K
7AkjxAf/ay58zUveg62ekFfp2EWzQLcZ/rgoftXI9IlMaCupCSIn7RrN1sCI2ujw
TDxuC3JhS4wWOpkmRc0b0cRTdYXZdMxY5YSCbDJ63J94pr5mJmh0fXstr9pEfhmP
gLtcIM3I5Dv18X6tMBAu6KxEOgBq2ABiOpkLatLDNFsAsES2hDN1RSmFsozuIBsS
XlP4wsQvCAxsa0zpQx+lZ58NR0ySwwaWTRNlpm0vR6aOJworSQu0PuPizK2z6dET
L7OFiZJG82Og1Jq+nv8MZ3Wmw+6V4XupfkeCNetqQSJz1cq6fOTJmWCfBzWZPkjj
3v78LA8gRjJblfMeJ1VBaFfkIwMuEA==
=qlX8
-----END PGP SIGNATURE-----

--6lk6n3hldynfzkpt--
