Return-Path: <linux-watchdog+bounces-1066-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA28CE220
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2024 10:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5051B1C209FC
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2024 08:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223F73A29C;
	Fri, 24 May 2024 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T47Vq0D+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0D29AB;
	Fri, 24 May 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716538552; cv=none; b=f91CNIGvtIRUdNiweLKkRLOD0mqEOZ/MJJP8qblI7eN+4YJub/NoaiDr6fyp3/1AaTQDyrsCjilGEcjB/eNgLKjiQY9dwj34FN3OlD+oKT3fvhPBAjOekKxo7Q9kDd7UEOUSg9Ls/YFBuAX8XSpaPJL2mdBlpe0lUYWq5zYGn0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716538552; c=relaxed/simple;
	bh=NVSdw291mmLiAJ6bqsz7gnq3KvYeo461sEBmywJrYdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRjRjtMLlG+WOqrxqhttZ2jX1OXfvzMWzGmoDiX4zIiE+CyAl/9XB41buVFcidVBoXePzsADmJ/rtedTmiqD/TNJXEJQrF5A7bprKTKfIxaibYmROEGu3MuQ/AK656q/Wzhafso76RojoWqRUbb7ApV7qfAF8IuKPWu2szn4Vuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T47Vq0D+; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e73359b900so50718641fa.2;
        Fri, 24 May 2024 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716538548; x=1717143348; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdTxeepdz5HuPjWU/JId/HUujX/N+5d6QRhICs0mfVg=;
        b=T47Vq0D+TboActaDzk2+5+X1/P1bcJDcVvPlMypzJpayOpcG8zY7LbthRuNmkPoYGm
         UMDY+d3cMoOGD/xt8h3rL0WrjV04TNE7Piz64ExL2bznIQMl84qbZgZxUoXdjvyXgPkR
         gNTfFr+L74YhxebpcMJjbjiiigiyZAVi9TJxqPQ5/z7E3SbSDCfBLJp0aztHVROCs9Xy
         m7ZV24PwJb7BFpF2daIUP8Gwu8ZkjF9+CHhWRnPs2VRyAgHHZ4MDJ39T3HyPH0cnVfsL
         nKsDoTurVsiVjanVsut1Kwflw2CAa2wRX0+TZXNVadybjZjafO6HoSg8qgubr5PIVHWB
         Kkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716538548; x=1717143348;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdTxeepdz5HuPjWU/JId/HUujX/N+5d6QRhICs0mfVg=;
        b=KEitoQDKMBXnuOGx4iD/Y8HsDTKcg1e3IFbDnsu+fk9O224euGS8Aj1DLYkb1BNiry
         KvcsNhMNcir1vrR4m3W2u9Bv/eRvcDFkMntwhwiPF3PXhStyoHBNjChCe9aVxhfw58g1
         ioT3YAsalc2IHrm5lheVvm0BEqjbncv06zIoNfYGgDCMRyyHl9H27geuXg663ZBhRel/
         7i3p/+ngfRCWyXE7gfFfiaKmr4ctqGoGw4TsIgIkeiPjpPb/UzKgu3k1OzvoeiVVHffP
         IXAjXfmaLprt3g0PAzLBLBSGROUgEeDAW1PGTN5uUXqqVCHQzpHbkjgov0zMDRd7bLsR
         abvg==
X-Forwarded-Encrypted: i=1; AJvYcCU2fF7lTSlzenog2XBTrk7aWm4wXNjNHSMP5vwUxALSVVEHWGk4ZCg+rtPmiiszTq7Gd/Cg3lIm8jnHeeN1RIvhNQWeddGsCDIoClVxBSTwAI+FyOwtQ2NedCSwFtN+EDnXNfdByJ0eqXiQqGsQ6ZH2k6E42UHrxQYWJRTwabSEZ7wKfHpqLcVo
X-Gm-Message-State: AOJu0Yx4vyhOBg3tmZRjYv0PCNMgoo2pqSko6k58B7My8/FnBUq6Jb1D
	JibNNZch7XToyZpFzWan8AHcHiaViLqB5yZ1xGc/oyCgkB8yIJj/
X-Google-Smtp-Source: AGHT+IFCwUHpHwtf59Vh83JgyLD3Of4whADOZ6bb0zdSaxaNJPJpELuy4HH3O1V0cZaluxb7Ml9ETw==
X-Received: by 2002:a2e:86c5:0:b0:2e0:5b76:9acd with SMTP id 38308e7fff4ca-2e95b1dbf9fmr8659831fa.27.1716538547892;
        Fri, 24 May 2024 01:15:47 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd7bbcsm996851fa.32.2024.05.24.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 01:15:46 -0700 (PDT)
Date: Fri, 24 May 2024 11:15:34 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 00/10] Support ROHM BD96801 Scalable PMIC
Message-ID: <cover.1716533790.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vbVyE5NooxoCxztE"
Content-Disposition: inline


--vbVyE5NooxoCxztE
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
 drivers/base/regmap/regmap-irq.c              |   13 +-
 drivers/mfd/Kconfig                           |   13 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/rohm-bd96801.c                    |  488 ++++++++
 drivers/regulator/Kconfig                     |   12 +
 drivers/regulator/Makefile                    |    2 +
 drivers/regulator/bd96801-regulator.c         | 1008 +++++++++++++++++
 drivers/watchdog/Kconfig                      |   13 +
 drivers/watchdog/Makefile                     |    1 +
 drivers/watchdog/bd96801_wdt.c                |  416 +++++++
 include/linux/irqdomain.h                     |   28 +-
 include/linux/mfd/rohm-bd96801.h              |  215 ++++
 include/linux/mfd/rohm-generic.h              |    1 +
 include/linux/regmap.h                        |    4 +
 kernel/irq/irqdomain.c                        |   53 +-
 18 files changed, 2487 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic=
=2Eyaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd9680=
1-regulator.yaml
 create mode 100644 drivers/mfd/rohm-bd96801.c
 create mode 100644 drivers/regulator/bd96801-regulator.c
 create mode 100644 drivers/watchdog/bd96801_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd96801.h


base-commit: 4cece764965020c22cff7665b18a012006359095
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

--vbVyE5NooxoCxztE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZQTKEACgkQeFA3/03a
ocU7XggAwrpTEUU/Gnn9g9kh8YV0w2RPpn66LCK1/U+q3bwkrOQ91oy+ns5R1ydB
nJxUIl5JX8LZjpc92Rp5qOdssWwApPOMHc2QHdmTyzOHObEfvb1zNBh32cypNnSQ
pQ/eTO3RPxLLTBDZdICXKmiZlsaBclpyNysrvgFu8X3TKaneMUAVPAm8GkagulHx
0je1+m+frhmTrjO804YVLtnSolg1eLedyWdhB5GcrOR4vgXfAh55XmasGX6Jk9UO
/My9JoWZ7fsVTRLFErXouJfZ9GDdSDs9s0PV93nfTu9Htr12i9hZJCWIlkuB07Fp
nqwDTo4y+++12WtMm3GNuYRWYjv4Og==
=J9T+
-----END PGP SIGNATURE-----

--vbVyE5NooxoCxztE--

