Return-Path: <linux-watchdog+bounces-3935-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33DB17BB8
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673415A36DD
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A281ACEAF;
	Fri,  1 Aug 2025 04:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BvuNgimQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB721A256E
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021559; cv=none; b=uvF4zhAeyZ8LadmPjtxVNt8Jn15SmxNzNhBu67NLIjEA2XXjy0IhGqvmIfW+EYNQrLWfecmPYiRWjiomaVGI2eKTxzLFzf5WA0cn4wRno1sH1FRk7YZ7QPjSMVOPaUeTkQX7rHbuFLHa7g/KhT8qC4SF4wID0yCOafL321w7M9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021559; c=relaxed/simple;
	bh=L2R+QIwlRcdBjhlXbYk1YCn7fUK2S4/WzJMf2lhncTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX04BJHU1S2KCHbhtrXubKLr6cSMSn3IstPrR0l6f9ZuCnsPQkEWO0jiTaChjD/y5jzSFLEzvehprQf3LxJHslBdzxJk6RDA9ZmJpAVTsBmiQLRG17wYCfnqzmyUI3vNVTl8UQIy0xaG709ahP4AyCAH24SIQSsRGVCUC2CMOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BvuNgimQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L2R+
	QIwlRcdBjhlXbYk1YCn7fUK2S4/WzJMf2lhncTk=; b=BvuNgimQv0bqbcdGh/A0
	c2o3lLHLPHM+dOkDmx1ighW4MMzJB6u9zT335smE4wPXdMx0hCud9QHoKzRDTlN2
	mAu2GUgau87dNxJJGg80SaydU1mAi0bPST7A3IqOdFstb4EBYCTNXMrqi6dVOFbG
	3eiKmK521oJ089laQybFkpIN+tYVsnoQLF8H3ag74463uKBL/bhFo7qjBuzruMks
	jSgsLdfJL/2ckO/5z3ivEcs8nooN9VODJ/38AiT0JT483uX0Wc+qU17kPwl/DbPM
	ESfbYuXBKHwviYapu1b/gKO0ZULouMTexwSNXRC6MDE8vzJhyFSCNKSiCleQI2Ro
	PA==
Received: (qmail 598608 invoked from network); 1 Aug 2025 06:12:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:12:35 +0200
X-UD-Smtp-Session: l3s3148p1@eXO890U7YI4ujnum
Date: Fri, 1 Aug 2025 06:12:35 +0200
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
Subject: Re: [PATCH v2 8/9] watchdog: rzv2h: Add support for RZ/T2H
Message-ID: <aIw-sxQgdzTSLrJ_@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BcsBj4sLoejwZciR"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-9-prabhakar.mahadev-lad.rj@bp.renesas.com>


--BcsBj4sLoejwZciR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:14PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control of
> the watchdog counter using the WDT Debug Control Register (WDTDCR), which
> allows explicitly stopping and starting the counter. This behavior differs
> from RZ/V2H, which doesn't use WDTDCR, so the driver is extended to handle
> this requirement.

Is it really required or is it an additional feature?

> To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_data`
> structure. When set, the driver maps the WDTDCR register and uses it to
> control the watchdog counter in the start, stop, and restart callbacks.
> Additionally, the clock divisor and count source for RZ/T2H are defined
> to match its hardware configuration.

Where is the register placed? We need a seperate resource for it? Can
you kindly give an example DT node for this case?


--BcsBj4sLoejwZciR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPrMACgkQFA3kzBSg
KbbkJhAAtSurZuYW9Juu60nY6REw+/Sf2w1QDz7kRBittrC4jdAZlm0zH3t032Ol
NXAs3Q9+t6MPVmCOb/1QLW5T7lsjl+fmTYPLunI9/cox7tlsBTY9PI/IzGlA/Nfr
DBUB381j91bOz4X2Mtkzy9dyT5C78SLxe5nKgrYpktEhSX/aJLl1xsTkEpdyjcWI
Of6z+O/MghwUAu7UtqQutPIJTlDJRM7fA2jjVSC159bEwFCoABQ9nCXqPcfy5iI6
oTFZ0y6WNcantcSVAOXLVK27m8qpYldyW2Bs2nbO0XRAzyOqj6bfE+zr8MRZ9nlY
shlHl4A0VGZjBbuTYPHjB1YA5I3PQLrPcH7apqq4tkP9R+yia4MXVDPeeJFI+gJy
hymqCBz7dqAAT+vPDc2Hs4Hf4MWi4Oe4BqZ9GyfD2IdNLJByw4Ncz9ujiTpeQ6oj
rJ3z8NeLNvjFkzU29rzf5AfePZ2tqnHZazt01B/gb7LHj7y4C4SA64xd36AFKIOz
Gxj8s3Ei3vBuX2sMQ8rr5I775/b+9xUnxCsuy7g9a9zL1V6YI7pHS3Re3Joxhelc
0NgCHyHrHDZBMetJ95crIjsxW3dELCib6OPjeG239/I+ZQf9wos2vSwv1+Bk8VOz
KHGyBmUeMz5MBJlvmvuB/ExsmTc7XyV7BKzyB5Pvj6VHo3OACDE=
=Pn+Q
-----END PGP SIGNATURE-----

--BcsBj4sLoejwZciR--

