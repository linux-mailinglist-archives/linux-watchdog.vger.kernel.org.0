Return-Path: <linux-watchdog+bounces-4271-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEFB9ACDE
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 18:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD791895B69
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB394A21;
	Wed, 24 Sep 2025 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwZnB2ea"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA893074A1
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729680; cv=none; b=hDttmAPhkd6FzSU2/ZUfShSA/kY3KpwPuYmM6UCoNfdEjx1pi0Jn9aRT/EFYRzq6Oz2YkTg3Iui3BFFYJ6fnFUCyV9L0Pa/9M2zFT7nqmOAArxAWpUIAA6Wf4HoIyjsVm/+4Sw1Bu4jXoWvXB7130JdzCIDnaCGdhVEKNXhDYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729680; c=relaxed/simple;
	bh=mXrNB7LpuSA355RMxwCJq8DGaHd5jqLMduvbvBysSzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vu7nFm530Yra+RsNfFKC4ZB2gi2+8y/4+/lQ4uwBx/tMcMdQ3UA1rtPVUivYfk2VySN3apigrK1CqVjgJWhI5o6YxXew8t8/hommtHy/3MMp8yUq+dkSnq7Euc0Y6EOqSX7XJTuDStbc/luaFCaGHrEGv744tGWqxKIPxl/NQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwZnB2ea; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-26e68904f0eso47538215ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729678; x=1759334478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LDfSENKdKztM+NPfriiUAqmqTtikOiZ/9cWr0HAw+U=;
        b=UwZnB2eaoGLW5TcLqcY0GZv8l91IHezicDSTvBx3GzvPswC12EczW8VS+Y1CX/hfKl
         BaZVtokXd469oDiCk8290JJonGClIxbaAREI14eCI2Ic0aJ5HM3xnpK+kyj7h0HIRjtP
         TmT4c3NB0IShkQ0kLBhEsG8ROknJ+xroWK8yZwJUvMfWbl9FZzoNtC90NUWsHYYAp8af
         o44X3sYY9AYI4dFO7Fj/vUpHJmULew9biAXFEVjHM2OIGxW9VMCzVhhu5dWk9/c51GSE
         4eDQmTy2XwzSAkbeqrzUkvsAV2D7KyGufZSsJjfFFR1ZcKUqR4rZIfjBQrQ0xO5SbYe+
         LE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729678; x=1759334478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LDfSENKdKztM+NPfriiUAqmqTtikOiZ/9cWr0HAw+U=;
        b=uIukjySVaubvwIxH5zJVXyWOcfm3xK8iXK1s5tjkS5L+/c4eOg+0kaGIAkxhef8kOz
         m4zjR92YwMxRepFCNjM9x/yssO09GmrQTZAZQk1OePbGXT+LlagY5OGzPYgFOjbOJQ+8
         0fu1KjX9WGffveaQTqahpHLIyhvRroOeus32k+81doqzmfQhDoEh4G3O6FOnEhDV6+Rc
         CvieTAsC0qoKCHFqdTXSAFWH4CVFXvxT9Q4r0dGKbFdqZTJrMya5PsOGVsiaK37j+t71
         4tazCIX9l94YW7YzgVBfBIfRES3YAkJbZMbAZQrtzz/s4VILT59qnrcIFr7LEqdwc35I
         mZXA==
X-Forwarded-Encrypted: i=1; AJvYcCX65Jm6aTpBKGMfcUsuZMKLTYNMNo2566PnSRYl52UutdnpjhCEQLYZt0cgGV/G9rg8vhLHAQah1wF3Ho9zUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzI7Z3hTkr151Lo1O8b3AGEufdeonVr46hXH9Zi74tlFJM5/7L
	avjHBCMydoeHqNzQRDErN8vHXRqVNpK4XjJ0j4dISsKxwxkxOeteHeG+
