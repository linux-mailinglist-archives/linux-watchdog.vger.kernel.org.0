Return-Path: <linux-watchdog+bounces-3934-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E24D2B17BB2
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6507D1C24539
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9395F19DF5F;
	Fri,  1 Aug 2025 04:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mNRflqaC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE51917F4
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021444; cv=none; b=LQVNDMTiwGOP7y4MJD8AJh+LTTPnjMdHj7QxQGOuNQAdGqGZND/ze0WtBNEgWwNq9u6xgO0GXC8RE2HlGD0vgybzzgRR7BAQ3K4BbNM7ClEXW7wIx5kya9dKiA7m8DxN141GcCZ5wEaiZxONHd084JrzoVeSHtWpdpQqtilDZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021444; c=relaxed/simple;
	bh=vO/9DOherD13eAVXbC4GdMcZKScP1yPg6vTF9yEHn8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcwdSf+uvVupTU3g4PlPoP0JWpC/gaxMjUszDCnN4L57ymU1q2Z0Onl7Pw2v+phpD/ftfyDSvYxFPxQ3PqMWDWX0wupBWx9mkLL3EAVos4nATz7nD2MnnsYnHbntH9LjNm23wELoQzAofG8q/7RT3CDPRpPDMpCWjV4mz1ImvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mNRflqaC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vO/9
	DOherD13eAVXbC4GdMcZKScP1yPg6vTF9yEHn8Q=; b=mNRflqaCXE2U0Qyh20R/
	GuKSnOww3xkEYmUq1MxyfoKlDA2UPjkIaoGHFd3OHJcaxZFtvm6/DhkQkWkn+8Vc
	R8+hhQhR3oCwseCKrKXKe5T059jNFlkdepWziPgmIKfCmz7cy0XFRMVam9qN05a2
	CI3PWlkHp6q8OSd69Mf4F5sonP39zrD6hXiChp+TOnVqIoE8Vo5X78R+wMAz/piP
	Z7n7nMFl1dpmX+kscUiJajIgy2SjxCi3OnjPweRxl+3DEAqLN2IbImK6reyExf6B
	aTVf16lH2mZb27KtiMJW+JUnS16xuoMEe9Q6b63RWvIb+JbkqWycBaHnn6fGrJzK
	hw==
Received: (qmail 597988 invoked from network); 1 Aug 2025 06:10:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:10:40 +0200
X-UD-Smtp-Session: l3s3148p1@9wfh8EU7oLAujnum
Date: Fri, 1 Aug 2025 06:10:39 +0200
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
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on
 max_hw_heartbeat_ms
Message-ID: <aIw-P6zkQSOhvYJW@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QUDf2e7QtzAv4yzf"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>


--QUDf2e7QtzAv4yzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Update the watchdog minimum timeout value to be derived from
> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
> consistent minimum timeout in seconds.

I don't understand this change. Why is the _minimum_ timeout based on
the _maximum_ heartbeat?


--QUDf2e7QtzAv4yzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPj8ACgkQFA3kzBSg
KbbH8w//fRE5NIPVNfV8I9QYnogwrTri76eCvmd+iYGF51MJ0hmZaUB0Ocw2BUIO
0/xLLhcG9/UVGfH5NgWjcJU5Y6CVVBNkvorgGPESo2+9ZDgLaigm46szP6s8HGij
ufAMd6lOFyQX61GaXdX2oGLSXsBhQ90CE/WATTZaEV4BndzSss6VPkonfMCg/iaM
8GNpXWqfx7vfYbP/nlyfdgE1Zw3qyeGcGZ4wlDiePprne8ETt8f/hsINFAuEB7tB
At4hRyq1bMkZrsbYFsAikP/9max0JGEOiQAXHcANJuV0RyPZ0phT4xwBlfOKkkSJ
esJtW3HjTnu+T6WnQ1MlWWEpsC6F+ySwELBUvi+7pSHslqmWmwnGJTHyJ0U565wy
GzzTlSLCqXer05/eqP3mM+QOv8Y8u/Tm5nk/lVW7UOpIQ3DFSjtpRJAdMXRqKiCd
vzlQJyncz68nbUjkzGPK3rdVeJCdYIypMsxbVUJOr1g+v93N+fMwpTDxzE0+tLbZ
AEc637ou1va3cwbnpMzvW8pR+iWnywTTkgNerUfJmpvFqmbf64U1udgzS5FWFhQQ
JjWaSOtuSp4dqGdWgxocDY/sZG3M0eT6UTzt6WLpwMR1sOXq1yXZ0MhHn8DsozsB
OcKs6sV0vP+0hTw5kuu+F4sicwhYGqCaTqmZ098L2jPA1Uqwio4=
=0UGs
-----END PGP SIGNATURE-----

--QUDf2e7QtzAv4yzf--

