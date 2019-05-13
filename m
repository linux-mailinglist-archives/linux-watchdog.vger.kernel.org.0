Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781F21B4DC
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 May 2019 13:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfEMLX2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 May 2019 07:23:28 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:48532 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfEMLXZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 May 2019 07:23:25 -0400
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 5C91A40861; Mon, 13 May 2019 12:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 5C91A40861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1557744535;
        bh=WFkdS7v1qSayZYhqpWcn588hGt4uwwz7kCXesfQ271g=;
        h=Date:From:To:Cc:Subject:From;
        b=AY3aJc587HK0sp9XnNK7f/QXiNQKYEItyLXXRexTIrTuxs1QH0ZVNIUCEVkImVHB6
         wxMhT9sljpO5dscW27pQvdOOnxgpXb2C6RlodijqVkBhtotyz3S7eh9EBarrGrpI6G
         urIkATignp9EBvnkEddBmUgy3yI89MQnUhaf7LkI=
Date:   Mon, 13 May 2019 12:48:55 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Bryan Tan <bryantan@vmware.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Colin Ian King <colin.king@canonical.com>,
        Hofmann <georg@hofmannsweb.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        Ji-Ze Hong <hpeter@gmail.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Matteo Croce <mcroce@redhat.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [GIT PULL REQUEST] watchdog - v5.2 Merge window
Message-ID: <20190513104855.GA5837@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.2 release cycle.

This series contains:
* a new watchdog driver for the ROHM BD70528 watchdog block
* a new watchdog driver for the i.MX system controller watchdog
* Conversions to use device managed functions and other improvements
* refactor watchdog_init_timeout
* Make watchdog core configurable as module
* pretimeout governors improvements
* a lott of other fixes

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 6203838dec05352bc357625b1e9ba0a10d3bca35:

  Merge tag 'powerpc-5.1-7' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2019-05-04 12:24:05 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.2-rc1

for you to fetch changes up to a9f0bda567e32a2b44165b067adfc4a4f56d1815:

  watchdog: Enforce that at least one pretimeout governor is enabled (2019-05-08 10:33:59 +0200)

----------------------------------------------------------------
linux-watchdog 5.2-rc1 tag

----------------------------------------------------------------
Alexandre Belloni (1):
      watchdog: pnx4008: readout watchdog state

Anson Huang (3):
      dt-bindings: watchdog: add i.MX system controller watchdog
      watchdog: imx_sc: Add i.MX system controller watchdog support
      watchdog: imx2_wdt: use devm_platform_ioremap_resource() to simplify code

Bryan Tan (1):
      watchdog: wdat_wdt: fix get_timeleft call for wdat_wdt

Chris Packham (1):
      watchdog: orion_wdt: remove orion_wdt_set_timeout

Colin Ian King (1):
      watchdog: intel_scu_watchdog: fix spelling mistake: "set_hearbeat" -> "set_heartbeat"

Georg Hofmann (1):
      watchdog: imx2_wdt: Fix set_timeout for big timeout values

