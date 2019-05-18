Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE2B2250C
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729549AbfERV2L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:11 -0400
Received: from sauhun.de ([88.99.104.3]:35758 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfERV2L (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:11 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id E8DD52C051A;
        Sat, 18 May 2019 23:28:07 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/46] watchdog: move 'registration failed' messages into core
Date:   Sat, 18 May 2019 23:27:15 +0200
Message-Id: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Similar to my recently merged series doing the same for
watchdog_init_timeout(), here is a series moving all error messages
after a failed {devm_}watchdog_register_device() into the core. Guenter
was right, this was even more worth it. For some cases, this also
resulted in neat code simplifications.

The core changes were tested with a Renesas Lager (R-Car H2) board. The
driver changes were created using a coccinelle script and build-tested
by buildbot.

This series is based on Linus' tree as of today which should be close
enough to -rc1, I guess. A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/wdt/register_device

Looking forward to comments.

Happy hacking,

   Wolfram

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

 drivers/watchdog/aspeed_wdt.c       |  8 +-------
 drivers/watchdog/bcm2835_wdt.c      |  4 +---
 drivers/watchdog/bcm7038_wdt.c      |  4 +---
 drivers/watchdog/bcm_kona_wdt.c     |  4 +---
 drivers/watchdog/cadence_wdt.c      |  4 +---
 drivers/watchdog/da9052_wdt.c       |  9 +--------
 drivers/watchdog/da9062_wdt.c       |  5 +----
 drivers/watchdog/davinci_wdt.c      |  8 +-------
 drivers/watchdog/digicolor_wdt.c    |  8 +-------
 drivers/watchdog/ftwdt010_wdt.c     |  4 +---
 drivers/watchdog/hpwdt.c            |  4 +---
 drivers/watchdog/i6300esb.c         |  5 +----
 drivers/watchdog/ie6xx_wdt.c        |  6 +-----
 drivers/watchdog/imx2_wdt.c         |  4 +---
 drivers/watchdog/imx_sc_wdt.c       |  8 +-------
 drivers/watchdog/intel-mid_wdt.c    |  4 +---
 drivers/watchdog/jz4740_wdt.c       |  6 +-----
 drivers/watchdog/loongson1_wdt.c    |  4 +---
 drivers/watchdog/max77620_wdt.c     |  8 +-------
 drivers/watchdog/mei_wdt.c          |  4 +---
 drivers/watchdog/mena21_wdt.c       |  4 +---
 drivers/watchdog/menf21bmc_wdt.c    |  4 +---
 drivers/watchdog/mpc8xxx_wdt.c      |  5 +----
 drivers/watchdog/ni903x_wdt.c       |  4 +---
 drivers/watchdog/nic7018_wdt.c      |  1 -
 drivers/watchdog/npcm_wdt.c         |  4 +---
 drivers/watchdog/of_xilinx_wdt.c    |  4 +---
 drivers/watchdog/pic32-dmt.c        |  4 +---
 drivers/watchdog/pic32-wdt.c        |  4 +---
 drivers/watchdog/pnx4008_wdt.c      |  4 +---
 drivers/watchdog/qcom-wdt.c         |  4 +---
 drivers/watchdog/rave-sp-wdt.c      |  1 -
 drivers/watchdog/s3c2410_wdt.c      |  4 +---
 drivers/watchdog/sama5d4_wdt.c      |  4 +---
 drivers/watchdog/sp5100_tco.c       |  4 +---
 drivers/watchdog/sp805_wdt.c        |  5 +----
 drivers/watchdog/sprd_wdt.c         |  1 -
 drivers/watchdog/st_lpc_wdt.c       |  4 +---
 drivers/watchdog/stm32_iwdg.c       |  4 +---
 drivers/watchdog/stmp3xxx_rtc_wdt.c |  4 +---
 drivers/watchdog/tegra_wdt.c        |  4 +---
 drivers/watchdog/ts4800_wdt.c       |  4 +---
 drivers/watchdog/watchdog_core.c    | 16 ++++++++++++----
 drivers/watchdog/wm831x_wdt.c       |  9 +--------
 drivers/watchdog/xen_wdt.c          |  4 +---
 45 files changed, 53 insertions(+), 168 deletions(-)

-- 
2.19.1

