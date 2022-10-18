Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDEF602C7E
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Oct 2022 15:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiJRNJb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Oct 2022 09:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiJRNJ3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Oct 2022 09:09:29 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CF6C7067
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Oct 2022 06:08:54 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id p127so14809164oih.9
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Oct 2022 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+3yyUywMFcm4EGBCs6cztH8odFKcicu2mjFt7MRWpk=;
        b=BiTHvTzq3deyrq5HwdNKGwr7u/4uBhgMj84Mgw+xIdpJjJA+rikiPaPivLog6boww0
         KuDINGcLgZRgKpuaglCGVTAQooNXeVvqp6Cu2sru4IkYNGZGFz4HVoV+jcYb1xJYiWIG
         ZbqUi5CmiCeDL7qDPEOuPp7lb9knWr7StoiRF85AWEfH7TRKAqjqQi3XvUF3F7By/gsF
         X5LAiDNODbY6Yj9gHB8EKlVC1FBUayGWNJvTSScYPQ75fI1AYvlR+WGTnE192WiffSbC
         4Kz1WE9qF3XS4XlGFKrGdU3e3mnvZoz+FuJYFwYyuTW5JsZZuL3pcg2AWP3YuuoyMQ5x
         YOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+3yyUywMFcm4EGBCs6cztH8odFKcicu2mjFt7MRWpk=;
        b=42lmwwppCdN7kVz2Y2HaB73eprwLyvDPw5uOjyfeidh4VeHRG2fUovmm2IWCSLZnIb
         sXdwLTAYd6nIU3v2ivScGXN+9fa1UgdFNUu+c5Ux4lIVwNReRbvs+qWdLxB1GBYRVW76
         hihEMgI5d91Ojoq9XVkHBGYtbCgL8qtTO5idCoiNC3EYEd+b87KevS0PFk6CHnMgThSM
         WB/JFTttadVSDjFWPW5BilsvdN37jT7E1HsLBU9nxjAMDN6uSCkWABq8QXG/1J/xT+q5
         14ciRNwGSX5MpVnv7gUEup3Mvk8vp5DmVkI967xWu0uqMMGd4bgHGLSCT4GFhKRrIWML
         XPeg==
X-Gm-Message-State: ACrzQf3bCmHPpUkncDAEzbxtAONOUws9PPc4yuaPNkCsyIQG3l44GAiq
        oVlZFGBnPTlGMCUNDC/8T7FTDqCexds=
X-Google-Smtp-Source: AMsMyM4oQpDn059u5rXegsyzm6aonaRg+3TlJepqn/0LeoxxLaoC0SU9beWAeayMdNVMRWhs1PXhNA==
X-Received: by 2002:a05:6808:1809:b0:354:7023:584c with SMTP id bh9-20020a056808180900b003547023584cmr15945723oib.166.1666098526983;
        Tue, 18 Oct 2022 06:08:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a38-20020a05687046a600b0013191fdeb9bsm6257707oap.38.2022.10.18.06.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 06:08:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 18 Oct 2022 06:08:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas Kastner <thomas.kastner@advantech.com>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 20221018] Add Advantech EC watchdog driver
Message-ID: <20221018130845.GA4170931@roeck-us.net>
References: <Y05J2xczXYn8GUoJ@EIS-S230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y05J2xczXYn8GUoJ@EIS-S230>
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

