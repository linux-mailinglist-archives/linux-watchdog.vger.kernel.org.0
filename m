Return-Path: <linux-watchdog+bounces-4324-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C200DBBD796
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 11:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74EC64E4ED6
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 09:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22FD1F463E;
	Mon,  6 Oct 2025 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FYa1/tsI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DF01F3BBB
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743798; cv=none; b=MBhmEDJt0x3m+8tkRlE+0HnnoQ9hvQf/5WKF7/ANw5leBgVTtNw0nfoPCyLs6bipDJo58VwvBveXLLpI2g5Bm9b0VxJJTQht3v2MZuSpTmlfgJTwlCK1a4gdv4ajXVtxPCwjy2//DslZUv36k5TLEItEdx/kShyiSQBKJRdKLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743798; c=relaxed/simple;
	bh=c/tz1nvQGKiHhSpiVi+lcX7ZHV5/xlQwu5joHRWJKlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLql3gC6eSn3T20RcwEDL2JjPSzBX8biAxRjSknjT0reiexgoLdiCMFDE+7UEJ+uyZhp0u0bUUW0UbUzOpShYb1kXmolRoEce8LnXVHGhV7imPdeQUtcrBv9JNrLuZmfcbZKKVLbEZRMDuuNHveesVdo3+CFuK9fYGftVPkbFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FYa1/tsI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b9Q9
	ZppoY/L8xgR4ywWnfbzyRrfNyZRRbXnnQsu760M=; b=FYa1/tsI14iGcvFRnQ8k
	FoQ4VKIPmkA12DsZXd6HQwF0Vob6SDOKrbHfM4eMwa0/34Al+VTBBWcMgxrbpg/j
	oEw3GztvUCb3LHuX+jSch0xHjaLuGh3mhNFSLySGihOVp/toY2G86xCWhP2DPlFI
	mzGrJyREMwuJBwT1X+9a2ANl1ZdBEzroa+02IElhj3nSJPfb9DM79iGD19RJaAFY
	Iudry4aSzi58eQhuiUgaLFVA9mi0FabvJEZ7aPMSWxlsr1pvzZG+kIhACAjMJB1u
	TjXG+QPa6OaxBhYbIC4JR1V7jlkLVLvHT4v3/oKqLZU7teCUMoZ6lbpEf8L6onb7
	tA==
Received: (qmail 1720438 invoked from network); 6 Oct 2025 11:43:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 11:43:12 +0200
X-UD-Smtp-Session: l3s3148p1@3OKiR3pAtOggAwDPXwQHAL/S9V79e5yL
Date: Mon, 6 Oct 2025 11:43:12 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
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
Message-ID: <aOOPMG_bW_q8iM7C@shikoro>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro>
 <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aONh89-5-llFZWue@shikoro>
 <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FJ/r81+j4Z7SjW59"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>


--FJ/r81+j4Z7SjW59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> We do have "fallback" comments in other places, and I think they do
> help in understanding compatible naming schemes.

Still, dunno...

> Would it be possible to handle this in dt-schema?
> Currently we have to write:
>=20
>       - const: vendor,soc1-ip
>=20
>       - items:
>           - enum:
>               - vendor,soc2-ip
>               - vendor,soc3-ip
>           - const: vendor,soc1-ip       # fallback

=2E.. I think '- items' makes it clear that later entries are fallback
entries. I am by no means a YAML master but this knowledge should/could
be expected? If peolpe don't know that...

What really is confusing, I'd say, is a mixture of entries with
fallbacks and without. One can overlook this easily. So, they should be
grouped IMHO. That's my previous suggestion.

> If dt-schema would automatically drop duplicates of the fallback,
> we could just write:
>=20
>       - items:
>           - enum:
>               - vendor,soc1-ip
>               - vendor,soc2-ip
>               - vendor,soc3-ip
>           - const: vendor,soc1-ip       # fallback
>=20
> What do you think?

(soc1 should be omitted from the enum)

Do you mean "# fallback" indicates that the fallback entry should be
created? Or just the const item?

Well, this is ultimately DT maintainers call, but my gut feeling says it
is better to be explicit than implicit. I do understand that the more
compact binding documentation would be a gain, though.

All the best,

   Wolfram


--FJ/r81+j4Z7SjW59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjjjywACgkQFA3kzBSg
KbZJKg/+LlYOD2Foz8niY/+f3Yfg+TXVUzLjjDJRp9IUt3p+KSg+wEa82D10KakS
EFeGyHpLk4vi3OFqVK5XPWPDQ321z1RfG16XqX8TP8cn8SIt6cEvb7L58pkdVK2o
KExXFXT26KcFdwKpXX3r72vCmwLxtX2g3L64EEWDMKD6tVRkY6MRC9d7cojEryqP
q6+sKrydK5BPBPHZZ5e88W8fDqn6EJc9JRCV0rFC69DGAooqX9FkkNwAHuK/gGti
O23f05sUEfxo69LfOaDi+kwnLJjodciShS102eSMtwHEjKRoIDPNrPynAdILIy8s
YW9/iDXGTlW30XDl3/zjv+cWI+U7eda+6v9XY59peuhwwRXYRMrk+0QbPeqMOVpe
rMeXGNuHzWBWzcXrJGTAS1BXGKpcw3QIzizvqXqZhhFwnTdUWN4o5zr3rZsW61uC
BeaeD2CmiObTkt6I9+nmKM+9jWo125zoQFxLSbzZtRM9X5Ip9dNzwUiX49yjU7jF
Xiyjn6rZyWV27QVc2rNIe/BwlXrayiR9oaiqiCSyiaL1K89CYghpBqmjG6clFUYw
drsQeYaD3ncB2B5Q4MLCIVUiYiAPHRBN/APo8KTK577PAkWcaIzPSVFji8X28t4D
K8grj4uZxrKFt8ai6vAtYj/kDXAZoFZeb92oCRxDLMtchC/VjM8=
=pJ/m
-----END PGP SIGNATURE-----

--FJ/r81+j4Z7SjW59--

