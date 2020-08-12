Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B5F242994
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 14:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgHLMoi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 08:44:38 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:44182 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgHLMoh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 08:44:37 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Aug 2020 08:44:37 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 395C3407AF; Wed, 12 Aug 2020 13:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 395C3407AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1597232343;
        bh=eJ+9TxHv79OCcPjS6SyOF3HAI3s+kCWErgOfkJljAfs=;
        h=Date:From:To:Cc:Subject:From;
        b=azM+OjDWCqJnQJ/XZIFmBgKsS2VUkScXNYF+oKHDN3ExviVkGh+LjtKW1ijtvykll
         zaeZ6tng3eCq13X7OvJd4LOfNPcOZfg8WtgLspR/RQzWPzC+3eEvSkt1UUz1ORgk6j
         PMD4wGwpBZjiz8FxbrA27kBKDV1l0O50EgPab77c=
Date:   Wed, 12 Aug 2020 13:39:03 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Bumsik Kim <kbumsik@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Krzysztof Sobota <krzysztof.sobota@nokia.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Martin Wu <wuyan@allwinnertech.com>,
        Michael Shych <michaelsh@mellanox.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tero Kristo <t-kristo@ti.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Timothy Myers <timothy.myers@adtran.com>,
        Wang Qing <wangqing@vivo.com>, Woody Lin <woodylin@google.com>,
        Xu Wang <vulab@iscas.ac.cn>
Subject: [GIT PULL REQUEST] watchdog - v5.9 Merge window
Message-ID: <20200812113903.GA14481@www.linux-watchdog.org>
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
* f71808e_wdt imporvements
* dw_wdt improvements
* mlx-wdt: support new watchdog type with longer timeout period
* fallthrough pseudo-keyword replacements
* overall small fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.9-rc1

for you to fetch changes up to d5b29c2c5ba2bd5bbdb5b744659984185d17d079:

  watchdog: rti-wdt: balance pm runtime enable calls (2020-08-05 18:43:03 +0200)

----------------------------------------------------------------
linux-watchdog 5.9-rc1 tag

----------------------------------------------------------------
Ahmad Fatoum (5):
      docs: watchdog: codify ident.options as superset of possible status flags
      watchdog: f71808e_wdt: indicate WDIOF_CARDRESET support in watchdog_info.options
      watchdog: f71808e_wdt: remove use of wrong watchdog_info option
      watchdog: f71808e_wdt: clear watchdog timeout occurred flag
      watchdog: f71808e_wdt: do stricter parameter validation

Alexander A. Klimov (1):
      watchdog: Replace HTTP links with HTTPS ones

Bumsik Kim (1):
      watchdog: test_bit() => watchdog_active()

Gustavo A. R. Silva (2):
      watchdog: Use fallthrough pseudo-keyword
      watchdog: scx200_wdt: Use fallthrough pseudo-keyword

Krzysztof Sobota (1):
      watchdog: initialize device before misc_register

Lad Prabhakar (1):
      dt-bindings: watchdog: renesas,wdt: Document r8a774e1 support

Lukas Bulwahn (1):
      MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER

Martin Wu (1):
      watchdog: sunxi_wdt: fix improper error exit code

Michael Shych (4):
      platform_data/mlxreg: support new watchdog type with longer timeout period
      platform/x86: mlx-platform: support new watchdog type with longer timeout
      watchdog: mlx-wdt: support new watchdog type with longer timeout period
      docs: watchdog: mlx-wdt: Add description of new watchdog type 3

Sai Prakash Ranjan (2):
      dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
      dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845, SM8150

Serge Semin (7):
      dt-bindings: watchdog: Convert DW WDT binding to DT schema
      dt-bindings: watchdog: dw-wdt: Support devices with asynch clocks
      dt-bindings: watchdog: dw-wdt: Add watchdog TOPs array property
      watchdog: dw_wdt: Support devices with non-fixed TOP values
      watchdog: dw_wdt: Support devices with asynch clocks
      watchdog: dw_wdt: Add pre-timeouts support
      watchdog: dw_wdt: Add DebugFS files

Tero Kristo (4):
      watchdog: use __watchdog_ping in startup
      watchdog: add support for adjusting last known HW keepalive time
      watchdog: rti-wdt: attach to running watchdog during probe
      watchdog: rti-wdt: balance pm runtime enable calls

Tiezhu Yang (1):
      watchdog: bcm_kona_wdt: Use correct return value for bcm_kona_wdt_probe()

Timothy Myers (1):
      watchdog: booke_wdt: Add common nowayout parameter driver

Wang Qing (1):
      watchdog: Use kobj_to_dev() API

