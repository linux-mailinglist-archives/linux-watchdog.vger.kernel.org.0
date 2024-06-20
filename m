Return-Path: <linux-watchdog+bounces-1177-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079C910898
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 16:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5250D1C20A6C
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 14:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3E21AD9EC;
	Thu, 20 Jun 2024 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0QTwX57"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9A81ACE9C;
	Thu, 20 Jun 2024 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894345; cv=none; b=mbAdkWFXcSbruoc/Uz02Ub2fM0Mhli2f3rro08W2dVErjshBB/+T0Zy+Z1omcjosC79LmuWsE9zQg0huCS7tGyv6twPkNddASYdm27xT6w1NjNkinmp3k8vFVk87JsicWsbEV1nOdgImjXQMsmYlOfZI5iKpjsddgkfIMaFtQoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894345; c=relaxed/simple;
	bh=05/RUrOTznOicbhTxGt3jINlULbNja3R+ibYExoycxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek649OHPsYNeNIMk+bwqiial/C/zzWzNdxhRcFlNXaxScEP1GaA+qTZSuY3td9rEewQNiIOQRY/vuNDLzxZFqwDwqA6kSVNsD+0gJmj1yLXRp+2mpcuGUsvRNgzGo7SnOBcSivVbC9X07oPlzX3NJw+w3b7y+yDAcpP+WVvaDS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0QTwX57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65107C2BD10;
	Thu, 20 Jun 2024 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718894345;
	bh=05/RUrOTznOicbhTxGt3jINlULbNja3R+ibYExoycxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0QTwX57+Ly3xbKN+gWS+0Jj1L7+hwOMgdXsLjDB2woFCb2QQ5O5MAjOA7zRSlxZ3
	 hXRto68N50fvgVEXeLVXBkTVuHt7ypO/DKbAL5N7FTHwr8UlBZ+YF4m+4awIYnky8M
	 837LPIwneH+N4N9wEi1HJTLBIvOM0JVdoOhuDz05VCyA++iaCm3uB8OeuV1FuVYbBg
	 DBOfTQccappFpK0ov1jgaw8VCCdViW7ZvNXOHHklSW8V3hGvCYbz+zQOK7NvmLAsoX
	 8G1x9ctTOcDKyngaUumZuJv0cVr4ib2hYl+qHVBHCkYOXRhY3o+BTZtLqCHvezrTCF
	 AT0ucvskAZTpQ==
Date: Thu, 20 Jun 2024 15:38:59 +0100
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
Subject: Re: [PATCH v4 0/6] Support ROHM BD96801 Scalable PMIC
Message-ID: <20240620143859.GM3029315@google.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1718356964.git.mazziesaccount@gmail.com>

On Fri, 14 Jun 2024, Matti Vaittinen wrote:

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
> v3 => v4:
>  - Drop patches 7 to 10 (inclusive) until preparatory irqdomain changes
>    are done.
>  - Cleanups as suggested by Lee.
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
>  drivers/regulator/Makefile                    |   2 +
>  drivers/regulator/bd96801-regulator.c         | 908 ++++++++++++++++++
>  drivers/watchdog/Kconfig                      |  13 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/bd96801_wdt.c                | 416 ++++++++
>  include/linux/mfd/rohm-bd96801.h              | 215 +++++
>  include/linux/mfd/rohm-generic.h              |   1 +
>  14 files changed, 2095 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96801-regulator.yaml
>  create mode 100644 drivers/mfd/rohm-bd96801.c
>  create mode 100644 drivers/regulator/bd96801-regulator.c
>  create mode 100644 drivers/watchdog/bd96801_wdt.c
>  create mode 100644 include/linux/mfd/rohm-bd96801.h

allmodconfig and allyesconfig builds fail with:

  make[5]: *** No rule to make target 'drivers/regulator/da903x.o', needed by 'drivers/regulator/built-in.a'.
  make[5]: Target 'drivers/regulator/' not remade because of errors.

-- 
Lee Jones [李琼斯]

