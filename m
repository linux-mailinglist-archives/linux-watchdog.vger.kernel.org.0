Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B091B2F9B9D
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 09:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387830AbhARI57 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 03:57:59 -0500
Received: from www.zeus03.de ([194.117.254.33]:59936 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387746AbhARI55 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 03:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=odbwHB50SLc5EVMnx2MmbfbSij/6
        RS2X0gG9yUbXGvQ=; b=35cEMqbixgG9D9YOqRlnGxyBA/GzVCNs+bow7itYaiBZ
        5Zzww7jebMcxC0HKguv8zEdCcVEzm+bgFOtWATnL4QUSJesyLRDLpNiWblKMQIzR
        /xh/qXyfIVDQMAVOTfUhf2/gjtTMauZqWbHtJ9eym28EVct1nQNSDeHR7VpJWh8=
Received: (qmail 629519 invoked from network); 18 Jan 2021 09:57:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2021 09:57:15 +0100
X-UD-Smtp-Session: l3s3148p1@gSBe6Ci5oIYgAwDPXwacAOByz8F9Mgm1
Date:   Mon, 18 Jan 2021 09:57:11 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: add r8a779a0
 (V3U) support
Message-ID: <20210118085711.GA1018@ninjato>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
 <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 06:37:26PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Please apply it to the watchdog-tree.

Guenter, could you pick/ack it, please?

>=20
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 6933005b52bd..ab66d3f0c476 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -50,6 +50,7 @@ properties:
>                - renesas,r8a77980-wdt     # R-Car V3H
>                - renesas,r8a77990-wdt     # R-Car E3
>                - renesas,r8a77995-wdt     # R-Car D3
> +              - renesas,r8a779a0-wdt     # R-Car V3U
>            - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
> =20
>    reg:
> --=20
> 2.29.2
>=20

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAFTWMACgkQFA3kzBSg
KbbE1Q/8DueMvbDDst01JemJotsD5DZn6/VwnSUwluawt6ObGTDYwxfbcyBkoUzt
HaladCExuPmRaLjDwhG5TPQ1jChelhrJzwjks+SEr0p9WngO7ivZsidG9pzuR/fc
5K8Rk/dbTuEfafV9tLDfLsLZT8aNWa8YmaSx01BcgUoeKEJilw2V+Uy0RSUamQU5
C6dxS2gIG7oevY4rAL3VmPBxQuKxI6yYLlacy8yb7p0XkIaQj9Mnl5WXQ1ZKeZtT
HXKjAP3gTpmyX5+2PxEk673q7PfOHFVN0tlg3kQIJliUBjlpIRTeysyT2v7nYg/S
r17jEOlKp7zhKqHbzr8JNVLNQx/ZylBq7ItewEHum4OQQuxuTNNuGV8Dj5Syj8bR
FBA84UApMgIBEm9/V30OXsOxbLZw8vc9P/VGALzOiobQsrzaG5bBIl423jZx8q8S
hm9EJ9PR0wRKqPPROOv8+A2ZO/bCd35VJ2TM9P28TQwWToMrON0DVlIoBf9g3cXh
kxthluUr/f3F3vS4UHlqwn2xxZrd4Xtf4P7pkpxcZFK+cW08w325N3VxXkIOAE11
2xcSgnPp0JqJzJpNKkbH5MHPb8BNOdSs/ACUX5QKkxWxCMj9yXIAx4a+WUSyqhPk
lex5jN1fDQzofZ6JMvLKerrr7KvgzAu18GRUcRZHE2O5edC5izo=
=8zwP
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
