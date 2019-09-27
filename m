Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8BFC0092
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Sep 2019 10:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfI0IC4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Sep 2019 04:02:56 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:35080 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfI0IC4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Sep 2019 04:02:56 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Sep 2019 04:02:55 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 46A33409EC; Fri, 27 Sep 2019 09:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 46A33409EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1569568527;
        bh=8Y6KiH2wq+ipsKj5RsPEuqd6IhXPMKVSfXcTHqsx96E=;
        h=Date:From:To:Cc:Subject:From;
        b=B1AuEd8u1xSAHXq7w+uUaLb0kuskf2GrTQAxTti2jvwnF+pitFvGZ4Vsm57tzVLRH
         7T+EbuWeQUP0cHEP0nc61zEpGdncVqtNQqvhK1gMXFZawbL8c1H2ablVSzbdi3HuRv
         ioN2vIKLgGaNZeMjI5UNdkPev01sxK2Yc6dvQWWw=
Date:   Fri, 27 Sep 2019 09:15:27 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jaret Cantu <jaret.cantu@timesys.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [GIT PULL REQUEST] watchdog - v5.4 Merge window
Message-ID: <20190927071527.GA14507@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

My apologies for the delay.

Please pull the watchdog changes for the v5.4 release cycle.

This series contains:
* addition of AST2600, i.MX7ULP and F81803 watchdog support
* removal of the w90x900 and ks8695 drivers
* ziirave_wdt improvements
* small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit ad5e427e0f6b702e52c11d1f7b2b7be3bac7de82:

  Merge branch 'parisc-5.3-3' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux (2019-07-23 15:34:59 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.4-rc1

for you to fetch changes up to ca2fc5efffde5a3827adfb0ab6a51b6f1c64d5ff:

  watchdog: f71808e_wdt: Add F81803 support (2019-09-17 08:59:14 +0200)

----------------------------------------------------------------
linux-watchdog 5.4-rc1 tag

----------------------------------------------------------------
Andrey Smirnov (22):
      watchdog: ziirave_wdt: Add missing newline
      watchdog: ziirave_wdt: Be verbose about errors in probe()
      watchdog: ziirave_wdt: Be more verbose during firmware update
      watchdog: ziirave_wdt: Don't bail out on unexpected timeout value
      watchdog: ziirave_wdt: Log bootloader/firmware info during probe
      watchdog: ziirave_wdt: Simplify ziirave_firm_write_pkt()
      watchdog: ziirave_wdt: Check packet length only once
      watchdog: ziirave_wdt: Skip zeros when calculating checksum
      watchdog: ziirave_wdt: Fix incorrect use of ARRAY_SIZE
      watchdog: ziirave_wdt: Zero out only what's necessary
      watchdog: ziirave_wdt: Make use of put_unaligned_le16
      watchdog: ziirave_wdt: Don't check if ihex record length is zero
      watchdog: ziirave_wdt: Don't read out more than 'len' firmware bytes
      watchdog: ziirave_wdt: Don't try to program readonly flash
      watchdog: ziirave_wdt: Fix misleading error message
      watchdog: ziirave_wdt: Fix JUMP_TO_BOOTLOADER payload
      watchdog: ziirave_wdt: Fix DOWNLOAD_END payload
      watchdog: ziirave_wdt: Fix RESET_PROCESSOR payload
      watchdog: ziirave_wdt: Drop status polling code
      watchdog: ziirave_wdt: Fix DOWNLOAD_START payload
      watchdog: ziirave_wdt: Drop ziirave_firm_write_block_data()
      watchdog: ziirave_wdt: Update checked I2C functionality mask

Anson Huang (3):
      watchdog: imx_sc: Remove unnecessary error log
      dt-bindings: watchdog: Add i.MX7ULP bindings
      watchdog: Add i.MX7ULP watchdog support

Arnd Bergmann (4):
      watchdog: pnx4008_wdt: allow compile-testing
      watchdog: remove ks8695 driver
      watchdog: remove w90x900 driver
      watchdog: cpwd: use generic compat_ptr_ioctl

Chris Packham (1):
      watchdog: orion_wdt: use timer1 as a pretimeout

Christophe JAILLET (1):
      watchdog: ath79_wdt: fix a typo in the name of a function

Guenter Roeck (1):
      watchdog: diag288_wdt: Remove leftover includes from conversion to watchdog API

Gustavo A. R. Silva (5):
      watchdog: Mark expected switch fall-throughs
      watchdog: scx200_wdt: Mark expected switch fall-through
      watchdog: wdt977: Mark expected switch fall-through
      watchdog: riowd: Mark expected switch fall-through
      watchdog: jz4740: Fix unused variable warning in jz4740_wdt_probe

Ivan Mikhaylov (2):
      watchdog: aspeed: add support for dual boot
      watchdog: apseed: Add access_cs0 option for alt-boot

Jaret Cantu (1):
      watchdog: f71808e_wdt: Add F81803 support

Joel Stanley (1):
      dt-bindings: watchdog: Add ast2600 compatible

Jorge Ramirez-Ortiz (2):
      watchdog: qcom: support pre-timeout when the bark irq is available
      watchdog: qcom: remove unnecessary variable from private storage

Maxime Ripard (4):
      dt-bindings: watchdog: Add YAML schemas for the generic watchdog bindings
      dt-bindings: watchdog: Convert Allwinner watchdog to a schema
      dt-bindings: watchdog: sun4i: Add the watchdog interrupts
      dt-bindings: watchdog: sun4i: Add the watchdog clock

Oliver Graute (1):
      watchdog: imx_sc: this patch just fixes whitespaces

Rasmus Villemoes (1):
      watchdog: imx2_wdt: fix min() calculation in imx2_wdt_set_timeout

Ryan Chen (1):
      watchdog: aspeed: Add support for AST2600

Stephen Boyd (1):
      watchdog: Remove dev_err() usage after platform_get_irq()

 Documentation/ABI/testing/sysfs-class-watchdog     |  34 ++
 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |  58 ++++
 .../devicetree/bindings/watchdog/aspeed-wdt.txt    |   1 +
 .../bindings/watchdog/fsl-imx7ulp-wdt.txt          |  22 ++
 .../devicetree/bindings/watchdog/sunxi-wdt.txt     |  22 --
 .../devicetree/bindings/watchdog/watchdog.yaml     |  26 ++
 Documentation/watchdog/watchdog-parameters.rst     |  19 --
 drivers/watchdog/Kconfig                           |  35 +-
 drivers/watchdog/Makefile                          |   3 +-
 drivers/watchdog/ar7_wdt.c                         |   1 +
 drivers/watchdog/aspeed_wdt.c                      |  69 +++-
 drivers/watchdog/ath79_wdt.c                       |   4 +-
 drivers/watchdog/cpwd.c                            |  25 +-
 drivers/watchdog/diag288_wdt.c                     |   3 -
 drivers/watchdog/f71808e_wdt.c                     |  17 +-
 drivers/watchdog/imx2_wdt.c                        |   4 +-
 drivers/watchdog/imx7ulp_wdt.c                     | 243 ++++++++++++++
 drivers/watchdog/imx_sc_wdt.c                      |   9 +-
 drivers/watchdog/jz4740_wdt.c                      |   1 -
 drivers/watchdog/ks8695_wdt.c                      | 319 -------------------
 drivers/watchdog/nuc900_wdt.c                      | 302 ------------------
 drivers/watchdog/orion_wdt.c                       |  66 +++-
 drivers/watchdog/pcwd.c                            |   2 +-
 drivers/watchdog/pnx4008_wdt.c                     |   1 -
 drivers/watchdog/qcom-wdt.c                        |  84 ++++-
 drivers/watchdog/riowd.c                           |   2 +-
 drivers/watchdog/sb_wdog.c                         |   1 +
 drivers/watchdog/scx200_wdt.c                      |   1 +
 drivers/watchdog/sprd_wdt.c                        |   4 +-
 drivers/watchdog/wdt.c                             |   2 +-
 drivers/watchdog/wdt977.c                          |   2 +-
 drivers/watchdog/ziirave_wdt.c                     | 351 ++++++++++-----------
 32 files changed, 797 insertions(+), 936 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/watchdog.yaml
 create mode 100644 drivers/watchdog/imx7ulp_wdt.c
 delete mode 100644 drivers/watchdog/ks8695_wdt.c
 delete mode 100644 drivers/watchdog/nuc900_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.

