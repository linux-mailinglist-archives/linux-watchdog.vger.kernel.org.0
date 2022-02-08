Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298644AD909
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Feb 2022 14:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350283AbiBHNQN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Feb 2022 08:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358696AbiBHMle (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Feb 2022 07:41:34 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028E1C03FECE
        for <linux-watchdog@vger.kernel.org>; Tue,  8 Feb 2022 04:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rZxX6PxDnfPx/2JFBanzqX5QT78k
        2L1qceRaKg4IR2Q=; b=uuKaMDd3c8AFTbItAyYgFiVDyY3UKRKSkVbCDXSi76KY
        7qlM6sy5CEfxRiiDP/qdx2sUuTHcNPoc1y5ZGuDfPMWef8taIjP1wj/U/jZVXinj
        4SZ79gngGzVwfD93cqdS8RVySGKF1PfjzWCwEBIDYQcUiJX0AAw4r87XdNX57Yo=
Received: (qmail 253067 invoked from network); 8 Feb 2022 13:41:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 13:41:31 +0100
X-UD-Smtp-Session: l3s3148p1@pzFXCYHXZMkgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 13:41:30 +0100
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
        linux-renesas-soc@vger.kernel.org,
        Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH 3/5] watchdog: renesas_wdt: Add R-Car Gen4 support
Message-ID: <YgJk+vCoVUDcYhqd@ninjato>
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
        linux-renesas-soc@vger.kernel.org,
        Thanh Quan <thanh.quan.xn@renesas.com>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <cc395105e1d34aab2c076d368c0737833970b9d2.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HJiBpFA1l5l7FAGc"
Content-Disposition: inline
In-Reply-To: <cc395105e1d34aab2c076d368c0737833970b9d2.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--HJiBpFA1l5l7FAGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 06:09:03PM +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>=20
> Add the compatible string for the R-Car Gen4 family.
> No further driver changes are needed.
>=20
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--HJiBpFA1l5l7FAGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICZPoACgkQFA3kzBSg
KbaCZQ/9EA3c/vQ5ZSk0jbK+InOLOctAtYAZZjQpFqbjgoPJc0roIe9JO7D27FHw
9TxmwPCnIsd53LWM+kyepTyb/HO7co7361gbSPB9cjb+grnNP4b3R/QN1A/em6oz
qNTcTZK2z0yIpGrcMenacsQfB94hdJsvpU7+qJF7yB7nAfvCVDvj5YLXTpH+Gy/o
bZair4Dh3+UtaEQVTKTFZL6aBDxX1/X0gtSNa21WA5Wn3J2y2fe8IKJx1SHfHPy/
96jbALQ/KIOMFxmAjg3G1F8TcuWEvkEQ7kfuxAq4xc3EqYtdJztqm/JHJTgL/mxI
g0jWuDHiG2iBMXAyyKpXEST9Z1TgiwRJNuKtJ8EcVin4tcXHVDgf1b6KyIONFtFN
xoCSkBFoafbqtvwkwkTh03FmiL82zbXzMDTRPoPXhO5gbw1RXf96is7Vymexv5Zr
Iob6zzoFbtbbuNHmm69hZ5+jXymoemnVehuCs2X9P1EcOqBiuPndbls7evJc38E/
D4FJwIxhXUrTjQKmi2Rxcb6lbGT/RJn7EsiWF77HqfNvZAZSKplU8E5rilAW3eZe
wpuksprRb7RUN5s51/up/q7od6BfPuad71h9pS0HYg1DwjYVMMI074ujcMIbRTLP
vWbJ6FcPJCEhaPeWf096XFszrJJB5VSjnPCdy1GO3XQEN5hkcaU=
=AcGs
-----END PGP SIGNATURE-----

--HJiBpFA1l5l7FAGc--
