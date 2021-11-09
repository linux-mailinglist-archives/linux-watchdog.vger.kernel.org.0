Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACB344B060
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238817AbhKIPdo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 10:33:44 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:39240 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236981AbhKIPdm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 10:33:42 -0500
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 5854040A08; Tue,  9 Nov 2021 15:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 5854040A08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1636466747;
        bh=Ca/EqhI6H4/tBr6sU9eDYFTOdR7fHeD62jwIH6GKZKI=;
        h=Date:From:To:Cc:Subject:From;
        b=gVFZfNhDBZRyY2dgzLxTt7A9smMhq2G7vyGuVY+MoZQ9yW/4HvIabQyxOlXv0IJl7
         JvV/RZhM/98KifQSaXVK0nbfCMZHScc5G/IfxrtDmVxQgnNnAtCkEwopQyaGY7qSG2
         XDJrnWIIsYJE8ny5Pb+QoaSqFtRJHOCu+iGI5d9k=
Date:   Tue, 9 Nov 2021 15:05:40 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Artem Lapkin <email2tema@gmail.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Fengquan Chen <Fengquan.Chen@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jackie Liu <liuyun01@kylinos.cn>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Primoz Fiser <primoz.fiser@norik.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Samuel Holland <samuel@sholland.org>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [GIT PULL REQUEST] watchdog - v5.16 Merge window
Message-ID: <20211109140540.GA29107@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.16 release cycle.

This series contains:
* f71808e_wdt: convert to watchdog framework
* db8500_wdt: Rename driver (was ux500_wdt.c)
* sunxi: Add compatibles for R329 and D1
* mtk: add disable_wdt_extrst support
* several other small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit cd004d8299f1dc6cfa6a4eea8f94cb45eaedf070:

  watchdog: Fix OMAP watchdog early handling (2021-10-26 20:22:51 +0200)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.16-rc1

for you to fetch changes up to c738888032ffafa1bbb971cd55b3d43b05b344cf:

  watchdog: db8500_wdt: Rename symbols (2021-11-01 20:18:09 +0100)

----------------------------------------------------------------
linux-watchdog 5.16-rc1 tag

----------------------------------------------------------------
Ahmad Fatoum (7):
      watchdog: f71808e_wdt: fix inaccurate report in WDIOC_GETTIMEOUT
      watchdog: f71808e_wdt: remove superfluous global
      watchdog: f71808e_wdt: constify static array
      watchdog: f71808e_wdt: rename variant-independent identifiers appropriately
      watchdog: f71808e_wdt: migrate to new kernel watchdog API
      watchdog: f71808e_wdt: refactor to platform device/driver pair
      watchdog: f71808e_wdt: dynamically allocate watchdog driver data

Artem Lapkin (2):
      watchdog: meson_gxbb_wdt: add nowayout parameter
      watchdog: meson_gxbb_wdt: add timeout parameter

Cai Huoqing (3):
      watchdog: ar7_wdt: Make use of the helper function devm_platform_ioremap_resource_byname()
      watchdog: iTCO_wdt: Make use of the helper function devm_platform_ioremap_resource()
      watchdog: rti-wdt: Make use of the helper function devm_platform_ioremap_resource()

Fengquan Chen (2):
      dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst support
      watchdog: mtk: add disable_wdt_extrst support

Geert Uytterhoeven (1):
      watchdog: rza_wdt: Use semicolons instead of commas

Jackie Liu (1):
      ar7: fix kernel builds for compiler test

Krzysztof Kozlowski (1):
      watchdog: s3c2410: describe driver in KConfig

Linus Walleij (3):
      watchdog: ux500_wdt: Drop platform data
      watchdog: db8500_wdt: Rename driver
      watchdog: db8500_wdt: Rename symbols

Lukas Bulwahn (1):
      watchdog: remove dead iop watchdog timer driver

Mika Westerberg (1):
      watchdog: iTCO_wdt: No need to stop the timer in probe

Philipp Zabel (1):
      watchdog: mlx-wdt: Use regmap_write_bits()

Primoz Fiser (1):
      watchdog: da9062: da9063: prevent pings ahead of machine reset

Rafał Miłecki (1):
      watchdog: bcm63xx_wdt: fix fallthrough warning

Samuel Holland (3):
      dt-bindings: watchdog: sunxi: Add compatibles for R329
      dt-bindings: watchdog: sunxi: Add compatibles for D1
      watchdog: sunxi_wdt: Add support for D1

Tang Bin (1):
      watchdog: stm32_iwdg: drop superfluous error message

Thomas Weißschuh (1):
      watchdog: sp5100_tco: Add support for get_timeleft

 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |  48 +-
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |   2 +
 drivers/mfd/db8500-prcmu.c                         |  13 +-
 drivers/watchdog/Kconfig                           |  35 +-
 drivers/watchdog/Makefile                          |   3 +-
 drivers/watchdog/ar7_wdt.c                         |   6 +-
 drivers/watchdog/bcm63xx_wdt.c                     |   2 +
 drivers/watchdog/da9062_wdt.c                      |   7 +
 drivers/watchdog/da9063_wdt.c                      |   7 +
 drivers/watchdog/{ux500_wdt.c => db8500_wdt.c}     |  89 ++-
 drivers/watchdog/f71808e_wdt.c                     | 615 +++++++--------------
 drivers/watchdog/iTCO_wdt.c                        |  19 +-
 drivers/watchdog/iop_wdt.c                         | 250 ---------
 drivers/watchdog/meson_gxbb_wdt.c                  |  12 +
 drivers/watchdog/mlx_wdt.c                         |   5 +-
 drivers/watchdog/mtk_wdt.c                         |   7 +
 drivers/watchdog/rti_wdt.c                         |   4 +-
 drivers/watchdog/rza_wdt.c                         |   4 +-
 drivers/watchdog/sp5100_tco.c                      |   9 +
 drivers/watchdog/stm32_iwdg.c                      |   4 +-
 drivers/watchdog/sunxi_wdt.c                       |  20 +-
 include/linux/platform_data/ux500_wdt.h            |  18 -
 22 files changed, 384 insertions(+), 795 deletions(-)
 rename drivers/watchdog/{ux500_wdt.c => db8500_wdt.c} (54%)
 delete mode 100644 drivers/watchdog/iop_wdt.c
 delete mode 100644 include/linux/platform_data/ux500_wdt.h
----------------------------------------------------------------

Kind regards,
Wim.

