Return-Path: <linux-watchdog+bounces-4855-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIv3Jf+be2nOGAIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4855-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 18:42:23 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63BB3207
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 18:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13313300DF4C
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 17:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98F126CE2C;
	Thu, 29 Jan 2026 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/bz7/nU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F618BC3B;
	Thu, 29 Jan 2026 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708365; cv=none; b=NlwPqwu16xV07pMWAOJ1UYTHW02U7UUjXqXluBoMHJqVJ/z0ikYWOLvPYJZEng/b9wjNKkIZ9twa3SW/C5SiLKUcxBHZai9optOe42PPFWggi64JKvtXcuthmkAKz4b0h2sUsezcRfMXORhDU5jGfy7ZB7MA/ARWmmc+EHCjVOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708365; c=relaxed/simple;
	bh=KT9Y+oFfVF9aQj5amwkO7yZGPBVgZJex/Cd1L2xGskk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQ/3dSvRmsQtgCmlrnkZGJqlrPFmXeQ9m2ACwJ6yPb22WasIIsX6RoLFs0gcpNaM04TqvaH2huBOTxxGJj8uynvpELzLCkuMRCNaMz21rmKHXpQch6pzm1GIrrVT03tX7NhhtBTIfdv/Bp8HBH1dFFOgIpkgqJdejDrqkdYi4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/bz7/nU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA3CC4CEF7;
	Thu, 29 Jan 2026 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708365;
	bh=KT9Y+oFfVF9aQj5amwkO7yZGPBVgZJex/Cd1L2xGskk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/bz7/nUcm73NNHYaXDjV6LlDtTC/cbxkrnckPacaYuKwkpLN2JIqD8MBfcF4Usbl
	 BYynq79zVE8C4QxGbq7Dx/bL9qczwl8MXMWF99/mHTlcCeDiFtuSZ9dNtfecCKWddD
	 yyX/d+ZDzhoiKiL38eld+fGuPo8qyEiaB3iz4U4indW3UFg1J/ww/5GW13AWIerv9g
	 2G0o/3wm1FFTcRBcA+tRrpGldtjgZDVVn7AhxsTMV7nXvQ+3ka6Sc9Vb/qcgzk/c8G
	 KosTS+EWSAf5k5pnDLWbWRQ+2IsPctDu41Ll5SVAlex53VCZg1CSdfg008d+DI7IOK
	 bEBv8PFlxpEeA==
Date: Thu, 29 Jan 2026 17:39:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH mainline-linux 1/3] dt-bindings: watchdog:
 renesas,r9a09g057-wdt: Rework example
Message-ID: <20260129-stapling-nemesis-66ba56d68967@spud>
References: <20260129140731.12633-1-fabrizio.castro.jz@renesas.com>
 <20260129140731.12633-2-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36Iy0USQuZYBEeUt"
Content-Disposition: inline
In-Reply-To: <20260129140731.12633-2-fabrizio.castro.jz@renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4855-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[11c00400:email,0.219.186.0:email,renesas.com:email]
X-Rspamd-Queue-Id: 3C63BB3207
X-Rspamd-Action: no action


--36Iy0USQuZYBEeUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 02:07:29PM +0000, Fabrizio Castro wrote:
> When the bindings for the Renesas RZ/V2H(P) SoC were factored
> out IP WDT0 was selected for the example, however the HW user
> manual states that only IP WDT1 can be used by Linux.
>=20
> This commit is part of a series that removes WDT{0,2,3} support
> from the kernel, therefore the example from the bindings has
> lost its meaning.
>=20
> Update the example accordingly.
>=20
> Fixes: fcba2855251f ("dt-bindings: watchdog: factor out RZ/V2H(P) watchdo=
g")

Given this is an example, I don't think a fixes tag is appropriate here.

> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../bindings/watchdog/renesas,r9a09g057-wdt.yaml          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057=
-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wd=
t.yaml
> index 099200c4f136..975c5aa4d747 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.ya=
ml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.ya=
ml
> @@ -89,11 +89,11 @@ examples:
>    - |
>      #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> =20
> -    watchdog@11c00400 {
> +    watchdog@14400000 {
>              compatible =3D "renesas,r9a09g057-wdt";
> -            reg =3D <0x11c00400 0x400>;
> -            clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
> +            reg =3D <0x14400000 0x400>;
> +            clocks =3D <&cpg CPG_MOD 0x4d>, <&cpg CPG_MOD 0x4e>;
>              clock-names =3D "pclk", "oscclk";
> -            resets =3D <&cpg 0x75>;
> +            resets =3D <&cpg 0x76>;
>              power-domains =3D <&cpg>;
>      };
> --=20
> 2.34.1
>=20

--36Iy0USQuZYBEeUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXubRwAKCRB4tDGHoIJi
0lBcAQC0EDSn53pnjYPwW7yaAQRSTfdNWkeeDh0Helx+Uio94QD/c6Dq+BmG2MpU
dkCXXyCps/axpgVwbMc1XZ3mmP6/cA0=
=ebJj
-----END PGP SIGNATURE-----

--36Iy0USQuZYBEeUt--

