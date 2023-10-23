Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1AF7D3A0A
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Oct 2023 16:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbjJWOru (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 Oct 2023 10:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbjJWOrt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 Oct 2023 10:47:49 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736481A4
        for <linux-watchdog@vger.kernel.org>; Mon, 23 Oct 2023 07:47:47 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7db1f864bso32729937b3.3
        for <linux-watchdog@vger.kernel.org>; Mon, 23 Oct 2023 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698072466; x=1698677266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jXJ1ULNbIGVV+F1+67fTS4XoQlDTfiNaK29VOWP52tE=;
        b=Cj8hUcKjDcNpbXc3w4qTr/jtPy7fUyKWEX5lrs3GpzYIvE0I7JFFLlhs6v7wTc5ol+
         nrsSKzL4MzEfnWIGzLqTMfPvtMsDV28BhJ6oVkJU/lDlmhkWJ3xYpDca8I2AJ9Coah4h
         3Y1SeZFUfLUz3uytCvJ/Ru7vjeUtVIDPmxmrCjMxD2R9lnvxTVjpUp5CcoFc3rt53iKI
         JHd/DN+MiEw06jGs/RsUEzV6m83aTaQHc2Q3yK0asktL7cfoj4GF2sQGDzd4d2Bhhlby
         0062vMA3Ldtu0h2bDJpEZ44Yuird38xN2qpAA/FwPL+M9jDK9rR0q/sOnnql5Nfu5H79
         vghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072466; x=1698677266;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXJ1ULNbIGVV+F1+67fTS4XoQlDTfiNaK29VOWP52tE=;
        b=mm3nKgDt3hj2fssUKLQadYXkjA7QwGo6Xzo2/C0DD9pCYfmQCOmMBY2EhB4mU5kEWR
         Lr8z9eJKiin4Vn+tK+OwvM0n9w9zmFdVLSwPdWqSt65agPHaTm1kVU/CAZqE34r0eefc
         zsCCYhYRc7VsipCXeva4OwNqTcnSNntZiFxlv4V11nQUhPMtpiOkrnQy8hGUQ8qP6J/D
         FtUKW10SJ2N+MtrExonbZn6nHgct9s3+XK1EpY8HNiq6vRfVAYv9mgmVYTsLoEwP9Y/a
         ZFfo31/nWMQiJF3R5gvpMg/LskFzbYt2epoUutf3gaYJYAXjNZN30VzJAkNKFKmuUZ/O
         3NbQ==
X-Gm-Message-State: AOJu0YzJW488vrmLHir8GkDjwfgooAfiuGi7imv0hIF2BCjHXA+9RRpq
        ONxgTMMtYZJDB84B4l39krw=
X-Google-Smtp-Source: AGHT+IGUj8ucGKWV4R3FNC1PuPCsaIn9gjikqnP/5+9z1imN1biL97lTl9NOTfuQZQJlVybszAxNJg==
X-Received: by 2002:a0d:dfca:0:b0:5a8:2078:48e5 with SMTP id i193-20020a0ddfca000000b005a8207848e5mr8961103ywe.31.1698072466264;
        Mon, 23 Oct 2023 07:47:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y10-20020a81a10a000000b005a7cc149e3asm3195476ywg.2.2023.10.23.07.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 07:47:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2439af40-0c78-6b41-1746-c71b67af217a@roeck-us.net>
Date:   Mon, 23 Oct 2023 07:47:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/7] platform: cznic: turris-omnia-mcu: Add support for
 MCU watchdog
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20231023143130.11602-1-kabel@kernel.org>
 <20231023143130.11602-6-kabel@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20231023143130.11602-6-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/23/23 07:31, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

Any reason for keeping this out of drivers/watchdog ?

> ---
>   drivers/platform/cznic/Kconfig                |   2 +
>   drivers/platform/cznic/Makefile               |   1 +
>   .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
>   .../cznic/turris-omnia-mcu-watchdog.c         | 122 ++++++++++++++++++
>   drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
>   5 files changed, 153 insertions(+)
>   create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> 
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index 0a752aa654fa..e2649cdecc38 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -20,6 +20,7 @@ config TURRIS_OMNIA_MCU
>   	select GPIOLIB
>   	select GPIOLIB_IRQCHIP
>   	select RTC_CLASS
> +	select WATCHDOG_CORE
>   	help
>   	  Say Y here to add support for the features implemented by the
>   	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> @@ -27,6 +28,7 @@ config TURRIS_OMNIA_MCU
>   	  - board poweroff into true low power mode (with voltage regulators
>   	    disabled) and the ability to configure wake up from this mode (via
>   	    rtcwake)
> +	  - MCU watchdog
>   	  - GPIO pins
>   	    - to get front button press events (the front button can be
>   	      configured either to generate press events to the CPU or to change
> diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
> index 6f1470d1f673..a43997a12d74 100644
> --- a/drivers/platform/cznic/Makefile
> +++ b/drivers/platform/cznic/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
>   turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
>   turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
>   turris-omnia-mcu-objs		+= turris-omnia-mcu-sys-off-wakeup.o
> +turris-omnia-mcu-objs		+= turris-omnia-mcu-watchdog.o
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
> index 942061a0ee66..521397bfc022 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -243,6 +243,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> +	err = omnia_mcu_register_watchdog(mcu);
> +	if (err)
> +		return err;
> +
>   	return omnia_mcu_register_gpiochip(mcu);
>   }
>   
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> new file mode 100644
> index 000000000000..6685166bc4c7
> --- /dev/null
> +++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia MCU watchdog driver
> + *
> + * 2023 by Marek Behún <kabel@kernel.org>
> + */
> +
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

Why check this here and not in the calling code ?

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
> index c6a8036e0534..db2d18d6eea8 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu.h
> +++ b/drivers/platform/cznic/turris-omnia-mcu.h
> @@ -14,6 +14,7 @@
>   #include <linux/mutex.h>
>   #include <linux/rtc.h>
>   #include <linux/types.h>
> +#include <linux/watchdog.h>
>   #include <linux/workqueue.h>
>   #include <asm/byteorder.h>
>   #include <asm/unaligned.h>
> @@ -36,6 +37,9 @@ struct omnia_mcu {
>   	struct rtc_device *rtcdev;
>   	u32 rtc_alarm;
>   	bool front_button_poweron;
> +
> +	/* MCU watchdog */
> +	struct watchdog_device wdt;

This should be internal to the watchdog driver.

>   };
>   
>   static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
> @@ -48,6 +52,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
>   	return ret < 0 ? ret : 0;
>   }
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
>   static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
>   				      u32 val)
>   {
> @@ -140,5 +163,6 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
>   
>   int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
>   int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
>   
>   #endif /* __TURRIS_OMNIA_MCU_H */

