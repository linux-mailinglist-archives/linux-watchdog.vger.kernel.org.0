Return-Path: <linux-watchdog+bounces-1174-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369090F5B7
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Jun 2024 20:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938EF1C20F35
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Jun 2024 18:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08152156F28;
	Wed, 19 Jun 2024 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8tqlxfr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB89E82495;
	Wed, 19 Jun 2024 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820458; cv=none; b=Lpov3sOBrAxxa45VzJYKr5FrGOxHOeFqr9TgRRDlYkovAFr1q5zrgP6Nx0f3Xz2eBrNQyP3RF0xVMYKxexiAmnD+QX7Rd7eX8ucvu/pUmo0vUFOR7DJj37YkMGg3VMgwzi7Cs1FiI5/AZlYTM7xyvGi8OAu6kvN5s3bA2n0/8Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820458; c=relaxed/simple;
	bh=WpG/N4n7weTtDgFu1xNBgVcm3zzjW8++gALi+2OvWb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXn7RM1WN7L6Ig+mxD8k6c30Rbaj4oTCx48v5qgAl+ewi7Si6Wb8eNFBnipfdpr65OKAbHPNOaxk3Ow8ZtwteAP7it3NIih3/SBAyvFkmpjJPdlh4Ivne5EPFfgImuMXzjaMn+ipEi5FwoWJktXK8n9aFcVvpDVFZ3Gyw7Y1AaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8tqlxfr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D688C2BBFC;
	Wed, 19 Jun 2024 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718820458;
	bh=WpG/N4n7weTtDgFu1xNBgVcm3zzjW8++gALi+2OvWb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8tqlxfrsI41R/48hIcaPq5WIQQmsEBbXcIiEBOIacHqvIGX1wNhnOXTWLt5Zjm1z
	 nAHo/sgyV3Vvw7jljDE9VCiJ7etcVHx5Svxpk8BxNsDHgCuswSW1brYtdQtWrbM/2Y
	 av7u01E57DDQBql11Ut5QyDNsWUaJQiYlHOKTaU97mFqoqsN+TL++3FzbBbufqSVWs
	 kM2Ho6uxBeeqRnSUl0SDaA/yVEdCKGNXpuA8n3wk9sXgFlBdFzcFuZ2tX3c+Mk6jC7
	 Yh0Uo02aqpKYqgN56D/KUJUuqoFSk+sij6gj46ont2Ykh2YKxHLIBMGVn7w3JnYt9L
	 g6aJ77zY1dzKw==
Date: Wed, 19 Jun 2024 19:07:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Document
 RZ/V2H(P) SoC
Message-ID: <20240619-operator-species-3e1461c8fca5@spud>
References: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618222403.464872-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XyJELvnlnScZvZ1t"
Content-Disposition: inline
In-Reply-To: <20240618222403.464872-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--XyJELvnlnScZvZ1t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 11:24:02PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for the Watchdog Timer (WDT) hardware found in the Renesas
> RZ/V2H(P) SoC to the `renesas,wdt` device tree bindings. The RZ/V2H(P)
> SoC features a WDT that is compatible with existing Renesas watchdog
> drivers.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--XyJELvnlnScZvZ1t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMeZAAKCRB4tDGHoIJi
0h8LAQCEHzUHsRWgDCslHOLKb9AD8wepaccM/cWws1tCOY0y1wEAg/fqrRdK4BW0
M/m/yisdgfqFGfcCCiihOWBcIoNTDQ4=
=bYDp
-----END PGP SIGNATURE-----

--XyJELvnlnScZvZ1t--

