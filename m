Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C7F33BF72
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 16:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhCOPKn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 11:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbhCOPK3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 11:10:29 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78F0C06174A;
        Mon, 15 Mar 2021 08:10:28 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id n23so7176045otq.1;
        Mon, 15 Mar 2021 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r78QQz2sup9QgAliK29er1KN/1tHGpym7UCdQOaE1KQ=;
        b=bSnCjFumfA+aTu9RG/OPRn/n8BEj18r/A9jFzGGyzZQgj1fxlryHBEYoEsGa1SlL1B
         z1uz61vsKhhznrRvayNWkf6KOECL8g/uwwVYTn+E6DGr51k/N5zy2qIxWXTtec5CRGuT
         0vTM1u7cHVymcgfhvM3UBXjuhDtU4LM2OA0hKuYe16mNhj+Um+F0MafIQx4v7sYXIJBr
         R85alj5jpGfn4NkeTfwwIiKQbbnD4wBC23FPLZWzKhnIbmoQ5E1iNFgWKnYaphAyUjg4
         FPX8TJBgQrlu932Tjt7UrJjTu7SNRAVbAWvVkrbBc+UKbs7TNNzuO6xt6BvANOzPbxeQ
         YffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=r78QQz2sup9QgAliK29er1KN/1tHGpym7UCdQOaE1KQ=;
        b=NOAmmrd4lkMfAZhmRMpNroj8rRPL0VMokL8u3ac0S2oKsGM+OfnwxZHLUsWczXy7i5
         lvPcdnNPr8BYmKB+qGG9HHMi2unbQD0OJnHh2P6o3dZsifFpHxtOfOrNySTm2DyIWQTW
         jOQmOoyBYzRghd4IlxcAdwDifX0/xL4WMDYKJH8cHBeN8v4U+OIQtHWFJjV4H6FyMrzU
         f+1O0mAtDyi0mqkTKr5D9+XAbNfp6yrooJ9vqG1Ssev7DdwpHHndU6r43qhwetqGEpK2
         tesGhFXXZzDqqIqZXBlRminGNu+2y8nS9xVLSumYValV6HT05Ouru3T/AUlpbegDqt02
         rXsg==
X-Gm-Message-State: AOAM5304gbtcaAA0+rTKUSAW6Lnyjz5J7cu62tnnq2F1Vj5sJUgqCoST
        ZUPJC77McSTlSWcBRqRzs8M=
X-Google-Smtp-Source: ABdhPJz2RX3IoK62ODIxVB9xMc7y2AGj582ZSo3QYwfjwX01nausDaZlPhjboj/R6xW5kTjcjn6spA==
X-Received: by 2002:a9d:6296:: with SMTP id x22mr14023610otk.196.1615821027922;
        Mon, 15 Mar 2021 08:10:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 70sm6222963oie.38.2021.03.15.08.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 08:10:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-4-henning.schild@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <120cb6ea-a0a8-a0e8-25ec-50d1d2dbe56d@roeck-us.net>
