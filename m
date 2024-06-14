Return-Path: <linux-watchdog+bounces-1126-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF259087BC
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 11:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E1C4B22450
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4505E1922FE;
	Fri, 14 Jun 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbVnHaI9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1518413A;
	Fri, 14 Jun 2024 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358174; cv=none; b=mxgi9qjE6R9ZJo5n060Dq4exVBmtgkSMSLe7O522+MDBkZUVuPDhO9jzF/S3P+xdJT8al29tIk2DgbvcS7PwVHBiwc85gEYJtHNXZ05ZjcZNGsQfjUhS2DnD5UZ+SqTJP1ceo3srhVWQWXux2PJ9y8SKFIxa/AGWGdgogTn83F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358174; c=relaxed/simple;
	bh=czkOTYkZLTIQaApiczrsdIbe9LXXVyIz+FMdRAHJ+Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7FWGzH9H9amzoeRDi2LMRKSQovXsZPhw0W/AlDJlaSAVUVKifl5TBVJWk998Mxo6CMt8ZdYXBayK4tGXm80jxBKiB8SEtYo2iJUGgmHtJiKZVBIk5zupTXpBu7EbzazxH8tvBZG9s0see9eicE87Z/q5tTvclVaR5KEMQwIDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbVnHaI9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so1745425e87.0;
        Fri, 14 Jun 2024 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718358170; x=1718962970; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2iOzSAnOwkGstzhGfNY8EkOug1CltGdGxTCzaoAIQ0=;
        b=QbVnHaI97/ZknHETU5MfyVOwb3rZL3KuqE7UBxkJ5knjJ9JMQwNHi5BQ7Ul1eyrsYa
         EZlnBCyFvciTbQtcb2N0uv2JvIlmHxbjlSU3zhZDWTuVxJ3KFtRwJYHUng+Yze5CzIV7
         MGDCMYlu4TksEiQNFWWPjPiPXHo3vIw+XYR4qA6/gBfI02XqF4NX/ZZsHgj/ovofJlCA
         nZV3i28S8UP31XaYd6Dp2nxxIE7ovqNAh3hYRHHUv1Qm7rct9NLuQ+EI6bm77/fWT5lq
         9du0WRDoYVAEhaArg4vYOodF7pi1rsmHZI3aU7NiVNfTGXQ01krMhqJaXDbEANws8SdG
         Pk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358170; x=1718962970;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2iOzSAnOwkGstzhGfNY8EkOug1CltGdGxTCzaoAIQ0=;
        b=walLIDw+VmD1ofgC54FFALaf7x6BBe5045pNlN5gcOQrRvMaveGMJXxn3mDbb0Wazj
         YbpnFIT2HGZeszyv9oA3Cubx9R/u44VhkT46PXq0GJoUaN8zQmT23+BwOci/Z/p6Wnnb
         +h4b26MTvRY1945i0xkVgrBpBPdpzoS7MLCrFjTsWFaZUrAC4pygZKMN2uhlVY27crle
         vqx5E9HpBBUmPn1tdVNSxhOoUa4VU5YfiQ9e/jvf+Rm6Fp7xbZBM4tLQ/6Um6AtNz/M7
         VUG/kC8hvwpnhZJedT+vy9s8z9EIenFmkubReRl5rnAbyZQdTI70IIa3UmuVjSuSeO+Y
         Daeg==
X-Forwarded-Encrypted: i=1; AJvYcCWNpPxx3Y1I79qpTPpJmcQOEukh1z6ZS8Z8nk/P3ct9grCICIcl3w7iNUGCV7GHE3BRSYdgHuct9D6LTs7Cv+VDO6NTiFtNiNRVxHArculuHLmAka7xkodwXPV4MQ7tFxGi9hJ65d/yNQq3YnTRVAldquf2gvk/OWah+G2B+HALuSOa4uCLXL35
X-Gm-Message-State: AOJu0YzJWtDxeQHJcCAJmIJnLLTIJEdW5gtQL+8wK70H0EUXPRFCcZVA
	ozZIMJOT6HPO5F0GdPhm7xOD5ndx+DRwISUWiLtvWBXMYV16hiSL
X-Google-Smtp-Source: AGHT+IGzfmH4S6WCBjgVdp0NETN5VubedAyIvEhYyV2QfmBM0+tnl6e1Wwf1tSWGIvD2o2CLzJEGMw==
X-Received: by 2002:a05:6512:2346:b0:52c:939a:d70a with SMTP id 2adb3069b0e04-52ca689051fmr829685e87.0.1718358170109;
        Fri, 14 Jun 2024 02:42:50 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287affcsm455573e87.232.2024.06.14.02.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:42:49 -0700 (PDT)
Date: Fri, 14 Jun 2024 12:42:35 +0300
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
Subject: [PATCH v4 0/6] Support ROHM BD96801 Scalable PMIC
Message-ID: <cover.1718356964.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OFgH1s8YHkdjEScU"
Content-Disposition: inline


--OFgH1s8YHkdjEScU
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
 drivers/regulator/Makefile                    |   2 +
 drivers/regulator/bd96801-regulator.c         | 908 ++++++++++++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd96801_wdt.c                | 416 ++++++++
 include/linux/mfd/rohm-bd96801.h              | 215 +++++
 include/linux/mfd/rohm-generic.h              |   1 +
 14 files changed, 2095 insertions(+)
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

--OFgH1s8YHkdjEScU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZsEIYACgkQeFA3/03a
ocX58Af/e4WoONr6xXqNo5iiqJocjHn5lMOCw3ZvjpGsSrlbhc5HCnkw3wUv+hiO
7YUrdyoppjodh+tklX7Unk8Y7GrIJbZuxLDweXYh2KB8ac76sSWfFIV38QXSuuqe
7xlqxBfhYwWTAhXQ409wnk/aoK2pI2u0ppl/MMZsF8TPLyyPDnziV9gKDLXrjlcI
PMGrpnxNKvn2mfB3SqVnMdViPjXon9ynePBLxpA0JLZCFk+Q27z8pwH+Y6i1prbN
vLt/WMQuxNaP6sd5UerCZWvG+FDSNSXkkIOrIQ9EgfhT+bqniBFjOQZqMgsBHisD
rvQWkfbfgt8j1ocCYPR7KY5SEIt6xA==
=TFGg
-----END PGP SIGNATURE-----

--OFgH1s8YHkdjEScU--

