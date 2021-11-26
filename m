Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2672345F0CB
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 16:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354321AbhKZPjv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 10:39:51 -0500
Received: from gecko.sbs.de ([194.138.37.40]:54634 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378164AbhKZPhu (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 10:37:50 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQFYCJZ008069
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 16:34:12 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQFYAVG001104;
        Fri, 26 Nov 2021 16:34:11 +0100
Date:   Fri, 26 Nov 2021 16:34:10 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        "Gerd Haeussler" <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
Subject: Re: [PATCH v4 0/4] add device drivers for Siemens Industrial PCs
Message-ID: <20211126163410.2806de5f@md1za8fc.ad001.siemens.net>
In-Reply-To: <20211126141027.16161-1-henning.schild@siemens.com>
References: <20211126141027.16161-1-henning.schild@siemens.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi all,

in p3 not too much was left open so i hope this might be the last and
might be quick.

The two points that have been open where:
 1 wish to split wdt driver into two
 2 wish to use pinctrl for LEDs/WDT

1 was ignored for now. We can split later when we add more devices. It
remains unclear if splitting is the way to go when more devices come.
Could also be that it would become too many and spreading code over
many files could make maint harder.
Plus a split of wdt alone would make things inconsistent with LEDs. And
if we did split that we would end up with even more files/drivers.

2 can not be done because pinctrl does not probe on any of the PCs.
There are patches floating around but still under review/construction.
There is no technical conflict it is more an ordering issue. So i
kindly ask to let these drivers in and not have them stuck behind the
P2SB patches. I once offered to wait, but its been many months.

regards,
Henning

Am Fri, 26 Nov 2021 15:10:23 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> changes since v3:
> 
> - fix io access width and region reservations
> - fix style in p1
> 
> changes since v2:
> 
> - remove "simatic-ipc" prefix from LED names
> - fix style issues found in v2, mainly LED driver
> - fix OEM specific dmi code, and remove magic numbers
> - more "simatic_ipc" name prefixing
> - improved pmc quirk code using callbacks
> 
> changes since v1:
> 
> - fixed lots of style issues found in v1
>   - (debug) printing
>   - header ordering
> - fixed license issues GPLv2 and SPDX in all files
> - module_platform_driver instead of __init __exit
> - wdt simplifications cleanup
> - lots of fixes in wdt driver, all that was found in v1
> - fixed dmi length in dmi helper
> - changed LED names to allowed ones
> - move led driver to simple/
> - switched pmc_atom to dmi callback with global variable
> 
> 
> This series adds support for watchdogs and leds of several x86 devices
> from Siemens.
> 
> It is structured with a platform driver that mainly does
> identification of the machines. It might trigger loading of the
> actual device drivers by attaching devices to the platform bus.
> 
> The identification is vendor specific, parsing a special binary DMI
> entry. The implementation of that platform identification is applied
> on pmc_atom clock quirks in the final patch.
> 
> It is all structured in a way that we can easily add more devices and
> more platform drivers later. Internally we have some more code for
> hardware monitoring, more leds, watchdogs etc. This will follow some
> day.
> 
> Henning Schild (4):
>   platform/x86: simatic-ipc: add main driver for Siemens devices
>   leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
>   watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
>   platform/x86: pmc_atom: improve critclk_systems matching for Siemens
>     PCs
> 
>  drivers/leds/Kconfig                          |   3 +
>  drivers/leds/Makefile                         |   3 +
>  drivers/leds/simple/Kconfig                   |  11 +
>  drivers/leds/simple/Makefile                  |   2 +
>  drivers/leds/simple/simatic-ipc-leds.c        | 202 ++++++++++++++++
>  drivers/platform/x86/Kconfig                  |  12 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/pmc_atom.c               |  54 +++--
>  drivers/platform/x86/simatic-ipc.c            | 168 +++++++++++++
>  drivers/watchdog/Kconfig                      |  11 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/simatic-ipc-wdt.c            | 228
> ++++++++++++++++++ .../platform_data/x86/simatic-ipc-base.h      |
> 29 +++ include/linux/platform_data/x86/simatic-ipc.h |  72 ++++++
>  14 files changed, 778 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/leds/simple/Kconfig
>  create mode 100644 drivers/leds/simple/Makefile
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds.c
>  create mode 100644 drivers/platform/x86/simatic-ipc.c
>  create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
>  create mode 100644 include/linux/platform_data/x86/simatic-ipc-base.h
>  create mode 100644 include/linux/platform_data/x86/simatic-ipc.h
> 

