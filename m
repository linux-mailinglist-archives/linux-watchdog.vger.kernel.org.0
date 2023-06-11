Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460A372B197
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jun 2023 13:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjFKLNd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 11 Jun 2023 07:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjFKLNc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 11 Jun 2023 07:13:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77F8198C
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jun 2023 04:13:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8J0U-0006RP-Ai; Sun, 11 Jun 2023 13:13:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8J0S-006dpt-TR; Sun, 11 Jun 2023 13:13:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8J0S-00DAxA-9L; Sun, 11 Jun 2023 13:13:12 +0200
Date:   Sun, 11 Jun 2023 13:13:12 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: ziirave_wdt: Switch i2c driver back to use
 .probe()
Message-ID: <20230611111312.s4uauybzhqagjmoq@pengutronix.de>
References: <20230525210837.735447-1-u.kleine-koenig@pengutronix.de>
 <1a2f452a-14f4-4b29-b1c2-8e69d5d86814@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6lbwc6htqnvqpmrl"
Content-Disposition: inline
In-Reply-To: <1a2f452a-14f4-4b29-b1c2-8e69d5d86814@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--6lbwc6htqnvqpmrl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 26, 2023 at 09:55:20AM -0700, Guenter Roeck wrote:
> On Thu, May 25, 2023 at 11:08:37PM +0200, Uwe Kleine-K=F6nig wrote:
> > After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> > call-back type"), all drivers being converted to .probe_new() and then
> > 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> > convert back to (the new) .probe() to be able to eventually drop
> > .probe_new() from struct i2c_driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I assume this is a nice start to get this applied for the next merge
window. The patch didn't show up in next yet though. Is that because Wim
didn't start applying patches yet, or is there a problem (like this
patch being lost in Wim's mailbox)?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6lbwc6htqnvqpmrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSFrEcACgkQj4D7WH0S
/k55nAgAlYeCNMMaYw+TauXlurCc/4j2NtUmxzeVU2goahCP+NO6V0ohUEfR/sb0
o9iM8px/c4EkJkr0Hoiv47109/Jo27yMVftlWTd9CHuFAqqO77ZkB9P2vJIhUU6l
xHGoVvHKP8GWevEBK+sHDfQ6cX2fplVIM6WchJIfr2Qy0aGSgFSBcc5cerMy2R70
QC6GEScoUhlnFuUxwotNIJ9ojsgBVuzg8//E0+/gILw+0d6g8eg5/JiwsVU3yvuJ
zQtlkX2kDrA7KNBmH+3Fztv/V3uwsCJyUrox3coKPkp0urGE9xdv7N1fRe71sb07
aFP8nkXWGWG1kr1eBfEg2DhlWu0uFQ==
=G3T9
-----END PGP SIGNATURE-----

--6lbwc6htqnvqpmrl--
