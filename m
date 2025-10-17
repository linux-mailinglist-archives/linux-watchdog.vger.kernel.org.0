Return-Path: <linux-watchdog+bounces-4399-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4033BEA6CC
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 18:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50FA15880A7
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 15:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE12253B42;
	Fri, 17 Oct 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kssCRM2C"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28235330B06;
	Fri, 17 Oct 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716483; cv=none; b=JkDp0ioiyYkn1Fh0Q54oABURFf/c4PL1dQCBCm6uuyeVPnBz6eMg/gVTcRvqAwyWsZnttQCh/SE8xYCyAwuN86MgZlg6QR2i/ISv7ATN2UTLvHdTTnsdMaNt3/8cVJVFLxxUPvxy2TG5Zdiox1l70LMEv3uj6VVu/wDBv4QjfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716483; c=relaxed/simple;
	bh=AiV13sI/z7rTZFGBbKda8vpX6E/TPvqmyKvZQ4w2ySg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5ikAr+PSDcvicz7vQe5+J3raIzESpt4G2IgAcS8zyfJQ60qHu5TpS1BlIX84JpEWFpuEHKX7+vb7jR+IrvJqLMrLTcqK34WJQ0W/ysil1Y15KPt05puaDiIX8nuHV98QZp6u5iPBf96wOPR22Z9I87/FW+Vp+juaJHmF9tQKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kssCRM2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1491C113D0;
	Fri, 17 Oct 2025 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716483;
	bh=AiV13sI/z7rTZFGBbKda8vpX6E/TPvqmyKvZQ4w2ySg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kssCRM2CRhnIkyD5tkHf7nZcAcAnql+ZWlQcfpcey06CQbBf6tmHP6rmf+q44B4lz
	 PbN5R8i2cpE9GoHXjUHs2DBVJ1Q2ccX93WtW4fOunY8g1bIgI3gb2UD8nuIglZTwft
	 b0+06Zv4lVrJWB0Npnh45xbdiipXKp2LPrKZZdwUTVcblCLeuGjQoQ7j1UFrzpr0xI
	 BTsLDKK8uUw2nQLE9yoxge9w3dz5hXMgRCzSyTiD1FbHXO1Ufx1hbxStvc9IvUmRil
	 EuYS1bn567cBIj92jKS/REvA7233ms5hbi8Je0y/Kz7UW+j0Hayr8VWiygbVnfdsA9
	 hhJCmQpitQ3SA==
Date: Fri, 17 Oct 2025 16:54:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add Renesas WWDT
Message-ID: <20251017-elm-fiftieth-36b499ef7f0c@spud>
References: <20251017101549.4275-4-wsa+renesas@sang-engineering.com>
 <20251017101549.4275-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XWPXDyUJPBcJRtQj"
Content-Disposition: inline
In-Reply-To: <20251017101549.4275-5-wsa+renesas@sang-engineering.com>


--XWPXDyUJPBcJRtQj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 12:15:48PM +0200, Wolfram Sang wrote:
> Describe the Window Watchdog Timer found on Renesas R-Car SoCs from late
> Gen3 onwards.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--XWPXDyUJPBcJRtQj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJmvgAKCRB4tDGHoIJi
0sI0AQCw0eUTkLITQozCtsaJrzVYPhDf0VmjID3br1vCMsucvgEA8UKpR2ucWYOB
TiqZj/npc5Ya7scoyUZj3f0yvASBAw4=
=z0tT
-----END PGP SIGNATURE-----

--XWPXDyUJPBcJRtQj--

