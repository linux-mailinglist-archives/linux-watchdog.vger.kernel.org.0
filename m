Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C2332B55E
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Mar 2021 08:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234822AbhCCG7w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 01:59:52 -0500
Received: from gecko.sbs.de ([194.138.37.40]:33851 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346285AbhCBRgN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Mar 2021 12:36:13 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 122GcC5A009123
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 2 Mar 2021 17:38:12 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.44.113])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 122GXBHN025192;
        Tue, 2 Mar 2021 17:33:11 +0100
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
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH 0/4] add device drivers for Siemens Industrial PCs
Date:   Tue,  2 Mar 2021 17:33:05 +0100
Message-Id: <20210302163309.25528-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Henning Schild <henning.schild@siemens.com>

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

But the idea here is to share early, and hopefully not fail early.

Henning Schild (4):
  platform/x86: simatic-ipc: add main driver for Siemens devices
  leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
  watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
  platform/x86: pmc_atom: improve critclk_systems matching for Siemens
    PCs

 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/simatic-ipc-leds.c               | 224 +++++++++++++
 drivers/platform/x86/Kconfig                  |   9 +
 drivers/platform/x86/Makefile                 |   3 +
 drivers/platform/x86/pmc_atom.c               |  39 +--
 drivers/platform/x86/simatic-ipc.c            | 166 ++++++++++
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/simatic-ipc-wdt.c            | 305 ++++++++++++++++++
 .../platform_data/x86/simatic-ipc-base.h      |  33 ++
 include/linux/platform_data/x86/simatic-ipc.h |  68 ++++
 12 files changed, 853 insertions(+), 18 deletions(-)
 create mode 100644 drivers/leds/simatic-ipc-leds.c
 create mode 100644 drivers/platform/x86/simatic-ipc.c
 create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
 create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
 create mode 100644 include/linux/platform_data/x86/simatic-ipc.h

-- 
2.26.2

