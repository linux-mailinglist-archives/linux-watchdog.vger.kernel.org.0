Return-Path: <linux-watchdog+bounces-3888-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044AB0C59B
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jul 2025 15:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8AE81AA20D5
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jul 2025 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430802D9EC7;
	Mon, 21 Jul 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jId8xbM1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B185C5E;
	Mon, 21 Jul 2025 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753106190; cv=none; b=YcuFkshYtqBNl5IsO7vAlyKHA10ZEGHSdAO+a0pvS90f3CQ8h0bt4nEL2qfbRXnEJ3gtwufTVCHa0yONvHQKGnQhCq8CHJ/mXULIYCdoZINRy1wBFv9cmL8DqESmlPvdbPrJZ5SYPuf6o0HN66vpvTD0AaXJqrjjExn8ZyAONRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753106190; c=relaxed/simple;
	bh=Tg6yEZ174xmr7bLLFzRolZ7GOCNMUsamwdIO6Ei6PRI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sgmLNSIzfYKtBuEorlnjCEOMnwoQikzOsMSzG19aOnJd4e3OYsvDVCP4yX7c/rO6w7wp2iWshRsNAt5pNViCkkc1y/O4/hCcyWNwhAVo/tAQjoZH95sWFubABP2SAcWwkBFMr4iVgIF3Xj/hb9NeHpdsr3BQh8M2gfoySK4Y8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jId8xbM1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753106188; x=1784642188;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Tg6yEZ174xmr7bLLFzRolZ7GOCNMUsamwdIO6Ei6PRI=;
  b=jId8xbM1kW/+JT10+6sC+++nj9XyHL8gbpl+g2FE866TttyRdCTgTLpF
   kdDd73NbwvWKEgmuCQZe25TSLi0n3uTh5oG7vgH7aRlYX/HiL8PxLlQQ/
   E7bBr8QkFkqrfJWBFKSf3dHUxiVqVOo8AZJLX6j3/31bg0qeXZUC4zHre
   Qj48BePPQwnX2b2O4mpludMkmkEejzlY+hHeS2ZcCkX1Eil/xJ4lV8ob1
   WnBeqWvSuF9JOsw26+7g7f/yDdNrB7GphtW8JcQvbBY3YXkT5LoVsfUVx
   E6bXsHr7OHbBXoUsfVXuO8tYjW6vsiqYCM/IQQdfaPUOJk8dYvqR9fMgs
   A==;
X-CSE-ConnectionGUID: RE1+bzK/ToK2Hnl/YklFWQ==
X-CSE-MsgGUID: y8ZM6hnGSiabmqlVBvq1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72888943"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="72888943"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 06:56:26 -0700
X-CSE-ConnectionGUID: qL3X642FTd6YJAR/9f3PpA==
X-CSE-MsgGUID: B2svoTiXTwa3jxnoakFRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159570099"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 06:56:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Jul 2025 16:56:19 +0300 (EEST)
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
cc: Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com, linux@roeck-us.net, 
    wim@linux-watchdog.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    linux-watchdog@vger.kernel.org, jay.chen@canonical.com
Subject: Re: [PATCH v2 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
In-Reply-To: <a961ba6f-4c4b-4f60-9804-2736a3d239d8@portwell.com.tw>
Message-ID: <41ed7342-a465-16ff-8283-29f0faa64d02@linux.intel.com>
References: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw> <a961ba6f-4c4b-4f60-9804-2736a3d239d8@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Jul 2025, Yen-Chi Huang wrote:

> Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
> monitoring into the driver via the hwmon subsystem, enabling
> standardized reporting via tools like lm-sensors.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
> 
> [Re-sending to fix message threading, no content changes since v2.]
> ---
>  drivers/platform/x86/portwell-ec.c | 178 ++++++++++++++++++++++++++++-
>  1 file changed, 176 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> index a68522aaa3fa..ac113aaf8bb0 100644
> --- a/drivers/platform/x86/portwell-ec.c
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -25,6 +25,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/dmi.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/hwmon.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> @@ -52,16 +53,64 @@
>  #define PORTWELL_EC_FW_VENDOR_LENGTH     3
>  #define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
>  
> +#define PORTWELL_EC_ADC_MAX              1023
> +
>  static bool force;
>  module_param(force, bool, 0444);
>  MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
>  
> +struct pwec_hwmon_data {
> +	const char *label;
> +	u8 lsb_reg;
> +	u32 scale;
> +};
> +
> +struct pwec_data {
> +	const struct pwec_hwmon_data *hwmon_in_data;
> +	int hwmon_in_num;
> +	const struct pwec_hwmon_data *hwmon_temp_data;
> +	int hwmon_temp_num;
> +	const struct hwmon_channel_info * const *hwmon_info;
> +};
> +
> +static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
> +	{ "Vcore", 0x20, 3000 },
> +	{ "VDIMM", 0x32, 3000 },
> +	{ "3.3V",  0x22, 6000 },
> +	{ "5V",    0x24, 9600 },
> +	{ "12V",   0x30, 19800 },
> +};
> +
> +static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
> +	{ "System Temperature", 0x02, 0 },
> +};
> +
> +static const struct hwmon_channel_info *pwec_nano_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	NULL
> +};
> +
> +static const struct pwec_data pwec_board_data_nano = {
> +	.hwmon_in_data = pwec_nano_hwmon_in,
> +	.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
> +	.hwmon_temp_data = pwec_nano_hwmon_temp,
> +	.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
> +	.hwmon_info = pwec_nano_hwmon_info

Please add comma to any that is not a real terminator so that a future 
changes won't need to add the comma if more fields get added.

> +};
> +
>  static const struct dmi_system_id pwec_dmi_table[] = {
>  	{
>  		.ident = "NANO-6064 series",
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
>  		},
> +		.driver_data = (void *)&pwec_board_data_nano,

Casting a pointer to void * is not required.

>  	},
>  	{ }
>  };
> @@ -79,6 +128,19 @@ static u8 pwec_read(u8 address)
>  	return inb(PORTWELL_EC_IOSPACE + address);
>  }
>  
> +static u16 pwec_read16_stable(u8 lsb_reg)
> +{
> +	u8 lsb, msb, old_msb;
> +
> +	do {
> +		old_msb = pwec_read(lsb_reg+1);

Please add spaces around + as per the coding style guidance.

> +		lsb = pwec_read(lsb_reg);
> +		msb = pwec_read(lsb_reg+1);

Ditto.

> +	} while (msb != old_msb);
> +
> +	return (msb << 8) | lsb;
> +}
> +
>  /* GPIO functions */
>  
>  static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -204,6 +266,110 @@ static struct watchdog_device ec_wdt_dev = {
>  	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
>  };
>  
> +/* HWMON functions */
> +
> +static umode_t pwec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> +		u32 attr, int channel)
> +{
> +	const struct pwec_data *d = data;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < d->hwmon_temp_num)
> +			return 0444;
> +		break;

