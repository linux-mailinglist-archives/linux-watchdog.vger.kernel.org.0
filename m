Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430382E0DFE
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Dec 2020 18:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgLVRwv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Dec 2020 12:52:51 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:41288 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgLVRwv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Dec 2020 12:52:51 -0500
X-Greylist: delayed 611 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Dec 2020 12:52:50 EST
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 3BCC4409F3; Tue, 22 Dec 2020 17:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 3BCC4409F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1608654893;
        bh=Q3fKnQNv/OMinaEJAq+UXnsZFX4FpUlHCqJCV7Dyy3U=;
        h=Date:From:To:Cc:Subject:From;
        b=JW+eBBj/QYiQ/Gv8TNfsEmB6bL8L6OmxaCRE8GwJXznJ9eLLDHcBpukHyRfmL4Y3W
         4MQJppcol0gY/Xlefk9I4saePCUn2wJ0oqEpexDe06V2QKDtmPVDl1HbYetSboRUdu
         rfUeIWbUfAtLFs6Zp5qjsVb2S1qpi7gixRvKvVTI=
Date:   Tue, 22 Dec 2020 17:34:52 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        EnricoWeigelt@www.linux-watchdog.org,
        metux IT consult <info@metux.net>,
        Etienne Carriere <etienne.carriere@st.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Robert Marko <robert.marko@sartura.hr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tom Rix <trix@redhat.com>,
        Wang Wensheng <wangwensheng4@huawei.com>,
        Wong Vee Khee <vee.khee.wong@intel.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Zhao Qiang <qiang.zhao@nxp.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [GIT PULL REQUEST] watchdog - v5.11 Merge window
Message-ID: <20201222163452.GA1524@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.11 release cycle.

This series contains:
* Removal of the pnx83xx driver
* Add a binding for A100's watchdog controller.
* Add Rockchip compatibles to snps,dw-wdt.yaml
* hpwdt: Disable NMI in Crash Kernel
* Fix potential dereferencing of null pointer in watchdog_core
* Several other small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 6bff9bb8a292668e7da3e740394b061e5201f683:

  Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi (2020-12-12 12:57:12 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-5.11-rc1

for you to fetch changes up to 0b9491b621196a5d7f163dde81d98e0687bdba97:

  watchdog: convert comma to semicolon (2020-12-17 21:58:46 +0100)

----------------------------------------------------------------
linux-watchdog 5.11-rc1 tag

----------------------------------------------------------------
Arnd Bergmann (1):
      watchdog: coh901327: add COMMON_CLK dependency

Chunyan Zhang (1):
      watchdog: sprd: change to use usleep_range() instead of busy loop

Enrico Weigelt, metux IT consult (2):
      watchdog: iTCO_wdt: use module_platform_device() macro
      watchdog: iTCO_wdt: use dev_*() instead of pr_*() for logging

Etienne Carriere (1):
      watchdog: stm32_iwdg: don't print an error on probe deferral

Guenter Roeck (2):
      watchdog: armada_37xx: Add missing dependency on HAS_IOMEM
      watchdog: sirfsoc: Add missing dependency on HAS_IOMEM

Jerry Hoemann (2):
      watchdog/hpwdt: Disable NMI in Crash Kernel
      watchdog/hpwdt: Reflect changes

Johan Jonker (1):
      dt-binding: watchdog: add Rockchip compatibles to snps,dw-wdt.yaml

Lingling Xu (2):
      watchdog: sprd: remove watchdog disable from resume fail path
      watchdog: sprd: check busy bit before new loading rather than after that

Manivannan Sadhasivam (1):
      watchdog: qcom: Avoid context switch in restart handler

Rasmus Villemoes (1):
      watchdog: sbc_fitpc2_wdt: add __user annotations

Robert Marko (1):
      watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when appropriate

Thomas Bogendoerfer (1):
      watchdog: remove pnx83xx driver

Tom Rix (1):
      watchdog: geodewdt: remove unneeded break

Wang Wensheng (1):
      watchdog: Fix potential dereferencing of null pointer

Wong Vee Khee (1):
      watchdog: wdat_wdt: Fix missing kerneldoc reported by W=1

Yangtao Li (1):
      dt-bindings: watchdog: sun4i: Add A100 compatible

Zhang Qilong (1):
      watchdog: rti-wdt: fix reference leak in rti_wdt_probe

Zhao Qiang (1):
      wdt: sp805: add watchdog_stop on reboot

Zheng Yongjun (1):
      watchdog: convert comma to semicolon

 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |   3 +
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |  10 +-
 drivers/watchdog/Kconfig                           |  14 +-
 drivers/watchdog/Makefile                          |   1 -
 drivers/watchdog/geodewdt.c                        |   2 -
 drivers/watchdog/hpwdt.c                           |   8 +-
 drivers/watchdog/iTCO_wdt.c                        |  34 +--
 drivers/watchdog/mpc8xxx_wdt.c                     |   4 +-
 drivers/watchdog/pnx833x_wdt.c                     | 277 ---------------------
 drivers/watchdog/qcom-wdt.c                        |  20 +-
 drivers/watchdog/rti_wdt.c                         |   4 +-
 drivers/watchdog/sbc_fitpc2_wdt.c                  |  12 +-
 drivers/watchdog/sp805_wdt.c                       |   1 +
 drivers/watchdog/sprd_wdt.c                        |  43 ++--
 drivers/watchdog/stm32_iwdg.c                      |  13 +-
 drivers/watchdog/watchdog_core.c                   |  22 +-
 drivers/watchdog/wdat_wdt.c                        |   6 +-
 17 files changed, 104 insertions(+), 370 deletions(-)
 delete mode 100644 drivers/watchdog/pnx833x_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.

