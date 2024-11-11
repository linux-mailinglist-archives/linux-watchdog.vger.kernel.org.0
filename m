Return-Path: <linux-watchdog+bounces-2447-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B309C46F2
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2024 21:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C6A2873DD
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2024 20:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7821ACDE3;
	Mon, 11 Nov 2024 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7RtvOxe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C88468;
	Mon, 11 Nov 2024 20:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731357351; cv=none; b=PYt/YtUq7W4I5AWyiCdRLItSu8AtIU4QbwHhRLI7mQJzJL1AodGVARANm+hZS0d9f3VujFiTMJCJdFgDYlQVdtAo9Fsg5dIJUFkdS7InOP3qFhF4rB09jfSp2ItOmOdAqyyC/xlN36vJOO31KrHcLc+tBuus6UMRQVRnjIZuOn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731357351; c=relaxed/simple;
	bh=jD9IhMlTkTKhEl+qsJul7DlgC95YTdQp6DQwN3sXz+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0hvKfnMRIjapbGuTsbdNySCNKBhLmPCclPP6S/5PVUbb6QaVVPutwQqJ4tYYAzP3JP51a4W6HL2CERsyugqn/WiO9zbcVNZbHxjy+O9cOed65KcBXHI5hW5WSLtYr1kRJJjvdqkPYe6esHkzxDJfHaHZVIjtzrc4gATmSdR29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7RtvOxe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2013C4CECF;
	Mon, 11 Nov 2024 20:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357351;
	bh=jD9IhMlTkTKhEl+qsJul7DlgC95YTdQp6DQwN3sXz+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7RtvOxe1eV3paQTMZF0E0wgHOJpUSQW55RWoEzh0rl4StvYNcsuSnFGPKe/Hk5FS
	 N6vmxXLr7gtRL3Dt7vzXRYhHjhMZdDb7EDHJG/RjsAQOX+ZIC0ECkrxDQYqUaj8K/O
	 uOu7PKW/L1Xpkgc/Z1jkWSmD+gt02S8oT9+8PqRI5v4rNr7k07s9kTGaGwgvchfgpt
	 jqMwefgYmDT0IudkGj+k+qBjaIEzKionTyiGltvqu1mCAwvnDQZuk3VxQvdyO9Kamg
	 AmhJzK6eGRA4Ot7hxkK/dAexGGE6fDYag/G7m67LwAFQPsY1hR/c687JuzeE/xvSdP
	 lRSK33AFYzpFw==
Date: Mon, 11 Nov 2024 20:35:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 03/14] dt-bindings: watchdog: sunxi: add Allwinner A523
 compatible string
Message-ID: <20241111-esteemed-tissue-337ce5f108a7@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlQpuSGKQTNIpwjz"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-4-andre.przywara@arm.com>


--rlQpuSGKQTNIpwjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:22AM +0000, Andre Przywara wrote:
> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
>=20
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rlQpuSGKQTNIpwjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJqogAKCRB4tDGHoIJi
0kZYAQCM0zsg+49iqBqKBacKijQrJerc8T6Xw/ZyGsmo0adCmQEAjkchuYxIObPb
zZukFFH5sHTMlLvxdQ8GI/592mf5vwI=
=tNH2
-----END PGP SIGNATURE-----

--rlQpuSGKQTNIpwjz--

