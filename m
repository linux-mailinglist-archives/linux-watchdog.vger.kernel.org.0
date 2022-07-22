Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628BB57E36B
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jul 2022 17:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235521AbiGVPI2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jul 2022 11:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232972AbiGVPIZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jul 2022 11:08:25 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D4087F7B
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Jul 2022 08:08:24 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id c139so4708738pfc.2
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Jul 2022 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=eTpFxbxy/A+7RcHVVmxOyqP3FuMTOqR490fKhlgbJe0=;
        b=fJ4ZXDdX8Yg6JeJ2cxIyNy2dFV/HBZAbndh3NRc5j3m1AbFf94fGUi4id0ve4M0+vH
         9yMwPlV/fHWS88mH2erNGtvl1eb4m+EcpNUpK4sDSF906rw4YP27sEuVZk10wJxxMvK0
         o21IwRmevwv/fQmXPvVRCakdAgHKt3J6XJHh+ncnZA2fEirdld2p+uhRxSNzJFm8jGE0
         Ywkg2K0N4/zXTY+eHd8H0Qi/orrZxzp1KgOI86qQA1uDr5vgftJrYpoddsGqcvrFHQ0V
         wrvOnpCvMpuHw+c+J5Xk9Ilk3LCZef0p4wIf2fd0HtHBLl4rb1OrPswMxLG7HDW0htkp
         tryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=eTpFxbxy/A+7RcHVVmxOyqP3FuMTOqR490fKhlgbJe0=;
        b=aBD/AJm7JxRyL50j/s7+hh7HwVv/ApMHlVpF77YlskxvWtZT5FnYhbDx9hGnU9M6PC
         /x2PY6PdFYnrnscJT0ueh0DN2h6qIQIqQtucQiI8esCBQ8ud0vQek+y9oKXIpT4G6yzK
         GoV8N07HTwgP/VRDm1C14duxZEwvAIokauTnybZN8yPm+rIYZVxpepjZDxY5Q2UZeuVY
         Tt43De/hp6PVVcZt/07F8TLHtw8gCcXHvKf6m9zPws6bX6W89q13dkgcWq40bl4AnDyM
         KggT3Xq3wScPwFZVdBT1Nc9Wbs39ocqrzfF4tisW/p+8A6V4PSjawJzApDY4gIVhBXlT
         F2jw==
X-Gm-Message-State: AJIora+dgk+WD5iGbc+HTlCJtKCa4icTR8EAUiMuHpmQuGGSUH/vkQqq
        CvO0vc0z7BwddPxGVgvJDMMZ4Hkr/6OJbA==
X-Google-Smtp-Source: AGRyM1uq0+i1jc/A2Od2KlFGcxA9FMHZwh7SjTWGwIfTqvo258uFIwPmBqDNY+BYnZytBrsQodi3eQ==
X-Received: by 2002:a65:4ccc:0:b0:41a:69b2:2b18 with SMTP id n12-20020a654ccc000000b0041a69b22b18mr214536pgt.215.1658502503352;
        Fri, 22 Jul 2022 08:08:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090a3d4600b001e87bd6f6c2sm5660590pjf.50.2022.07.22.08.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 08:08:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a97d3153-3613-77d4-f0a0-5f51ad3b619b@roeck-us.net>
Date:   Fri, 22 Jul 2022 08:08:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     =?UTF-8?Q?David_M=c3=bcller?= <d.mueller@elsoft.ch>,
        linux-watchdog@vger.kernel.org
