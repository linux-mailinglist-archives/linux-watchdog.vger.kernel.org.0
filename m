Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3024AD8FE
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Feb 2022 14:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350221AbiBHNQM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Feb 2022 08:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357980AbiBHMj1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Feb 2022 07:39:27 -0500
X-Greylist: delayed 65 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 04:39:25 PST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA165C03FECE
        for <linux-watchdog@vger.kernel.org>; Tue,  8 Feb 2022 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9smJiqXDXeoe+SY+ky2K+yevWbS3
        UyGERBjmQzbmvjE=; b=Q2Nbt+4rcsnBl9GGOYdEzjfIzRDRBV2k1d8E/bjmUNvc
        H8XM3E8A2X3w/B9k4jgiY99RmTzLc6cYdoCCukilGuHcc20u/JydqmEHoUqgF1uk
        QGEJ87H0T2eY57MyWcCHtdlnWgZMaq9D2ErjMq8UitH38lEFYVIDJ3sXgKmZivE=
Received: (qmail 251800 invoked from network); 8 Feb 2022 13:39:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 13:39:23 +0100
X-UD-Smtp-Session: l3s3148p1@rkm4AYHXYskgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 13:39:23 +0100
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
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: renesas-wdt: Document
 r8a779f0 support
Message-ID: <YgJke+iXkwn0VSM9@ninjato>
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
 <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4lz/16p7tLSRDwdp"
Content-Disposition: inline
In-Reply-To: <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--4lz/16p7tLSRDwdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 06:09:02PM +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>=20
> Document support for the Watchdog Timer (WDT) Controller in the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>=20
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4lz/16p7tLSRDwdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICZHoACgkQFA3kzBSg
KbYB5BAAr5DGS+Sh/754QQlhwRYnCKENrRVAFJYuVYROnsSBOwvVTeldZx3IHO3P
DYt+Ll13SSY0enGextSAzIrHoIVxXOQ524VyZedqmj0mdv3g7mwO98pxDbIAyVFk
m9Z0u/ECwKRsKu8nZSFVfwN1iMUwBThWk6k6tSZK/OelRQ5M798k7hFsvCRVOXX3
tvTehufUkFOUVGMP3fKO+BW+iRuqGwwZI1xY07zFIZmiM09bR6NjCTi0JXy6yKWD
vt2nouZRXWYiWMwSEIf1i3jiF1vRG6uwXbrfpLlZD24OOQpvGV6sAY7GprsK1gBd
Ti7sph7gfX/Elj9qveo8AoXgfTAmCyVSJ0NJ/V5zMp3qSlHXaQYOfxrmwzSxZv5J
W1bKOCkfW2w4n/NX7sGqqT3dPfyDLyef7PVtU3/5XDZtq46mIApZpqZnq7xVyHom
KpQwK0EAYNxCblN9DmtRXRxw8kflFkCMw1XS5g/eo9ds3qfwOsJV2QJrCC4d5FM1
B5xplsruGT2wW+DbM5fFqPO5uiofO9DRbDhur7ucQGn6OPjcHXK1yLlQFb3S/Ab6
5iikxxcIqMEu2rjO3+QocQZl/ppXKiI8x4cP7AY//p3bc35DbTd5f9bPUBdC5esQ
1CxNgry/A4gfEtnJZwk3212shJ96pDb2AFOzsaS8BxIjlw9r6SE=
=LCvS
-----END PGP SIGNATURE-----

--4lz/16p7tLSRDwdp--
