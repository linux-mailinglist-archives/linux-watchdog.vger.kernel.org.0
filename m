Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673911EF1B5
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jun 2020 08:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgFEG5N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jun 2020 02:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgFEG5N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jun 2020 02:57:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01108C08C5C3
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Jun 2020 23:57:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r9so7375062wmh.2
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Jun 2020 23:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tz5BlR5JaV+ArYxa0HAqmVilkT6R8zR9JrCnLl9Yodo=;
        b=qw82uH6liAGFuBEV6hkyJqcUYBtUY4dcgnzButO12xrC67ecuHOe03IPstZhhMxpkg
         CoAUe7ix0w9VSDzB4R6LaZ9sUbPfjvRaxYMyMYeRp9nAIJfGM7wp5Ei9cVX6EnlUMfKI
         0jGYMDy/f68iPGczAsb9xq6xZxgStH3X/LXTNGJDpAUm3b7a4TRbEj8wIACimBuRAv40
         NlX6/ktlt84lJ+EqG2wFjKS81cdMxFeDDWNOG+TapLO6Fy6L8RDWwhDKNMmiDlhVKIUa
         GqxtR0PuVKCLaJBVEZZ2EffArw0dmDoRecAGRNlRyHlzphGVag+UBe1i+7I/2/XB9dA1
         qvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tz5BlR5JaV+ArYxa0HAqmVilkT6R8zR9JrCnLl9Yodo=;
        b=FZRGctp3o2bYRk4cdx7acetfsOfLuv9Vv1Sh+pGk/Z45MtV752NrTO5aQGWQWGjsh7
         hyjagAE2LTWtXjf8PIGYOThT8IDJvztJymmd8a33SovNnnbsKP0l+4ghHmKK2okjKKsT
         XbVCvU9CF27uq8NuLILHR2E86tGo5inEFfve/wHyXVuPmnnjs+xA7Ouj9JDbxA2+uBpL
         MMdKHBQrmPRpwXYfaS2fNeyUNOkzP4c+Y7a7e0Wkp40mnEvzRrpTW+cXPcdinOeIsynp
         rp8FUpzMXuFevboAvQ7c+fxq1ZR6OO3THmglBHQGSWBrxsOi3dxlhKlxFgzu6iEig70w
         awvg==
X-Gm-Message-State: AOAM530ykK9XjzH2hLAGE+1ScixI8RV4jzj7TdizVrC4R1+aZ13RgKPs
        KENWyZG8F29gJj9rLJz8+HjMIA==
X-Google-Smtp-Source: ABdhPJw+8D1o16iYVZ1h5gWKMqmnNIGt4AnryEE8VROc7MnMuuWA7+NmgtKq7OghGpEPR8xO5Fr4Zg==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr1181014wmd.138.1591340231562;
        Thu, 04 Jun 2020 23:57:11 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id t188sm5291530wmt.27.2020.06.04.23.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 23:57:10 -0700 (PDT)
Date:   Fri, 5 Jun 2020 07:57:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>, broonie@kernel.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 02/11] mfd: Add support for Kontron sl28cpld
 management controller
Message-ID: <20200605065709.GD3714@dell>
References: <20200604211039.12689-1-michael@walle.cc>
 <20200604211039.12689-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200604211039.12689-3-michael@walle.cc>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark, what do you think?

On Thu, 04 Jun 2020, Michael Walle wrote:

> Add the core support for the board management controller found on the
> SMARC-sAL28 board. It consists of the following functions:
>  - watchdog
>  - GPIO controller
>  - PWM controller
>  - fan sensor
>  - interrupt controller
> 
> At the moment, this controller is used on the Kontron SMARC-sAL28 board.
> 
> Please note that the MFD driver is defined as bool in the Kconfig
> because the next patch will add interrupt support.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mfd/Kconfig    | 19 ++++++++++
>  drivers/mfd/Makefile   |  2 ++
>  drivers/mfd/sl28cpld.c | 79 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 100 insertions(+)
>  create mode 100644 drivers/mfd/sl28cpld.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4f8b73d92df3..5c0cd514d197 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2109,5 +2109,24 @@ config SGI_MFD_IOC3
>  	  If you have an SGI Origin, Octane, or a PCI IOC3 card,
>  	  then say Y. Otherwise say N.
>  
> +config MFD_SL28CPLD
> +	bool "Kontron sl28 core driver"

