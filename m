Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC69E32B55F
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Mar 2021 08:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbhCCG76 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 01:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1581120AbhCBSjS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Mar 2021 13:39:18 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9ABC061788;
        Tue,  2 Mar 2021 10:38:24 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id u3so2773750otg.13;
        Tue, 02 Mar 2021 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MLODrDa/jWRr8VGFlAuwpqV3z8f/i6PYXq/VrskEnpU=;
        b=rrMmaBfJFbrA6iI32TldA9Ry5I18tcHubmjRvNGHO17YQ618IMsGyL3KMuHtD9+Wyr
         ycz1dLGHIEL7A8T1IJYzYs9Xe4TQBuCq/DX3SfIykfSndQ4AitwBA1mStLx7F5uE7795
         6ow3mYZqOaeY1oeaa1Q1W46+x6jNYBL8GMJIi9sDXEfPQaUyO0ZdRzDmSUd1CDxb6HvN
         nWcd43CyO3TbxCV3I65P+6hfDyECdaG2tFnUrEXmTcwKBxZ8tTv+lPcXldeGNr6KzA27
         ivn3A64P/OkP0eyjgPJovd9j90lMWCKSJbPPuBau1E06dRsYnnuEkW2+agqpGBTFiZ7s
         rX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MLODrDa/jWRr8VGFlAuwpqV3z8f/i6PYXq/VrskEnpU=;
        b=iYA/14oELCPEtS2RWaUfTDY0zH8gOeeN+jQRQ/7zQo0XPzXfIC9fTAGTAwmasVvBjH
         MasOil9nLVC/3pSNNQOGqRZsaF6owDV9x1JJ+n7+KWmVbS6jL7Pv8rilkFuDrFc2ocK6
         dJknh8sqD3jp07Yx0TorEJwqT8htoNlW+lPiI5EYyO7117YAmRy8Lnh0dTxtKHkVfbtc
         JGxptvTWmuWdCYwG7051BxN4oZEqGs9ykJE5Kzkv9PdrPzjFNOsuC+IteUwHabZSX851
         +j3uLLOz4Yp2pEGxJOkRYEFYjZ6gLKEwcjfEPKS4tiwe542OfQJdwuNLSUv2fsl0gNfU
         wCFQ==
X-Gm-Message-State: AOAM5311Q06moqoeObJW0Nfla0HMriq48agkEtz9I3YLN6oW6jIk2Ruc
        1kSPvK3WPZ0MVJuDscpyA0g=
X-Google-Smtp-Source: ABdhPJwr93q5z0IeQWYVblU8O9fCFQiDuucZuOluU+PZzgJDgjXRe1PoSC//Z43wB2Ua7LaV0COpww==
X-Received: by 2002:a9d:709a:: with SMTP id l26mr18696304otj.178.1614710304094;
        Tue, 02 Mar 2021 10:38:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m187sm4104717oif.43.2021.03.02.10.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 10:38:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/4] watchdog: simatic-ipc-wdt: add new driver for Siemens
 Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-4-henning.schild@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <fa73ed42-dcbc-26c8-f119-244d4f4eea03@roeck-us.net>
Date:   Tue, 2 Mar 2021 10:38:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302163309.25528-4-henning.schild@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/2/21 8:33 AM, Henning Schild wrote:
> From: Henning Schild <henning.schild@siemens.com>
> 
> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.
> 
> Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  drivers/watchdog/Kconfig           |  11 ++
>  drivers/watchdog/Makefile          |   1 +
>  drivers/watchdog/simatic-ipc-wdt.c | 305 +++++++++++++++++++++++++++++
>  3 files changed, 317 insertions(+)
>  create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 1fe0042a48d2..948497eb4bef 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1575,6 +1575,17 @@ config NIC7018_WDT
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called nic7018_wdt.
>  
> +config SIEMENS_SIMATIC_IPC_WDT
> +	tristate "Siemens Simatic IPC Watchdog"
> +	depends on SIEMENS_SIMATIC_IPC
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds support for several watchdogs found in Industrial
> +	  PCs from Siemens.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called simatic-ipc-wdt.
> +
>  # M68K Architecture
>  
>  config M54xx_WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index f3a6540e725e..7f5c73ec058c 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -142,6 +142,7 @@ obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
>  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
>  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
>  obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_WDT) += simatic-ipc-wdt.o
>  
>  # M68K Architecture
>  obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
> diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
> new file mode 100644
> index 000000000000..b5c8b7ceb404
> --- /dev/null
> +++ b/drivers/watchdog/simatic-ipc-wdt.c
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Siemens SIMATIC IPC driver for Watchdogs
> + *
> + * Copyright (c) Siemens AG, 2020-2021
> + *
> + * Authors:
> + *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Covered by SPDX-License-Identifier