I'd suggest you change these to:

		return channel < d->hwmon_temp_num ? 0444 : 0;

> +	case hwmon_in:
> +		if (channel < d->hwmon_in_num)
> +			return 0444;
> +		break;
> +	default:
> +		break;

...and this to direct return 0; to simplify the code flow.

> +	}
> +
> +	return 0;
> +}
> +
> +static int pwec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct pwec_data *data = dev_get_drvdata(dev);
> +	u16 tmp;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < data->hwmon_temp_num) {
> +			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;

There might have been some problem in preparing this series as literal 
1000 is still there despite your cover letter suggesting it was changed?

Please check the other expected changes as well, on a glance they seemed 
to be in place but it has been a while since I've looked on this patch.

> +			return 0;
> +		}
> +		break;
> +	case hwmon_in:
> +		if (channel < data->hwmon_in_num) {
> +			tmp = pwec_read16_stable(data->hwmon_in_data[channel].lsb_reg);
> +			*val = (data->hwmon_in_data[channel].scale * tmp) / PORTWELL_EC_ADC_MAX;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int pwec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> +				  u32 attr, int channel, const char **str)
> +{
> +	struct pwec_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < data->hwmon_temp_num) {
> +			*str = data->hwmon_temp_data[channel].label;
> +			return 0;
> +		}
> +		break;
> +	case hwmon_in:
> +		if (channel < data->hwmon_in_num) {
> +			*str = data->hwmon_in_data[channel].label;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_ops pwec_hwmon_ops = {
> +	.is_visible = pwec_hwmon_is_visible,
> +	.read = pwec_hwmon_read,
> +	.read_string = pwec_hwmon_read_string,
> +};
> +
> +static struct hwmon_chip_info pwec_chip_info = {
> +	.ops = &pwec_hwmon_ops,
> +};
> +
> +static int pwec_hwmon_init(struct device *dev)
> +{
> +	struct pwec_data *data = dev_get_platdata(dev);
> +	void *hwmon;
> +	int ret;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return 0;
> +
> +	pwec_chip_info.info = data->hwmon_info;
> +	hwmon = devm_hwmon_device_register_with_info(dev, "portwell_ec", data, &pwec_chip_info,
> +						     NULL);
> +	ret = PTR_ERR_OR_ZERO(hwmon);
> +	if (ret)
> +		dev_err(dev, "Failed to register hwmon_dev: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  static int pwec_firmware_vendor_check(void)
>  {
>  	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
> @@ -242,6 +408,10 @@ static int pwec_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = pwec_hwmon_init(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	return 0;
>  }
>  
> @@ -274,11 +444,14 @@ static struct platform_device *pwec_dev;
>  
>  static int __init pwec_init(void)
>  {
> +	const struct dmi_system_id *match;
>  	int ret;
>  
> -	if (!dmi_check_system(pwec_dmi_table)) {
> +	match = dmi_first_match(pwec_dmi_table);
> +	if (!match) {
>  		if (!force)
>  			return -ENODEV;
> +		match = &pwec_dmi_table[0];
>  		pr_warn("force load portwell-ec without DMI check\n");
>  	}
>  
> @@ -286,7 +459,8 @@ static int __init pwec_init(void)
>  	if (ret)
>  		return ret;
>  
> -	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
> +	pwec_dev = platform_device_register_data(NULL, "portwell-ec", -1, match->driver_data,
> +						 sizeof(struct pwec_data));
>  	if (IS_ERR(pwec_dev)) {
>  		platform_driver_unregister(&pwec_driver);
>  		return PTR_ERR(pwec_dev);
> 

-- 
 i.


