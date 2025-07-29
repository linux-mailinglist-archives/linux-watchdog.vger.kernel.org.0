Return-Path: <linux-watchdog+bounces-3925-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C78B151D1
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 19:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 493993BDDD8
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 17:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D30D2980B8;
	Tue, 29 Jul 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZMJ+m0Fc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49437288C2E
	for <linux-watchdog@vger.kernel.org>; Tue, 29 Jul 2025 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753808935; cv=none; b=tcmXs/kZSKQQb5NFWqfP/I/pnHgQq919PYmmg+wzzhd+XgM/DMxKvYD2iElvCWyP/4o4YLyOSQ/aq5ud6nYaNspF2sh6yGIQgVFN/PF8bcvZNZyWwuLJFZcz8x2ZWj7mlY3lr7YfIfmogb5iTXkwoanQWw8mEZgF3wnY7nUji7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753808935; c=relaxed/simple;
	bh=1/CKMx9GIWSUCPkym2GvUCJ8WAG7TrBGch+iVBi5p8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsXcOSYLJEPLXhKdds5d+373RlFRPHAjuGZWSZthBo5HcyIEWZ92XEUyYWOB+K0fbo0uehBnOR5xbgidUff9Pm3uc6aGp46oKtxE0qGiyaqOuT7f0dIC23xnWbnJGC+fPe2YAMTt4xVy0VkhUG0xmANfRSDxRuqar/TaSlQTr6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZMJ+m0Fc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aM/2
	muNO3YLCpDyzqzoOv6VbpMtuGVNgJceaDauVIOU=; b=ZMJ+m0FcN61eTjdcBdEz
	isnaqjzdFrh4VEYv2ZUm1Dotvisb2mu3AQX5PzT1TA+IqsbefG5eCABPE264K1ZZ
	pLZOa5w31LQmVGnzUTwYCalhsKdRX1Adk90/57ADFGlTFq9jCEqeRhZ1U6Ve7cln
	adMtVtDg4r+IFKzq1zrEscFnkQOV3LxZJUpHuSOAl0jAF9IuThBY1oHKNhv3iT/M
	JtsQSnPyFebypmcmDwwj5iW4uZWyWf7xcYjrCNYjKa9hGaQvfM3jdyzhtnGow0SZ
	L9pk+WmD+hqP8Mj2nEXB7ZJFSjNCKk/vnXqpDoiGnw5J71BExUlmCZmjO3KTxiHs
	BA==
Received: (qmail 3879558 invoked from network); 29 Jul 2025 19:08:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2025 19:08:42 +0200
X-UD-Smtp-Session: l3s3148p1@weLVdRQ7hrYujntT
Date: Tue, 29 Jul 2025 19:08:41 +0200
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
Subject: Re: [PATCH v2 0/9] Add watchdog driver support for RZ/T2H and RZ/N2H
 SoCs
Message-ID: <aIkAGUVGqLcFBoXo@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F4YqoSD805a1UQqF"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--F4YqoSD805a1UQqF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

>   dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
>   watchdog: rzv2h_wdt: Obtain clock-divider ranges from OF match data
>   watchdog: rzv2h_wdt: Obtain CKS divider via OF data
>   watchdog: rzv2h_wdt: Make "oscclk" an optional clock
>   watchdog: rzv2h_wdt: Add support for configurable count clock source
>   watchdog: rzv2h_wdt: Make reset controller optional
>   watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
>   watchdog: rzv2h: Add support for RZ/T2H
>   watchdog: rzv2h_wdt: Improve error strings and add newlines

Minor nit, but still: inconsistent prefix

I'd suggest to use "rzv2h" instead of "rzv2h_wdt" but it is ultimately
the WDT maintainers call...


--F4YqoSD805a1UQqF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiJABUACgkQFA3kzBSg
KbY44hAAsJk3aasd05N/Ty01a712YZby7tEwmy+NSUYdOOPYPE9HDRMTukcSIhQe
sJ0PIUjVoQ6LEy+h8KYek0E8fnWq/drKTgkGEvhZemmv8AgoMwDSB7QiaaMN6KiX
JJn7A7ZCzq7sWP8Vx6jtAq8f9tbod9E7ER8cKyJWZVozRpOnxOPMXrVrubY2JN8w
e+CJEHli/0xDhHOE2eAaC1CklPO2duvm0+2Eqo5VQfJi0Wne758PGS3zTv/p4S8N
WCjx3lwv3EmoCMFaV66i64K1GVhCnpAqsfTGJAIbpAip3C2dslPFeLM/Qk01aJ0g
FzZt3OWEg+l14cDvRgun0PFjGaQw0qGP8tFM7yIEr4EhWMWxbZBVf1mz5yVAEWxj
VOjJgM409JvNMV9pjE/JTTT2IG/ThTLlAVtGR/Gjg0p1bhkBMdkGCHbSwCDEx3pW
mQLh62+NMyIkjt/4zf0avu05LbUcC/0E077Q75cLOm98erN9hu1puM4Z/4kgnxtJ
wgcTAPQx04FNFh8ZOASZ5ofFHQcwURwAmySK1PHcr8f5WvYS53tjkHSjAWHFOM6H
oMVUgilG37+Tr8PTOhaHrJCGK5JWtMI2mj/77RyxzpFAYLf6dnUcNrEX9RRDvuNP
aZTd7eBKZTwO7cUHNaFOrPz+fYBXFZZxFTKV7ba4Rb/3e6f6KxA=
=pb7N
-----END PGP SIGNATURE-----

--F4YqoSD805a1UQqF--

