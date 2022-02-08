Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9664AD8FB
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Feb 2022 14:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbiBHNQL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Feb 2022 08:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359429AbiBHMnB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Feb 2022 07:43:01 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405F9C03FECF
        for <linux-watchdog@vger.kernel.org>; Tue,  8 Feb 2022 04:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Ck6cwa59nGXo7jfN2dFLRXv6E+Un
        dI4SghImRsPxVzo=; b=BUUhG/j9ushdI2B3Dkou/u0zBKlUf9gw7KY6hR/Krsm6
        30QmXmnQV6dUtck3k/6NhvzQ2kXPzGerWsOQcc1obZnBMQiU57R5/BZI8JZwkCDX
        yhwU1XZ5dj3eE4p3zQM+Bp4P5EYqA/Ry/nWPrQhLX4UXca4ezPKOqNNBAdRQ3p8=
Received: (qmail 253997 invoked from network); 8 Feb 2022 13:42:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 13:42:57 +0100
X-UD-Smtp-Session: l3s3148p1@1xN8DoHXaMkgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 13:42:57 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: spider-cpu: Enable watchdog
 timer
Message-ID: <YgJlUaFqtbxvrfhJ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1642525158.git.geert+renesas@glider.be>
 <b36b2bb5770e10d906571721a3d73ca205b6f56e.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rr1ahe+uiqjQiwRT"
Content-Disposition: inline
In-Reply-To: <b36b2bb5770e10d906571721a3d73ca205b6f56e.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--rr1ahe+uiqjQiwRT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 06:09:05PM +0100, Geert Uytterhoeven wrote:
> Enable the watchdog timer on the Spider board.
>=20
> Extracted from a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rr1ahe+uiqjQiwRT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICZVEACgkQFA3kzBSg
KbZBXRAAqPdtAEeUfW4tit/TvXovUIbZDY1Cp/Wc0wDPVd91on/KRfH4Z4u1nsT1
BY7XHHEkDkfH6nsUX1Gfv/V+k33xihe14k/nfdBTx+ewp/WkQBkvrajPmgXvUAh1
8b67apEDWaJo0LTSd1+YyoXlyk6K/1RZ9enVj9ehOnl/T1J9w8B0pI8kyg70hLcK
Kg39Xqj/22kEbAIW/NglT/JTib60yfSLJLZaUU+rzsC2QU31SE1ZY7gMyhkbPKtv
fxJraHAYTNc/DgmpeG7RYSfghKqSPi4T4CB+FRDypKuV6T5W3R9ZsUqqf3d0ZcC9
aaLjNDEEj7YVCuuB3TFQ4ESWFTOB31sqgI2XsVowaE2q50ZNVTAYaPo9lUSasRMr
fTabzGBFok6uuJ7tqP7B263+8oLG2SNIiFhOtMT17Yf8f+9IfCp26xXdq/r/AhCP
dm6ks1UVFvvb2rsPKFhEQ6L8oAQhJ6L/7KXrKNyi9CgFVJsjF405SYUZ6o+uj6kg
ogs7/TOeIMlyQKQRek/cxC8pzo7Twcz63h5bur//kHy/g/z3sO3/NOiacTWhp5DT
bMzE2XaQksjGjjvWLbHvSuRoeu7/yBgQuUXWemOzMoIez68Mos7LCqHcBSXK0PZI
Lw2RXAUcfJMUrEIQIvG3rIQtbFJMNBFm96RGwbxUqP7mlifaXoc=
=2Hxu
-----END PGP SIGNATURE-----

--rr1ahe+uiqjQiwRT--
