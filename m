Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EB2341F28
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Mar 2021 15:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCSOPH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Mar 2021 10:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhCSOOr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Mar 2021 10:14:47 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15546C06174A
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Mar 2021 07:14:47 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id w3so9958714ejc.4
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Mar 2021 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SbMKz/3RhCWrpSYDoZPsqOEniItXF6fKoMAg9IIFEmg=;
        b=yfwtbNFMg36yYpybAtmB6MT2i2U3sa9OmuoZDdLYao3JoARYokN6E3bgJFoKmtCBS1
         YRqzHwtkt75FfrEqJIZxqc0Sy4ZP511A7IOabJhtfrQJsU5x5nUf7QDv+UOWPVJvHKFX
         wtFMWIIizZPs3RZQhWxOuquhdQsL/dOXRoV8ehEdmMtZtrBuYNu9KJHQWqFeo4UFnUN5
         SNrdqVjxrDsO0yaqBtrb6pDT1CWLAr7kIJashpXP9LZtcAo30NNHOFTBK4fK0R1ZDK8V
         wjie2Pi+ysy/A7N6KrqHRQ7N1/fPaGDOwSL4pV5QV/XzjVSfi8jne3hCQQAS+NR7sRhd
         /LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SbMKz/3RhCWrpSYDoZPsqOEniItXF6fKoMAg9IIFEmg=;
        b=S7OYZP/ou4rbf3ja67KG7rNCygpp+b3yu++KSVJ+/PBi+JUcHj+jyg6+3Fug26R3JR
         V7r2scfGOKUYbcs4iJLhgO0XITMBWZ1Kw+77IWB6ftHKMyVHxpyGt5PyYoCHzVlNbsrC
         ffZbJCVYZGx60wosGEz5qKOnVWHkudcuNS+FXc9nxCZZ3GyIRXQN/pj+vO0wN6lw2ATo
         Q09oZHosplEVIFsdAnul/WqadjVyLjj7K9/BWSMSTHJNcsPjUnI5CgpYi78Q5xIykjzb
         CM/Wr4Tn6DJeHMv5asYedJb0bvqakV4gENW2/fx7vs86eD8kla2/y5qZE6HBHIw6nahH
         mi8Q==
X-Gm-Message-State: AOAM532oJ6Gv9/Bt7OfbR8o7p6iggMPjedp8Po6ul6n9cGbS8KjIYASa
        x99IzuNAaDdHACByL3BAi4Z9Kg==
X-Google-Smtp-Source: ABdhPJxn2LDJsBInTIQUjEDXHE7MkT+hru/lyirfodBGK6L8iPYN6WGP+xDa1hCxq9shH+MJCPyezw==
X-Received: by 2002:a17:906:cc89:: with SMTP id oq9mr4537205ejb.258.1616163285720;
        Fri, 19 Mar 2021 07:14:45 -0700 (PDT)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id v15sm4100578edw.28.2021.03.19.07.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 07:14:45 -0700 (PDT)
Date:   Fri, 19 Mar 2021 14:14:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     chia-lin.kao@canonical.com, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org,
        Campion.Kang@gmail.com
Subject: Re: [PATCH v6 4/6] mfd: ahc1ec0: Add support for Advantech embedded
 controller
Message-ID: <20210319141443.GI2916463@dell>
References: <20210309160755.GR4931@dell>
 <20210319100105.18278-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210319100105.18278-1-campion.kang@advantech.com.tw>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 19 Mar 2021, Campion Kang wrote:

> 
> Please check [Campion] text in below as my reply.

This is a mess.  Please setup your mailer to quote correctly.

> Sorry, due to the mail was rejected by vger.kernel.org as SPAM before 
> so I reply the mail late and had some test email before.
> 
> -----------------------------------------------------------------------------------------
> Date:   Tue, 9 Mar 2021 16:07:55 +0000
> From:   Lee Jones <lee.jones@linaro.org>

[...]

> > +enum {
> > +	ADVEC_SUBDEV_BRIGHTNESS = 0,
> > +	ADVEC_SUBDEV_EEPROM,
> > +	ADVEC_SUBDEV_GPIO,
> > +	ADVEC_SUBDEV_HWMON,
> > +	ADVEC_SUBDEV_LED,
> > +	ADVEC_SUBDEV_WDT,
> > +	ADVEC_SUBDEV_MAX,
> > +};
> 
> Are these arbitrary?
> [Campion] cannot arbitrary there, due to it is a index to identify its number of sub device. 

I'm asking what this is dictated by.

Are these ID/index values written into H/W?

[...]

