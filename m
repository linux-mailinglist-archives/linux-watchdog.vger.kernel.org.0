Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E835A15D914
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2020 15:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgBNOK2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Feb 2020 09:10:28 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35886 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgBNOK2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Feb 2020 09:10:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id d9so5034187pgu.3;
        Fri, 14 Feb 2020 06:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MxkvqzznTEHqAhKau37nl8jaNLmJXN6qscXilpZkBbs=;
        b=eQ/GOD+KqOCBvrpzrIwcRIO7P4gDOD/1hK9IiEPvFWmLr6rhxLbxaxcbPG8ZVlR6v+
         3ZdYUD5UCqVUh8iweLwBvngeINLETErX3G4EEtfcf9Dnz6+iaUlzfIm8l22r6KHKl6bM
         gUZmPuEacGpM+O/n8Tgvw3DHMf2yWaTTb0ns9lwNrv/wUtY3LfRXHT8g9UGH2I4jsp13
         Lgu9cxKDzNZgbGPZMrSqb2IKlrXQrPpDjyiucm3H95P4o1d3hS7+T72XaS8nqofJw+YV
         /6r0OnCvBDp7LsRumMJ+HmkKNqff9Zw4Z91gFrVMLj0WNU1CYCbKAm9cxgQBBBl1FSWC
         im4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MxkvqzznTEHqAhKau37nl8jaNLmJXN6qscXilpZkBbs=;
        b=j/eFHNwwPF6/Zs2TZ6jNa8wQFhzjzrUR+IsM8nTzpBlyfJUy+Zn73WFlDPnQ4Rapnj
         PciJqjXoXXMakhzt6KuIC6jUCRQlUFlpOphVynOcj9Byqca29ZwQiGiXsLKtXGNsCaRr
         p2gnucgZZI8u5z5SKAwMFdNh4SCRRXRaSoGDd+cX2irkQTLgo+taX1ITiHSKGYhIzFaq
         U3x7ozJeyJjIU0sR9mnqDzITle+XKpD0a1uU8EoQIWKaXHYBCMtRH/iWF6Gb6jyoODBP
         73+YfC4B8pnZeV2O61DTzurSVdQccQLBMlTenYOWfAZgEb9Pq8j7hdnHbKO1WRtSHZju
         BWZA==
X-Gm-Message-State: APjAAAXULG4l5O0lgPny3toSYvccBtsYTxsv33FCnZmVStXy6x/tOd7J
        2Q0+00LODTpk1O+BDyy+wkg=
X-Google-Smtp-Source: APXvYqwsECoRvTgFluu7VgPH21rGGmq9+KuorBUHrBqUHVERkaGrnYnyHKRw/U1N1M247EX2IUTd4g==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr3662669pgn.324.1581689426865;
        Fri, 14 Feb 2020 06:10:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d69sm7785468pfd.72.2020.02.14.06.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 06:10:25 -0800 (PST)