"Kontron SL28 Core Driver"

> +	depends on I2C=y
> +	depends on OF
> +	select REGMAP_I2C
> +	select MFD_CORE
> +	help
> +	  This option enables support for the board management controller
> +	  found on the Kontron sl28 CPLD. You have to select individual

I can't find any reference to the "Kontron sl28 CPLD" online.

Is there a datasheet?

> +	  functions, such as watchdog, GPIO, etc, under the corresponding menus
> +	  in order to enable them.
> +
> +	  Currently supported boards are:
> +
> +		Kontron SMARC-sAL28
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called sl28cpld.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9367a92f795a..be59fb40aa28 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -264,3 +264,5 @@ obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  
>  obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
> +
> +obj-$(CONFIG_MFD_SL28CPLD)	+= sl28cpld.o
> diff --git a/drivers/mfd/sl28cpld.c b/drivers/mfd/sl28cpld.c
> new file mode 100644
> index 000000000000..a23194bb6efa
> --- /dev/null
> +++ b/drivers/mfd/sl28cpld.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MFD core for the sl28cpld.

Ideally this would match the Kconfig subject line.

> + * Copyright 2019 Kontron Europe GmbH

This is out of date.

> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +
> +#define SL28CPLD_VERSION	0x03
> +#define SL28CPLD_MIN_REQ_VERSION 14
> +
> +struct sl28cpld {
> +	struct device *dev;
> +	struct regmap *regmap;
> +};

Why do you need this structure?

> +static const struct regmap_config sl28cpld_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.reg_stride = 1,
> +};
> +
> +static int sl28cpld_probe(struct i2c_client *i2c)
> +{
> +	struct sl28cpld *sl28cpld;
> +	struct device *dev = &i2c->dev;
> +	unsigned int cpld_version;
> +	int ret;
> +
> +	sl28cpld = devm_kzalloc(dev, sizeof(*sl28cpld), GFP_KERNEL);
> +	if (!sl28cpld)
> +		return -ENOMEM;
> +
> +	sl28cpld->regmap = devm_regmap_init_i2c(i2c, &sl28cpld_regmap_config);
> +	if (IS_ERR(sl28cpld->regmap))
> +		return PTR_ERR(sl28cpld->regmap);

This is now a shared memory allocator and not an MFD at all.

I'm clamping down on these type of drivers!

Please find a better way to accomplish this.

Potentially using "simple-mfd" and "simple-regmap".

The former already exists and does what you want.  The latter doesn't
yet exist, but could solve your and lots of other contributor's
issues.

Heck maybe I'll implement it myself if this keeps happening.

> +	ret = regmap_read(sl28cpld->regmap, SL28CPLD_VERSION, &cpld_version);
> +	if (ret)
> +		return ret;
> +
> +	if (cpld_version < SL28CPLD_MIN_REQ_VERSION) {
> +		dev_err(dev, "unsupported CPLD version %d\n", cpld_version);
> +		return -ENODEV;
> +	}
> +
> +	sl28cpld->dev = dev;
> +	i2c_set_clientdata(i2c, sl28cpld);

If the struct definition is in here, how do you use it elsewhere?

> +	dev_info(dev, "successfully probed. CPLD version %d\n", cpld_version);
> +
> +	return devm_of_platform_populate(&i2c->dev);
> +}
> +
> +static const struct of_device_id sl28cpld_of_match[] = {
> +	{ .compatible = "kontron,sl28cpld-r1", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sl28cpld_of_match);
> +
> +static struct i2c_driver sl28cpld_driver = {
> +	.probe_new = sl28cpld_probe,
> +	.driver = {
> +		.name = "sl28cpld",
> +		.of_match_table = of_match_ptr(sl28cpld_of_match),
> +	},
> +};
> +module_i2c_driver(sl28cpld_driver);
> +
> +MODULE_DESCRIPTION("sl28cpld MFD Core Driver");
> +MODULE_AUTHOR("Michael Walle <michael@walle.cc>");
> +MODULE_LICENSE("GPL");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
