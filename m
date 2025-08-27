Return-Path: <linux-watchdog+bounces-4067-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F37B38224
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Aug 2025 14:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F30B1BA5DEE
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Aug 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310743019B8;
	Wed, 27 Aug 2025 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b="z9zv6kIQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B6C86348;
	Wed, 27 Aug 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756297136; cv=none; b=LvLvCXr5lIOUEnCds7Zryw4JuCaHyljTtLVmHLszaDJjbqW6tGFX9OWnloBu2P2eCNM0MKvEXyK47ZyZHPUKT4W+vjMTyNQDn0jYuV8s9H2/U1nVIjuvMXjt28PcIJbjMoQ1mKOs6ueUn8DZ8Tmji9XIdcPVxDiFX8IpXNr7twg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756297136; c=relaxed/simple;
	bh=BAZ6kW+urfpJVrbmmVHyScLCZdUx7Khi8HxkOyhlNCw=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=MbcmPGHI3BHGoalSsf12LLLgB8Vc8gW9gK/Qq3zskZug6i+fPlAl2FfkD6UbvZojcd1DkE95/lDBZ7ujubt5OVFU43A2Cy/0nS31VcO0JYnpiD3+o2usjttQojbGm8ulxWxolax+B465J6gnDME2EPzsmOQVYn7F0+Y69IKX2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc; spf=pass smtp.mailfrom=walle.cc; dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b=z9zv6kIQ; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EDA853B5;
	Wed, 27 Aug 2025 14:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1756297125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=BAZ6kW+urfpJVrbmmVHyScLCZdUx7Khi8HxkOyhlNCw=;
	b=z9zv6kIQFoN2PsmzULXqbyFV4INj7xiF/R3wu5k7KzkFZ/Yy4dv7xMoA9IGDTNv6o2bCOJ
	khCF+QlpsciCiL6qil5OGsIFmU+lgeHoZStyNJpaqi9GJwRigWWzze2R3aJ9CfPJ2oDL9g
	0KJSbA8JbzQiVH6VUd27HYIFwkyR9uIXymFlNFoZ6alDxpRX7E1zyuQixVHfXxNGoC7bhK
	Ksc4nhICEp4UnwtquAgnrUojEd9wif3qgWbr/Ly/VZnYzgtjTVch4yPrkK3pLCWkgExWt7
	n5F2R+0cFZfrVmtLPFic9F+nt22eNHqqDw4n0rvdvWvnz/SvWK18S1XZdi1G3w==
Content-Type: multipart/signed;
 boundary=25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 27 Aug 2025 14:18:42 +0200
Message-Id: <DCD7DBPZMCSI.1516QNLWGT6FP@walle.cc>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>, "Lee Jones"
 <lee@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Michael Walle" <mwalle@kernel.org>, "Nishanth Menon" <nm@ti.com>
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822152313.vjzjtzik2q5ek5kq@sadly>
 <DCBBY4827XAZ.11UHI6NWP7RT0@kernel.org>
In-Reply-To: <DCBBY4827XAZ.11UHI6NWP7RT0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

--25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I'd expect that Lee is picking up the first 6 patches after they got
> an ACK. Please correct me if I'm wrong, Lee.

Ah my bad, patches 2-6, i.e. everything belonging to the MFD driver.

-michael

--25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaK73oxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+NPvAYDV89x/w4W9hx/fkMchHZt5GuIDMb82EdyH
GzA6TiGytphiSsatpAK5+CjxCG5h+BYBfje+9JS6ChAetWdIq0skCvlLswe9Gdkr
XEQfnTuzXkZMTxp99sjE7obqH0FpmSfssQ==
=HTIU
-----END PGP SIGNATURE-----

--25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c--