> > +int write_acpi_value(struct adv_ec_platform_data *adv_ec_data, unsigned char addr,
> > +		unsigned char value)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&adv_ec_data->lock);
> > +
> > +	ret = ec_wait_write();
> > +	if (ret)
> > +		goto error;
> > +	outb(EC_ACPI_DATA_WRITE, EC_COMMAND_PORT);
> > +
> > +	ret = ec_wait_write();
> > +	if (ret)
> > +		goto error;
> > +	outb(addr, EC_STATUS_PORT);
> > +
> > +	ret = ec_wait_write();
> > +	if (ret)
> > +		goto error;
> > +	outb(value, EC_STATUS_PORT);
> > +
> > +	mutex_unlock(&adv_ec_data->lock);
> > +	return 0;
> > +
> > +error:
> > +	mutex_unlock(&adv_ec_data->lock);
> > +
> > +	dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> > +		__LINE__);
> > +
> > +	return ret;
> > +}
> 
> EXPORT?
> 
> I think this API (i.e. all of the functions above) should be moved
> into drivers/platform.  They really don't have a place in MFD.
> 
> [Campion] this is a common function for upper HWMON and brightness control used. 
>           So far this API only used by HWMON, but then it will be used by 
>           brightness in next stage. So i put this API here, OK?

I think it belongs in drivers/platform.  Take a look at some of the
other Embedded Controller code that lives there.

> > +int read_gpio_status(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> > +		unsigned char *pvalue)
> > +{
> > +}
> > +
> > +int write_gpio_status(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> > +		unsigned char value)
> > +{
> > +}
> > +
> > +int read_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> > +		unsigned char *pvalue)
> > +{
> > +}
> > +
> > +int write_gpio_dir(struct adv_ec_platform_data *adv_ec_data, unsigned char PinNumber,
> > +		unsigned char value)
> > +{
> > +}
> 
> All of the GPIO functions above should move into drivers/gpio.
> 
> [Campion] Due to it has a flow need to cowork with EC chip and firmware, it cannot be interrupt
>           by other functions. So it needs to keep in here. 

Please provide more details.

> > +int write_hwram_command(struct adv_ec_platform_data *adv_ec_data, unsigned char data)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&adv_ec_data->lock);
> > +
> > +	ret = ec_wait_write();
> > +	if (ret)
> > +		goto error;
> > +	outb(data, EC_COMMAND_PORT);
> > +
> > +	mutex_unlock(&adv_ec_data->lock);
> > +	return 0;
> > +
> > +error:
> > +	mutex_unlock(&adv_ec_data->lock);
> > +
> > +	dev_warn(adv_ec_data->dev, "%s: Wait for IBF or OBF too long. line: %d\n", __func__,
> > +			__LINE__);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(write_hwram_command);
> > +
> > +static int adv_ec_get_productname(struct adv_ec_platform_data *adv_ec_data, char *product)
> > +{
> > +	const char *vendor, *device;
> > +	int length = 0;
> > +
> > +	/* Check it is Advantech board */
> > +	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> > +	if (memcmp(vendor, "Advantech", sizeof("Advantech")) != 0)
> > +		return -ENODEV;
> > +
> > +	/* Get product model name */
> > +	device = dmi_get_system_info(DMI_PRODUCT_NAME);
> > +	if (device) {
> > +		while ((device[length] != ' ')
> > +			&& (length < AMI_ADVANTECH_BOARD_ID_LENGTH))
> > +			length++;
> > +		memset(product, 0, AMI_ADVANTECH_BOARD_ID_LENGTH);
> > +		memmove(product, device, length);
> > +
> > +		dev_info(adv_ec_data->dev, "BIOS Product Name = %s\n", product);
> > +
> > +		return 0;
> > +	}
> > +
> > +	dev_warn(adv_ec_data->dev, "This device is not Advantech Board (%s)!\n", product);
> > +
> > +	return -ENODEV;
> > +}
> 
> These should go into drivers/platform.
> 
> [Campion] This is a simple function to get module name from BIOS DMI table, it is not need to 
>           access EC chip. But it can get once and other drivers can get this information,
>           donot call DMI every time. Can it keep in here?

I thought this driver was for the EC chip.

