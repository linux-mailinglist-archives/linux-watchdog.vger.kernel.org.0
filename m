Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A145FC8DF
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Oct 2022 18:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJLQJr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Oct 2022 12:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJLQJp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Oct 2022 12:09:45 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C806304
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Oct 2022 09:09:42 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id c24so16647036pls.9
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Oct 2022 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxSH+E6RtskuZP9bJvciMY5bcm8KR0bEyDpVySo7Ljs=;
        b=gj/wRU9tO6oVz3zxAzJUWVkm4Cqz75cwq5X+V3K9JXwj0HL+8k83GQGqIw9nK790z2
         FuK7q/SJmcZCj+QkBp5iCytryIkRn6e/OkEE2IbLWbbkLzzwTGNyKnf3YTp4UqJspuXH
         ah2zDMc98HfIJtGPQGSqlvUSYVUL/8HX+TN3CJylCyInwP/mXIKZ8LvD0zwm4OEpX2Th
         5Xjb1GCicdiRzgdKhYDAPEGN1+TXRe/wx36M/hG9+/fmJDHdLHeH/sndhY/NQatrBMPR
         CoUWHns6jYhnurh5CIJfeja2EEH0tCy96xBQ+xZJhhdv1PrQF86SBM/bnbSkgVg7Olx+
         8OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxSH+E6RtskuZP9bJvciMY5bcm8KR0bEyDpVySo7Ljs=;
        b=NSzpCs1lHTI9Wu4FDbj0vwgJqczDEGkvJ8zxS7bFp9xzY4DrQW4mLVEY/CeLI0+imO
         0jM1WLyt61OsyQLQBTJPrOeggxHQCQqudk0RjH0QNbhwpClj9MNWe1On1Cehe9YlgPh8
         ONecWnS0+RLp+hgUQEGN9nP6NwMBfCCtbq0iqtKvZGFfdLePSATUsoXZV+xw13PPuOXR
         h9AH1OeKa3XWMqS50CG4FWTCDIAOxNBnrnjJZZ9UY9Dj/uzWOVIPfUrgzcLlbTOHC3Ka
         tBy+21xd9iOwEwrN4qp7QUlNYGQ4PtIrkVBhI2CvD1CVbFCoP+ttQ4tFBsSVwV3CD1g7
         sv8A==
X-Gm-Message-State: ACrzQf1cCRi8I/fwsc40cpfqNLWPehu4oco7LMObxbzjA/TZR3zM1t9k
        oJO7htINwCu418R8CEAIyyWeh+67dU3USw==
X-Google-Smtp-Source: AMsMyM7fOWlexeK9720x7i2Fsz/pi6JwDoLj4UnfkZcexY3kTXeBjZ9TIDej8HLsU+WVV48ZzjZLpQ==
X-Received: by 2002:a17:90b:4f4d:b0:20d:a08e:3876 with SMTP id pj13-20020a17090b4f4d00b0020da08e3876mr336900pjb.0.1665590981800;
        Wed, 12 Oct 2022 09:09:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0053e8fe8a705sm76106pfg.17.2022.10.12.09.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:09:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 Oct 2022 09:09:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas Kastner <thomas.kastner@advantech.com>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] Added 'advantech_ec_wdt' watchdog driver
Message-ID: <20221012160939.GA2875718@roeck-us.net>
References: <Y0aQbw8TPpdp569v@EIS-S230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0aQbw8TPpdp569v@EIS-S230>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 12, 2022 at 12:01:19PM +0200, Thomas Kastner wrote:
> This patch adds the 'advantech_ec_wdt' kernel module which provides
> WDT support for Advantech platforms with ITE based Embedded Controller.
> 
> Signed-off-by: Thomas Kastner <thomas.kastner@advantech.com>

Subject: s/Added/Add/

> ---
>  drivers/watchdog/Kconfig            |   7 +
>  drivers/watchdog/Makefile           |   1 +
>  drivers/watchdog/advantech_ec_wdt.c | 247 ++++++++++++++++++++++++++++
>  3 files changed, 255 insertions(+)
>  create mode 100644 drivers/watchdog/advantech_ec_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 688922fc4edb..afe14f530291 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1055,6 +1055,13 @@ config ADVANTECH_WDT
>  	  feature. More information can be found at
>  	  <https://www.advantech.com.tw/products/>
>  
> +config ADVANTECH_EC_WDT
> +	tristate "Advantech Embedded Controller Watchdog Timer"
> +	depends on X86
> +	help
> +	   	This driver supports Advantech products with ITE based Embedded Controller.
> + 		It does not support Advantech products with other ECs or without EC.
> +
>  config ALIM1535_WDT
>  	tristate "ALi M1535 PMU Watchdog Timer"
>  	depends on X86 && PCI
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index cdeb119e6e61..2768dc2348af 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -102,6 +102,7 @@ obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>  obj-$(CONFIG_ADVANTECH_WDT) += advantechwdt.o
> +obj-$(CONFIG_ADVANTECH_EC_WDT) += advantech_ec_wdt.o
>  obj-$(CONFIG_ALIM1535_WDT) += alim1535_wdt.o
>  obj-$(CONFIG_ALIM7101_WDT) += alim7101_wdt.o
>  obj-$(CONFIG_EBC_C384_WDT) += ebc-c384_wdt.o
> diff --git a/drivers/watchdog/advantech_ec_wdt.c b/drivers/watchdog/advantech_ec_wdt.c
> new file mode 100644
> index 000000000000..f3babaa918f7
> --- /dev/null
> +++ b/drivers/watchdog/advantech_ec_wdt.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *	Advantech Embedded Controller Watchdog Driver
> + *
> + *	This driver supports Advantech products with ITE based Embedded Controller.
> + *	It does not support Advantech products with other ECs or without EC.
> + *
> + *	This software is provided "as is" without warranty of any kind.
> + *
> + *	Copyright (C) 2022 Advantech Europe B.V.
> + *	<thomas.kastner@advantech.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/isa.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +#include <linux/spinlock.h>

