Return-Path: <linux-watchdog+bounces-2492-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E89E0C29
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 20:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BFEEB2F5A0
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 19:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599FF1DE3B5;
	Mon,  2 Dec 2024 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="T8g2mwhh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6750E1DE3A5;
	Mon,  2 Dec 2024 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166009; cv=none; b=OYmVHdirP72VLO7QxrFSaLMYdbHaKWnHaGDYQ/IcqUXNKadwOpvjw8nPNQ8hqaXRZc0cvPjTAINh9PDd1n11QCg5In4yXuJ5vcb++NXKu7PsLQ8OqQ4hdpqFc5ns6kX5Q1Nnxak7NQGFefknrs4/x3FE2ohylUSxiiB76JXmVWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166009; c=relaxed/simple;
	bh=ilTfIwv93oRhUkU8N6lXP9KIAcMA0X5OUfCS9rybPhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sj0BIPjf3tOLn4pPXdYAKkrpekzS5+8uI44sDUbhoFC2kmRLaUDpRQsTbgSoqj9Kmx0RCNaYLkg/zzAPrkaKzShzJleUBP56W/BTQt8bEcygytuWIfRNk4l/yDz7oaAkBHSmQagktmhGtPnlh7YRQbEZLXtTXHt3h5cNm+M0LNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=T8g2mwhh; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id A62B1409FE; Mon,  2 Dec 2024 19:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org A62B1409FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1733163529;
	bh=ilTfIwv93oRhUkU8N6lXP9KIAcMA0X5OUfCS9rybPhE=;
	h=Date:From:To:Cc:Subject:From;
	b=T8g2mwhhkTAb9tyQqs2HmZAt+RSfB7q72lCgmTjXIOY2YUVp937N4wug2vYWmqwt9
	 U8NT+7EpXcigPif/J3qwocl0fylV6nqQadf4UwnAcAkvQ03h9gcyPMyAs7E+Zh8/5P
	 NY0LlIfXHnL/zOBRp5P1ajnAv7P7x6HXYXYzO5LU=
Date: Mon, 2 Dec 2024 19:18:49 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Byoungtae Cho <bt.cho@samsung.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Fabio Estevam <festevam@denx.de>, Harini T <harini.t@amd.com>,
	James Hilliard <james.hilliard1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>, lijuang <quic_lijuang@quicinc.com>,
	Marek Vasut <marex@denx.de>, Nick Chan <towinchenmi@gmail.com>,
	Oleksandr Ocheretnyi <oocheret@cisco.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rosen Penev <rosenp@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Xin Liu <quic_liuxin@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [GIT PULL REQUEST] watchdog - v6.13 release cycle.
Message-ID: <20241202181849.GA5357@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Linus,

Due to work issues, I was too late to sent in this pull request.
Can you consider to still pull this in please?

Please pull following watchdog changes for the v6.13 release cycle.

This series contains:
* Add support for exynosautov920 SoC
* Add support for Airoha EN7851 watchdog
* Add support for MT6735 TOPRGU/WDT
* Delete the cpu5wdt driver
* Always print when registering watchdog fails
* Several other small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.13-rc1

for you to fetch changes up to 4962ee045d8f06638714d801ab0fb72f89c16690:

  watchdog: rti: of: honor timeout-sec property (2024-11-17 11:24:22 +0100)

----------------------------------------------------------------
linux-watchdog 6.13-rc1 tag

----------------------------------------------------------------
Alexander Sverdlin (1):
      watchdog: rti: of: honor timeout-sec property

Animesh Agarwal (1):
      dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property

Byoungtae Cho (2):
      dt-bindings: watchdog: Document ExynosAutoV920 watchdog bindings
      watchdog: s3c2410_wdt: add support for exynosautov920 SoC

Christian Marangi (2):
      dt-bindings: watchdog: airoha: document watchdog for Airoha EN7581
      watchdog: Add support for Airoha EN7851 watchdog

Claudiu Beznea (1):
      watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler

Colin Ian King (1):
      docs: ABI: Fix spelling mistake in pretimeout_avaialable_governors

Fabio Estevam (2):
      watchdog: da9063: Do not use a global variable
      watchdog: da9063: Remove __maybe_unused notations

Harini T (1):
      watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency

James Hilliard (1):
      watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04

Jean Delvare (1):
      watchdog: Delete the cpu5wdt driver

Marek Vasut (1):
      watchdog: stm32_iwdg: Add pretimeout support

Nick Chan (2):
      watchdog: apple: Actually flush writes after requesting watchdog restart
      watchdog: apple: Increase reset delay to 150ms

Oleksandr Ocheretnyi (1):
      iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call

Peter Griffin (1):
      Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"

Rosen Penev (1):
      watchdog: armada_37xx_wdt: remove struct resource

Uwe Kleine-König (2):
      watchdog: ziirave_wdt: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      watchdog: Switch back to struct platform_driver::remove()

Wolfram Sang (9):
      watchdog: always print when registering watchdog fails
      watchdog: da9055_wdt: don't print out if registering watchdog fails
      watchdog: gxp-wdt: don't print out if registering watchdog fails
      watchdog: iTCO_wdt: don't print out if registering watchdog fails
      watchdog: it87_wdt: don't print out if registering watchdog fails
      watchdog: octeon-wdt: don't print out if registering watchdog fails
      watchdog: rti_wdt: don't print out if registering watchdog fails
      watchdog: rza_wdt: don't print out if registering watchdog fails
      watchdog: sl28cpld_wdt: don't print out if registering watchdog fails

