Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822DC31C015
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Feb 2021 18:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhBORGa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Feb 2021 12:06:30 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:46510 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhBOREX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Feb 2021 12:04:23 -0500
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Feb 2021 12:04:21 EST
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 9C57540A02; Mon, 15 Feb 2021 16:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 9C57540A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1613404047;
        bh=RAkjUrT3GbrONj0NvI/rvrfCWar1jasun15o7Y8raWo=;
        h=Date:From:To:Cc:Subject:From;
        b=GLEWW66KXPCRQW/mJZVz08mpKCFBSyUSnLfHz/iZrYr6VgTUEmgpbWWRXxxmc3emK
         1c8SUiPYWRvGUiipJuN68XRvYfU7ewZ2SQN96R1AcclfavFjdjve2QxvE6FgeRIOEU
         eXFF/9zPLAT/lNlgNQfCnNeaVLS7FqBrOlog413w=
Date:   Mon, 15 Feb 2021 16:47:27 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Crystal Guo <crystal.guo@mediatek.com>,
        "freddy.hsin" <freddy.hsin@mediatek.com>,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Tian Tao <tiantao6@hisilicon.com>, Tom Rix <trix@redhat.com>,
        Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhao Qiang <qiang.zhao@nxp.com>
Subject: [GIT PULL REQUEST] watchdog - v5.12 Merge window
Message-ID: <20210215154727.GA30814@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.12 release cycle.

This series contains:
* Add watchdog driver for Intel Keembay Soc
* Add sun4i: Add H616 compatible string
* Add mt8192 wdt support
* add more Rockchip compatibles to snps,dw-wdt.yaml
* Add binding for Qcom SDX55
* add r8a779a0 (V3U) support
* removal of sirf prima watchdog driver
* removal of sirf atlas watchdog driver
* removal of zte zx watchdog driver
* removal of tango watchdog driver
* removal of coh901 watchdog driver
* several fixes and clean-ups

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.12-rc1

for you to fetch changes up to a4f3407c41605d14f09e490045d0609990cd5d94:

  watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ (2021-02-07 14:41:28 +0100)

----------------------------------------------------------------
linux-watchdog 5.12-rc1 tag

----------------------------------------------------------------
Alexan der Usyskin (1):
      watchdog: mei_wdt: request stop on unregister

Andre Przywara (1):
      dt-bindings: watchdog: sun4i: Add H616 compatible string

Arnd Bergmann (5):
      watchdog: remove sirf prima driver
      watchdog: remove sirf atlas driver
      watchdog: remove zte zx driver
      watchdog: remove tango driver
      watchdog: remove coh901 driver

Crystal Guo (4):
      dt-binding: mediatek: watchdog: fix the description of compatible
      dt-binding: mediatek: mt8192: update mtk-wdt document
      dt-binding: mt8192: add toprgu reset-controller head file
      watchdog: mt8192: add wdt support

Jiapeng Zhong (1):
      watchdog: hpwdt: Assign boolean values to a bool variable

Johan Jonker (1):
      dt-binding: watchdog: add more Rockchip compatibles to snps,dw-wdt.yaml

Manivannan Sadhasivam (1):
      dt-bindings: watchdog: Add binding for Qcom SDX55

Sai Prakash Ranjan (1):
      watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ

Tian Tao (1):
      watchdog: ziirave_wdt: remove unused including <linux/version.h>

Tom Rix (1):
      watchdog: it8712f_wdt: remove definition of DEBUG

Vijayakannan Ayyathurai (2):
      dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
      watchdog: Add watchdog driver for Intel Keembay Soc

Wolfram Sang (3):
      watchdog: renesas_wdt: don't sleep in atomic context
      dt-bindings: watchdog: renesas,wdt: add r8a779a0 (V3U) support
      watchdog: renesas_wdt: add grace period before rebooting

Zhao Qiang (1):
      watchdog: stop wdd when watchdog hw running in reboot_notifier

freddy.hsin (1):
      watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem

 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |  12 +-
 .../bindings/watchdog/intel,keembay-wdt.yaml       |  57 +++
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |   5 +-
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |   1 +
 .../bindings/watchdog/sigma,smp8642-wdt.txt        |  18 -
 .../devicetree/bindings/watchdog/sirfsoc_wdt.txt   |  18 -
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |   6 +
 .../bindings/watchdog/stericsson-coh901327.txt     |  19 -
 .../bindings/watchdog/zte,zx2967-wdt.txt           |  32 --
 drivers/watchdog/Kconfig                           |  65 +---
 drivers/watchdog/Makefile                          |   6 +-
 drivers/watchdog/atlas7_wdt.c                      | 221 -----------
 drivers/watchdog/coh901327_wdt.c                   | 408 ---------------------
 drivers/watchdog/hpwdt.c                           |   6 +-
 drivers/watchdog/it8712f_wdt.c                     |   1 -
 drivers/watchdog/keembay_wdt.c                     | 286 +++++++++++++++
 drivers/watchdog/mei_wdt.c                         |   1 +
 drivers/watchdog/mtk_wdt.c                         |  23 +-
 drivers/watchdog/qcom-wdt.c                        |  13 +-
 drivers/watchdog/renesas_wdt.c                     |  33 +-
 drivers/watchdog/sirfsoc_wdt.c                     | 216 -----------
 drivers/watchdog/tangox_wdt.c                      | 209 -----------
 drivers/watchdog/watchdog_core.c                   |   2 +-
 drivers/watchdog/ziirave_wdt.c                     |   1 -
 drivers/watchdog/zx2967_wdt.c                      | 279 --------------
 .../dt-bindings/reset-controller/mt8192-resets.h   |  30 ++
 27 files changed, 457 insertions(+), 1512 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
 delete mode 100644 drivers/watchdog/atlas7_wdt.c
 delete mode 100644 drivers/watchdog/coh901327_wdt.c
 create mode 100644 drivers/watchdog/keembay_wdt.c
 delete mode 100644 drivers/watchdog/sirfsoc_wdt.c
 delete mode 100644 drivers/watchdog/tangox_wdt.c
 delete mode 100644 drivers/watchdog/zx2967_wdt.c
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
----------------------------------------------------------------

Kind regards,
Wim.

