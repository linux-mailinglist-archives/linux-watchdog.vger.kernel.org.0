Return-Path: <linux-watchdog+bounces-281-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E625D80F40F
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 18:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F916B20AFE
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C235D7B3C5;
	Tue, 12 Dec 2023 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+RqCr6F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972587A221;
	Tue, 12 Dec 2023 17:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384A9C433C8;
	Tue, 12 Dec 2023 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400931;
	bh=6Tm93aXjK0siScHsHVvTr+ihpD8tIuOfYIqqR+a84wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+RqCr6FY46938VEaGQTuwMsrIW5U15z0g8+ee0gLlWhwl0GQQ0cg6iEhrZlX4yNJ
	 qj8BokEpZ1NfmUacoEN/CW7OnPHoywU9dsJN8dCfh3UxZuaWHPW/f9NBsxKebCzIAX
	 yAfTQwdth7ZanX6IFmQR9W89CRM7qgI0kpriPojniPS5+/IE7wbeUCbLSjLnDQwKVx
	 eVBXbNJBG+9B/+GJFMQ6KyVJcPYxnHaLOI4qd4XL3QFtm7FO/RZayOnbd/xGZ7Vq49
	 nnvq3JElIWw8xLrc6DsIjDUUOOp5QvDZrpYYxmKa8oJbZyYzp9ZM3lr4uxRpMCuSL+
	 1uzQJfopTq8sA==
Date: Tue, 12 Dec 2023 17:08:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
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
Message-ID: <20231212-impending-delay-3af2dca43d35@spud>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
 <a16592d3-e924-435c-bfb0-2b0f2b3cf0a9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qbbAhMcl42QW0gJr"
Content-Disposition: inline
In-Reply-To: <a16592d3-e924-435c-bfb0-2b0f2b3cf0a9@roeck-us.net>


--qbbAhMcl42QW0gJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 08:56:00AM -0800, Guenter Roeck wrote:
> On Mon, Dec 04, 2023 at 05:25:04PM +0000, Biju Das wrote:
> > The DA9061 watchdog is identical to DA9062 watchdog, so no driver chang=
es
> > are required. The fallback compatible string "dlg,da9062-watchdog" will=
 be
> > used on DA9061 watchdog.
> >=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

There's a v5 of this series already FYI

--qbbAhMcl42QW0gJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiTnQAKCRB4tDGHoIJi
0vevAPwL4/iJ04ID4BdwT8/KYvf4Hh9/YoahTwszvaAKSWSMSAEA4YMuxmRksXLH
xOPjdeuKwES733WE7XTDZZ9URjBpIwA=
=L/3S
-----END PGP SIGNATURE-----

--qbbAhMcl42QW0gJr--

