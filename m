Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74339436AC5
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Oct 2021 20:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhJUSqQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Oct 2021 14:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhJUSqQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Oct 2021 14:46:16 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87D9C061348
        for <linux-watchdog@vger.kernel.org>; Thu, 21 Oct 2021 11:43:59 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u18so963514wrg.5
        for <linux-watchdog@vger.kernel.org>; Thu, 21 Oct 2021 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HihTUTo5ENo8UN8nKvwlPsUn6I35WIIfYFDtca0WDLg=;
        b=MF6TtrKeIXQVnGFpexkUtQsMS4FaDX0GUNt5WICN5ot947ON4Uv9kge/syuSZMkzfI
         CXPI665K5XXDAhIAMwOpeA/IZ7oMu/p8ZJrPDonTlPqwfX7pRslK9DGKzhBx6GfpHyi8
         sr8T6y2wCenCNbufhEspHWLb6YAByuDxcth4rKbEBVY4KoaHhAVzWaG5Bbb27cU7FK1J
         Id+DVNUDyjPz4E2oWKo2jZWzsR1AlWl/P9EbLbA8aEzx3o/d3czd6Q7AFSvBh7fw4C+o
         ebsqc+EzNz73Tchq/QBC/RfNfl3mt5NZ6zTS421jAUnlpx2JzI9rWl90cWptrj4Xrs0s
         hUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HihTUTo5ENo8UN8nKvwlPsUn6I35WIIfYFDtca0WDLg=;
        b=TyCnX/o+merTjrmra//k6wOSVXE+SlSm7JBAIVCrL/GB+gXBO93eb9dRs0TcX5ZPqJ
         tJZiawLYIk8YUmEcQAJT/eWfjLXnIVehwqECUeaVsBag5Vr7niufYZksAwRfM0AM0Rnz
         AwBPRBKXHoZpVPB2WS4FRF1NZp07QNTr3a5mpsUHV8A1u2l2JdfV2hFBA5Z1l65S5ozl
         2DG30VU/VzGT+8De2ObhYo2UOE/nHpQebdAz2ftBjCPA3sHTk38GXtm8Tu94aKIuS2dg
         z9n/3HxgnMZ1JFJHD1nNIIISNFeAVEPluQ2yo408jAwMyoWcYQh6UDjFoA+ofqsJk/Dx
         texQ==
X-Gm-Message-State: AOAM533GurIirNwMTHG7quk7TH9T5+AsPdZvl9ERgceZBUDQ3CWWveBm
        S5aiZX1mrO/Z4MyvG2f114phVg==
X-Google-Smtp-Source: ABdhPJydXCJ634sbgbf5qTw+Af+syeNJNNCAHEJOrEiLmygTS67QwFaTIff78u//isP1aCDWX0yO5g==
X-Received: by 2002:adf:f902:: with SMTP id b2mr9532521wrr.265.1634841838272;
        Thu, 21 Oct 2021 11:43:58 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id l124sm9421388wml.8.2021.10.21.11.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 11:43:57 -0700 (PDT)
Date:   Thu, 21 Oct 2021 19:43:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 6/9] mfd: max77714: Add driver for Maxim MAX77714 PMIC
Message-ID: <YXG060evUw8rnR3O@google.com>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-7-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019145919.7327-7-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 19 Oct 2021, Luca Ceresoli wrote:

> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
> watchdog only.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes in v2:
>  - fix "watchdog" word in heading comment (Guenter Roeck)
>  - move struct max77714 to .c file (Krzysztof Kozlowski)
>  - change include guard format (Krzysztof Kozlowski)
>  - allow building as a module (Krzysztof Kozlowski)
>  - remove of_match_ptr usage (Krzysztof Kozlowski / lkp)
>    (Reported-by: kernel test robot <lkp@intel.com>)
> ---
>  MAINTAINERS                  |   2 +
>  drivers/mfd/Kconfig          |  14 +++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77714.c       | 165 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77714.h |  60 +++++++++++++
>  5 files changed, 242 insertions(+)
>  create mode 100644 drivers/mfd/max77714.c
>  create mode 100644 include/linux/mfd/max77714.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 514ff4a735e5..abd9de8a9d99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11390,6 +11390,8 @@ MAXIM MAX77714 PMIC MFD DRIVER
>  M:	Luca Ceresoli <luca@lucaceresoli.net>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> +F:	drivers/mfd/max77714.c
> +F:	include/linux/mfd/max77714.h
>  
>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>  M:	Javier Martinez Canillas <javier@dowhile0.org>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ca0edab91aeb..295a04b479c6 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -853,6 +853,20 @@ config MFD_MAX77693
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_MAX77714
> +	tristate "Maxim Semiconductor MAX77714 PMIC Support"
> +	depends on I2C
> +	depends on OF || COMPILE_TEST
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to add support for Maxim Semiconductor MAX77714.
> +	  This is a Power Management IC with 4 buck regulators, 9
> +	  low-dropout regulators, 8 GPIOs, RTC, watchdog etc. This driver
> +	  provides common support for accessing the device; additional
> +	  drivers must be enabled in order to use each functionality of the
> +	  device.
> +
>  config MFD_MAX77843
>  	bool "Maxim Semiconductor MAX77843 PMIC Support"
>  	depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2ba6646e874c..fe43f2fdd5cb 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -163,6 +163,7 @@ obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
>  obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
>  obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
> +obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
>  obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
>  obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
>  max8925-objs			:= max8925-core.o max8925-i2c.o
> diff --git a/drivers/mfd/max77714.c b/drivers/mfd/max77714.c
> new file mode 100644
> index 000000000000..4b49d16fe199
> --- /dev/null
> +++ b/drivers/mfd/max77714.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Maxim MAX77714 MFD Driver
> + *
> + * Copyright (C) 2021 Luca Ceresoli
> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/max77714.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +struct max77714 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct regmap_irq_chip_data *irq_data;

