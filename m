Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E594410D89E
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Nov 2019 17:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfK2QqV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Nov 2019 11:46:21 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:45454 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK2QqV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Nov 2019 11:46:21 -0500
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id D55BD40982; Fri, 29 Nov 2019 17:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D55BD40982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1575043245;
        bh=UUAnjyGizUx/JWccsMa20s8W2efB6yHvwHkFZXoG49Q=;
        h=Date:From:To:Cc:Subject:From;
        b=T3nzqIBxiGeuvNMCtOAx3DR4Q7m3DtAbCTwA841PjaLPXzlkHT86rDBFOmiv6EySS
         TW2X2WRNudkmV7mbDa76eG3DEc4iablTr5eFKcwo4sTJTU95+x7pJ0AvdR+66QdA3E
         PhVFJrpiBYPVVhM8QKkhcdhTZyibCm07JooPo2XQ=
Date:   Fri, 29 Nov 2019 17:00:45 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Borislav Petkov <bp@suse.de>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Joel Stanley <joel@jms.id.au>, Julia Cartwright <julia@ni.com>,
        Kevin Hao <haokexin@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Shuiqing Li <shuiqing.li@unisoc.com>,
        Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
Subject: [GIT PULL REQUEST] watchdog - v5.5 Merge window
Message-ID: <20191129160045.GA1996@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.5 release cycle.

This series contains:
* Support for NCT6116D
* Several small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.5-rc1

for you to fetch changes up to 33c26ab4d6beec44bd5f525ffba1c23bf962d4a7:

  watchdog: jz4740: Drop dependency on MACH_JZ47xx (2019-11-18 20:14:47 +0100)

----------------------------------------------------------------
linux-watchdog 5.5-rc1 tag

----------------------------------------------------------------
Andy Shevchenko (1):
      watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support

Anson Huang (3):
      watchdog: imx2_wdt: Remove unnecessary blank line
      watchdog: imx2_wdt: Use __maybe_unused instead of #if CONFIG_PM_SLEEP
      watchdog: imx2_wdt: Use 'dev' instead of dereferencing it repeatedly

Borislav Petkov (1):
      watchdog: sbc7240_wdt: Fix yet another -Wimplicit-fallthrough warning

Eugen Hristev (2):
      watchdog: sama5d4_wdt: cleanup the bit definitions
      dt-bindings: watchdog: sama5d4_wdt: add microchip,sam9x60-wdt compatible

Fabio Estevam (5):
      watchdog: imx7ulp: Pass the wdog instance inimx7ulp_wdt_enable()
      watchdog: imx7ulp: Remove unused structure member
      watchdog: imx7ulp: Remove inline annotations
      watchdog: imx7ulp: Use definitions instead of magic values
      watchdog: imx7ulp: Fix reboot hang

Geert Uytterhoeven (1):
      watchdog: wdat_wdt: Spelling s/configrable/configurable/

Joel Stanley (1):
      watchdog: aspeed: Fix clock behaviour for ast2600

Julia Cartwright (1):
      watchdog: prevent deferral of watchdogd wakeup on RT

Kevin Hao (1):
      watchdog: Fix the race between the release of watchdog_core_data and cdev

Matti Vaittinen (1):
      watchdog: bd70528: Trivial function documentation fix

Michal Simek (1):
      watchdog: cadence: Do not show error in case of deferred probe

Paul Cercueil (3):
      watchdog: jz4740: Use WDT clock provided by TCU driver
      watchdog: jz4740: Use regmap provided by TCU driver
      watchdog: jz4740: Drop dependency on MACH_JZ47xx

Rasmus Villemoes (1):
      watchdog: make nowayout sysfs file writable

Shuiqing Li (1):
      watchdog: sprd: Fix the incorrect pointer getting from driver data

Srikanth Krishnakar (1):
      watchdog: w83627hf_wdt: Support NCT6116D

 Documentation/ABI/testing/sysfs-class-watchdog     |   9 +-
 .../bindings/watchdog/atmel-sama5d4-wdt.txt        |   2 +-
 drivers/watchdog/Kconfig                           |   5 +-
 drivers/watchdog/aspeed_wdt.c                      |  16 +--
 drivers/watchdog/at91sam9_wdt.h                    |  34 ++++---
 drivers/watchdog/bd70528_wdt.c                     |   4 +-
 drivers/watchdog/cadence_wdt.c                     |   6 +-
 drivers/watchdog/imx2_wdt.c                        |  30 +++---
 drivers/watchdog/imx7ulp_wdt.c                     |  45 ++++++---
 drivers/watchdog/intel-mid_wdt.c                   |   1 +
 drivers/watchdog/jz4740_wdt.c                      | 108 ++++++++++-----------
 drivers/watchdog/sbc7240_wdt.c                     |   3 +-
 drivers/watchdog/sprd_wdt.c                        |   6 +-
 drivers/watchdog/w83627hf_wdt.c                    |  11 ++-
 drivers/watchdog/watchdog_dev.c                    | 101 +++++++++++--------
 drivers/watchdog/wdat_wdt.c                        |   2 +-
 16 files changed, 214 insertions(+), 169 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.