Date:   Mon, 15 Mar 2021 08:10:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315095710.7140-4-henning.schild@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/15/21 2:57 AM, Henning Schild wrote:
> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig           |  11 ++
>  drivers/watchdog/Makefile          |   1 +
>  drivers/watchdog/simatic-ipc-wdt.c | 215 +++++++++++++++++++++++++++++
>  3 files changed, 227 insertions(+)
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
> index 000000000000..f0f948968db3
> --- /dev/null
> +++ b/drivers/watchdog/simatic-ipc-wdt.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Siemens SIMATIC IPC driver for Watchdogs
> + *
> + * Copyright (c) Siemens AG, 2020-2021
> + *
> + * Authors:
> + *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_data/x86/simatic-ipc-base.h>
> +#include <linux/platform_device.h>
> +#include <linux/sizes.h>
> +#include <linux/util_macros.h>
> +#include <linux/watchdog.h>
> +
> +#define WD_ENABLE_IOADR			0x62
> +#define WD_TRIGGER_IOADR		0x66
> +#define GPIO_COMMUNITY0_PORT_ID		0xaf
> +#define PAD_CFG_DW0_GPP_A_23		0x4b8
> +#define SAFE_EN_N_427E			0x01
> +#define SAFE_EN_N_227E			0x04
> +#define WD_ENABLED			0x01
> +#define WD_TRIGGERED			0x80
> +#define WD_MACROMODE			0x02
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
> +static int wd_start(struct watchdog_device *wdd)
> +{
> +	outb(inb(WD_ENABLE_IOADR) | WD_ENABLED, WD_ENABLE_IOADR);
> +	return 0;
> +}
> +
> +static int wd_stop(struct watchdog_device *wdd)
> +{
> +	outb(inb(WD_ENABLE_IOADR) & ~WD_ENABLED, WD_ENABLE_IOADR);
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
> +	int timeout_idx = find_closest(t, wd_timeout_table,
> +				       ARRAY_SIZE(wd_timeout_table));
> +
> +	outb((inb(WD_ENABLE_IOADR) & 0xc7) | timeout_idx << 3, WD_ENABLE_IOADR);
> +	wdd->timeout = wd_timeout_table[timeout_idx];
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
> +static void wd_secondary_enable(u32 wdtmode)
> +{
> +	u16 resetbit;
> +
> +	/* set safe_en_n so we are not just WDIOF_ALARMONLY */
> +	if (wdtmode == SIMATIC_IPC_DEVICE_227E) {
> +		/* enable SAFE_EN_N on GP_STATUS_REG_227E */
> +		resetbit = inw(GP_STATUS_REG_227E);
> +		outw(resetbit & ~SAFE_EN_N_227E, GP_STATUS_REG_227E);
> +	} else {
> +		/* enable SAFE_EN_N on PCH D1600 */
> +		resetbit = ioread16(wd_reset_base_addr);
> +		iowrite16(resetbit & ~SAFE_EN_N_427E, wd_reset_base_addr);
> +	}
> +}
> +
> +static int wd_setup(u32 wdtmode)
> +{
> +	unsigned int bootstatus = 0;
> +	int timeout_idx;
> +
> +	timeout_idx = find_closest(TIMEOUT_DEF, wd_timeout_table,
> +				   ARRAY_SIZE(wd_timeout_table));
> +
> +	if (inb(WD_ENABLE_IOADR) & WD_TRIGGERED)
> +		bootstatus |= WDIOF_CARDRESET;
> +
> +	/* reset alarm bit, set macro mode, and set timeout */
> +	outb(WD_TRIGGERED | WD_MACROMODE | timeout_idx << 3, WD_ENABLE_IOADR);
> +
> +	wd_secondary_enable(wdtmode);
> +
> +	return bootstatus;
> +}
> +
> +static struct watchdog_device wdd_data = {
> +	.info = &wdt_ident,
> +	.ops = &wdt_ops,
> +	.min_timeout = TIMEOUT_MIN,
> +	.max_timeout = TIMEOUT_MAX
> +};
> +
> +static int simatic_ipc_wdt_probe(struct platform_device *pdev)
> +{
> +	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +
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
> +		wdd_data.parent = dev;
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
> +			return PTR_ERR(wd_reset_base_addr);
> +	}
> +
> +	wdd_data.bootstatus = wd_setup(plat->devmode);
> +	if (wdd_data.bootstatus)
> +		dev_warn(dev, "last reboot caused by watchdog reset\n");
> +
> +	watchdog_set_nowayout(&wdd_data, nowayout);
> +	watchdog_stop_on_reboot(&wdd_data);
> +	return devm_watchdog_register_device(dev, &wdd_data);
> +}
> +
> +static struct platform_driver wdt_driver = {
> +	.probe = simatic_ipc_wdt_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	},
> +};
> +
> +module_platform_driver(wdt_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> +MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
> 