X-Gm-Gg: ASbGncuLW3ymcHV5RgCa+nuyZOXZFz/3yMddGhsvk5MmRldbX9WRSwMqSxcewmC+/2U
	H+eoqsl5zo4YNENGzhhCV2gfZuqSUH8dF5M3AlRbNBe2UNi+lSyf7vpkRCdTWq6XyazaZcldSQY
	PKVkikVhOKMLLbNmjeTIwEggFMUG+e84eHP5WG7hos6NVddKhPvw9mJ2a2/e6b0kzloUmoFJ3o6
	ZyMB6gtWFz4jUEA8Ld+zIb4nFOy+6tEincBqfoqYVUi/+YXRMU3J8lw9AKm+fuM6zbXCEI4XPoV
	L5y37sLmmVFJNxJJ9feM+gFRyxkB0YDfyTONNms8JiSgMUlDQvcoKmK8/gSjK/Tun8/jeNcsIlu
	yFY8oY5zWegM1zzZvdyXMLwfY/EO811LwUANlgfeMGSu4ew==
X-Google-Smtp-Source: AGHT+IFtAaeNUhmSq0xhqL9R/6td548Mj/QtR3u0DHfxagwGl+GUEvYYfxMUJWaJJiOeIsz8vok9NQ==
X-Received: by 2002:a17:903:3550:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-27ed4a7e8e2mr2255345ad.29.1758729675569;
        Wed, 24 Sep 2025 09:01:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de5dbsm194880005ad.84.2025.09.24.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:01:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 09:01:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 6/7] hwmon: add SMARC-sAM67 support
Message-ID: <bcd0c368-aa55-4c95-a4da-ebff162d674e@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-7-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-7-mwalle@kernel.org>

On Fri, Sep 12, 2025 at 02:07:44PM +0200, Michael Walle wrote:
> Add a new driver for the Kontron SMARC-sAM67 board management
> controller. It has two voltage sensors and one temperature sensor.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied.

Guenter

> ---
>  Documentation/hwmon/sa67.rst  |  41 +++++++++

Note: Added to index.rst file

