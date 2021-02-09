Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7D631522B
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Feb 2021 15:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhBIO4D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Feb 2021 09:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbhBIOzw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Feb 2021 09:55:52 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8E9C06178B
        for <linux-watchdog@vger.kernel.org>; Tue,  9 Feb 2021 06:55:11 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id i5so3449466wmq.2
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Feb 2021 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=41GqsJE0IgbgOx9fGT/tciJEr52uBJmAe5Ibl6UOkXM=;
        b=ZCwDJGsUuLwNEhPK2MSimhIEOnNjoFiZHdGbeuIASZ8UEP6ueJWGjn+b9JQRJlJvpv
         WcNjBm4YJeeAiVj5hg9nC0ro4mkNMc5BmwYm/rbOrk44uP0J1/hMPQgNtIh4ERzZlrKX
         gwHRYh+bcaoD2DV2Y9VWSzEVDm3DonH5v4QmNhPxRpBsGmQozWDxE5JEWbZg91jyG+Qc
         d62xXVaJ5T/reiEoL2NFEHrmNmh6dNdtmuanHU9VrkxSK9jNQ/2I+z7OIxYTY4/9B2VA
         5SjotVWjDdAfJ39VPXpqwSYF4kx1dYCQiy6zV77xbj5UFlDQwE1oQ5VB/8nfpV29SN6m
         UL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=41GqsJE0IgbgOx9fGT/tciJEr52uBJmAe5Ibl6UOkXM=;
        b=RP280CUAlgo+uor+5bM+7vB+Lnohhcn0Kyf+rmFOOnXQPg5oSZA//GXlCLt2mP5TVG
         JiEHPxtb0oevBmscs3Tn3SF50kUgrbA6M3DliqB5jxLR1tQpNwn2WwLAXW6ARVK9c0YD
         IlfvrZYc9egxZl3ifdveocAL3ut8IvfkErIIpEN+yFlDMtOha6fpiFVEIUI6b7eM2Vaw
         bextAbmUwGQDIS5crqL+Tc2caJqX6BE0zylBo1FCZ1e+C49P+dSEWDCyUZyHlr7b7fmx
         DsSsT8/2SiOZun9mPQ+XM7LRsEezmlCsvXKiDDFPaaz4AlDhUymKaQpWsnlEkj2F5Jvs
         P9QA==
X-Gm-Message-State: AOAM5337Tk9gIoAJ6ForU2R9N0Uzf1mNCZFJEolwXrPDYD79TW7ksOQR
        GDh9g35zrErtafT9gFhJWR8KOFQbYWaQQw==
X-Google-Smtp-Source: ABdhPJx5xoHWBG5urbk7oQExPAnvoYKsVmuv7nrt4+0PVNju/XB97HOdz0pTowi2e0Qnky7lNtyQpA==
X-Received: by 2002:a05:600c:3588:: with SMTP id p8mr3723020wmq.71.1612882510392;
        Tue, 09 Feb 2021 06:55:10 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id i20sm4570491wmq.7.2021.02.09.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 06:55:09 -0800 (PST)
Date:   Tue, 9 Feb 2021 14:55:07 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v7 2/6] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <20210209145507.GA220368@dell>
References: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
 <185621c77e5eaecea239e0146ea48bc7a2648b9f.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <185621c77e5eaecea239e0146ea48bc7a2648b9f.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 22 Jan 2021, Matti Vaittinen wrote:

> Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> mainly used to power the R-Car series processors.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changes since v6:
>  - no changes
>  drivers/mfd/Kconfig              |  11 ++++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd9576.c        | 108 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd957x.h  |  59 +++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   2 +
>  5 files changed, 181 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd9576.c
>  create mode 100644 include/linux/mfd/rohm-bd957x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index bdfce7b15621..53c7c96283bd 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1998,6 +1998,17 @@ config MFD_ROHM_BD71828
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
> index 14fdb188af02..e58fae024bb2 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -262,6 +262,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
>  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
> +obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+= rohm-bd9576.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
>  
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> new file mode 100644
> index 000000000000..f4dd9e438427
> --- /dev/null
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Copyright (C) 2020 ROHM Semiconductors
> +//
> +// ROHM BD9576MUF and BD9573MUF PMIC driver

No C++ comments (save the SPDX line) please.

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
> +static struct mfd_cell bd9576_mfd_cells[] = {
> +	{ .name = "bd9576-pmic", },
> +	{ .name = "bd9576-wdt", },
> +};

What is a PMIC in this context?

To me a PMIC is a bunch of devices.  What is this probing?

Maybe this is *-regulator?

> +static const struct regmap_range volatile_ranges[] = {
> +	regmap_reg_range(BD957X_REG_SMRB_ASSERT, BD957X_REG_SMRB_ASSERT),
> +	regmap_reg_range(BD957X_REG_PMIC_INTERNAL_STAT,
> +			 BD957X_REG_PMIC_INTERNAL_STAT),
> +	regmap_reg_range(BD957X_REG_INT_THERM_STAT, BD957X_REG_INT_THERM_STAT),
> +	regmap_reg_range(BD957X_REG_INT_OVP_STAT, BD957X_REG_INT_SYS_STAT),
> +	regmap_reg_range(BD957X_REG_INT_MAIN_STAT, BD957X_REG_INT_MAIN_STAT),
> +};
> +
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
> +	unsigned long chip_type;
> +
> +	chip_type = (unsigned long)of_device_get_match_data(&i2c->dev);
> +
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

This nomenclature is confusing.

cells and num_cells would clear it up.

> +				   NULL, 0, NULL);
> +	if (ret)
> +		dev_err(&i2c->dev, "Failed to create subdevices\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id bd957x_of_match[] = {
> +	{ .compatible = "rohm,bd9576", .data = (void *)ROHM_CHIP_TYPE_BD9576, },
> +	{ .compatible = "rohm,bd9573", .data = (void *)ROHM_CHIP_TYPE_BD9573, },
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

Nit: Can you tab these out for improved readability please?

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
