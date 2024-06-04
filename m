Return-Path: <linux-watchdog+bounces-1088-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D318FAC8F
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B279B22812
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944411411CA;
	Tue,  4 Jun 2024 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moqQd/wo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246D140E22;
	Tue,  4 Jun 2024 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487611; cv=none; b=fmtyKNhuQ2JN/emY88kJbyvQ+RHfkvSqgWIGBS21L3osXtJVKGqaeQuu9fxp5RAX7UtM/sLDTOvQFP9sTtakSpKzRetBmOSrtmXyFVu1QYoryZvG2AvL2d97T3yu5DiVDeJju7trYoo9+oGaNuTj1y2WYkI/fbL60dIKbXDTgnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487611; c=relaxed/simple;
	bh=CkkoR+jTO/c/8S/T5PB2C0Y2iQWJxiZWMGLWmmPaA/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKYR5ZnVKiu/KPSBTNHbMIt6++peizYM82vl45VSs1ca0FmxI53U+bfkcYKXMcPZwzrr4ygfMrlwz2yNJPCuQv2eODtwDQgxs6XvHgeuoTzmT4wiGCVJuBTk3WqaZo/frpPN8Vkohw+bHvINmBIXNNqbH+WNib0hOouf3p545Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moqQd/wo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso5362056e87.3;
        Tue, 04 Jun 2024 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487608; x=1718092408; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5dB0wf4uouHq2abY9XXLxHvhE87PBtgVQk27pQyns4E=;
        b=moqQd/woSVgxyfuFKOhtKu526+qmaNLtorqJHCSM3YVO5e9oSagtR04jDpkGmCMPQ8
         pnq5F52kob1xxAQHVL0ayeIVMB01HPjXucYCjIumD8whCfbHm2UT2Dr2qxKkaUM95OPc
         +uSNU2GljLW4UquON74bPK/7r+MI5R3cKm8KGBf7GV8IttAz83FBfH98NYyncbv06HiF
         J56U7CGC4pDxiyw7eQvJGqPXVRbcwguKd3Q3sbn8qMqtciwH86fGhAvqj9OcK0hcPI04
         CPiN2ZE7MeXjneorYwfyDcJ4rfhfuWzZQYMLMOFIYPUgtbFcwmMvk9otjQAeCxGKMnnM
         EVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487608; x=1718092408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dB0wf4uouHq2abY9XXLxHvhE87PBtgVQk27pQyns4E=;
        b=PlS9RNVpXREw6WA7bjgpnED7sSIwyCSZJTV6OlfGyDmqmgU7XQMhE759LlGU8gb6Ou
         X8jAepOeAVzAUGurqxKaHHe2r+0BlhCm3VCodVBNOTgva+Ge84ldDyzVK0rBIZ9fXEeO
         nbBc+aOfdP3QvDD3Kp/OZcDpSOCkVmAXr4+L4soO7mq0T9wfSPj2Sjd84u7VlBXfZQgS
         X34Wh8R590YCZcH+WH5WRSvfBwgB4wNNgqDJX5GbVAlMFBHCDPMWi5D38H/Hl14VMwKL
         kwE3gchHVfOIKdO+f6KE7Yt/QWQTtzVi60G1Blx+gZMUxStCn23bDhfT+rA89VKkgKD1
         iqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4xXCTrfWDL8+bf6C5mY+NMVCUYHVuL12WGreyyd7JIGlDxzXxeG5kW6emx4G4WmezFecaOOAcuYKx4LFfnc5hlim6BdVTQfhXNWXF//n5pFCLmp2vAyS2Umo+ivNjK33gNjFjbTvdqp0LxFGlW5+5wJND2luLPqWvX17VS8mUJ6etYqQktu/N
X-Gm-Message-State: AOJu0YwUhgZ9vtfFpk1TjQ8Pija0rAYWyg1sxDq0tv1WxSHnK7pBAo4V
	/EuoJt6f0qIgl4CrnAAZgG+c3nvNOZ0Zw4y0vuKlgvabX7Qf29jEak/bnw==
X-Google-Smtp-Source: AGHT+IEnH311IUi0N1w5/qDp4oDDKn3sCVfTphy4tUSYELQF2NfNDhivWA8StKMrw6zRw8F/xaDG1w==
X-Received: by 2002:a19:c514:0:b0:52b:863a:59b4 with SMTP id 2adb3069b0e04-52b89597b12mr8717379e87.41.1717487607332;
        Tue, 04 Jun 2024 00:53:27 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d349ccsm1446812e87.59.2024.06.04.00.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:53:26 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:53:16 +0300
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
Subject: [PATCH v3 00/10] Support ROHM BD96801 Scalable PMIC
Message-ID: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8Wbm+x0JfYVLDHZl"
Content-Disposition: inline


--8Wbm+x0JfYVLDHZl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD96801 Scalable PMIC

The ROHM BD96801 is automotive grade PMIC, intended to be usable in
multiple solutions. The BD96801 can be used as a stand-alone, or together
with separate 'companion PMICs'. This modular approach aims to make this
PMIC suitable for various use-cases.

This series brings only limited support. The more complete set of
features was sent in the RFC:
https://lore.kernel.org/lkml/cover.1712058690.git.mazziesaccount@gmail.com/