Is this used outside of .probe()?

> +	int irq;
> +};
> +
> +static const struct regmap_range max77714_readable_ranges[] = {
> +	regmap_reg_range(MAX77714_INT_TOP,     MAX77714_INT_TOP),
> +	regmap_reg_range(MAX77714_INT_TOPM,    MAX77714_INT_TOPM),
> +	regmap_reg_range(MAX77714_32K_STATUS,  MAX77714_32K_CONFIG),
> +	regmap_reg_range(MAX77714_CNFG_GLBL2,  MAX77714_CNFG2_ONOFF),
> +};
> +
> +static const struct regmap_range max77714_writable_ranges[] = {
> +	regmap_reg_range(MAX77714_INT_TOPM,    MAX77714_INT_TOPM),
> +	regmap_reg_range(MAX77714_32K_CONFIG,  MAX77714_32K_CONFIG),
> +	regmap_reg_range(MAX77714_CNFG_GLBL2,  MAX77714_CNFG2_ONOFF),
> +};
> +
> +static const struct regmap_access_table max77714_readable_table = {
> +	.yes_ranges = max77714_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(max77714_readable_ranges),
> +};
> +
> +static const struct regmap_access_table max77714_writable_table = {
> +	.yes_ranges = max77714_writable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(max77714_writable_ranges),
> +};
> +
> +static const struct regmap_config max77714_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX77714_CNFG2_ONOFF,
> +	.rd_table = &max77714_readable_table,
> +	.wr_table = &max77714_writable_table,
> +};
> +
> +static const struct regmap_irq max77714_top_irqs[] = {
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_ONOFF,   0, MAX77714_INT_TOP_ONOFF),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_RTC,     0, MAX77714_INT_TOP_RTC),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_GPIO,    0, MAX77714_INT_TOP_GPIO),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_LDO,     0, MAX77714_INT_TOP_LDO),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_SD,      0, MAX77714_INT_TOP_SD),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_GLBL,    0, MAX77714_INT_TOP_GLBL),
> +};
> +
> +static const struct regmap_irq_chip max77714_irq_chip = {
> +	.name			= "max77714-pmic",
> +	.status_base		= MAX77714_INT_TOP,
> +	.mask_base		= MAX77714_INT_TOPM,
> +	.num_regs		= 1,
> +	.irqs			= max77714_top_irqs,
> +	.num_irqs		= ARRAY_SIZE(max77714_top_irqs),
> +};
> +
> +static const struct mfd_cell max77714_cells[] = {
> +	{ .name = "max77714-watchdog" },
> +	{ .name = "max77714-rtc" },
> +};

Please place this at the top of the file.

> +/*
> + * MAX77714 initially uses the internal, low precision oscillator. Enable
> + * the external oscillator by setting the XOSC_RETRY bit. If the external
> + * oscillator is not OK (probably not installed) this has no effect.
> + */
> +static int max77714_setup_xosc(struct max77714 *chip)

May as well just pass 'dev' and 'regmap' to this function and do away
with the superfluous struct along with all of it's memory management
handling requirements.

> +{
> +	/* Internal Crystal Load Capacitance, indexed by value of 32KLOAD bits */
> +	static const unsigned int load_cap[4] = {0, 10, 12, 22};

Probably best to define these magic numbers.

> +	unsigned int load_cap_idx;
> +	unsigned int status;
> +	int err;
> +
> +	err = regmap_update_bits(chip->regmap, MAX77714_32K_CONFIG,
> +				 MAX77714_32K_CONFIG_XOSC_RETRY,
> +				 MAX77714_32K_CONFIG_XOSC_RETRY);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "cannot configure XOSC\n");

Error messages should be clear:

  "Failed to configure the external oscillator"

Same for the messages below.

