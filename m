Return-Path: <linux-watchdog+bounces-1068-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFB8CE23A
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2024 10:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DB7CB2216D
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2024 08:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D446584A53;
	Fri, 24 May 2024 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmhgTztw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B0433D0;
	Fri, 24 May 2024 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716538721; cv=none; b=LwBRnpO0aOorfgNi3yymzLF4TFOedfNRv7UTm/bayN1HAHLBtidWmHvXqge02qnP6340iruIb9G5w5oRUSLsFsgWLA2cXwQm1f4wRPTpdR/kR+F4M8revf4lY7aRFm5uDxd515IoCLIVCJ7tgstcfUtonrjsF5O1Y0GHkNF7Csw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716538721; c=relaxed/simple;
	bh=e3m9C/0ueWVwepQ66gAO64OgY4CIjd3EsXv+WkJ2pIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bnwj2nAXhkMOwKUyzAo+lj1eLQMwjE6QzBdtZ/SOATMMBfKd8JaHlzAuUecmNEz39P33Xb41QJsMvK9cnY9lkucQ/6LDfwbEtYP93R3zckdFAe+qZOTdAGWhVouyB+V6e4ST5uOCwJAKAXuRCER6VAiP4peKr+KYkPrSfHQaa8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmhgTztw; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e576057c06so83807931fa.0;
        Fri, 24 May 2024 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716538718; x=1717143518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMpIVJglei9hIGKjvKKzJug7o+OdBfjhMAJTH1BrLsw=;
        b=CmhgTztwXvDp1cdH/Agi/yTgHjlesfPXUOL2qGGYKKDrh5XBxgMGA+qWn/+ASIudyQ
         pWckz6mVKsOvIcXirFnXKKeJJ7KbxYi8HxrB+KAmUE7n40AGjMryUTi7v3QCAjy6zb8a
         k9D1O9+J+QNQ1bihIG21NZN4d2/ulinuAPnWUBNr9O6ay0WnfgFwigQfV2Fq9vmk5sir
         JSnjwDoyrIZ0byYS5CYWw7WtAbW+nElqO8RpJC/gNqziWthZ2rgSQ2tnVrEIUwL4bYL6
         1sTscUOmi5LD9lOCKFGQXp0aR0hNahXm7cx3ZEaCJLLCjw4LKfTrqJWXDApLRjUc2qQM
         e94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716538718; x=1717143518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMpIVJglei9hIGKjvKKzJug7o+OdBfjhMAJTH1BrLsw=;
        b=TvipRbSGlSnnOsJxcKEZFHVPcefF5/vCqjd5jYpq3kYmioYiHv9Z/rXcTmivY1B6LR
         7Mbn/1obMxMYVVTlP5Q/UW1OOo6bGx1oOSaffGwkWWHQJdx6ICux8i1RquMOwJ1Uig0H
         tpu+pMscrxbp8jM93bYnO7oFO8wubwGAfIW0XYF8rgWsU6ycDCaMtYA18ZQE8Pyi2lqn
         mrEAlwrki2jIa1mGfKR3YXkTqX3+S1wzUTCN0CMkP+Ua++AWPGq9a5jOPK8Moc8ufKD+
         +tndfFFH8WHWDhMGJFHBsWsn5yyv7V1vOK8gmzFVOaZD9jU4IgJ1iTRh0b26LS8tFcq9
         kygQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUZBb3kZefOXLVlo9F2ARKLRucNIDa5DU3zozx5Dr8VNj1RO0enxkv4sG6pt3azNu/kjMm4rCm+zWDuMItIK74SRzb6egJhdjJpvOGMgCSEjXebpfYXW+q3nxMNJnikoeUsfiHCKLMwPe6Q14=
X-Gm-Message-State: AOJu0YwvJ56Y4k7GXQxZ8/lSPYYiUQ5wSQ7S0iXgkilFMSKb3CWQV/c/
	vObjS1s+Sd14LpDbwcP1cC0AdDAYJHu9nH8k86yqST0QYHIZkNy4
X-Google-Smtp-Source: AGHT+IHKMUABvU7RAFMUvzi2sRfSxMgnLOBf6n2EVRCr+67mArVHUCDJHr0APLoya5Fbhh7+w+ZMtA==
X-Received: by 2002:a05:651c:1a0a:b0:2de:74b1:6007 with SMTP id 38308e7fff4ca-2e95b25ec63mr12353371fa.36.1716538718086;
        Fri, 24 May 2024 01:18:38 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd7c2csm988441fa.34.2024.05.24.01.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 01:18:36 -0700 (PDT)
Date: Fri, 24 May 2024 11:18:33 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v2 06/10] MAINTAINERS: Add ROHM BD96801 'scalable PMIC'
 entries
Message-ID: <9b97cdb620ef732c53664389fb8d388aee183313.1716533790.git.mazziesaccount@gmail.com>
References: <cover.1716533790.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LGqlVJsH5UtgVBcs"
Content-Disposition: inline
In-Reply-To: <cover.1716533790.git.mazziesaccount@gmail.com>


--LGqlVJsH5UtgVBcs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add maintainer entries for ROHM BD96801 a.k.a 'scalable PMIC'
drivers to be reviewed by ROHM people.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..da68144d51ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19111,17 +19111,21 @@ F:	drivers/gpio/gpio-bd71828.c
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

--LGqlVJsH5UtgVBcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZQTVkACgkQeFA3/03a
ocVMewf7BPFKvS9YA38ED4y9yTj1SoeD3U6flVlv2SRR8kBkI852HmEFwJbVU61B
SjK6lH8Z9H5U4ehK1eSpWBLK9KuXIx+8bAy/ygNJb31InJHC1DR4Waa4DUQeFBm+
YOs8kPT3IZP9Lmg2R9x4/CKYeSwn2izSFBxfaCkC/4hwnbpH41yvbODbWmPqpFps
c+AeOz3LgwrNRj9BMjfYxqqBzSFd7E6XmFqCM2ucwytaiU49Hi3TRBDr5fxCCuQM
W6v50NKCEINL9kqmglbnFEPM68PjPzmOArvwQyFiApvk6Tks2CDotS3rFmGPQmJd
UhbXaZx/Yoz+F7ukqz29p2jhyyP8IQ==
=Weui
-----END PGP SIGNATURE-----

--LGqlVJsH5UtgVBcs--

