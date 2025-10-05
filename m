Return-Path: <linux-watchdog+bounces-4317-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF10BB9961
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 18:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7DF3B5F80
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 16:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE602749D9;
	Sun,  5 Oct 2025 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k9MqUMiP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3728DC4
	for <linux-watchdog@vger.kernel.org>; Sun,  5 Oct 2025 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759681171; cv=none; b=FTQLao8SuRHpoNB6FfpSk/Y9ZJu6Jy6nQnfxfYuPKXxZd2VUDKhKH5Odddtq6SynuBxoALTI5LF4XU1i+E3lwzKjok+0I9OHcHVfWVOKdhtlHmEebSTn4L13s5FAJ79XqmA+CVSEVjKTqXS5y5Jz/FAKjhbfSaW2hK0esgNKhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759681171; c=relaxed/simple;
	bh=WLMQ6E1ViI1e00hKFVMzlouifM+jP470cs97hoJeRKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJAdifW9uBVLaX1rbTnUFo7o2Cuk2LAGgJN11BZaZEWO04REKyR8/j1QUrdQ+XLZcP4M9VApImB2Fn2yNY96XFtC6QMDqNd96be5qEwt5K79v1zGZgz6t4ejjUbuiO2T2iqvv9DHF6z1HQTPgN1w+lFxMsT4x17D4XN3wUzqbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k9MqUMiP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=o9me
	UJcjAMsX3Ap3zouZEEoUCX+UhWq2pEccTGKkWDk=; b=k9MqUMiPxlRo4TRlrFbZ
	twgGNa5nG/Q4SaOaAfF029RC6ko6HcNGKjxLzOHC/vi+5Ru+q5bYUzeHCFhLxp1j
	spjKh2CRLhFn6h628M7GUJjTEhcknvlIFNU2UKlPLwaVqj/6LzWR6N94zT/b+4Mb
	8xnYFoZZRQvWs2yhM5vieFkcJV6HhRNoGwQNz/f4EGlATJ7D4WlBApxfOgKlZpuN
	R4C7O1gYfOFSMbOytn3twe3C1gQbDLdcZnFts4nj+UYsF23Ck/4ySOQwlnJfVocr
	aoU4PlWLyO/stZuEyWw+fl98jldwkpsekSothTMFB3JXA2eW4/IIkmbG1MMh+lcz
	Cg==
Received: (qmail 1445538 invoked from network); 5 Oct 2025 18:19:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2025 18:19:25 +0200
X-UD-Smtp-Session: l3s3148p1@w97EsmtAHrMujnsm
Date: Sun, 5 Oct 2025 18:19:24 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Message-ID: <aOKajKzRlrQD7plt@shikoro>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aey+WdS0HWbMY03P"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--aey+WdS0HWbMY03P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

> > +      - enum:
> > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > +
> > +      - items:
> > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > +          - const: renesas,r9a09g077-wdt # RZ/T2H
>=20
> Looks there is duplication of entries for RZ/T2H?

The first one is plain T2H, the second one N2H with a fallback to T2H.
This is how I read it, at least, and how it already was in the original
binding description.

Thanks for the review,

   Wolfram


--aey+WdS0HWbMY03P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjimokACgkQFA3kzBSg
KbYkKBAAnVAOK/HG7Oq0yaWAYrQMe5M9NmVaRl0R1HrhFiaIftVJXt97ZZPJlVgk
dlGzPJF/z5iGJ8u1F6Jd3YRCFXGJMNMH6/zheJzkB6VzbXH86NheHA6XzHryz0we
/XcgwKrM6ESOCP/3kR24GUMWMO3rwH7qYm4MSjHemymNrTUKMAnRHHx9UGPt5DGs
AWldBNSxEmb5xzijzPWxPacbi+joubnnf2BcxkGzKjp0Eef4FD4YzyuVb/zlH2nV
qKAq1nZSGX8LjwUyhV1zHaBjaCe6kGKN3OVBa/+rA3bJhnCS4xERwFK7woJLoiYU
yp2GkjcccyIT1cyobpH8mMQdrHUEBhUZuGoypg7vuycnJ90/3AOEcXWYdqD0Timh
/qtHIefKD+xXgt2fHbmm09PW4a1w1RVijgJ1I2oWnjQFyN/ofXIOGmkpHrR4K71l
AFUvLC/zX/cDH6ZKyvU8KwmMAUKyRShbbuHiWyKxjVRoOHkn4kMmueczyulI/jjU
wMui0K68VPAWqnFWUua7fsec5pyKHUkdPWfbIXVhDx3cxPCExtA1MqO9OkL0R6dq
X9j7a8wCEqVyG6KL4rrwJUF8KAN3zJ5WSDNvDR5q/bh8InMrmGS9TJlLuQPytb39
NZGDKLSIRRi1tnihqMfuM5fmizP66BjHom3PemdMvdZRylgl4e8=
=P40Y
-----END PGP SIGNATURE-----

--aey+WdS0HWbMY03P--