> +	err = regmap_read(chip->regmap, MAX77714_32K_STATUS, &status);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "cannot read XOSC status\n");
> +
> +	load_cap_idx = (status >> MAX77714_32K_STATUS_32KLOAD_SHF)
> +		& MAX77714_32K_STATUS_32KLOAD_MSK;
> +
> +	dev_info(chip->dev, "Using %s oscillator, %d pF load cap\n",
> +		 status & MAX77714_32K_STATUS_32KSOURCE ? "internal" : "external",
> +		 load_cap[load_cap_idx]);
> +
> +	return 0;
> +}
> +
> +static int max77714_probe(struct i2c_client *client)
> +{
> +	struct max77714 *chip;
> +	int err;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, chip);

Where else is this used?

The definition appears to be local.

> +	chip->dev = &client->dev;
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &max77714_regmap_config);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->regmap),
> +				     "failed to initialise regmap\n");
> +
> +	err = max77714_setup_xosc(chip);
> +	if (err)
> +		return err;
> +
> +	err = devm_regmap_add_irq_chip(chip->dev, chip->regmap, client->irq,
> +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> +				       &max77714_irq_chip, &chip->irq_data);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "failed to add PMIC irq chip\n");

IRQ

> +	err =  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
> +				    max77714_cells, ARRAY_SIZE(max77714_cells),
> +				    NULL, 0, NULL);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "failed adding MFD children\n");

"Failed to register child devices"

> +	return 0;
> +}
> +
> +static const struct of_device_id max77714_dt_match[] = {
> +	{ .compatible = "maxim,max77714" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, max77714_dt_match);
> +
> +static struct i2c_driver max77714_driver = {
> +	.driver = {
> +		.name = "max77714",
> +		.of_match_table = max77714_dt_match,
> +	},
> +	.probe_new = max77714_probe,
> +};
> +module_i2c_driver(max77714_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX77714 MFD core driver");
> +MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/max77714.h b/include/linux/mfd/max77714.h
> new file mode 100644
> index 000000000000..4a274592d4f2
> --- /dev/null
> +++ b/include/linux/mfd/max77714.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Maxim MAX77714 Register and data structures definition.
> + *
> + * Copyright (C) 2021 Luca Ceresoli
> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
> + */
> +
> +#ifndef __LINUX_MFD_MAX77714_H_
> +#define __LINUX_MFD_MAX77714_H_
> +
> +#include <linux/bits.h>
> +
> +#define MAX77714_INT_TOP	0x00
> +#define MAX77714_INT_TOPM	0x07 /* Datasheet says "read only", but it is RW */
> +
> +#define MAX77714_INT_TOP_ONOFF		BIT(1)
> +#define MAX77714_INT_TOP_RTC		BIT(3)
> +#define MAX77714_INT_TOP_GPIO		BIT(4)
> +#define MAX77714_INT_TOP_LDO		BIT(5)
> +#define MAX77714_INT_TOP_SD		BIT(6)
> +#define MAX77714_INT_TOP_GLBL		BIT(7)
> +
> +#define MAX77714_32K_STATUS	0x30
> +#define MAX77714_32K_STATUS_SIOSCOK	BIT(5)
> +#define MAX77714_32K_STATUS_XOSCOK	BIT(4)
> +#define MAX77714_32K_STATUS_32KSOURCE	BIT(3)
> +#define MAX77714_32K_STATUS_32KLOAD_MSK	0x3
> +#define MAX77714_32K_STATUS_32KLOAD_SHF	1
> +#define MAX77714_32K_STATUS_CRYSTAL_CFG	BIT(0)
> +
> +#define MAX77714_32K_CONFIG	0x31
> +#define MAX77714_32K_CONFIG_XOSC_RETRY	BIT(4)
> +
> +#define MAX77714_CNFG_GLBL2	0x91
> +#define MAX77714_WDTEN			BIT(2)
> +#define MAX77714_WDTSLPC		BIT(3)
> +#define MAX77714_TWD_MASK		0x3
> +#define MAX77714_TWD_2s			0x0
> +#define MAX77714_TWD_16s		0x1
> +#define MAX77714_TWD_64s		0x2
> +#define MAX77714_TWD_128s		0x3
> +
> +#define MAX77714_CNFG_GLBL3	0x92
> +#define MAX77714_WDTC			BIT(0)
> +
> +#define MAX77714_CNFG2_ONOFF	0x94
> +#define MAX77714_WD_RST_WK		BIT(5)
> +
> +/* Interrupts */
> +enum {
> +	MAX77714_IRQ_TOP_ONOFF,
> +	MAX77714_IRQ_TOP_RTC,		/* Real-time clock */
> +	MAX77714_IRQ_TOP_GPIO,		/* GPIOs */
> +	MAX77714_IRQ_TOP_LDO,		/* Low-dropout regulators */
> +	MAX77714_IRQ_TOP_SD,		/* Step-down regulators */
> +	MAX77714_IRQ_TOP_GLBL,		/* "Global resources": Low-Battery, overtemp... */
> +};
> +
> +#endif /* __LINUX_MFD_MAX77714_H_ */

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
