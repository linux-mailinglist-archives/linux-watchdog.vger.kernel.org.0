Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536E86C237
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jul 2019 22:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfGQUgh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Jul 2019 16:36:37 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:38490 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfGQUgh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Jul 2019 16:36:37 -0400
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 244FB4095E; Wed, 17 Jul 2019 21:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 244FB4095E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1563393509;
        bh=iKxcO+1p2J0b9cU8Eqh3XVt9fxA1J24Ufjda3Mh2hQA=;
        h=Date:From:To:Cc:Subject:From;
        b=hu+EC6WZPrGEX4heX+jkjdK1h7P3/ZmQmMHlWo5/pTVBfC2aS6Vx9R/19HXJtOvJe
         itMWrQahrtkP5tn+WIATIISriit2yt+S41DyXnaDD9r5cJ1UbKIEkIr49JTHBgiTa+
         vRYBfl3QiTkLMVzZSHOj/gXOrr+PFpgDqJRH871g=
Date:   Wed, 17 Jul 2019 21:58:28 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Ken Sloat <ksloat@aampglobal.com>,
        Mans Rullgard <mans@mansr.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stefan Wahren <wahrenst@gmx.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [GIT PULL REQUEST] watchdog - v5.3 Merge window
Message-ID: <20190717195828.GA25283@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.3 release cycle.

This series contains:
* add Allwinner H6 watchdog
* drop warning after registering device patches
* hpwdt improvements
* gpio: add support for nowayout option
* introduce CONFIG_WATCHDOG_OPEN_TIMEOUT
* convert remaining drivers to use SPDX license identifier
* Fixes and improvements on several watchdog device drivers

Stephen resolved the following 2 conflicts in linux-next:
1) Documentation/watchdog/hpwdt.rst
Documentation/watchdog/watchdog-parameters.rst

between commit: cc2a2d19f896 ("docs: watchdog: convert docs to ReST and rename to *.rst") from the jc_docs tree 
and commit: 74665686f0e2 ("docs: watchdog: convert docs to ReST and rename to *.rst") from the watchdog tree.
These are the same patch with only a coouple of differences.

2) Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt

between commit: 8c21ead3ea5d ("dt-bindings: watchdog: move i.MX system controller watchdog binding to SCU") from the watchdog tree 
and commit: c2a6ea23a401 ("dt-bindings: fsl: scu: add ocotp binding") from the char-misc tree.


The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 46713c3d2f8da5e3d8ddd2249bcb1d9974fb5d28:

  Merge tag 'for-linus-20190706' of git://git.kernel.dk/linux-block (2019-07-06 11:48:39 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.3-rc1

for you to fetch changes up to 7fb832ae72949c883da52d6316ff08f03c75d300:

  watchdog: digicolor_wdt: Remove unused variable in dc_wdt_probe (2019-07-15 08:49:11 +0200)

----------------------------------------------------------------
linux-watchdog 5.3-rc1 tag

----------------------------------------------------------------
Anson Huang (2):
      watchdog: imx_sc: Add pretimeout support
      dt-bindings: watchdog: move i.MX system controller watchdog binding to SCU

Clément Péron (1):
      dt-bindings: watchdog: add Allwinner H6 watchdog

Eugen Hristev (1):
      watchdog: sama5d4: fix WDD value to be always set to max

Greg Kroah-Hartman (2):
      watchdog: bcm_kona_wdt: no need to check return value of debugfs_create functions
      watchdog: mei_wdt: no need to check return value of debugfs_create functions

Guenter Roeck (1):
      watchdog: convert remaining drivers to use SPDX license identifier

Hoan Nguyen An (1):
      watchdog: renesas_wdt: Use 'dev' instead of dereferencing it repeatedly

Jerry Hoemann (7):
      watchdog/hpwdt: Stop hpwdt on unregister.
      watchdog/hpwdt: Advertize max_hw_heartbeat_ms
      watchdog/hpwdt: Have core ping watchdog.
      watchdog/hpwdt: Add module parameter kdumptimeout.
      watchdog/hpwdt: Update documentation
      watchdog/hpwdt: Reflect changes
      docs: watchdog: Fix build error.