Xin Liu (1):
      dt-bindings: watchdog: Document Qualcomm QCS8300

Xingyu Wu (1):
      MAINTAINERS: Update the maintainer of StarFive watchdog driver

Yan Zhen (1):
      watchdog: fix typo in the comment

Yassine Oudjana (2):
      watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
      watchdog: mediatek: Add support for MT6735 TOPRGU/WDT

lijuang (1):
      dt-bindings: watchdog: Document Qualcomm QCS615 watchdog

 Documentation/ABI/testing/sysfs-class-watchdog     |   2 +-
 .../bindings/watchdog/airoha,en7581-wdt.yaml       |  47 ++++
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  |  14 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   2 +
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |   3 +
 Documentation/watchdog/watchdog-parameters.rst     |  10 -
 MAINTAINERS                                        |   2 +-
 drivers/watchdog/Kconfig                           |  17 +-
 drivers/watchdog/Makefile                          |   2 +-
 drivers/watchdog/acquirewdt.c                      |   2 +-
 drivers/watchdog/advantechwdt.c                    |   2 +-
 drivers/watchdog/airoha_wdt.c                      | 216 ++++++++++++++++
 drivers/watchdog/apple_wdt.c                       |   8 +-
 drivers/watchdog/armada_37xx_wdt.c                 |  10 +-
 drivers/watchdog/at91rm9200_wdt.c                  |   2 +-
 drivers/watchdog/at91sam9_wdt.c                    |   2 +-
 drivers/watchdog/ath79_wdt.c                       |   2 +-
 drivers/watchdog/bcm2835_wdt.c                     |   2 +-
 drivers/watchdog/bcm_kona_wdt.c                    |   2 +-
 drivers/watchdog/cpu5wdt.c                         | 284 ---------------------
 drivers/watchdog/cpwd.c                            |   2 +-
 drivers/watchdog/da9055_wdt.c                      |   7 +-
 drivers/watchdog/da9063_wdt.c                      |  19 +-
 drivers/watchdog/dw_wdt.c                          |   2 +-
 drivers/watchdog/gef_wdt.c                         |   2 +-
 drivers/watchdog/geodewdt.c                        |   2 +-
 drivers/watchdog/gxp-wdt.c                         |   4 +-
 drivers/watchdog/iTCO_wdt.c                        |  25 +-
 drivers/watchdog/ib700wdt.c                        |   2 +-
 drivers/watchdog/ie6xx_wdt.c                       |   2 +-
 drivers/watchdog/it87_wdt.c                        |  43 +++-
 drivers/watchdog/lpc18xx_wdt.c                     |   2 +-
 drivers/watchdog/mtk_wdt.c                         |  12 +
 drivers/watchdog/mtx-1_wdt.c                       |   2 +-
 drivers/watchdog/nic7018_wdt.c                     |   2 +-
 drivers/watchdog/nv_tco.c                          |   2 +-
 drivers/watchdog/octeon-wdt-main.c                 |   4 +-
 drivers/watchdog/omap_wdt.c                        |   2 +-
 drivers/watchdog/orion_wdt.c                       |   2 +-
 drivers/watchdog/pcwd.c                            |   2 +-
 drivers/watchdog/rc32434_wdt.c                     |   2 +-
 drivers/watchdog/rdc321x_wdt.c                     |   2 +-
 drivers/watchdog/renesas_wdt.c                     |   2 +-
 drivers/watchdog/riowd.c                           |   2 +-
 drivers/watchdog/rti_wdt.c                         |   9 +-
 drivers/watchdog/rza_wdt.c                         |   7 +-
 drivers/watchdog/rzg2l_wdt.c                       |  20 +-
 drivers/watchdog/rzn1_wdt.c                        |   2 +-
 drivers/watchdog/s3c2410_wdt.c                     |  45 +++-
 drivers/watchdog/sa1100_wdt.c                      |   4 +-
 drivers/watchdog/sch311x_wdt.c                     |   2 +-
 drivers/watchdog/shwdt.c                           |   2 +-
 drivers/watchdog/sl28cpld_wdt.c                    |   4 +-
 drivers/watchdog/smsc37b787_wdt.c                  |   2 +-
 drivers/watchdog/st_lpc_wdt.c                      |   2 +-
 drivers/watchdog/starfive-wdt.c                    |   4 +-
 drivers/watchdog/stm32_iwdg.c                      |  95 ++++++-
 drivers/watchdog/stmp3xxx_rtc_wdt.c                |   2 +-
 drivers/watchdog/txx9wdt.c                         |   2 +-
 drivers/watchdog/watchdog_core.c                   |  26 +-
 drivers/watchdog/xilinx_wwdt.c                     |  75 +++++-
 drivers/watchdog/ziirave_wdt.c                     |   2 +-
 include/linux/mfd/da9063/core.h                    |   1 +
 63 files changed, 661 insertions(+), 424 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
 create mode 100644 drivers/watchdog/airoha_wdt.c
 delete mode 100644 drivers/watchdog/cpu5wdt.c
----------------------------------------------------------------

Kind regards,
Wim.


