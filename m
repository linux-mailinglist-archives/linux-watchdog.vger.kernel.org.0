Return-Path: <linux-watchdog+bounces-1498-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52150953721
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2024 17:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEE201F213C5
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2024 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C621AD3F7;
	Thu, 15 Aug 2024 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSMo27Ik"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4A1ABEBA;
	Thu, 15 Aug 2024 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735586; cv=none; b=Z/yvqEsZlBzoEq3glmop7WyPzf+qIz1Tjy5v/AucdabPyiy8dfs/jIuhsjf2qwQ2Y4XPS7uK/ChjPFHefvw/zYRPFFzuLJ4wnA9TVBA2YJCz+3CDRls1BMocVCGabOdubIR7R4VSdh3HCbAIj6W8JhrealSrzluJZiq6cW6DnK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735586; c=relaxed/simple;
	bh=chUBqqmXI7iyoUjg33iK+8MmTB56lRavf1zo+HiDWhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quLqKgjC+XXPvphuDT8zlfbiOOj5zCWH+XYr0QWbm0YfgiKqETuzUTcq9zL4IibTx7QAUldp2SFo4o8DXntFEsmKD6c2waBwrsnDdecZnMFqRXvrkhlD8ZsBYoyYSiG34InJwq+JIYfGWG88g7Zka7sJntpBGP/YmFnLD3lh0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSMo27Ik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F36C4AF09;
	Thu, 15 Aug 2024 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723735585;
	bh=chUBqqmXI7iyoUjg33iK+8MmTB56lRavf1zo+HiDWhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSMo27IkMXuq/VIdsHrCQ8QBQ+K0z+jElfn1WoPOQMJ4B04qm/SooLqbqtsPDykWM
	 Ayj+ivdH8vN5Iws5aMXxjZuHDiwhCcbrLCJZiF0lModEFNB4DvF9Ng2FwpfCVW2xqF
	 NHMatld/1bmDlW9+Gv2rfY2Xs0hwuthBnyBlZWXqvbe1VY49eUSBASVArScF14CoqC
	 okK/yPJGk9z40xQ2QBek/JOcmTR/HZlryJfvfdxZvowTIuMY8r1sleqa4ItTi9IQFp
	 Cnpd5xmKZlmDVdlBpYFu4DirY7Df1oYqigaex6PtKaIdeli5Lzp1xZ9+1fWm07gzeh
	 zjrFxtAxI+KhA==
Date: Thu, 15 Aug 2024 16:26:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: nxp,lpc1850-wdt: Convert bindings
 to dtschema
Message-ID: <20240815-undocked-shun-20797c63532c@spud>
References: <20240814061210.56213-1-animeshagarwal28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L/843tFBv2lEsulm"
Content-Disposition: inline
In-Reply-To: <20240814061210.56213-1-animeshagarwal28@gmail.com>


--L/843tFBv2lEsulm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 11:42:03AM +0530, Animesh Agarwal wrote:
> Convert the NXP LPC18xx Watchdog Timer bindings to yaml format.
>=20
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--L/843tFBv2lEsulm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZr4eHQAKCRB4tDGHoIJi
0lFhAP4jwpI7e9hAqXex3sii+gGBYhQ+/JCOORpV8aybJoWzmgEAx9Nj2TQqqLY3
hGn8Qar0qfxoKTwNj/NxF/WlhgRU7wM=
=TUhA
-----END PGP SIGNATURE-----

--L/843tFBv2lEsulm--

