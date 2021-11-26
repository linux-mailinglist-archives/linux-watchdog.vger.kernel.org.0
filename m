Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC93845EFD1
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 15:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhKZO2C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 09:28:02 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:57752 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240922AbhKZO0C (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 09:26:02 -0500
X-Greylist: delayed 713 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 09:26:01 EST
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQEAVDo014275
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 15:10:31 +0100
Received: from localhost.localdomain ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQEAUXF030519;
        Fri, 26 Nov 2021 15:10:30 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Henning Schild <henning.schild@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
Subject: [PATCH v4 0/4] add device drivers for Siemens Industrial PCs
Date:   Fri, 26 Nov 2021 15:10:23 +0100
Message-Id: <20211126141027.16161-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

changes since v3:

- fix io access width and region reservations
- fix style in p1

changes since v2:

- remove "simatic-ipc" prefix from LED names
- fix style issues found in v2, mainly LED driver
- fix OEM specific dmi code, and remove magic numbers
- more "simatic_ipc" name prefixing
- improved pmc quirk code using callbacks

changes since v1:

- fixed lots of style issues found in v1
  - (debug) printing
  - header ordering
- fixed license issues GPLv2 and SPDX in all files
- module_platform_driver instead of __init __exit
- wdt simplifications cleanup
- lots of fixes in wdt driver, all that was found in v1
- fixed dmi length in dmi helper
- changed LED names to allowed ones
- move led driver to simple/
- switched pmc_atom to dmi callback with global variable


This series adds support for watchdogs and leds of several x86 devices
from Siemens.

It is structured with a platform driver that mainly does identification
of the machines. It might trigger loading of the actual device drivers
by attaching devices to the platform bus.

The identification is vendor specific, parsing a special binary DMI
entry. The implementation of that platform identification is applied on
pmc_atom clock quirks in the final patch.

It is all structured in a way that we can easily add more devices and
more platform drivers later. Internally we have some more code for
hardware monitoring, more leds, watchdogs etc. This will follow some
day.

Henning Schild (4):
  platform/x86: simatic-ipc: add main driver for Siemens devices
  leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
  watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
  platform/x86: pmc_atom: improve critclk_systems matching for Siemens
    PCs

 drivers/leds/Kconfig                          |   3 +
 drivers/leds/Makefile                         |   3 +
 drivers/leds/simple/Kconfig                   |  11 +
 drivers/leds/simple/Makefile                  |   2 +
 drivers/leds/simple/simatic-ipc-leds.c        | 202 ++++++++++++++++
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/pmc_atom.c               |  54 +++--
 drivers/platform/x86/simatic-ipc.c            | 168 +++++++++++++
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/simatic-ipc-wdt.c            | 228 ++++++++++++++++++
 .../platform_data/x86/simatic-ipc-base.h      |  29 +++
 include/linux/platform_data/x86/simatic-ipc.h |  72 ++++++
 14 files changed, 778 insertions(+), 21 deletions(-)
 create mode 100644 drivers/leds/simple/Kconfig
 create mode 100644 drivers/leds/simple/Makefile
 create mode 100644 drivers/leds/simple/simatic-ipc-leds.c
 create mode 100644 drivers/platform/x86/simatic-ipc.c
 create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
 create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
 create mode 100644 include/linux/platform_data/x86/simatic-ipc.h

-- 
2.32.0

