Return-Path: <linux-watchdog+bounces-1204-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A691C10F
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 16:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A61ACB218EE
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 14:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9C71C004E;
	Fri, 28 Jun 2024 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzIWXVmc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B581E522;
	Fri, 28 Jun 2024 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585265; cv=none; b=p6vItlEfm3RskuyZMOnXyIFpBZ+GqXFZsMZy85jgmBt8xa7CiQyooij3wgAz16A3TgAHjnyCXlilk9g5uzxPnvgIna9GTkGLdp0NvLrRYlV5BxGCREoP8ykPaggP3GAGm/18N7iWZBoWP8SpsglIF/FIMIAFVO3StyHLAiDmRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585265; c=relaxed/simple;
	bh=M93Nvl53wprdqB1rCgjlA3JH/jyBzpgsj3DjF0i+/Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZenfuvy6Jptjzi3gqTSuDOqqqxrz+ylIl80HiEH0erLaJ1GGKUJ/zPN0zsPQSpBFlCPdLWpP1+ziaIfy/I9g+M4oxtLYy3BtYAfL3N0Y2BCNAZMu3ZrPQPPEi6k44o77G2ngfxyVl0IQ7UOOtb3m48pef6TXL+Z836n5C/ihUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzIWXVmc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0E8C116B1;
	Fri, 28 Jun 2024 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585265;
	bh=M93Nvl53wprdqB1rCgjlA3JH/jyBzpgsj3DjF0i+/Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzIWXVmc2KqAbYAU7z50dq5r2g665ts4K1cpp2jdj1J6YPrDCEB6HMK/GOJNdjRb6
	 9C0DYeiuqZdZMZbuE3RYCXBMjHOLstLaQ3PLpZ8iIFp3iw9EaZDMH2NmH5LaHf+OMQ
	 bTBeSzPmEPVO3z5ecU+9iVdlNzqsVaY1fomUGHeI+VLb3V1HjASRJ2rE+gBacxxmzz
	 goG2+AaLa6/JT8bHF6r8FP0Nw422XgA2LnvkkXua6cACceBw8GLLzGBQCTLrOzUApF
	 rlCy9LaLzIPpX0iIWjk1Ex0uuB4cmttnD/NrS0rxDeOsm4mt6u1du9g+E0v8lCn51o
	 o+slq1Moa5gUQ==
Date: Fri, 28 Jun 2024 15:34:19 +0100
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
Subject: [GIT PULL] Immutable branch between MFD, Regulator and Watchdog due
 for the v6.11 merge window
Message-ID: <20240628143419.GO2532839@google.com>
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

Enjoy!

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-watchdog-v6.11

for you to fetch changes up to fcf1f960a6aa45a22efd4d49114c672ed305b85f:

  MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries (2024-06-27 09:24:45 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Regulator and Watchdog due for the v6.11 merge window

----------------------------------------------------------------
Matti Vaittinen (6):
      dt-bindings: ROHM BD96801 PMIC regulators
      dt-bindings: mfd: bd96801 PMIC core
      mfd: support ROHM BD96801 PMIC core
      regulator: bd96801: ROHM BD96801 PMIC regulators
      watchdog: ROHM BD96801 PMIC WDG driver
      MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries

 .../devicetree/bindings/mfd/rohm,bd96801-pmic.yaml | 173 ++++
 .../bindings/regulator/rohm,bd96801-regulator.yaml |  63 ++
 MAINTAINERS                                        |   4 +
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/rohm-bd96801.c                         | 273 +++++++
 drivers/regulator/Kconfig                          |  12 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/bd96801-regulator.c              | 908 +++++++++++++++++++++
 drivers/watchdog/Kconfig                           |  13 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/bd96801_wdt.c                     | 416 ++++++++++
 include/linux/mfd/rohm-bd96801.h                   | 215 +++++
 include/linux/mfd/rohm-generic.h                   |   1 +
 14 files changed, 2094 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96801-regulator.yaml
 create mode 100644 drivers/mfd/rohm-bd96801.c
 create mode 100644 drivers/regulator/bd96801-regulator.c
 create mode 100644 drivers/watchdog/bd96801_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd96801.h

-- 
Lee Jones [李琼斯]