Guenter Roeck (75):
      watchdog: Convert to use devm_platform_ioremap_resource
      watchdog: rtd119x_wdt: Fix remove function
      watchdog: armada_37xx_wdt: Convert to use device managed functions and other improvements
      watchdog: asm9260_wdt: Convert to use device managed functions and other improvements
      watchdog: aspeed_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: atlas7_wdt: Convert to use device managed functions and other improvements
      watchdog: bcm2835_wdt: drop platform_set_drvdata
      watchdog: bcm7038_wdt: Convert to use device managed functions and other improvements
      watchdog: bcm_kona_wdt: Convert to use device managed functions and other improvements
      watchdog: cadence_wdt: Convert to use device managed functions and other improvements
      watchdog: da9052_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: da9055_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: da9062_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: da9063_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: davinci_wdt: Convert to use device managed functions and other improvements
      watchdog: ep93xx_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: ftwdt010_wdt: Use 'dev' consistently
      watchdog: gpio_wdt: Convert to use device managed functions and other improvements
      watchdog: iTCO_wdt: Various improvements
      watchdog: imgpdc_wdt: Convert to use device managed functions and other improvements
      watchdog: intel-mid_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: kempld_wdt: Convert to use device managed functions and other improvements
      watchdog: lpc18xx_wdt: Convert to use device managed functions and other improvements
      watchdog: max63xx_wdt: Convert to use device managed functions and other improvements
      watchdog: max77620_wdt: Convert to use device managed functions and other improvements
      watchdog: mena21_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: menf21bmc_wdt: Convert to use device managed functions and other improvements
      watchdog: meson_gxbb_wdt: Convert to use device managed functions and other improvements
      watchdog: meson_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: mlx_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: moxart_wdt: Convert to use device managed functions and other improvements
      watchdog: mtk_wdt: Convert to use device managed functions and other improvements
      watchdog: npcm_wdt: Use local variable 'dev' consistently
      watchdog: of_xilinx_wdt: Convert to use device managed functions and other improvements
      watchdog: pm8916_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: qcom-wdt: Convert to use device managed functions and other improvements
      watchdog: rn5t618_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: rtd119x_wdt: Convert to use device managed functions and other improvements
      watchdog: rza_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: sama5d4_wdt: Convert to use device managed functions and other improvements
      watchdog: sirfsoc_wdt: Convert to use device managed functions and other improvements
      watchdog: sprd_wdt: Convert to use device managed functions and other improvements
      watchdog: st_lpc_wdt: Convert to use device managed functions
      watchdog: stmp3xxx_rtc_wdt: Convert to use device managed functions
      watchdog: stpmic1_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: sunxi_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: tangox_wdt: Convert to use device managed functions and other improvements
      watchdog: tegra_wdt: Use watchdog_stop_on_unregister and other improvements
      watchdog: tqmx86_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: ts4800_wdt: Convert to use device managed functions and other improvements
      watchdog: ts72xx_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: twl4030_wdt: Convert to use device managed functions and other improvements
      watchdog: uniphier_wdt: drop platform_set_drvdata
      watchdog: wdat_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: wm831x_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: xen_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: imx_sc_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: sbsa_gwdt: Convert to use device managed functions and other improvements
      watchdog: zx2967_wdt: Convert to use device managed functions and other improvements
      watchdog: stm32_iwdg: Convert to use device managed functions and other improvements
      watchdog: ux500_wdt: Convert to use device managed functions and other improvements
      watchdog: pic32-dmt: Convert to use device managed functions and other improvements
      watchdog: pic32-wdt: Convert to use device managed functions and other improvements
      watchdog: loongson1_wdt: Convert to use device managed functions and other improvements
      watchdog: mt7621_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: rt2880_wdt: Convert to use device managed functions and other improvements
      watchdog: jz4740_wdt: Use 'dev' instead of dereferencing it repeatedly
      watchdog: mpc8xxx_wdt: Convert to use device managed functions and other improvements
      watchdog: pnx4008_wdt: Convert to use device managed functions and other improvements
      watchdog: Use depends instead of select for pretimeout governors
      watchdog: Move pretimeout governor configuration up
      watchdog: Make watchdog core configurable as module
      watchdog: npcm: Enable modular builds
      watchdog: Improve Kconfig entry ordering and dependencies
      watchdog: Enforce that at least one pretimeout governor is enabled

Gustavo A. R. Silva (2):
      watchdog: alim7101: Mark expected switch fall-through
      watchdog: machzwd: Mark expected switch fall-through

Hariprasad Kelam (1):
      watchdog: machzwd : fix warning Using plain integer as NULL pointer

Ji-Ze Hong (Peter Hong) (2):
      watchdog: f71808e_wdt: separate declaration and assignment
      watchdog: f71808e_wdt: fix F81866 bit operation

Ludovic Barre (1):
      watchdog: stm32: add dynamic prescaler support

Matteo Croce (1):
      watchdog: i6300esb: stop printing kernel addresses

Matti Vaittinen (1):
      watchdog: bd70528: Initial support for ROHM BD70528 watchdog block

Paul Gortmaker (3):
      watchdog: coh901327: make it explicitly non-modular
      watchdog: intel_scu: make it explicitly non-modular
      watchdog: rtd119x: drop unused module.h include

Vladimir Zapolskiy (1):
      watchdog: fix compile time error of pretimeout governors

