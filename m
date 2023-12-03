Return-Path: <linux-watchdog+bounces-107-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B580232B
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 12:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0379E1F21001
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DC79479;
	Sun,  3 Dec 2023 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtgysUrq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8D99465;
	Sun,  3 Dec 2023 11:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52556C433C9;
	Sun,  3 Dec 2023 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701603275;
	bh=FltZQp0GYx1XXErHTqgkhFKHiW376XPvXT9+/SyhAJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtgysUrqDZCuNZEx/gNvnlKvoJMujoHBkQHXCZdwdFHS+3aL6I7ijlph7T7aigsJd
	 col2V2t2gIN8+j03YoVRwjuySdqnevNwaX/gxRedx8ihabLQxWmYCvU3GOYIZRBD+b
	 OS7FUIXkpaTTEFtcC+5v1oyYiOHcHOzzaqWrfQLiCa3wo9d/4VXTfVT/r8UiRQw5lP
	 aASSBIX/hVTbFBAfEs0+HgHxwVz4Ru6bicOeO9AK8qA5rMgK3GL1G3wlTbFbrXB4KM
	 nf8AALemQM4Eh+6D67l/wsr03aV5QEXCrX1obVtTI6ey1velyfDBOprmRWOFcq56IZ
	 wM7b3SqF+7iow==
Date: Sun, 3 Dec 2023 11:34:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: watchdog: dlg,da9062-watchdog:
 Document DA9063 watchdog
Message-ID: <20231203-sectional-gently-6764b5be0f1f@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oxbTtcCuShQKuhdp"
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-3-biju.das.jz@bp.renesas.com>


--oxbTtcCuShQKuhdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:25:26PM +0000, Biju Das wrote:
> Document DA9063 watchdog device as it is similar to DA9062 watchdog.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> v2:
>  * New patch
> ---
>  .../devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchd=
og.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.ya=
ml
> index 2b71fdb9251c..ccec4d3e62f5 100644
> --- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> @@ -18,6 +18,7 @@ properties:
>        - items:
>            - enum:
>                - dlg,da9062-watchdog
> +              - dlg,da9063-watchdog
>        - items:
>            - enum:
>                - dlg,da9061-watchdog
> --=20
> 2.39.2
>=20

--oxbTtcCuShQKuhdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxnxgAKCRB4tDGHoIJi
0ubvAQDq5PbA0A36DNiggMjXbd8LWTWdFR9fzzOlrdVvhGiYsAD+NHYFne4gunjS
OtVdyaSkaGIhIpaMpaUFq3vxyFbiuAA=
=60XZ
-----END PGP SIGNATURE-----

--oxbTtcCuShQKuhdp--

