Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F932C63A9
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Nov 2020 12:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgK0LOg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Nov 2020 06:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgK0LOg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Nov 2020 06:14:36 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C8BC0613D1
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Nov 2020 03:14:34 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so4781861wmc.5
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Nov 2020 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=etB+YuwIw4ZeblyDfLljH3OssvYmNYG0Qdm9APfI/wo=;
        b=TxuMqd8wZW/yn9UWiaGcf8nXcTCYNw68bk/R++T8/USabpH6xr4RwiToL2O+RXmRdW
         5ExE29dcIlFu80TY3lxqSitjHg3kfUQf/x3mOBHOFS8mPUfLt0w5Ngza7We0jfiVW1Kz
         etyHJZCx9hRE/l88cbpMA+NtnDcTEp5wJIRO9DY5yo1latjfdPC0bi7qdd0b3+6mLJVS
         6mmLiqgkcUWzD9eMYTPIwzgLRedE8TKSxMoxRxqyZkVRsF/No3rnw05AZMhGvG6afgh6
         +td/0BWE4eMiXLT42qNm0aAEZdMeOjvauPHjcbipl2+4OFRPk1DDq6ZJtqffqmYGtmyQ
         2zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=etB+YuwIw4ZeblyDfLljH3OssvYmNYG0Qdm9APfI/wo=;
        b=dYCbH4Zl+wccNE6+6VTBTEXZQbRKjW/xTElEnX1ZHfmPVa0B3L35VM1UmR1giCCh9W
         /vED/q8hPV1ZV01nKxkegbpwMJn546fa9BhAdBWAJfuq0VZce64PQMdKqOcumeLLjqeI
         5z0+PIN42pDID2ZKDV9ar0SNSGP3S4TeG7dcJt2RLPS7ypBrmxXrwN5qh3rOiI5mHNs7
         2DFz6AWUMWFsIC6wdCr6+zv0zKlNBGDrReiv5jikrFsf75VOu+9wOnd+J+rq+brl8JLI
         W1mdN+dsPodJrL5IHpSKRpTQzcRuj3RvwrQGGkXWa+GCKNkpTTvdt1a8w5iaCNbs9rRG
         k4xQ==
X-Gm-Message-State: AOAM531KdEW5SSg/sMa+SIVA8Ffeq43/0OBgvslkZE6/NE/W6qokz8ot
        OKdS/S4bEp9YWRuZ+hQ08/vliQ==
X-Google-Smtp-Source: ABdhPJz11izM4EAZS4A1DkHCHCWtukeIAeZen5dNOV4tTAjFq+pM4ovDOASi8PBmfGFbJE2icnho5A==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr8244147wmi.75.1606475672430;
        Fri, 27 Nov 2020 03:14:32 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id s4sm14082923wru.56.2020.11.27.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 03:14:31 -0800 (PST)
Date:   Fri, 27 Nov 2020 11:14:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Shihlun Lin <shihlun.lin@advantech.com.tw>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Campion Kang <campion.kang@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [RESEND PATCH v4 4/6] mfd: ahc1ec0: Add support for Advantech
 embedded controller
Message-ID: <20201127111429.GR2455276@dell>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
 <20201125070744.4651-4-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125070744.4651-4-shihlun.lin@advantech.com.tw>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 25 Nov 2020, Shihlun Lin wrote:

