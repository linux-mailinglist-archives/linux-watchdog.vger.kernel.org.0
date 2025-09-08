Return-Path: <linux-watchdog+bounces-4209-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D447B484C4
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Sep 2025 09:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A417A4194
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Sep 2025 07:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451592E7BD0;
	Mon,  8 Sep 2025 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo5ioNbD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C62E5437;
	Mon,  8 Sep 2025 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315045; cv=none; b=u8YCOef5e/zVv1IgfI2b32YotMjm71iPf5ARmNPLzY3bUMNWj7QFnzTKBupzLteud/TSongrZOCf+AYq3A54ZPXdL9cw2tt077FsXTSCkCIYMbXSdeXpSSzPwSy9BZUpY00DE424AJjO7oVU5/q7vplR4JDOIMMrUpgmC/Jp2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315045; c=relaxed/simple;
	bh=AeCZC4Xp7UU/zbofHlE39ClcIKd0OAOo2hV/opiz/HI=;
	h=Content-Type:Date:Message-Id:To:Subject:Cc:From:References:
	 In-Reply-To; b=pBi0J85CtEBtr/R18G3JlIfTGzytk4GG8KJYBcaO3ObXdw3D72Jim8SSjr8YQ9lexczjvZ8Eb+yyElmyh8/xeHz7FYNYmIeTjNmviT0hPAFPM4MuOVMo5ajnP77VdV5x8Mmbbv6RYi9g8K/iGJIKaK6T9iJ6x6TKI/vyXZ/HrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo5ioNbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A62FC4CEF5;
	Mon,  8 Sep 2025 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757315044;
	bh=AeCZC4Xp7UU/zbofHlE39ClcIKd0OAOo2hV/opiz/HI=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=Qo5ioNbDYXLZBOcfB57TuPhIDmEBPVgxU0Nt4F4XuDcuG7MJXGTsh3G5SkwVktuS2
	 ClFLPN5pRdpmQJtbA+htpWImcAwVWKnbc08VdnDfmIBVO1pn6m6YemHavpRauO/t6R
	 ojCTOSumLfYsGxSJrJyvrSBvvDEyRH9NMSEeSapbX+UnWOlqrJcUK1im5M2IecVL4V
	 9nL24j1BMPdFjFRTbuWpqXkeLagxUfs+8QBR1mTP0UJSrE6obyuQuP9EEcAFpkq/RW
	 txZ4NWhKDg3mx6fJA0QGdnbEq5qPKel3nBgWK428IM15JDP948dw/c2F9FmV3in2Rd
	 cfjNdTE3+lYlw==
Content-Type: multipart/signed;
 boundary=6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 08 Sep 2025 09:04:00 +0200
Message-Id: <DCN86WR0CPF1.38V3X1O08VYJG@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Lee Jones" <lee@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Wim Van Sebroeck" <wim@linux-watchdog.org>
Subject: Re: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-7-mwalle@kernel.org>
 <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
In-Reply-To: <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

--6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Guenter,

> >   static const struct of_device_id sl28cpld_hwmon_of_match[] =3D {
> > -	{ .compatible =3D "kontron,sl28cpld-fan" },
> > +	{ .compatible =3D "kontron,sl28cpld-fan", .data =3D &sl28cpld_hwmon_c=
hip_info },
> > +	{ .compatible =3D "kontron,sa67mcu-hwmon", .data =3D &sa67mcu_hwmon_c=
hip_info },
>
> Effectively this means that the two chips have completely different funct=
ionality.
> One reports fan speeds, the other reports voltages and current.
> This should be a separate driver.

Fair enough. I wasn't sure, the reason why I've chosen to add it to
the sl28cpld driver was that I don't want to clutter the directory
with many small board specific drivers. They all have the simple-mfd
parent driver in common. In the end it's up to you of course, so
separate driver?

-michael

--6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaL5/4RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iHHAF/SN8mk4/c9/7qoNU/dYaz4jj027g2vf2/
pv7+yMMwRPbtPffTZM2Eh0NvFRSzQidQAYC/Bh8oKn1Xd+dtXLuRsnqvhWFxlUV5
u8IrsKk3DiMbCQ283oy2lbs60sRh1CNZlTI=
=W+tq
-----END PGP SIGNATURE-----

--6c29f15d4f86f34b14080c43bd193c1b897e82398560c3d529c55b51afa7--

