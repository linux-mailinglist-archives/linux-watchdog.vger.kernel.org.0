Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B461ECEF7
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jun 2020 13:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFCLtd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Jun 2020 07:49:33 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:51132 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCLtc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Jun 2020 07:49:32 -0400
X-Greylist: delayed 498 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Jun 2020 07:49:32 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 398F4409DB; Wed,  3 Jun 2020 12:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 398F4409DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1591181121;
        bh=GZUVWstdXkI+h/i93KPfb8kDZBh1tszMSwwt+h9Hi7U=;
        h=Date:From:To:Cc:Subject:From;
        b=ZGL6/2IuOUBQx4dagp8i1lGa6/vSgFM9hcTjxRo58jzxlZ7mnlE0H7rVamp2qsRkY
         Zijd4jKIDAkJc/KNvy9C0Nhp4jq+f37Ds0XYdxvh6hGIeUTp0e08nrl7PaRGrf18sE
         ulMbgwWaT5sZ2JS04D7xkL037gpjAQAcDdriyu4c=
Date:   Wed, 3 Jun 2020 12:45:21 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, Bumsik Kim <kbumsik@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Evan Benn <evanbenn@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jason Yan <yanaijie@huawei.com>,
        Julius Werner <jwerner@chromium.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shyam Saini <mayhs11saini@gmail.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Subject: [GIT PULL REQUEST] watchdog - v5.8 Merge window
Message-ID: <20200603104521.GA14826@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.8 release cycle.

This series contains:
* Add new arm_smc_wdt watchdog driver
* da9062 and da9063 improvements
* Clarify documentation about stop() that became optional
* Document r8a7742 support
* some overall fixes and improvements

Please also note that Stephen Rothwell reported a conflict between the device tree and the watchdog tree on Tue, 26 May 2020 15:20:15 +1000.
He fixed it with the following patch:
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 27e8c4accd67..572f4c912fef 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -24,6 +24,7 @@ properties:

       - items:
           - enum:
+              - renesas,r8a7742-wdt      # RZ/G1H
               - renesas,r8a7743-wdt      # RZ/G1M
               - renesas,r8a7744-wdt      # RZ/G1N
               - renesas,r8a7745-wdt      # RZ/G1E
---

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.8-rc1

for you to fetch changes up to 072cb8b628d312f5785ffdf324286a0519aed910:

  watchdog: m54xx: Add missing include (2020-05-25 08:55:47 +0200)

----------------------------------------------------------------
linux-watchdog 5.8-rc1 tag

----------------------------------------------------------------
Arnd Bergmann (1):
      watchdog: iTCO: fix link error

Bumsik Kim (1):
      watchdog: clarify that stop() is optional

Dinghao Liu (1):
      watchdog: Fix runtime PM imbalance on error

Evan Benn (1):
      dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog

Fabio Estevam (1):
      watchdog: imx_sc_wdt: Fix reboot on crash

Jason Yan (1):
      watchdog: riowd: remove unneeded semicolon

Julius Werner (1):
      watchdog: Add new arm_smc_wdt watchdog driver

Lad Prabhakar (1):
      dt-bindings: watchdog: renesas,wdt: Document r8a7742 support

Shyam Saini (1):
      watchdog: ts72xx_wdt: fix build error

Stefan Riedmueller (3):
      watchdog: da9062: Initialize timeout during probe
      watchdog: da9063: Make use of pre-configured timeout during probe
      watchdog: da9062: No need to ping manually before setting timeout

Thomas Gleixner (1):
      watchdog: m54xx: Add missing include

Wolfram Sang (1):
      watchdog: imx2_wdt: update contact email

 .../devicetree/bindings/watchdog/arm-smc-wdt.yaml  |  37 ++++
 .../devicetree/bindings/watchdog/renesas,wdt.txt   |   1 +
 .../watchdog/convert_drivers_to_kernel_api.rst     |   2 +-
 Documentation/watchdog/watchdog-kernel-api.rst     |   2 +-
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/watchdog/Kconfig                           |  15 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/arm_smc_wdt.c                     | 188 +++++++++++++++++++++
 drivers/watchdog/da9062_wdt.c                      |  32 ++--
 drivers/watchdog/da9063_wdt.c                      |  20 ++-
 drivers/watchdog/imx2_wdt.c                        |   2 +-
 drivers/watchdog/imx_sc_wdt.c                      |   5 +
 drivers/watchdog/m54xx_wdt.c                       |   1 +
 drivers/watchdog/omap_wdt.c                        |   1 +
 drivers/watchdog/riowd.c                           |   2 +-
 include/linux/watchdog.h                           |   4 +-
 17 files changed, 299 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 create mode 100644 drivers/watchdog/arm_smc_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.

