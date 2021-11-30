Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B05C463D8C
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Nov 2021 19:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239500AbhK3SUy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Nov 2021 13:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245398AbhK3SUx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Nov 2021 13:20:53 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CCCC061574;
        Tue, 30 Nov 2021 10:17:34 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id bf8so42965136oib.6;
        Tue, 30 Nov 2021 10:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JPIHgEc9S4b6KVd+YKHLqg4muXniClxP+86jExxJoY0=;
        b=gGLMNrUeoDD9Mp+nCGowi997Udt3uR1LcV+7/QvraBSZfvIkyuWxI7ZU7Xa+lnkvlE
         FNOe8mImYuSHMuMJBZQkm1iWjD/6DQ6t/LKTrfKthJU6Pbz1IvstfHFt+S7R419Tolvx
         1XfABXMKTbTXVjq/GNqVHR5nTrWJYpiU+tGY3gRkLFCkwkTnPwJ2MubPKGnTxI+NrsuT
         n60awFWevrvx4vDRH3gkS3T1vv9UKSs8KZpzavLylTj4+JQEVUscIv84epcrfLzVtAK2
         ZoRF8u9GopcNC0WMJ3/GwJ9Aqi6LjM8GM43CRrHOSZxjxTlfHUtEZEaWcyVhw5XHcpGh
         A8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JPIHgEc9S4b6KVd+YKHLqg4muXniClxP+86jExxJoY0=;
        b=KzWUDnLBi5138t7rrOK9+EeRHOuiB8wajFwP++VsXWqR2J1JdfWC+FTFKHvkjhFHK0
         gH03HcAn5UMp8cr9sUiMoFGH5vbqAQnEd6nzNsYY4HwRWC5HKhWiWJp0XriZxcf+DGdl
         AeuivwRTXdadyC18PIvfvSPgpPZu4mbGvPE5OkE9TPKZOZzGcOzowWB1VGLA4pZqWxTR
         hZK2qYGhwOkIi6c5CKRIKs7XDV1vDSqJ5VXg2u7bAsdcokteMLzBR6xpxYfak3G33GAi
         94EiDQRBjELOsWXdl11OgtnEtt4XX7QKOpUxCNbmkv4qU0+AvM11tU1SvstfXXlL3fBV
         5sgA==
X-Gm-Message-State: AOAM533EGUIX5x26XDQkh1jCYfa2v04gB+JMJMCi6R+/DyrW53GUN5Vb
        YDtqh89dcRXYGWHBZxZzGzrBTUvVt70=
X-Google-Smtp-Source: ABdhPJzRkguCprsfKsiFYshGQMuF1YVH3s0LHNaZHAB/wO5t1JH/+EQnAdyM0ViTAq9T0YBSgcJUAg==
X-Received: by 2002:a05:6808:2392:: with SMTP id bp18mr564316oib.89.1638296252986;
        Tue, 30 Nov 2021 10:17:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9sm68713oto.56.2021.11.30.10.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 10:17:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20211130114316.16622-1-biju.das.jz@bp.renesas.com>
 <20211130114316.16622-3-biju.das.jz@bp.renesas.com>
 <5ada41f6-68cf-08e8-a773-cfd174bf82a5@roeck-us.net>
 <OS0PR01MB5922DAC8B07B8F4F243E932A86679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
