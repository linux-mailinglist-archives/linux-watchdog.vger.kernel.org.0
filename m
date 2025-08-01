Return-Path: <linux-watchdog+bounces-3929-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C328BB17B91
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 06:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5861C262A4
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 04:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCF7198E91;
	Fri,  1 Aug 2025 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="daYzO258"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8CD2F5E
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Aug 2025 04:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021022; cv=none; b=pXqmKqBVJzbmp9e95bgUTxiXObRzoTH5BoEX6RAUyOcTX7QMLRTpDfunsR80V8gI35kzqq/PxN4b/rVw7Y7l6zNvyYa1V7VYHLXqlLTExMMamJJXsiTav+WujW2GC5KjmAWx7DkQ+i5rTZn6ALEwl67JRkvZSjHuC82BcUxsXKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021022; c=relaxed/simple;
	bh=k3LmdzMdkFMbpa4iZpuh7d0VSm73u1mIQV8dJcBH1pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZBGdJlNuEJHHq+oookhOhfooT5tTVQbOEwnhujqZq9BhUXt/aDjeq2PXQYVFo2haav48MVygXsipfTmUGF4bf4kj3kS6X7fMNPoJw4Qsm4EyhjwY6daC9an08g2QeTPLY44Y2SWhJmBhy0RRtJeGbMfOL5D5lhqiuFjnKygtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=daYzO258; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k3Lm
	dzMdkFMbpa4iZpuh7d0VSm73u1mIQV8dJcBH1pY=; b=daYzO258TIjWlfExWbvS
	ClZfKoDlasS0MkXXnFa4/MWYIEV75YIRH4d/q9Z/9Ra1foCDSR8EhkGtkbMJoz8o
	x0g/fNnBu/GAIxWe1HSzqLih9KQwuGOoqPRpBKyy7s2VHHQBtvujo7BewO9zsVe3
	A4XAjkkHmIv5+jDxQmh5PZ8P0GoHwOyF15BsAUv1coGsUo4eAZVaCGjwMi/yy2Ps
	GyTTJoHJkggTqDopRhyz/V9jWklPlS+8Tikix2HkO/xZNEWwWGqcYNBjs6R4DCRS
	7tRKmgIzD8VBlrPBfAbX6DTf9fW/S9yCWQFjqc99IuGIb/KEZhycq0j/q6Qx5NDI
	0w==
Received: (qmail 595694 invoked from network); 1 Aug 2025 06:03:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 06:03:34 +0200
X-UD-Smtp-Session: l3s3148p1@bc+A10U7rswujnum
Date: Fri, 1 Aug 2025 06:03:33 +0200
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
Subject: Re: [PATCH v2 2/9] watchdog: rzv2h_wdt: Obtain clock-divider ranges
 from OF match data
Message-ID: <aIw8ldw_7PFQVoL9@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P3Z8MbzOVc8m1z8A"
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--P3Z8MbzOVc8m1z8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 04:59:08PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Move the clock division ratio values into OF match data instead of
> hardcoding them in the driver. Introduce `rzv2h_of_data` to hold `cks_min`
> and `cks_max`, populated via the device tree match table. In probe, call
> `of_device_get_match_data()` to retrieve these values for setting up the
> watchdog.
>=20
> This refactoring is transparent for existing RZ/V2H(P) usage and
> facilitates adding RZ/T2H support with different divider ranges.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--P3Z8MbzOVc8m1z8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMPJEACgkQFA3kzBSg
KbYGTw/9GVWgPr/2zAuNfMwEa7jaLMiVFZbEJlJhbSMh+6LFSN75ccV3rciRWlvj
UV2PItUFdaRC6IeXEQtFvA9RMi2N7ccTcB6t3lZ9VkYCbTEePq9tcSHI2eluob2v
uy8wajFSvewXgIHX+k0ZbVsE+u+rWxcX4IOzMDDoyTY4OMbIscSf/vcSUR0mYJh1
qb7j9A38u2CFm/YebL3VkY7xR2a8txqJWDhTagUivyyqLcfrJNteHcNjLmpYsycN
597UrCagIrZuQUwSF1oaaJohD+EivCbzmqQqd+B7cw0l4RhXkr3xF1db3xlMnDgB
7E5/hfq58KvofQSH9CZ0yVeUm6fQNj5mrXi4r9XRxvrogmmRA251Xl4zKug0lnD3
qlLKCa8I4m2DayBhyp97gPZOzNcAgrJ7yAcbkXKeFB9tPyWtKhZZAqME+FdREIlv
TYaLtTYxKcVJwLfv+AUaDUIdcKhiQ5/L+v6VosDGhTiRWIQzu7jLUAnGRdh17L1u
rmYf084RH10DeK28XIVsfIPdiQHWvT6IwJqydoc8dphMbeeW7e1+plv4YOxqgdB1
isGk4kiCeFo5NtvLOeofpDxpXGLdamnCE8RzL9Fux4gecezNDgRNR1338h2lupoR
ZeyuxvhBN3PE61cmeOSt2C557bzICuRN4tnwl9+oMJRTdaLTrJE=
=dS5X
-----END PGP SIGNATURE-----

--P3Z8MbzOVc8m1z8A--