References: <20220722095104.74635-1-d.mueller@elsoft.ch>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC] [PATCH] watchdog: Exar/MaxLinear XR28V38x driver
In-Reply-To: <20220722095104.74635-1-d.mueller@elsoft.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/22/22 02:51, David Müller wrote:
> Simple driver for the watchdog present in some Exar/MaxLinear UART chips.
> Please see https://www.maxlinear.com/product/interface/uarts/lpc-uarts/xr28v384
> for more info.
> 
> Signed-off-by: David Müller <d.mueller@elsoft.ch>
> ---
>   drivers/watchdog/Kconfig    |  11 ++
>   drivers/watchdog/Makefile   |   1 +
>   drivers/watchdog/exar_wdt.c | 364 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 376 insertions(+)
>   create mode 100644 drivers/watchdog/exar_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 32fd37698932..5849c066609c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1089,6 +1089,17 @@ config EBC_C384_WDT
>   	  WinSystems EBC-C384 motherboard. The timeout may be configured via
>   	  the timeout module parameter.
>   
> +config EXAR_WDT
> +	tristate "Exar Watchdog Timer"
> +	depends on X86
> +	select WATCHDOG_CORE
> +	help
> +	  Enables watchdog timer support for the watchdog timer present
> +	  in some Exar/MaxLinear UART chips like the XR28V38x.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called exar_wdt.
> +
>   config F71808E_WDT
>   	tristate "Fintek F718xx, F818xx Super I/O Watchdog"
>   	depends on X86
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index c324e9d820e9..31b9bdb47b4e 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -105,6 +105,7 @@ obj-$(CONFIG_ADVANTECH_WDT) += advantechwdt.o
>   obj-$(CONFIG_ALIM1535_WDT) += alim1535_wdt.o
>   obj-$(CONFIG_ALIM7101_WDT) += alim7101_wdt.o
>   obj-$(CONFIG_EBC_C384_WDT) += ebc-c384_wdt.o
> +obj-$(CONFIG_EXAR_WDT) += exar_wdt.o
>   obj-$(CONFIG_F71808E_WDT) += f71808e_wdt.o
>   obj-$(CONFIG_SP5100_TCO) += sp5100_tco.o
>   obj-$(CONFIG_GEODE_WDT) += geodewdt.o
> diff --git a/drivers/watchdog/exar_wdt.c b/drivers/watchdog/exar_wdt.c
> new file mode 100644
> index 000000000000..1adf25bf2bc6
> --- /dev/null
> +++ b/drivers/watchdog/exar_wdt.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *	exar_wdt.c - Driver for the watchdog present in some
> + *		     Exar/MaxLinear UART chips like the XR28V38x.
> + *
> + *	(c) Copyright 2022 D. Müller <d.mueller@elsoft.ch>.
> + *
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +/* Includes */


There are various pointless comments in this driver.
This is one of them.

> +#include <linux/io.h>			/* For inb() / outb() */
> +#include <linux/module.h>		/* For module specific items */
> +#include <linux/platform_device.h>	/* For platform_driver framework */
> +#include <linux/watchdog.h>		/* For the watchdog specific items */
> +
> +#define DRV_NAME	"exar_wdt"
> +
> +/* SIO definitions */
> +static const unsigned short sio_config_ports[] = { 0x2e, 0x4e };
> +/* there are 4 possible SIO enter keys */
> +static const unsigned char sio_enter_keys[] = { 0x67, 0x77, 0x87, 0xA0 };
> +#define EXAR_EXIT_KEY	0xAA
> +
> +#define EXAR_LDN	0x07
> +#define EXAR_DID	0x20
> +#define EXAR_VID	0x23
> +#define EXAR_WDT	0x26
> +#define EXAR_ACT	0x30
> +#define EXAR_RTBASE	0x60
> +
> +/* WDT runtime registers */
> +#define WDT_CTRL	0x00
> +#define WDT_VAL		0x01
> +/* the millisec feature is not supported */

And this is another one. Readers won't know that the unit to be written
into the chip includes two bits, not juust one, and that 00 reflects
a 10ms timeout units.

> +#define WDT_UNITS_SEC	BIT(1)
> +#define WDT_UNITS_MIN	BIT(2)

This is a bit misleading, since the two bits combined control the
interval. That should be explained. The comment above doesn't do this.

