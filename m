Return-Path: <linux-watchdog+bounces-975-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8558A9B3A
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Apr 2024 15:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEFA41F2373A
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Apr 2024 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6FE15CD50;
	Thu, 18 Apr 2024 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8PBPNGW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE415D5AE
	for <linux-watchdog@vger.kernel.org>; Thu, 18 Apr 2024 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713446770; cv=none; b=DlY1ro++8i2iCI4QgJKxi2E5mzS27j8F8j2CjppnsLdWMWGyZ8M7v+qUe27Rg/RiNI06fDi3wEN7UkKnjNqya6mBaKbrdsxILNaNDcTLryX87/YaqAshn7TIpovKvAfMyKxftTymiMfScL1lxk6V/z9zNp52elSLRY66Op6JE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713446770; c=relaxed/simple;
	bh=+61WZYEfDa9gikDJP6AlUQRXSdhe1kMs+XbDPq5CfE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oe/AJ5axs/AHfUUec4YuxjfgqDQI5YRlLNucnKIfdP4n1RS7whXlkg6S/UH7uXiFDalp7hJ1GEHm2C8FeAf9nNg3/MmwFHVihcRGxCB2GMbOmhTHIizj8pUTY+2u4KFzyQ5zIz1fPoCcoxaOyHLnOPzLiVGNTN4Cj5Ucd9KqKHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8PBPNGW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e3f17c64daso6901035ad.3
        for <linux-watchdog@vger.kernel.org>; Thu, 18 Apr 2024 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713446768; x=1714051568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbfcJLPs1tIjhQYiHifp1/k0EY4Xy8z7a0Z2Q4KMkPg=;
        b=L8PBPNGW1ZUad+t0CYEiN0ZGnV+SUZAXHYOEwYISpeZlCle0nFHxEnK8CnxNJ8OpcY
         L7KLnkpwSzw8aQJQl7XWMSH7zDLHNh0EU/wG/GFuDfKEyu920+Ttoey1oec9Xdz2iAPM
         mH/RFOK817iSP+9seUSq2NluGLbnxaHyRE8hnIPCD5iDCfg85OI0dElthVtwqfXRaLjY
         3k1PAdDwY+i8CWZXYsay7U5l/qcoGI8jpVRcur6WCXzsHdeJvULCMPLGUPQSCwW4s4ID
         P778Y4nswNS/tIWf5LbyaJ20rtKkFyituWkR6X5KZQx5tkBljcvOu+DFpX+PpNNQpPtY
         OgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446768; x=1714051568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbfcJLPs1tIjhQYiHifp1/k0EY4Xy8z7a0Z2Q4KMkPg=;
        b=HpUkcCOvOnaWsTTuk5RPRDMiRVRCZUXgcGYO7f92lvPb8+ihS+NYZoVEEfYItM4+qo
         ptZml0dH5dQdHtAt2f8wo3/Zy9w/3ykJethCVwD4lDxtl3HfsbDOFycH6WUQIjs9rswp
         /31kELYtweHY8KLEQXp6n2PfdXmAV3S5hpXGj/yiP+tngjdd3TkDL7YL0Yb5l58famVB
         qK/ZYu+fWs/oYHqS/l/gaicGInDNNjaBw6CfPopVTjsMLBsgIrEyA/xuyHjltqlQiZmK
         zaV4TzTkmumS62HhqVFbm9hqOt8+4oI1P3vrHZxboIGjDZIvcCYiV08IVe4danqVcPux
         I+lw==
X-Forwarded-Encrypted: i=1; AJvYcCUOXxJouzHqQLSP+86dui+daCSQ1gK5FOVZmZQREWEv76l8puQP1jqZRBt9BsNia52Q/ISoAdzwPQtlqtvusbI/w+Z9j6dOZJ2tFTR1lDE=
X-Gm-Message-State: AOJu0Yw3P69UkCD/geagW9TM5ltANNlOP3FVzpJKnjJriw2pb1osb14M
	AAWAJ8gksoe9aYLRFV8zlwN+ozvpfBDIvvqpC3ugtT3V935S9PRXVS5qQg==
X-Google-Smtp-Source: AGHT+IE0fCGdZTuomvXxsmv5ROR/h9KBJhJblUQlqeCHqyBuX4JiLH8shCRyDj6vwFIZAZZafzedIQ==
X-Received: by 2002:a17:902:a5cc:b0:1e0:b76b:cfb8 with SMTP id t12-20020a170902a5cc00b001e0b76bcfb8mr2726525plq.19.1713446767567;
        Thu, 18 Apr 2024 06:26:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f55200b001e268c9e38asm1487316plf.43.2024.04.18.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 06:26:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Apr 2024 06:26:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>, arm@kernel.org