>  MAINTAINERS                   |   1 +
>  drivers/hwmon/Kconfig         |  10 +++
>  drivers/hwmon/Makefile        |   1 +
>  drivers/hwmon/sa67mcu-hwmon.c | 161 ++++++++++++++++++++++++++++++++++
>  5 files changed, 214 insertions(+)
>  create mode 100644 Documentation/hwmon/sa67.rst
>  create mode 100644 drivers/hwmon/sa67mcu-hwmon.c
> 
> diff --git a/Documentation/hwmon/sa67.rst b/Documentation/hwmon/sa67.rst
> new file mode 100644
> index 000000000000..029c7c169b7f
> --- /dev/null
> +++ b/Documentation/hwmon/sa67.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver sa67mcu
> +=====================
> +
> +Supported chips:
> +
> +   * Kontron sa67mcu
> +
> +     Prefix: 'sa67mcu'
> +
> +     Datasheet: not available
> +
> +Authors: Michael Walle <mwalle@kernel.org>
> +
> +Description
> +-----------
> +
> +The sa67mcu is a board management controller which also exposes a hardware
> +monitoring controller.
> +
> +The controller has two voltage and one temperature sensor. The values are
> +hold in two 8 bit registers to form one 16 bit value. Reading the lower byte
> +will also capture the high byte to make the access atomic. The unit of the
> +volatge sensors are 1mV and the unit of the temperature sensor is 0.1degC.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported.
> +
> +======================= ========================================================
> +in0_label		"VDDIN"
> +in0_input		Measured VDDIN voltage.
> +
> +in1_label		"VDD_RTC"
> +in1_input		Measured VDD_RTC voltage.
> +
> +temp1_input		MCU temperature. Roughly the board temperature.
> +======================= ========================================================
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa7f80bd7b2f..69fcd5c077ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23489,6 +23489,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.
>  F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
>  F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
>  F:	drivers/gpio/gpio-sl28cpld.c
> +F:	drivers/hwmon/sa67mcu-hwmon.c
>  F:	drivers/hwmon/sl28cpld-hwmon.c
>  F:	drivers/irqchip/irq-sl28cpld.c
>  F:	drivers/pwm/pwm-sl28cpld.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d6769288a76e..c2f288ebdf44 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1905,6 +1905,16 @@ config SENSORS_RASPBERRYPI_HWMON
>  	  This driver can also be built as a module. If so, the module
>  	  will be called raspberrypi-hwmon.
>  
> +config SENSORS_SA67MCU
> +	tristate "Kontron sa67mcu hardware monitoring driver"
> +	depends on MFD_SL28CPLD || COMPILE_TEST
> +	help
> +	  If you say yes here you get support for the voltage and temperature
> +	  monitor of the sa67 board management controller.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sa67mcu-hwmon.
> +
>  config SENSORS_SL28CPLD
>  	tristate "Kontron sl28cpld hardware monitoring driver"
>  	depends on MFD_SL28CPLD || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 051981eb8a50..2956898776bb 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -197,6 +197,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>  obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
> +obj-$(CONFIG_SENSORS_SA67MCU)	+= sa67mcu-hwmon.o
>  obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
> diff --git a/drivers/hwmon/sa67mcu-hwmon.c b/drivers/hwmon/sa67mcu-hwmon.c
> new file mode 100644
> index 000000000000..22f703b7b256
> --- /dev/null
> +++ b/drivers/hwmon/sa67mcu-hwmon.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * sl67mcu hardware monitoring driver
> + *
> + * Copyright 2025 Kontron Europe GmbH
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define SA67MCU_VOLTAGE(n)	(0x00 + ((n) * 2))
> +#define SA67MCU_TEMP(n)		(0x04 + ((n) * 2))
> +
> +struct sa67mcu_hwmon {
> +	struct regmap *regmap;
> +	u32 offset;
> +};
> +
> +static int sa67mcu_hwmon_read(struct device *dev,
> +			      enum hwmon_sensor_types type, u32 attr,
> +			      int channel, long *input)
> +{
> +	struct sa67mcu_hwmon *hwmon = dev_get_drvdata(dev);
> +	unsigned int offset;
> +	u8 reg[2];
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			offset = hwmon->offset + SA67MCU_VOLTAGE(channel);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			offset = hwmon->offset + SA67MCU_TEMP(channel);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Reading the low byte will capture the value */
> +	ret = regmap_bulk_read(hwmon->regmap, offset, reg, ARRAY_SIZE(reg));
> +	if (ret)
> +		return ret;
> +
> +	*input = reg[1] << 8 | reg[0];
> +
> +	/* Temperatures are s16 and in 0.1degC steps. */
> +	if (type == hwmon_temp)
> +		*input = sign_extend32(*input, 15) * 100;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info * const sa67mcu_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const char *const sa67mcu_hwmon_in_labels[] = {
> +	"VDDIN",
> +	"VDD_RTC",
> +};
> +
> +static int sa67mcu_hwmon_read_string(struct device *dev,
> +				     enum hwmon_sensor_types type, u32 attr,
> +				     int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*str = sa67mcu_hwmon_in_labels[channel];
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops sa67mcu_hwmon_ops = {
> +	.visible = 0444,
> +	.read = sa67mcu_hwmon_read,
> +	.read_string = sa67mcu_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info sa67mcu_hwmon_chip_info = {
> +	.ops = &sa67mcu_hwmon_ops,
> +	.info = sa67mcu_hwmon_info,
> +};
> +
> +static int sa67mcu_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct sa67mcu_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	if (!pdev->dev.parent)
> +		return -ENODEV;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!hwmon->regmap)
> +		return -ENODEV;
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
> +	if (ret)
> +		return -EINVAL;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							 "sa67mcu_hwmon", hwmon,
> +							 &sa67mcu_hwmon_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		dev_err(&pdev->dev, "failed to register as hwmon device");
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id sa67mcu_hwmon_of_match[] = {
> +	{ .compatible = "kontron,sa67mcu-hwmon", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sa67mcu_hwmon_of_match);
> +
> +static struct platform_driver sa67mcu_hwmon_driver = {
> +	.probe = sa67mcu_hwmon_probe,
> +	.driver = {
> +		.name = "sa67mcu-hwmon",
> +		.of_match_table = sa67mcu_hwmon_of_match,
> +	},
> +};
> +module_platform_driver(sa67mcu_hwmon_driver);
> +
> +MODULE_DESCRIPTION("sa67mcu Hardware Monitoring Driver");
> +MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
> +MODULE_LICENSE("GPL");

