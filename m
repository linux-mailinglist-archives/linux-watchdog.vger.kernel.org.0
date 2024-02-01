Return-Path: <linux-watchdog+bounces-562-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4D845F8F
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Feb 2024 19:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3334628D27C
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Feb 2024 18:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3CF7C6C4;
	Thu,  1 Feb 2024 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVzUpda1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F177A0C;
	Thu,  1 Feb 2024 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706810911; cv=none; b=FIP0Pm6cPg7Nz5/cE5pEZVQEhzMNw1cR4zLsxFOeHqq0DLYodmAi+ucCogychPyDx7CghCWpe5OJfAld3MbU23wQtS26TMbnk89ZthfT9qJNAJXb25uQRfyyon2ac3WZV0B0InQEHeFuOPVitYY9w9Z+7avyE+81gDFCkXi2b8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706810911; c=relaxed/simple;
	bh=HYUeRkOLIOi7AA37ejYT4g/vY/TwFilrl3Tgdss9kAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/XKXgxws7I5TKJtRXyDiyHhB4xYN7AifRDw/+O9+snR+qTNMbbFERO2GoMbKTRUZokp7S7NLZbP/MHWGmnpkm8eVoCPUn+75EquTlSEL2QZvp2bqd6pCbJ2AjiLST8rl6Hbq8P5J0lOfiD55lpQw9/hJIpakHjldDkAuw0LNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVzUpda1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92641C43399;
	Thu,  1 Feb 2024 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706810910;
	bh=HYUeRkOLIOi7AA37ejYT4g/vY/TwFilrl3Tgdss9kAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVzUpda1nlNaOOaI5/PH1bBOAOoDhwvOEBDc5lFexPfExa6DaYcq3MK9/iW6JWuPE
	 a+9Ba4Mghrq+waJA9JfM27IA8PvfSPgmuUqwItka3xy6CadbvLc4kqz9U0etuQir6I
	 ZMwIjp5Nhj0mRdn+K3EDiqsDZa7lAS8gR+16zwcySVzkBRS4XDItCPCBLfjDBRKiW0
	 uVQGs/7sGSZSFd5urZFkpwuM5t3wI2Piv5XY42+sQhlkM/Xsgtt/X5RoWosKN6g4Wf
	 zT2HhaQaL1tM1wAqokMhqTsIQAFU5XKXQQOvCaW7XtzrNinlgSp4+P2fV4EfdkbzVo
	 C49XetDEzfr5Q==
Date: Thu, 1 Feb 2024 18:08:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Minh Le <minh.le.aj@renesas.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Add support for
 R-Car V4M
Message-ID: <20240201-chatroom-tidiness-fafc4fe679a4@spud>
References: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qy/rdPUQTJTtEExO"
Content-Disposition: inline
In-Reply-To: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>


--qy/rdPUQTJTtEExO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:19:59PM +0100, Geert Uytterhoeven wrote:
> From: Minh Le <minh.le.aj@renesas.com>
>=20
> Add documentation for r8a779h0 compatible string to
> Renesas watchdog device tree bindings documentation.
>=20
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
C

--qy/rdPUQTJTtEExO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbveGgAKCRB4tDGHoIJi
0voLAP9oH2wb6rj38G6WVM2mWUmt8HH/OU2lHYjBz002skC4rwD/Zr9tK2HuPoox
7KPKpowXEvbFTew3xaOmSxiKC5aP/Qk=
=/7jH
-----END PGP SIGNATURE-----

--qy/rdPUQTJTtEExO--