Wolfram Sang (18):
      watchdog: da9063_wdt: parse DT for timeout value, too
      watchdog: renesas_wdt: drop superfluous glob pattern
      watchdog: refactor watchdog_init_timeout
      watchdog: add error messages when initializing timeout fails
      watchdog: cadence_wdt: drop warning after calling watchdog_init_timeout
      watchdog: cadence_wdt: still probe if user supplied timeout is invalid
      watchdog: ebc-c384_wdt: drop warning after calling watchdog_init_timeout
      watchdog: hpwdt: drop warning after calling watchdog_init_timeout
      watchdog: i6300esb: drop warning after calling watchdog_init_timeout
      watchdog: imx_sc_wdt: drop warning after calling watchdog_init_timeout
      watchdog: ni903x_wdt: drop warning after calling watchdog_init_timeout
      watchdog: nic7018_wdt: drop warning after calling watchdog_init_timeout
      watchdog: renesas_wdt: drop warning after calling watchdog_init_timeout
      watchdog: sp5100_tco: drop warning after calling watchdog_init_timeout
      watchdog: st_lpc_wdt: drop warning after calling watchdog_init_timeout
      watchdog: stm32_iwdg: drop warning after calling watchdog_init_timeout
      watchdog: xen_wdt: drop warning after calling watchdog_init_timeout
      watchdog: ziirave_wdt: drop warning after calling watchdog_init_timeout

