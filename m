Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B0432D072
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 11:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhCDKMP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 05:12:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238277AbhCDKMJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 05:12:09 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799D0C061574;
        Thu,  4 Mar 2021 02:11:29 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id e6so18588855pgk.5;
        Thu, 04 Mar 2021 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YO9NjeIBZ2Ofgc77T5EIVJd9wzwwHvbTsOoLkelj+3U=;
        b=dnbKLuB8jO1h0RuiiEVATFakcs4Ii/HtyK8OhO4bQrDBMw0nNVmxR2ovPQTANH4lz9
         q0QGvOLN+u9rVZuO/wkmNIUxmg7laPsNRI57H6pgptIVbi+RJ9kYOECWw20K+TgGkMvt
         XalFFXUKH5CPsisFvqQ8BSnGnNIq7mb7D9dFeTPdXELh/qz+WRUIhwcR0Ab49O1LP7YS
         GN24jsKhnlkuxAU/0o15sAVrk9MDoP98lYxZ+P8CsbE6/UXfqWKqT5cawfF+IuJD7eb9
         ySiSTtdMLAq54MLS08t3i6G6emfCZWHS2h/RpD+lCuVH1PVBoZXZ3B9/WN2PgNxy+HUD
         N2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YO9NjeIBZ2Ofgc77T5EIVJd9wzwwHvbTsOoLkelj+3U=;
        b=fWkNspklc5q2vWIesGDuAcTajjAXTsKHMVVCREWxOMW9IZhTdsVOHKV3MjD9S0B/B0
         itTNbUebqYtIR4qFcwHoLvEdj2aGe+XhtezlnBbXTip5jedM3hrNIwCYdlPhHy5MPPLS
         tut/r8BIPPzzcbF/s9M4ws22oi0U76wW4YbgO+y/0aRdkZ/sk6ve1Kygv+C/056D3kMe
         hl81oCvg0c1T6PFSu+OgcMFnG/lgQkp6mwxIyTeURyUmWMaX0x/ttAhzm3i0VlwYMMTe
         v6O8vuRykktrLnI4qSFZpPramvuonvBwS307M6qprU5nWUiIxXB0k5NDqC98hrgr05P4
         mC6A==
X-Gm-Message-State: AOAM5331grs8mmWyej9rHWxeiTXx/dVUVTrgv6c+AArr6+UpI+kxQ9pP
        9Gc8Vf0IjrZlqDRJdMKiBnby/B9FmuyNxbJYUEU=
X-Google-Smtp-Source: ABdhPJx8kHiFKMSMMj/y0bDRF0p7oZF1JsUZIBUnv62oMXDjtKf2ugKzQ7ZpIsc/eBju5hPZ9niIVliIioq6NTRosfI=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr2012756pfc.40.1614852688761; Thu, 04
 Mar 2021 02:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com> <20210302163309.25528-2-henning.schild@siemens.com>
In-Reply-To: <20210302163309.25528-2-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:11:12 +0200
Message-ID: <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
<henning.schild@siemens.com> wrote:
>
> From: Henning Schild <henning.schild@siemens.com>
>
> This mainly implements detection of these devices and will allow
> secondary drivers to work on such machines.
>
> The identification is DMI-based with a vendor specific way to tell them
> apart in a reliable way.
>
> Drivers for LEDs and Watchdogs will follow to make use of that platform
> detection.

> Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

The order is wrong taking into account the From line in the body. So,
it's not clear who is the author, who is a co-developer, and who is
the committer (one person may utilize few roles).
Check for the rest of the series as well (basically this is the rule
of thumb to recheck entire code for the comment you have got at any
single place of it).

...

> +config SIEMENS_SIMATIC_IPC
> +       tristate "Siemens Simatic IPC Class driver"
> +       depends on PCI
> +       help
> +         This Simatic IPC class driver is the central of several drivers. It
> +         is mainly used for system identification, after which drivers in other
> +         classes will take care of driving specifics of those machines.
> +         i.e. leds and watchdogs

LEDs
watchdog. (missed period and singular form)

Module name?

>  endif # X86_PLATFORM_DEVICES