> + */
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/errno.h>
> +#include <linux/watchdog.h>
> +#include <linux/ioport.h>
> +#include <linux/sizes.h>> +#include <linux/io.h>
> +#include <linux/platform_data/x86/simatic-ipc-base.h>

Alphabetic order please

> +
> +#define WD_ENABLE_IOADR		0x62
> +#define WD_TRIGGER_IOADR	0x66
> +#define GPIO_COMMUNITY0_PORT_ID 0xaf
> +#define PAD_CFG_DW0_GPP_A_23	0x4b8

Please increase indentation and spare another tab

> +#define SAFE_EN_N_427E		0x01
> +#define SAFE_EN_N_227E		0x04
> +#define WD_ENABLED		0x01
> +
> +#define TIMEOUT_MIN	2
> +#define TIMEOUT_DEF	64
> +#define TIMEOUT_MAX	64
> +
> +#define GP_STATUS_REG_227E	0x404D	/* IO PORT for SAFE_EN_N on 227E */
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0000);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static DEFINE_SPINLOCK(io_lock);	/* the lock for io operations */
> +static struct watchdog_device wdd;
> +

Having two variables named 'wdd' is confusing. Please chose another name.

> +static struct resource gp_status_reg_227e_res =
> +	DEFINE_RES_IO_NAMED(GP_STATUS_REG_227E, SZ_1, KBUILD_MODNAME);
> +
> +static struct resource io_resource =
> +	DEFINE_RES_IO_NAMED(WD_ENABLE_IOADR, SZ_1,
> +			    KBUILD_MODNAME " WD_ENABLE_IOADR");
> +
> +/* the actual start will be discovered with pci, 0 is a placeholder */
> +static struct resource mem_resource =
> +	DEFINE_RES_MEM_NAMED(0, SZ_4, "WD_RESET_BASE_ADR");
> +
> +static u32 wd_timeout_table[] = {2, 4, 6, 8, 16, 32, 48, 64 };
> +static void __iomem *wd_reset_base_addr;
> +
> +static int get_timeout_idx(u32 timeout)
> +{
> +	int i;
> +
> +	i = ARRAY_SIZE(wd_timeout_table) - 1;
> +	for (; i >= 0; i--) {
> +		if (timeout >= wd_timeout_table[i])
> +			break;
> +	}
> +
> +	return i;
> +}

Please add a comment explaining why you don't use find_closest().

