Return-Path: <linux-watchdog+bounces-3932-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608EB17B9D
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7421C262F3
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07F12F5E;
	Fri,  1 Aug 2025 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PSP2NR4N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F516F8E9
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021081; cv=none; b=qRRmWfhrSQVLnnjNhRyExT2dfh0gbiQYVIAfn/lzXPwqjWuuaDvyXWSRYyuNF4SsY8VJkL+lkkHoJdiC+1XpHd8EUJVoFopv/S7eYHRSjBFbnetfeV6MBipRr/hesIsLKeIWvAkleETDvvCdQhD+gIkalKROtTj4plWsemVW5ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021081; c=relaxed/simple;
	bh=mWrYCoazOVnDkzfeJnngvdRQaxfYqD/5qJWJWzqzvx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZByc2huMfc7ieNNjnBPwG8OhQl5t+X2Fm5+waD/0vk22ahZg926BrteQ7f7c8eeKbUhffMCnHhi8P4DU3dUVqKC/wUKBR2T/Rg9QzX4l4p9PVqGCxokizoJGjFZbY4xjQ/ypwLV5Ks9J5VT9vPplXKTL1RbruMbGGUhWdsBOJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PSP2NR4N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mWrY
	CoazOVnDkzfeJnngvdRQaxfYqD/5qJWJWzqzvx0=; b=PSP2NR4NV/q1oKxRb/h/
	xSTeawYb11BmtoPl7vM/twwz69idWQCmVFe6Q/EN9tPnb2eQXLRqrxexXpktIFuR
	wz2KP909caAfr3B6RCpiDuW36AdHycHr5AuPzKMJSr6g0uqjdhwob8J1zlltJJyG
	KEAKXb6ir7ht8FVIbcN8lcySMIGfJslQ3thzgTTMMv5NB7mdJIPdbmuvXwp+dF9p
	M3AfZLx0fJrf+es4a34tK4hYesg+QJyyzg4bPAelMwu36+scgA3vYZUw2xS3ahXt
	oynU0KyjqLQjPXPiPAV1MxDACePrkPSg4IGmrcRVwendyxls4Esx1//WP+frNw8L
	yw==
Received: (qmail 596225 invoked from network); 1 Aug 2025 06:04:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:04:37 +0200
X-UD-Smtp-Session: l3s3148p1@kZtC20U7tpUujnum
Date: Fri, 1 Aug 2025 06:04:36 +0200
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
Subject: Re: [PATCH v2 5/9] watchdog: rzv2h_wdt: Add support for configurable
 count clock source
Message-ID: <aIw81PmMx-vKAlak@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0hvAupDXAlsb7LnJ"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-6-prabhakar.mahadev-lad.rj@bp.renesas.com>


--0hvAupDXAlsb7LnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:11PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for selecting the count clock source used by the watchdog
> timer. The RZ/V2H(P) SoC uses the LOCO as the count source, whereas on
> RZ/T2H and RZ/N2H SoCs, the count source is the peripheral clock (PCLKL).
>=20
> Introduce a `count_source` field in the SoC-specific data structure and
> refactor the clock rate selection logic accordingly. This prepares the
> driver for supporting the RZ/T2H and RZ/N2H SoCs, which differ in their
> watchdog clocking architecture from RZ/V2H(P).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--0hvAupDXAlsb7LnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPNQACgkQFA3kzBSg
KbZSbQ//f/NXM/UVghlqqtgebPruNAlOGMzv2csZpbcQVwJTx5ocwrvPszeVaPkn
6TlCo0YzraH0WUChM8RkxGq9cFnqwo+PY3D2y4D7V1nLybeKAuY9iBgvRqtiTxzh
iZG5hEOstEt6FjrzjRDzhKMYxe1eeYcdb4CWsgAhcoiEw+OP8DZKNazPCg2J/ZBL
Bg79Oe3xRwpQKZx4EULPYqANgWgP0my9y65zBeTsDkOsY0vtE4IFDagW8IeAStyZ
bGkj0+M3PEauw7pkC5i/u+A4hdNxl6ltFOLw31sTjSfEkHBTsTti1z0PRIc1pT1j
uQhL42C4UwyZNmARg30VqpXMmC/tP8EK4hTTnjZZRuiMY8Ft6p4juGsi+2mi4haC
WgbwDsPUsdD1iERO/P33ROyqXWDHSuz0ECNXoNaTy2wlByoXVtSeHGpcZ3Vv3Cqc
SQpTQpcYcHy7sxlJI1T/zHH8FNznBLivauYCEURxdmw1xa3esmdXB+nfnyztt83N
TY+TNqA7EZODv/fItIS6EAEStCkBW6ygxxAUoR6Z8StZrvniFrq3D8QmwanZ5L85
hYtF4t7J1irf7/nTbyREqFRjycYZ3pbMQDumuhaEKy4BJS0ObEx2pjec3W8zx+WY
8jTd1npE+YLmODZPb4IMy+y7favRCafYHDDE4VL19xF93NPuf2Y=
=oqA5
-----END PGP SIGNATURE-----

--0hvAupDXAlsb7LnJ--

