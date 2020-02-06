Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BC5154D03
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 21:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBFUhB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 15:37:01 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:50056 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgBFUhA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 15:37:00 -0500
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 47C7D4065D; Thu,  6 Feb 2020 20:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 47C7D4065D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1581018457;
        bh=UDRkZMKHbV1Ws+6JHIMGt7Ei1nb/ogRNQru6w0+tZXI=;
        h=Date:From:To:Cc:Subject:From;
        b=UkIqrxpjYMqxSpmlNdNmfr3iWoBr+ou8d7kmtu7k8f0Fzm9rNyTXop3ZNJFtA0XIl
         3gkGyOHYXadfmyfUZSeX/gQDXIu3Dw1Nme/XeJNSP1jug8wWeQje1QO2+EIiPqzFXO
         OFTngwMkIlSg7JqUuli/qP6lScQ5XXd0mhRVeIos=
Date:   Thu, 6 Feb 2020 20:47:37 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christophe Roullier <christophe.roullier@st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Jack Mitchell <ml@embed.me.uk>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Vincent Prince <Vincent.PRINCE.fr@gmail.com>,
        Vladis Dronov <vdronov@redhat.com>,
        Wang@www.linux-watchdog.org,
        "Peng 1." <peng.1.wang@nokia-sbell.com>,
        "yong.liang" <yong.liang@mediatek.com>
Subject: [GIT PULL REQUEST] watchdog - v5.6 Merge window
Message-ID: <20200206194737.GA12072@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.6 release cycle.

This series contains:
* add IT8786 chipset
* addition of sam9x60 compatible watchdog
* da9062 improvements
* fix UAF in reboot notifier handling in watchdog core code
* other fixes and small improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit d5226fa6dbae0569ee43ecfc08bdcd6770fc4755:

  Linux 5.5 (2020-01-26 16:23:03 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.6-rc1

for you to fetch changes up to 057b52b4b3d58f4ee5944171da50f77b00a1bb0d:

  watchdog: da9062: make restart handler atomic safe (2020-01-27 15:55:49 +0100)

----------------------------------------------------------------
linux-watchdog 5.6-rc1 tag

----------------------------------------------------------------
Christophe Roullier (1):
      drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at probe

Eugen Hristev (1):
      watchdog: sama5d4_wdt: addition of sam9x60 compatible watchdog

Jack Mitchell (1):
      watchdog: dw_wdt: ping watchdog to reset countdown before start

Marco Felsch (3):
      watchdog: da9062: add power management ops
      dt-bindings: watchdog: da9062: add suspend disable option
      watchdog: da9062: make restart handler atomic safe

Sai Prakash Ranjan (1):
      watchdog: qcom: Use platform_get_irq_optional() for bark irq

Srinivas Neeli (1):
      watchdog: cadence: Skip printing pointer value

Vincent Prince (1):
      watchdog: it87_wdt: add IT8786 ID

Vladis Dronov (1):
      watchdog: fix UAF in reboot notifier handling in watchdog core code

Wang, Peng 1. (NSB - CN/Hangzhou) (1):
      watchdog: make DesignWare watchdog allow users to set bigger timeout value

yong.liang (4):
      dt-bindings: mediatek: mt8183: Add #reset-cells
      dt-bindings: mediatek: mt2712: Add #reset-cells
      watchdog: mtk_wdt: mt8183: Add reset controller
      watchdog: mtk_wdt: mt2712: Add reset controller

 .../devicetree/bindings/watchdog/da9062-wdt.txt    |   5 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  11 ++-
 drivers/watchdog/at91sam9_wdt.h                    |  21 ++++
 drivers/watchdog/cadence_wdt.c                     |   5 +-
 drivers/watchdog/da9062_wdt.c                      |  35 ++++++-
 drivers/watchdog/dw_wdt.c                          |  11 ++-
 drivers/watchdog/it87_wdt.c                        |   2 +
 drivers/watchdog/mtk_wdt.c                         | 105 +++++++++++++++++++-
 drivers/watchdog/qcom-wdt.c                        |   2 +-
 drivers/watchdog/sama5d4_wdt.c                     | 109 ++++++++++++++++-----
 drivers/watchdog/stm32_iwdg.c                      |  18 ++++
 drivers/watchdog/watchdog_core.c                   |  35 +++++++
 drivers/watchdog/watchdog_dev.c                    |  36 +------
 .../dt-bindings/reset-controller/mt2712-resets.h   |  22 +++++
 .../dt-bindings/reset-controller/mt8183-resets.h   |  17 ++++
 15 files changed, 361 insertions(+), 73 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
----------------------------------------------------------------

Kind regards,
Wim.

