Return-Path: <linux-watchdog+bounces-1132-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 244219087DB
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 11:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC3D1F281E6
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D91F192B65;
	Fri, 14 Jun 2024 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc1jMM5s"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139E192B7A;
	Fri, 14 Jun 2024 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358277; cv=none; b=ZcOb/iLCYaVXMFjA9W86PGdgfaRlyc7YRSuWZmH2N1xHmtHnByxyBH5iPv6LL6AIZeOodqyLBbw+N4PXrl5gHEC/KtJMKAHEzPl07ANE0+cbpvSvwtsB9e+Gu1GsicYJSiEctDzp+NY/DTSjuOXlV30kHNWAhLJ1xuyKHO3Jh+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358277; c=relaxed/simple;
	bh=B01cdTgSZj6VsubUNOviOQvnIDrEGMdwa+83FJVG9cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HquQsfU8K1dEhD1SxF8OPF9EgLSiQwSE9n6bN2tqUOTdl1BQ14pLUzd22412yKPi9/j1xcOcesby3Ojt63rt8oZLZEQdQ4143R0YFn6oWjqmSez9FD/gxJRPF85FtvsKSpHYVo86xXjVttBnTsmRfZjH81xKb49AL+ps13EyHhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc1jMM5s; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso31857541fa.1;
        Fri, 14 Jun 2024 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718358274; x=1718963074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lY/67/dJvO2Ri5VC5Y1MEBaOkJ+Rmx2YeXrE0VIx7gw=;
        b=Jc1jMM5sdB1TeWCTn8wr0s8MG9kWaC4RWXxVXuoNjUCxklqwqLHR0Rfrjve0KtaGBs
         D6Lg0P1gEzNyNG1SIpAoGbxbGhq4KRVAdOfNiGz40WltdVaVqvCid+efPjfs/w9qFH5R
         aq3wvPetDsPaWxTQNW/Zl08Ha2WwZUXmJcCFb95lsjBCA/LsFX5iSApuKwPvJF0Z+8BC
         aWJYSWCcrwLun+ri+c0uZ8LenUWACEnv9267MsCAh0rmEr1PQa3d5IXMayDlAzSQIJ2D
         6IyM2hKPr5iCyfxhADjfEb3EzbrTjlJ7UnOMncwWYV9cSPfcvFKZlVyacjBSLoLL/JDU
         AmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358274; x=1718963074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lY/67/dJvO2Ri5VC5Y1MEBaOkJ+Rmx2YeXrE0VIx7gw=;
        b=cSHvr8a+M7zjx8lZnIealbTOFtVrEReJzX1YmL8yfcMIAuGIwHJWEAE+E+38dyQyPV
         Anc6OSSw2Z1inI3bEktKiy5ogvfYNKnPRJh9C0R/btXVKnjJcOCJv8RqcRo4var7wrj/
         Ld7O9pwtBTpekeZAMVm6OZSgjtWV4iEtUaVoeXKoVHMB3Ida3OaNptVhbs+mtG5QRokL
         VrR5mBYQ3pQVawRKfeTxveSYPN7uqBLec1Uw0O28ftIN2MC2YxF0NvUvE8i7iG2LmLqP
         gKzBqE6AoxQ6lqE02OqgHzy+UbQhU8uGKYfDKaRYRupcHUOdOUkbn44Te5fG5PlimeAT
         R3WA==
X-Forwarded-Encrypted: i=1; AJvYcCULGD0Z4PEom3gdm6xEWuTP2r9YAwKA27NRGU+Z31pyP9b/tnM8ABWNrusY9lrRUhKIRBJaSWrE+GpBc1mkWXJP6qZvuC5NNqdBvw+LF9wkHueo+noC4E5nzt3wJMhvWl5yQaCljqnHTMU+YE1s9cd9oDO3yl5NtCom3/+qPthTUzrspaWa9ejN
X-Gm-Message-State: AOJu0YxoGlIcro+6S7WDlJTmsPfBCFW3hZjb56KTtY4MbKciVuzrzMfW
	/4WxQo7xlGZrNzJKI7Y2GCcITWi5+WZ30gIQx97ZJzm9Guzx3STD
X-Google-Smtp-Source: AGHT+IEAeXLR+EZ0Tq9ukGQmi3la3w5foxvNKrKYs8Vbmxx6EakkdntGvBUuLpNWE41IxUL6R/n2YA==
X-Received: by 2002:a2e:2410:0:b0:2ec:1779:fd5d with SMTP id 38308e7fff4ca-2ec1779fe9fmr10467711fa.19.1718358273745;
        Fri, 14 Jun 2024 02:44:33 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c99f41sm4991861fa.129.2024.06.14.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:44:32 -0700 (PDT)
Date: Fri, 14 Jun 2024 12:44:29 +0300
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
Subject: [PATCH v4 6/6] MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
Message-ID: <439a8a267af682800b45387cd23a636c0e689146.1718356964.git.mazziesaccount@gmail.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cq8TJ8Uc7Eur0vs2"
Content-Disposition: inline
In-Reply-To: <cover.1718356964.git.mazziesaccount@gmail.com>


--cq8TJ8Uc7Eur0vs2
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

--cq8TJ8Uc7Eur0vs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZsEP0ACgkQeFA3/03a
ocVoNggAv6tEE8qrcPAlZH9YmpKYIB8tsBrrVtYQTW/Yl5qhe3+tAPgLv8vE+SPW
Jj/7rAIU0MeiN/Fx62Rqsc/mOEJhK2t0zbBCwqUtMvcvYhH1r5TBHthgR9+pcD5T
bMoTxKYiZAFv5YhL3trz525CW0nht016h8TrmJIRKlOSXeG1+kNYZKGhhetJymU7
jHclzyKQ7i32U19ju68hpTcSxAwpZtNzlNRmunF/PJmwGobI++yO7gYUHH91e3XS
VR4LigLQq3DKKrT2I7tKbch50KKPjnBXGQHWb8X4zGRMKbyUYoBR0hAg0zSveYgf
E8lpfI/JXf3JmVEqFXptJYMXH3DVng==
=FgvX
-----END PGP SIGNATURE-----

--cq8TJ8Uc7Eur0vs2--

