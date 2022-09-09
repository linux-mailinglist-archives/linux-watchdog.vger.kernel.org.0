Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7C95B390D
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Sep 2022 15:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiIINd4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Sep 2022 09:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiIINdz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Sep 2022 09:33:55 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D356E139AE6
        for <linux-watchdog@vger.kernel.org>; Fri,  9 Sep 2022 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Vwa96NPgAe99rk95Oztt/MJ7OGnv
        DPqnWAHViyLBFuA=; b=Y2mE1fX0CJq50Vu0qh0VwdOQioeTh6x54BxNuxJLC0Kn
        X+/FIxENbsmFoREbeUD823swA7UKrNRx51hZ9Z2fA5Hm+f9bbWxXHbvwElN3CC2I
        YpwLMpFfkHz/91jknlQeFx5bPl+ubkTpS3lRkrmTz8pVfMqaCLyNKJuiQw01G70=
Received: (qmail 499396 invoked from network); 9 Sep 2022 15:33:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2022 15:33:48 +0200
X-UD-Smtp-Session: l3s3148p1@ylSFmD7oDZQucrSh
Date:   Fri, 9 Sep 2022 15:33:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Add r8a779g0 support
Message-ID: <YxtAuwlMpsEnV1Tn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>
References: <e3a246be066d5e9c2231285bc1488fc12866cf5d.1662714387.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xSFMtCNoZNxEK8u/"
Content-Disposition: inline
In-Reply-To: <e3a246be066d5e9c2231285bc1488fc12866cf5d.1662714387.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--xSFMtCNoZNxEK8u/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 11:08:11AM +0200, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>=20
> Document support for the Watchdog Timer (WDT) Controller in the Renesas
> R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xSFMtCNoZNxEK8u/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMbQLgACgkQFA3kzBSg
KbabMw//YSsvQK1h8tn6ot0Z7AN2OjwQ7Enqz2P7xHw/ES8RL8SXaE3ZiOlYEOmj
UdLCtORqxb261X3bgPkdOzpjV/4bvn/BKUWzujVm+5c9yFVlFLMgxvrXYdxWmzoG
zzuC8ya/kbxSK2dIxOefI0FF/s/HpTpFQMYyv1xh0kG/JCzQblKmnjX3QX/VcS31
JyQ0zSwv7dwEDAsyeIjIB1PSIEfSWH6PmzS1j5keSEF2S0bdzmN0JoNcd0l0qxQH
jbo0DIRN1SuA8JHqqjwlwzErC+ji0yZm6v8zR6bF5Ibp8rzQW+otVtlnnVsG3XIs
Z3aUlIlGcZGqLnPvsRYfbrLNz+CFbuun/lh2gcjh/6vB1C5ixlLLc8K7d0Urduy4
mWagxaI/3ST3Ps32LYm5cIC41DTTa+pN7z3TnrgN5OHSsrutJhFtd349GEJc77ka
TtjgE1sfDRuzHJ83WQNon921IizwJN98yyRE8/q0T84i3hTY11bimDZ+310HKrhR
M68GsICAdjGSZpJzU7qqqseewB2CpXYcWP13ofJzOJ2qc8s1Jt4P05Esx6JSbfGV
sPZikeNE+vNOlWOqMiw2rqnk4t8Xe2e2KcnWA63i4/67twKXfV5bOnlhnPcQJbma
/SfN8Dj7QV8E67QwWyRWWojUJ/0Rh7+UMayScoEuQqok6BobNXg=
=3kMa
-----END PGP SIGNATURE-----

--xSFMtCNoZNxEK8u/--