Alphabetic include file order, please.

> +
> +#define DRIVER_NAME		"advantech_ec_wdt"
> +
> +/* EC IO region */
> +#define BASE_ADDR		0x299
> +#define ADDR_EXTENT		2
> +
> +/* EC interface definitions */
> +#define EC_ADDR_CMD		0x29A
> +#define EC_ADDR_DATA		0x299
> +#define EC_CMD_EC_PROBE		0x30
> +#define EC_CMD_COMM		0x89
> +#define EC_CMD_WDT_START	0x28
> +#define EC_CMD_WDT_STOP		0x29
> +#define EC_CMD_WDT_RESET	0x2A
> +#define EC_DAT_EN_DLY_H		0x58
> +#define EC_DAT_EN_DLY_L		0x59
> +#define EC_DAT_RST_DLY_H	0x5E
> +#define EC_DAT_RST_DLY_L	0x5F
> +#define EC_MAGIC		0x95
> +
> +/* module parameters */
> +#define MIN_TIME		1
> +#define MAX_TIME		6000 /* 100 minutes */
> +#define DEFAULT_TIME		60
> +
> +static unsigned int timeout = DEFAULT_TIME;

This should be set to 0. The default timeout should be set
in struct watchdog_device.

> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout,
> +	"Default Watchdog timer setting ("
> +	__MODULE_STRING(DEFAULT_TIME) "s)."
> +	"The range is from " __MODULE_STRING(MIN_TIME)
> +	" to " __MODULE_STRING(MAX_TIME) ".");
> +
> +static int adv_ec_wdt_ping(struct watchdog_device *wdd)
> +{
> +	pr_debug("%s: Strobing watchdog\n", __func__);
> +
> +	/* reset watchdog */
> +	outb(EC_CMD_WDT_RESET, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);

Is this really needed ? If so, write an accessor function.
It would be preferred to have that accessor function wait
before accesses (cache the time of the last access and wait
if not enough time has expired). This would prevent unnecessary
wait operations in places like this one, where only a single
access happens.

> +	return 0;
> +}
> +
> +static int adv_ec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
> +{
> +	unsigned int val;
> +
> +	/* scale time to EC 100 ms base */
> +	val = t*10;

Space before and after '*'. Please run checkpatch; that should tell you.

> +
> +	pr_debug("%s: Setting timeout value of %i\n", __func__, val);
> +	/* reset enable delay, just in case it was set by BIOS etc. */
> +	outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +	outb(EC_DAT_EN_DLY_H, EC_ADDR_DATA);
> +	usleep_range(10000, 11000);
> +	outb(0, EC_ADDR_DATA);
> +	usleep_range(10000, 11000);
> +
> +	outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +	outb(EC_DAT_EN_DLY_L, EC_ADDR_DATA);
> +	usleep_range(10000, 11000);
> +	outb(0, EC_ADDR_DATA);
> +	usleep_range(10000, 11000);
> +
> +	/* set reset delay */
> +	outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +	outb(EC_DAT_RST_DLY_H, EC_ADDR_DATA);
> +	usleep_range(10000, 11000);
> +	outb((val >> 8), EC_ADDR_DATA);

Unnecessary ( )

> +	usleep_range(10000, 11000);
> +
> +	outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +	outb(EC_DAT_RST_DLY_L, EC_ADDR_DATA);
> +	usleep_range(10000, 11000);
> +	outb((val & 0xFF), EC_ADDR_DATA);

Unnecessary ( )

> +	usleep_range(10000, 11000);
> +
> +	wdd->timeout = t;
> +	return 0;
> +}
> +
> +
> +static int adv_ec_probe(void)
> +{
> +	unsigned int val;
> +
> +	/* Check for magic byte */
> +	outb(EC_CMD_EC_PROBE, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +	val = inb(EC_ADDR_DATA);
> +
> +	pr_debug("%s: probe result: %02X\n", __func__, val);
> +
> +	if (val == EC_MAGIC)
> +		return 0;
> +	else
> +		return -ENODEV;

This should be
	if (val != EC_MAGIC)
		return -ENODEV;

	return 0;

Error handling comes first, and else after return is unnecessary
(and static analyzers will complain about it).

> +}
> +
> +
> +static int adv_ec_wdt_start(struct watchdog_device *wdd)
> +{
> +	adv_ec_wdt_set_timeout(wdd, wdd->timeout);
> +
> +	pr_debug("%s: Enabling watchdog timer\n", __func__);
> +
> +	/* Enable the watchdog timer */
> +	outb(EC_CMD_WDT_START, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +
> +	return 0;
> +}
> +
> +static int adv_ec_wdt_stop(struct watchdog_device *wdd)
> +{
> +	pr_debug("%s: Disabling watchdog timer\n", __func__);
> +
> +	/* Disable the watchdog timer */

Those comments really don't add any value. What else would the
start and stop functions do ?

> +	outb(EC_CMD_WDT_STOP, EC_ADDR_CMD);
> +	usleep_range(10000, 11000);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info adv_ec_wdt_info = {
> +	.identity =	DRIVER_NAME,
> +	.options =	WDIOF_SETTIMEOUT |
> +			WDIOF_MAGICCLOSE |
> +			WDIOF_KEEPALIVEPING,
> +};
> +
> +static const struct watchdog_ops adv_ec_wdt_ops = {
> +	.owner =	THIS_MODULE,
> +	.start =	adv_ec_wdt_start,
> +	.stop =		adv_ec_wdt_stop,
> +	.ping =		adv_ec_wdt_ping,
> +	.set_timeout =	adv_ec_wdt_set_timeout,
> +};
> +
> +static struct watchdog_device adv_ec_wdt_dev = {
> +	.info =		&adv_ec_wdt_info,
> +	.ops =		&adv_ec_wdt_ops,
> +	.min_timeout =	MIN_TIME,
> +	.max_timeout =	MAX_TIME,

.timeout should be set to the default timeout.

> +};
> +
> +static int adv_ec_wdt_probe(struct device *dev, unsigned int id)
> +{
> +	int ret;
> +
> +	if (!devm_request_region(dev, BASE_ADDR, ADDR_EXTENT, dev_name(dev))) {
> +		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
> +			BASE_ADDR, BASE_ADDR + ADDR_EXTENT);
> +		return -EBUSY;
> +	}
> +
> +	/* probe for EC */
> +	ret = adv_ec_probe();
> +	if (ret) {
> +		dev_err(dev, "Error: cannot detect Advantech EC\n");

No error message before -ENODEV (that would pollute the kernel log
for everyone else).

> +		return -ENODEV;
> +	}

The chip should be detected in the init function, and the driver should
only probe is a chip was detected.

> +
> +	adv_ec_wdt_dev.timeout = timeout;

As mentioned, initialize .timeout with the default, and call
watchdog_init_timeout().

> +
> +	ret = devm_watchdog_register_device(dev, &adv_ec_wdt_dev);
> +
> +	return ret;
> +}
> +
> +static void adv_ec_wdt_remove(struct device *dev, unsigned int id)
> +{
> +	/* stop the watchdog */
> +	adv_ec_wdt_stop(NULL);

Call watchdog_stop_on_unregister() before registering the watchdog
instead. Also, again, the comment doesn't add value.

> +
> +	/* watchdog_unregister() and release_region() are called automatically */

Also unnecessary (implied with devm_). And you don't actually
need a remove function when using watchdog_stop_on_unregister().

> +
> +	return;
> +}
> +
> +static struct isa_driver adv_ec_wdt_driver = {
> +	.probe		= adv_ec_wdt_probe,
> +	.remove		= adv_ec_wdt_remove,
> +	.driver		= {
> +	.name		= DRIVER_NAME,
> +	},
> +};
> +
> +
> +static int __init adv_ec_wdt_init(void)
> +{
> +	/* Check boot parameters to verify that their initial values */
> +	/* are in range. */
> +	if ((timeout < MIN_TIME) ||
> +	    (timeout > MAX_TIME)) {

Unnecessary ( ) around expressions.

> +		pr_err("Watchdog timer: value of timeout %d (dec) "
> +		  "is out of range from %d to %d (dec)\n",
> +		  timeout, MIN_TIME, MAX_TIME);
> +		return -EINVAL;

This does not belong here. The probe function should call
watchdog_init_timeout() to set and validate the timeout module
parameter, and keep the default (instead of failing) if it is
out of range.

The init function should check if the hardware exists, and only
instantiate the device if it does.

> +	}
> +
> +	return isa_register_driver(&adv_ec_wdt_driver, 1);
> +}
> +
> +static void __exit adv_ec_wdt_exit(void)
> +{
> +	isa_unregister_driver(&adv_ec_wdt_driver);
> +}
> +
> +module_init(adv_ec_wdt_init);
> +module_exit(adv_ec_wdt_exit);
> +
> +MODULE_AUTHOR("Thomas Kastner <thomas.kastne@advantech.com>");
> +MODULE_DESCRIPTION("Advantech Embedded Controller Watchdog Device Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("20221012");
> +MODULE_ALIAS("isa:" DRIVER_NAME);
> -- 
> 2.34.1
> 
