Return-Path: <linux-watchdog+bounces-3930-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33344B17B93
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E93895A1C2A
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DD5191493;
	Fri,  1 Aug 2025 04:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RasadFPd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B56148FE6
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021057; cv=none; b=oyujyDrBNRYmCATHxWsOS0J4MxZgRH2iwhlM+gPc5WJAn73sPrpOTfwQXQyrvfq7TQwdl0g4qXwkXC0+StPFuubwjGodtzxQC1Yi2med4zXxyPTiQ8DbqUH6f0fksEaI0blg/ps12gxpvGJ0tgGUbChCxnCF9F0Dx1jy6FLCmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021057; c=relaxed/simple;
	bh=bmDXCHD4Y3iUEBRklUMlWsIg9z2kQUzOW43B1rGHLd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRUGcT7W8GevIxJ5nUa8CUG6dbuD2qE5kYOSMGeTnbanHPuV6tnIo9zGNhrpIc8khpwlgYowiYYo1EvypTx4ITBkFjg+hvse5GV5Jr33AVYVPbFSF4sfbpkhDcFQYRtHOQTd01lU0ZwsPCkTtU1XHRJ/LoOrDLTqUuX+j43WPwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RasadFPd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bmDX
	CHD4Y3iUEBRklUMlWsIg9z2kQUzOW43B1rGHLd4=; b=RasadFPdz36bDh7N+TXF
	WVO1Bwo0lAzCeDtLVjsWTL3aHQhW44iuVHIMs5RFWZCbCcRbw8t73gbHA5HHwpQP
	0DDuuFm0ZqFQFbvnqiogoz4sQwygNomepSO4sqxEOic9u1+gmeptoVIoWwypRtrK
	26I2x1FtFS2Do5rShP/mIwcoiNcCxapIz7JnNcsBmz8gj+WS8cglnVYM0fMBK0Kf
	Z8MT/4YK5h25kAWbSUsR6132Ke8BxnTG7swUfj99GhgHDXE60HX2dGYO8/HpHRA6
	YApL6XOS3jH4/j/5Eusvhq9+EB1lPQOtgWFaiz5nb/+FtfFSDF0CXqjOCiGWUIr2
	gA==
Received: (qmail 595918 invoked from network); 1 Aug 2025 06:04:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:04:13 +0200
X-UD-Smtp-Session: l3s3148p1@RwbH2UU7yosujnum
Date: Fri, 1 Aug 2025 06:04:11 +0200
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
Subject: Re: [PATCH v2 3/9] watchdog: rzv2h_wdt: Obtain CKS divider via OF
 data
Message-ID: <aIw8u6mZxC8e76JQ@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lZF4n2x5Q9gNBcV/"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--lZF4n2x5Q9gNBcV/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:09PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Update the rzv2h_wdt driver to obtain the clock division ratio (`cks_div`)
> from OF match data instead of using a hardcoded value. This allows the
> driver to support SoCs where the clock divider differs from the default
> value of 256.
>=20
> This change is a preparatory step for supporting the RZ/T2H SoC, which
> requires a divider value of 8192.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I'd think this should be merged with patch 2, but for the change itself:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lZF4n2x5Q9gNBcV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPLsACgkQFA3kzBSg
KbbnmA//eQLNR/Dk6cTBRVYaZ/Z+YI3lwP+FGve88Fs9tIILOeIA61xMldGVxz5U
ktqts4cSh+G2+VjggaIZcH7FDeE+R1QJibfl/MaXHyLRqCfl+cb9pevL2JbPeEok
5HiNJO7VylS32WqVouCMhMtcIAyJITfH3sW/oJHYPa/k2hAqJ/PW78nPnJ8y0dkT
0fpGLJs8ZO4nlGprSak0TbCCB6VLrB11P4nYyn6aitLfLS3svQjos5Z7Se81VqTp
4B2HHiCeYOxkArIK4EnQRbckHro2uk/QGh5RtAk4wNEhLro5Fe7TDqST4LX1XEYV
+B77xU/D3x9a86QR1dPlr8sZA69oZVDBSMby2N17NVb0qo7+dhjMLIsWa4GHNLsk
s9h0uRJceDdW/BXrB6Vvt60IiVNjUPid2TRH3zdUZUzSZ1QCCIqcB9oiVUVdqd4w
FZs9+sM76L5wK7sagd7hPootsKwcCu+m3YbjNVjj+uouwVQacbwuwdNLVZdq4Vbe
hHpL/ONx39KVwUKgp4cHnHq2GyjrSdsLxXRY5u7MjBf8MRpECrfAAA5jrG6BkiWi
F3p4EfWKJ9YzU7bZj4VWHbLVAd7HCAP5YJN/F7T/6xsSS+cSOAIUY3dfV5a3ZwkW
uunkMtfWlBIctqXTW4YKyR1PQR23d1WL42BQAHaaPRXMHK8qp4g=
=mxNa
-----END PGP SIGNATURE-----

--lZF4n2x5Q9gNBcV/--

