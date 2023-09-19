Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3580D7A65B4
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Sep 2023 15:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbjISNun (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Sep 2023 09:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbjISNun (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Sep 2023 09:50:43 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837CE83
        for <linux-watchdog@vger.kernel.org>; Tue, 19 Sep 2023 06:50:36 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-34fcd36c86eso11304705ab.0
        for <linux-watchdog@vger.kernel.org>; Tue, 19 Sep 2023 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695131436; x=1695736236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWrAdP1P9lnxNsL8ogUPqiMm7p8Gam7StrV+T1lY0oM=;
        b=SVwPiocWQh5UTUpfZhANxVP6MeO8akIqNamfkJegSMCGw6MQWhAHplW9/PO6GdHVtc
         MzAjoNJohHCtx3/lljwNikt0Dq4bTPi50NEWWjS4qDhye2QnsLCxO8731/5epXQmsPBf
         aQHyqLSsDgpZQOT1+3qeALJB7X8ltN9hPtz0rOZICXvBgGpFWrqz5/+6PciOXgsbGx33
         6IbR9z6B0ticb+tINy/ffZZzH2WT0U2Fg/sU4E9d7wTvJii9aLBU5czpqLemsGCCgOX2
         JAtWFE1L3V9GttgxdjsRFpVEzbJ7j9eiNrJQAaz0tR90jQxQzsDTDRPGaZmgH1Bjpb/x
         ojDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695131436; x=1695736236;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWrAdP1P9lnxNsL8ogUPqiMm7p8Gam7StrV+T1lY0oM=;
        b=f3pBKx/HJ6ue1reo0VUkzgbfRP+5s0s6yoyRBboHxXDYY22rIqB4tk9S5CV/WUd8Hl
         mrcJxoI3Dz+br6lPsOB00anRN0XpkBCd+6gKFY7ytZJJSO9Qj+3bMkEUuBUadS8C74bL
         bFiRg+OOjnvZRYDmtXtWGKziTBWKagK5OPF7C0JQXmb8Tvvu9UC332avS2OWb1ESguxN
         qUGuZjHMtaa1HybYTH6ZiUVqbG4Z2YKiA02Eouc1x9lAyleHt6GbBNTtLMGzAp7oE5I1
         5ZlphKBWcwB7dKwxO7pWPUBVAJt5csIT8ziYDicB9YS0IOQ8ErujsIiEBT12hkE5E3Ca
         0TCg==
X-Gm-Message-State: AOJu0YwI7m5Gh7V9hXNCtx9lbKzS2I6w6T9JvqpER7131TeauB28ykFm
        9lL9GRftzY6mzLFAF159cwA=
X-Google-Smtp-Source: AGHT+IEyIOdkPKpp9si4IvPWBiU4+VwEk+dfo+vFFCpLQDlPa9Iq2v7+NTx/N+LgrCsUQ1vxuu3/wg==
X-Received: by 2002:a05:6e02:ef0:b0:350:f0bb:6a3b with SMTP id j16-20020a056e020ef000b00350f0bb6a3bmr752664ilk.17.1695131435684;
        Tue, 19 Sep 2023 06:50:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6-20020a92ce46000000b003460b697bc0sm140982ilr.59.2023.09.19.06.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 06:50:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5940424f-ebaf-a73b-4157-fc3fb7fa7d3c@roeck-us.net>
Date:   Tue, 19 Sep 2023 06:50:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-6-kabel@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 5/7] platform: cznic: turris-omnia-mcu: Add support for
 MCU watchdog
In-Reply-To: <20230919103815.16818-6-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/19/23 03:38, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/platform/cznic/Kconfig                |   2 +
>   drivers/platform/cznic/Makefile               |   1 +
>   .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
>   .../cznic/turris-omnia-mcu-watchdog.c         | 126 ++++++++++++++++++
>   drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
>   5 files changed, 157 insertions(+)
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
> index b507f81ebe0a..708265203cc1 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -230,6 +230,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> +	ret = omnia_mcu_register_watchdog(mcu);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> new file mode 100644
> index 000000000000..2238b2167c45
> --- /dev/null
> +++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia MCU watchdog driver
> + *
> + * 2023 by Marek Behún <kabel@kernel.org>
> + */
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
> +	/*
> +	 * The MCU also implements LED controller, and the LED driver may in
> +	 * some cases require more I2C bandwidth. In order to prevent stealing
> +	 * that bandwidth from the LED driver, configure minimum time between
> +	 * pings to 10% of the configured timeout (for 120 second timeout we
> +	 * will be pinging at most every 12 seconds).
> +	 */
> +	mcu->wdt.min_hw_heartbeat_ms = 100 * mcu->wdt.timeout;

This is not what min_hw_heartbeat_ms is supposed to be used for, and it is
an abuse of the API which is not guaranteed to work. The value is exopected
to be set at registration time, and it is not supposed to change dynamically.
It is also competely unnecessary since no sane watchdog daemon will ping
at such a high rate. Please drop.

Guenter

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
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot get MCU watchdog state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ret)
> +		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
> +
> +	watchdog_set_nowayout(&mcu->wdt, nowayout);
> +	watchdog_stop_on_reboot(&mcu->wdt);
> +	ret = devm_watchdog_register_device(dev, &mcu->wdt);
> +	if (ret)
> +		dev_err(dev, "Cannot register MCU watchdog: %d\n", ret);
> +
> +	return ret;
> +}
> diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
> index c40ac07be5f5..89fe39f4255f 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu.h
> +++ b/drivers/platform/cznic/turris-omnia-mcu.h
> @@ -16,6 +16,7 @@
>   #include <linux/mutex.h>
>   #include <linux/rtc.h>
>   #include <linux/turris-omnia-mcu-interface.h>
> +#include <linux/watchdog.h>
>   #include <linux/workqueue.h>
>   
>   struct omnia_mcu {
> @@ -36,6 +37,9 @@ struct omnia_mcu {
>   	struct rtc_device *rtcdev;
>   	u32 rtc_alarm;
>   	bool front_button_poweron;
> +
> +	/* MCU watchdog */
> +	struct watchdog_device wdt;
>   };
>   
>   static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
> @@ -46,6 +50,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
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
> @@ -136,5 +159,6 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
>   int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
>   void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu);
>   int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
>   
>   #endif /* __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H */

