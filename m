Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A923E34B6E3
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Mar 2021 12:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhC0L5E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Mar 2021 07:57:04 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:57326 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230322AbhC0L5E (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Mar 2021 07:57:04 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12RBudYg000752
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 12:56:40 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.2.82])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12RBfbTM029413;
        Sat, 27 Mar 2021 12:41:38 +0100
Date:   Sat, 27 Mar 2021 12:41:34 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        "Hans de Goede" <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20210327124134.6d12b1b8@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210327121623.5ab51eb1@md1za8fc.ad001.siemens.net>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-3-henning.schild@siemens.com>
        <546c300c-cb13-1074-de37-68ed6fad4b27@metux.net>
        <20210327121623.5ab51eb1@md1za8fc.ad001.siemens.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Sat, 27 Mar 2021 12:16:23 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> Am Thu, 18 Mar 2021 11:25:10 +0100
> schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
> 
> > On 15.03.21 10:57, Henning Schild wrote:
> > 
> > Hi,
> >   
> > > diff --git a/drivers/leds/simple/simatic-ipc-leds.c
> > > b/drivers/leds/simple/simatic-ipc-leds.c new file mode 100644
> > > index 000000000000..0f7e6320e10d
> > > --- /dev/null
> > > +++ b/drivers/leds/simple/simatic-ipc-leds.c
> > > @@ -0,0 +1,210 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Siemens SIMATIC IPC driver for LEDs
> > > + *
> > > + * Copyright (c) Siemens AG, 2018-2021
> > > + *
> > > + * Authors:
> > > + *  Henning Schild <henning.schild@siemens.com>
> > > + *  Jan Kiszka <jan.kiszka@siemens.com>
> > > + *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> > > + */
> > > +
> > > +#include <linux/ioport.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/platform_data/x86/simatic-ipc-base.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/sizes.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +#define SIMATIC_IPC_LED_PORT_BASE	0x404E
> > > +
> > > +struct simatic_ipc_led {
> > > +	unsigned int value; /* mask for io and offset for mem */
> > > +	char name[32];
> > > +	struct led_classdev cdev;
> > > +};
> > > +
> > > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > > +	{1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1"
> > > },
> > > +	{1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1"
> > > },
> > > +	{1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
> > > +	{1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2"
> > > },
> > > +	{1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
> > > +	{1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3"
> > > },
> > > +	{0, ""},
> > > +};    
> > 
> > Wouldn't it be better to name them like they're labeled on the
> > device, as shown on page #19 of the manual, or perhaps a little bit
> > more generic nameing (eg. power, status, error, maint) ?  
> 
> That was proposed in v1 but modern LED drivers should stick to known
> LED_FUNCTION_*
> Here the numbers reflect what is on the device labels. We are talking
> about roughly 10 boxes at the moment, not all having the same labels
> ... but all share 1, 2, 3 
> 
> At the end of the day the software view might be more important than
> the labels. So that people can write generic "echo 1 >
> brightness"-code that works across the full range, possibly even on
> other machines from different vendors. I guess that is also why Pavel
> wants people to use established names.
> 
> > > +/* the actual start will be discovered with pci, 0 is a
> > > placeholder */ +struct resource simatic_ipc_led_mem_res =
> > > +	DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
> >  > +
> >  > +static void *simatic_ipc_led_memory;
> >  > +    
> > 
> > hmm, could there *ever* be multiple instances of the driver ?  
> 
> No, the platform bus makes sure there can only be one.
>  
> > Wouldn't it be better to put this in the device priv data instead ?
> >  
> 
> I guess no need for priv because of "highlander ... only 1"
> 
> > > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > > +	{0x500 + 0x1A0, "simatic-ipc:red:" LED_FUNCTION_STATUS
> > > "-1"},
> > > +	{0x500 + 0x1A8, "simatic-ipc:green:" LED_FUNCTION_STATUS
> > > "-1"},
> > > +	{0x500 + 0x1C8, "simatic-ipc:red:" LED_FUNCTION_STATUS
> > > "-2"},
> > > +	{0x500 + 0x1D0, "simatic-ipc:green:" LED_FUNCTION_STATUS
> > > "-2"},
> > > +	{0x500 + 0x1E0, "simatic-ipc:red:" LED_FUNCTION_STATUS
> > > "-3"},
> > > +	{0x500 + 0x198, "simatic-ipc:green:" LED_FUNCTION_STATUS
> > > "-3"},
> > > +	{0, ""},
> > > +};
> > > +
> > > +static struct resource simatic_ipc_led_io_res =
> > > +	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_1,
> > > KBUILD_MODNAME); +
> > > +static DEFINE_SPINLOCK(reg_lock);    
> > 
> > Does this protect global data structures ? If not, I'd rather put it
> > into the device priv data instead.  
> 
> highlander, no need for priv
> 
> It protects the setter, which needs to inw + outw and is not atomic
> 
> > BTW: doesn't have struct led_classdev already have a lock that
> > can be used ? Can multiple calls to led ops (within the same device)
> > at the same time happen at all, or does led core already serialize
> > that ?  
> 
> Not sure, i probably did check that in 4.19 at the time of writing.
> Pavel did not complain so far. And other drivers have locks in their
> setters.
> 
> > > +static void simatic_ipc_led_set_io(struct led_classdev *led_cd,
> > > +				   enum led_brightness
> > > brightness) +{
> > > +	struct simatic_ipc_led *led =
> > > +		container_of(led_cd, struct simatic_ipc_led,
> > > cdev);
> > > +	unsigned long flags;
> > > +	unsigned int val;
> > > +
> > > +	spin_lock_irqsave(&reg_lock, flags);
> > > +
> > > +	val = inw(SIMATIC_IPC_LED_PORT_BASE);
> > > +	if (brightness == LED_OFF)
> > > +		outw(val | led->value,
> > > SIMATIC_IPC_LED_PORT_BASE);
> > > +	else
> > > +		outw(val & ~led->value,
> > > SIMATIC_IPC_LED_PORT_BASE);    
> > 
> > Don't we already have an helper for setting or clearing bits in IO
> > registers (that already does the read + set/clear + write at once)
> > ?  
> 
> Did not find one
> 
> > Does that really need to be protected by lock ?
> > (can happen multiple calls to that func from different threads
> > happen at all ?)  
> 
> i think so, see above
> 
> > Is the port really *always* the same, so it really can be a const ?
> >  
> 
> Yes, but making that ressource const would just cause casting in the
> probe function, or a second pointer for the io case. In the mem-case
> the static data gets written to.
> 
> > <snip>
> >   
> > > +static int simatic_ipc_leds_probe(struct platform_device *pdev)
> > > +{
> > > +	struct simatic_ipc_platform *plat;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct simatic_ipc_led *ipcled;
> > > +	struct led_classdev *cdev;
> > > +	struct resource *res;
> > > +	int err, type;
> > > +	u32 *p;
> > > +
> > > +	plat = pdev->dev.platform_data;    
> > 
> > Maybe put this into swnode ?
> > 
> > IIRC, the consensus is not to introduce new platform data structs
> > anymore, instead legacy pdata to swnode some day.
> >   
> > > +	switch (plat->devmode) {
> > > +	case SIMATIC_IPC_DEVICE_227D:
> > > +	case SIMATIC_IPC_DEVICE_427E:
> > > +		res = &simatic_ipc_led_io_res;
> > > +		ipcled = simatic_ipc_leds_io;
> > > +		/* the 227D is high on while 427E is low on,
> > > invert the struct
> > > +		 * we have
> > > +		 */
> > > +		if (plat->devmode == SIMATIC_IPC_DEVICE_227D) {
> > > +			while (ipcled->value) {
> > > +				ipcled->value =
> > > swab16(ipcled->value);    
> > 
> > Uff, better use explicit endian conversion macros (eg. be*_to_cpu())
> > for that.
> > 
> > Also, I wouldn't change those global structs, instead put those data
> > into device priv data and make the global stuff const. You could
> > also use the same field for both port-io and mmap'ed variants. And
> > adding regmap to the equation, could use the same led ops for both.
> > (IMHO, the little bit of overhead by regmap shouldn't matter here)  
> 
> You are the second person to point that out. (the swab) What is done
> here is swapping two bytes, no endianess or anything and x86 only.
> 
> As for the const and the regmap or priv data. This driver will only
> ever load once, if at all. There is really no need for abstractions,
> additional memory use or cycles.
> 
> So i will ignore the complaints. Feel free to emphasize them if you do
> not agree with me doing that.

One more point is that the memory based PC has different colors. So the
led names can not be shared between io and mem. This is an
inconsistency between those machines.

mem offers individual control of red and green, where yellow becomes
visible when turning both on
io on the other hand exposes yellow and (green|red)

The driver currently exposes what hardware offers and nothing more. I
still have the idea to potentially add yellow for mem as a helper to
get the user-level view consistent. But not sure if that idea is any
good, even if it would probably be a patch on top.

Henning

> > > +				ipcled++;
> > > +			}
> > > +			ipcled = simatic_ipc_leds_io;
> > > +		}
> > > +		type = IORESOURCE_IO;
> > > +		if (!devm_request_region(dev, res->start,
> > > +					 resource_size(res),
> > > +					 KBUILD_MODNAME)) {
> > > +			dev_err(dev,
> > > +				"Unable to register IO resource
> > > at %pR\n",
> > > +				res);
> > > +			return -EBUSY;
> > > +		}
> > > +		break;
> > > +	case SIMATIC_IPC_DEVICE_127E:
> > > +		res = &simatic_ipc_led_mem_res;
> > > +		ipcled = simatic_ipc_leds_mem;
> > > +		type = IORESOURCE_MEM;
> > > +
> > > +		/* get GPIO base from PCI */
> > > +		res->start =
> > > simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
> > > +		if (res->start == 0)
> > > +			return -ENODEV;    
> > 
> > Where does that device actually sit on ? Some generic card ? Some
> > ASIC or FPGA ?  
> 
> It is called P2SB and there some GPIO chip which i believe has no
> generic driver to it yet.
> 
> > It seems this driver is instantiated by another one, which already
> > knows what device we're actually dealing with (as it sets
> > plat->devmode). Why not letting that parent device also tell the io
> > resource to this driver ?
> >   
> > > +	while (ipcled->value) {
> > > +		cdev = &ipcled->cdev;
> > > +		cdev->brightness_set = simatic_ipc_led_set_io;
> > > +		cdev->brightness_get = simatic_ipc_led_get_io;
> > > +		if (type == IORESOURCE_MEM) {
> > > +			cdev->brightness_set =
> > > simatic_ipc_led_set_mem;
> > > +			cdev->brightness_get =
> > > simatic_ipc_led_get_mem;
> > > +		}    
> > 
> > Why not if/else ?  
> 
> Ok.
> 
> > > +		cdev->max_brightness = LED_ON;
> > > +		cdev->name = ipcled->name;
> > > +
> > > +		err = devm_led_classdev_register(dev, cdev);
> > > +		if (err < 0)
> > > +			return err;
> > > +		ipcled++;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct platform_driver led_driver = {    
> > 
> > Why not calling it simatic_ipc_led_driver ?  
> 
> Because it is a name with scope only in that file, but hey i will
> change it. Also in wdt
> 
> regards,
> Henning
> 
> > > +	.probe = simatic_ipc_leds_probe,
> > > +	.driver = {
> > > +		.name = KBUILD_MODNAME,
> > > +	},
> > > +};
> > > +
> > > +module_platform_driver(led_driver);
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> > > +MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
> > >     
> > 
> > 
> > --mtx
> >   
> 