Not sure about the ordering of the section in Kconfig, but it is up to
maintainers.

...

> +# Siemens Simatic Industrial PCs
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC)      += simatic-ipc.o

Ditto.

...

> + * Siemens SIMATIC IPC driver for LEDs

It seems to be used in patch 4 which is not LED related. Also, why is
it here if it's for LEDs?

...

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Replace with SPDX

...

> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>

Ordered?

> +#include <linux/platform_data/x86/simatic-ipc.h>

...

> +static int register_platform_devices(u32 station_id)
> +{
> +       int i;
> +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
> +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;

Reversed xmas tree order?

> +       platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
> +
> +       for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
> +               if (device_modes[i].station_id == station_id) {
> +                       ledmode = device_modes[i].led_mode;
> +                       wdtmode = device_modes[i].wdt_mode;
> +                       break;
> +               }
> +       }
> +
> +       if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
> +               platform_data.devmode = ledmode;

> +               ipc_led_platform_device = platform_device_register_data
> +                       (NULL, KBUILD_MODNAME "_leds", PLATFORM_DEVID_NONE,
> +                        &platform_data, sizeof(struct simatic_ipc_platform));

Strange indentation (second line).

> +               if (IS_ERR(ipc_led_platform_device))
> +                       return PTR_ERR(ipc_led_platform_device);

> +               pr_debug(KBUILD_MODNAME ": device=%s created\n",
> +                        ipc_led_platform_device->name);

Utilize pr_fmt() instead of adding prefixes like this.

> +       }

> +       if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
> +               platform_data.devmode = wdtmode;
> +               ipc_wdt_platform_device = platform_device_register_data
> +                       (NULL, KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
> +                        &platform_data, sizeof(struct simatic_ipc_platform));
> +               if (IS_ERR(ipc_wdt_platform_device))
> +                       return PTR_ERR(ipc_wdt_platform_device);
> +
> +               pr_debug(KBUILD_MODNAME ": device=%s created\n",
> +                        ipc_wdt_platform_device->name);
> +       }

Same comments as above.

> +       if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
> +           wdtmode == SIMATIC_IPC_DEVICE_NONE) {
> +               pr_warn(KBUILD_MODNAME
> +                       ": unsupported IPC detected, station id=%08x\n",
> +                       station_id);

Ugly indentation. With pr_fmt() in use will be much better.

> +               return -EINVAL;

> +       } else {

Redundant.

> +               return 0;
> +       }
> +}

...

> +/*
> + * Get membase address from PCI, used in leds and wdt modul. Here we read
> + * the bar0. The final address calculation is done in the appropriate modules

bar -> BAR
Missed period.

> + */

> +

Unneeded blank line.

> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
> +{
> +       u32 bar0 = 0;

> +#ifdef CONFIG_PCI

It's ugly besides the fact that you have a dependency.

> +       struct pci_bus *bus;

Missed blank line.

> +       /*
> +        * The GPIO memory is bar0 of the hidden P2SB device. Unhide the device
> +        * to have a quick look at it, before we hide it again.
> +        * Also grab the pci rescan lock so that device does not get discovered
> +        * and remapped while it is visible.
> +        * This code is inspired by drivers/mfd/lpc_ich.c
> +        */
> +       bus = pci_find_bus(0, 0);
> +       pci_lock_rescan_remove();
> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
> +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
> +
> +       bar0 &= ~0xf;
> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
> +       pci_unlock_rescan_remove();
> +#endif /* CONFIG_PCI */
> +       return bar0;
> +}
> +EXPORT_SYMBOL(simatic_ipc_get_membase0);

Oy vey! I know what this is and let's do it differently. I have some
(relatively old) patch series I can send you privately for testing.

...

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Not needed when you have SPDX.

...

> +#include <linux/pci.h>

Wrong header. Should be types.h

...

> +#include <linux/dmi.h>
> +#include <linux/platform_data/x86/simatic-ipc-base.h>

Missed headers. You need to include ones that the code below is a
direct user of.

Like types.h

-- 
With Best Regards,
Andy Shevchenko
