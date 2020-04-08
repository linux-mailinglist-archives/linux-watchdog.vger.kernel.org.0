Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1311A1EC2
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Apr 2020 12:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDHK1h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Apr 2020 06:27:37 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:33188 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgDHK1h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Apr 2020 06:27:37 -0400
X-Greylist: delayed 467 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Apr 2020 06:27:36 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 2F644409E5; Wed,  8 Apr 2020 11:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 2F644409E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1586338023;
        bh=VOzQum+z/bArM7BjUmo6thZ+xFwIvAwR6O4velNsQqo=;
        h=Date:From:To:Cc:Subject:From;
        b=pZ8XIefn1emLE9xMV+JoG+3kGpmswKdMySQYzKX43ZwEHJY6FlCOdBiXY8OZM+O7L
         S7L8wVVmUrwILUz0aOYbrFcEKs80A6hqgvx/dms+XfGQXmwWBPHQ06xMQZUrhRGuMB
         UMzG3bw7kJZyDm11MWrJ0R5AUS2m690cwpXt+hQ8=
Date:   Wed, 8 Apr 2020 11:27:03 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Dmitry Safonov <dima@arista.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Tero Kristo <t-kristo@ti.com>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [GIT PULL REQUEST] watchdog - v5.7 Merge window
Message-ID: <20200408092702.GA27984@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.7 release cycle.

This series contains:
* Add TI K3 RTI watchdog
* Add stop_on_reboot parameter to control reboot policy
* wm831x_wdt: Remove GPIO handling
* Several small fixes, improvements and clean-ups

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.7-rc1

for you to fetch changes up to 2d63908bdbfbce0d98195b22236ad5105dc6eba2:

  watchdog: Add K3 RTI watchdog support (2020-04-01 11:35:23 +0200)

----------------------------------------------------------------
linux-watchdog 5.7-rc1 tag

----------------------------------------------------------------
Anson Huang (3):
      watchdog: imx_sc_wdt: Remove unused includes
      watchdog: imx7ulp: Remove unused include of init.h
      watchdog: imx2_wdt: Drop .remove callback

Ansuel Smith (1):
      watchdog: qcom-wdt: disable pretimeout on timer platform

Chris Packham (1):
      watchdog: orion: use 0 for unset heartbeat

Dmitry Safonov (1):
      watchdog: Add stop_on_reboot parameter to control reboot policy

Linus Walleij (1):
      watchdog: wm831x_wdt: Remove GPIO handling

Loic Poulain (1):
      watchdog: pm8916_wdt: Add system sleep callbacks

Lucas Stach (1):
      watchdog: ziirave_wdt: change name to be more specific

Stephen Boyd (1):
      watchdog: qcom: Use irq flags from firmware

Tero Kristo (3):
      watchdog: reset last_hw_keepalive time at start
      dt-bindings: watchdog: Add support for TI K3 RTI watchdog
      watchdog: Add K3 RTI watchdog support

Tomer Maimon (1):
      watchdog: npcm: remove whitespaces

 .../devicetree/bindings/watchdog/ti,rti-wdt.yaml   |  65 ++++++
 drivers/watchdog/Kconfig                           |   8 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/imx2_wdt.c                        |  37 +--
 drivers/watchdog/imx7ulp_wdt.c                     |   1 -
 drivers/watchdog/imx_sc_wdt.c                      |   2 -
 drivers/watchdog/npcm_wdt.c                        |  19 +-
 drivers/watchdog/orion_wdt.c                       |   2 +-
 drivers/watchdog/pm8916_wdt.c                      |  25 ++
 drivers/watchdog/qcom-wdt.c                        |  34 ++-
 drivers/watchdog/rti_wdt.c                         | 255 +++++++++++++++++++++
 drivers/watchdog/watchdog_core.c                   |  12 +
 drivers/watchdog/watchdog_dev.c                    |   1 +
 drivers/watchdog/wm831x_wdt.c                      |  27 ---
 drivers/watchdog/ziirave_wdt.c                     |   2 +-
 include/linux/mfd/wm831x/pdata.h                   |   1 -
 16 files changed, 412 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
 create mode 100644 drivers/watchdog/rti_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.

