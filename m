Return-Path: <linux-watchdog+bounces-1402-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE43933DE2
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jul 2024 15:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1795228464B
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jul 2024 13:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA67E180A81;
	Wed, 17 Jul 2024 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NM9lXpcc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD72180A78;
	Wed, 17 Jul 2024 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223868; cv=none; b=kcQAPSsragsPfAPLi9OcnSsmSDAxgQa3EFNckjNdPeXUOT3nDZUrnDhj3hqxUZnb7bnbVMq1Nf8ge3epgWilIP3kysVUlnPK9Ljx2K8HxVaeHmK6JGrgNA6Dlog4d0SheTDsktcrky4rsXrwRIUsKt4vanSAmYzn9qBACuQTSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223868; c=relaxed/simple;
	bh=ZmYF+kWS2T+Ax92kIFV+NE/CUEzq4tNa5S6GSB/hNCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nadkRyhNlzaYuuvWEd1ENlUU9UjPvV1zYkGy5JbpcLnI4f0iN22hxocGk9NctoRWEzdIHM7ipcp1zOG7pYu6VudV+coxNWYLuf0pyi523SHpPWC6B0sS4Up5GxFNaWWlL6mEf3sMNW2st2PeRKT55tG5l1omYL5sbGPuIR+ult0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NM9lXpcc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39943C32782;
	Wed, 17 Jul 2024 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223868;
	bh=ZmYF+kWS2T+Ax92kIFV+NE/CUEzq4tNa5S6GSB/hNCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NM9lXpcc0TD7zrscnSGIiWEE2e3qIAkwtBUYlJ8sA4o/67jBUq8WoYOFiR6IPqc2R
	 JqvRHg7YLTxTUYrFRXdHoYWrZ60LjaVrhJoYgA67sveYvmnw/btn1PM3y3lrCRaR3c
	 IBex4Gqtw51KITCiVFaY8aEbpMRF2RCPBKVs8doKU68+ObN9pWDPRZdTN2cM9i/wo5
	 DpxpP3Nh8UWJv4je5OSvV94w5Dw2HHrrAZ5PYjnhi6NBCnw3nQXxHmT67P2PHLfJS7
	 O20Hw7WAsKNGoRSiieo5kscsM9/T35gOTDZHT+Ja74mGJsDnGskNnckZcmTY4VsSC7
	 z8UtkiPe0N1jA==
Date: Wed, 17 Jul 2024 14:44:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] dt-bindings: watchdog: dlg,da9062-watchdog: Drop blank
 space
Message-ID: <20240717-gulf-buddhist-10c9c61268c1@spud>
References: <20240717115649.131914-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W2bQipisghSZ3IyA"
Content-Disposition: inline
In-Reply-To: <20240717115649.131914-1-biju.das.jz@bp.renesas.com>


--W2bQipisghSZ3IyA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 12:56:47PM +0100, Biju Das wrote:
> Drop unnecessary blank space from binding documentation.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZpemkYsK6zQgGCF2@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--W2bQipisghSZ3IyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpfKtwAKCRB4tDGHoIJi
0tZoAP47Xwn+mBU20z4vpBdIdr4O9EG64n4/jf12dj0dnGRnEgEA1kGYUxSJRkx/
btfw6oLDl9ns7zFVajxw+gyioxvvsg0=
=CWh6
-----END PGP SIGNATURE-----

--W2bQipisghSZ3IyA--

