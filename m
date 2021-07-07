Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59493BEC87
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jul 2021 18:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhGGQuK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jul 2021 12:50:10 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:57050 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGGQuK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jul 2021 12:50:10 -0400
X-Greylist: delayed 589 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Jul 2021 12:50:09 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 46CB7409F0; Wed,  7 Jul 2021 17:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 46CB7409F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1625671182;
        bh=uuvVTv/CZ3VXSk7ge/T48z70BprWuwW1OSX/UrWRJSU=;
        h=Date:From:To:Cc:Subject:From;
        b=YKB0jBsX7tVRR8zuYqXHd2LlXCoQgiwVABzrb4UZRIQDtZEXfPm4oNJtE8V8VTxyl
         WtH9N3jJMzNx/oNUXeJ7NLqmT2Z3R0KWKsaauJAfPcGI6KXoHu+SljFUlmbb52wJbJ
         13pG6sRFcwUfUyzXxqzqkHsTy4jJwuDg0S7s1t54=
Date:   Wed, 7 Jul 2021 17:19:42 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Curtis Klein <curtis.klein@hpe.com>,
        Daniel Palmer <daniel@0x0f.com>,
        EnricoWeigelt@www.linux-watchdog.org,
        metux IT consult <info@metux.net>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Junlin Yang <yangjunlin@yulong.com>,
        Liang Chen <cl@rock-chips.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
        Romain Perier <romain.perier@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Shruthi Sanil <shruthi.sanil@intel.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Stefan Eichenberger <eichest@gmail.com>,
        Tao Ren <rentao.bupt@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Wang Qing <wangqing@vivo.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Wong Vee Khee <vee.khee.wong@linux.intel.com>,
        Zou Wei <zou_wei@huawei.com>
Subject: [GIT PULL REQUEST] watchdog - v5.14 Merge window
Message-ID: <20210707151941.GA512@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.12 release cycle.

This series contains:
* Add Mstar MSC313e WDT driver
* Add support for sama7g5-wdt
* Add compatible for SC7280 SoC
* Add compatible for Mediatek MT8195
* sbsa: Support architecture version 1
* Removal of the MV64x60 watchdog driver
* Extra PCI IDs for hpwdt
* Add hrtimer-based pretimeout feature
* Add {min,max}_timeout sysfs nodes
* keembay timeout and pre-timeout handling
* Several fixes, cleanups and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.14-rc1

for you to fetch changes up to cf813c67d9619fd474c785698cbed543b94209dd:

  watchdog: iTCO_wdt: use dev_err() instead of pr_err() (2021-06-21 08:49:19 +0200)

----------------------------------------------------------------
linux-watchdog 5.14-rc1 tag

----------------------------------------------------------------
Andy Shevchenko (2):
      watchdog: sp805: Use devm_clk_get_optional()
      watchdog: sp805: Fix kernel doc description

Bhaskar Chowdhury (2):
      watchdog: sl28cpld_wdt: Fix a typo
      watchdog: Fix a typo in the file orion_wdt.c

Christophe Leroy (1):
      watchdog: Remove MV64x60 watchdog driver

Curtis Klein (1):
      watchdog: Add hrtimer-based pretimeout feature

Daniel Palmer (1):
      watchdog: Add Mstar MSC313e WDT driver

Enrico Weigelt, metux IT consult (1):
      watchdog: iTCO_wdt: use dev_err() instead of pr_err()

Eugen Hristev (3):
      dt-bindings: watchdog: sama5d4-wdt: convert to yaml
      watchdog: sama5d4_wdt: add support for sama7g5-wdt
      dt-bindings: watchdog: sama5d4-wdt: add compatible for sama7g5-wdt

Flavio Suligoi (1):
      watchdog: wdat_wdg: fix typo

Jan Kiszka (1):
      watchdog: iTCO_wdt: Account for rebooting on second timeout

Jerry Hoemann (1):
      watchdog/hpwdt: New PCI IDs

Jiapeng Chong (2):
      watchdog: dw_wdt: Fix duplicate included linux/kernel.h
      watchdog: it87_wdt: remove useless function

Juerg Haefliger (3):
      watchdog: Add {min,max}_timeout sysfs nodes
      watchdog: Use sysfs_emit() and sysfs_emit_at() in "show" functions
      watchdog: ziirave_wdt: Remove VERSION_FMT defines and add sysfs newlines

Junlin Yang (1):
      watchdog: diag288_wdt: Remove redundant assignment

Liang Chen (1):
      dt-bindings: watchdog: dw-wdt: add description for rk3568

Lukas Bulwahn (1):
      watchdog: fix syntactic kernel-doc issues

Randy Dunlap (2):
      watchdog: mtx-1: drop au1000.h header file
      watchdog: clean up the Kconfig file

Rob Herring (1):
      dt-bindings: watchdog: Convert arm,sbsa-gwdt to DT schema

Robin Gong (1):
      watchdog: imx2_wdt: avoid to ping before resume back

Romain Perier (1):
      dt-bindings: watchdog: Add Mstar MSC313e WDT devicetree bindings documentation

Sai Prakash Ranjan (2):
      watchdog: qcom: Move suspend/resume to suspend_late/resume_early
      dt-bindings: watchdog: Add compatible for SC7280 SoC

Seiya Wang (1):
      dt-bindings: watchdog: Add compatible for Mediatek MT8195

Shaokun Zhang (1):
      watchdog: sbsa: Support architecture version 1

