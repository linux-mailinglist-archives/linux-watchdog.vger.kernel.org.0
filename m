Return-Path: <linux-watchdog+bounces-1199-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC591A15C
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 10:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17721C21CB8
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 08:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4212178C60;
	Thu, 27 Jun 2024 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVG1apyv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391750285;
	Thu, 27 Jun 2024 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719476761; cv=none; b=bw2pzo+hK8eL2FpIqHylgo7GIlDh6wfx3RGaTyuW7jMS5qBOCbBmQovnbnFTS58X3TYgpI/mDRtF0Qii6dD9C/uumFnklahJWWgSSs7bUPcjWonYtjQ53jczacEFke4W76K+Ae6PZ3N89KuLc+K395ZHcYvDRmQI2PH4mVhWUVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719476761; c=relaxed/simple;
	bh=tyRWnrE1fa5NtRnSuPCKd87wxhWzS76tHz0gF9ThlcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSFiRsq2WPnGJsgZWqqLEg87XOq/ZtsQLlc1E1fvt8SCwdUvFo2rCbGtkzdNNnKSLZXXhCIiyGv5GD2ChEEUznNXj2NQ5ZAQ+3Fbg7FVMQQJrXnhcW6lXa0uESKPfmBtV04jIjeBLpOXTg+kQL8H5Tv79vw+6hqvVCkPPUNNJUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVG1apyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8396C2BBFC;
	Thu, 27 Jun 2024 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719476760;
	bh=tyRWnrE1fa5NtRnSuPCKd87wxhWzS76tHz0gF9ThlcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVG1apyvIO3GqBc0CIMXk3H4Cg2mJ2JSjpnpnI9Y6i9DTFFo4DrdzDiWveRFEwx8I
	 RaqsgI/m/0FxLQRCpDLiAMIJ8Ij5aSQOEudplU7JoOD1v14LtFSEYdXKUVu/xTLIuq
	 Tir9zGG55Kai4CJuellwXZlFbnHkYqFUh4NqLsxLnKq7kgNbE1DQY3T3tlFW29h2kP
	 TJJBkH5hXCAQQ1dAxCa+RIQ8AMQsmNxMa77lB7RXWH129yrwz0PeCEE6ScXfK1g1Ut
	 Jd6aaFsWTAw0uADnGJlADR8WvmY55ohQhpX4XRBYZXOrrJ8kYpBsVAJusmcqEPsXV9
	 LQlRNlUuIkmnw==
Date: Thu, 27 Jun 2024 09:25:55 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 0/6] Support ROHM BD96801 Scalable PMIC
Message-ID: <20240627082555.GH2532839@google.com>
References: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1719473802.git.mazziesaccount@gmail.com>

On Thu, 27 Jun 2024, Matti Vaittinen wrote:

> Support ROHM BD96801 Scalable PMIC
> 
> The ROHM BD96801 is automotive grade PMIC, intended to be usable in
> multiple solutions. The BD96801 can be used as a stand-alone, or together
> with separate 'companion PMICs'. This modular approach aims to make this
> PMIC suitable for various use-cases.
> 
> This series brings only limited support. The more complete set of
> features was sent in the RFC:
> https://lore.kernel.org/lkml/cover.1712058690.git.mazziesaccount@gmail.com/
> 
> The v3: implemented also support for ERRB interrupt and setting a name
> suffix to IRQ domains. That work was postponed and will be continued
> after some unrelated changes to irqdomain code are completed as
> discussed here:
> https://lore.kernel.org/all/87plst28yk.ffs@tglx/
> 
> Revision history still tries to summarize changes from the RFC for the
> reviewers.
> 
> Revision history:
> v4 => v5:
> 	- Drop unintended Makefile change from regulator Makefile
> 
> v3 => v4:
> 	- Drop patches 7 to 10 (inclusive) until preparatory irqdomain changes
> 	   are done.
> 	- Cleanups as suggested by Lee.
> 	- Change the regulator subdevice name. (MFD and regulators).
> 	- Minor styling in MFD driver
> 
> v2 => v3: Mostly based on feedback from Thomas Gleixner
> 	- Added acks from Krzysztof and Mark
> 	- Rebased on v6.10-rc2
> 	- Drop name suffix support for legacy IRQ domains (both
> 	  irqdomain and regmap)
> 	- Improve the commit message for patch 7/10
> 
> v1 => v2:
> 	- Add support for setting a name suffix for fwnode backed IRQ domains.
> 	- Add support for setting a domain name suffix for regmap-IRQ.
> 	- Add handling of ERRB IRQs.
> 	- Small fixes based on feedback.
> 
> RFCv2 => v1:
> 	- Drop ERRB IRQ from drivers (but not DT bindings).
> 	- Drop configuration which requires STBY - state.
> 	- Fix the register lock race by moving it from the regulator
> 	  driver to the MFD driver.
> 
> RFCv1 => RFCv2:
> 	- Tidying code based on feedback form Krzysztof Kozlowski and
> 	  Lee Jones.
> 	- Documented undocumented watchdog related DT properties.
> 	- Added usage of the watchdog IRQ.
> 	- Use irq_domain_update_bus_token() to work-around debugFS name
> 	  collision for IRQ domains.
> 
> ---
> 
> 
> Matti Vaittinen (6):
>   dt-bindings: ROHM BD96801 PMIC regulators
>   dt-bindings: mfd: bd96801 PMIC core
>   mfd: support ROHM BD96801 PMIC core
>   regulator: bd96801: ROHM BD96801 PMIC regulators
>   watchdog: ROHM BD96801 PMIC WDG driver
>   MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
> 
>  .../bindings/mfd/rohm,bd96801-pmic.yaml       | 173 ++++
>  .../regulator/rohm,bd96801-regulator.yaml     |  63 ++
>  MAINTAINERS                                   |   4 +
>  drivers/mfd/Kconfig                           |  13 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/rohm-bd96801.c                    | 273 ++++++
>  drivers/regulator/Kconfig                     |  12 +
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/bd96801-regulator.c         | 908 ++++++++++++++++++
>  drivers/watchdog/Kconfig                      |  13 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/bd96801_wdt.c                | 416 ++++++++
>  include/linux/mfd/rohm-bd96801.h              | 215 +++++
>  include/linux/mfd/rohm-generic.h              |   1 +
>  14 files changed, 2094 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96801-regulator.yaml
>  create mode 100644 drivers/mfd/rohm-bd96801.c
>  create mode 100644 drivers/regulator/bd96801-regulator.c
>  create mode 100644 drivers/watchdog/bd96801_wdt.c
>  create mode 100644 include/linux/mfd/rohm-bd96801.h

Applied and submitted for build testing.

If all is good, I'll follow-up with a PR for the other maintainers.

Note to self: ib-mfd-regulator-watchdog-6.11

-- 
Lee Jones [李琼斯]