Ken Sloat (1):
      watchdog: atmel: atmel-sama5d4-wdt: Disable watchdog on system suspend

Mans Rullgard (1):
      watchdog: gpio: add support for nowayout option

Mauro Carvalho Chehab (1):
      docs: watchdog: convert docs to ReST and rename to *.rst

Nathan Chancellor (1):
      watchdog: digicolor_wdt: Remove unused variable in dc_wdt_probe

Paul Cercueil (2):
      watchdog: jz4740: Use register names from <linux/mfd/ingenic-tcu.h>
      watchdog: jz4740: Avoid starting watchdog in set_timeout

Rasmus Villemoes (3):
      watchdog: introduce watchdog.open_timeout commandline parameter
      watchdog: introduce CONFIG_WATCHDOG_OPEN_TIMEOUT
      watchdog: make the device time out at open_deadline when open_timeout is used

Sebastian Andrzej Siewior (1):
      watchdog: ie6xx_wdt: Use spinlock_t instead of struct spinlock

Simon Horman (1):
      dt-bindings: watchdog: Rename bindings documentation file

Stefan Wahren (1):
      watchdog: bcm2835_wdt: Fix module autoload

Wolfram Sang (46):
      watchdog: make watchdog_deferred_registration_add() void
      watchdog: let core print error message when registering device fails
      watchdog: aspeed_wdt: drop warning after registering device
      watchdog: bcm2835_wdt: drop warning after registering device
      watchdog: bcm7038_wdt: drop warning after registering device
      watchdog: bcm_kona_wdt: drop warning after registering device
      watchdog: cadence_wdt: drop warning after registering device
      watchdog: da9052_wdt: drop warning after registering device
      watchdog: da9062_wdt: drop warning after registering device
      watchdog: davinci_wdt: drop warning after registering device
      watchdog: digicolor_wdt: drop warning after registering device
      watchdog: ftwdt010_wdt: drop warning after registering device
      watchdog: hpwdt: drop warning after registering device
      watchdog: i6300esb: drop warning after registering device
      watchdog: ie6xx_wdt: drop warning after registering device
      watchdog: imx2_wdt: drop warning after registering device
      watchdog: imx_sc_wdt: drop warning after registering device
      watchdog: intel-mid_wdt: drop warning after registering device
      watchdog: jz4740_wdt: drop warning after registering device
      watchdog: loongson1_wdt: drop warning after registering device
      watchdog: max77620_wdt: drop warning after registering device
      watchdog: mei_wdt: drop warning after registering device
      watchdog: mena21_wdt: drop warning after registering device
      watchdog: menf21bmc_wdt: drop warning after registering device
      watchdog: mpc8xxx_wdt: drop warning after registering device
      watchdog: ni903x_wdt: drop warning after registering device
      watchdog: nic7018_wdt: drop warning after registering device
      watchdog: npcm_wdt: drop warning after registering device
      watchdog: of_xilinx_wdt: drop warning after registering device
      watchdog: pic32-dmt: drop warning after registering device
      watchdog: pic32-wdt: drop warning after registering device
      watchdog: pnx4008_wdt: drop warning after registering device
      watchdog: qcom-wdt: drop warning after registering device
      watchdog: rave-sp-wdt: drop warning after registering device
      watchdog: s3c2410_wdt: drop warning after registering device
      watchdog: sama5d4_wdt: drop warning after registering device
      watchdog: sp5100_tco: drop warning after registering device
      watchdog: sp805_wdt: drop warning after registering device
      watchdog: sprd_wdt: drop warning after registering device
      watchdog: st_lpc_wdt: drop warning after registering device
      watchdog: stm32_iwdg: drop warning after registering device
      watchdog: stmp3xxx_rtc_wdt: drop warning after registering device
      watchdog: tegra_wdt: drop warning after registering device
      watchdog: ts4800_wdt: drop warning after registering device
      watchdog: wm831x_wdt: drop warning after registering device
      watchdog: xen_wdt: drop warning after registering device

