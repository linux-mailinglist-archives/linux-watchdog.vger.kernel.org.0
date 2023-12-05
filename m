Return-Path: <linux-watchdog+bounces-142-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F59805A92
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 17:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A1B2817DC
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1B060BBD;
	Tue,  5 Dec 2023 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBuCCi3D"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86803F8C3;
	Tue,  5 Dec 2023 16:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73909C433C7;
	Tue,  5 Dec 2023 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795408;
	bh=aeB2VEZILGjhrXQQ9y3UPhXsadO71NJYhGzeeVCb/30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBuCCi3DX6IUgCBt/LFcREbwYaCsw24xS+PBL2ZfRbCSaabE8uRATnLIVYgRYDNy3
	 OGS6GE1Qfy/6IgPLSIWiFGBP7gPhJW/SFwyH3VkisaYW2Fg5JZ1Eao82Fup7/IKP0b
	 S/GJCTf6rwd4yrTbvRrpjFuQa35NqcekZqe+B/j8EB3jOwdZQIHOwEpSMhNVoPGFLc
	 eTOTPSrU9oAFnUbfXkrmJBUGbwPmOKdIwQFh0NGbTqpao2Gh1EaHasSKBU0FO3AWE/
	 tgr2e7gA5TF5tBcyTs4QzpspRPjJAZWZuyWiQjN2Rgb/S5HCnA+EAulrBZXI54vMDL
	 kAUlsggYasUSQ==
Date: Tue, 5 Dec 2023 16:56:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3.1 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Message-ID: <20231205-robe-take-ea1aeedb4063@spud>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/3n8Uo5ox6GsArq0"
Content-Disposition: inline
In-Reply-To: <20231204172510.35041-3-biju.das.jz@bp.renesas.com>


--/3n8Uo5ox6GsArq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 05:25:04PM +0000, Biju Das wrote:
> The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
> are required. The fallback compatible string "dlg,da9062-watchdog" will be
> used on DA9061 watchdog.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/3n8Uo5ox6GsArq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9WSwAKCRB4tDGHoIJi
0uT+APoD7PLlFTYvw5MQbw4MVqBhh0CFH+BFi/ndSqMIKa3JegEAg722aEyfGGNc
m6TGeTe9X5Krd2Eb4vj4yeYZrQJoEAA=
=fv0k
-----END PGP SIGNATURE-----

--/3n8Uo5ox6GsArq0--