Subject: Re: [PATCH 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anson Huang <Anson.Huang@nxp.com>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <804d3cc5-688d-7025-cb87-10b9616f4d9b@roeck-us.net>
Date:   Fri, 14 Feb 2020 06:10:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/13/20 10:26 PM, Evan Benn wrote:
> From: Julius Werner <jwerner@chromium.org>
> 
> This patch adds a stub watchdog driver that can be used on ARM systems

 From kernel perspective, this is not a "stub" driver. A stub driver is one
that doesn't do anything.

> with a Secure Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call. This may be useful for platforms
> using TrustZone that want the Secure Monitor firmware to have the final
> control over the watchdog.
> 

As written, one would assume this to work on all systems implementing
ARM secure firmware, which is not the case. Please select a different
name, and provide information about the systems where this is actually
supported.

If it happens to be standardized, we will need a reference to the standard
supported. This needs to distinguish from IMX_SC_WDT, which also supports
a secure monitor based watchdog (but doesn't claim to be generic).

> Signed-off-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>

I won't comment on items already covered by Enric. Please address those as well.

> ---
> 
>   MAINTAINERS                    |   1 +
>   arch/arm64/configs/defconfig   |   1 +
>   drivers/watchdog/Kconfig       |  12 +++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/arm_smc_wdt.c | 191 +++++++++++++++++++++++++++++++++
>   5 files changed, 206 insertions(+)
>   create mode 100644 drivers/watchdog/arm_smc_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c45536e1177..71df3c110fdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1426,6 +1426,7 @@ M:	Julius Werner <jwerner@chromium.org>
>   R:	Evan Benn <evanbenn@chromium.org>
>   S:	Maintained
>   F:	devicetree/bindings/watchdog/arm,smc-wdt.yaml
> +F:	drivers/watchdog/arm_smc_wdt.c
>   
>   ARM SMMU DRIVERS
>   M:	Will Deacon <will@kernel.org>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b2f667307f82..8527db9e92a6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -451,6 +451,7 @@ CONFIG_QCOM_TSENS=y
>   CONFIG_UNIPHIER_THERMAL=y
>   CONFIG_WATCHDOG=y
>   CONFIG_ARM_SP805_WATCHDOG=y
> +CONFIG_ARM_SMC_WATCHDOG=y
>   CONFIG_S3C2410_WATCHDOG=y
>   CONFIG_DW_WATCHDOG=y
>   CONFIG_SUNXI_WATCHDOG=m
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index cec868f8db3f..0f7f93342051 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -857,6 +857,18 @@ config DIGICOLOR_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called digicolor_wdt.
>   
> +config ARM_SMC_WATCHDOG
> +	tristate "ARM Secure Monitor Call based watchdog support"
> +	depends on ARM || ARM64

This also depends on HAVE_ARM_SMCCC.

> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for a watchdog timer
> +	  implemented by the EL3 Secure Monitor on ARM platforms.
> +	  Requires firmware support.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called arm_smc_wdt.
> +
> +
Extra empty line.

>   config LPC18XX_WATCHDOG
>   	tristate "LPC18xx/43xx Watchdog"
>   	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee352bf3372..a1e6d83a7659 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
>   obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
>   obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
>   obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
> +obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>   obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> new file mode 100644
> index 000000000000..58e7294136ef
> --- /dev/null
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ARM Secure Monitor Call watchdog driver
> + *
> + * Copyright 2018 The Chromium OS Authors. All rights reserved.
> + *
> + * Julius Werner <jwerner@chromium.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * Based on mtk_wdt.c
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <uapi/linux/psci.h>
> +
> +#define DRV_NAME		"arm_smc_wdt"
> +#define DRV_VERSION		"1.0"
> +
> +#define SMCWD_FUNC_ID		0x82003d06
> +
> +enum smcwd_call {
> +	SMCWD_INFO		= 0,
> +	SMCWD_SET_TIMEOUT	= 1,
> +	SMCWD_ENABLE		= 2,
> +	SMCWD_PET		= 3,
> +};
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +static unsigned int timeout;
> +
> +static int smcwd_call(enum smcwd_call call, unsigned long arg,
> +		      struct arm_smccc_res *res)
> +{
> +	struct arm_smccc_res local_res;
> +
> +	if (!res)
> +		res = &local_res;
> +
> +	arm_smccc_smc(SMCWD_FUNC_ID, call, arg, 0, 0, 0, 0, 0, res);
> +
> +	if ((int)res->a0 == PSCI_RET_NOT_SUPPORTED)
> +		return -ENOTSUPP;

-ENODEV would be better here.

> +	if ((int)res->a0 == PSCI_RET_INVALID_PARAMS)
> +		return -EINVAL;
> +	if ((int)res->a0 < 0)
> +		return -EIO;

Yes, those typecasts are indeed unnecessary.

> +	return res->a0;
> +}
> +
> +static int smcwd_ping(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(SMCWD_PET, 0, NULL);
> +}
> +
> +static int smcwd_set_timeout(struct watchdog_device *wdd,
> +				unsigned int timeout)
> +{
> +	int res;
> +
> +	res = smcwd_call(SMCWD_SET_TIMEOUT, timeout, NULL);
> +	if (!res)
> +		wdd->timeout = timeout;
> +	return res;
> +}
> +
> +static int smcwd_stop(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(SMCWD_ENABLE, 0, NULL);
> +}
> +
> +static int smcwd_start(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(SMCWD_ENABLE, 1, NULL);
> +}
> +
> +static const struct watchdog_info smcwd_info = {
> +	.identity	= DRV_NAME,
> +	.options	= WDIOF_SETTIMEOUT |
> +			  WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops smcwd_ops = {
> +	.owner		= THIS_MODULE,

Not necessary, and will result in a static analyzer warning.

> +	.start		= smcwd_start,
> +	.stop		= smcwd_stop,
> +	.ping		= smcwd_ping,
> +	.set_timeout	= smcwd_set_timeout,
> +};
> +
> +static int smcwd_probe(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd;
> +	int err;
> +	struct arm_smccc_res res;
> +
> +	err = smcwd_call(SMCWD_INFO, 0, &res);
> +	if (err < 0)
> +		return err;
> +
> +	wdd = devm_kzalloc(&pdev->dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, wdd);
> +
> +	wdd->info = &smcwd_info;
> +	wdd->ops = &smcwd_ops;
> +	wdd->timeout = res.a2;
> +	wdd->max_timeout = res.a2;
> +	wdd->min_timeout = res.a1;
> +	wdd->parent = &pdev->dev;
> +
> +	watchdog_set_nowayout(wdd, nowayout);
> +	watchdog_init_timeout(wdd, timeout, &pdev->dev);
> +	err = smcwd_set_timeout(wdd, wdd->timeout);
> +	if (err)
> +		return err;
> +
> +	err = watchdog_register_device(wdd);

devm_watchdog_register_device() should work here.

> +	if (err)
> +		return err;
> +
> +	dev_info(&pdev->dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",

The watchdog is not enabled here, it is only registered.

> +			wdd->timeout, nowayout);
> +
> +	return 0;
> +}
> +
> +static void smcwd_shutdown(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd = platform_get_drvdata(pdev);
> +
> +	if (watchdog_active(wdd))
> +		smcwd_stop(wdd);
> +}
> +
Please use watchdog_stop_on_reboot().

> +static int smcwd_remove(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd = platform_get_drvdata(pdev);
> +
> +	watchdog_unregister_device(wdd);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id smcwd_dt_ids[] = {
> +	{ .compatible = "arm,smc-wdt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
> +
> +static struct platform_driver smcwd_driver = {
> +	.probe		= smcwd_probe,
> +	.remove		= smcwd_remove,
> +	.shutdown	= smcwd_shutdown,
> +	.driver		= {
> +		.name		= DRV_NAME,
> +		.of_match_table	= smcwd_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(smcwd_driver);
> +
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
> +
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Julius Werner <jwerner@chromium.org>");
> +MODULE_DESCRIPTION("ARM Secure Monitor Call Watchdog Driver");
> +MODULE_VERSION(DRV_VERSION);
> 

