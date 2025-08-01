Return-Path: <linux-watchdog+bounces-3933-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA1B17BA1
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0779F5A1C84
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1341917F4;
	Fri,  1 Aug 2025 04:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CQBsV+ez"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E919D082
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021101; cv=none; b=XTL8xxRGslHrk4p8UP5nNgk8T2CAHh6Yvkz386A06lTqor7LCekF282fZumjosNiA0NjgNedE0hcnd5FfWtDLEUc4ru5JlE250zZ9wphX3IAxogRR6ZnndRjOo5bayiE9jSzPW7xmXLqi8i9mrAgJYYyft4ffpyEEobJSSz1x3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021101; c=relaxed/simple;
	bh=QrZVxrl0B28V//etGcjReWqVqdV0F0vTZuRrdkPzZIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkcRV6adIDyfEunj4belrd60eE/VzOq5Pd0QDGl7iWhSMMdXeMyElokFHqdpeRm7gjDq9vfAkBzCuV3E8cPCmNgmx0vFJ5sA3qibu+mTYFFQh+jNFu178nQNpfHN0nZ4eW6n5Z5Az8Q3pOkxwBIw8BmuUSGezjlO/r8Ejj2ylAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CQBsV+ez; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QrZV
	xrl0B28V//etGcjReWqVqdV0F0vTZuRrdkPzZIk=; b=CQBsV+eziDOkMPVQ8cJI
	vifPVpZZlEbt9tnffYbqTE6dC/qsoxtoSkb6fLSsBKk8OR19dlIAxW+2jalbV1i1
	dsv7QicuIYBXF6vtos6d8QcxcLr1GPu6BKPvIHSPfEuNPPH8giJCp4lw47W9IDVH
	QauAcD5EaK6/DA+ASgc8ZveJSb9T37gj9T3eEgsAuqH0UGw2VAovgEbV2YO94x4U
	9dpPodAZwvmNGtuDKUAcpvelxPjgdje/DCUQ3D8idCGLks3DDnKHbWXbmvzdqEdz
	sH5nTvMXO/JkDeQIOH+qxF17KqisfO6qRSIUAUjGYt5ZUChCsTAtbi2TgCzl9SG3
	1w==
Received: (qmail 596386 invoked from network); 1 Aug 2025 06:04:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:04:57 +0200
X-UD-Smtp-Session: l3s3148p1@AGJv3EU7dtEujnum
Date: Fri, 1 Aug 2025 06:04:56 +0200
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
Subject: Re: [PATCH v2 6/9] watchdog: rzv2h_wdt: Make reset controller
 optional
Message-ID: <aIw86G4sOJH0yT5i@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hpM1e4SnNOaXCbKp"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-7-prabhakar.mahadev-lad.rj@bp.renesas.com>


--hpM1e4SnNOaXCbKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:12PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use devm_reset_control_get_optional_exclusive() instead of
> devm_reset_control_get_exclusive() to allow the driver to operate
> on platforms where a reset controller is not present.
>=20
> This change is in preparation for supporting the RZ/T2H SoC, which
> does not have reset.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I'd suggest to merge this with patch 4.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hpM1e4SnNOaXCbKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPOgACgkQFA3kzBSg
KbYN4BAAnQT5PS3XnOt0/kwZrILLl7AO5HsZkhAau0i75SuUMqI5F36Z5pw0xRF5
Z/Blwb0//lu+B4V5reknR6JLcWiSXCavGhReD/UIDPNnhWikd/rIvHKExPpi+uRk
svd9VMs9b3VzOa6W3mA4gLcJoua4lAqwhEyMTwhC5JIBC0aTbIfV6Ui4+SDh8qAn
JUJvxvwWWoB0VFWz1KersenWFDkvXCPIg5yQR2PCPaJrlXPYO558dVAot0cEyQZZ
b+6EJ+QUC0BuXa4REwEjooDEWx5eHxw646LelCLoop0KWldaYZa7AW/rmt6ff55l
qMvhneGEi6DQz4EdCqPnUoX73DtQyZVvg5rYTq6Unj3lj5/C20iyo8duKAOzCsuV
TuPk13IX7JpXe3QRZyzgkKKhzAmxuY9PazdiQMop9Ol+Otrwwhn3RyGIqvuSuq8u
tm4Lugm+VVPWuk0EaWHqZTadeYJM/7b87TDSnw5B10b4/gGZER2s9otO/2GzypfZ
Iumadpc+7sfN44cIRPQSGL+WVC3pPbDdnWfnm6cCCNrtdHJ7a4a5t67Cc62ilgUO
jBV52LybwlWfox+4yEB8ytBwdd8tARjUbE5fJApLHp28cYsr14+qWzifBqyNYIIb
yT/8BlSqIgEibXoiLa1ceEGumnYhzxWUKaXjYAs5lIK830rgyhY=
=2SMx
-----END PGP SIGNATURE-----

--hpM1e4SnNOaXCbKp--

