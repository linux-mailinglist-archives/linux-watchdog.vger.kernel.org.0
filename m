Return-Path: <linux-watchdog+bounces-4052-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E59B33845
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Aug 2025 09:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BADF3BBD1D
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Aug 2025 07:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9F3288C22;
	Mon, 25 Aug 2025 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8k6sKaz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF1A14F70;
	Mon, 25 Aug 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756108426; cv=none; b=BQkv/+JrIDD+oWam26B1/LCfVcxg+R8nb3x/OuoBiRfosTqdBGjH9UKuJo2xLzjZDVVMaZ405KmrODvutaQt5+pp+3jwwJ7Yo99JacjIjIoKWlNHeh1Usp5A6bnxMeGRtiCrxT3QYkFmycu8M1V8CShCpeDB+Qv0pUtLruFwL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756108426; c=relaxed/simple;
	bh=siHquftZz0T1lNm1I/MwnFut9RzLZNKPq03XuIRiIPo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=NMj3X3GdryQD/7bMztGTowNMo9kMu1bRL18Obo1GgsHEK8IkF+IGdGer1XmcZKWtbrRp34E4BQv6H7PbwhUiAZvZhlJ9Hse1uVG+dcyDkSCkUM3D5q/cdxFJmQlA8uuhfrnyofNGkfPSEWH+r2FNyZX2Zwp1X18tkAunGFZphnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8k6sKaz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16345C4CEED;
	Mon, 25 Aug 2025 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756108425;
	bh=siHquftZz0T1lNm1I/MwnFut9RzLZNKPq03XuIRiIPo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=k8k6sKazH9DJEFs5CtJJZLnhiTBHEO1bX/rnpwXPJNZo48yymmubbIOmwJXqmv3ZT
	 SXMv8m+oCNZ4P77DBsHf83wsZJBEwPkYslRFxaRNV+8uFmTJwqoQnOnwxwIImhSujO
	 ni/5YRSbxTbT41bL5jHSDuALdxqcnA4cXU5ObFuGB3xObZAq6i4/BPlzIl3Zgdmz0S
	 WqoV7Ysfn9mtf77GxKI1gNL7195/rMrSIzzXw+s2BnenqJqgy2M9yC4U4CYB2oU/ub
	 nv7PO6XkeDpTpKuL+SR6yzrdxjS7GHP8IcX6ZrK84U9e7fkyamhoXFLjPCDukgNsM8
	 88TAAehP6HF9g==
Content-Type: multipart/signed;
 boundary=4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 25 Aug 2025 09:53:41 +0200
Message-Id: <DCBCHBIVM5IE.12J0BRE4I5KXZ@kernel.org>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Cc: <devicetree@vger.kernel.org>, "Tero Kristo" <kristo@kernel.org>, "Jean
 Delvare" <jdelvare@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-watchdog@vger.kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Lee Jones"
 <lee@kernel.org>, <linux-hwmon@vger.kernel.org>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nishanth Menon" <nm@ti.com>,
 <linux-kernel@vger.kernel.org>, "Guenter Roeck" <linux@roeck-us.net>
From: "Michael Walle" <mwalle@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <175589786195.518444.15005080125108403794.robh@kernel.org>
In-Reply-To: <175589786195.518444.15005080125108403794.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

--4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 22, 2025 at 11:27 PM CEST, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/ti/' fo=
r 20250822131531.1366437-1-mwalle@kernel.org:
>
> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: pmic@44 (ti,tps652=
g1): 'gpio-line-names' does not match any of the regexes: '^buck([1-5]|12|3=
4|123|1234)-supply$', '^ldo[1-4]-supply$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#

Damn, very late change on the device tree :o I'll add a new patch to add

  gpio-line-names: true

to bindings/mfd/ti,tps6594.yaml

-michael

--4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKwWhRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gPpgF+MlSY31S0rn1uDnKEPRt4gulqhcaJE2kZ
Hy1IB+bI3+b9ZHbrP259Ugakq5SnfCa5AYCq7S6UcN4nPsU+gNFqo7B76clPp/xf
6zY9VAtwCedukMzpOu/ekK8Jl3HXM63sn+Q=
=KZxC
-----END PGP SIGNATURE-----

--4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284--

