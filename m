Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3023634ACB7
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Mar 2021 17:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhCZQoH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Mar 2021 12:44:07 -0400
Received: from gecko.sbs.de ([194.138.37.40]:38521 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230243AbhCZQnr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Mar 2021 12:43:47 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12QGhLF7003457
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Mar 2021 17:43:21 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.32.17])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12QGXK63001322;
        Fri, 26 Mar 2021 17:33:20 +0100
Date:   Fri, 26 Mar 2021 17:33:17 +0100
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
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20210326173317.6e1517e7@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-3-henning.schild@siemens.com>
        <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 15 Mar 2021 12:48:19 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Mon, Mar 15, 2021 at 11:57 AM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> ...
> 
> > +struct simatic_ipc_led {
> > +       unsigned int value; /* mask for io and offset for mem */  
> 
> > +       char name[32];  
> 
> Hmm... Dunno if LED framework defines its own constraints for the
> length of the name.
> 
> > +       struct led_classdev cdev;
> > +};
> > +
> > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > +       {1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1" },
> > +       {1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1" },
> > +       {1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
> > +       {1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2" },
> > +       {1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
> > +       {1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3" },
> >  
> 
> Can you use BIT() macro here? And can it be sorted by the bit order?
> 
> > +       {0, ""},  
> 
> { } is enough (no comma for terminator lines in general, and no need
> to show structure member assignments separately in particular).
> 
> > +};
> > +
> > +/* the actual start will be discovered with pci, 0 is a
> > placeholder */  
> 
> PCI
> 
> > +struct resource simatic_ipc_led_mem_res =
> > +       DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);  
> 
> One line?
> 
> ...
> 
> > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > +       {0x500 + 0x1A0, "simatic-ipc:red:" LED_FUNCTION_STATUS
> > "-1"},
> > +       {0x500 + 0x1A8, "simatic-ipc:green:" LED_FUNCTION_STATUS
> > "-1"},
> > +       {0x500 + 0x1C8, "simatic-ipc:red:" LED_FUNCTION_STATUS
> > "-2"},
> > +       {0x500 + 0x1D0, "simatic-ipc:green:" LED_FUNCTION_STATUS
> > "-2"},
> > +       {0x500 + 0x1E0, "simatic-ipc:red:" LED_FUNCTION_STATUS
> > "-3"},
> > +       {0x500 + 0x198, "simatic-ipc:green:" LED_FUNCTION_STATUS
> > "-3"},
> > +       {0, ""},  
> 
> As per above.
> 
> > +};  
> 
> ...
> 
> > +       struct simatic_ipc_led *led =
> > +               container_of(led_cd, struct simatic_ipc_led, cdev);
> >  
> 
> One line?
> 
> ...
> 
> > +       struct simatic_ipc_led *led =
> > +               container_of(led_cd, struct simatic_ipc_led, cdev);
> >  
> 
> One line?
> 
> ...
> 
> > +       struct simatic_ipc_led *led =
> > +               container_of(led_cd, struct simatic_ipc_led, cdev);
> >  
> 
> Ditto.
> 
> 
> Btw, usually for such cases we create an inline helper
> ... to_simatic_ipc_led(...)
> {
>   return container_of(...);
> }
> 
> ...
> 
> > +static int simatic_ipc_leds_probe(struct platform_device *pdev)
> > +{
> > +       struct simatic_ipc_platform *plat;  
> 
> const?
> 
> > +       struct device *dev = &pdev->dev;
> > +       struct simatic_ipc_led *ipcled;
> > +       struct led_classdev *cdev;
> > +       struct resource *res;
> > +       int err, type;
> > +       u32 *p;  
> 
> > +       plat = pdev->dev.platform_data;  
> 
> Can be done directly in the definition block.
> 
> > +       switch (plat->devmode) {
> > +       case SIMATIC_IPC_DEVICE_227D:
> > +       case SIMATIC_IPC_DEVICE_427E:
> > +               res = &simatic_ipc_led_io_res;
> > +               ipcled = simatic_ipc_leds_io;
> > +               /* the 227D is high on while 427E is low on, invert
> > the struct
> > +                * we have
> > +                */
> > +               if (plat->devmode == SIMATIC_IPC_DEVICE_227D) {  
> 
> > +                       while (ipcled->value) {
> > +                               ipcled->value =
> > swab16(ipcled->value);
> > +                               ipcled++;
> > +                       }  
> 
> This seems fishy. If you have a BE CPU it won't work the same way.
> Better:
>  a) to use cpu_to_le16 / be16
>  b) create this as a helper that we may move to the generic header of
> byteorder.
> 
> But looking at the use of it, perhaps you rather need to redefine IO
> accessors, i.e. ioread16()/iowrite16() vs. ioread16be()/iowrite16be().

Got my hands on such a special-case device today. The comment is wrong
it talks about high and low, will fix that.
This one machine almost shares LED logic with some others. We have
those 6 bits spread over 2 consecutive bytes. For this one guy swapping
the two bytes is the shortest way to share the code.

I tried a few things, extra getters/setters, extra array defining bits
the other way around. It all ends up with way more code or conditions
in the getter/setter. So i think i will leave it like it is, clarify
that comment. And that swap16 is fine because we are on x86 only and are
basically swapping (1<<7 with 1<<15) ... where "<<" is already
endianessy. 

Henning

> > +                       ipcled = simatic_ipc_leds_io;
> > +               }
> > +               type = IORESOURCE_IO;
> > +               if (!devm_request_region(dev, res->start,
> > +                                        resource_size(res),
> > +                                        KBUILD_MODNAME)) {
> > +                       dev_err(dev,
> > +                               "Unable to register IO resource at
> > %pR\n",
> > +                               res);
> > +                       return -EBUSY;
> > +               }
> > +               break;
> > +       case SIMATIC_IPC_DEVICE_127E:
> > +               res = &simatic_ipc_led_mem_res;
> > +               ipcled = simatic_ipc_leds_mem;
> > +               type = IORESOURCE_MEM;
> > +
> > +               /* get GPIO base from PCI */
> > +               res->start = simatic_ipc_get_membase0(PCI_DEVFN(13,
> > 0));
> > +               if (res->start == 0)
> > +                       return -ENODEV;
> > +
> > +               /* do the final address calculation */
> > +               res->start = res->start + (0xC5 << 16);  
> 
> Magic. As I told you this is an actual offseet in the P2SB's bar for
> GPIO registers.
> I have a question, why we can't provide a GPIO driver which is already
> in the kernel and, with use of the patch series I sent, to convert
> this all magic to GPIO LEDs as it's done for all normal cases?
> 
> > +               res->end += res->start;
> > +
> > +               simatic_ipc_led_memory = devm_ioremap_resource(dev,
> > res);
> > +               if (IS_ERR(simatic_ipc_led_memory))
> > +                       return PTR_ERR(simatic_ipc_led_memory);
> > +
> > +               /* initialize power/watchdog LED */
> > +               p = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> > PM_WDT_OUT */
> > +               *p = (*p & ~1);
> > +               p = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> > PM_BIOS_BOOT_N */
> > +               *p = (*p | 1);
> > +
> > +               break;
> > +       default:
> > +               return -ENODEV;
> > +       }  
> 
> > +}  
> 

