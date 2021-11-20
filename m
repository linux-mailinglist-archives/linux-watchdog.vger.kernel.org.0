Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586CF457F2F
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Nov 2021 16:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbhKTQA3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Nov 2021 11:00:29 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:44942 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236636AbhKTQA2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Nov 2021 11:00:28 -0500
Received: from [77.244.183.192] (port=64374 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1moSjy-000Dxh-VF; Sat, 20 Nov 2021 16:57:23 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 0/9] Add MAX77714 PMIC minimal driver (RTC and watchdog only)
Date:   Sat, 20 Nov 2021 16:56:58 +0100
Message-Id: <20211120155707.4019487-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

this series adds minimal drivers for the Maxim Semiconductor MAX77714
(https://www.maximintegrated.com/en/products/power/power-management-ics/MAX77714.html).
Only RTC and watchdog are implemented by these patches.

All implemented functionality is tested and working: RTC read/write,
watchdog start/stop/ping/set_timeout.

Patches 1-3 + 6 are trivial cleanups to the max77686 drivers and Kconfig
indentation and can probably be applied easily.

Patches 4, 5, 7, 8 and 9 add: dt bindings, mfd driver, watchdog driver and
rtc driver.

Changes in v4:
 - do not add a new wdog driver for MAX77714, extend the MAX77620 wdog
   driver; this means removing v3 patch 7, now replaced by patches 7+8
 - added review tags

Changes in v3:
 - fixed all issues reported on v1 patches
 - removed patch 1 of v2, already applied
   ("mfd: max77686: Correct tab-based alignment of register addresses")

Changes in v2:
 - fixed all issues reported on v1 patches
 - added patch 7 ("watchdog: Kconfig: fix help text indentation")
 - additional minor improvements

Luca

Luca Ceresoli (9):
  rtc: max77686: convert comments to kernel-doc format
  rtc: max77686: rename day-of-month defines
  rtc: max77686: remove unused code to read in 12-hour mode
  dt-bindings: mfd: add Maxim MAX77714 PMIC
  mfd: max77714: Add driver for Maxim MAX77714 PMIC
  watchdog: Kconfig: fix help text indentation
  watchdog: max77620: add support for the max77714 variant
  watchdog: max77620: add comment to clarify set_timeout procedure
  rtc: max77686: add MAX77714 support

 .../bindings/mfd/maxim,max77714.yaml          |  68 ++++++++
 MAINTAINERS                                   |   7 +
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/max77686.c                        |   2 +-
 drivers/mfd/max77714.c                        | 152 ++++++++++++++++++
 drivers/rtc/Kconfig                           |   2 +-
 drivers/rtc/rtc-max77686.c                    |  75 +++++----
 drivers/watchdog/Kconfig                      |  50 +++---
 drivers/watchdog/max77620_wdt.c               | 101 +++++++++---
 include/linux/mfd/max77686-private.h          |   4 +-
 include/linux/mfd/max77714.h                  |  60 +++++++
 12 files changed, 455 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
 create mode 100644 drivers/mfd/max77714.c
 create mode 100644 include/linux/mfd/max77714.h

-- 
2.25.1

