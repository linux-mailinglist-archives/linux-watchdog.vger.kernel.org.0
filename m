Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0733B005
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbhCOKby (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCOKb2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:31:28 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0E8C061574;
        Mon, 15 Mar 2021 03:31:28 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y67so6298025pfb.2;
        Mon, 15 Mar 2021 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PdMcbuBDVYu4pfnkkEXp7Zeyvz8D3r+uXiYvPZcDso=;
        b=vDerLbS2szcXcEP6NFNqJJTkBnnr7RjyysW/E0XcGAGLEq0BpSXuB5ojeHGbDNck5P
         oHvtKNAtnXrkDlbc1aVWKdCrA/FpNP+zClF58ftFJeTZjtjUQ+e8v1DChN3eM23+IMxp
         Hc4Fyqy4MqaGwTXwy/r7XSiyqvyzWN6EdsQcXpwHrccSGftvjSPPXxUaqPVEUsjqptqf
         mbPvXMeSSkqZpkYs9bzfbx+gHPEGdiQmKMtl7KViFPhSRWaMo2C6umAB23Gh0km/oUa4
         aj96y8/66oMP8hUkYG9iVQixNcUJbzEmSH1GbBIW+QKEOzcfG+9Nspe42dSGSH4rZA9J
         U9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PdMcbuBDVYu4pfnkkEXp7Zeyvz8D3r+uXiYvPZcDso=;
        b=iL0yqJtqfVLrME6S14byDX/txCmZh0r3MLUdYd4FaeM3My9RZT7XAOAF7/XY/8GRYB
         kIfG8GAjFKckhILdUQSOjmx5s9VfaRDfQMEyUJxU0Ifnin4P0/kCnMVRPU9RqOdWBwXY
         VjPuxMPB1sDo4v9NjlmLC9eM/bV+PJh6xl2e5JktiaLN5naZi9BVpMccVMfc7W22+6xG
         LFrr2P8wL33W853sa49QCzTmgzMCkxllLwIlvTklXH1JrJnesNX1lOE6RPpqdAfpfBCy
         L8EqAw6XcElqqqz+MhmKS9d0zAooR6PWGgiAUY6bJQzh+9sJr8d8PInMijzzId6cvkk1
         F7oA==
X-Gm-Message-State: AOAM5315Inzg5j2V57rQxz6++0kTkySEASm75hpRenEEaev2huw5GUJh
        10eEIy4IHOdlwltNwlBPKLPRZuGoILySi5tf2BM=
X-Google-Smtp-Source: ABdhPJyHWGsmCNhd61PqCgK3SsbcfpQfxMOyuLLgU8rBG7ONOLaDWA6yK76yx3cFkaiCa5am1VGB0HU9WFDVffVL/dA=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr24341655pfc.40.1615804287645; Mon, 15
 Mar 2021 03:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210315095710.7140-1-henning.schild@siemens.com> <20210315095710.7140-2-henning.schild@siemens.com>
In-Reply-To: <20210315095710.7140-2-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 12:31:11 +0200
Message-ID: <CAHp75VdXDcTfNL9QRQ5XE-zVLHacfMKHUxhse3=dAfJbOJdObQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] platform/x86: simatic-ipc: add main driver for
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

On Mon, Mar 15, 2021 at 12:02 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> This mainly implements detection of these devices and will allow
> secondary drivers to work on such machines.
>
> The identification is DMI-based with a vendor specific way to tell them
> apart in a reliable way.
>
> Drivers for LEDs and Watchdogs will follow to make use of that platform
> detection.

...

> +static int register_platform_devices(u32 station_id)
> +{
> +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
> +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
> +       int i;
> +
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
> +               ipc_led_platform_device =
> +                       platform_device_register_data(NULL,
> +                               KBUILD_MODNAME "_leds", PLATFORM_DEVID_NONE,
> +                               &platform_data,
> +                               sizeof(struct simatic_ipc_platform));
> +               if (IS_ERR(ipc_led_platform_device))
> +                       return PTR_ERR(ipc_led_platform_device);
> +
> +               pr_debug("device=%s created\n",
> +                        ipc_led_platform_device->name);
> +       }
> +
> +       if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
> +               platform_data.devmode = wdtmode;
> +               ipc_wdt_platform_device =
> +                       platform_device_register_data(NULL,
> +                               KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
> +                               &platform_data,
> +                               sizeof(struct simatic_ipc_platform));
> +               if (IS_ERR(ipc_wdt_platform_device))
> +                       return PTR_ERR(ipc_wdt_platform_device);
> +
> +               pr_debug("device=%s created\n",
> +                        ipc_wdt_platform_device->name);
> +       }
> +
> +       if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
> +           wdtmode == SIMATIC_IPC_DEVICE_NONE) {
> +               pr_warn("unsupported IPC detected, station id=%08x\n",
> +                       station_id);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}

Why not use MFD here?

...

> +/*
> + * Get membase address from PCI, used in leds and wdt modul. Here we read
> + * the bar0. The final address calculation is done in the appropriate modules
> + */

No blank line here.

I would add FIXME or REVISIT here to point out that this should be
deduplicated in the future.

> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
> +{
> +       struct pci_bus *bus;
> +       u32 bar0 = 0;
> +
> +       /*
> +        * The GPIO memory is bar0 of the hidden P2SB device. Unhide the device

No, it's not a GPIO's bar. It's P2SB's one. GPIO resides in that bar somewhere.

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
> +
> +       return bar0;
> +}
> +EXPORT_SYMBOL(simatic_ipc_get_membase0);

...

> +static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
> +{
> +       u32 station_id = SIMATIC_IPC_INVALID_STATION_ID;
> +       int i;

Reversed xmas tree order, please.

> +       struct {
> +               u8      type;           /* type (0xff = binary) */
> +               u8      len;            /* len of data entry */
> +               u8      reserved[3];
> +               u32     station_id;     /* station id (LE) */

> +       } __packed
> +       *data_entry = (void *)data + sizeof(struct dmi_header);

Can be one line.

> +       /* find 4th entry in OEM data */
> +       for (i = 0; i < 3; i++)

3 is magic!

> +               data_entry = (void *)((u8 *)(data_entry) + data_entry->len);
> +
> +       /* decode station id */
> +       if (data_entry && (u8 *)data_entry < data + max_len &&
> +           data_entry->type == 0xff && data_entry->len == 9)
> +               station_id = le32_to_cpu(data_entry->station_id);
> +
> +       return station_id;
> +}

-- 
With Best Regards,
Andy Shevchenko
