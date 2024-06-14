Return-Path: <linux-watchdog+bounces-1137-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A8908B93
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 14:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4FC3281ED6
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 12:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10546198840;
	Fri, 14 Jun 2024 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kPfOofo9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA9196D9A
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Jun 2024 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367793; cv=none; b=opH7zJvH7ohA+L5CBjRfuA2H1BOi5/EaDOLA+nVZ9YdXmNKa6/QEX3bsLV3FAAMxICcCkjk4qLRPnPGDDFCFUG0YGjyizJvzUOk6AQ37e78C6VGf2DICzt73wPPcT+sGwYVjTXYbYnlVenRwRAy+GHzh/b19WEzDIDzgvYJ7/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367793; c=relaxed/simple;
	bh=yxhM44O6zp2KBZgEbJ+StQD/YJ38G/9/f+U5EjDvXzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q77hmJYFAgkNi2XxCxNoejY8+FKJbU9CRLpdb8GdVf1cVC7hjVsXoPi+JfyurKsxtUscf4V5CPqgBBH2jN9WtdQaOYWa34c89RHokvW+YhripIYtv9chcVoO7/WlCBBA+SctqC7Mm5uBRoyOLzOLxUFjsAhiVTvZR8WlYCakY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kPfOofo9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gbe4
	NGoGJzlNtLVKEdopxNLp/BLddKDryG0jqabOz/E=; b=kPfOofo9DujqkJtNJJ0q
	bC5ll3XMzSVdj9FSEvQ008yd04j5tBE0Edipg8AsmPKLDhnsv7sfUkOQMRaeCRJk
	w3ROsk5S60Mawss3/1seNJtY+2wPFszE5/AUJ6Ni5lKjDxNIp7g6u3hvHYMGYgzs
	yzwmDsryoNufbjjMonVbNq55BvFSPgTrj1+Jq+wh5LA/t7wjB0uupViXgdo/Kilp
	H6BFbk27m/mDI8NPNyVpzhf59izO5mFTVwofkY+i5pFKghVz6A/D1wIg00Xpo1jl
	ZTbdxIu3N6p82fL19bohOtkAfapZ/DcyND3ATd7ITGH4XZd8B04SsU/MdRu45BKV
	Sw==
Received: (qmail 1512454 invoked from network); 14 Jun 2024 14:23:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2024 14:23:01 +0200
X-UD-Smtp-Session: l3s3148p1@vPs1rdgayLhehh9j
Date: Fri, 14 Jun 2024 14:23:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <20240614122301.vjwzbkrl5grh5dw2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i66amim3x4jzbudd"
Content-Disposition: inline
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>


--i66amim3x4jzbudd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 11:59:27AM +0200, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
>=20
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access den=
ied.
>=20
> Add IMX platform maintainers for bindings which would become orphaned.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--i66amim3x4jzbudd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZsNiEACgkQFA3kzBSg
KbZS8g//XMHYH+AtIpUDIrsnR9uk0/5NUTHI8TztcF7rT4+bRCBiwFY7SplUOupv
9RK9jS1EA+S4ZyZkD56we02cqUlGBNXgS64vXTGfGIc1N+DMsa1uVyiv4MZsXgad
PMnoe2emN02LqQCNCbvGvn9lZuYdEOwhfNVZXGVHcJbyQmgFwjUhoC1n2ukJA8AV
mqSSlW1IVgJyYGhxxDLXh9diA/tcLpSPmgx3kzPVTNRmoS6edCWJcn9zluivL/R7
4HXGhAw/yEMWvedXNQ54EnDrfVedA0f+xu0KOpQuMPkk0hQqD2JeisYBNTjX7SGq
22kgrDdPLcyakURakGRVIpRy+iFZk1FzyiIPTRcEicskbaYXyvtu+78iWOB6A14K
LP0evWM6LmqdKIVCooIOYPwiADx/oJYLYduFsgTWYq4GSpCuHtrHytwyw6j+LTvu
jFM1zIVcml3rZ8ZieoIDXSqPiMqPE3/4cNuOfkkj4YmzdhLIN8FAJjEq+QepfxIw
si0mPOGCa7Uuvlb/4n7DQWdoVTWkd6mmp1m/bPmdQqTE6eOVsrYSyDglKBcYCcCQ
SuYwwUfnsKrX8mb9VIqHlYYtTX2VCECQKXpD84L/g0nO6KRrMqTTr0up3Mrzji5s
KJJG1eA6JkB3J/1K5nplnklCdnsyY3Hx2aQy/Z6ECSDrUuiYj0E=
=aS1V
-----END PGP SIGNATURE-----

--i66amim3x4jzbudd--

