Return-Path: <linux-watchdog+bounces-4319-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3FBBD21E
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 08:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 67B74348DB4
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 06:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C4C19D8AC;
	Mon,  6 Oct 2025 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gPvkV56U"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF5199FBA
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759732224; cv=none; b=PSUaiX51Oyh5EBgT0r4qGzgCJ5z6KVoce32CUevEZvA4c/h/ruV/qHCGazmJWkoEVMpUn8wJFaeW+XzJlRmC3OOpE4jjyc83NtSvwMk06j2NQyHLAYydYVSX0EJBEUTaSZfdgeJWZqwznqK37c9i2XYC7qRBzBmVFsQ+IE3PA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759732224; c=relaxed/simple;
	bh=x2N4Gl06CRVkAUIQae7XR5NTyc8ajnPU1fzsc4jb6Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/Vb2ZflS0bgU5ZELWXQyYHsw701z1xwnnBm1c2/V4ZAhF5uXidt9CU1ec3PkZLLWLt7ztrHcdSvCf/fwHsNApiFp+1OPZrS4R4HeibNuzpKmmIYMXio5XgDSC5OB+g6bsV8O3gENXWC/aVIE2YRPn18IRRRLV/z6+F1x7axvwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gPvkV56U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ermd
	zmJAlkt7RTxIorw+WZF/JeZoJHW+2asQokLhcQs=; b=gPvkV56UUwlRRuFqCXTr
	fqkYwzInVRK/WfpxuBfNYjrATPUBn/MwfZ8icy9gocVGvmAbMV5sgIBC7eXnm4L+
	cuU8ZF/R1GMx+66fDEVAvwvbVAKVJejXnK2no/WD/UHlOPB0szd0p3GMJ6Ho6QNd
	IW6LznhTlpDA/Zui8kgoY4jiijMf3TEQuFcBb8wnPpcJdB6+7TZ9ZT10ZK/e2VxF
	XROWS3TDybEos7WezgA2z98zoEhGodYGDvurh8bKx+0dEAvaq90V9P5jEu56UtQ1
	R4tdmFDHTtV/njKfatr7GpwIO7+PuzVB5GDWuyQBy/rwmGzgkJ597kqEex1RZWls
	xg==
Received: (qmail 1651313 invoked from network); 6 Oct 2025 08:30:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 08:30:11 +0200
X-UD-Smtp-Session: l3s3148p1@DkJblXdAqp0gAwDPXwQHAL/S9V79e5yL
Date: Mon, 6 Oct 2025 08:30:11 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Message-ID: <aONh89-5-llFZWue@shikoro>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro>
 <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="207WNXhuwDD0X5yY"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--207WNXhuwDD0X5yY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

> > > > +      - enum:
> > > > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > > > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > > > +
> > > > +      - items:
> > > > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > > > +          - const: renesas,r9a09g077-wdt # RZ/T2H
>=20
> I guess a comment like # fallback RZ/T2H here will avoid confusion.

Hmmm, if we add such a comment for every fallback, this will be quite
some churn, I would think. My favourite solution would be to swap the
'items' entry with the 'enum'. So, everything with a fallback comes
first, and the 'plain' entries last. But what do others think?

Happy hacking,

   Wolfram


--207WNXhuwDD0X5yY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjjYe4ACgkQFA3kzBSg
KbbOFRAAgYqPGrN3u/3Fx50PlzcwzNKImy/8KWT6UvMCdWsvfhDK1AwRNCTH34F/
+2jEn5LDB7qfHP+Apa7d9bKPrX1BQoNM5UwmEI4WCEt7UJbZtTcx66ekqLb8jz3T
BRJSE3wsk4SX9Bd98dpQ3X8qHHYli1a2LhDv408MfchYzVJ/HcEAdneXqqUaVuwN
ZXT+rcipc3DWYTNlquil+Z0jlbwtLG6QXcuRiVP03y/B5/QeMbbozPILj2ybXP5x
YRAnFLJmLeW1+wfIb5OjbydzDif9UD8KpDcP5/NLECGuLDbvoXQVCAaXEX/PHEeF
4WV+xhTDR7e09CmWKYUPsp7i+M40obXm7KRb3UHlPucvkXxz/ZYvJecpYb9HoKXy
9J3NeSc0zCwmnita51dQxrBQwxSakSYd+J7K4GThkz+iE0GtX64sYtb9orqxO8+L
jPjCCUqier/CR5Mt4aRKHfUWtQ65kVI6h0XjGN+XYMooIIDKcXBf+oZD4EK74nhP
XUSfVEpP8oJgO6EpiZDwRhW/gKadZ5I9JZCdJxMI5dxIs3ECBA1mBiYmnnhIASMe
Yq3qFzXln3BUznAR4xZ5jwtaNIQQoYmESuIE9QhkYgg3T8mqOMlkG6fvt3aLqeU5
W0935mJenwcr4I1gVoAFZvEmzI42UzChBKCCV2OL54768Y3Jld8=
=W/0L
-----END PGP SIGNATURE-----

--207WNXhuwDD0X5yY--

