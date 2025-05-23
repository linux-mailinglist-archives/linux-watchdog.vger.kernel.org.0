Return-Path: <linux-watchdog+bounces-3581-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D0AC26B4
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 May 2025 17:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CDEE5438F4
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 May 2025 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C42293720;
	Fri, 23 May 2025 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7P2FK0a"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2259634CF5;
	Fri, 23 May 2025 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015211; cv=none; b=TLFHKnTzf+CwMz53/liKSSqi7cwIngEsE+geelbQRkGR7Uwx604PN32ND7/HO3KRDHQWL1d7zwFx/Cg1U/yUWwAK1cZG9grhJmlcfZk27lhXVlta3a/HvUjyvVBKsoDScbczKG9ysV3rCb7gE9WtWErqds1peO+Xd0zbZbqRcdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015211; c=relaxed/simple;
	bh=qCexYxAZphjNtk85kNtdT/OWFBrAENclUMcEvbI6Hp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQSw1p38mwwV5ndi1AMcCrti7Tu6EgSl1tBhq1E1eXgB6uFHJgKSMsO3Cttb0/22Bb9R/T2V8RNiKDJL4f1MzM7n1IWAcWa4fYymU1+nAr/DrhyxtZHPjUyfwtxq3qq6f9DH/KKQ2AcA7KDzqY2BUauvUW1hrG0NHN2d4h4F9js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7P2FK0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3FCC4CEE9;
	Fri, 23 May 2025 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748015210;
	bh=qCexYxAZphjNtk85kNtdT/OWFBrAENclUMcEvbI6Hp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7P2FK0adRcZEtddKoYec9mV81p3Swvl5i6WCIRGi8tYYYxHUkqVq8dCzuA0x9Wi6
	 hEmnzaW34tsDj6pT8MV+jocMUEfUSALbQUX0EaFrSe41+QO0b6547cgreu5s7ETjpV
	 C6XhM9rFC3oEA2sqS+Rp1Tcmi9NLxk7NaS7TkDVvSyW4Cly9FMnfLPQIPyU2ShTCCn
	 edDUeIMzHlJCFVDh2SOTcee/kcHrgsgz/zk9ll4xj1nCK3wsgZV+cSpFC1xE+q+N0s
	 5bakl4UkWCQm6ROZmTRQLH9axPY/vQjdtzQeM/j2MC/1WBPTY4JwiFyLO9HsCxbU0C
	 Fvk3LWu7EoAQQ==
Date: Fri, 23 May 2025 16:46:45 +0100
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
Subject: Re: [PATCH 1/1] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl,ls1021a-wdt
Message-ID: <20250523-track-buckle-d230c718ea78@spud>
References: <20250522194732.493624-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uMvCA+WJjmSxZ+Ae"
Content-Disposition: inline
In-Reply-To: <20250522194732.493624-1-Frank.Li@nxp.com>


--uMvCA+WJjmSxZ+Ae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 03:47:31PM -0400, Frank Li wrote:
> Add compatible string fsl,ls1021a-wdt for ls1021a SoC. fsl,ls1021a-wdt
> allow big-endian property.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uMvCA+WJjmSxZ+Ae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCYZQAKCRB4tDGHoIJi
0v0RAQCfArc82gj3+UAwkYXV226g+dAe9CXTF+eWnvxCctDENAEA98eUITq+VhNO
liFPMkRyW1seKULF08eLEVKDBTUEwwg=
=zIgZ
-----END PGP SIGNATURE-----

--uMvCA+WJjmSxZ+Ae--

