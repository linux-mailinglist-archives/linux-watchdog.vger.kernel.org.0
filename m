Return-Path: <linux-watchdog+bounces-1056-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C218C1214
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2024 17:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E001F22057
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2024 15:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CBB16F26D;
	Thu,  9 May 2024 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AltqiRLm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65415F416;
	Thu,  9 May 2024 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269110; cv=none; b=tfilu2IAnAzJJhYIAX4cm1oig0aq0W5rhp+Us6E/vztGcnQ3AeLQCc7UMDu+341BKUjn1pe7ubZugp+i+C9v+k/liflskOrxJXiotMakq6jzILXKv0UY192Pl+w6acBSCEwDNxSW2j4WKmpJS+1UzL19HZ6ey++vA5+lDZUHg+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269110; c=relaxed/simple;
	bh=Z6nBTl2tub15cRbE+wOBz8S45tv8vy9jvzdxn61d2bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyK/YKx1kiXDLlLsztsAWxB+YwdiNw3nUlETONJvF/N5cPIq/mOjVWo5kfWOYk2DYZx2CLn2jlYbXYWSMmN7Vw4J5rBeQ5+xWLhluP35lcJST/XsEn6LftD4aMeXW8+PLx0JnTaJlyVB42sMXNlyYOBbEkR4lhnAz7oAn8kDaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AltqiRLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F545C116B1;
	Thu,  9 May 2024 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715269109;
	bh=Z6nBTl2tub15cRbE+wOBz8S45tv8vy9jvzdxn61d2bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AltqiRLmTEUGA2qwnUvx5AvO6VfxaZWmKYCao4I5+C6/RK/ZB5CBvT0AWZNltbJg5
	 JhMhCPozurJcVts1pjCLpzN/GWovS6D/w14hZVmQwjWCO88NCdZZzd1AaQzVzECuTc
	 dOwX1+EMMVV03NkMIlbmV11Q9jn9MNyRET6BpootdvSb6QPVdSqDbP/6sY5IcSA3Pb
	 2s0nQA6XPOmY0O/v171JB2AsMdrDAXhxsfiVGTFhq6OtsDwc/j9wwgXccTHX8pkXNC
	 szM2AEbNnsJPwh3sJsw5tpSjNy6M500tuOpY2H6IAADpnb/BRzZI3SDq9hFi9XG4Lc
	 xjecXzTeqcEng==
Date: Thu, 9 May 2024 17:38:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 0/6] Support ROHM BD96801 scalable PMIC
Message-ID: <Zjzt8mOW6dO_7XNV@finisterre.sirena.org.uk>
References: <cover.1712058690.git.mazziesaccount@gmail.com>
 <f7d454ac-6ecb-4431-a1de-c9b5d1240969@gmail.com>
 <eb03ec33-0627-4986-be04-8e35da390d6b@sirena.org.uk>
 <b6279be8-cf7d-4608-b556-3c01587f0d43@gmail.com>
 <f1e3d31d-8c24-4cdc-ae26-747f383a937b@gmail.com>
 <b6ded975-1d16-46ea-84a2-8799b36e1270@gmail.com>
 <ZjxaP_BNWVufJb_X@finisterre.sirena.org.uk>
 <0674ca23-2cf2-48a6-84d3-e0936d50dd8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EXBB/dSJ5rRrt8TM"
Content-Disposition: inline
In-Reply-To: <0674ca23-2cf2-48a6-84d3-e0936d50dd8c@gmail.com>
X-Cookie: Sorry.  Nice try.


--EXBB/dSJ5rRrt8TM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 09, 2024 at 10:03:43AM +0300, Matti Vaittinen wrote:
> On 5/9/24 08:08, Mark Brown wrote:

> > > > > > So if we arrange to supply a name when we register multiple domains
> > > > > > things should work fine?

> Thanks for the guidance Mark. The controller name is not a problem. Problem
> is that I don't see a (proper) way to supply a name for the IRQ domain which
> gets registered by regmap-IRQ. IRQ domain code picks the name for the domain
> by the device-tree node. Both of our IRQ controllers would be instantiated
> from same node => the IRQ domain will get same name => debugfs will
> conflict.

That's why I'm suggesting to add something - just put a name field in
the struct.

> My "solution" was simply dropping the ERRB IRQ from the driver (for now at
> least). I did send that as a series without 'RFC' - but made a mistake and
> restarted the versioning from v1. I am currently working with 2 other PMICs,
> one of them does also provide similar setup of two IRQ lines. Thus, I think
> being able to provide a name (suffix?) for IRQ domain when registering it
> instead of just using the name of the DT node is something I should look
> into. It's just nice to know someone else thinks it is valid approach.

Yes.

--EXBB/dSJ5rRrt8TM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY87fIACgkQJNaLcl1U
h9CVlAf/acARHE9oLNx/H5/+ylgEpV9IP4mlgCrINDGVbXsV3GC0CUug/nmiJsiQ
YBLdl280Fq0Gd1wOAnIfLLqEbvs05J9fcjkzTzXkQ8t0TtPN7B5taf4Hsnm0bHEm
5mevVDR7BSV/ZvLMq5VFEl3SALsmPcso5LVsD/j5ZSfPs7Vpg/pGkTruihBMPUp5
DQGaddEJYXm1Dy1rOY3CPuHsnjPOuVdyUEVouTARyrluafKT819eqhMd8jpYtrDX
36RNbVfxrwirUBKTZpuOlj/a4zxxtpp2BV3iWSoyWXK5lipnpLYlJGXb4KQrDr2S
LBJcz8g+LS2wF2OVXtakMVzunxOAsA==
=Ry6h
-----END PGP SIGNATURE-----

--EXBB/dSJ5rRrt8TM--

