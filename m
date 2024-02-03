Return-Path: <linux-watchdog+bounces-586-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28998487EF
	for <lists+linux-watchdog@lfdr.de>; Sat,  3 Feb 2024 18:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCCF285D9A
	for <lists+linux-watchdog@lfdr.de>; Sat,  3 Feb 2024 17:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BFC5FB83;
	Sat,  3 Feb 2024 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FUdQ0M4m"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288C75FDB6
	for <linux-watchdog@vger.kernel.org>; Sat,  3 Feb 2024 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706981491; cv=none; b=LmLZXY6kgcIj20rtGyorqUJMY9r/E3etAa4ngb0FiFK+xg1m0R6RcChJK3dUbbNfcaB97D0RxABAohT0ugpwrScV13uj9UAIushn8HVH3Z1L5+nhcX/z786MfqCiUGmOM2mXFLhxDsDZseUlM4MDYMOviue50K0ZaRdbcgg76cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706981491; c=relaxed/simple;
	bh=k/p2uQufmEhRaA3qcf0rfphsXq1MuAlqwFA0IkXxxqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ailrdcJ7gxkfwc/4nNiGrYV5G+t6w9rUtnEXAdTf5vPFXZYcmfbydpufyjxi5ghhkSE2xRQ4EfNOO15XUCUY81TDlRPIKxJEQkJQy3mcGJC2XAZYMwtosWP0/VB/3rxqsxmGeu+WV3kn0N4YGkdbN89BIYw0s2p7kBsARVQ5AvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FUdQ0M4m; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k/p2
	uQufmEhRaA3qcf0rfphsXq1MuAlqwFA0IkXxxqE=; b=FUdQ0M4mITH2A+dUydrS
	aeOCXa8K+pS1zpTvFRo4YDlyMfFYrGVdnu/hdScsSzglSsIsjNvcmdzje4ol/uBf
	va6PnU3YqUwOPGYsfy8K849NYvySRJV4urU9RtrVIzIbM/DABzNH1W0MF9dmBkYd
	cuKY+yO61MRS/TNmRx1qo/4viQBV7QRGgv5100j+LOUQP8k0COcIAaTF5foJ6i0c
	lVQ9bqsBnxCCIAHTTFl09/GX51MrS4HASRUmMfypfKpMEyWx3zME8x+V3rfrj+eG
	pvQeUqB2+5Q6qiKdcK9a+mhd4VilxdVNuvxLRPe7MrnZ90uGMPmGPuDQ6WTvFxjQ
	/A==
Received: (qmail 282808 invoked from network); 3 Feb 2024 18:31:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Feb 2024 18:31:26 +0100
X-UD-Smtp-Session: l3s3148p1@FJIamX0QEscgAQnoAGo3AKaQ4acoehG5
Date: Sat, 3 Feb 2024 18:31:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Minh Le <minh.le.aj@renesas.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Add support for
 R-Car V4M
Message-ID: <Zb54bQT5TajPPkLW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Minh Le <minh.le.aj@renesas.com>
References: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JpikPtYOKXtFEaT/"
Content-Disposition: inline
In-Reply-To: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>


--JpikPtYOKXtFEaT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:19:59PM +0100, Geert Uytterhoeven wrote:
> From: Minh Le <minh.le.aj@renesas.com>
>=20
> Add documentation for r8a779h0 compatible string to
> Renesas watchdog device tree bindings documentation.
>=20
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--JpikPtYOKXtFEaT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+eG0ACgkQFA3kzBSg
KbZ0yhAAgP6+TiUjIBimB/P/48V25Xdjje9ql8+hVpvAL+gswyqPIhfwl1EbBCsH
JlWoD6eKEpPEzUUqST+q445FzivGYsC0rjZfvKgkFGZVWq5I8gM7VYOnibd1GRxD
pgxffPo7VFjtteeylyscXOmiQaH24S1aZBZiw9oXsn1KqLyIuPmVyuMZZ6JYUWKq
y5UqzpGl50x8aojCnEuVgF8ZS86nhElMhYThzHSG4rjZBeKYs7hvFQQFkfbZawds
g7J/P7wBkMKtU02WxLaRzMFPuJotdxBg1TJ25y6Im9f0iGN15wGBxCxfaOGPARpu
3M3xnoYNHFWdzDlXJF1ljJ5KKyATA4ppkotiISN+Fw2NmHqiWhApWI2Da3ktU7Oh
KPzHFLot8bttDPw1wn/EvbgpK7a7PDc3pfO5uCeQmUzqXO2+opPa3eRsiHSIxL9l
ruPQXzhas65NbFUmXkAlt27PFiFryzgVkGSrYBG4wC8hNNNoBIcwAodcLTkjOSAj
PmbzpZhWtFjfCxz2nN1LhyapnjHJ/BGzJRt8fcKSrIloRdK42BpiG/8HiFYQnPvm
4TOWZGIfrN1ESWPem7UmbV6GHM9WvIsc5SzR/bplkQHwoiIT7Ic0Wl0YaptZYLYL
Gfmp1Yjdso10TmG2e5NPVrzvEmF09wzXVZ0bgx1vWJ1aD92isxY=
=c97c
-----END PGP SIGNATURE-----

--JpikPtYOKXtFEaT/--