> +
> +/* The devices private data */
> +struct wdt_priv {
> +	/* parent device */
> +	struct platform_device *pdev;
> +	/* the lock for WDT io operations */
> +	spinlock_t io_lock;
> +	/* the base address of the WDT runtime registers */
> +	unsigned short rt_base;
> +	/* pre-computed timeout values */
> +	unsigned char unit;
> +	unsigned char timeout;
> +};
> +
> +/* Module parameters */
> +#define WATCHDOG_TIMEOUT 60		/* 60 sec default timeout */
> +static int timeout = WATCHDOG_TIMEOUT;	/* in seconds */

Should be pre-initialized with 0 and the default should be set in struct
watchdog_device to reduce runtime conplexity.

> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout,
> +		 "Watchdog timeout in seconds. 1<=timeout<=15300, default="
> +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ".");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +		 "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +/* internal variables */
> +static struct platform_device *exar_wdt_pdev;
> +
> +/* "Super-IO" functions */
> +
> +static int exar_sio_enter(const unsigned short config_port,
> +			  const unsigned char key)
> +{
> +	if (!request_muxed_region(config_port, 2, DRV_NAME))
> +		return -EBUSY;
> +
> +	/* write the ENTER-KEY twice */
> +	outb(key, config_port);
> +	outb(key, config_port);
> +
> +	return 0;
> +}
> +
> +static void exar_sio_exit(const unsigned short config_port)
> +{
> +	outb(EXAR_EXIT_KEY, config_port);
> +	release_region(config_port, 2);
> +}
> +
> +static unsigned char exar_sio_read(const unsigned short config_port,
> +				   const unsigned char reg)
> +{
> +	outb(reg, config_port);
> +	return inb(config_port + 1);
> +}
> +
> +static void exar_sio_write(const unsigned short config_port,
> +			   const unsigned char reg, const unsigned char val)
> +{
> +	outb(reg, config_port);
> +	outb(val, config_port + 1);
> +}
> +
> +static unsigned short exar_sio_read16(const unsigned short config_port,
> +				      const unsigned char reg)
> +{
> +	unsigned short val;
> +
> +	/* read the MSB */
> +	val = exar_sio_read(config_port, reg);
> +
> +	/* read and merge in the LSB */
> +	val = (val << 8) | exar_sio_read(config_port, reg + 1);
> +
More pointless comments. Please limit comments to places
where they are useful.

> +	return val;
> +}
> +
> +/* WDT internal functions */
> +
> +static void exar_wdt_arm(const struct wdt_priv *priv)
> +{
> +	/* write timeout value twice to arm watchdog */
> +	outb(priv->timeout, priv->rt_base + WDT_VAL);
> +	outb(priv->timeout, priv->rt_base + WDT_VAL);
> +}
> +
> +static void exar_wdt_disarm(const struct wdt_priv *priv)
> +{
> +	outb(0xFF, priv->rt_base + WDT_VAL);
> +	outb(0, priv->rt_base + WDT_VAL);

The datasheet says that writing a non-0 value stops the watchdog,
but it doesn't explain what happens when writing 0 into the register.
This does warrant an explanation.

> +}
> +
> +/* Watchdog Operations */
> +
> +static int exar_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
> +
> +	spin_lock(&priv->io_lock);
> +
> +	/* disable watchdog */
> +	exar_wdt_disarm(priv);
> +
> +	/* program timeout unit */
> +	outb(priv->unit, priv->rt_base + WDT_CTRL);
> +	/* and arm watchdog */
> +	exar_wdt_arm(priv);
> +
> +	spin_unlock(&priv->io_lock);
> +	return 0;
> +}
> +
> +static int exar_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
> +
> +	spin_lock(&priv->io_lock);
> +
> +	/* disarm watchdog */
> +	exar_wdt_disarm(priv);
> +
> +	spin_unlock(&priv->io_lock);
> +	return 0;
> +}
> +
> +static int exar_wdt_keepalive(struct watchdog_device *wdog)
> +{
> +	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
> +
> +	spin_lock(&priv->io_lock);
> +
> +	/* reading the WDT_VAL reg will feed the watchdog */
> +	inb(priv->rt_base + WDT_VAL);
> +
> +	spin_unlock(&priv->io_lock);
> +	return 0;
> +}
> +
> +static int exar_wdt_set_timeout(struct watchdog_device *wdog, unsigned int t)
> +{
> +	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
> +	unsigned char timeout_unit = WDT_UNITS_SEC;
> +
> +	if (watchdog_timeout_invalid(wdog, t))
> +		return -EINVAL;
> +
Unnecessary check; done by framework.

> +	/*
> +	 * if new timeout is bigger then 255 seconds, change the
> +	 * unit to minutes and round the timeout up to the next whole minute
> +	 */
> +	if (t > 255) {
> +		timeout_unit = WDT_UNITS_MIN;
> +		t = DIV_ROUND_UP(t, 60);
> +	}
> +
> +	/* save for later use in exar_wdt_start() */
> +	priv->unit = timeout_unit;

Using a bool for timeout_unit would make it easier for the compiler.

> +	priv->timeout = t;
> +
> +	wdog->timeout = (timeout_unit == WDT_UNITS_MIN) ? t * 60 : t;
> +

This doesn't update the watchdog registers when the watchdog is running.
This means that the watchdog may fire unexpectedly if the timeout is
changed from a small to a large value.

> +	return 0;
> +}
> +
> +static const struct watchdog_info exar_wdt_info = {
> +	.options	= WDIOF_KEEPALIVEPING |
> +			  WDIOF_SETTIMEOUT |
> +			  WDIOF_MAGICCLOSE,
> +	.identity	= "Exar/MaxLinear XR28V38x Watchdog",
> +};
> +
> +static const struct watchdog_ops exar_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= exar_wdt_start,
> +	.stop		= exar_wdt_stop,
> +	.ping		= exar_wdt_keepalive,
> +	.set_timeout	= exar_wdt_set_timeout,
> +};
> +
> +static struct watchdog_device wdt_dev = {
> +	.info = &exar_wdt_info,
> +	.ops = &exar_wdt_ops,
> +	.min_timeout = 1,
> +	.max_timeout = 255 * 60,
> +};
> +
> +static unsigned short __init exar_detect(const unsigned short config_port,
> +					 const unsigned char key,
> +					 unsigned short *rt_base)
> +{
> +	int ret;
> +	unsigned short base = 0;
> +	unsigned short vid, did;
> +
> +	ret = exar_sio_enter(config_port, key);
> +	if (ret) {
> +		pr_info("config space unavailable\n (err: %d", ret);

Please no such noise. Also, there is an unbalanced ( in the string.

> +		return 0;
> +	}
> +
> +	vid = exar_sio_read16(config_port, EXAR_VID);
> +	did = exar_sio_read16(config_port, EXAR_DID);
> +
> +	/* check for the vendor and device IDs we currently know about */
> +	if (vid == 0x13A8 &&		/* vendor Exar/MaxLinar */
> +	    (did == 0x0382 ||		/* UART XR28V382 */
> +	     did == 0x0384)) {		/* UART XR28V384 */

It might be useful to have defines for those values.

> +		/* set LD config reg to WDT device (8) */
> +		exar_sio_write(config_port, EXAR_LDN, 8);
> +		/* is device active? */
> +		if (exar_sio_read(config_port, EXAR_ACT) == 0x01) {
> +			/* get the WDT runtime registers base address*/
> +			base = exar_sio_read16(config_port, EXAR_RTBASE);
> +
> +			/* set global WDT control to
> +			 * assert WDTOUT / rearm by read
> +			 */

Please use standard multi-line comments.

> +			exar_sio_write(config_port, EXAR_WDT, 0);

The detect function should really not do this. Configuration and detection
should be separate functions.

> +		}
> +	}
> +
> +	exar_sio_exit(config_port);
> +
> +	if (base) {
> +		pr_debug("Found a XR28V%X WDT (conf: 0x%x / rt: 0x%04x)\n",
> +			 did, config_port, base);
> +		*rt_base = base;
> +		return did;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init exar_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct wdt_priv *priv;
> +	int ret, i, j;
> +	unsigned short did = 0, rt_base = 0;
> +
> +	/* search for the first active Exar WDT on all possible locations */
> +	for (i = 0; !did && (i < ARRAY_SIZE(sio_config_ports)); i++) {
> +		for (j = 0; !did && (j < ARRAY_SIZE(sio_enter_keys)); j++)
> +			did = exar_detect(sio_config_ports[i],
> +					  sio_enter_keys[j],
> +					  &rt_base);
> +	}
> +
> +	if (!did)
> +		return -ENODEV;

This should really be done in the init function, and the init function should
only instantiate the watchdog platform driver if a device was found.

Also, this assumes either that only one supported device is in the system,
or that the watchdog is always connected to the first device. The init
function should really instantiate devices for each detected chip,
not just for the first one.

> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->io_lock);
> +	priv->pdev = pdev;
> +	priv->rt_base = rt_base;
> +
> +	if (watchdog_timeout_invalid(&wdt_dev, timeout))
> +		/* invalid timeout specified, reset to default */
> +		timeout = WATCHDOG_TIMEOUT;

It would be easier to just initialize .timeout in struct watchdog_device
and let watchdog_init_timeout() validate the configured value.

> +
> +	watchdog_init_timeout(&wdt_dev, timeout, NULL);
> +	watchdog_set_nowayout(&wdt_dev, nowayout);
> +	watchdog_stop_on_reboot(&wdt_dev);
> +	watchdog_stop_on_unregister(&wdt_dev);
> +	watchdog_set_drvdata(&wdt_dev, priv);
> +
> +	if (!devm_request_region(dev,
> +				 priv->rt_base + WDT_CTRL, 2, DRV_NAME)) {
> +		dev_err(dev, "failed to request region 0x%04x-0x%04x.\n",
> +			priv->rt_base + WDT_CTRL, priv->rt_base + WDT_VAL);
> +		return -EBUSY;

This should be -ENOMEM.

> +	}
> +
> +	exar_wdt_set_timeout(&wdt_dev, timeout);
> +	/* Make sure that the watchdog is not running */
> +	exar_wdt_stop(&wdt_dev);

You could instead tell the watchdog core that the watchdog is running.

> +
> +	ret = devm_watchdog_register_device(dev, &wdt_dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "XR28V%X WDT initialized. timeout=%d sec (nowayout=%d)\n",
> +		 did, timeout, nowayout);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver exar_wdt_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +	},
> +};
> +
> +static int __init exar_wdt_init(void)
> +{
> +	int ret;
> +
> +	exar_wdt_pdev = platform_device_register_simple(DRV_NAME, -1, NULL, 0);
> +	if (IS_ERR(exar_wdt_pdev))
> +		return PTR_ERR(exar_wdt_pdev);
> +
> +	ret = platform_driver_probe(&exar_wdt_driver, exar_wdt_probe);
> +	if (ret)
> +		platform_device_unregister(exar_wdt_pdev);
> +
> +	return ret;
> +}
> +
> +static void __exit exar_wdt_exit(void)
> +{
> +	platform_device_unregister(exar_wdt_pdev);
> +	platform_driver_unregister(&exar_wdt_driver);
> +}
> +
> +module_init(exar_wdt_init);
> +module_exit(exar_wdt_exit);
> +
> +MODULE_AUTHOR("David Müller <d.mueller@elsoft.ch>");
> +MODULE_DESCRIPTION("Exar/MaxLinear Watchdog Driver");
> +MODULE_LICENSE("GPL");