Message-ID: <fa8f920e-42a1-a002-c274-05819ae23d04@roeck-us.net>
Date:   Tue, 30 Nov 2021 10:17:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922DAC8B07B8F4F243E932A86679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/30/21 9:48 AM, Biju Das wrote:
> Hi Guenter,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH v4 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
>>
>> On 11/30/21 3:43 AM, Biju Das wrote:
>>> Add Watchdog Timer driver for RZ/G2L SoC.
>>>
>>> WDT IP block supports normal watchdog timer function and reset request
>>> function due to CPU parity error.
>>>
>>> This driver currently supports normal watchdog timer function and
>>> later will add support for reset request function due to CPU parity
>>> error.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> V3->V4:
>>>    * Fixed the build issue reported by kernel test robot by Replacing the
>>>      macro WDT_CYCLE_MSEC with div64_ul for 64-bit division to fix 32-bit
>>>      kernels.
>>> V2->V3:
>>>    * Added Rb tag from Guenter Roeck
>>> V1->V2:
>>>    * started using clk_get/put instead of devm_clk_get/put
>>>    * Moved devm_add_action_or_reset after set_drvdata() and
>>>    * removed redundant action on devm_add_action_or_reset() failure.
>>> RFC->V1
>>>    * Removed pclk_rate from priv.
>>>    * rzg2l_wdt_write() returns void and Removed tiemout related to
>> register update
>>>    * rzg2l_wdt_init_timeout() returns void and removed delays.
>>>    * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
>>>    * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
>>>    * started using devm_reset_control_get_exclusive()
>>>    * removed platform_set_drvdata(pdev, priv) as there is no user
>>>    * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the
>> default.
>>>    * removed remove callback as it is empty.
>>> ---
>>>    drivers/watchdog/Kconfig     |   8 ++
>>>    drivers/watchdog/Makefile    |   1 +
>>>    drivers/watchdog/rzg2l_wdt.c | 260 +++++++++++++++++++++++++++++++++++
>>>    3 files changed, 269 insertions(+)
>>>    create mode 100644 drivers/watchdog/rzg2l_wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig index
>>> 9d222ba17ec6..4760ee981263 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -881,6 +881,14 @@ config RENESAS_RZAWDT
>>>    	  This driver adds watchdog support for the integrated watchdogs in
>> the
>>>    	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
>>>
>>> +config RENESAS_RZG2LWDT
>>> +	tristate "Renesas RZ/G2L WDT Watchdog"
>>> +	depends on ARCH_RENESAS || COMPILE_TEST
>>> +	select WATCHDOG_CORE
>>> +	help
>>> +	  This driver adds watchdog support for the integrated watchdogs in
>> the
>>> +	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a
>> system.
>>> +
>>>    config ASPEED_WATCHDOG
>>>    	tristate "Aspeed BMC watchdog support"
>>>    	depends on ARCH_ASPEED || COMPILE_TEST diff --git
>>> a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile index
>>> 2ee97064145b..9a3dc0bd271b 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -84,6 +84,7 @@ obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
>>>    obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
>>>    obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
>>>    obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
>>> +obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
>>>    obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
>>>    obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
>>>    obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o diff --git
>>> a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c new file
>>> mode 100644 index 000000000000..69530b92fff9
>>> --- /dev/null
>>> +++ b/drivers/watchdog/rzg2l_wdt.c
>>> @@ -0,0 +1,260 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Renesas RZ/G2L WDT Watchdog Driver
>>> + *
>>> + * Copyright (C) 2021 Renesas Electronics Corporation  */ #include
>>> +<linux/bitops.h> #include <linux/clk.h> #include <linux/delay.h>
>>> +#include <linux/io.h> #include <linux/kernel.h> #include
>>> +<linux/module.h> #include <linux/of.h> #include
>>> +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
>>> +<linux/reset.h> #include <linux/watchdog.h>
>>> +
>>> +#define WDTCNT		0x00
>>> +#define WDTSET		0x04
>>> +#define WDTTIM		0x08
>>> +#define WDTINT		0x0C
>>> +#define WDTCNT_WDTEN	BIT(0)
>>> +#define WDTINT_INTDISP	BIT(0)
>>> +
>>> +#define WDT_DEFAULT_TIMEOUT		60U
>>> +
>>> +/* Setting period time register only 12 bit set in WDTSET[31:20] */
>>> +#define WDTSET_COUNTER_MASK		(0xFFF00000)
>>> +#define WDTSET_COUNTER_VAL(f)		((f) << 20)
>>> +
>>> +#define F2CYCLE_NSEC(f)			(1000000000 / (f))
>>> +
>>> +static bool nowayout = WATCHDOG_NOWAYOUT; module_param(nowayout,
>>> +bool, 0); MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
>>> +started (default="
>>> +				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +struct rzg2l_wdt_priv {
>>> +	void __iomem *base;
>>> +	struct watchdog_device wdev;
>>> +	struct reset_control *rstc;
>>> +	unsigned long osc_clk_rate;
>>> +	unsigned long delay;
>>> +};
>>> +
>>> +static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv) {
>>> +	/* delay timer when change the setting register */
>>> +	ndelay(priv->delay);
>>> +}
>>> +
>>> +static u32 rzg2l_wdt_get_cycle_msec(unsigned long cycle, u32 wdttime)
>>> +{
>>> +	u64 timer_cycle_ms = 1024 * 1024 * 1000000ULL * (wdttime + 1);
>>> +
>>> +	return div64_ul(timer_cycle_ms, cycle); }
>>
>> A description might be warranted here. The return value appears to be a
>> timeout in seconds, based on
>> 	priv->wdev.max_timeout = rzg2l_wdt_get_cycle_msec(priv-
>>> osc_clk_rate, 0xfff); but that is not what the function name suggests.
>>
>> Also, the maximum timeouts seem to be excessive. Feeding the above
>> function into test code, I get
>>
> 
> As per HW manual,
> 24MHz is our SoC input clock,
> 
> Equation is 1024 *1024 * (t +1)  /(24 * 100000) seconds.
> 
> Min value of 0 corresponds to .4369sec, if you convert it into microseconds it becomes 0.43690x1000000 = 436906 microseconds
> 
> Max value of 0xfff corresponds to 1789956.97 msec, if you convert it into microseconds it becomes 1789956970 = 0x6AB0936A , I agree it is a big value, but it is with in 32bit limits.
> 