> +
> +static int wd_start(struct watchdog_device *wdd)
> +{
> +	u8 regval;
> +
> +	spin_lock(&io_lock);
> +
The watchdog subsystem already provides locking
since the watchdog device can only be opened once.

Why is the additional lock needed ?

> +	regval = inb(WD_ENABLE_IOADR);
> +	regval |= WD_ENABLED;
> +	outb(regval, WD_ENABLE_IOADR);
> +
> +	spin_unlock(&io_lock);
> +
> +	return 0;
> +}
> +
> +static int wd_stop(struct watchdog_device *wdd)
> +{
> +	u8 regval;
> +
> +	spin_lock(&io_lock);
> +
> +	regval = inb(WD_ENABLE_IOADR);
> +	regval &= ~WD_ENABLED;
> +	outb(regval, WD_ENABLE_IOADR);
> +
> +	spin_unlock(&io_lock);
> +
> +	return 0;
> +}
> +
> +static int wd_ping(struct watchdog_device *wdd)
> +{
> +	inb(WD_TRIGGER_IOADR);
> +	return 0;
> +}
> +
> +static int wd_set_timeout(struct watchdog_device *wdd, unsigned int t)
> +{
> +	u8 regval;
> +	int timeout_idx = get_timeout_idx(t);
> +
> +	spin_lock(&io_lock);
> +
> +	regval = inb(WD_ENABLE_IOADR) & 0xc7;
> +	regval |= timeout_idx << 3;
> +	outb(regval, WD_ENABLE_IOADR);
> +
> +	spin_unlock(&io_lock);
> +	wdd->timeout = wd_timeout_table[timeout_idx];
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info wdt_ident = {
> +	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
> +			  WDIOF_SETTIMEOUT,
> +	.identity	= KBUILD_MODNAME,
> +};
> +
> +static const struct watchdog_ops wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= wd_start,
> +	.stop		= wd_stop,
> +	.ping		= wd_ping,
> +	.set_timeout	= wd_set_timeout,
> +};
> +
> +static void wd_set_safe_en_n(u32 wdtmode, bool safe_en_n)
> +{
> +	u16 resetbit;
> +
> +	if (wdtmode == SIMATIC_IPC_DEVICE_227E) {
> +		/* enable SAFE_EN_N on GP_STATUS_REG_227E */
> +		resetbit = inw(GP_STATUS_REG_227E);
> +		if (safe_en_n)
> +			resetbit &= ~SAFE_EN_N_227E;
> +		else
> +			resetbit |= SAFE_EN_N_227E;
> +
> +		outw(resetbit, GP_STATUS_REG_227E);
> +	} else {
> +		/* enable SAFE_EN_N on PCH D1600 */
> +		resetbit = ioread16(wd_reset_base_addr);
> +
> +		if (safe_en_n)
> +			resetbit &= ~SAFE_EN_N_427E;
> +		else
> +			resetbit |= SAFE_EN_N_427E;
> +
> +		iowrite16(resetbit, wd_reset_base_addr);
> +	}
> +}
> +
> +static int wd_setup(u32 wdtmode, bool safe_en_n)
> +{
> +	u8 regval;
> +	int timeout_idx = 0;

Unnecessary initialization

> +	bool alarm_active;
> +
> +	timeout_idx = get_timeout_idx(TIMEOUT_DEF);
> +
> +	wd_set_safe_en_n(wdtmode, safe_en_n);
> +
> +	/* read wd register to determine alarm state */
> +	regval = inb(WD_ENABLE_IOADR);
> +	if (regval & 0x80) {
> +		pr_warn("Watchdog alarm active.\n");

Why does that warrant a warning, and what does it mean ? The context suggests
that it means the previous reset was caused by the watchdog, but that is not
what the message says.

> +		regval = 0x82;	/* use only macro mode, reset alarm bit */
> +		alarm_active = true;
> +	} else {
> +		regval = 0x02;	/* use only macro mode */
> +		alarm_active = false;
> +	}

Would it hurt to just always write 0x82 ?
	alarm_active = regval & 0x80;
	regval = 0x82 | timeout_idx << 3;

would be much simpler. Or, if you prefer,
	alarm_active = !!(regval & 0x80);
	regval = 0x82 | timeout_idx << 3;

Actually, regval isn't even needed in that case.
	alarm_active = !!(regval & 0x80);
	outb(0x82 | timeout_idx << 3, WD_ENABLE_IOADR);


Either case, please use defines for the bits. WD_ENABLED is already
defined, thus the other bits should be set using defines as well.

> +
> +	regval |= timeout_idx << 3;
> +	if (nowayout)
> +		regval |= WD_ENABLED;

This is not the purpose of nowayout. nowayout prevents stopping
the watchdog after it has been started. It is not expected to start
the watchdog on boot.

> +
> +	outb(regval, WD_ENABLE_IOADR);
> +
> +	return alarm_active;
> +}
> +
> +static int simatic_ipc_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int rc = 0;
> +	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
> +	struct resource *res;
> +

Is it guaranteed that the device will always be instantiated only once ?
If so, how it it guaranteed ?

Because if there are ever multiple instances the various static variables
will cause major trouble (which is why it is always better to not use static
variables).

