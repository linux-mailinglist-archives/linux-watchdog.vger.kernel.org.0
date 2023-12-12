Return-Path: <linux-watchdog+bounces-275-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A15680F37B
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A948C1F21703
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 16:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC8F7A230;
	Tue, 12 Dec 2023 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjIL0QCY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E57A20E;
	Tue, 12 Dec 2023 16:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63EDC433C7;
	Tue, 12 Dec 2023 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702399565;
	bh=2kL9c8M3mF8X30k2wAmSgFfBnjox+ipfBtSSJWGmurA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjIL0QCYOiE/9Znph5//BdBjzkVDNmTeu1FZ8S8IXto25jVNQ5KFEImUMthV2aLss
	 107WRCrvDwOTLhdHE48b6ne/CRKLk+vAdrTSvu705aVd6ZA7VSv/1LZk6w783PWW+G
	 DOEvwBP5eeXhVGe19f9UxfGzggKuDrklxvME8UfGHdhYb//uY04YAJblizStzacaXe
	 un8HMwQa3oaUbLMv3mmWvgv+GMqcwpdc5fAnKDS/DVGR8ydVHbFSMt1UayPrqlDoNe
	 pQ036RBnPkxUbvyfAz5PhB1FqDlXcsSP3dnImqfTDPBwwKphQJqei6seW3oMwHPVOc
	 M3/JFxL0swcKA==
Date: Tue, 12 Dec 2023 16:46:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Message-ID: <20231212-reverb-daisy-4574734ae84f@spud>
References: <20231212031731.2498584-1-jisheng.teoh@starfivetech.com>
 <20231212031731.2498584-2-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45NKaEISDIosDalY"
Content-Disposition: inline
In-Reply-To: <20231212031731.2498584-2-jisheng.teoh@starfivetech.com>


--45NKaEISDIosDalY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 11:17:31AM +0800, Ji Sheng Teoh wrote:
> Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> watchdog.
> Since JH8100 watchdog only has 1 reset signal, update binding
> document to support one reset for "starfive,jh8100-wdt" compatible.
>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> ---
>  .../devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml       | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-w=
dt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.ya=
ml
> index 68f3f6fd08a6..02572b16ac08 100644
> --- a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> @@ -27,6 +27,7 @@ properties:
>      enum:
>        - starfive,jh7100-wdt
>        - starfive,jh7110-wdt
> +      - starfive,jh8100-wdt
> =20
>    reg:
>      maxItems: 1
> @@ -45,6 +46,7 @@ properties:
>        - const: core
> =20
>    resets:
> +    minItems: 1
>      items:
>        - description: APB reset
>        - description: Core reset

This relaxes the constraints for the existing devices, please add per
compatible constraints to avoid doing so.

--45NKaEISDIosDalY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiOSAAKCRB4tDGHoIJi
0r3IAQCDEjl1GeMZyWSMhCQ1LJweHvfTiZh3K9eeYofqlwRCQQEAl3IBywhY+TCc
ambGyaPu7HZyn/1K6rqqbBqODrS7qg4=
=45Jl
-----END PGP SIGNATURE-----

--45NKaEISDIosDalY--