Woody Lin (1):
      watchdog: softdog: Add options 'soft_reboot_cmd' and 'soft_active_on_boot'

Xu Wang (1):
      watchdog: pcwd_usb: remove needless check before usb_free_coherent()

 .../devicetree/bindings/watchdog/davinci-wdt.txt   |   4 +-
 .../devicetree/bindings/watchdog/dw_wdt.txt        |  24 --
 .../devicetree/bindings/watchdog/qcom-wdt.txt      |  28 --
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  48 +++
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |   1 +
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |  90 +++++
 Documentation/watchdog/mlx-wdt.rst                 |  10 +
 Documentation/watchdog/watchdog-api.rst            |   2 +-
 Documentation/watchdog/watchdog-kernel-api.rst     |  12 +
 MAINTAINERS                                        |   2 +-
 drivers/platform/x86/mlx-platform.c                | 106 +++++
 drivers/watchdog/Kconfig                           |   2 +-
 drivers/watchdog/advantechwdt.c                    |   2 +-
 drivers/watchdog/alim1535_wdt.c                    |   2 +-
 drivers/watchdog/alim7101_wdt.c                    |   2 +-
 drivers/watchdog/ar7_wdt.c                         |   3 +-
 drivers/watchdog/ath79_wdt.c                       |   2 +-
 drivers/watchdog/bcm_kona_wdt.c                    |   2 +-
 drivers/watchdog/booke_wdt.c                       |   6 +-
 drivers/watchdog/dw_wdt.c                          | 439 +++++++++++++++++++--
 drivers/watchdog/eurotechwdt.c                     |   2 +-
 drivers/watchdog/f71808e_wdt.c                     |  54 ++-
 drivers/watchdog/gef_wdt.c                         |   2 +-
 drivers/watchdog/geodewdt.c                        |   2 +-
 drivers/watchdog/ib700wdt.c                        |   2 +-
 drivers/watchdog/it8712f_wdt.c                     |   2 +-
 drivers/watchdog/ixp4xx_wdt.c                      |   2 +-
 drivers/watchdog/m54xx_wdt.c                       |   2 +-
 drivers/watchdog/machzwd.c                         |   2 +-
 drivers/watchdog/mlx_wdt.c                         |  73 +++-
 drivers/watchdog/mv64x60_wdt.c                     |   2 +-
 drivers/watchdog/nv_tco.c                          |   4 +-
 drivers/watchdog/nv_tco.h                          |   2 +-
 drivers/watchdog/pc87413_wdt.c                     |   2 +-
 drivers/watchdog/pcwd.c                            |   2 +-
 drivers/watchdog/pcwd_pci.c                        |   2 +-
 drivers/watchdog/pcwd_usb.c                        |   7 +-
 drivers/watchdog/rc32434_wdt.c                     |   2 +-
 drivers/watchdog/riowd.c                           |   2 +-
 drivers/watchdog/rti_wdt.c                         | 114 +++++-
 drivers/watchdog/sa1100_wdt.c                      |   2 +-
 drivers/watchdog/sb_wdog.c                         |   2 +-
 drivers/watchdog/sbc60xxwdt.c                      |   2 +-
 drivers/watchdog/sbc7240_wdt.c                     |   2 +-
 drivers/watchdog/sbc_fitpc2_wdt.c                  |   2 +-
 drivers/watchdog/sc520_wdt.c                       |   2 +-
 drivers/watchdog/sch311x_wdt.c                     |   2 +-
 drivers/watchdog/scx200_wdt.c                      |   2 +-
 drivers/watchdog/smsc37b787_wdt.c                  |   2 +-
 drivers/watchdog/softdog.c                         |  57 +++
 drivers/watchdog/sp5100_tco.c                      |   2 +-
 drivers/watchdog/sunxi_wdt.c                       |   2 +-
 drivers/watchdog/w83877f_wdt.c                     |   2 +-
 drivers/watchdog/w83977f_wdt.c                     |   2 +-
 drivers/watchdog/wafer5823wdt.c                    |   2 +-
 drivers/watchdog/watchdog_dev.c                    |  73 +++-
 drivers/watchdog/wdt.c                             |   2 +-
 drivers/watchdog/wdt285.c                          |   2 +-
 drivers/watchdog/wdt977.c                          |   2 +-
 drivers/watchdog/wdt_pci.c                         |   2 +-
 include/linux/platform_data/mlxreg.h               |   5 +-
 include/linux/watchdog.h                           |   2 +
 62 files changed, 1032 insertions(+), 210 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
----------------------------------------------------------------

Kind regards,
Wim.

