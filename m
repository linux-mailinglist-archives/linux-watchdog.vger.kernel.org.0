Return-Path: <linux-watchdog+bounces-4321-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBABBD5E1
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 10:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41D53B5C50
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B6425A35D;
	Mon,  6 Oct 2025 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FE2BTq2D"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668441A256B
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739989; cv=none; b=Fya2GkAAseOEzzbk3KlskylK1S0w1j746yOOSEdAZ/cTfgD5iQziiqhvlSSjGWVqx2M6oJuWURfqYL2B0YiEmnWjld7lUZGZNlrf75puIzmq9gYYMAZGOBkqARafchj91mGpcYHSG0goKV50nVxgcPaqBn1hAI2ce59AiI3fCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739989; c=relaxed/simple;
	bh=0P48OP0DLwQKC91mQqmuSxoGiGJG3bBtbYCULGi9JI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWHru9m8JqJ8Yg2TvV2l0HNRy/J5imKGHnVrtfcZE5e1Y5DHwCboRmuonH44NxPeiZlnh8oQgRlNVK/+aKgtyjiCkpc467v3J+neBX1LmZdY6TZqUV4XAleX4h1mOnOzJZCahzQjh0ELOgdEhIwZn0NMe/LuCJ+GeEEGuhdSRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FE2BTq2D; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LCd2
	x4I5OqIO3V0sZsaau0PRF3ZhgX3UrduQkOEH2IY=; b=FE2BTq2DaoeN7EgYQ3DR
	Rov9vRJCpVwIHloXIO4BEtIfZN55n+uGuIHMII+01E11y/woqK6q6eCIIdTxrNha
	9m22twpEmpk8s1FJHzjsVpr862cQkUhJ4RmWrH+3meGub4K0nx6SaSuFbffL/78u
	hPc1SBQlwXnGWb0L48vr/+IOqYUkCFo5c1VEn+yShPNuRdNGdUl8Vjj/yhveP7Wp
	+jPO2CCWWMgWh2HllQc/X0YzblALRc6MMCqEAqtBKwp2OK8x8tHrs29qyuuNDHN+
	b4VfFVaad6Kf9n4UHA1mJw3nsBH6at1BqgL2DPvCW9cq9y9F+zzUTiWWQyLsD1yJ
	bw==
Received: (qmail 1697254 invoked from network); 6 Oct 2025 10:39:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2025 10:39:45 +0200
X-UD-Smtp-Session: l3s3148p1@/+a0ZHlAbNAgAwDPXwQHAL/S9V79e5yL
Date: Mon, 6 Oct 2025 10:39:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Message-ID: <aOOAUJVrnMNM1JZr@shikoro>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tpyE72Q6iazj6LTP"
Content-Disposition: inline
In-Reply-To: <20251005144416.3699-10-wsa+renesas@sang-engineering.com>


--tpyE72Q6iazj6LTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g057-wdt

I think this should be 'const' for now...

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt

...like here.

Same for patch 3.


--tpyE72Q6iazj6LTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjjgE0ACgkQFA3kzBSg
KbZ3Fw//Wjx5XMWxXvFecxAXiBjhT0iieGRnWzJeR7LjcDnmxU1gr1Y2DZhk5zg5
iXMnScEMl3jo7LKBi3crTpRtrv4jNA08bvGOPZa7iOLxzVGw4st/iFLV/xELgG8O
LI2puPcJUftxs3GSZyPgI73Ie6JTDcd62EKp8BWOuZmzd8SGlZTFTLPlzM5c1Pko
PnA+WuPWd4rno7Mexv5mJNsBpTRZ/deVDXja1cJEWhqF4NZiXCuHVyUGi/wVKrY1
6SrAFYOsA0oWyiBn+0lwzU2cM5p5+uQBQPO7xhmzWMAK+yliel82bUvf7/ZJQdyn
nOxC1cxtsgCOV4ukIKQ6UrqlUcNThVFS5VrmAtOeDUujYVuAZX4cKuTo/9kTPZKO
7kp93GpLujQrY6C+8ma9UP0mHva78QYquejSgB6k0YM40jdLzbfVCitHLgfGdja5
M0SsFutQdcwsqD5PJ3zGlz3CGJD91ze65xzyy3oof39DFj0RBEtitdSW9BvE+pP1
J7IAbgfGdt1jV8mI9nwBmuwmiA8iEVYLDNEIFftro2KkiTySCmNmOOdr90oCVG8t
jKPukaskuPbjBx/lljuY8EGLFzFCMaXsw4e/QMwSSx5oHKa/ZO2dTuc29GJjrb2H
snCUDLzMGD3eba7aWXABFVLFDseqQkVbYcJ5gfdHTv4SdM4BtTc=
=N27g
-----END PGP SIGNATURE-----

--tpyE72Q6iazj6LTP--