The BD96801 provides two physical IRQ lines called "intb" and "errb" in
the data-sheet. These are handled using own regmap-IRQ controller for
both of the IRQ lines. This causes a debugFS naming conflict for IRQ
domains created by the regmap-IRQ. This series adds support for setting
a name suffix to IRQ domains. Some prior discussion can be seen here:
https://lore.kernel.org/all/Zjzt8mOW6dO_7XNV@finisterre.sirena.org.uk/

As writing of this there is no known system doing configurations which
require the PMIC to be in STBY state using Linux driver. Furthermore,
ensuring the PMIC is and stays in the STBY state when configurations
are done may not be trivial. Especially, not in a generic way in a
regulator driver. This is likely to be system specific.

Hence it felt natural to upstream only partial support for
now, while leaving a note about the RFC series with more complete
support for those who may need it later.

The patches from 1 to 6 are just typical "add support for device X"
stuff. They should provide very much usable driver for BD96801 and I
hope they don't cause too many questions and can be merged when
quality seems high enough :)

Supporting the ERRB IRQ (patches 9 and 10) requires the regmap IRQ change
(patch 8) which further requires the IRQ domain change (patch 7).

Patches 7 and 8 may need more careful thinking. Thus, the ERRB IRQ
support is added as a separate step, which can be merged later or even
dropped if the irqdomain changes prove to be unacceptable.

Revision history still tries to summarize changes from the RFC for the
reviewers.

Revision history:
v2 =3D> v3: Mostly based on feedback from Thomas Gleixner
	- Added acks from Krzysztof and Mark
	- Rebased on v6.10-rc2
	- Drop name suffix support for legacy IRQ domains (both
	  irqdomain and regmap)
	- Improve the commit message for patch 7/10

v1 =3D> v2:
	- Add support for setting a name suffix for fwnode backed IRQ domains.
	- Add support for setting a domain name suffix for regmap-IRQ.
	- Add handling of ERRB IRQs.
	- Small fixes based on feedback.

RFCv2 =3D> v1:
	- Drop ERRB IRQ from drivers (but not DT bindings).
	- Drop configuration which requires STBY - state.
	- Fix the register lock race by moving it from the regulator
	  driver to the MFD driver.

RFCv1 =3D> RFCv2:
	- Tidying code based on feedback form Krzysztof Kozlowski and
	  Lee Jones.
	- Documented undocumented watchdog related DT properties.
	- Added usage of the watchdog IRQ.
	- Use irq_domain_update_bus_token() to work-around debugFS name
	  collision for IRQ domains.

---

Matti Vaittinen (10):
  dt-bindings: ROHM BD96801 PMIC regulators
  dt-bindings: mfd: bd96801 PMIC core
  mfd: support ROHM BD96801 PMIC core
  regulator: bd96801: ROHM BD96801 PMIC regulators
  watchdog: ROHM BD96801 PMIC WDG driver
  MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
  irqdomain: Allow giving name suffix for domain
  regmap: Allow setting IRQ domain name suffix
  mfd: bd96801: Add ERRB IRQ
  regulator: bd96801: Add ERRB IRQ

 .../bindings/mfd/rohm,bd96801-pmic.yaml       |  173 +++
 .../regulator/rohm,bd96801-regulator.yaml     |   63 ++
 MAINTAINERS                                   |    4 +
 drivers/base/regmap/regmap-irq.c              |   15 +-
 drivers/mfd/Kconfig                           |   13 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/rohm-bd96801.c                    |  488 ++++++++
 drivers/regulator/Kconfig                     |   12 +
 drivers/regulator/Makefile                    |    2 +
 drivers/regulator/bd96801-regulator.c         | 1008 +++++++++++++++++
 drivers/watchdog/Kconfig                      |   13 +
 drivers/watchdog/Makefile                     |    1 +
 drivers/watchdog/bd96801_wdt.c                |  416 +++++++
 include/linux/irqdomain.h                     |   22 +-
 include/linux/mfd/rohm-bd96801.h              |  215 ++++
 include/linux/mfd/rohm-generic.h              |    1 +
 include/linux/regmap.h                        |    4 +
 kernel/irq/irqdomain.c                        |   37 +-
 18 files changed, 2470 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic=
=2Eyaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd9680=
1-regulator.yaml
 create mode 100644 drivers/mfd/rohm-bd96801.c
 create mode 100644 drivers/regulator/bd96801-regulator.c
 create mode 100644 drivers/watchdog/bd96801_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd96801.h


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
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

--8Wbm+x0JfYVLDHZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZex+gACgkQeFA3/03a
ocUn1wf/erxcYmXpX+fABHioLujid99DLNkBH1PlvwM8iUHAmjikFd/aGiMGwmyF
38IAo7Y/692UqR/12D9TimqX2QRZ3VmFhgcowpLlZ58iPDv2BUxMYMtMdJesQTAU
mcV898gn6PTYduHPrJ9tk3Qdq+LFSjEjXqgK5tPnGzWSXrr8aED07KXtDkrOdgt9
x+FmxI8cjebMYHor+fQg7W1y2R2zruABtqbj/ATkQhsM1eEXKV60mAu1IT5Kua6V
Y7aX/zDAB6xRG8wbD3x7/ARHJPkIc12zWUx63IdsHw2Nil1dXaFSEjk1Vkv2evWV
ipi0WHT3YDgwUoi3RxfMK/1EqVg0mg==
=Rug9
-----END PGP SIGNATURE-----

--8Wbm+x0JfYVLDHZl--

