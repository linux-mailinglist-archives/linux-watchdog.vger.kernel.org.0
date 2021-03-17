Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A5733F8E2
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Mar 2021 20:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbhCQTOL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Mar 2021 15:14:11 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:33307 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233087AbhCQTNj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Mar 2021 15:13:39 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12HJDE7x004592
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 20:13:14 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.41.250])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12HJDCYx007184;
        Wed, 17 Mar 2021 20:13:13 +0100
Date:   Wed, 17 Mar 2021 20:13:11 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH v2 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
Message-ID: <20210317201311.70528fd4@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VdXDcTfNL9QRQ5XE-zVLHacfMKHUxhse3=dAfJbOJdObQ@mail.gmail.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-2-henning.schild@siemens.com>
        <CAHp75VdXDcTfNL9QRQ5XE-zVLHacfMKHUxhse3=dAfJbOJdObQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 15 Mar 2021 12:31:11 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Mon, Mar 15, 2021 at 12:02 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > This mainly implements detection of these devices and will allow
> > secondary drivers to work on such machines.
> >
> > The identification is DMI-based with a vendor specific way to tell
> > them apart in a reliable way.
> >
> > Drivers for LEDs and Watchdogs will follow to make use of that
> > platform detection.  
> 
> ...
> 
> > +static int register_platform_devices(u32 station_id)
> > +{
> > +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
> > +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
> > +       int i;
> > +
> > +       platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
> > +               if (device_modes[i].station_id == station_id) {
> > +                       ledmode = device_modes[i].led_mode;
> > +                       wdtmode = device_modes[i].wdt_mode;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
> > +               platform_data.devmode = ledmode;
> > +               ipc_led_platform_device =
> > +                       platform_device_register_data(NULL,
> > +                               KBUILD_MODNAME "_leds",
> > PLATFORM_DEVID_NONE,
> > +                               &platform_data,
> > +                               sizeof(struct
> > simatic_ipc_platform));
> > +               if (IS_ERR(ipc_led_platform_device))
> > +                       return PTR_ERR(ipc_led_platform_device);
> > +
> > +               pr_debug("device=%s created\n",
> > +                        ipc_led_platform_device->name);
> > +       }
> > +
> > +       if (wdtmode != SIMATIC_IPC_DEVICE_NONE) {
> > +               platform_data.devmode = wdtmode;
> > +               ipc_wdt_platform_device =
> > +                       platform_device_register_data(NULL,
> > +                               KBUILD_MODNAME "_wdt",
> > PLATFORM_DEVID_NONE,
> > +                               &platform_data,
> > +                               sizeof(struct
> > simatic_ipc_platform));
> > +               if (IS_ERR(ipc_wdt_platform_device))
> > +                       return PTR_ERR(ipc_wdt_platform_device);
> > +
> > +               pr_debug("device=%s created\n",
> > +                        ipc_wdt_platform_device->name);
> > +       }
> > +
> > +       if (ledmode == SIMATIC_IPC_DEVICE_NONE &&
> > +           wdtmode == SIMATIC_IPC_DEVICE_NONE) {
> > +               pr_warn("unsupported IPC detected, station
> > id=%08x\n",
> > +                       station_id);
> > +               return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}  
> 
> Why not use MFD here?

Never had a close look at mfd to be honest. I might

With the custom dmi matching on 129 being part of the header, and the
p2sb unhide moving out as well ... that first driver ends up being not
too valuable indeed

It just identifies the box and tells subsequent drivers which one it
is, which watchdog and LED path to take. Moving the knowledge of which
box has which LED/watchdog into the respective drivers seems to be the
better way to go.

So we would end up with a LED and a watchdog driver both
MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");
and doing the identification with the inline dmi from that header,
doing p2sb with the support to come ... possibly a "//TODO\ninline" in
the meantime.

So no "main platform" driver anymore, but still central platform
headers.

Not sure how this sounds, but i think making that change should be
possible. And that is what i will try and go for in v3.

regards,
Henning

> ...
> 
> > +/*
> > + * Get membase address from PCI, used in leds and wdt modul. Here
> > we read
> > + * the bar0. The final address calculation is done in the
> > appropriate modules
> > + */  
> 
> No blank line here.
> 
> I would add FIXME or REVISIT here to point out that this should be
> deduplicated in the future.
> 
> > +u32 simatic_ipc_get_membase0(unsigned int p2sb)
> > +{
> > +       struct pci_bus *bus;
> > +       u32 bar0 = 0;
> > +
> > +       /*
> > +        * The GPIO memory is bar0 of the hidden P2SB device.
> > Unhide the device  
> 
> No, it's not a GPIO's bar. It's P2SB's one. GPIO resides in that bar
> somewhere.
> 
> > +        * to have a quick look at it, before we hide it again.
> > +        * Also grab the pci rescan lock so that device does not
> > get discovered
> > +        * and remapped while it is visible.
> > +        * This code is inspired by drivers/mfd/lpc_ich.c
> > +        */
> > +       bus = pci_find_bus(0, 0);
> > +       pci_lock_rescan_remove();
> > +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
> > +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0,
> > &bar0); +
> > +       bar0 &= ~0xf;
> > +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
> > +       pci_unlock_rescan_remove();
> > +
> > +       return bar0;
> > +}
> > +EXPORT_SYMBOL(simatic_ipc_get_membase0);  
> 
> ...
> 
> > +static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
> > +{
> > +       u32 station_id = SIMATIC_IPC_INVALID_STATION_ID;
> > +       int i;  
> 
> Reversed xmas tree order, please.
> 
> > +       struct {
> > +               u8      type;           /* type (0xff = binary) */
> > +               u8      len;            /* len of data entry */
> > +               u8      reserved[3];
> > +               u32     station_id;     /* station id (LE) */  
> 
> > +       } __packed
> > +       *data_entry = (void *)data + sizeof(struct dmi_header);  
> 
> Can be one line.
> 
> > +       /* find 4th entry in OEM data */
> > +       for (i = 0; i < 3; i++)  
> 
> 3 is magic!
> 
> > +               data_entry = (void *)((u8 *)(data_entry) +
> > data_entry->len); +
> > +       /* decode station id */
> > +       if (data_entry && (u8 *)data_entry < data + max_len &&
> > +           data_entry->type == 0xff && data_entry->len == 9)
> > +               station_id = le32_to_cpu(data_entry->station_id);
> > +
> > +       return station_id;
> > +}  
> 

