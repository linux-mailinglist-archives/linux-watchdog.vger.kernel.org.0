Return-Path: <linux-watchdog+bounces-4307-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D59E9BB3D0A
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 13:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80C8A1923D90
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFE7304BC6;
	Thu,  2 Oct 2025 11:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MBU49MfC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D772ED866
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759405792; cv=none; b=ZFJp0eyBxfIYSKIHcb8GQuzEVasbItxKVs0hbA1FqWg2wxMvz79Kq3z5cZ0kkJ1NG3DVYbhy4lbarGc/srXbCUMS6gqNXLXLKWyQ+Ie9W9ele5Wh+j/gZDK9CafNGftJuNJlC2yJTHKZq5GvROzLnFO+lnnWjI63eDbZDyuQmr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759405792; c=relaxed/simple;
	bh=ce0/XkN5zkEtykoh4F14aijPmOF1cEWyAFp8FrBCYiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5bUmFtK3qwDiFPAYaY6i9H6dseXy4bjumRvKB1CjR2B328BYPRuXTz1RC1pHTz8j1hrHuw5moZwKmd8Cecf6KwD36WibwWyVDfe9Q06+UIRp5YG42ef721DB65BvDlUjDXaaKPueL4LMY5NitpedrtSH1qwiN4jUhAKeydhL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MBU49MfC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mS+R
	aU/N3sZxgyqOlzL7mMSLe0f1ES6Z71fhweY0cpI=; b=MBU49MfC+kEDi7tVikUQ
	ssRZYWiyCfWRyZnCAKsaO35J4KSu4ZE8/Fbw2wrjZy/jQDkvxE3VgpyvLeRhOWvQ
	SsetPHAq7ucBe65WHiWAeYFc6ma3u7GRyVwn/vMvkLN5n2aJMsuu0WB1l4dS3X2G
	Qrb7RtMseKLeiydXRtRZQVsIY5fx6bpHAE86pphgAFSZhhR1zGJzklpyt4XXN0WB
	h8BWyLeHFriAZNRGMWRxfl5nzyYdIsAjiJAx3jXjqye5McEw1TN9O7iPrUwK5Nye
	ckVMax7RQQWaeHjjlOZIjj27fdKOerbGqTLe2Y0od+O/9TTYnW/oARWXEG4WJq8M
	3g==
Received: (qmail 248369 invoked from network); 2 Oct 2025 13:49:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 13:49:46 +0200
X-UD-Smtp-Session: l3s3148p1@DAbklCtAKswujnuL
Date: Thu, 2 Oct 2025 13:49:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
Message-ID: <aN5m2TltHzdBQDLT@shikoro>
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
 <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
 <CA+V-a8tqOBz2i_7Nny488syuSXGBhe1japjX47hkN6_Ejge1ZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CukGRbOVR6ODqes/"
Content-Disposition: inline
In-Reply-To: <CA+V-a8tqOBz2i_7Nny488syuSXGBhe1japjX47hkN6_Ejge1ZQ@mail.gmail.com>


--CukGRbOVR6ODqes/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for the fast and detailed reviews! From a glimpse, all your
comments make perfect sense to me, so I will send a v2 soon.

Happy hacking,

   Wolfram


--CukGRbOVR6ODqes/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjeZtkACgkQFA3kzBSg
KbZtMA/+MfrX4yFdCG4XbwClnRZRYZehLb3kx10LfVv20jtuW5sjhvWGd9HmHP9A
jGi5Rezj24hW4SzWYBRLiwOKHF+hw0mmCtNhGydQCoslzObFRXk6z+iFNAQbcQre
Vlvb27O14G09L7akUmHfzC5C6mE/BufFPIChxdjg4CTSUSAoI9AYR64JKjtekbKX
Au6wfcEd7gEyb+DOsz29uzmVYqueWMFTzRd0JcK0rkypa0ACL/LNh58+rVOniGrN
3FP3L0xUWTSKzpPpjzt2gJtwn0pmuP9Gd0xuJQ7ltJmJ6ZmnY1pPMB/ocd2BNnpk
IiBXSkGpJDVF28Y6gQ4qn9O2MC82Xaxav/XSZT17GNLg2S9xM7La6CZxqgzuq8cX
76Y+9tKqsqllwLDUiurUp//E+ikoUSTMxZDOi05HbCKJ7vQ3UF2vM+4axZ81ruzk
kxh1C3LyzZ47QbgFmnYrDuuRBiY18ELaii7Zhj8LbWVAGc3Wy5DIuD/uSQTpe42C
igNN5BSjNKqLMGALogCtXrPrSSAc01KupVoBPkL0BwhO23arrhhdbjARZBp/PLwn
TQleCzT/PKS9XWFrvuxeEHNb7Morbg3EhZZtCZWF0PbnoenAcl3sRLlwsScZtEtt
LR6God7zafboyc9gjWbllQkPz+qCmfvefF7K/PgP3hrmwp8CqFs=
=XlV0
-----END PGP SIGNATURE-----

--CukGRbOVR6ODqes/--

