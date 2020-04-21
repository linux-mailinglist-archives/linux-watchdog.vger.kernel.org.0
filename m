Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2751B2A01
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 16:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDUOed (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Apr 2020 10:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUOec (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Apr 2020 10:34:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E47EC061A10;
        Tue, 21 Apr 2020 07:34:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v2so5300557plp.9;
        Tue, 21 Apr 2020 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XJFnj4P41FEwwTlXP5SyhzZCxoS7Z0cXneO+GhScezs=;
        b=aPR60OC7bNQ8aBWulXNKfs2wPvjgcVhalDLnWjNc7LH1XMgND7e6EFoWMgLhT+CWFN
         mFBND7FaU+BOI5j9eJ76xRL1xb7paVaDYaBzlgjkMoX0zCBWOJHlq7va/ONVfqW01GFI
         p0Dw09VR6dQWzrsQUSBlMVcqtJQVGNowFijZQ1k/8R0676bBS4K5xQZy+vphZNuow6H8
         5GTiBpoe52qfy0aqxI4Upn4+ElWde9gezBqYWJ/fJb/S2CmORR4tIL1Rc418HHCx4ne3
         9AWHFvUH0EEIPrN8rwKzeEzC8wrmNauOBicO4UyEkfRhMmniFpxOqRGBoLcQq0JDRZYd
         fgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XJFnj4P41FEwwTlXP5SyhzZCxoS7Z0cXneO+GhScezs=;
        b=H6xcQ77vI6mFyp8Ot5f5Ig2wiciXVbCRZGlV7ZwhJKfnw8+9iJmWjC/ahuptGwkLGa
         DfLUY1SPibLyZsRbsY03PuQ2bsLJUPE1iPP8keX9LVP+/aacw+OkL8sdLVQyOQgQPwK2
         B4PcDy5VhljtE1yUBfwOMKJF+8kF6cvyUPy5R4ELNZo1IJSzFdJYo4aI0goNjh7acxEi
         Qwhp7UATQPx9EywIOOgyLUYl7v7clZkN262c0JztfOO5Pccos4MsWAZmIPf77TVKE66o
         qshTczIRfL9j01YJ6LmE42zDpNv5yC2baWOtAIZk96Ke/kWN8o6njnbS5Ykn4TZmV1F/
         +NOQ==
X-Gm-Message-State: AGi0PuZJj0Zx9PjXTXQqF6o+hy3+DQaDJpv0Bfa/K4EQJymntHk+OJ3X
        GPrHGDb4HAa8I6IlA1VvnDYjMKKv
X-Google-Smtp-Source: APiQypJHe1xjrJTkzga2BjIYklzlAaSN6Z3NqMzNxW7NtVpVLLW+mn4VPGX6p3LB5ydAzCbW++8oMQ==
X-Received: by 2002:a17:90b:b06:: with SMTP id bf6mr5840941pjb.179.1587479671698;
        Tue, 21 Apr 2020 07:34:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1sm728701pfa.202.2020.04.21.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 07:34:31 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     xingyu.chen@amlogic.com, jwerner@chromium.org,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5ed7f2a6-e910-0467-700e-ba6fee525e77@roeck-us.net>
Date:   Tue, 21 Apr 2020 07:34:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/21/20 4:05 AM, Evan Benn wrote:
> From: Julius Werner <jwerner@chromium.org>
> 
> This patch adds a watchdog driver that can be used on ARM systems
> with the appropriate watchdog implemented in Secure Monitor firmware.
> The driver communicates with firmware via a Secure Monitor Call.
> This may be useful for platforms using TrustZone that want
> the Secure Monitor firmware to have the final control over the watchdog.
> 
> This is implemented on mt8173 chromebook devices oak, elm and hana in
> arm trusted firmware file plat/mediatek/mt8173/drivers/wdt/wdt.c.
> 
> Signed-off-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

You have made functional changes. Keeping a Reviewed-by: tag
after functional changes is inappropriate unless the reviewer
explicitly agreed to it.

Guenter

> 
> ---
> 
> Changes in v4:
> - Get smc-id from of property
> - Return a1 instead of a0 in timeleft
> 
> Changes in v3:
> - Add optional get_timeleft op
> - change name to arm_smc_wdt
> 
> Changes in v2:
> - use watchdog_stop_on_reboot
> - use watchdog_stop_on_unregister
> - use devm_watchdog_register_device
> - remove smcwd_shutdown, smcwd_remove
> - change error codes
> 
>  MAINTAINERS                    |   1 +
>  arch/arm64/configs/defconfig   |   1 +
>  drivers/watchdog/Kconfig       |  13 +++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/arm_smc_wdt.c | 194 +++++++++++++++++++++++++++++++++
>  5 files changed, 210 insertions(+)
>  create mode 100644 drivers/watchdog/arm_smc_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f2b39767bfa9..2b782bbff200a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1462,6 +1462,7 @@ M:	Julius Werner <jwerner@chromium.org>
>  R:	Evan Benn <evanbenn@chromium.org>
>  S:	Maintained
>  F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
> +F:	drivers/watchdog/arm_smc_wdt.c
>  
>  ARM SMMU DRIVERS
>  M:	Will Deacon <will@kernel.org>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 24e534d850454..0619df80f7575 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -513,6 +513,7 @@ CONFIG_UNIPHIER_THERMAL=y
>  CONFIG_WATCHDOG=y
>  CONFIG_ARM_SP805_WATCHDOG=y
>  CONFIG_ARM_SBSA_WATCHDOG=y
> +CONFIG_ARM_SMC_WATCHDOG=y
>  CONFIG_S3C2410_WATCHDOG=y
>  CONFIG_DW_WATCHDOG=y
>  CONFIG_SUNXI_WATCHDOG=m
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0663c604bd642..c440b576d23bf 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -867,6 +867,19 @@ config DIGICOLOR_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called digicolor_wdt.
>  
> +config ARM_SMC_WATCHDOG
> +	tristate "ARM Secure Monitor Call based watchdog support"
> +	depends on ARM || ARM64
> +	depends on OF
> +	depends on HAVE_ARM_SMCCC
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for a watchdog timer
> +	  implemented by the EL3 Secure Monitor on ARM platforms.
> +	  Requires firmware support.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called arm_smc_wdt.
> +
>  config LPC18XX_WATCHDOG
>  	tristate "LPC18xx/43xx Watchdog"
>  	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 6de2e4ceef190..97bed1d3d97cb 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -94,6 +94,7 @@ obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
>  obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
>  obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
>  obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
> +obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> new file mode 100644
> index 0000000000000..29d2573b2ca11
> --- /dev/null
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ARM Secure Monitor Call watchdog driver
> + *
> + * Copyright 2020 Google LLC.
> + * Julius Werner <jwerner@chromium.org>
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
> +#define get_smc_func_id(wdd) (*(u32 *)watchdog_get_drvdata(wdd))
> +enum smcwd_call {
> +	SMCWD_INIT		= 0,
> +	SMCWD_SET_TIMEOUT	= 1,
> +	SMCWD_ENABLE		= 2,
> +	SMCWD_PET		= 3,
> +	SMCWD_GET_TIMELEFT	= 4,
> +};
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +static unsigned int timeout;
> +
> +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
> +		      unsigned long arg, struct arm_smccc_res *res)
> +{
> +	struct arm_smccc_res local_res;
> +
> +	if (!res)
> +		res = &local_res;
> +
> +	arm_smccc_smc(smc_func_id, call, arg, 0, 0, 0, 0, 0, res);
> +
> +	if (res->a0 == PSCI_RET_NOT_SUPPORTED)
> +		return -ENODEV;
> +	if (res->a0 == PSCI_RET_INVALID_PARAMS)
> +		return -EINVAL;
> +	if (res->a0 != PSCI_RET_SUCCESS)
> +		return -EIO;
> +	return 0;
> +}
> +
> +static int smcwd_ping(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(get_smc_func_id(wdd), SMCWD_PET, 0, NULL);
> +}
> +
> +static unsigned int smcwd_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +
> +	smcwd_call(get_smc_func_id(wdd), SMCWD_GET_TIMELEFT, 0, &res);
> +	return res.a1;
> +}
> +
> +static int smcwd_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	int res;
> +
> +	res = smcwd_call(get_smc_func_id(wdd), SMCWD_SET_TIMEOUT, timeout,
> +			 NULL);
> +	if (!res)
> +		wdd->timeout = timeout;
> +	return res;
> +}
> +
> +static int smcwd_stop(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(get_smc_func_id(wdd), SMCWD_ENABLE, 0, NULL);
> +}
> +
> +static int smcwd_start(struct watchdog_device *wdd)
> +{
> +	return smcwd_call(get_smc_func_id(wdd), SMCWD_ENABLE, 1, NULL);
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
> +	.start		= smcwd_start,
> +	.stop		= smcwd_stop,
> +	.ping		= smcwd_ping,
> +	.set_timeout	= smcwd_set_timeout,
> +};
> +
> +static const struct watchdog_ops smcwd_timeleft_ops = {
> +	.start		= smcwd_start,
> +	.stop		= smcwd_stop,
> +	.ping		= smcwd_ping,
> +	.set_timeout	= smcwd_set_timeout,
> +	.get_timeleft	= smcwd_get_timeleft,
> +};
> +
> +static int smcwd_probe(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdd;
> +	int err;
> +	struct arm_smccc_res res;
> +	u32 *smc_func_id;
> +
> +	smc_func_id =
> +		devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
> +	if (!smc_func_id)
> +		return -ENOMEM;
> +
> +	err = of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
> +				   smc_func_id);
> +	if (err < 0)
> +		return err;
> +
> +	err = smcwd_call(*smc_func_id, SMCWD_INIT, 0, &res);
> +	if (err < 0)
> +		return err;
> +
> +	wdd = devm_kzalloc(&pdev->dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, wdd);
> +	watchdog_set_drvdata(wdd, smc_func_id);
> +
> +	wdd->info = &smcwd_info;
> +	/* get_timeleft is optional */
> +	if (smcwd_call(*smc_func_id, SMCWD_GET_TIMELEFT, 0, NULL))
> +		wdd->ops = &smcwd_ops;
> +	else
> +		wdd->ops = &smcwd_timeleft_ops;
> +	wdd->timeout = res.a2;
> +	wdd->max_timeout = res.a2;
> +	wdd->min_timeout = res.a1;
> +	wdd->parent = &pdev->dev;
> +
> +	watchdog_stop_on_reboot(wdd);
> +	watchdog_stop_on_unregister(wdd);
> +	watchdog_set_nowayout(wdd, nowayout);
> +	watchdog_init_timeout(wdd, timeout, &pdev->dev);
> +	err = smcwd_set_timeout(wdd, wdd->timeout);
> +	if (err)
> +		return err;
> +
> +	err = devm_watchdog_register_device(&pdev->dev, wdd);
> +	if (err)
> +		return err;
> +
> +	dev_info(&pdev->dev,
> +		 "Watchdog registered (timeout=%d sec, nowayout=%d)\n",
> +		 wdd->timeout, nowayout);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id smcwd_dt_ids[] = {
> +	{ .compatible = "mediatek,mt8173-smc-wdt" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
> +
> +static struct platform_driver smcwd_driver = {
> +	.probe		= smcwd_probe,
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

