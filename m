Return-Path: <linux-watchdog+bounces-3936-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FEFB17BC1
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750A35A5610
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573661E3787;
	Fri,  1 Aug 2025 04:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bz86wYzg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2B80B
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021870; cv=none; b=luXiBh7VWOprQXgNsGDdRtp9VEaoJQK24Skt24/duK12M9Df9jyWTbsK+tPamA7Kxj3hK3UqwoxIOKXVekxoSgl5ph/QpzJatiWuWVp9Us9oD30Qhf2e5ZUts8A1GT4/ILasgrl+Xpgi9rqebvfQfrhXYj3k8fn0V14uQY545Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021870; c=relaxed/simple;
	bh=s+uTyO46jfpfSafFvF+QK3QIcgvDdZIDMr7VcbSO+aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX2uDmzE5P7nnuN6RbmDGNsk9ToeK+zx7f6pdJQ/QKJvHZuYw6K2cdujQl/l3DsJXc0ViaJDy2JGOFgN4+vx/6AFYvUxfDtlrBz4eH8OEnW45egwET+3e5iTCBlvDtp6oHLeb1QTDmAeW2OS6oa/j5GVzLw7HqlftjlyssPt6l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bz86wYzg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=s+uT
	yO46jfpfSafFvF+QK3QIcgvDdZIDMr7VcbSO+aw=; b=Bz86wYzgw3RwrIwByXH7
	EUcZb55l+kYKrfMe8qfaTEy9wd7cC2r51Zf6WlN6VWYY7ghtvfiMdAVDXsam8Mhu
	DnBPvyl0cDF25tdsks+l6FiPlsHd/W+nMPVGAu0vKhwJk8jrA9PrljBp4NEPKAun
	HXL1oizi/4kRUnIPDEU7nls1NSN1tMnGTv5UbyI0V8PWC0PaYqR4lrcYNgSdFwtr
	Auao7eIpivPc/VBJb7GLVPzDYUfNTU7bwX2GYPGACxsX2/8jefx8US+h/BU5eUVT
	Q9nxtmppQno89+IG7Qeu5UxcKNJdFcpvawhNwLM3O02oUCXu2qtpb4QWsNuX3uUL
	HQ==
Received: (qmail 599857 invoked from network); 1 Aug 2025 06:17:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:17:46 +0200
X-UD-Smtp-Session: l3s3148p1@dpw9CkY74s4ujnum
Date: Fri, 1 Aug 2025 06:17:45 +0200
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
Subject: Re: [PATCH v2 9/9] watchdog: rzv2h_wdt: Improve error strings and
 add newlines
Message-ID: <aIw_6RjK-5376mkz@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e6uUIYyikRfgvgAN"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-10-prabhakar.mahadev-lad.rj@bp.renesas.com>


--e6uUIYyikRfgvgAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:15PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Update rzv2h_wdt_probe() to provide clearer error strings when retrieving
> the pclk, oscclk, and reset controller, and append missing newline
> characters to dev_err_probe() and dev_warn() calls for proper log
> formatting.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--e6uUIYyikRfgvgAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMP+kACgkQFA3kzBSg
KbbUHxAAsjJWq7eIe7juYus5d3A+qleP+l681wAVbqlMyaHiJ41LGAnI+NMg34cQ
g/K+zzPiYzan6K5tZOIYc0avEp3053CuLXDVF3mR90Fsruv6nXH9j475qiML+rJB
t0HZ9CZitt0GWV3llxO6xIipgw7N4h4+Tnfxa36J5Mw47gD3F6AwH1VeI5PR7ti4
i+SlcANIqK9jqKcPIKwAa68fjMmH+1nr73Bg/j6XqD2OFXn4BfFiF0JPODSjJ68q
tFXhXGnr5hM599pDivUTHg8KY+i1UNmAIxN4484L19l9v1Fnt+6SuWJ9KwpkxQie
tCL0ySXQDxR7nhxcUcsnhfdTMB24MNN6uinrU3MOCvqKiGCgeVK1ty2PHKToEZil
8HpSayyhL9AMUPRbXvceDinAYlUP9gPjPAnCeCpjSTKKuYGCHZwpc3IjPQvAPi1Z
jCZxTZ6cFPOLdOasc5L63akte5zRRUWe045H67gvTrTHyXvhohRnzhnY5mdpWTJF
fwdH2FDa5AYSrjOo49miHm8icdGWaELzgQeIg8Ap+HR+K4uD6xENJ/bl3fAPSeS4
I1FGHmexdGjJmmmekPx4dzKsY0ZY6rH71F+fxcbyKbhgg9AoEYOZlagdu/psUBM+
djHLtNU2SrcL2riTIQYhh2LjWV7/vTjSic5A6o5gf1slTuKKgyY=
=LK9K
-----END PGP SIGNATURE-----

--e6uUIYyikRfgvgAN--

