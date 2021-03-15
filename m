Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF9B33AFA3
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCOKNB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:13:01 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:34428 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhCOKMi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:12:38 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12FACGMN014183
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 11:12:16 +0100
Received: from localhost.localdomain ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12F9vFds002444;
        Mon, 15 Mar 2021 10:57:15 +0100
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
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 0/4] add device drivers for Siemens Industrial PCs
Date:   Mon, 15 Mar 2021 10:57:06 +0100
Message-Id: <20210315095710.7140-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

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
 drivers/leds/simple/simatic-ipc-leds.c        | 210 +++++++++++++++++
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/pmc_atom.c               |  47 ++--
 drivers/platform/x86/simatic-ipc.c            | 168 ++++++++++++++
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/simatic-ipc-wdt.c            | 215 ++++++++++++++++++
 .../platform_data/x86/simatic-ipc-base.h      |  29 +++
 include/linux/platform_data/x86/simatic-ipc.h |  66 ++++++
 14 files changed, 761 insertions(+), 20 deletions(-)
 create mode 100644 drivers/leds/simple/Kconfig
 create mode 100644 drivers/leds/simple/Makefile
 create mode 100644 drivers/leds/simple/simatic-ipc-leds.c
 create mode 100644 drivers/platform/x86/simatic-ipc.c
 create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
 create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
 create mode 100644 include/linux/platform_data/x86/simatic-ipc.h

-- 
2.26.2