max_timeout is in seconds, not microseconds, and the function has _msec
in its name which doesn't reflect anything micro.

>> clk: 10000000 max timeout: 429496729
>> clk: 20000000 max timeout: 214748364
>> clk: 40000000 max timeout: 107374182
>> clk: 80000000 max timeout: 53687091
>> clk: 160000000 max timeout: 26843545
>> clk: 320000000 max timeout: 13421772
>> clk: 640000000 max timeout: 6710886
>> clk: 1280000000 max timeout: 3355443
>>
>> That really doesn't look correct. Even in milli-seconds, a maximum timeout
>> of 429496729 ms or 429496.729 seconds at 10 MHz clock rate seems high.
>>
>>> +
>>> +static void rzg2l_wdt_write(struct rzg2l_wdt_priv *priv, u32 val,
>>> +unsigned int reg) {
>>> +	if (reg == WDTSET)
>>> +		val &= WDTSET_COUNTER_MASK;
>>> +
>>> +	writel_relaxed(val, priv->base + reg);
>>> +	/* Registers other than the WDTINT is always synchronized with
>> WDT_CLK */
>>> +	if (reg != WDTINT)
>>> +		rzg2l_wdt_wait_delay(priv);
>>> +}
>>> +
>>> +static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev) {
>>> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>>> +	u32 time_out;
>>> +
>>> +	/* Clear Lapsed Time Register and clear Interrupt */
>>> +	rzg2l_wdt_write(priv, WDTINT_INTDISP, WDTINT);
>>> +	/* 2 consecutive overflow cycle needed to trigger reset */
>>> +	time_out = (wdev->timeout / 2 * 1000000) /
>>> +rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0);
>>
>> This code effectively reduces timer granularity to 2 seconds. Is that on
>> purpose ?
> 
> Yes, it needs 2 consecutive overflow cycle for triggering watchdog reset
> 
> As per the above calculation,
> 
> 60 secs Default timeout, the counter value = 30000000 microsec/436906 microsec = 686
> 
> And it triggers watchdog around 60 sec with the command
> cat /dev/watchdog  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800808; done
> 
That explains the factor itself, which I did not question. I questioned
the granularity, ie why the timeout was, in practice, set to 0, 2, 4,
... seconds instead of 1, 2, 3, 4 ...

>> Why not something like
>> 	time_out = (wdev->timeout * (1000000 / 2)) /
>> rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0); instead ?
> 
> 
> Ok.
> 
>>
>> Also, feeding the maximum timeout as calculated by
>> rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0xfff) into this expression
>> yields really large numbers. Making things worse, those long timeouts
>> cause
>> 	wdev->timeout / 2 * 1000000
>> to overflow easily. This calculation alone suggests that the maximum
>> timeout value can not be larger than ~8589 to avoid that overflow.
>>
>> More test code gives me:
>>
>> clk: 10000000 max timeout: 429496729
>>     timeout: 1s reg: 0x0
>>     timeout: 2s reg: 0x9
>>     timeout: 859s reg: 0xffb
>>       Overflow: t=214748364 treg: 0x3d0916df
>>     timeout: 214748364s reg: 0xffffffff
>>       Overflow: t=429496729 treg: 0x7a122dbf
>>     timeout: 429496729s reg: 0xffffffff
>>
>> clk: 320000000 max timeout: 13421772
>>     timeout: 1s reg: 0x0
>>     timeout: 2s reg: 0x131
>>     timeout: 27s reg: 0xf80
>>       Overflow: t=6710886 treg: 0x3d0cd090
>>     timeout: 6710886s reg: 0xffffffff
>>       Overflow: t=13421772 treg: 0x7a19a120
>>     timeout: 13421772s reg: 0xffffffff
>>
>> and similar for other clock rates. This shows both the impact of the
>> artificial 2s granularity and the value overflows.
>>
>> Something in the calculation of max_timeout or in the calculation of the
>> register value or both is wrong. Whatever it is, it needs to get fixed.
> 
> I believe microsecond calculation leads to the confusion.
> 

Again,
	priv->wdev.max_timeout = rzg2l_wdt_get_cycle_msec(priv-osc_clk_rate, 0xfff);

and max_timeout is in seconds, not milliseconds or microseconds.
Maybe it needs to be something like

	priv->wdev.max_timeout = rzg2l_wdt_get_cycle_msec(priv-osc_clk_rate, 0xfff) /
		(1000000 / 2);

instead (that would limit the range of the register value to 0..0xfff), but
even then the function name (rzg2l_wdt_get_cycle_msec) doesn't match
what it returns. Maybe it should be named rzg2l_wdt_get_cycle_usec.
It might also make sense to use USEC_PER_SEC instead of 1000000 to
clarify the context.

Guenter