Shruthi Sanil (9):
      watchdog: keembay: Update WDT pre-timeout during the initialization
      watchdog: keembay: Upadate WDT pretimeout for every update in timeout
      watchdog: keembay: Update pretimeout to zero in the TH ISR
      watchdog: keembay: Clear either the TO or TH interrupt bit
      watchdog: keembay: Remove timeout update in the WDT start function
      watchdog: keembay: MACRO for WDT enable and disable values
      watchdog: keembay: Removed timeout update in the TO ISR
      watchdog: keembay: WDT SMC handler MACRO name update
      watchdog: keembay: Typo corrections and other blank operations

Srinivas Goud (3):
      watchdog: of_xilinx_wdt: Add comment to spinlock
      watchdog: of_xilinx_wdt: Used BIT macro
      watchdog: of_xilinx_wdt: Used dev_dbg()

Srinivas Neeli (2):
      watchdog: of_xilinx_wdt: Remove passing null pointer
      watchdog: of_xilinx_wdt: Skip printing pointer value

Stefan Eichenberger (1):
      watchdog: imx_sc_wdt: fix pretimeout

Tao Ren (1):
      watchdog: aspeed: fix hardware timeout calculation

Tian Tao (1):
      watchdog: meson_wdt: Use device_get_match_data() helper

Wang Qing (2):
      watchdog: mtk: support pre-timeout when the bark irq is available
      doc: mtk-wdt: support pre-timeout when the bark irq is available

Wei Yongjun (1):
      watchdog: jz4740: Fix return value check in jz4740_wdt_probe()

Wong Vee Khee (1):
      watchdog: Fix a typo in Kconfig

Zou Wei (3):
      watchdog: Fix possible use-after-free in wdt_startup()
      watchdog: sc520_wdt: Fix possible use-after-free in wdt_turnoff()
      watchdog: Fix possible use-after-free by calling del_timer_sync()

Álvaro Fernández Rojas (1):
      watchdog: bcm7038_wdt: add big endian support

 .../bindings/watchdog/arm,sbsa-gwdt.yaml           |  51 ++++
 .../bindings/watchdog/atmel,sama5d4-wdt.yaml       |  74 +++++
 .../bindings/watchdog/atmel-sama5d4-wdt.txt        |  34 ---
 .../bindings/watchdog/mstar,msc313e-wdt.yaml       |  40 +++
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |   6 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 .../devicetree/bindings/watchdog/sbsa-gwdt.txt     |  31 --
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |   1 +
 MAINTAINERS                                        |   1 +
 drivers/watchdog/Kconfig                           |  77 +++--
 drivers/watchdog/Makefile                          |   3 +-
 drivers/watchdog/aspeed_wdt.c                      |   6 +-
 drivers/watchdog/bcm7038_wdt.c                     |  31 +-
 drivers/watchdog/booke_wdt.c                       |   2 +-
 drivers/watchdog/diag288_wdt.c                     |   4 -
 drivers/watchdog/dw_wdt.c                          |   9 +-
 drivers/watchdog/eurotechwdt.c                     |   2 +-
 drivers/watchdog/hpwdt.c                           |   1 +
 drivers/watchdog/iTCO_wdt.c                        |  16 +-
 drivers/watchdog/imx2_wdt.c                        |  10 +
 drivers/watchdog/imx_sc_wdt.c                      |  11 +-
 drivers/watchdog/it87_wdt.c                        |   8 -
 drivers/watchdog/jz4740_wdt.c                      |   4 +-
 drivers/watchdog/keembay_wdt.c                     |  34 ++-
 drivers/watchdog/lpc18xx_wdt.c                     |   2 +-
 drivers/watchdog/mei_wdt.c                         |   8 +-
 drivers/watchdog/meson_wdt.c                       |   8 +-
 drivers/watchdog/msc313e_wdt.c                     | 166 +++++++++++
 drivers/watchdog/mtk_wdt.c                         |  77 ++++-
 drivers/watchdog/mtx-1_wdt.c                       |   2 -
 drivers/watchdog/mv64x60_wdt.c                     | 324 ---------------------
 drivers/watchdog/octeon-wdt-main.c                 |  12 +-
 drivers/watchdog/of_xilinx_wdt.c                   |  38 +--
 drivers/watchdog/orion_wdt.c                       |   2 +-
 drivers/watchdog/pc87413_wdt.c                     |   2 +-
 drivers/watchdog/qcom-wdt.c                        |   4 +-
 drivers/watchdog/sama5d4_wdt.c                     |  10 +-
 drivers/watchdog/sbc60xxwdt.c                      |   2 +-
 drivers/watchdog/sbsa_gwdt.c                       |  54 +++-
 drivers/watchdog/sc520_wdt.c                       |   2 +-
 drivers/watchdog/sl28cpld_wdt.c                    |   2 +-
 drivers/watchdog/sp805_wdt.c                       |  43 ++-
 drivers/watchdog/w83877f_wdt.c                     |   2 +-
 drivers/watchdog/watchdog_core.h                   |  48 +++
 drivers/watchdog/watchdog_dev.c                    |  86 +++---
 drivers/watchdog/watchdog_hrtimer_pretimeout.c     |  44 +++
 drivers/watchdog/watchdog_pretimeout.c             |   9 +-
 drivers/watchdog/wdat_wdt.c                        |   4 +-
 drivers/watchdog/wdt.c                             |   4 +-
 drivers/watchdog/wdt_pci.c                         |   2 +-
 drivers/watchdog/ziirave_wdt.c                     |  21 +-
 include/linux/mv643xx.h                            |   8 -
 52 files changed, 825 insertions(+), 618 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
 create mode 100644 drivers/watchdog/msc313e_wdt.c
 delete mode 100644 drivers/watchdog/mv64x60_wdt.c
 create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.c
----------------------------------------------------------------

Kind regards,
Wim.

