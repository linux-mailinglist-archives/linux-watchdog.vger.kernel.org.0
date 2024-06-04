Return-Path: <linux-watchdog+bounces-1094-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F07B48FACAA
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FD351C20AA5
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56C71411F6;
	Tue,  4 Jun 2024 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib3GDr+u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA525140E22;
	Tue,  4 Jun 2024 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487725; cv=none; b=JXj6m/qwPdsdmEDODWcTb1PYi6dxv0YNCCEDHi4jqdwFLYl0fG2hzCXg6Z1hf/zTmn/bNrzrXAjzJ7MvzxYwKFj4ukg5cdxLc5fiB9YcBOu/v3SHaJEdvmLQrctV45uztdjzO+ArFCRd2T2HZEba7yFc9TUsLulpbGKU9YaDHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487725; c=relaxed/simple;
	bh=cKCy+oWY0h+rEhutkL8EOrTmWwMttRhbA0ARRfYezbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvaP2iq0prjNywKAyD0yYxfQH82KzAqK1i+ISv0mP+uSlGlyO42A12wvjJvQdqez4Z40KsBE4/CVGtyznTSdIqj+yHYZeAD4f4u93X2hj1hiOsCCm5M8uMXuNnpibt+TAUIJOxmBWVHJ9G7oW+xR5U4Yfj3fB2PynCrCiab+gJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib3GDr+u; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so10316671fa.0;
        Tue, 04 Jun 2024 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487722; x=1718092522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR7EzWSYNbnwc1q6qNQZ5dkYY+ZH0oWfFYQmDXHB9Nk=;
        b=ib3GDr+udSt9kJ1TxG/nD38LlvSnsHPIZ/Q/4WwgWFb0Ki2LVphYgmdLVBbwqE1JMo
         TQdS8o6kiokuURjef1WENUogsdc2k7f42ZHsSSTcLM8RHxGr8csP4uRG+OajnYVPYaB7
         hgXwB2yck9FRM+HWUoVXy6MObTF80kA6bBT+ILwEIl5wrBLwioYOlIqAoY85/6VovnYO
         nZfY1IK1lJYUZNT88m6FCDVOTn7W0mmeTtcaP0m54TwoD8JQqRs7FipND7maSMRBF2Dl
         gSuEkvT7neQnyVZLvCXyMVqDf/DNZsMVtRdYwF18FU2nHONi+RXgG3SqU87fbYmLcKdQ
         xc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487722; x=1718092522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR7EzWSYNbnwc1q6qNQZ5dkYY+ZH0oWfFYQmDXHB9Nk=;
        b=IinwX+adPs3+izUBjbHnMu3cbFfYCXzUZBHZYIBy3bvUHv+XGD3VYyY4g4DhFakLSt
         5D7E6D1IyYuzvNvZEOFGTqg/TTbTs3yABR/oRhqHUcJ/bwsxAGsZTBKSosdppKcHC6ty
         wA5n7fpGU/hMpldcPTsR8sBxqsvCYSNs7NYyBz3M5yU0Jkq+Z6MXQvraTF0KfT6Sr2fn
         FaQFe3deC2E4mns6t2dXkZx6iuX5avjsQh7c57Gf2XOls0mBZqvuLm72bC1WqN0Hsh24
         0Oo66vd7AtnjsdfpTnluXOjacbfMv2/WQYPMPvBwCOvyKzKOZCZD/YLzQWeujL8LvOmN
         JDtw==
X-Forwarded-Encrypted: i=1; AJvYcCUIOT15OBh5BggQkvCYDJroe1O+Zw62nf51U9DMTChbkRWDy4q5X/b1TIXGcPxSdQ0Lmt/0D9aWVmbg06TuMjdWMdld/QsbaDHmEynZNAzPx280oRtK3iUr0idjt11XKmmgmxmiXrqf3Ss3Gq7WvXRMzMopEgjYNXbtWPhqOhQH8pa6UNLGT9d4
X-Gm-Message-State: AOJu0YytU8bJT1TkFa78S5Tx4JbZDAw3CdfQQAsHLSLupjlii9XuKWyM
	vyM2a7K2o+dQS9iwKLAMmWMs1+jyD7JXY727q7xxI7VFj3rn7BYI
X-Google-Smtp-Source: AGHT+IHVcMx40582ZYla5OZeU2SaNMPt9n+2IEdqzPVpHQhbhFjwH0omKiQr5jntvCj2DJCoZSMfFg==
X-Received: by 2002:a2e:870d:0:b0:2de:73b5:427c with SMTP id 38308e7fff4ca-2ea950b5396mr69437171fa.9.1717487721731;
        Tue, 04 Jun 2024 00:55:21 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cefc42sm14394611fa.117.2024.06.04.00.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:55:20 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:55:16 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 06/10] MAINTAINERS: Add ROHM BD96801 'scalable PMIC'
 entries
Message-ID: <951c2f61a781f259f21ac307a4a411dc9b1453e5.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7LNntzLrp+h4HCc3"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--7LNntzLrp+h4HCc3
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

--7LNntzLrp+h4HCc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyGQACgkQeFA3/03a
ocXr7Af8DR60AuvLvAVTPxd8S12x+z4nPUApS4vcGDf/ucNxPn2yc6AveJv7wjmH
8z+2sff5jEkpfBJXSWBV0m/cfKc4dkV1/ye4NpQaDvgT4lMuQJ1Fnhd9+rycC5up
n6I6pdheTSVaL/T0Bcs5lBieaoMsidizS2T6Tj+yb1o+nec20BiInEhCuW0Bucu3
flAbkVL0yvf25cSkVwhBmADCIxawpJe4i+taN75OCyP+e6B8CnHh4tYgLhBdh00n
Y16Sqqxi/aKfkyQpI1/s3/+jeoywkV3sqUZbGeeKUEW1qHGOUi7IwuffsSgO7QMe
s5gVM7qJ/cmN1dReXKGwL7ZNmZgiNA==
=z7F2
-----END PGP SIGNATURE-----

--7LNntzLrp+h4HCc3--