> +	pr_debug(KBUILD_MODNAME ":%s(#%d) WDT mode: %d\n",
> +		 __func__, __LINE__, plat->devmode);
> +

This is a platform device. Please use dev_ messages (dev_warn, dev_dbg etc)
throughout.

> +	switch (plat->devmode) {
> +	case SIMATIC_IPC_DEVICE_227E:
> +		if (!devm_request_region(dev, gp_status_reg_227e_res.start,
> +					 resource_size(&gp_status_reg_227e_res),
> +					 KBUILD_MODNAME)) {
> +			dev_err(dev,
> +				"Unable to register IO resource at %pR\n",
> +				&gp_status_reg_227e_res);
> +			return -EBUSY;
> +		}
> +		fallthrough;
> +	case SIMATIC_IPC_DEVICE_427E:
> +		wdd.info = &wdt_ident;
> +		wdd.ops = &wdt_ops;
> +		wdd.min_timeout = TIMEOUT_MIN;
> +		wdd.max_timeout = TIMEOUT_MAX;

Why not use static initialization ?

> +		wdd.parent = NULL;

parent should be the platform device.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!devm_request_region(dev, io_resource.start,
> +				 resource_size(&io_resource),
> +				 io_resource.name)) {
> +		dev_err(dev,
> +			"Unable to register IO resource at %#x\n",
> +			WD_ENABLE_IOADR);
> +		return -EBUSY;
> +	}

If this is what prevents multiple registrations, it is too late: wdd
is already overwritten.

> +
> +	if (plat->devmode == SIMATIC_IPC_DEVICE_427E) {
> +		res = &mem_resource;
> +
> +		/* get GPIO base from PCI */
> +		res->start = simatic_ipc_get_membase0(PCI_DEVFN(0x1f, 1));
> +		if (res->start == 0)
> +			return -ENODEV;
> +
> +		/* do the final address calculation */
> +		res->start = res->start + (GPIO_COMMUNITY0_PORT_ID << 16) +
> +			     PAD_CFG_DW0_GPP_A_23;
> +		res->end += res->start;
> +
> +		wd_reset_base_addr = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(wd_reset_base_addr))
> +			return -ENOMEM;

			return PTR_ERR(wd_reset_base_addr);

> +	}
> +
> +	wdd.bootstatus = wd_setup(plat->devmode, true);

bootstatus does not report a boolean. This translates to WDIOF_OVERHEAT
which is almost certainly wrong.

> +	if (wdd.bootstatus)
> +		pr_warn(KBUILD_MODNAME ": last reboot caused by watchdog reset\n");

Why two messages ?

> +
> +	watchdog_set_nowayout(&wdd, nowayout);
> +	watchdog_stop_on_reboot(&wdd);
> +
> +	rc = devm_watchdog_register_device(dev, &wdd);
> +
Extra empty line not needed

> +	if (rc == 0)
> +		pr_debug("initialized. nowayout=%d\n",
> +			 nowayout);

What is the value of this message (especially since there is no message
if there is an error) ?

> +
> +	return rc;
> +}
> +
> +static int simatic_ipc_wdt_remove(struct platform_device *pdev)
> +{
> +	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
> +
> +	wd_setup(plat->devmode, false);

This warrants an explanation. What is the point of updating the timeout
here ? And what does SAFE_EN actually do ?

The watchdog is stopped on reboot, but this function won't
be called in that case, making this call even more questionable.
Please document what it does and why it is needed here (but not
when rebooting).

> +	return 0;
> +}
> +
> +static struct platform_driver wdt_driver = {
> +	.probe = simatic_ipc_wdt_probe,
> +	.remove = simatic_ipc_wdt_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	},
> +};
> +
> +static int __init simatic_ipc_wdt_init(void)
> +{
> +	return platform_driver_register(&wdt_driver);
> +}
> +
> +static void __exit simatic_ipc_wdt_exit(void)
> +{
> +	platform_driver_unregister(&wdt_driver);
> +}
> +
> +module_init(simatic_ipc_wdt_init);
> +module_exit(simatic_ipc_wdt_exit);

Why not module_platform_driver() ?

> +
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> +MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
> 

