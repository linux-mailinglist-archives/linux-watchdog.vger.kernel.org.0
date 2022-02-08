Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3F54AD8F8
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Feb 2022 14:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245753AbiBHNQL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Feb 2022 08:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359342AbiBHMmY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Feb 2022 07:42:24 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411EBC03FECF
        for <linux-watchdog@vger.kernel.org>; Tue,  8 Feb 2022 04:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3vPdgap3+u2MmuSf9P5qYa18Z+0P
        92oBaeedriA6/xg=; b=JjdGGhEhMhZzrc4fWUvsN8jetsdmx6IhqDyU2ERBmiw3
        2miFRIHh53iJoexnaLynJ49aTOdnCrkUDYcaTTJ2PTAXiZoQ4kyROmMh5G2Fuu5k
        B29bgw5/7QccIyOxgprdLo9KvX60SOeHh8c9ste7koNlGu0ciz8SiIrjMooyEp8=
Received: (qmail 253626 invoked from network); 8 Feb 2022 13:42:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 13:42:20 +0100
X-UD-Smtp-Session: l3s3148p1@+UdADIHXZskgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 13:42:19 +0100
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
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a779f0: Add RWDT node
Message-ID: <YgJlK4n7t7jOX6JT@ninjato>
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
 <556a7f41bdadceecbe8b59b79ac7e9f592ca17a2.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zv0bsFOd7tjxku9s"
Content-Disposition: inline
In-Reply-To: <556a7f41bdadceecbe8b59b79ac7e9f592ca17a2.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--zv0bsFOd7tjxku9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 06:09:04PM +0100, Geert Uytterhoeven wrote:
> Add a device node for the RCLK Watchdog Timer (RWDT) on the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>=20
> Extracted from a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--zv0bsFOd7tjxku9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICZSsACgkQFA3kzBSg
KbZGsBAAoLPRmJAOAwQyfjKO0IUMyEXyVDXbg1IIJuFAuxB5GZQjwSNQtjdBzXpt
927oj1JpGDxqNAZ+HS8YaqBy7dQG90+FWxeHC+98uEU2Qxa13j2nmVQgA6pE6HTd
84ZneoqF0H0w1JkQdaRnsNViVcT6li/qealemvUzG/52hy5JjSXMpKBdUej/m5Lk
Ef9u2tlt1lM4uUL4MHsit2YVQ+7Pxz1I5vzwUR278FlIflX3OVfa3BNYzn21iG9U
D3zna8ngRhdElWSMOnvfyR1RUn1chKJRT7I2Bl24ebtUlYY+t9yHBpmfXrkuSbNr
a0CwNUiW3FHs0hicMANp/DO//lJsSorsPxdMIf2lmcB8K+Wb5+gUTuZw/OGcYmMn
HpxvYOl9oyB+dyNBTnrG8oxcd4L0lcCCkrKvJ7z8bWkUbuB56ncUwrj9g+8ntD2p
kmVGKxJaz0zvJi0JdzpvLMGfxpf994i66kDYy/iMaNjEQvANzwDByZ+suzi/Bacf
oymgHa4vZ55aV40/+qcmzAZgrWPY7tVTNPj9PWUyNPxkinVnvReK0tlQXqSC9UIe
+4mQIsXVrD1zbLTZrIKAitTbZ0/WnPmRIPKbsZVmLVcwRS7Rcgv4Z7UXGmDeQFMj
RsNwP3qRJv21RtdxJlQylwKrnpEkTXsVdNBOb1EcJ6n3qfEJqxQ=
=xint
-----END PGP SIGNATURE-----

--zv0bsFOd7tjxku9s--
