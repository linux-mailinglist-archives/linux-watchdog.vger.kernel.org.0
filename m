Return-Path: <linux-watchdog+bounces-1198-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338991A0B6
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 09:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9BC51F21A08
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 07:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6E66A33A;
	Thu, 27 Jun 2024 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4KIvXSM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9E59164;
	Thu, 27 Jun 2024 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474266; cv=none; b=Qjq1Mh6+CozzrZTHsJ4iredNgGiOS/ICMcJuZAbqq8CXJf5dd3D91kGI4jUHW0CiIkA3UE/1ifl8cTjFm8uKKvbEufR3xzt7wI60Pgnu9my/YEHjRVvNLKnQwywS4bXUis9SVigVexDH8wEdDw52/E9aZagD8HCCGeKqb/XXa7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474266; c=relaxed/simple;
	bh=Ohibi/MKjfxn5x0q2iapNUsyjqoKSUIK0/ZklpWYpzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iq8eS3nPbjtN2e8KWBZeCwkvbrmV/dF4IvE7bDpwYUe+naweuMZj2aMMXkNQ4BXaplcYGuNqoAVC+Fhu0E1+CUsVIP1Ia/JQ1nC2xXooHMiZ3ZJv3ddh3o+lWP2ekELH+ngv62J4+VMDAcdZllptAPNjkDemIiVbNxT0pxSMFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4KIvXSM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so5845749e87.2;
        Thu, 27 Jun 2024 00:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474263; x=1720079063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KXPCm4QqrG02zQpeLayKZJSjJmW4Qm3NExb6YrcEiHk=;
        b=R4KIvXSMV/oNzhgnwff0eESKoRgq6oNI2P+PTwHA/bxwDLFv/fe5kfoGxJrmsUyHuV
         33qz2OAVrsqoDuYAZNnl2s6nceEdIYZ+82SJ7psDM36YkQ0PV63M1UOlwAAC0U1NWvBO
         37OgddyxCJ0cZv2+S3iVZiI42DUh3PGB21hUzYVuS7cRAoQxCoKwNeV4w0SzLZuYkUyC
         CEmfAGX1easqQMD3wx5O2GA4Mow2uTobjzQV+N/zDfubR4NnlvbEpZYIDZemqL6hMEgR
         9ZiWBdXb5xKuc8cpYdvnIUg7is/n5YMyrBDR4GhHxK9rb45ehpWS6wFESsNo+cTy/bth
         /WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474263; x=1720079063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXPCm4QqrG02zQpeLayKZJSjJmW4Qm3NExb6YrcEiHk=;
        b=p5VCqWlIVqTThylL3XX1D7fkTP4nQImdlYeuzHd7Ny/JFQ8eioqflO0hS2JTOlSBKV
         tzWg11wf45gtcfEaoWPRu9K6hfwHft35f7GnMPEG07z1o+R3em6lus3Oc3l+MXLBxbDt
         5/BWt0p7/gGacmSXXrD0cbtBc3a1vDelnDgGsueKIHtcG54V4J1Ayo0YcX6/T9XkV5Zb
         KeQrTczBzc0nbJgw7XpkEGeJWJ1nykuwAnEvosN4rpqGfkCwHjkgsyOe9WIFcy/IRchr
         eVZssjkxG3stCAL76uhxx0oB57tvJpnToy1egvfnh/40DBiYHBjaxpmrvL5OeTcF7S+o
         agxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhOHLrjDmabSvVU6Q4gyOulmbTRL8uUgUvPAXfjspfkyodg35pIqtP4cfjH+gfqpVGdEi3yVXnCLv+uhdsAck9+pVWQwFe/dMD+YuZalxyHmOrbFnib7up+yFkJGwoopeZT4zu8PlDqwN1HBrPTV109WDoNb6y6FwAZGL1TiNeDTbHVRPgjfTm
X-Gm-Message-State: AOJu0Yz3PkaSKpiiSUTg6dXmJrKZLHwTuBAB2uK8svvrpuv2X2aHNF7H
	nlPk8NWUXkZqBst3kckjAwhNn1YaRlkE2ex3uC+PR75JC0+II9oW
X-Google-Smtp-Source: AGHT+IGJUDaYb8xXyWtlj9Hx16u5cQKpdUHIwzkOVgqm7JUT8ofODe4USYSYLUb8m+wPE1i6gHUoow==
X-Received: by 2002:a05:6512:1cd:b0:52b:59f7:7602 with SMTP id 2adb3069b0e04-52ce1832142mr8441964e87.8.1719474262202;
        Thu, 27 Jun 2024 00:44:22 -0700 (PDT)
Received: from fedora ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e74399e8bsm33294e87.253.2024.06.27.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:44:21 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:44:16 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v5 6/6] MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
Message-ID: <5ff9616567983611ea0b07a91403ea848451a339.1719473802.git.mazziesaccount@gmail.com>
References: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JgNjlac/0+vJyYhV"
Content-Disposition: inline
In-Reply-To: <cover.1719473802.git.mazziesaccount@gmail.com>


--JgNjlac/0+vJyYhV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add maintainer entries for ROHM BD96801 a.k.a 'scalable PMIC'
drivers to be reviewed by ROHM people.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
RFC1 =3D>:
- No changes
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..dc79a45c763e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19446,17 +19446,21 @@ F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
+F:	drivers/mfd/rohm-bd96801.c
 F:	drivers/regulator/bd71815-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
 F:	drivers/regulator/bd9576-regulator.c
+F:	drivers/regulator/bd96801-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
 F:	drivers/watchdog/bd9576_wdt.c
+F:	drivers/watchdog/bd96801_wdt.c
 F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
 F:	include/linux/mfd/rohm-bd957x.h
+F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-generic.h
 F:	include/linux/mfd/rohm-shared.h
=20
--=20
2.45.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--JgNjlac/0+vJyYhV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZ9GFAACgkQeFA3/03a
ocX1XQf9E8jHf1bhySYIn22DBlc8H+3KV5EG8fYmsg8BWmM22d/eFFcO1tk8roGX
DcQZ/VW3Hwc3WzS4NbVQQql6U2+SGExn5GFMGkVUZGPEJYDm7YxQAVIEJ48tjYs1
s0tOaDLF//+5Nl4m5enH9hwXEEC5lF2f9PNWfDCvtJ/pKweLot2EVAraPh26BQEb
0jGx8Pn/tc5RnxavIDJolGOluOZ7MpDwdGshgEWaDsTW5IpaZTvLz0we89Glb1C8
uB3NDTMLSw1taa4wnGgIDWXEKoT6YAxyhuvnEDcP7/c7LyTYwbQz6e04cFoenWRi
pvR95Y9mLZsEtS5smTBtrUgLLMYLcw==
=McAm
-----END PGP SIGNATURE-----

--JgNjlac/0+vJyYhV--

