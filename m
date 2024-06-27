Return-Path: <linux-watchdog+bounces-1192-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C691A0A3
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 09:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E66151C211BC
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 07:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F76161FCE;
	Thu, 27 Jun 2024 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0SQdhPn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1359374D4;
	Thu, 27 Jun 2024 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474170; cv=none; b=PmgcwEQVScbFCSJsq4GUS0/qgsqFj7CgNcT0ySph7AOODQKpR7cKFCn9W1F3iVKYzZzulhJ4tv8zor+7/SrTR8gbCnweolK7NxvN42lIpE8mr4PI48MzOutWShbQd6S7xltIb9WAluoEdm0+N0poJ0gcUjJs+H7hPy2Ok8CRFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474170; c=relaxed/simple;
	bh=+aYaJeKfwWUFK7GSlzK2t5JQnsS8gzmmHK4bu1Y4nWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ly0xsJDP7HbSMdOdYTNgFdrhiyDEQQZpqnB3UFyvlRqIO0JvC/beCZSD8rsPD7hE21IRIM4V5OAlT8w6eRC10Y/c6iPQ/rUYFbD3M3Eo4goBpOAQOyu0ABUYwRyn8kzu9JKZeGj045CtjTASSdvCmHKRKkOSLsYubTkMwJxj4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0SQdhPn; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so103493541fa.2;
        Thu, 27 Jun 2024 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474166; x=1720078966; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzyiJnZ7aQCZJPaij9547bOK4rGLg+j8o5jTxY/Qu5I=;
        b=M0SQdhPnjDhu25wx6pIfEJcOLaON2NQsILIR51tzgXR/QY0S7SIS0BRK1LSJ9MkvB5
         FF/NWRzI9VHmDnQ4CwCjerncJE7j1nYea1n3oM1cEjjuSWeNvqT9WQFD1nJRLSNnVKqJ
         PlG8VBOh1Ge9gg3g19G2omB7edfxNKTTSlNi6F+DYBsfLDXh8Akd2TY+EYRho83bWy1H
         rYEuRnjDk0WGWXdcU9nCK6pqW6xU4YboRVteplQQN72Ypgw/nL1rYHOBprHDKAlYboe5
         tedgRdgrD22bHu24ibR4BkQ5F8X92Ty0p0XEXkyJv0TNXmbpd2k4X3QACZh+KjHEyIil
         LrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474166; x=1720078966;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzyiJnZ7aQCZJPaij9547bOK4rGLg+j8o5jTxY/Qu5I=;
        b=LJ18Gg3bfC4QgZ/7oz6ltACw5OoY2I4ICAKDoIg8tvO9Jh8JCoDz4xFX8Vmn4Xw/Kp
         IYowf8ImpXTnglt0KY32S1LIAiW0xWtuUBiXH3ijWqigQBmNJhyut1hNhYreWzUEVznd
         Tgxb5uE2Ma2Lz0OvwXzEdTSZl8fOpH8NumOhi4GdCirGwNbSsOigq2x/A3kYrhZ4SaDH
         eIhpQ1ZxrUcYulSgnM+YqhWNHEzZ4FSPrH82Plynt3ktvaY1PMPGTZfeiKXUrZTENt+3
         9/G/vIcEuK8AUQ0pPxQ2fWhy5zMzYXmPZasK7OsQL/CyauH7ILzYBlW8VNjwarkNM0sJ
         ZWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhpLnD01IS2SL/fO1Mm8Rvqu1VEPHL1sPYkupSFS3nHbX1MNnXkzWiR3mtCJ+bvXGgp6nbCCqevdl+GfxTgASg/Vwzjq9SfsHwGy8hrmdkWwL2Z7sGuNcDxkiXKgJ2Z1q1eaXwfUVQW5LodTIOVNqc6svJ3wRqyrxak3MGLEeL3yKLrRRWd9Gg
X-Gm-Message-State: AOJu0YwH0FdzJjBuf+c1W92RX5QcluDagbc8tThyDBaElDz5HHBbNSO4
	s8mp2sFGkQLjHDZf1tJF6Yj9x23EmBqyLO3NzaCaaX/Xs1NyaVpS
X-Google-Smtp-Source: AGHT+IH+GjvCIgWLgMsQlIT9dAtA7mMWQzMchoZbAEPfpQFeI7G7BJ34JtY2D9J95FAtY1dvyrCQbw==
X-Received: by 2002:a2e:9ecd:0:b0:2ec:51b5:27be with SMTP id 38308e7fff4ca-2ec5b2d4619mr100811781fa.12.1719474165777;
        Thu, 27 Jun 2024 00:42:45 -0700 (PDT)
Received: from fedora ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a4bed76sm1457831fa.106.2024.06.27.00.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:42:44 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:42:37 +0300
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
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v5 0/6] Support ROHM BD96801 Scalable PMIC
Message-ID: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="naMxCvaYHuQUKU2V"
Content-Disposition: inline


--naMxCvaYHuQUKU2V
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

The v3: implemented also support for ERRB interrupt and setting a name
suffix to IRQ domains. That work was postponed and will be continued
after some unrelated changes to irqdomain code are completed as
discussed here:
https://lore.kernel.org/all/87plst28yk.ffs@tglx/

Revision history still tries to summarize changes from the RFC for the
reviewers.

Revision history:
v4 =3D> v5:
	- Drop unintended Makefile change from regulator Makefile

v3 =3D> v4:
	- Drop patches 7 to 10 (inclusive) until preparatory irqdomain changes
	   are done.
	- Cleanups as suggested by Lee.
	- Change the regulator subdevice name. (MFD and regulators).
	- Minor styling in MFD driver

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


Matti Vaittinen (6):
  dt-bindings: ROHM BD96801 PMIC regulators
  dt-bindings: mfd: bd96801 PMIC core
  mfd: support ROHM BD96801 PMIC core
  regulator: bd96801: ROHM BD96801 PMIC regulators
  watchdog: ROHM BD96801 PMIC WDG driver
  MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries

 .../bindings/mfd/rohm,bd96801-pmic.yaml       | 173 ++++
 .../regulator/rohm,bd96801-regulator.yaml     |  63 ++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd96801.c                    | 273 ++++++
 drivers/regulator/Kconfig                     |  12 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd96801-regulator.c         | 908 ++++++++++++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd96801_wdt.c                | 416 ++++++++
 include/linux/mfd/rohm-bd96801.h              | 215 +++++
 include/linux/mfd/rohm-generic.h              |   1 +
 14 files changed, 2094 insertions(+)
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

--naMxCvaYHuQUKU2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZ9F+kACgkQeFA3/03a
ocWBsAf/QdlhMUwYBpyafmBY6fG6eGmmEc7uX7uQbX85eva1/Ur06PzQakUS0ZHA
bpFnT7uYImxTXf6374aR8tjg0TxVp5dQbliG9DpU+QYTItxzpuIh0VI6pwPn7Cj5
obL85HPfHpm2b7kpXWJG0QsAaUoiwub9ZQa9c/V9Z+nfTcXl9ColK8MxdhS5iW0A
QCaQ9Z6OMDFC2FDzYBwHOWvPSTgdWGwiJl14ShkkKacFbRww5hEGUH3CKAZ59CO/
jovqN0X8SehQM91kg8s/flGcbivT5ZEvf1xDpIfCF6ncyeY6Vq2JFnPZ4tHqhp4D
Sothg/mPj42Dv7LJ62+r2llLDni8Bg==
=JFFx
-----END PGP SIGNATURE-----

--naMxCvaYHuQUKU2V--

