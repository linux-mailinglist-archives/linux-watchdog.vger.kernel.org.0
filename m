Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE65034D65C
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 19:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhC2RzT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 13:55:19 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:50676 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhC2Ry7 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 13:54:59 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12THsZ66023435
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Mar 2021 19:54:35 +0200
Received: from localhost.localdomain ([167.87.41.127])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12THnYmt025235;
        Mon, 29 Mar 2021 19:49:34 +0200
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
Subject: [PATCH v3 0/4] add device drivers for Siemens Industrial PCs
Date:   Mon, 29 Mar 2021 19:49:24 +0200
Message-Id: <20210329174928.18816-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

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

--

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
 drivers/platform/x86/pmc_atom.c               |  57 +++--
 drivers/platform/x86/simatic-ipc.c            | 169 ++++++++++++++
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/simatic-ipc-wdt.c            | 215 ++++++++++++++++++
 .../platform_data/x86/simatic-ipc-base.h      |  29 +++
 include/linux/platform_data/x86/simatic-ipc.h |  72 ++++++
 14 files changed, 769 insertions(+), 21 deletions(-)
 create mode 100644 drivers/leds/simple/Kconfig
 create mode 100644 drivers/leds/simple/Makefile
 create mode 100644 drivers/leds/simple/simatic-ipc-leds.c
 create mode 100644 drivers/platform/x86/simatic-ipc.c
 create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
 create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
 create mode 100644 include/linux/platform_data/x86/simatic-ipc.h

-- 
2.26.3