> AHC1EC0 is the embedded controller driver for Advantech industrial
> products. This provides sub-devices such as hwmon and watchdog, and also
> expose functions for sub-devices to read/write the value to embedded
> controller.
> 
> Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
> ---
>  drivers/mfd/Kconfig         |   10 +
>  drivers/mfd/Makefile        |    2 +
>  drivers/mfd/ahc1ec0.c       | 1405 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ahc1ec0.h |  338 +++++++++
>  4 files changed, 1755 insertions(+)
>  create mode 100644 drivers/mfd/ahc1ec0.c
>  create mode 100644 include/linux/mfd/ahc1ec0.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 8b99a13669bf..1cc40217f798 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2166,5 +2166,15 @@ config MFD_INTEL_M10_BMC
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_AHC1EC0
> +	tristate "Advantech Embedded Controller Module"
> +	depends on X86
> +	select MFD_CORE
> +	help
> +	  This is the core function that for Advantech EC drivers. It
> +	  includes the sub-devices such as hwmon, watchdog, etc. And also
> +	  provides expose functions for sub-devices to read/write the value
> +	  to embedded controller.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 1780019d2474..80a9a2bdc3ba 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -267,3 +267,5 @@ obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
>  obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
>  obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
>  obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
> +
> +obj-$(CONFIG_MFD_AHC1EC0)	+= ahc1ec0.o
> diff --git a/drivers/mfd/ahc1ec0.c b/drivers/mfd/ahc1ec0.c
> new file mode 100644
> index 000000000000..768d2063bed1
> --- /dev/null
> +++ b/drivers/mfd/ahc1ec0.c
> @@ -0,0 +1,1405 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Base driver for Advantech controlling EC chip AHC1EC0
> + *
> + * Copyright (C) 2020, Advantech Automation Corp.
> + *
> + * Change Log:
> + *              Version 1.00 <10/10/2014> Sun.Lang
> + *              - Initial version
> + *              Version 1.01 <11/05/2015> Jiangwei.Zhu
> + *              - Modify read_ad_value() function.
> + *              - Add smbus_read_byte() function.
> + *              - Add smbus_write_byte() function.
> + *              - Add wait_smbus_protocol_finish() function.
> + *              Version 1.02 <03/04/2016> Jiangwei.Zhu
> + *              - Add smbus_read_word() function.
> + *              Version 1.03 <01/22/2017> Ji.Xu
> + *              - Add detect to Advantech porduct name "ECU".
> + *              Version 1.04 <09/20/2017> Ji.Xu
> + *              - Update to support detect Advantech product name in UEFI
> + *                BIOS(DMI).
> + *              Version 1.05 <11/02/2017> Ji.Xu
> + *              - Fixed issue: Cache coherency error when exec 'ioremap_uncache()'
> + *                in kernel-4.10.
> + *              Version 2.00 <11/04/2020> Shihlun.Lin
> + *              - Update: Replace ioremap_nocache() with ioremap_uc() since
> + *                ioremap_uc() was used on the entire PCI BAR.
> + */

This is v1.0.

> +#include <linux/kconfig.h>
> +#include <linux/module.h>
> +#include <linux/errno.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/wait.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +#include <linux/mfd/ahc1ec0.h>
> +#include <linux/acpi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mfd/core.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>

Alphabetical.

> +#define ADVANTECH_EC_NAME      "ahc1ec0"

No need to define names.

Please just use the string where you need it.

> +#define ADVANTECH_EC_MFD_VER    "2.0.0"
> +#define ADVANTECH_EC_MFD_DATE   "11/04/2020"

No software version numbers or dates please.

This will artificially age the driver.

> +struct mutex lock;

Not global please.  Place this in driver data.

> +enum {
> +	ADVEC_SUBDEV_BRIGHTNESS = 0,
> +	ADVEC_SUBDEV_EEPROM,
> +	ADVEC_SUBDEV_GPIO,
> +	ADVEC_SUBDEV_HWMON,
> +	ADVEC_SUBDEV_LED,
> +	ADVEC_SUBDEV_WDT,
> +	ADVEC_SUBDEV_MAX,
> +};

Why do you need to enumerate these?

Are they numbered off in the datasheet?

> +static int wait_ibf(void)

ibf?

Please use better/more forthcoming nomenclature.

