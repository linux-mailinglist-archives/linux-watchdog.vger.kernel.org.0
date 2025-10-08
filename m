Return-Path: <linux-watchdog+bounces-4359-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD0ABC53EB
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 15:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2650719E1CFB
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 13:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172D2285C91;
	Wed,  8 Oct 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Hm56csVk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF03224B15
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759930817; cv=none; b=s39r1IJtGtVLAs3CCDFXDoF9SA3iuSe+5+O/dJNrkT+Xh8USErjB4pJobbKlQdaNNauWf7aZ+BnUBn55rVT7Httek5w5czSWn7NWhEfrJoC2CFOh2tjdlwMrdP+gPmOzfLjcihL9hIwaBpUV6Xdfhlx9NJHLiOHfBM5al6A+FP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759930817; c=relaxed/simple;
	bh=uCd0oFT2wjNeQkZVPleL3jtPHC1bWZiaW/O0YewUWV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ36X/XI9i0Lej1K1GUY25U3C5nt6c870EeRuEfw3l5SwMTI3hXyprjLQSUSpRLt8bvOxaXWWd8EEsVI2hSqQYoez3mdkzeL0G3uHUdYEHcZKJwcRH9tc+Fr8/IISnLaAOf8yphh/AHeDzsWa0oFPZFNACgVhq02Xax7ubOsQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Hm56csVk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KUpe
	Ow+dmD2bLA13SltvmvslMCpHj+UYI4ACyT5RaPM=; b=Hm56csVklsHZsSHQl/lB
	RwR9v8SD8WgDfzUf8smvTkTYjcLMKZkXzkEdZypFwDcK9BvVvRgRsesaBU9VOUMc
	BZ/p4f7pyF53thsT2OgajLr2TQx6Iz/7E7y15pOY4Trgh88O+YHSXvZzZ4eslCfb
	i7p7NrfX3BAnNkY3WHVdvI6HDoRj7I3ZSOnjknOKXSRZF+VP+PQGRU1rN2/nhmry
	RjXJ/BlsX3YfimlXhZeRcttdSi+wYaB4vzxkO+J27dIGLFVGX8JTTSNrHkFtt3mr
	Wz2bAUrpXXOLcXw8nvpdtuOBARUXtKduOhuAvliy5WO1BwTftBbZLR+ldwotJEkD
	Xg==
Received: (qmail 679544 invoked from network); 8 Oct 2025 15:40:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2025 15:40:05 +0200
X-UD-Smtp-Session: l3s3148p1@w7Bu0qVABNa57ts1
Date: Wed, 8 Oct 2025 15:40:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT
 exception for V3H
Message-ID: <aOZptGV6FB8eq5b6@shikoro>
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
 <20251007152007.14508-12-wsa+renesas@sang-engineering.com>
 <CAMuHMdUf80xCgCZE_NTbBX15tK7f8==ZbP8zvVS21pRyDMEziQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+B0yzqA/FZKTYHvT"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUf80xCgCZE_NTbBX15tK7f8==ZbP8zvVS21pRyDMEziQ@mail.gmail.com>


--+B0yzqA/FZKTYHvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for the reviews!

> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r8a77980-swdt
> > +    then:
> > +      properties:
> > +        resets: false
> > +    else:
> > +      required:
> > +        - resets
> > +
>=20
> Instead, I would just make the resets property optional (i.e. not
> required) for renesas,r8a77980-wdt.

Oh, I like that idea! Because you are right the IP core is the same.

> Of course, I wouldn't be surprised if the MSSR does have a reset bit to
> control SWDT on R-Car V3H.  But it may be a bit hard to flip the
> suspected bit on a system with remote access, as it requires modifying
> firmware permissions?

Well, in the docs *every* SoC except V3H has it expressed. So, I
consider it officially unsupported. And I don't feel like digging out
why.

I'll implement your suggestion.

Happy hacking,

   Wolfram


--+B0yzqA/FZKTYHvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjmabAACgkQFA3kzBSg
Kbbahg/8DUKWKLaM9CN3rHFzAcGShiQpFc71yx4Ca7iYo0LTVc65ytBqk0sQlRU3
3J1NiwVbRsw9HgaJ6OorirmyCxqh9PDzm0MgHWDU9L30TAOxSyTsqdb20QcL95Ue
M+zSKic/fI4PmM69zMLDgjJBcNvIO9afXlPf/E9/J4lY+VrVeKS8NPXLdT3G4Tpj
7tT7fbhFrR6ygdqDYs7lpmdrOHQRSdWY4Odq7LoVKe1X+MeaUj+ajf1gyrhEnG4K
xPHvKMUV1znOvkBJ7g3GB0mIPU0IwS3YHLWx2Caw+VgeqG++Ny8f+oLnn/O6omGt
BEBzcL3uuv9N6xRtb8VQyQkdIjOC/KyDbApKaGlCGhwWaQ1HFcoqQzHU45Ydp4IG
VZ+tx5+FwPXkKzDss/KNRZPyh4v9GqahMX5cEVq+2+0U5Z/B+BqMUui5EyblUeOH
y7Zg5Gb7K+Rkia0KAHtZ4ZfQrDxjkqEOkKBk8EklkONFcJ46lf0ILsioKh6L/5jj
a9WuW8nn4+3RMYNy0Vc/xUB3JxW/PY50trOBKtedUV+3vqxtCwscCIxELwJ+odIX
ES20ntrpR3iCuaH6RtT0r3x4cn3HRUftcbTr0jmiAPTd7uqjqi0h73CN95mq4jOX
lIeINx4U2h8rTZTBS/fqAddXcJviWGYCVboPwGdQpOkPczJcvO8=
=zm20
-----END PGP SIGNATURE-----

--+B0yzqA/FZKTYHvT--