YueHaibing (1):
      watchdog: sb_wdog: Make sbwdog_set and sbwdog_pet static

 .../bindings/watchdog/fsl-imx-sc-wdt.txt           |  24 ++
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |   1 +
 drivers/watchdog/Kconfig                           | 161 +++++++-----
 drivers/watchdog/Makefile                          |   2 +
 drivers/watchdog/alim7101_wdt.c                    |   2 +-
 drivers/watchdog/armada_37xx_wdt.c                 |  43 +--
 drivers/watchdog/asm9260_wdt.c                     |  77 +++---
 drivers/watchdog/aspeed_wdt.c                      |  25 +-
 drivers/watchdog/at91sam9_wdt.c                    |   4 +-
 drivers/watchdog/ath79_wdt.c                       |   4 +-
 drivers/watchdog/atlas7_wdt.c                      |  65 ++---
 drivers/watchdog/bcm2835_wdt.c                     |   1 -
 drivers/watchdog/bcm7038_wdt.c                     |  42 +--
 drivers/watchdog/bcm_kona_wdt.c                    |  18 +-
 drivers/watchdog/bd70528_wdt.c                     | 290 +++++++++++++++++++++
 drivers/watchdog/cadence_wdt.c                     |  90 ++-----
 drivers/watchdog/coh901327_wdt.c                   |  28 +-
 drivers/watchdog/da9052_wdt.c                      |  13 +-
 drivers/watchdog/da9055_wdt.c                      |  12 +-
 drivers/watchdog/da9062_wdt.c                      |  20 +-
 drivers/watchdog/da9063_wdt.c                      |  21 +-
 drivers/watchdog/davinci_wdt.c                     |  45 ++--
 drivers/watchdog/digicolor_wdt.c                   |   4 +-
 drivers/watchdog/dw_wdt.c                          |   4 +-
 drivers/watchdog/ebc-c384_wdt.c                    |   5 +-
 drivers/watchdog/ep93xx_wdt.c                      |  17 +-
 drivers/watchdog/f71808e_wdt.c                     |  18 +-
 drivers/watchdog/ftwdt010_wdt.c                    |   6 +-
 drivers/watchdog/gpio_wdt.c                        |  16 +-
 drivers/watchdog/hpwdt.c                           |   3 +-
 drivers/watchdog/i6300esb.c                        |   9 +-
 drivers/watchdog/iTCO_wdt.c                        |  13 +-
 drivers/watchdog/imgpdc_wdt.c                      |  95 +++----
 drivers/watchdog/imx2_wdt.c                        |   8 +-
 drivers/watchdog/imx_sc_wdt.c                      | 175 +++++++++++++
 drivers/watchdog/intel-mid_wdt.c                   |  22 +-
 drivers/watchdog/intel_scu_watchdog.c              |  20 +-
 drivers/watchdog/jz4740_wdt.c                      |  17 +-
 drivers/watchdog/kempld_wdt.c                      |  28 +-
 drivers/watchdog/lantiq_wdt.c                      |   4 +-
 drivers/watchdog/loongson1_wdt.c                   |  52 ++--
 drivers/watchdog/lpc18xx_wdt.c                     |  47 ++--
 drivers/watchdog/machzwd.c                         |   3 +-
 drivers/watchdog/max63xx_wdt.c                     |  24 +-
 drivers/watchdog/max77620_wdt.c                    |  23 +-
 drivers/watchdog/mena21_wdt.c                      |  28 +-
 drivers/watchdog/menf21bmc_wdt.c                   |  33 +--
 drivers/watchdog/meson_gxbb_wdt.c                  |  49 ++--
 drivers/watchdog/meson_wdt.c                       |  19 +-
 drivers/watchdog/mlx_wdt.c                         |  14 +-
 drivers/watchdog/moxart_wdt.c                      |  20 +-
 drivers/watchdog/mpc8xxx_wdt.c                     |  20 +-
 drivers/watchdog/mt7621_wdt.c                      |  12 +-
 drivers/watchdog/mtk_wdt.c                         |  37 +--
 drivers/watchdog/ni903x_wdt.c                      |   4 +-
 drivers/watchdog/nic7018_wdt.c                     |   5 +-
 drivers/watchdog/npcm_wdt.c                        |  10 +-
 drivers/watchdog/nuc900_wdt.c                      |   4 +-
 drivers/watchdog/of_xilinx_wdt.c                   |  62 ++---
 drivers/watchdog/omap_wdt.c                        |   4 +-
 drivers/watchdog/orion_wdt.c                       |  14 +-
 drivers/watchdog/pic32-dmt.c                       |  50 ++--
 drivers/watchdog/pic32-wdt.c                       |  62 ++---
 drivers/watchdog/pm8916_wdt.c                      |  21 +-
 drivers/watchdog/pnx4008_wdt.c                     |  45 ++--
 drivers/watchdog/qcom-wdt.c                        |  55 ++--
 drivers/watchdog/renesas_wdt.c                     |   9 +-
 drivers/watchdog/rn5t618_wdt.c                     |   9 +-
 drivers/watchdog/rt2880_wdt.c                      |  32 +--
 drivers/watchdog/rtd119x_wdt.c                     |  47 ++--
 drivers/watchdog/rza_wdt.c                         |  25 +-
 drivers/watchdog/s3c2410_wdt.c                     |   4 +-
 drivers/watchdog/sama5d4_wdt.c                     |  39 +--
 drivers/watchdog/sb_wdog.c                         |   4 +-
 drivers/watchdog/sbsa_gwdt.c                       |  28 +-
 drivers/watchdog/shwdt.c                           |   4 +-
 drivers/watchdog/sirfsoc_wdt.c                     |  28 +-
 drivers/watchdog/sp5100_tco.c                      |   4 +-
 drivers/watchdog/sprd_wdt.c                        |  42 ++-
 drivers/watchdog/st_lpc_wdt.c                      |  53 ++--
 drivers/watchdog/stm32_iwdg.c                      | 150 +++++------
 drivers/watchdog/stmp3xxx_rtc_wdt.c                |  16 +-
 drivers/watchdog/stpmic1_wdt.c                     |  13 +-
 drivers/watchdog/sunxi_wdt.c                       |  19 +-
 drivers/watchdog/tangox_wdt.c                      |  41 ++-
 drivers/watchdog/tegra_wdt.c                       |  30 +--
 drivers/watchdog/tqmx86_wdt.c                      |  14 +-
 drivers/watchdog/ts4800_wdt.c                      |  33 +--
 drivers/watchdog/ts72xx_wdt.c                      |  18 +-
 drivers/watchdog/twl4030_wdt.c                     |  22 +-
 drivers/watchdog/txx9wdt.c                         |   4 +-
 drivers/watchdog/uniphier_wdt.c                    |   2 -
 drivers/watchdog/ux500_wdt.c                       |  17 +-
 drivers/watchdog/watchdog_core.c                   |  42 ++-
 drivers/watchdog/wdat_wdt.c                        |  29 ++-
 drivers/watchdog/wm831x_wdt.c                      |  19 +-
 drivers/watchdog/xen_wdt.c                         |  18 +-
 drivers/watchdog/ziirave_wdt.c                     |   6 +-
 drivers/watchdog/zx2967_wdt.c                      |  37 +--
 99 files changed, 1490 insertions(+), 1537 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
 create mode 100644 drivers/watchdog/bd70528_wdt.c
 create mode 100644 drivers/watchdog/imx_sc_wdt.c

----------------------------------------------------------------

Kind regards,
Wim.