> +{
> +	int i;
> +
> +	for (i = 0; i < EC_MAX_TIMEOUT_COUNT; i++) {
> +		if ((inb(EC_COMMAND_PORT) & 0x02) == 0)

No magic numbers.  Please define all of them.

> +			return 0;
> +
> +		udelay(EC_UDELAY_TIME);

This is not a good name for a define.

What are you delaying/waiting for?

> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +/* Wait OBF (Output buffer full) set */

If you name the function better, you won't need to supplement with
comments.

> +static int wait_obf(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < EC_MAX_TIMEOUT_COUNT; i++) {
> +		if ((inb(EC_COMMAND_PORT) & 0x01) != 0)
> +			return 0;
> +
> +		udelay(EC_UDELAY_TIME);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +/* Read data from EC HW ram */
> +static int read_hw_ram(uchar addr, uchar *data)
> +{
> +	int ret;
> +
> +	mutex_lock(&lock);
> +
> +	/* Step 0. Wait IBF clear */
> +	ret = wait_ibf();
> +	if (ret)
> +		goto error;
> +
> +	/* Step 1. Send "read EC HW ram" command to EC Command port */

Not required.

> +	outb(EC_HW_RAM_READ, EC_COMMAND_PORT);
> +
> +	/* Step 2. Wait IBF clear */

Better function names eliminates the need for this.

Same for below too.

> +	ret = wait_ibf();
> +	if (ret)
> +		goto error;
> +
> +	/* Step 3. Send "EC HW ram" address to EC Data port */
> +	outb(addr, EC_STATUS_PORT);
> +
> +	/* Step 4. Wait OBF set */
> +	ret = wait_obf();
> +	if (ret)
> +		goto error;
> +
> +	/* Step 5. Get "EC HW ram" data from EC Data port */
> +	*data = inb(EC_STATUS_PORT);
> +
> +	mutex_unlock(&lock);
> +
> +	return ret;
> +
> +error:
> +	mutex_unlock(&lock);
> +	pr_err("%s: Wait for IBF or OBF too long. line: %d", __func__, __LINE__);
> +	return ret;
> +}

Any reason not to use regmap?

> +/* Write data to EC HW ram */
> +int write_hw_ram(uchar addr, uchar data)
> +{
> +	int ret;
> +
> +	mutex_lock(&lock);
> +	/* Step 0. Wait IBF clear */
> +	ret = wait_ibf();
> +	if (ret)
> +		goto error;
> +
> +	/* Step 1. Send "write EC HW ram" command to EC command port */
> +	outb(EC_HW_RAM_WRITE, EC_COMMAND_PORT);
> +
> +	/* Step 2. Wait IBF clear */
> +	ret = wait_ibf();
> +	if (ret)
> +		goto error;
> +
> +	/* Step 3. Send "EC HW ram" address to EC Data port */
> +	outb(addr, EC_STATUS_PORT);
> +
> +	/* Step 4. Wait IBF clear */
> +	ret = wait_ibf();
> +	if (ret)
> +		goto error;
> +
> +	/* Step 5. Send "EC HW ram" data to EC Data port */
> +	outb(data, EC_STATUS_PORT);
> +
> +	mutex_unlock(&lock);
> +
> +	return 0;
> +
> +error:
> +	mutex_unlock(&lock);
> +	pr_err("%s: Wait for IBF too long. line: %d", __func__, __LINE__);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(write_hw_ram);

[Big snip!]

None of this belongs in MFD.  See below at the prototypes.

> +static const struct mfd_cell adv_ec_sub_cells[] = {
> +	{ .name = "adv-ec-brightness", },
> +	{ .name = "adv-ec-eeprom", },
> +	{ .name = "adv-ec-gpio", },
> +	{ .name = "adv-ec-hwmon", },
> +	{ .name = "adv-ec-led", },
> +	{ .name = "adv-ec-wdt", },
> +};
> +
> +static int adv_ec_init_ec_data(struct adv_ec_platform_data *pdata)
> +{
> +	int ret;
> +
> +	pdata->sub_dev_mask = 0;
> +	pdata->sub_dev_nb = 0;
> +	pdata->dym_tbl = NULL;
> +	pdata->bios_product_name = NULL;
> +
> +	/* Get product name */
> +	pdata->bios_product_name = kmalloc(AMI_ADVANTECH_BOARD_ID_LENGTH, GFP_KERNEL);
> +	if (!pdata->bios_product_name)
> +		return -ENOMEM;
> +
> +	memset(pdata->bios_product_name, 0, AMI_ADVANTECH_BOARD_ID_LENGTH);
> +	ret = adv_ec_get_productname(pdata->bios_product_name);
> +	if (ret)
> +		return ret;
> +
> +	/* Get pin table */
> +	pdata->dym_tbl = kmalloc(EC_MAX_TBL_NUM*sizeof(struct Dynamic_Tab), GFP_KERNEL);
> +	if (!pdata->dym_tbl)
> +		return -ENOMEM;
> +
> +	ret = adv_get_dynamic_tab(pdata);
> +
> +	return 0;
> +}
> +
> +static int adv_ec_parse_prop(struct adv_ec_platform_data *pdata)
> +{
> +	int i, ret;
> +	u32 nb, sub_dev[ADVEC_SUBDEV_MAX];
> +
> +	ret = device_property_read_u32(pdata->dev, "advantech,sub-dev-nb", &nb);
> +	if (ret < 0) {
> +		dev_err(pdata->dev, "get sub-dev-nb failed! (%d)", ret);
> +		return ret;
> +	}
> +	pdata->sub_dev_nb = nb;
> +
> +	ret = device_property_read_u32_array(pdata->dev, "advantech,sub-dev", sub_dev, nb);
> +	if (ret < 0) {
> +		dev_err(pdata->dev, "get sub-dev failed! (%d)", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < nb; i++) {
> +		switch (sub_dev[i]) {
> +		case ADVEC_SUBDEV_BRIGHTNESS:
> +		case ADVEC_SUBDEV_EEPROM:
> +		case ADVEC_SUBDEV_GPIO:
> +		case ADVEC_SUBDEV_HWMON:
> +		case ADVEC_SUBDEV_LED:
> +		case ADVEC_SUBDEV_WDT:
> +			pdata->sub_dev_mask |= BIT(sub_dev[i]);
> +			break;
> +		default:
> +			dev_err(pdata->dev, "invalid prop value(%d)!", sub_dev[i]);
> +		}
> +	}
> +	dev_info(pdata->dev, "sub-dev mask = 0x%x", pdata->sub_dev_mask);
> +
> +	return 0;
> +}
> +
> +static int adv_ec_probe(struct platform_device *pdev)
> +{
> +	int ret, i;
> +	struct device *dev = &pdev->dev;
> +	struct adv_ec_platform_data *adv_ec_data;
> +
> +	adv_ec_data = kmalloc(sizeof(struct adv_ec_platform_data), GFP_KERNEL);

Use devm_* managed resource, then you don't have to worry about
freeing it on error/release.

> +	if (!adv_ec_data) {
> +		ret = -ENOMEM;
> +		goto err_plat_data;

Just return -ENOMEM here.

> +	}
> +
> +	dev_set_drvdata(dev, (void *)adv_ec_data);

You shouldn't need to cast this.

> +	adv_ec_data->dev = dev;
> +
> +	mutex_init(&lock);
> +
> +	ret = adv_ec_init_ec_data(adv_ec_data);
> +	if (ret)
> +		goto err_init_data;
> +
> +	ret = adv_ec_parse_prop(adv_ec_data);
> +	if (ret)
> +		goto err_prop;
> +
> +	for (i = 0; i < ARRAY_SIZE(adv_ec_sub_cells); i++) {
> +		if (adv_ec_data->sub_dev_mask & BIT(i)) {
> +			ret = mfd_add_hotplug_devices(dev, &adv_ec_sub_cells[i], 1);

Why are you passing them in individually?

Just pass the whole struct and let the framework do the rest.

> +			if (ret)
> +				dev_err(dev, "failed to add %s subdevice: %d",
> +					adv_ec_sub_cells[i].name, ret);
> +		}
> +	}
> +
> +	dev_info(&pdev->dev, "Ver:%s, Data:%s, probe done",
> +			ADVANTECH_EC_MFD_VER, ADVANTECH_EC_MFD_DATE);

Remove this.

> +	return 0;
> +
> +err_prop:
> +err_init_data:
> +	kfree(adv_ec_data->dym_tbl);
> +	kfree(adv_ec_data->bios_product_name);
> +	kfree(adv_ec_data);

Use devm_* then you don't have do worry about this.

> +err_plat_data:
> +	return ret;
> +}
> +
> +static int adv_ec_remove(struct platform_device *pdev)
> +{
> +	struct adv_ec_platform_data *adv_ec_data;
> +
> +	adv_ec_data = (struct adv_ec_platform_data *)dev_get_drvdata(&pdev->dev);

You shouldn't need to cast.

> +	kfree(adv_ec_data->dym_tbl);
> +	kfree(adv_ec_data->bios_product_name);
> +	kfree(adv_ec_data);

Not needed.

> +	mfd_remove_devices(&pdev->dev);

Use devm_*

> +	mutex_destroy(&lock);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id adv_ec_of_match[] = {
> +	{ .compatible = "advantech,ahc1ec0", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, adv_ec_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id adv_ec_acpi_match[] = {
> +	{"AHC1EC0", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, adv_ec_acpi_match);
> +#endif
> +
> +static const struct platform_device_id adv_ec_id[] = {
> +	{ ADVANTECH_EC_NAME, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, adv_ec_id);

Can you tell me what this does?

> +static struct platform_driver adv_ec_driver = {
> +	.driver = {
> +		.name = ADVANTECH_EC_NAME,
> +#ifdef CONFIG_OF
> +		.of_match_table = of_match_ptr(adv_ec_of_match),
> +#endif
> +#ifdef CONFIG_ACPI
> +		.acpi_match_table = ACPI_PTR(adv_ec_acpi_match),
> +#endif

Remove all of the #ifery above.

Just mark adv_ec_of_match and adv_ec_acpi_match as __maybe_unused.

> +	},
> +	.id_table = adv_ec_id,
> +	.probe = adv_ec_probe,
> +	.remove = adv_ec_remove,
> +};
> +module_platform_driver(adv_ec_driver);
> +
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_AUTHOR("sun.lang");

Contact details please i.e. email address.

> +MODULE_DESCRIPTION("Advantech EC MFD Driver.");

No such thing as an "MFD Driver".  Please describe what it does/is.

> diff --git a/include/linux/mfd/ahc1ec0.h b/include/linux/mfd/ahc1ec0.h
> new file mode 100644
> index 000000000000..9c1991695305
> --- /dev/null
> +++ b/include/linux/mfd/ahc1ec0.h
> @@ -0,0 +1,338 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __LINUX_MFD_AHC1EC0_H
> +#define __LINUX_MFD_AHC1EC0_H
> +
> +#include <linux/device.h>
> +
> +#define uchar unsigned int

Nope.  Standard types please.

> +#define EC_COMMAND_PORT             0x29A
> +#define EC_STATUS_PORT              0x299
> +
> +#define EC_UDELAY_TIME              200
> +#define EC_MAX_TIMEOUT_COUNT        5000

Where did those values come from?

> +/* AD command */

What is "AD"?

> +#define EC_AD_INDEX_WRITE   0x15
> +#define EC_AD_LSB_READ      0x16
> +#define EC_AD_MSB_READ      0x1F
> +
> +/* voltage device id */

"Voltage device ID"

> +#define EC_DID_CMOSBAT      0x50 /* CMOS coin battery voltage */
> +#define EC_DID_CMOSBAT_X2   0x51 /* CMOS coin battery voltage*2 */
> +#define EC_DID_CMOSBAT_X10  0x52 /* CMOS coin battery voltage*10 */
> +#define EC_DID_5VS0         0x56 /* 5VS0 voltage */
> +#define EC_DID_5VS0_X2      0x57 /* 5VS0 voltage*2 */
> +#define EC_DID_5VS0_X10     0x58 /* 5VS0 voltage*10 */
> +#define EC_DID_5VS5         0x59 /* 5VS5 voltage */
> +#define EC_DID_5VS5_X2      0x5A /* 5VS5 voltage*2 */
> +#define EC_DID_5VS5_X10     0x5B /* 5VS5 voltage*10 */
> +#define EC_DID_12VS0        0x62 /* 12VS0 voltage */
> +#define EC_DID_12VS0_X2     0x63 /* 12VS0 voltage*2 */
> +#define EC_DID_12VS0_X10    0x64 /* 12VS0 voltage*10 */
> +#define EC_DID_VCOREA       0x65 /* CPU A core voltage */
> +#define EC_DID_VCOREA_X2    0x66 /* CPU A core voltage*2 */
> +#define EC_DID_VCOREA_X10   0x67 /* CPU A core voltage*10 */
> +#define EC_DID_VCOREB       0x68 /* CPU B core voltage */
> +#define EC_DID_VCOREB_X2    0x69 /* CPU B core voltage*2 */
> +#define EC_DID_VCOREB_X10   0x6A /* CPU B core voltage*10 */
> +#define EC_DID_DC           0x6B /* ADC. onboard voltage */
> +#define EC_DID_DC_X2        0x6C /* ADC. onboard voltage*2 */
> +#define EC_DID_DC_X10       0x6D /* ADC. onboard voltage*10 */
> +#define EC_DID_SMBOEM0      0x28 /* SMBUS/I2C. Smbus channel 0 */

This should be in order.

> +/* Current device id */

"ID"

> +#define EC_DID_CURRENT              0x74
> +
> +/* ACPI commands */
> +#define EC_ACPI_RAM_READ            0x80
> +#define EC_ACPI_RAM_WRITE           0x81
> +
> +/*
> + *  Dynamic control table commands
> + *  The table includes HW pin number,Device ID,and Pin polarity
> + */

Spaces after the ','s.

> +#define EC_TBL_WRITE_ITEM           0x20
> +#define EC_TBL_GET_PIN              0x21
> +#define EC_TBL_GET_DEVID            0x22
> +#define EC_MAX_TBL_NUM              32
> +
> +/* LED Device ID table */
> +#define EC_DID_LED_RUN              0xE1
> +#define EC_DID_LED_ERR              0xE2
> +#define EC_DID_LED_SYS_RECOVERY     0xE3
> +#define EC_DID_LED_D105_G           0xE4
> +#define EC_DID_LED_D106_G           0xE5
> +#define EC_DID_LED_D107_G           0xE6
> +
> +/* LED control HW ram address 0xA0-0xAF */

"RAM"

> +#define EC_HWRAM_LED_BASE_ADDR      0xA0
> +#define EC_HWRAM_LED_PIN(N)         (EC_HWRAM_LED_BASE_ADDR + (4 * (N))) // N:0-3
> +#define EC_HWRAM_LED_CTRL_HIBYTE(N) (EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 1)
> +#define EC_HWRAM_LED_CTRL_LOBYTE(N) (EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 2)
> +#define EC_HWRAM_LED_DEVICE_ID(N)   (EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 3)
> +
> +/* LED control bit */
> +#define LED_CTRL_ENABLE_BIT             (1 << 4)
> +#define LED_CTRL_INTCTL_BIT             (1 << 5)

BIT()

> +#define LED_CTRL_LEDBIT_MASK            (0x03FF << 6)
> +#define LED_CTRL_POLARITY_MASK          (0x000F << 0)
> +#define LED_CTRL_INTCTL_EXTERNAL        0
> +#define LED_CTRL_INTCTL_INTERNAL        1
> +
> +#define LED_DISABLE  0x0
> +#define LED_ON       0x1
> +#define LED_FAST     0x3
> +#define LED_NORMAL   0x5
> +#define LED_SLOW     0x7
> +#define LED_MANUAL   0xF
> +
> +#define LED_CTRL_LEDBIT_DISABLE	(0x0000)
> +#define LED_CTRL_LEDBIT_ON		(0x03FF)
> +#define LED_CTRL_LEDBIT_FAST	(0x02AA)
> +#define LED_CTRL_LEDBIT_NORMAL	(0x0333)
> +#define LED_CTRL_LEDBIT_SLOW	(0x03E0)

Why are some of these in brackets and others aren't?

> +/* Get the device name */
> +#define AMI_BIOS_NAME                               "AMIBIOS"

Just use the string in-place.

> +#define AMI_BIOS_NAME_ADDRESS                       0x000FF400
> +#define AMI_BIOS_NAME_LENGTH                        strlen(AMI_BIOS_NAME)
> +#define AMI_ADVANTECH_BOARD_ID_ADDRESS              0x000FE840
> +#define AMI_ADVANTECH_BOARD_ID_LENGTH               32
> +#define AMI_ADVANTECH_BOARD_NAME_ADDRESS            0x000FF550
> +#define AMI_ADVANTECH_BOARD_NAME_LENGTH             _ADVANTECH_BOARD_NAME_LENGTH
> +#define AMI_UEFI_ADVANTECH_BOARD_NAME_ADDRESS       0x000F0000
> +#define AMI_UEFI_ADVANTECH_BOARD_NAME_LENGTH        0xFFFF
> +
> +/*
> + *  EC WDT commands

Expand "EC WDT"

> + *  EC can send multistage watchdog event. System can setup watchdog event

"multi-stage"

> + *  independently to makeup event sequence.

"make up"

> + */
> +#define	EC_WDT_START			0x28
> +#define	EC_WDT_STOP		        0x29
> +#define	EC_WDT_RESET			0x2A
> +#define	EC_WDT_BOOTTMEWDT_STOP		0x2B
> +#define EC_HW_RAM			0x89
> +#define EC_EVENT_FLAG			0x57
> +#define EC_RESET_EVENT			0x04
> +#define EC_COMMANS_PORT_IBF_MASK	0x02
> +#define EC_ENABLE_DELAY_L		0x59
> +#define EC_ENABLE_DELAY_H		0x58
> +#define EC_POWER_BTN_TIME_L		0x5B
> +#define EC_POWER_BTN_TIME_H		0x5A
> +#define EC_RESET_DELAY_TIME_L		0x5F
> +#define EC_RESET_DELAY_TIME_H		0x5E
> +#define EC_PIN_DELAY_TIME_L		0x61
> +#define EC_PIN_DELAY_TIME_H		0x60
> +#define EC_SCI_DELAY_TIME_H		0x62
> +#define EC_SCI_DELAY_TIME_L		0x63

In order or separate.

> +/* EC ACPI commands */
> +#define EC_ACPI_DATA_READ		0x80
> +#define EC_ACPI_DATA_WRITE		0x81
> +
> +/* Brightness ACPI Addr */
> +#define BRIGHTNESS_ACPI_ADDR		0x50
> +
> +/* EC HW Ram commands */
> +#define EC_HW_EXTEND_RAM_READ		0x86
> +#define EC_HW_EXTEND_RAM_WRITE		0x87
> +#define	EC_HW_RAM_READ			0x88
> +#define EC_HW_RAM_WRITE			0x89
> +
> +/* EC Smbus commands */
> +#define EC_SMBUS_CHANNEL_SET	0x8A	 /* Set selector number (SMBUS channel) */
> +#define EC_SMBUS_ENABLE_I2C	0x8C	 /* Enable channel I2C */
> +#define EC_SMBUS_DISABLE_I2C	0x8D	 /* Disable channel I2C */
> +
> +/* Smbus transmit protocol */
> +#define EC_SMBUS_PROTOCOL		0x00
> +
> +/* SMBUS status */
> +#define EC_SMBUS_STATUS			0x01
> +
> +/* SMBUS device slave address (bit0 must be 0) */
> +#define EC_SMBUS_SLV_ADDR		0x02
> +
> +/* SMBUS device command */
> +#define EC_SMBUS_CMD			0x03
> +
> +/* 0x04-0x24 Data In read process, return data are stored in this address */
> +#define EC_SMBUS_DATA			0x04
> +
> +#define EC_SMBUS_DAT_OFFSET(n)	(EC_SMBUS_DATA + (n))
> +
> +/* SMBUS channel selector (0-4) */
> +#define EC_SMBUS_CHANNEL		0x2B
> +
> +/* EC SMBUS transmit Protocol code */
> +#define SMBUS_QUICK_WRITE		0x02 /* Write Quick Command */
> +#define SMBUS_QUICK_READ		0x03 /* Read Quick Command */
> +#define SMBUS_BYTE_SEND			0x04 /* Send Byte */
> +#define SMBUS_BYTE_RECEIVE		0x05 /* Receive Byte */
> +#define SMBUS_BYTE_WRITE		0x06 /* Write Byte */
> +#define SMBUS_BYTE_READ			0x07 /* Read Byte */
> +#define SMBUS_WORD_WRITE		0x08 /* Write Word */
> +#define SMBUS_WORD_READ			0x09 /* Read Word */
> +#define SMBUS_BLOCK_WRITE		0x0A /* Write Block */
> +#define SMBUS_BLOCK_READ		0x0B /* Read Block */
> +#define SMBUS_PROC_CALL			0x0C /* Process Call */
> +#define SMBUS_BLOCK_PROC_CALL	0x0D /* Write Block-Read Block Process Call */
> +#define SMBUS_I2C_READ_WRITE	0x0E /* I2C block Read-Write */
> +#define SMBUS_I2C_WRITE_READ	0x0F /* I2C block Write-Read */
> +
> +/* GPIO control commands */
> +#define EC_GPIO_INDEX_WRITE		0x10
> +#define EC_GPIO_STATUS_READ		0x11
> +#define EC_GPIO_STATUS_WRITE		0x12
> +#define EC_GPIO_DIR_READ		0x1D
> +#define EC_GPIO_DIR_WRITE		0x1E
> +
> +/* One Key Recovery commands */
> +#define EC_ONE_KEY_FLAG         0x9C
> +
> +/* ASG OEM commands */
> +#define EC_ASG_OEM				0xEA
> +#define EC_ASG_OEM_READ			0x00
> +#define EC_ASG_OEM_WRITE		0x01
> +#define EC_OEM_POWER_STATUS_VIN1	0X10
> +#define EC_OEM_POWER_STATUS_VIN2	0X11
> +#define EC_OEM_POWER_STATUS_BAT1	0X12
> +#define EC_OEM_POWER_STATUS_BAT2	0X13
> +
> +/* GPIO DEVICE ID */
> +#define EC_DID_ALTGPIO_0        0x10    /* 0x10 AltGpio0 User define gpio */
> +#define EC_DID_ALTGPIO_1        0x11    /* 0x11 AltGpio1 User define gpio */
> +#define EC_DID_ALTGPIO_2        0x12    /* 0x12 AltGpio2 User define gpio */
> +#define EC_DID_ALTGPIO_3        0x13    /* 0x13 AltGpio3 User define gpio */
> +#define EC_DID_ALTGPIO_4        0x14    /* 0x14 AltGpio4 User define gpio */
> +#define EC_DID_ALTGPIO_5        0x15    /* 0x15 AltGpio5 User define gpio */
> +#define EC_DID_ALTGPIO_6        0x16    /* 0x16 AltGpio6 User define gpio */
> +#define EC_DID_ALTGPIO_7        0x17    /* 0x17 AltGpio7 User define gpio */
> +
> +/* Lmsensor Chip Register */
> +#define NSLM96163_CHANNEL		0x02
> +
> +/* NS_LM96163 address 0x98 */
> +#define NSLM96163_ADDR			0x98
> +
> +/* LM96163 index(0x00) Local Temperature (Signed MSB) */
> +#define NSLM96163_LOC_TEMP		0x00
> +
> +#define F75387_REG_R_MANU_ID	0x5D
> +#define F75387_REG_R_CHIP_ID	0x5A
> +
> +#define LMF75387_MANU_ID_FINTEK			0x1934 //VENDOR ID
> +#define LMF75387_CHIP_ID_F75387			0x0410 //CHIPID
> +
> +/* Lmsensor Chip SMUBS Slave Address */
> +#define	LMF75387_SMBUS_SLAVE_ADDRESS_5C		0x5c
> +#define	LMF75387_SMBUS_SLAVE_ADDRESS_5A		0x5A
> +#define	INA266_SMBUS_SLAVE_ADDRESS_8A		0x8A
> +
> +/* Temperature */
> +#define F75387_REG_R_TEMP0_MSB      0x14    /* 1 degree */
> +#define F75387_REG_R_TEMP0_LSB      0x1A    /* 1/256 degree */
> +
> +#define F75387_REG_R_TEMP1_MSB      0x15    /* 1 degree */
> +#define F75387_REG_R_TEMP1_LSB      0x1B    /* 1/256 degree */
> +
> +/* LOCAL Temperature */
> +#define F75387_REG_R_TEMP2_MSB      0x1C    /* local temp., 1 degree */
> +#define F75387_REG_R_TEMP2_LSB      0x1D    /*              1/256 degree */
> +
> +/* Voltage */
> +#define F75387_REG_R_V1             0x11    /* 8mV */
> +#define F75387_REG_R_V2             0x12    /* 8mV */
> +#define F75387_REG_R_V3             0x13    /* 8mV */
> +
> +/* HWMON registers */
> +#define INA266_REG_VOLTAGE          0x02    /* 1.25mV */
> +#define INA266_REG_POWER            0x03    /* 25mW */
> +#define INA266_REG_CURRENT          0x04    /* 1mA */
> +
> +struct HW_PIN_TBL {
> +	uchar vbat[2];
> +	uchar v5[2];
> +	uchar v12[2];
> +	uchar vcore[2];
> +	uchar vdc[2];
> +	uchar ec_current[2];
> +	uchar power[2];
> +};
> +
> +struct Dynamic_Tab {
> +	uchar DeviceID;
> +	uchar HWPinNumber;
> +};
> +
> +struct EC_SMBOEM0 {
> +	uchar HWPinNumber;
> +};
> +
> +struct EC_READ_HW_RAM {
> +	unsigned int addr;
> +	unsigned int data;
> +};
> +
> +struct EC_WRITE_HW_RAM {
> +	unsigned int addr;
> +	unsigned int data;
> +};
> +
> +struct EC_SMBUS_WORD_DATA {
> +	unsigned char   Channel;
> +	unsigned char   Address;
> +	unsigned char   Register;
> +	unsigned short  Value;
> +};
> +
> +struct EC_SMBUS_READ_BYTE {
> +	unsigned char Channel;
> +	unsigned char Address;
> +	unsigned char Register;
> +	unsigned char Data;
> +};
> +
> +struct EC_SMBUS_WRITE_BYTE {
> +	unsigned char Channel;
> +	unsigned char Address;
> +	unsigned char Register;
> +	unsigned char Data;
> +};
> +
> +struct pled_hw_pin_tbl {
> +	uchar pled[6];
> +};
> +
> +struct adv_ec_platform_data {
> +	char *bios_product_name;
> +	int sub_dev_nb;
> +	u32 sub_dev_mask;
> +
> +	struct device *dev;
> +	struct class *adv_ec_class;
> +
> +	struct Dynamic_Tab *dym_tbl;
> +};

[...]

> +int read_ad_value(uchar hwpin, uchar multi);
> +int read_acpi_value(uchar addr, uchar *pvalue);
> +int write_hw_ram(uchar addr, uchar data);
> +int write_hwram_command(uchar data);
> +int smbus_read_word(struct EC_SMBUS_WORD_DATA *ptr_ec_smbus_word_data);
> +int smbus_read_byte(struct EC_SMBUS_READ_BYTE *ptr_ec_smbus_read_byte);
> +int write_acpi_value(uchar addr, uchar value);
> +int read_gpio_status(uchar PinNumber, uchar *pvalue);
> +int write_gpio_status(uchar PinNumber, uchar value);
> +int read_gpio_dir(uchar PinNumber, uchar *pvalue);
> +int write_gpio_dir(uchar PinNumber, uchar value);
> +int write_hw_extend_ram(uchar addr, uchar data);
> +int smbus_write_byte(struct EC_SMBUS_WRITE_BYTE *ptr_ec_smbus_write_byte);
> +int read_onekey_status(uchar addr, uchar *pdata);
> +int write_onekey_status(uchar addr);
> +int ec_oem_get_status(uchar addr, uchar *pdata);
> +int ec_oem_set_status(uchar addr, uchar pdata);

This lot shouldn't be in this driver.

I don't know what it is, but it has nothing to do with MFD.

I would consider something like drivers/platform for this.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
