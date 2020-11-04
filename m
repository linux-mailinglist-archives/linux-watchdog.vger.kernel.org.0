Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481732A681E
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Nov 2020 16:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgKDPwA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Nov 2020 10:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730849AbgKDPv7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Nov 2020 10:51:59 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A0EC0613D4
        for <linux-watchdog@vger.kernel.org>; Wed,  4 Nov 2020 07:51:57 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id w14so22541370wrs.9
        for <linux-watchdog@vger.kernel.org>; Wed, 04 Nov 2020 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MAeekGuhHCPsSYEYeBP+XyjpYpGofjQ16ccfrEiFQek=;
        b=FrupVwf6EicNCxMmfDbrlEUmFJif/usq78AuD7UxBlQ95gZfs6UgjK1pmg6LpWlB4n
         ANRI7e5MvyTUvFKmhhK5OB3tOY2I8ViPzWdbOrlylRsKWJQv6CI2vcXYdH5J0Zc4/uDt
         nmBXETpben+MwZbOR1Ox1eLMOssyeI+3pLPGx51WK9CDJxPe18LGZWcI4dcsO7SQYoO6
         PTP9CRtTOqBAdsP1i2HZJMGaKK2qFS0TJiFJwvosIT9xS7tKhQFC4oUTJUK4GoaGnvr6
         RuGU/x+io8lqLStNh3caBHT5djzhaT2xIUMdknGu8soU2xTGls2Fts+6OMT1NKYdJA6k
         sX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MAeekGuhHCPsSYEYeBP+XyjpYpGofjQ16ccfrEiFQek=;
        b=fwvdRy69Svxnuda0pCkvR+l1M48ggwIeTNYcNmfIA3+o3BA++lg2Rkc/xNpfAn9FKB
         Kdj7KQbFm3OIjJ23cH0pt28DjUw1modInmKdLB5De/q/H/YHbO0CELpujN8DGFkBroZS
         XOeEg9KaUd72PvtghZFjTLwhEx1nAtdqZP9QoCPY8mYswX0PQK+qIDr7ouRFcNVacf5d
         dW6GiZM9KEB6RbmW1CJeJgX7NFlVQkOoB28ITctH1y7rbflX8nus8zp04JO2O3PGoUzz
         UWeDXluAASbxNuZE4CMcEipbo1Gf+Bd6/8wxB6FI4C+wcdo3dqd0u/TODL9nLzCnP4le
         CpWQ==
X-Gm-Message-State: AOAM532G13M8msKQh10sswYjMG3XnTjTzwd1W/dJVCd1Ssxa59P3HVuW
        Md5hZQ+wV5Tli5BboG5E1hED8A==
X-Google-Smtp-Source: ABdhPJygyEs/v/KY06XSaZ8SXBOUKJd+TWanuCxeBeINXy66CTclvdVJiBy2CACu17c2ty2Wr69Y9g==
X-Received: by 2002:a5d:4b92:: with SMTP id b18mr30165817wrt.281.1604505116158;
        Wed, 04 Nov 2020 07:51:56 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id u23sm2559955wmc.22.2020.11.04.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:51:55 -0800 (PST)
Date:   Wed, 4 Nov 2020 15:51:53 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <20201104155153.GQ4488@dell>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
 <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 28 Oct 2020, Matti Vaittinen wrote:

> Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> mainly used to power the R-Car series processors.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/Kconfig              |  11 +++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd9576.c        | 130 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd957x.h  |  59 ++++++++++++++
>  include/linux/mfd/rohm-generic.h |   2 +
>  5 files changed, 203 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd9576.c
>  create mode 100644 include/linux/mfd/rohm-bd957x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 8b99a13669bf..dcb2b14a570e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2010,6 +2010,17 @@ config MFD_ROHM_BD71828
>  	  Also included is a Coulomb counter, a real-time clock (RTC), and
>  	  a 32.768 kHz clock gate.
>  
> +config MFD_ROHM_BD957XMUF
> +	tristate "ROHM BD9576MUF and BD9573MUF Power Management ICs"
> +	depends on I2C=y
> +	depends on OF
> +	select REGMAP_I2C
> +	select MFD_CORE
> +	help
> +	  Select this option to get support for the ROHM BD9576MUF and
> +	  BD9573MUF Power Management ICs. BD9576 and BD9573 are primarily
> +	  designed to be used to power R-Car series processors.
> +
>  config MFD_STM32_LPTIMER
>  	tristate "Support for STM32 Low-Power Timer"
>  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 1780019d2474..837f68c9f336 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -261,6 +261,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
>  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
> +obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+= rohm-bd9576.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
>  
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> new file mode 100644
> index 000000000000..a23ded510209
> --- /dev/null
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Copyright (C) 2020 ROHM Semiconductors
> +//
> +// ROHM BD9576MUF and BD9573MUF PMIC driver
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/rohm-bd957x.h>
> +#include <linux/mfd/rohm-generic.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +static struct mfd_cell bd9573_mfd_cells[] = {
> +	{ .name = "bd9573-pmic", },
> +	{ .name = "bd9576-wdt", },
> +};
> +
> +
> +static struct mfd_cell bd9576_mfd_cells[] = {
> +	{ .name = "bd9576-pmic", },
> +	{ .name = "bd9576-wdt", },
> +};
> +
> +static const struct regmap_range volatile_ranges[] = {
> +	{
> +		.range_min = BD957X_REG_SMRB_ASSERT,
> +		.range_max = BD957X_REG_SMRB_ASSERT,
> +	},
> +	{

The way you space your braces is not consistent.

> +		.range_min = BD957X_REG_PMIC_INTERNAL_STAT,
> +		.range_max = BD957X_REG_PMIC_INTERNAL_STAT,
> +	},
> +	{
> +		.range_min = BD957X_REG_INT_THERM_STAT,
> +		.range_max = BD957X_REG_INT_THERM_STAT,
> +	},
> +	{
> +		.range_min = BD957X_REG_INT_OVP_STAT,
> +		.range_max = BD957X_REG_INT_SYS_STAT,
> +	}, {
> +		.range_min = BD957X_REG_INT_MAIN_STAT,
> +		.range_max = BD957X_REG_INT_MAIN_STAT,
> +	},
> +};

Please use: regmap_reg_range()

