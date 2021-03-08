Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A8B331216
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 16:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhCHP0D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 10:26:03 -0500
Received: from gecko.sbs.de ([194.138.37.40]:43618 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhCHPZi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 10:25:38 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 128FPCYd002645
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 8 Mar 2021 16:25:12 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.1.188])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 128FKBq4024013;
        Mon, 8 Mar 2021 16:20:11 +0100
Date:   Mon, 8 Mar 2021 16:20:10 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
Message-ID: <20210308162010.579eb1c0@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210303152105.1ca683eb@md1za8fc.ad001.siemens.net>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-4-henning.schild@siemens.com>
        <fa73ed42-dcbc-26c8-f119-244d4f4eea03@roeck-us.net>
        <20210303152105.1ca683eb@md1za8fc.ad001.siemens.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Wed, 3 Mar 2021 15:21:05 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> Hi, 
> 
> thanks for the fast and thorough review!
> 
> Am Tue, 2 Mar 2021 10:38:19 -0800
> schrieb Guenter Roeck <linux@roeck-us.net>:
> 
> > On 3/2/21 8:33 AM, Henning Schild wrote:  
> > > From: Henning Schild <henning.schild@siemens.com>
> > > 
> > > This driver adds initial support for several devices from Siemens.
> > > It is based on a platform driver introduced in an earlier commit.
> > > 
> > > Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> > > Signed-off-by: Henning Schild <henning.schild@siemens.com>
> > > ---
> > >  drivers/watchdog/Kconfig           |  11 ++
> > >  drivers/watchdog/Makefile          |   1 +
> > >  drivers/watchdog/simatic-ipc-wdt.c | 305
> > > +++++++++++++++++++++++++++++ 3 files changed, 317 insertions(+)
> > >  create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
> > > 
> > > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > > index 1fe0042a48d2..948497eb4bef 100644
> > > --- a/drivers/watchdog/Kconfig
> > > +++ b/drivers/watchdog/Kconfig
> > > @@ -1575,6 +1575,17 @@ config NIC7018_WDT
> > >  	  To compile this driver as a module, choose M here: the
> > > module will be called nic7018_wdt.
> > >  
> > > +config SIEMENS_SIMATIC_IPC_WDT
> > > +	tristate "Siemens Simatic IPC Watchdog"
> > > +	depends on SIEMENS_SIMATIC_IPC
> > > +	select WATCHDOG_CORE
> > > +	help
> > > +	  This driver adds support for several watchdogs found in
> > > Industrial
> > > +	  PCs from Siemens.
> > > +
> > > +	  To compile this driver as a module, choose M here: the
> > > module will be
> > > +	  called simatic-ipc-wdt.
> > > +
> > >  # M68K Architecture
> > >  
> > >  config M54xx_WATCHDOG
> > > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > > index f3a6540e725e..7f5c73ec058c 100644
> > > --- a/drivers/watchdog/Makefile
> > > +++ b/drivers/watchdog/Makefile
> > > @@ -142,6 +142,7 @@ obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
> > >  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
> > >  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
> > >  obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
> > > +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_WDT) += simatic-ipc-wdt.o
> > >  
> > >  # M68K Architecture
> > >  obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
> > > diff --git a/drivers/watchdog/simatic-ipc-wdt.c
> > > b/drivers/watchdog/simatic-ipc-wdt.c new file mode 100644
> > > index 000000000000..b5c8b7ceb404
> > > --- /dev/null
> > > +++ b/drivers/watchdog/simatic-ipc-wdt.c
> > > @@ -0,0 +1,305 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Siemens SIMATIC IPC driver for Watchdogs
> > > + *
> > > + * Copyright (c) Siemens AG, 2020-2021
> > > + *
> > > + * Authors:
> > > + *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > modify
> > > + * it under the terms of the GNU General Public License version 2
> > > as
> > > + * published by the Free Software Foundation.    
> > 
> > Covered by SPDX-License-Identifier
> >   
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/init.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/watchdog.h>
> > > +#include <linux/ioport.h>
> > > +#include <linux/sizes.h>> +#include <linux/io.h>
> > > +#include <linux/platform_data/x86/simatic-ipc-base.h>    
> > 
> > Alphabetic order please
> >   
> > > +
> > > +#define WD_ENABLE_IOADR		0x62
> > > +#define WD_TRIGGER_IOADR	0x66
> > > +#define GPIO_COMMUNITY0_PORT_ID 0xaf
> > > +#define PAD_CFG_DW0_GPP_A_23	0x4b8    
> > 
> > Please increase indentation and spare another tab
> >   
> > > +#define SAFE_EN_N_427E		0x01
> > > +#define SAFE_EN_N_227E		0x04
> > > +#define WD_ENABLED		0x01
> > > +
> > > +#define TIMEOUT_MIN	2
> > > +#define TIMEOUT_DEF	64
> > > +#define TIMEOUT_MAX	64
> > > +
> > > +#define GP_STATUS_REG_227E	0x404D	/* IO PORT for
> > > SAFE_EN_N on 227E */ +
> > > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > > +module_param(nowayout, bool, 0000);
> > > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
> > > started (default="
> > > +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > > +
> > > +static DEFINE_SPINLOCK(io_lock);	/* the lock for io
> > > operations */ +static struct watchdog_device wdd;
> > > +    
> > 
> > Having two variables named 'wdd' is confusing. Please chose another
> > name.
> >   
> > > +static struct resource gp_status_reg_227e_res =
> > > +	DEFINE_RES_IO_NAMED(GP_STATUS_REG_227E, SZ_1,
> > > KBUILD_MODNAME); +
> > > +static struct resource io_resource =
> > > +	DEFINE_RES_IO_NAMED(WD_ENABLE_IOADR, SZ_1,
> > > +			    KBUILD_MODNAME " WD_ENABLE_IOADR");
> > > +
> > > +/* the actual start will be discovered with pci, 0 is a
> > > placeholder */ +static struct resource mem_resource =
> > > +	DEFINE_RES_MEM_NAMED(0, SZ_4, "WD_RESET_BASE_ADR");
> > > +
> > > +static u32 wd_timeout_table[] = {2, 4, 6, 8, 16, 32, 48, 64 };
> > > +static void __iomem *wd_reset_base_addr;
> > > +
> > > +static int get_timeout_idx(u32 timeout)
> > > +{
> > > +	int i;
> > > +
> > > +	i = ARRAY_SIZE(wd_timeout_table) - 1;
> > > +	for (; i >= 0; i--) {
> > > +		if (timeout >= wd_timeout_table[i])
> > > +			break;
> > > +	}
> > > +
> > > +	return i;
> > > +}    
> > 
> > Please add a comment explaining why you don't use find_closest().  
> 
> Will not be a comment but we will switch to using this, thanks for
> pointing it out.
> 
> > > +
> > > +static int wd_start(struct watchdog_device *wdd)
> > > +{
> > > +	u8 regval;
> > > +
> > > +	spin_lock(&io_lock);
> > > +    
> > The watchdog subsystem already provides locking
> > since the watchdog device can only be opened once.
> > 
> > Why is the additional lock needed ?  
> 
> We had this under internal review and somehow came to the conclusion
> that we "might" need it. I think we will remove it or come back with
> reasons.
> 
> > > +	regval = inb(WD_ENABLE_IOADR);
> > > +	regval |= WD_ENABLED;
> > > +	outb(regval, WD_ENABLE_IOADR);
> > > +
> > > +	spin_unlock(&io_lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int wd_stop(struct watchdog_device *wdd)
> > > +{
> > > +	u8 regval;
> > > +
> > > +	spin_lock(&io_lock);
> > > +
> > > +	regval = inb(WD_ENABLE_IOADR);
> > > +	regval &= ~WD_ENABLED;
> > > +	outb(regval, WD_ENABLE_IOADR);
> > > +
> > > +	spin_unlock(&io_lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int wd_ping(struct watchdog_device *wdd)
> > > +{
> > > +	inb(WD_TRIGGER_IOADR);
> > > +	return 0;
> > > +}
> > > +
> > > +static int wd_set_timeout(struct watchdog_device *wdd, unsigned
> > > int t) +{
> > > +	u8 regval;
> > > +	int timeout_idx = get_timeout_idx(t);
> > > +
> > > +	spin_lock(&io_lock);
> > > +
> > > +	regval = inb(WD_ENABLE_IOADR) & 0xc7;
> > > +	regval |= timeout_idx << 3;
> > > +	outb(regval, WD_ENABLE_IOADR);
> > > +
> > > +	spin_unlock(&io_lock);
> > > +	wdd->timeout = wd_timeout_table[timeout_idx];
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct watchdog_info wdt_ident = {
> > > +	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING
> > > |
> > > +			  WDIOF_SETTIMEOUT,
> > > +	.identity	= KBUILD_MODNAME,
> > > +};
> > > +
> > > +static const struct watchdog_ops wdt_ops = {
> > > +	.owner		= THIS_MODULE,
> > > +	.start		= wd_start,
> > > +	.stop		= wd_stop,
> > > +	.ping		= wd_ping,
> > > +	.set_timeout	= wd_set_timeout,
> > > +};
> > > +
> > > +static void wd_set_safe_en_n(u32 wdtmode, bool safe_en_n)
> > > +{
> > > +	u16 resetbit;
> > > +
> > > +	if (wdtmode == SIMATIC_IPC_DEVICE_227E) {
> > > +		/* enable SAFE_EN_N on GP_STATUS_REG_227E */
> > > +		resetbit = inw(GP_STATUS_REG_227E);
> > > +		if (safe_en_n)
> > > +			resetbit &= ~SAFE_EN_N_227E;
> > > +		else
> > > +			resetbit |= SAFE_EN_N_227E;
> > > +
> > > +		outw(resetbit, GP_STATUS_REG_227E);
> > > +	} else {
> > > +		/* enable SAFE_EN_N on PCH D1600 */
> > > +		resetbit = ioread16(wd_reset_base_addr);
> > > +
> > > +		if (safe_en_n)
> > > +			resetbit &= ~SAFE_EN_N_427E;
> > > +		else
> > > +			resetbit |= SAFE_EN_N_427E;
> > > +
> > > +		iowrite16(resetbit, wd_reset_base_addr);
> > > +	}
> > > +}
> > > +
> > > +static int wd_setup(u32 wdtmode, bool safe_en_n)
> > > +{
> > > +	u8 regval;
> > > +	int timeout_idx = 0;    
> > 
> > Unnecessary initialization
> >   
> > > +	bool alarm_active;
> > > +
> > > +	timeout_idx = get_timeout_idx(TIMEOUT_DEF);
> > > +
> > > +	wd_set_safe_en_n(wdtmode, safe_en_n);
> > > +
> > > +	/* read wd register to determine alarm state */
> > > +	regval = inb(WD_ENABLE_IOADR);
> > > +	if (regval & 0x80) {
> > > +		pr_warn("Watchdog alarm active.\n");    
> > 
> > Why does that warrant a warning, and what does it mean ? The context
> > suggests that it means the previous reset was caused by the
> > watchdog, but that is not what the message says.
> >   
> > > +		regval = 0x82;	/* use only macro mode,
> > > reset alarm bit */
> > > +		alarm_active = true;
> > > +	} else {
> > > +		regval = 0x02;	/* use only macro mode */
> > > +		alarm_active = false;
> > > +	}    
> > 
> > Would it hurt to just always write 0x82 ?
> > 	alarm_active = regval & 0x80;
> > 	regval = 0x82 | timeout_idx << 3;
> > 
> > would be much simpler. Or, if you prefer,
> > 	alarm_active = !!(regval & 0x80);
> > 	regval = 0x82 | timeout_idx << 3;
> > 
> > Actually, regval isn't even needed in that case.
> > 	alarm_active = !!(regval & 0x80);
> > 	outb(0x82 | timeout_idx << 3, WD_ENABLE_IOADR);
> > 
> > 
> > Either case, please use defines for the bits. WD_ENABLED is already
> > defined, thus the other bits should be set using defines as well.
> >   
> > > +
> > > +	regval |= timeout_idx << 3;
> > > +	if (nowayout)
> > > +		regval |= WD_ENABLED;    
> > 
> > This is not the purpose of nowayout. nowayout prevents stopping
> > the watchdog after it has been started. It is not expected to start
> > the watchdog on boot.  
> 
> Thanks, that was misunderstood by the author, will fix.
> 
> > > +
> > > +	outb(regval, WD_ENABLE_IOADR);
> > > +
> > > +	return alarm_active;
> > > +}
> > > +
> > > +static int simatic_ipc_wdt_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	int rc = 0;
> > > +	struct simatic_ipc_platform *plat =
> > > pdev->dev.platform_data;
> > > +	struct resource *res;
> > > +    
> > 
> > Is it guaranteed that the device will always be instantiated only
> > once ? If so, how it it guaranteed ?  
> 
> I suppose if anything did register two platform devices on the
> platform bus this might not be guaranteed. The assumption is that
> simatic-ipc will only ever register one, and the machines always have
> 0-1 "Siemens watchdogs" so at the moment there will never be a need
> for more than one.

Turns out the platform bus would not even allow registering the same
device twice. So it is guaranteed but nobody every attempting it in the
first place, and it never working in the second.

Henning

> 
> > Because if there are ever multiple instances the various static
> > variables will cause major trouble (which is why it is always better
> > to not use static variables).
> >   
> > > +	pr_debug(KBUILD_MODNAME ":%s(#%d) WDT mode: %d\n",
> > > +		 __func__, __LINE__, plat->devmode);
> > > +    
> > 
> > This is a platform device. Please use dev_ messages (dev_warn,
> > dev_dbg etc) throughout.
> >   
> > > +	switch (plat->devmode) {
> > > +	case SIMATIC_IPC_DEVICE_227E:
> > > +		if (!devm_request_region(dev,
> > > gp_status_reg_227e_res.start,
> > > +
> > > resource_size(&gp_status_reg_227e_res),
> > > +					 KBUILD_MODNAME)) {
> > > +			dev_err(dev,
> > > +				"Unable to register IO resource
> > > at %pR\n",
> > > +				&gp_status_reg_227e_res);
> > > +			return -EBUSY;
> > > +		}
> > > +		fallthrough;
> > > +	case SIMATIC_IPC_DEVICE_427E:
> > > +		wdd.info = &wdt_ident;
> > > +		wdd.ops = &wdt_ops;
> > > +		wdd.min_timeout = TIMEOUT_MIN;
> > > +		wdd.max_timeout = TIMEOUT_MAX;    
> > 
> > Why not use static initialization ?
> >   
> > > +		wdd.parent = NULL;    
> > 
> > parent should be the platform device.
> >   
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (!devm_request_region(dev, io_resource.start,
> > > +				 resource_size(&io_resource),
> > > +				 io_resource.name)) {
> > > +		dev_err(dev,
> > > +			"Unable to register IO resource at
> > > %#x\n",
> > > +			WD_ENABLE_IOADR);
> > > +		return -EBUSY;
> > > +	}    
> > 
> > If this is what prevents multiple registrations, it is too late: wdd
> > is already overwritten.  
> 
> As said, there will be no double-registration.
> 
> > > +
> > > +	if (plat->devmode == SIMATIC_IPC_DEVICE_427E) {
> > > +		res = &mem_resource;
> > > +
> > > +		/* get GPIO base from PCI */
> > > +		res->start =
> > > simatic_ipc_get_membase0(PCI_DEVFN(0x1f, 1));
> > > +		if (res->start == 0)
> > > +			return -ENODEV;
> > > +
> > > +		/* do the final address calculation */
> > > +		res->start = res->start +
> > > (GPIO_COMMUNITY0_PORT_ID << 16) +
> > > +			     PAD_CFG_DW0_GPP_A_23;
> > > +		res->end += res->start;
> > > +
> > > +		wd_reset_base_addr = devm_ioremap_resource(dev,
> > > res);
> > > +		if (IS_ERR(wd_reset_base_addr))
> > > +			return -ENOMEM;    
> > 
> > 			return PTR_ERR(wd_reset_base_addr);
> >   
> > > +	}
> > > +
> > > +	wdd.bootstatus = wd_setup(plat->devmode, true);    
> > 
> > bootstatus does not report a boolean. This translates to
> > WDIOF_OVERHEAT which is almost certainly wrong.
> >   
> > > +	if (wdd.bootstatus)
> > > +		pr_warn(KBUILD_MODNAME ": last reboot caused by
> > > watchdog reset\n");    
> > 
> > Why two messages ?
> >   
> > > +
> > > +	watchdog_set_nowayout(&wdd, nowayout);
> > > +	watchdog_stop_on_reboot(&wdd);
> > > +
> > > +	rc = devm_watchdog_register_device(dev, &wdd);
> > > +    
> > Extra empty line not needed
> >   
> > > +	if (rc == 0)
> > > +		pr_debug("initialized. nowayout=%d\n",
> > > +			 nowayout);    
> > 
> > What is the value of this message (especially since there is no
> > message if there is an error) ?
> >   
> > > +
> > > +	return rc;
> > > +}
> > > +
> > > +static int simatic_ipc_wdt_remove(struct platform_device *pdev)
> > > +{
> > > +	struct simatic_ipc_platform *plat =
> > > pdev->dev.platform_data; +
> > > +	wd_setup(plat->devmode, false);    
> > 
> > This warrants an explanation. What is the point of updating the
> > timeout here ? And what does SAFE_EN actually do ?  
> 
> The idea was that module unloading should disable the watchdog, but
> that code will be removed and aligned with other watchdogs.
> 
> SAFE_EN is a second enable bit, if it is not set the watchdog will
> fire into the void. Pretty pointless will keep that always armed or
> set it always when toggling "enable".
> 
> All the other open points are pretty clear, and will all be dealt with
> in v2.
> 
> regards,
> Henning
> 
> > The watchdog is stopped on reboot, but this function won't
> > be called in that case, making this call even more questionable.
> > Please document what it does and why it is needed here (but not
> > when rebooting).
> >   
> > > +	return 0;
> > > +}
> > > +
> > > +static struct platform_driver wdt_driver = {
> > > +	.probe = simatic_ipc_wdt_probe,
> > > +	.remove = simatic_ipc_wdt_remove,
> > > +	.driver = {
> > > +		.name = KBUILD_MODNAME,
> > > +	},
> > > +};
> > > +
> > > +static int __init simatic_ipc_wdt_init(void)
> > > +{
> > > +	return platform_driver_register(&wdt_driver);
> > > +}
> > > +
> > > +static void __exit simatic_ipc_wdt_exit(void)
> > > +{
> > > +	platform_driver_unregister(&wdt_driver);
> > > +}
> > > +
> > > +module_init(simatic_ipc_wdt_init);
> > > +module_exit(simatic_ipc_wdt_exit);    
> > 
> > Why not module_platform_driver() ?
> >   
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> > > +MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
> > >     
> >   
> 

