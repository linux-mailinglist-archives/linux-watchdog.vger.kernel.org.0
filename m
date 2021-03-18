Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863CD34031C
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Mar 2021 11:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhCRK0J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Mar 2021 06:26:09 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43955 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhCRKZi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Mar 2021 06:25:38 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZT2u-1lAEww22Uw-00WYti; Thu, 18 Mar 2021 11:25:12 +0100
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-3-henning.schild@siemens.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <546c300c-cb13-1074-de37-68ed6fad4b27@metux.net>
Date:   Thu, 18 Mar 2021 11:25:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315095710.7140-3-henning.schild@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vpCr7PjTZL1h2C/itAJPIrkpsGcasBsQ05mYDQaw69Idl+QVoEv
 BiHXJi2/ydCplB2NLkP/7ulor+GZr2qlvx4rOXsuBFT6gCqdW7gGJSSHyAFp7e2Gq4OZwAj
 q2WGAh8AcEnq3P5njHacj/vMTnJNcZzXEeakTrptDEdstSQ/Oyd/fg18JqowYbBOvAUbZ57
 tmWYZ/6LXne1nt4b0PzXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:da/qLqnaKz4=:nVATpdo8f+EPYzfU1oN5Fh
 F6wKFbp0cIQ/Is8/Ceaq38E94+dfqoE0JDFAvPav8GYa1m/Uc17s8ywTeKveIrFQjC4+eLznr
 9xNkh0xU1Hid1qm854zqb7VrgPmGI+iEqGq30T3+vYBftMLKZPR/N8uPU7+UIQnD4Jgw5hXuM
 5wBdo1cN+UdOWVyMdaF1TFWwN0uZk8asCOF5nj6JAxLA6Mlws4/LzduB8gqatZxsd6xmYN6mU
 G2A6xD+9aTxyxNq6m08BW5/gm6oay9+sfjc1iX70ZOYg+UkLAQJVtynvBibEk3ujBHYJc/qLy
 wl1H515bzEJcNYgGWf2vc3+hf2i+VUf2EXMQ6QXRJS3yJgIPNRhSbL9f6AdXjZxHCKvCbfwJ/
 C9mTkJR7/CSK6gOmZASQkY7pkgPLLI8ZAAHwrCqpvMaCUt0IZ6V9nb8eGfU1f
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 15.03.21 10:57, Henning Schild wrote:

Hi,

> diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
> new file mode 100644
> index 000000000000..0f7e6320e10d
> --- /dev/null
> +++ b/drivers/leds/simple/simatic-ipc-leds.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Siemens SIMATIC IPC driver for LEDs
> + *
> + * Copyright (c) Siemens AG, 2018-2021
> + *
> + * Authors:
> + *  Henning Schild <henning.schild@siemens.com>
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> + */
> +
> +#include <linux/ioport.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_data/x86/simatic-ipc-base.h>
> +#include <linux/platform_device.h>
> +#include <linux/sizes.h>
> +#include <linux/spinlock.h>
> +
> +#define SIMATIC_IPC_LED_PORT_BASE	0x404E
> +
> +struct simatic_ipc_led {
> +	unsigned int value; /* mask for io and offset for mem */
> +	char name[32];
> +	struct led_classdev cdev;
> +};
> +
> +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> +	{1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1" },
> +	{1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1" },
> +	{1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
> +	{1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2" },
> +	{1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
> +	{1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3" },
> +	{0, ""},
> +};

Wouldn't it be better to name them like they're labeled on the device,
as shown on page #19 of the manual, or perhaps a little bit more
generic nameing (eg. power, status, error, maint) ?

> +/* the actual start will be discovered with pci, 0 is a placeholder */
> +struct resource simatic_ipc_led_mem_res =
> +	DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
 > +
 > +static void *simatic_ipc_led_memory;
 > +

hmm, could there *ever* be multiple instances of the driver ?

Wouldn't it be better to put this in the device priv data instead ?

> +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> +	{0x500 + 0x1A0, "simatic-ipc:red:" LED_FUNCTION_STATUS "-1"},
> +	{0x500 + 0x1A8, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1"},
> +	{0x500 + 0x1C8, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2"},
> +	{0x500 + 0x1D0, "simatic-ipc:green:" LED_FUNCTION_STATUS "-2"},
> +	{0x500 + 0x1E0, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3"},
> +	{0x500 + 0x198, "simatic-ipc:green:" LED_FUNCTION_STATUS "-3"},
> +	{0, ""},
> +};
> +
> +static struct resource simatic_ipc_led_io_res =
> +	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_1, KBUILD_MODNAME);
> +
> +static DEFINE_SPINLOCK(reg_lock);

Does this protect global data structures ? If not, I'd rather put it
into the device priv data instead.

BTW: doesn't have struct led_classdev already have a lock that
can be used ? Can multiple calls to led ops (within the same device)
at the same time happen at all, or does led core already serialize
that ?

> +static void simatic_ipc_led_set_io(struct led_classdev *led_cd,
> +				   enum led_brightness brightness)
> +{
> +	struct simatic_ipc_led *led =
> +		container_of(led_cd, struct simatic_ipc_led, cdev);
> +	unsigned long flags;
> +	unsigned int val;
> +
> +	spin_lock_irqsave(&reg_lock, flags);
> +
> +	val = inw(SIMATIC_IPC_LED_PORT_BASE);
> +	if (brightness == LED_OFF)
> +		outw(val | led->value, SIMATIC_IPC_LED_PORT_BASE);
> +	else
> +		outw(val & ~led->value, SIMATIC_IPC_LED_PORT_BASE);

Don't we already have an helper for setting or clearing bits in IO
registers (that already does the read + set/clear + write at once) ?

Does that really need to be protected by lock ?
(can happen multiple calls to that func from different threads happen
at all ?)

Is the port really *always* the same, so it really can be a const ?

<snip>

> +static int simatic_ipc_leds_probe(struct platform_device *pdev)
> +{
> +	struct simatic_ipc_platform *plat;
> +	struct device *dev = &pdev->dev;
> +	struct simatic_ipc_led *ipcled;
> +	struct led_classdev *cdev;
> +	struct resource *res;
> +	int err, type;
> +	u32 *p;
> +
> +	plat = pdev->dev.platform_data;

Maybe put this into swnode ?

IIRC, the consensus is not to introduce new platform data structs
anymore, instead legacy pdata to swnode some day.

> +	switch (plat->devmode) {
> +	case SIMATIC_IPC_DEVICE_227D:
> +	case SIMATIC_IPC_DEVICE_427E:
> +		res = &simatic_ipc_led_io_res;
> +		ipcled = simatic_ipc_leds_io;
> +		/* the 227D is high on while 427E is low on, invert the struct
> +		 * we have
> +		 */
> +		if (plat->devmode == SIMATIC_IPC_DEVICE_227D) {
> +			while (ipcled->value) {
> +				ipcled->value = swab16(ipcled->value);

Uff, better use explicit endian conversion macros (eg. be*_to_cpu()) for
that.

Also, I wouldn't change those global structs, instead put those data
into device priv data and make the global stuff const. You could also
use the same field for both port-io and mmap'ed variants. And adding
regmap to the equation, could use the same led ops for both. (IMHO,
the little bit of overhead by regmap shouldn't matter here)

> +				ipcled++;
> +			}
> +			ipcled = simatic_ipc_leds_io;
> +		}
> +		type = IORESOURCE_IO;
> +		if (!devm_request_region(dev, res->start,
> +					 resource_size(res),
> +					 KBUILD_MODNAME)) {
> +			dev_err(dev,
> +				"Unable to register IO resource at %pR\n",
> +				res);
> +			return -EBUSY;
> +		}
> +		break;
> +	case SIMATIC_IPC_DEVICE_127E:
> +		res = &simatic_ipc_led_mem_res;
> +		ipcled = simatic_ipc_leds_mem;
> +		type = IORESOURCE_MEM;
> +
> +		/* get GPIO base from PCI */
> +		res->start = simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
> +		if (res->start == 0)
> +			return -ENODEV;

Where does that device actually sit on ? Some generic card ? Some ASIC
or FPGA ?

It seems this driver is instantiated by another one, which already knows
what device we're actually dealing with (as it sets plat->devmode).
Why not letting that parent device also tell the io resource to this
driver ?

> +	while (ipcled->value) {
> +		cdev = &ipcled->cdev;
> +		cdev->brightness_set = simatic_ipc_led_set_io;
> +		cdev->brightness_get = simatic_ipc_led_get_io;
> +		if (type == IORESOURCE_MEM) {
> +			cdev->brightness_set = simatic_ipc_led_set_mem;
> +			cdev->brightness_get = simatic_ipc_led_get_mem;
> +		}

Why not if/else ?

> +		cdev->max_brightness = LED_ON;
> +		cdev->name = ipcled->name;
> +
> +		err = devm_led_classdev_register(dev, cdev);
> +		if (err < 0)
> +			return err;
> +		ipcled++;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver led_driver = {

Why not calling it simatic_ipc_led_driver ?

> +	.probe = simatic_ipc_leds_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	},
> +};
> +
> +module_platform_driver(led_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> +MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
> 


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