Yoshihiro Shimoda (1):
      watchdog: renesas_wdt: Add a few cycles delay

 Documentation/admin-guide/kernel-parameters.txt    |   2 +-
 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  15 +
 .../bindings/watchdog/fsl-imx-sc-wdt.txt           |  24 -
 .../watchdog/{renesas-wdt.txt => renesas,wdt.txt}  |   0
 .../devicetree/bindings/watchdog/sunxi-wdt.txt     |   1 +
 Documentation/kernel-per-CPU-kthreads.txt          |   2 +-
 ...l_api.txt => convert_drivers_to_kernel_api.rst} | 109 +--
 Documentation/watchdog/{hpwdt.txt => hpwdt.rst}    |  29 +-
 Documentation/watchdog/index.rst                   |  25 +
 .../watchdog/{mlx-wdt.txt => mlx-wdt.rst}          |  24 +-
 .../{pcwd-watchdog.txt => pcwd-watchdog.rst}       |  13 +-
 .../{watchdog-api.txt => watchdog-api.rst}         |  76 ++-
 ...hdog-kernel-api.txt => watchdog-kernel-api.rst} |  91 ++-
 Documentation/watchdog/watchdog-parameters.rst     | 747 +++++++++++++++++++++
 Documentation/watchdog/watchdog-parameters.txt     | 410 -----------
 .../watchdog/{watchdog-pm.txt => watchdog-pm.rst}  |   3 +
 Documentation/watchdog/{wdt.txt => wdt.rst}        |  31 +-
 MAINTAINERS                                        |   2 +-
 drivers/watchdog/Kconfig                           |  16 +-
 drivers/watchdog/acquirewdt.c                      |   6 +-
 drivers/watchdog/advantechwdt.c                    |   6 +-
 drivers/watchdog/aspeed_wdt.c                      |   8 +-
 drivers/watchdog/bcm2835_wdt.c                     |   5 +-
 drivers/watchdog/bcm7038_wdt.c                     |   4 +-
 drivers/watchdog/bcm_kona_wdt.c                    |  18 +-
 drivers/watchdog/cadence_wdt.c                     |   4 +-
 drivers/watchdog/da9052_wdt.c                      |   9 +-
 drivers/watchdog/da9062_wdt.c                      |   5 +-
 drivers/watchdog/davinci_wdt.c                     |  14 +-
 drivers/watchdog/digicolor_wdt.c                   |   9 +-
 drivers/watchdog/ebc-c384_wdt.c                    |   9 -
 drivers/watchdog/eurotechwdt.c                     |   6 +-
 drivers/watchdog/ftwdt010_wdt.c                    |   4 +-
 drivers/watchdog/gpio_wdt.c                        |   7 +
 drivers/watchdog/hpwdt.c                           |  59 +-
 drivers/watchdog/i6300esb.c                        |   5 +-
 drivers/watchdog/iTCO_vendor_support.c             |   7 +-
 drivers/watchdog/iTCO_wdt.c                        |   6 +-
 drivers/watchdog/ib700wdt.c                        |   6 +-
 drivers/watchdog/ie6xx_wdt.c                       |   8 +-
 drivers/watchdog/imx2_wdt.c                        |   4 +-
 drivers/watchdog/imx_sc_wdt.c                      | 123 +++-
 drivers/watchdog/intel-mid_wdt.c                   |   4 +-
 drivers/watchdog/jz4740_wdt.c                      |  57 +-
 drivers/watchdog/loongson1_wdt.c                   |   4 +-
 drivers/watchdog/max77620_wdt.c                    |   8 +-
 drivers/watchdog/mei_wdt.c                         |  34 +-
 drivers/watchdog/mena21_wdt.c                      |   4 +-
 drivers/watchdog/menf21bmc_wdt.c                   |   4 +-
 drivers/watchdog/mpc8xxx_wdt.c                     |   5 +-
 drivers/watchdog/mv64x60_wdt.c                     |   6 +-
 drivers/watchdog/ni903x_wdt.c                      |   4 +-
 drivers/watchdog/nic7018_wdt.c                     |   1 -
 drivers/watchdog/npcm_wdt.c                        |   4 +-
 drivers/watchdog/nv_tco.h                          |   6 +-
 drivers/watchdog/octeon-wdt-main.c                 |  11 +-
 drivers/watchdog/of_xilinx_wdt.c                   |   4 +-
 drivers/watchdog/omap_wdt.c                        |   6 +-
 drivers/watchdog/omap_wdt.h                        |  21 +-
 drivers/watchdog/pc87413_wdt.c                     |   6 +-
 drivers/watchdog/pcwd_pci.c                        |   6 +-
 drivers/watchdog/pcwd_usb.c                        |   6 +-
 drivers/watchdog/pic32-dmt.c                       |   4 +-
 drivers/watchdog/pic32-wdt.c                       |   4 +-
 drivers/watchdog/pnx4008_wdt.c                     |   9 +-
 drivers/watchdog/qcom-wdt.c                        |   4 +-
 drivers/watchdog/rave-sp-wdt.c                     |   1 -
 drivers/watchdog/renesas_wdt.c                     |  35 +-
 drivers/watchdog/retu_wdt.c                        |  10 +-
 drivers/watchdog/s3c2410_wdt.c                     |   4 +-
 drivers/watchdog/sa1100_wdt.c                      |   6 +-
 drivers/watchdog/sama5d4_wdt.c                     |  29 +-
 drivers/watchdog/sbc7240_wdt.c                     |  11 +-
 drivers/watchdog/sbc8360.c                         |   6 +-
 drivers/watchdog/sch311x_wdt.c                     |   6 +-
 drivers/watchdog/smsc37b787_wdt.c                  |   2 +-
 drivers/watchdog/softdog.c                         |   6 +-
 drivers/watchdog/sp5100_tco.c                      |   4 +-
 drivers/watchdog/sp805_wdt.c                       |   5 +-
 drivers/watchdog/sprd_wdt.c                        |   1 -
 drivers/watchdog/st_lpc_wdt.c                      |   4 +-
 drivers/watchdog/stm32_iwdg.c                      |   4 +-
 drivers/watchdog/stmp3xxx_rtc_wdt.c                |   4 +-
 drivers/watchdog/tegra_wdt.c                       |   4 +-
 drivers/watchdog/ts4800_wdt.c                      |   4 +-
 drivers/watchdog/w83627hf_wdt.c                    |   6 +-
 drivers/watchdog/wafer5823wdt.c                    |   6 +-
 drivers/watchdog/watchdog_core.c                   |  22 +-
 drivers/watchdog/watchdog_core.h                   |   6 +-
 drivers/watchdog/watchdog_dev.c                    |  54 +-
 drivers/watchdog/wd501p.h                          |   6 +-
 drivers/watchdog/wdt.c                             |   6 +-
 drivers/watchdog/wdt_pci.c                         |   6 +-
 drivers/watchdog/wm831x_wdt.c                      |   9 +-
 drivers/watchdog/xen_wdt.c                         |   4 +-
 95 files changed, 1406 insertions(+), 1039 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
 rename Documentation/devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt} (100%)
 rename Documentation/watchdog/{convert_drivers_to_kernel_api.txt => convert_drivers_to_kernel_api.rst} (75%)
 rename Documentation/watchdog/{hpwdt.txt => hpwdt.rst} (73%)
 create mode 100644 Documentation/watchdog/index.rst
 rename Documentation/watchdog/{mlx-wdt.txt => mlx-wdt.rst} (78%)
 rename Documentation/watchdog/{pcwd-watchdog.txt => pcwd-watchdog.rst} (89%)
 rename Documentation/watchdog/{watchdog-api.txt => watchdog-api.rst} (80%)
 rename Documentation/watchdog/{watchdog-kernel-api.txt => watchdog-kernel-api.rst} (90%)
 create mode 100644 Documentation/watchdog/watchdog-parameters.rst
 delete mode 100644 Documentation/watchdog/watchdog-parameters.txt
 rename Documentation/watchdog/{watchdog-pm.txt => watchdog-pm.rst} (92%)
 rename Documentation/watchdog/{wdt.txt => wdt.rst} (68%)
----------------------------------------------------------------

Kind regards,
Wim.