Subject: Re: [PATCH v6 05/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <b0cce881-f42b-469f-a4db-dcfcf89738f5@roeck-us.net>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-6-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418121116.22184-6-kabel@kernel.org>

On Thu, Apr 18, 2024 at 02:11:10PM +0200, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

This driver should reside in driver/watchdog and use a generic API
such as regmap to access chip registers.

Guenter

> ---
>  drivers/platform/cznic/Kconfig                |   2 +
>  drivers/platform/cznic/Makefile               |   1 +
>  .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
>  .../cznic/turris-omnia-mcu-watchdog.c         | 123 ++++++++++++++++++
>  drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
>  5 files changed, 154 insertions(+)
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> 
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index 0a752aa654fa..e2649cdecc38 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -20,6 +20,7 @@ config TURRIS_OMNIA_MCU
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select RTC_CLASS
> +	select WATCHDOG_CORE
>  	help
>  	  Say Y here to add support for the features implemented by the
>  	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> @@ -27,6 +28,7 @@ config TURRIS_OMNIA_MCU
>  	  - board poweroff into true low power mode (with voltage regulators
>  	    disabled) and the ability to configure wake up from this mode (via
>  	    rtcwake)
> +	  - MCU watchdog
>  	  - GPIO pins
>  	    - to get front button press events (the front button can be
>  	      configured either to generate press events to the CPU or to change
> diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
> index a185ef882e44..687f7718c0a1 100644
> --- a/drivers/platform/cznic/Makefile
> +++ b/drivers/platform/cznic/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
>  turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
>  turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
>  turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
> +turris-omnia-mcu-y		+= turris-omnia-mcu-watchdog.o
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
> index 697ace090bda..5f88119d825c 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -365,6 +365,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
>  	if (err)
>  		return err;
>  
> +	err = omnia_mcu_register_watchdog(mcu);
> +	if (err)
> +		return err;
> +
>  	return omnia_mcu_register_gpiochip(mcu);
>  }
>  
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> new file mode 100644
> index 000000000000..b0de9585da84
> --- /dev/null
> +++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia MCU watchdog driver
> + *
> + * 2024 by Marek Behún <kabel@kernel.org>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/moduleparam.h>
> +#include <linux/turris-omnia-mcu-interface.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +
> +#include "turris-omnia-mcu.h"
> +
> +#define WATCHDOG_TIMEOUT		120
> +
> +static unsigned int timeout;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static int omnia_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
> +}
> +
> +static int omnia_wdt_stop(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 0);
> +}
> +
> +static int omnia_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
> +}
> +
> +static int omnia_wdt_set_timeout(struct watchdog_device *wdt,
> +				 unsigned int timeout)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u16(mcu->client, CMD_SET_WDT_TIMEOUT,
> +				   timeout * 10);
> +}
> +
> +static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +	int ret;
> +
> +	ret = omnia_cmd_read_u16(mcu->client, CMD_GET_WDT_TIMELEFT);
> +	if (ret < 0) {
> +		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
> +			ret);
> +		return 0;
> +	}
> +
> +	return ret / 10;
> +}
> +
> +static const struct watchdog_info omnia_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.identity = "Turris Omnia MCU Watchdog",
> +};
> +
> +static const struct watchdog_ops omnia_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= omnia_wdt_start,
> +	.stop		= omnia_wdt_stop,
> +	.ping		= omnia_wdt_ping,
> +	.set_timeout	= omnia_wdt_set_timeout,
> +	.get_timeleft	= omnia_wdt_get_timeleft,
> +};
> +
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu)
> +{
> +	struct device *dev = &mcu->client->dev;
> +	int ret;
> +
> +	if (!(mcu->features & FEAT_WDT_PING))
> +		return 0;
> +
> +	mcu->wdt.info = &omnia_wdt_info;
> +	mcu->wdt.ops = &omnia_wdt_ops;
> +	mcu->wdt.parent = dev;
> +	mcu->wdt.min_timeout = 1;
> +	mcu->wdt.max_timeout = 6553; /* 65535 deciseconds */
> +
> +	mcu->wdt.timeout = WATCHDOG_TIMEOUT;
> +	watchdog_init_timeout(&mcu->wdt, timeout, dev);
> +
> +	watchdog_set_drvdata(&mcu->wdt, mcu);
> +
> +	omnia_wdt_set_timeout(&mcu->wdt, mcu->wdt.timeout);
> +
> +	ret = omnia_cmd_read_u8(mcu->client, CMD_GET_WATCHDOG_STATE);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot get MCU watchdog state\n");
> +
> +	if (ret)
> +		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
> +
> +	watchdog_set_nowayout(&mcu->wdt, nowayout);
> +	watchdog_stop_on_reboot(&mcu->wdt);
> +	ret = devm_watchdog_register_device(dev, &mcu->wdt);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot register MCU watchdog\n");
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
> index 6179a4f2069e..1838cb3d636e 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu.h
> +++ b/drivers/platform/cznic/turris-omnia-mcu.h
> @@ -14,6 +14,7 @@
>  #include <linux/mutex.h>
>  #include <linux/rtc.h>
>  #include <linux/types.h>
> +#include <linux/watchdog.h>
>  #include <linux/workqueue.h>
>  #include <asm/byteorder.h>
>  #include <asm/unaligned.h>
> @@ -41,6 +42,9 @@ struct omnia_mcu {
>  	struct rtc_device *rtcdev;
>  	u32 rtc_alarm;
>  	bool front_button_poweron;
> +
> +	/* MCU watchdog */
> +	struct watchdog_device wdt;
>  };
>  
>  int omnia_cmd_write_read(const struct i2c_client *client,
> @@ -53,6 +57,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
>  	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
>  }
>  
> +static inline int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd,
> +				     u8 val)
> +{
> +	u8 buf[2] = { cmd, val };
> +
> +	return omnia_cmd_write(client, buf, sizeof(buf));
> +}
> +
> +static inline int omnia_cmd_write_u16(const struct i2c_client *client, u8 cmd,
> +				      u16 val)
> +{
> +	u8 buf[3];
> +
> +	buf[0] = cmd;
> +	put_unaligned_le16(val, &buf[1]);
> +
> +	return omnia_cmd_write(client, buf, sizeof(buf));
> +}
> +
>  static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
>  				      u32 val)
>  {
> @@ -129,5 +152,6 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
>  
>  int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
>  int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
>  
>  #endif /* __TURRIS_OMNIA_MCU_H */
> -- 
> 2.43.2
> 
> 

