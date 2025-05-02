Return-Path: <linux-watchdog+bounces-3407-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2DAA723E
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 14:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80351BC26AB
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 12:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A1E243371;
	Fri,  2 May 2025 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cyq9WvAz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C92182;
	Fri,  2 May 2025 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189498; cv=none; b=c1A0SeC66qpt8gU7aak4LTmNpHpu0WozrGUOy57nbozOdDHh0MICEDYjMWkX4cFO9/nsaiUUIWLBZxpoE727fhpBHsaONeAZdEVPTYx6sPxMnLFmpZ4A7vBAoiYdaO9+Dq9kc6wpZh65dVvJ0RYxKLInMRSqLxni5ywHyZa2mzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189498; c=relaxed/simple;
	bh=XkAKwcrcu3Kbyc6j3TA7W+HyEBnoC8cpTFtI8G59PAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9JeieJZs+iItXQ9cRZG5kl9XcKspxaJNskngsaRGjLmKeBVXS8Rs6F2PqOuh6Pf836tk5xMta8GNPjZwGg8aB6W7sm2UADeiDm7RsA6OtmLZhbD5Q1uQ5Gc4VOX+W4GiWaYrosRC3xoP+TN4eW/nUjorIvYjMG6GN4MNNaZuYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cyq9WvAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EABC4CEE4;
	Fri,  2 May 2025 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746189496;
	bh=XkAKwcrcu3Kbyc6j3TA7W+HyEBnoC8cpTFtI8G59PAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cyq9WvAzCSi8XgE7tn82RGvlWkpbBBAv0xyFlbV5V5aNWtZ2XxGLOvGlz1/P4yEw3
	 XE0XyP08vWufSlawXNhQ2tSs64SUdrHg/af5bCABvvR+Gg4VlKPVltVQrmhKyo7adU
	 WK44zwx4G+CuvJrDKirICcIlbR8/oP5L55bBqSZMd1nDkhacUlhMBn+pbbsS4Zfu/l
	 k/r+yy2G9zPqKEUavHcVG+GAMfbA4Ew6khVxEoLaVGf2PIgYPuHT/y90G+2jkcbekE
	 1R8Io2AyK6pS5Mde4xb5V0DMdnZHwKdmVjmydlXfhENQG8iaGQojMtiBZcfPH7CYwa
	 pRbjeD7+n3jaQ==
Date: Fri, 2 May 2025 13:38:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250502-molasses-provolone-8e03b62cee21@spud>
References: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rtF743oJEpR0T3zD"
Content-Disposition: inline
In-Reply-To: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--rtF743oJEpR0T3zD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 01:00:54PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the watchdog IP found on the Renesas RZ/V2N
> (R9A09G056) SoC. The watchdog IP is identical to that on RZ/V2H(P),
> so `renesas,r9a09g057-wdt` will be used as a fallback compatible,
> enabling reuse of the existing driver without changes.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 3e0a8747a357..78874b90c88c 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -76,7 +76,9 @@ properties:
>            - const: renesas,rcar-gen4-wdt # R-Car Gen4
> =20
>        - items:
> -          - const: renesas,r9a09g047-wdt # RZ/G3E
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
>            - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> =20
>        - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
> --=20
> 2.49.0
>=20
>=20

--rtF743oJEpR0T3zD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBS8swAKCRB4tDGHoIJi
0psNAP4mStyLPceWvsvD4MiviARAn1vin/1+kLywOlH0mLGvDgD+O5hRdJvJDg3m
g8O81b2C4Qdv0yDk9KQCgt7yvijb8Q8=
=wR3n
-----END PGP SIGNATURE-----

--rtF743oJEpR0T3zD--

