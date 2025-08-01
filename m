Return-Path: <linux-watchdog+bounces-3931-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA5EB17B98
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12E75A1BBC
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01889191493;
	Fri,  1 Aug 2025 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MYIcTC3M"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6502F5E
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021069; cv=none; b=Nvw6pXobrPMSchOgfDuBF0lkVbkdYC1/3gDZxjrh9y3HakqnFksmoXAzq8wuVX/P1BD1yKi3dTuOrduFd+xJONORUhikctyWhzYaijFN9taVgayyJoXqgXdPPkwC9WoIPNq4xNevJrpD46gXWWHBvYiylq0XzcVzrLw4/orLBQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021069; c=relaxed/simple;
	bh=XYdMDXXIAN7HbChd9z5ogJJvvzHBD2bI+Yr2tfByadE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpguIHPAFqhshDmf9aF2nR36jd7GsYqELRVxuX+yUYMBNgIxAPflptaClSVnVd3oTHkuupXDoRJfef+MtoNQIUsqva5ylqcgt3OJKJ7LZv9uKzcCbnaTPPfwCYJuQwvYFM8vHkAv7LMOx82N6LpcRqBt9eTMIkgCE8yY92QbGfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MYIcTC3M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XYdM
	DXXIAN7HbChd9z5ogJJvvzHBD2bI+Yr2tfByadE=; b=MYIcTC3M/p77FBqHQ45H
	v15j/z9Kp9JAUuZ6H63iG/EacYjagMnW0b9YWHuLrc/ohIM4aH0VE/jSKgT8TQ9J
	YCM3xm+WC2Eag4logbkTvPnkQLHdQr0ZpXMs7b1hrimkKPGjwH+o2lI27OoTVVu0
	y2Y7ooIJPYbGqA6RI/qNEd0ncTn80Qmo26LUJejpqi83ECf6iNjKK4NVdjTCJvRo
	qv7DZEYn1mP4ar7/o/3E2Z/975oDK5XEZtOKZeKXuraqxLkdN5gBnfV8XLFOY5sl
	ZPugiD51lSUQ7JVdWoj6bJ5ayWAxQIpIv72rSqGr9JnsjYXysM1Cgo9Dxzujlot0
	Cw==
Received: (qmail 596081 invoked from network); 1 Aug 2025 06:04:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:04:26 +0200
X-UD-Smtp-Session: l3s3148p1@DseN2kU7OK8ujnum
Date: Fri, 1 Aug 2025 06:04:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/9] watchdog: rzv2h_wdt: Make "oscclk" an optional
 clock
Message-ID: <aIw8yIawkMPT7FPd@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OSE0N7soVdSM/wrO"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-5-prabhakar.mahadev-lad.rj@bp.renesas.com>


--OSE0N7soVdSM/wrO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Update the driver to obtain the "oscclk" clock using
> devm_clk_get_optional_prepared() instead of devm_clk_get_prepared().
> This allows the driver to handle cases where the "oscclk" clock is not
> present in the hardware or device tree.
>=20
> This change is in preparation for adding support for the RZ/T2H SoC,
> which does not provide the "oscclk" clock.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--OSE0N7soVdSM/wrO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPMgACgkQFA3kzBSg
KbYvxw//W+TWCYkowRrzMlYt+yeUWLxQnY4QmCOoV3S5gn+cVAZoihCIqp7swIFX
llexmBxOEkdh7g8+XD28nKrOSslanY6h7BjQDwHZm2IHzMeaj+2Pl9Did8fNLFnu
DqZ1V7NDtCJuUJZoHFFgEg0UqZho42oYNTYOWhiXcPvYY/ydYjSBpyvdGKxq2kuO
Z+cepFrB7+LwjGGl8msvNSi4YDZo50o754D+PqFWcZpaJV+bUD2VeMu0YKljlp6p
0l+3ZVn6Q+70Qajc+Vp5a3TTVQP+WMJ/Maoo25cluyFPcJZj0xVM0IU6BLGp7hVd
Q4SHPQ0YPullFJunEKWDIQFrZN+k4pxEofZl2z7WywRdc0c8OmSZ1WF5jIIm6ewy
9wH5IJ2HWUWWTehFhnhICY8I8pLKy+NUJ1CkTrB/No4ro8usfDLI3X/vpag2HpPZ
Cha9yMwdJJAvAL4BF+MBqN4o/EAN5AvE8Em9xBeEgwIsuGiZpb+/eFiqLWlD5PNq
SVnkg2eYZLyxrzVNMvPWP6pTFL19401NBj+TplrHK3a6FktW7BiQK4HHfZDmss2U
5o6DQbndVA8AJWDFJcwKcQ5y30deP5jCHgSrpcUCBz0XAcjblMtiy3Dpy97CfESm
naTRVxwWrlojdG0qq3Cig2NhMHWi5rAhPq9zcYUCIoOeU8XYgTY=
=4c3K
-----END PGP SIGNATURE-----

--OSE0N7soVdSM/wrO--

