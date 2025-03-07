Return-Path: <linux-watchdog+bounces-3074-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1591A56CB1
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 16:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F87F3B172B
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 15:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9133D21D59F;
	Fri,  7 Mar 2025 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/61PfAQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4F21D3FC;
	Fri,  7 Mar 2025 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362925; cv=none; b=oRawkGYQ2UtN03CdCBO03rb7/SpB6Lxln1y+NW//NEPCPaQl7vaJzu87WcolIL5aai9ZbSjuYy2O2Eo2GkL+qrnb/FLw5gFbBcJsvLP5rPMOd34KCrGDL0Y4+N9X3ZCF7Pur6Kr7GZpypRmCT8mrPugnrkkGvb+tZzA437JDV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362925; c=relaxed/simple;
	bh=v94MezOQhRnuevnsFvJKjsqRZa1z/RtCibUzJ1SotTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyVFQz7sQDtMl1KvHAVp/zPhZ8dxEtBpuVQwv9UAKOG9CrvwoyJ5RtixTl0XaKpjRwCLFjo94O1tU6Ze+F/rpq0QKLRWkUMSgHX/4N/KJSCLPKh/C7hAGTmuQz3/3syZG9cuJcOpaUPy3gU9TvVZhbjsJZzsfQ0HeG5OnHuRKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/61PfAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E4DC4CED1;
	Fri,  7 Mar 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741362924;
	bh=v94MezOQhRnuevnsFvJKjsqRZa1z/RtCibUzJ1SotTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/61PfAQ93ufWXMcgKxUgEGqdTNAQgNeJVu9LQxevXTkAsvJquDlOqUdRugmO2pcp
	 NgoSnCjgIcpQGSAQhaWvYFvO7RwRQ/jABlLo/O92DQsbaa2l8x+GOn9GEYfh+d0IDu
	 fuXXlce4ph5eX0jt49En2jbp0IcQkolnt3TXjJOhhm1DFLD5mFEJaTmDY6IVOUzKeX
	 7VgXYpHCGDnNm7ZEweqZlSVEGdVqqR1oFUtQ9QGD3u4iLYNIUW2ieZl6pIJfIW6g11
	 fhEIjOSkDa+emHYGZn0tL3C50jrHYcKCEt8KZ3QE3hQMXRNepGlFJDPGSrlxdd3svq
	 Qq4gt8k8hdWeQ==
Date: Fri, 7 Mar 2025 15:55:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add
 i.MX94 support
Message-ID: <20250307-violator-marmalade-87886dc56c83@spud>
References: <20250307154424.2613795-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JWIgyfPzyRrzUsA9"
Content-Disposition: inline
In-Reply-To: <20250307154424.2613795-1-Frank.Li@nxp.com>


--JWIgyfPzyRrzUsA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 10:44:24AM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
> backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JWIgyfPzyRrzUsA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sW5wAKCRB4tDGHoIJi
0q3eAQD4aBNrwfVgzEHcIRDVmVUsrx3rUlqj7jGYo1JtyG2m0wEApKIwEgi9CVW1
m6ZG/qm0OpmWLiDOQ50X8qGLV8M3pwg=
=WgEH
-----END PGP SIGNATURE-----

--JWIgyfPzyRrzUsA9--