> +static const struct regmap_access_table volatile_regs = {
> +	.yes_ranges = &volatile_ranges[0],
> +	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
> +};
> +
> +static struct regmap_config bd957x_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.volatile_table = &volatile_regs,
> +	.max_register = BD957X_MAX_REGISTER,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static int bd957x_i2c_probe(struct i2c_client *i2c,
> +			     const struct i2c_device_id *id)
> +{
> +	int ret;
> +	struct regmap *regmap;
> +	struct mfd_cell *mfd;
> +	int cells;
> +	unsigned int chip_type;
> +
> +	chip_type = (unsigned int)(uintptr_t)
> +		    of_device_get_match_data(&i2c->dev);

Not overly keen on this casting.

Why not just leave it as (uintptr_t)?

What happens when you don't cast to (uintptr_t) first?

> +	switch (chip_type) {
> +	case ROHM_CHIP_TYPE_BD9576:
> +		mfd = bd9576_mfd_cells;
> +		cells = ARRAY_SIZE(bd9576_mfd_cells);
> +		break;
> +	case ROHM_CHIP_TYPE_BD9573:
> +		mfd = bd9573_mfd_cells;
> +		cells = ARRAY_SIZE(bd9573_mfd_cells);
> +		break;
> +	default:
> +		dev_err(&i2c->dev, "Unknown device type");
> +		return -EINVAL;
> +	}
> +
> +	regmap = devm_regmap_init_i2c(i2c, &bd957x_regmap);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, mfd, cells,
> +				   NULL, 0, NULL);
> +	if (ret)
> +		dev_err(&i2c->dev, "Failed to create subdevices\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id bd957x_of_match[] = {
> +	{
> +		.compatible = "rohm,bd9576",
> +		.data = (void *)ROHM_CHIP_TYPE_BD9576,
> +	},
> +	{

You could put the 2 lines above on a single line.

> +		.compatible = "rohm,bd9573",
> +		.data = (void *)ROHM_CHIP_TYPE_BD9573,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, bd957x_of_match);
> +
> +static struct i2c_driver bd957x_drv = {
> +	.driver = {
> +		.name = "rohm-bd957x",
> +		.of_match_table = bd957x_of_match,
> +	},
> +	.probe = &bd957x_i2c_probe,
> +};
> +

Remove this line please.

> +module_i2c_driver(bd957x_drv);
> +
> +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> +MODULE_DESCRIPTION("ROHM BD9576MUF and BD9573MUF Power Management IC driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/rohm-bd957x.h b/include/linux/mfd/rohm-bd957x.h
> new file mode 100644
> index 000000000000..3e7ca6fe5d4f
> --- /dev/null
> +++ b/include/linux/mfd/rohm-bd957x.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2020 ROHM Semiconductors */
> +
> +#ifndef __LINUX_MFD_BD957X_H__
> +#define __LINUX_MFD_BD957X_H__
> +
> +enum {
> +	BD957X_VD50,
> +	BD957X_VD18,
> +	BD957X_VDDDR,
> +	BD957X_VD10,
> +	BD957X_VOUTL1,
> +	BD957X_VOUTS1,
> +};
> +
> +#define BD957X_REG_SMRB_ASSERT		0x15
> +#define BD957X_REG_PMIC_INTERNAL_STAT	0x20
> +#define BD957X_REG_INT_THERM_STAT	0x23
> +#define BD957X_REG_INT_THERM_MASK 0x24
> +#define BD957X_REG_INT_OVP_STAT 0x25
> +#define BD957X_REG_INT_SCP_STAT 0x26
> +#define BD957X_REG_INT_OCP_STAT 0x27
> +#define BD957X_REG_INT_OVD_STAT 0x28
> +#define BD957X_REG_INT_UVD_STAT 0x29
> +#define BD957X_REG_INT_UVP_STAT 0x2a
> +#define BD957X_REG_INT_SYS_STAT 0x2b
> +#define BD957X_REG_INT_SYS_MASK 0x2c
> +#define BD957X_REG_INT_MAIN_STAT 0x30
> +#define BD957X_REG_INT_MAIN_MASK 0x31
> +
> +#define BD957X_REG_WDT_CONF 0x16
> +
> +#define BD957X_REG_POW_TRIGGER1 0x41
> +#define BD957X_REG_POW_TRIGGER2 0x42
> +#define BD957X_REG_POW_TRIGGER3 0x43
> +#define BD957X_REG_POW_TRIGGER4 0x44
> +#define BD957X_REG_POW_TRIGGERL1 0x45
> +#define BD957X_REG_POW_TRIGGERS1 0x46
> +
> +#define BD957X_REGULATOR_EN_MASK 0xff
> +#define BD957X_REGULATOR_DIS_VAL 0xff
> +
> +#define BD957X_VSEL_REG_MASK	0xff
> +
> +#define BD957X_MASK_VOUT1_TUNE	0x87
> +#define BD957X_MASK_VOUT2_TUNE	0x87
> +#define BD957X_MASK_VOUT3_TUNE	0x1f
> +#define BD957X_MASK_VOUT4_TUNE	0x1f
> +#define BD957X_MASK_VOUTL1_TUNE	0x87
> +
> +#define BD957X_REG_VOUT1_TUNE	0x50
> +#define BD957X_REG_VOUT2_TUNE	0x53
> +#define BD957X_REG_VOUT3_TUNE	0x56
> +#define BD957X_REG_VOUT4_TUNE	0x59
> +#define BD957X_REG_VOUTL1_TUNE	0x5c
> +
> +#define BD957X_MAX_REGISTER 0x61
> +
> +#endif
> diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
> index 4283b5b33e04..58b4f1a0f4af 100644
> --- a/include/linux/mfd/rohm-generic.h
> +++ b/include/linux/mfd/rohm-generic.h
> @@ -12,6 +12,8 @@ enum rohm_chip_type {
>  	ROHM_CHIP_TYPE_BD71847,
>  	ROHM_CHIP_TYPE_BD70528,
>  	ROHM_CHIP_TYPE_BD71828,
> +	ROHM_CHIP_TYPE_BD9576,
> +	ROHM_CHIP_TYPE_BD9573,
>  	ROHM_CHIP_TYPE_AMOUNT
>  };
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
