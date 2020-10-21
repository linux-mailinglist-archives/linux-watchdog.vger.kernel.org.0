Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F66294E34
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Oct 2020 16:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442492AbgJUOES (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Oct 2020 10:04:18 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:57616 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408649AbgJUOER (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Oct 2020 10:04:17 -0400
X-Greylist: delayed 385 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Oct 2020 10:04:16 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 1C51F409D1; Wed, 21 Oct 2020 14:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 1C51F409D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1603284852;
        bh=rjLz8mwAsXJaWhGyNjOf3M6mUivfxkBBlu0Bz0MlcAA=;
        h=Date:From:To:Cc:Subject:From;
        b=tU854NnJdhtqTGrhNF5p5AvlF5HqIFp4r4o1hc/N+UNVCHpKe7KifBfT+jzjba//T
         ZB35Nc/B0UThEh5r3H8gyCXr46inOmVWnzMhk4IeLz+KA+5OOpZvlw9awEfPdDr/eG
         Rfg1dBaRt2hyyrkETB/RST//UijjC58pMC5eFhzg=
Date:   Wed, 21 Oct 2020 14:54:11 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Hanspeter Portner <dev@open-music-kontrollers.ch>,
        Hanspeter Portner <hanspeter.portner@livesystems.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhen Lei <thunder.leizhen@huawei.com>
Subject: [GIT PULL REQUEST] watchdog - v5.10 Merge window
Message-ID: <20201021125411.GA12717@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.10 release cycle.

This series contains:
* Add Toshiba Visconti watchdog driver
* it87_wdt: add IT8772 + IT8784
* several fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit a1b8638ba1320e6684aa98233c15255eb803fac7:

  Linux 5.9-rc7 (2020-09-27 14:38:10 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.10-rc1

for you to fetch changes up to c5b8e4644607b0319fd86a36fb0caad54ee2021e:

  watchdog: Add Toshiba Visconti watchdog driver (2020-10-14 15:22:58 +0200)

----------------------------------------------------------------
linux-watchdog 5.10-rc1 tag

----------------------------------------------------------------
Anson Huang (2):
      watchdog: imx7ulp: Strictly follow the sequence for wdog operations
      watchdog: imx7ulp: Watchdog should continue running for wait/stop mode

Christophe JAILLET (1):
      watchdog: pcwd_usb: Avoid GFP_ATOMIC where it is not needed

Dinghao Liu (2):
      watchdog: Fix memleak in watchdog_cdev_register
      watchdog: Use put_device on error

Guenter Roeck (2):
      watchdog: sp5100: Fix definition of EFCH_PM_DECODEEN3
      watchdog: sp5100_tco: Enable watchdog on Family 17h devices if disabled

Hanspeter Portner (2):
      watchdog: it87_wdt: add IT8772 ID
      watchdog: it87_wdt: add IT8784 ID

Krzysztof Kozlowski (3):
      watchdog: cadence: Simplify with dev_err_probe()
      watchdog: davinci: Simplify with dev_err_probe()
      watchdog: rti: Simplify with dev_err_probe()

Madhuparna Bhowmik (1):
      drivers: watchdog: rdc321x_wdt: Fix race condition bugs

Nobuhiro Iwamatsu (2):
      watchdog: bindings: Add binding documentation for Toshiba Visconti watchdog device
      watchdog: Add Toshiba Visconti watchdog driver

Wolfram Sang (1):
      watchdog: renesas_wdt: support handover from bootloader

Zhen Lei (1):
      watchdog: remove unneeded inclusion of <uapi/linux/sched/types.h>

 .../bindings/watchdog/toshiba,visconti-wdt.yaml    |  54 ++++++
 drivers/watchdog/Kconfig                           |   8 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/cadence_wdt.c                     |   9 +-
 drivers/watchdog/davinci_wdt.c                     |   9 +-
 drivers/watchdog/imx7ulp_wdt.c                     |  79 +++++++--
 drivers/watchdog/it87_wdt.c                        |   6 +-
 drivers/watchdog/pcwd_usb.c                        |   2 +-
 drivers/watchdog/rdc321x_wdt.c                     |   5 +-
 drivers/watchdog/renesas_wdt.c                     |  12 +-
 drivers/watchdog/rti_wdt.c                         |  14 +-
 drivers/watchdog/sp5100_tco.c                      |  18 ++
 drivers/watchdog/sp5100_tco.h                      |   2 +-
 drivers/watchdog/visconti_wdt.c                    | 195 +++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c                    |   8 +-
 15 files changed, 374 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
 create mode 100644 drivers/watchdog/visconti_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.