> > +static const struct mfd_cell adv_ec_sub_cells[] = {
> > +	{ .name = "adv-ec-brightness", },
> > +	{ .name = "adv-ec-eeprom", },
> > +	{ .name = "adv-ec-gpio", },
> > +	{ .name = "ahc1ec0-hwmon", },
> > +	{ .name = "adv-ec-led", },
> > +	{ .name = "ahc1ec0-wdt", },
> > +};
> > +
> > +static int adv_ec_init_ec_data(struct adv_ec_platform_data *adv_ec_data)
> > +{
> > +	int ret;
> > +
> > +	adv_ec_data->sub_dev_mask = 0;
> > +	adv_ec_data->sub_dev_nb = 0;
> > +	adv_ec_data->dym_tbl = NULL;
> > +	adv_ec_data->bios_product_name = NULL;
> 
> Why are pre-initialising these?
> 
> [Campion] Just make sure they have empty pointer, but I will remove it. 

There's no need to do that if they are being allocated below.

> > +	mutex_init(&adv_ec_data->lock);
> > +
> > +	/* Get product name */
> > +	adv_ec_data->bios_product_name =
> > +		devm_kzalloc(adv_ec_data->dev, AMI_ADVANTECH_BOARD_ID_LENGTH, GFP_KERNEL);
> > +	if (!adv_ec_data->bios_product_name)
> > +		return -ENOMEM;
> > +
> > +	memset(adv_ec_data->bios_product_name, 0, AMI_ADVANTECH_BOARD_ID_LENGTH);
> 
> Why are you doing this?
> 
> [Campion] Just make sure the memory is null all

devm_kzalloc() does that for you - that's what the 'z' means.

> > +	ret = adv_ec_get_productname(adv_ec_data, adv_ec_data->bios_product_name);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Get pin table */
> > +	adv_ec_data->dym_tbl = devm_kzalloc(adv_ec_data->dev,
> > +					EC_MAX_TBL_NUM * sizeof(struct ec_dynamic_table),
> > +					GFP_KERNEL);
> > +	if (!adv_ec_data->dym_tbl)
> > +		return -ENOMEM;
> 
> What does a dynamic table do?
> 
> [Campion] The dynamic table is reterived from EC firmware according to different platform HW device.
>           it will based on dynamic table information to get HW pin definition based on its function.
>           The pin value will retrive to calcute the value, for example, voltage value, vcore value. 
>           
> 
> > +	ret = adv_get_dynamic_tab(adv_ec_data);
> 
> return adv_get_dynamic_tab();
> 
> [Campion] OK
> 
> > +	return ret;
> > +}
> > +
> > +static int adv_ec_parse_prop(struct adv_ec_platform_data *adv_ec_data)
> > +{
> > +	int i, ret;
> > +	u32 nb, sub_dev[ADVEC_SUBDEV_MAX];
> > +
> > +	ret = device_property_read_u32(adv_ec_data->dev, "advantech,sub-dev-nb", &nb);
> 
> Indexing devices is generally not a good strategy.
> 
> ---------------------------------------------------------------------------
> [Campion] Yes, I will remove it, just use the following that defined in ahc1ec0.yaml. 
>           I ever feedback related mail for "https://lore.kernel.org/linux-watchdog/20210118123749.4769-6-campion.kang@advantech.com.tw/t/#m5126adbc2453e3ab3e6bda717c257fab364b9f45". 
>           But vger.kernel.org returned the mail to mail as spam mail. 
>           I will modity it as the following, is it OK?
>           examples:
>             - |
>           #include <dt-bindings/mfd/ahc1ec0-dt.h>
>           ahc1ec0 {
>                   compatible = "advantech,ahc1ec0";
> 
>                   advantech,hwmon-profile = <AHC1EC0_HWMON_PRO_UNO2271G>;
>                   advantech,watchdog = true;

Shouldn't the watchdog be it's own sub-node?

Is that functionality not probably at all?

Surely it has it's own register set?

[...]

> > +	/* check whether this EC has the following subdevices. */
> > +	for (i = 0; i < ARRAY_SIZE(adv_ec_sub_cells); i++) {
> > +		if (adv_ec_data->sub_dev_mask & BIT(i)) {
> > +			ret = mfd_add_hotplug_devices(dev, &adv_ec_sub_cells[i], 1);
> 
> Why have you chosen to use hotplug here?
> 
> [Campion] There is a information in BIOS ACPI table according to different device to decide 
>           which function drivers need to be probe. May be a device has HWMON, it will dynamic 
>           to load HWMON driver, but other device may not.

The only thing hotplug does is hard-code the platform ID.

It's more of a win if you can omit the mfd_remove_devices() call.

> > +			dev_info(adv_ec_data->dev, "mfd_add_hotplug_devices[%d] %s\n", i,
> > +				adv_ec_sub_cells[i].name);
> > +			if (ret)
> > +				dev_err(dev, "failed to add %s subdevice: %d\n",
> > +					adv_ec_sub_cells[i].name, ret);
> > +		}
> > +	}
> 
> This is a mess!
> 
> Where are you pulling these devices from?  
> 
> [Campion] decide which drivers need to mount from BIOS ACPI table. This drive would built in Linux Kernel.
>           I am not sure what's your meaning, can you describe more? Thank you

I really don't like the sub_dev_mask idea.

Are the ACPI tables available?

[...]

> > +struct adv_ec_platform_data {
> > +	char *bios_product_name;
> 
> Where is this used?
> 
> [Campion] Get the module name once and upper application can get it by EC driver.

From DMI?  What do you use it for?  Debug prints or something else?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