On Tue, Oct 18, 2022 at 08:38:19AM +0200, Thomas Kastner wrote:
> This patch adds the 'advantech_ec_wdt' kernel module which provides
> WDT support for Advantech platforms with ITE based Embedded Controller.
> 
> Signed-off-by: Thomas Kastner <thomas.kastner@advantech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v3:
> - removed author email and disclaimer in file header
> - changed EC_ADDR_DATA/CMD to be based on EC_BASE_ADDR instead of fixed
> - fixed checkpatch.pl reported issues
>   long line preferred over "quoted strings split across lines" due to grep
> 
> v2:	
> - added accessor function for EC IO access to remove unnecessary waits
> - moved EC probe to adv_ec_wdt_init()
> - implemented cosmetic changes found in the code review
> - removed debug output and unnecessary error messages
> 	
> v1:
> - initial version
> 
>  drivers/watchdog/Kconfig            |   7 +
>  drivers/watchdog/Makefile           |   1 +
>  drivers/watchdog/advantech_ec_wdt.c | 205 ++++++++++++++++++++++++++++
>  3 files changed, 213 insertions(+)
>  create mode 100644 drivers/watchdog/advantech_ec_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 688922fc4edb..a990016f791c 100644
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
> +		This driver supports Advantech products with ITE based Embedded Controller.
> +		It does not support Advantech products with other ECs or without EC.
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
> index 000000000000..d6dfc1347ca5
> --- /dev/null
> +++ b/drivers/watchdog/advantech_ec_wdt.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *	Advantech Embedded Controller Watchdog Driver
> + *
> + *	This driver supports Advantech products with ITE based Embedded Controller.
> + *	It does not support Advantech products with other ECs or without EC.
> + *
> + *	Copyright (C) 2022 Advantech Europe B.V.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/isa.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/watchdog.h>
> +
> +#define DRIVER_NAME		"advantech_ec_wdt"
> +
> +/* EC IO region */
> +#define EC_BASE_ADDR		0x299
> +#define EC_ADDR_EXTENT		2
> +
> +/* EC minimum IO access delay in ms */
> +#define EC_MIN_DELAY		10
> +
> +/* EC interface definitions */
> +#define EC_ADDR_CMD		(EC_BASE_ADDR + 1)
> +#define EC_ADDR_DATA		EC_BASE_ADDR
> +#define EC_CMD_EC_PROBE	0x30
> +#define EC_CMD_COMM		0x89
> +#define EC_CMD_WDT_START	0x28
> +#define EC_CMD_WDT_STOP	0x29
> +#define EC_CMD_WDT_RESET	0x2A
> +#define EC_DAT_EN_DLY_H	0x58
> +#define EC_DAT_EN_DLY_L	0x59
> +#define EC_DAT_RST_DLY_H	0x5E
> +#define EC_DAT_RST_DLY_L	0x5F
> +#define EC_MAGIC		0x95
> +
> +/* module parameters */
> +#define MIN_TIME		1
> +#define MAX_TIME		6000 /* 100 minutes */
> +#define DEFAULT_TIME		60
> +
> +static unsigned int timeout;
> +static ktime_t ec_timestamp;
> +
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout,
> +		 "Default Watchdog timer setting (" __MODULE_STRING(DEFAULT_TIME) "s). The range is from " __MODULE_STRING(MIN_TIME) " to " __MODULE_STRING(MAX_TIME) ".");
> +
> +static void adv_ec_wdt_timing_gate(void)
> +{
> +	ktime_t time_cur, time_delta;
> +
> +	/* ensure minimum delay between IO accesses*/
> +	time_cur = ktime_get();
> +	time_delta = ktime_to_ms(ktime_sub(time_cur, ec_timestamp));
> +	if (time_delta < EC_MIN_DELAY) {
> +		time_delta = EC_MIN_DELAY - time_delta;
> +		usleep_range(time_delta * 1000, (time_delta + 1) * 1000);
> +	}
> +	ec_timestamp = ktime_get();
> +}
> +
> +static void adv_ec_wdt_outb(unsigned char value, unsigned short port)
> +{
> +	adv_ec_wdt_timing_gate();
> +	outb(value, port);
> +}
> +
> +static unsigned char adv_ec_wdt_inb(unsigned short port)
> +{
> +	adv_ec_wdt_timing_gate();
> +	return inb(port);
> +}
> +
> +static int adv_ec_wdt_ping(struct watchdog_device *wdd)
> +{
> +	adv_ec_wdt_outb(EC_CMD_WDT_RESET, EC_ADDR_CMD);
> +	return 0;
> +}
> +
> +static int adv_ec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
> +{
> +	unsigned int val;
> +
> +	/* scale time to EC 100 ms base */
> +	val = t * 10;
> +
> +	/* reset enable delay, just in case it was set by BIOS etc. */
> +	adv_ec_wdt_outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	adv_ec_wdt_outb(EC_DAT_EN_DLY_H, EC_ADDR_DATA);
> +	adv_ec_wdt_outb(0, EC_ADDR_DATA);
> +
> +	adv_ec_wdt_outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	adv_ec_wdt_outb(EC_DAT_EN_DLY_L, EC_ADDR_DATA);
> +	adv_ec_wdt_outb(0, EC_ADDR_DATA);
> +
> +	/* set reset delay */
> +	adv_ec_wdt_outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	adv_ec_wdt_outb(EC_DAT_RST_DLY_H, EC_ADDR_DATA);
> +	adv_ec_wdt_outb(val >> 8, EC_ADDR_DATA);
> +
> +	adv_ec_wdt_outb(EC_CMD_COMM, EC_ADDR_CMD);
> +	adv_ec_wdt_outb(EC_DAT_RST_DLY_L, EC_ADDR_DATA);
> +	adv_ec_wdt_outb(val & 0xFF, EC_ADDR_DATA);
> +
> +	wdd->timeout = t;
> +	return 0;
> +}
> +
> +static int adv_ec_wdt_start(struct watchdog_device *wdd)
> +{
> +	adv_ec_wdt_set_timeout(wdd, wdd->timeout);
> +	adv_ec_wdt_outb(EC_CMD_WDT_START, EC_ADDR_CMD);
> +
> +	return 0;
> +}
> +
> +static int adv_ec_wdt_stop(struct watchdog_device *wdd)
> +{
> +	adv_ec_wdt_outb(EC_CMD_WDT_STOP, EC_ADDR_CMD);
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
> +	.timeout =	DEFAULT_TIME,
> +};
> +
> +static int adv_ec_wdt_probe(struct device *dev, unsigned int id)
> +{
> +	if (!devm_request_region(dev, EC_BASE_ADDR, EC_ADDR_EXTENT, dev_name(dev))) {
> +		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
> +			EC_BASE_ADDR, EC_BASE_ADDR + EC_ADDR_EXTENT);
> +		return -EBUSY;
> +	}
> +
> +	watchdog_init_timeout(&adv_ec_wdt_dev, timeout, dev);
> +	watchdog_stop_on_reboot(&adv_ec_wdt_dev);
> +	watchdog_stop_on_unregister(&adv_ec_wdt_dev);
> +
> +	return devm_watchdog_register_device(dev, &adv_ec_wdt_dev);
> +}
> +
> +static struct isa_driver adv_ec_wdt_driver = {
> +	.probe		= adv_ec_wdt_probe,
> +	.driver		= {
> +	.name		= DRIVER_NAME,
> +	},
> +};
> +
> +static int __init adv_ec_wdt_init(void)
> +{
> +	unsigned int val;
> +
> +	/* quick probe for EC */
> +	if (!request_region(EC_BASE_ADDR, EC_ADDR_EXTENT, DRIVER_NAME))
> +		return -EBUSY;
> +
> +	adv_ec_wdt_outb(EC_CMD_EC_PROBE, EC_ADDR_CMD);
> +	val = adv_ec_wdt_inb(EC_ADDR_DATA);
> +	release_region(EC_BASE_ADDR, EC_ADDR_EXTENT);
> +
> +	if (val != EC_MAGIC)
> +		return -ENODEV;
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
> +MODULE_VERSION("20221018");
> +MODULE_ALIAS("isa:" DRIVER_NAME);
> -- 
> 2.34.1
> 
