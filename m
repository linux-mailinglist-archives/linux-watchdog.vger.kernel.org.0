Return-Path: <linux-watchdog+bounces-4050-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D157EB337CA
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Aug 2025 09:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57FFA7A2545
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Aug 2025 07:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD9428B3EB;
	Mon, 25 Aug 2025 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hj5sfPcu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DB22B8BD;
	Mon, 25 Aug 2025 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106921; cv=none; b=e18j9AvxVUFfcdFTs8pYH92c5aIyUTYb/T+WlmpjoRj0ne5TMhJ1d84EqOq06+PeP4BOw8oeE/LQKJCG4iX7D1eNKmjpuaMx1yNhDMKM27h7XAalIQJWtJRsA19+eHyV1NDckivpfwW882xNvFyGnJZylaqeGOPm+IWC6OtSmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106921; c=relaxed/simple;
	bh=OHl2l7fwcSBs2PnP0cy1ul4eRIrzpQHu81WxmlH2tY8=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=r9Lzc736EwNJgav1ldvb2tJW1x3BxK8AsD5J/Bn1AJq9UABWBFDWZhFi6UGuOt7TV8jGBbSC5+4Lfr2G3lE86V1+fyKHMNeJ0w03axSvWpK1kxc1b+5GexAbpFEjyDl+tsi3Xq7ifhxwuE7aeWUTaRkLWdB8sdKaWv1ZoBJmSOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hj5sfPcu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C98EC4CEED;
	Mon, 25 Aug 2025 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756106920;
	bh=OHl2l7fwcSBs2PnP0cy1ul4eRIrzpQHu81WxmlH2tY8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Hj5sfPcu+0GZO8ZMxzNtpk2D3hDwuorOx/VaVXaSdlFYUg25YCacBi2RzIKDjLwc9
	 OSxoJ3BfdjPKlCKrQQA5vb1iWAEobDoaM4vFbHlTGtIrr4o/C903UnkugX2HW65tej
	 R1e3GzYuyURQoJdYO0llKI6gxDPC8MHc77Xw+AgADdLcO7Hv/RjckYy+t5u8PBuMpq
	 GVSeBvBT5ikpD6pNNMSamc0FY9j/vF/UgYhUYISaU+2JejMF7xwI2SBZTGOVtybrlv
	 BUQwQnMyz9fMU/9kCIjr8MZp3j7BZa1HPKMZ++pvva+t+UuIq3w7YPyj95aiJYicbB
	 qzzCyqE4DRYXA==
Content-Type: multipart/signed;
 boundary=fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 25 Aug 2025 09:28:36 +0200
Message-Id: <DCBBY4827XAZ.11UHI6NWP7RT0@kernel.org>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>, "Lee Jones"
 <lee@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Nishanth Menon" <nm@ti.com>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822152313.vjzjtzik2q5ek5kq@sadly>
In-Reply-To: <20250822152313.vjzjtzik2q5ek5kq@sadly>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

--fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 22, 2025 at 5:23 PM CEST, Nishanth Menon wrote:
> On 15:15-20250822, Michael Walle wrote:
> > Now that the PMIC support is there, we can finally, upstream the
> > support for this board. Besides the usual device tree, this
> > patchset contains the support for the on-board house keeping MCU. It
> > make extensive reuse of the drivers for the former SMARC-sAL28
> > board. Besides different hwmon sensors, all the dt binding patches
> > will just add a board specific compatible (in addition to the old
> > sl28 compatible) to make any future board specific quirks possible.
> >=20
> > I'm aware that there is a patch [1] which moves the sl28cpld MFD
> > schema to a different directory. Once that patch is merged, I'll
> > repost this series. But I already want to get some early feedback.
> >=20
> > [1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowsk=
i@linaro.org/
> >=20
> > Michael Walle (7):
> >   dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
> >   dt-bindings: mfd: sl28cpld: add sa67mcu compatible
> >   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
> >   dt-bindings: watchdog: add SMARC-sAM67 support
> >   dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
> >   hwmon: sl28cpld: add SMARC-sAM67 support
> >   arm64: dts: ti: Add support for Kontron SMARC-sAM67
>
> Since this goes through multiple maintainers, may I suggest the
> following strategy?
>
> for this window:
> * send dts and board binding changes dropping the nodes that are yet to
>  be upstream
> * send the compatible changes to each of the maintainers
>
> Next window:
> * add the nodes based on acceptance of the driver bindings
>
> This removes multiple maintainers needing to give me immutable tags etc.
>
> What do you think?

Not sure, if this needs an IB anyway or if the DTS can be pulled by
the corresponding SoC subsys and the DT binding can go through
another tree in the same cycle. If not, I can certainly split the
device tree (to my knowledge, it was said that it should be a
complete description :).

I'd expect that Lee is picking up the first 6 patches after they got
an ACK. Please correct me if I'm wrong, Lee.

In any case, I'd give this v1 some time to get some feedback on the
patches.

-michael

--fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKwQpRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hMEAF/Vhvuizfo2QflfI6C2/jHtRw3dLRPlo28
HIDgT2LP6cbtUavEPx2nq1ESho4HXf7EAYCPD4RX3DAZ96VoKuiMPWtrhByKmEo8
LvQhb/8169l6w+5b/5Suq4WzzVE4BArZHes=
=DIAl
-----END PGP SIGNATURE-----

--fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500--

