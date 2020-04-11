Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A29AB1A4D22
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Apr 2020 03:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDKBPg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Apr 2020 21:15:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35451 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgDKBPf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Apr 2020 21:15:35 -0400
Received: by mail-pg1-f193.google.com with SMTP id k5so1691599pga.2;
        Fri, 10 Apr 2020 18:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1zO4lr3JCTy4WSO9gxCzAWtz/VjA8ebeXFdaEEgav+4=;
        b=lSSF2lin374GWR+mb+0iCxTpViaQDVKBE2mRyiJCDlBjLpN4gqUunzuMYH08GUqPsO
         T/hzUAhtAWm9xUgfLi24Am144z2Kc4EPSDnzfGCuzXfvQVdUVjgcU5Rl0yGPo+VEXAwK
         wiBgpALDL3jJwFo6507grEr/557NvPcZiaaPZjRbwq2kOkjaAsuM6+Ii3Wu50KqW91uD
         /r7q3N1HNkbfzgy8BrhvZFUI7Jd5KtvMB0pT3jhB6yluduWaY/HyBZZsCCZeUrDoF1Oc
         16QZh4QMTMN6unumN1HvevSuyz64sPGcokDYIYRIbMYXR4FVvJl65i/P3fVTY+0vJE6u
         4ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1zO4lr3JCTy4WSO9gxCzAWtz/VjA8ebeXFdaEEgav+4=;
        b=KPxr3eLKZuJhTOjE7627jvEknOErRJd/y5L6CkMRH9mL0GhaGs21XCH/+AkWIHzVBX
         x75BGg0qVXN/47YFF3WVDE2AAOoJgCVO7ba6y+Z86zxt2vLAFRKtJm3tfEqEwxQ0TdOG
         NJnAitqhwmXXdB2kssFQCMLd3mlRWXVIWcGQhV1uZVwWsE7OIviLps+9bsyb2uwz36cF
         AcTu917gYHWBgz5uM884iER49ktL2N2yF7NeoQJkSMV5cw4SbIzfoSY8tybUeBJAVsYQ
         7D2PtcIXYnZvdso8oDHIBTmFQ7yDaYP4Rx6jrk5DZd07saYeBrk3upH/L9FWZDyMyoZw
         01FA==
X-Gm-Message-State: AGi0PubPsFQoYsL9dqZglb73wo57fhA+1PRZULStzqPPO9gT9XOH35cG
        SHEy3vDkJ4f0UeFxS6thbMssK4NV
X-Google-Smtp-Source: APiQypKK6IAS0twigmQhLDE6vUMWu3550RVsUSdKSzagI31PB/zIr4wzEdnI2vhShiH0/fTh90yx/Q==
X-Received: by 2002:a62:cfc3:: with SMTP id b186mr7495941pfg.311.1586567733577;
        Fri, 10 Apr 2020 18:15:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j96sm2774723pje.32.2020.04.10.18.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 18:15:31 -0700 (PDT)
Subject: Re: [PATCH 4/7] watchdog: dw_wdt: Support devices with non-fixed TOP
 values
To:     Sergey Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132829.E508B8030705@mail.baikalelectronics.ru>
 <20200315141238.GA7245@roeck-us.net>
 <20200410125904.bdrr3jpi47mwvfkf@ubsrv2.baikal.int>
 <9dd40847-a2c7-d30c-0af4-07ff606a61f8@roeck-us.net>
 <20200410194513.tdnhmrpo7sgupn35@ubsrv2.baikal.int>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1c403426-90c9-5478-4cba-852be5d5141b@roeck-us.net>
Date:   Fri, 10 Apr 2020 18:15:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200410194513.tdnhmrpo7sgupn35@ubsrv2.baikal.int>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/10/20 12:45 PM, Sergey Semin wrote:
> On Fri, Apr 10, 2020 at 09:21:35AM -0700, Guenter Roeck wrote:
>> On 4/10/20 5:59 AM, Sergey Semin wrote:
>>> On Sun, Mar 15, 2020 at 07:12:38AM -0700, Guenter Roeck wrote:
>>>> On Fri, Mar 06, 2020 at 04:27:44PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
>>>>> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>>>>
>>>>> In case if the DW Watchdog IP core is synthesised with
>>>>> WDT_USE_FIX_TOP == false, the TOP interval indexes make the device
>>>>> to load a custom periods to the counter. These periods are hardwired
>>>>> at the synthesis stage and can be within [2^8, 2^(WDT_CNT_WIDTH - 1)].
>>>>> Alas their values can't be detected at runtime and must be somehow
>>>>> supplied to the driver so one could properly determine the watchdog
>>>>> timeout intervals. For this purpose we suggest to have a vendor-
>>>>> specific dts property "snps,watchdog-tops" utilized, which would
>>>>> provide an array of sixteen counter values. At device probe stage they
>>>>> will be used to initialize the watchdog device timeouts determined
>>>>> from the array values and current clocks source rate.
>>>>>
>>>>> In order to have custom TOP values supported the driver must be
>>>>> altered in the following way. First of all the fixed-top values
>>>>> ready-to-use array must be determined for compatibility with currently
>>>>> supported devices, which were synthesised with WDT_USE_FIX_TOP == true.
>>>>> Secondly we must redefine the timer period search functions. For
>>>>> generality they are redesigned in a way to support the TOP array with
>>>>> no limitations on the items order or value. Finally an array with
>>>>> pre-defined timeouts must be calculated at probe stage from either
>>>>> the custom or fixed TOP values depending on the DW watchdog component
>>>>> parameter WDT_USE_FIX_TOP value.
>>>>>
>>>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>>>> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
>>>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>>>> Cc: Paul Burton <paulburton@kernel.org>
>>>>> Cc: Ralf Baechle <ralf@linux-mips.org>
>>>>> ---
>>>>>  drivers/watchdog/dw_wdt.c | 145 +++++++++++++++++++++++++++++++-------
>>>>>  1 file changed, 119 insertions(+), 26 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
>>>>> index fba21de2bbad..4a57b7d777dc 100644
>>>>> --- a/drivers/watchdog/dw_wdt.c
>>>>> +++ b/drivers/watchdog/dw_wdt.c
>>>>> @@ -13,6 +13,7 @@
>>>>>   */
>>>>>  
>>>>>  #include <linux/bitops.h>
>>>>> +#include <linux/limits.h>
>>>>>  #include <linux/clk.h>
>>>>>  #include <linux/delay.h>
>>>>>  #include <linux/err.h>
>>>>> @@ -34,12 +35,24 @@
>>>>>  #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
>>>>>  #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
>>>>>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
>>>>> +#define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
>>>>> +#define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
>>>>>  
>>>>> -/* The maximum TOP (timeout period) value that can be set in the watchdog. */
>>>>> -#define DW_WDT_MAX_TOP		15
>>>>> +/* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
>>>>> +#define DW_WDT_NUM_TOPS		16
>>>>> +#define DW_WDT_FIX_TOP(_idx)	(1U << (16 + _idx))
>>>>>  
>>>>>  #define DW_WDT_DEFAULT_SECONDS	30
>>>>>  
>>>>> +static const u32 dw_wdt_fix_tops[DW_WDT_NUM_TOPS] = {
>>>>> +	DW_WDT_FIX_TOP(0), DW_WDT_FIX_TOP(1), DW_WDT_FIX_TOP(2),
>>>>> +	DW_WDT_FIX_TOP(3), DW_WDT_FIX_TOP(4), DW_WDT_FIX_TOP(5),
>>>>> +	DW_WDT_FIX_TOP(6), DW_WDT_FIX_TOP(7), DW_WDT_FIX_TOP(8),
>>>>> +	DW_WDT_FIX_TOP(9), DW_WDT_FIX_TOP(10), DW_WDT_FIX_TOP(11),
>>>>> +	DW_WDT_FIX_TOP(12), DW_WDT_FIX_TOP(13), DW_WDT_FIX_TOP(14),
>>>>> +	DW_WDT_FIX_TOP(15)
>>>>> +};
>>>>> +
>>>>>  static bool nowayout = WATCHDOG_NOWAYOUT;
>>>>>  module_param(nowayout, bool, 0);
>>>>>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>>>>> @@ -49,6 +62,8 @@ struct dw_wdt {
>>>>>  	void __iomem		*regs;
>>>>>  	struct clk		*clk;
>>>>>  	unsigned long		rate;
>>>>> +	unsigned int		max_top;
>>>>> +	unsigned int		timeouts[DW_WDT_NUM_TOPS];
>>>>>  	struct watchdog_device	wdd;
>>>>>  	struct reset_control	*rst;
>>>>>  	/* Save/restore */
>>>>> @@ -64,20 +79,68 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
>>>>>  		WDOG_CONTROL_REG_WDT_EN_MASK;
>>>>>  }
>>>>>  
>>>>> -static inline int dw_wdt_top_in_seconds(struct dw_wdt *dw_wdt, unsigned top)
>>>>> +static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
>>>>> +					 unsigned int timeout, u32 *top)
>>>>>  {
>>>>> +	u32 diff = UINT_MAX, tmp;
>>>>> +	int idx;
>>>>> +
>>>>>  	/*
>>>>> -	 * There are 16 possible timeout values in 0..15 where the number of
>>>>> -	 * cycles is 2 ^ (16 + i) and the watchdog counts down.
>>>>> +	 * In general case of non-fixed timeout values they can be arranged in
>>>>> +	 * any order so we have to traverse all the array values. We also try
>>>>> +	 * to find a closest timeout number and make sure its value is greater
>>>>> +	 * than the requested timeout. Note we'll return a maximum timeout
>>>>> +	 * if reachable value couldn't be found.
>>>>>  	 */
>>>>> -	return (1U << (16 + top)) / dw_wdt->rate;
>>>>> +	for (*top = dw_wdt->max_top, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
>>>>> +		if (dw_wdt->timeouts[idx] < timeout)
>>>>> +			continue;
>>>>> +
>>>>> +		tmp = dw_wdt->timeouts[idx] - timeout;
>>>>> +		if (tmp < diff) {
>>>>> +			diff = tmp;
>>>>> +			*top = idx;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return dw_wdt->timeouts[*top];
>>>>> +}
>>>>> +
>>>>> +static unsigned int dw_wdt_find_min_timeout(struct dw_wdt *dw_wdt)
>>>>
>>>> I would appreciate if the names of functions returning ms end with _ms
>>>> to avoid confusion.
>>>
>>> Ok. I'll also modify the functions a bit, so only the
>>> dw_wdt_find_best_top_ms() and dw_wdt_find_max_top_ms() methods would
>>> return timeouts in milliseconds. Though if you insist in keeping seconds
>>> in the timeouts array (see the comment after the next one), it'll be
>>> dw_wdt_find_max_top_ms() only.
>>>
>>>>
>>>>> +{
>>>>> +	u32 min_timeout = UINT_MAX, top;
>>>>> +	int idx;
>>>>> +
>>>>> +	for (top = 0, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
>>>>> +		if (dw_wdt->timeouts[idx] <= min_timeout) {
>>>>> +			min_timeout = dw_wdt->timeouts[idx];
>>>>> +			top = idx;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return dw_wdt->timeouts[top];
>>>>> +}
>>>>> +
>>>>> +static unsigned int dw_wdt_find_max_top(struct dw_wdt *dw_wdt, u32 *top)
>>>>> +{
>>>>> +	u32 max_timeout = 0;
>>>>> +	int idx;
>>>>> +
>>>>> +	for (*top = 0, idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
>>>>> +		if (dw_wdt->timeouts[idx] >= max_timeout) {
>>>>> +			max_timeout = dw_wdt->timeouts[idx];
>>>>> +			*top = idx;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return dw_wdt->timeouts[*top];
>>>>>  }
>>>>>  
>>>>> -static int dw_wdt_get_top(struct dw_wdt *dw_wdt)
>>>>> +static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
>>>>>  {
>>>>>  	int top = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
>>>>>  
>>>>> -	return dw_wdt_top_in_seconds(dw_wdt, top);
>>>>> +	return dw_wdt->timeouts[top];
>>>>>  }
>>>>>  
>>>>>  static int dw_wdt_ping(struct watchdog_device *wdd)
>>>>> @@ -90,20 +153,13 @@ static int dw_wdt_ping(struct watchdog_device *wdd)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> -static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>>>>> +static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
>>>>>  {
>>>>>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
>>>>> -	int i, top_val = DW_WDT_MAX_TOP;
>>>>> +	unsigned int timeout;
>>>>> +	u32 top;
>>>>>  
>>>>> -	/*
>>>>> -	 * Iterate over the timeout values until we find the closest match. We
>>>>> -	 * always look for >=.
>>>>> -	 */
>>>>> -	for (i = 0; i <= DW_WDT_MAX_TOP; ++i)
>>>>> -		if (dw_wdt_top_in_seconds(dw_wdt, i) >= top_s) {
>>>>> -			top_val = i;
>>>>> -			break;
>>>>> -		}
>>>>> +	timeout = dw_wdt_find_best_top(dw_wdt, req * MSEC_PER_SEC, &top);
>>>>>  
>>>>>  	/*
>>>>>  	 * Set the new value in the watchdog.  Some versions of dw_wdt
>>>>> @@ -111,7 +167,7 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>>>>>  	 * CP_WDT_DUAL_TOP in WDT_COMP_PARAMS_1).  On those we
>>>>>  	 * effectively get a pat of the watchdog right here.
>>>>>  	 */
>>>>> -	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>>>>> +	writel(top | top << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>>>>>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>>>>>  
>>>>>  	/*
>>>>> @@ -119,10 +175,10 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>>>>>  	 * kernel(watchdog_dev.c) helps to feed watchdog before
>>>>>  	 * wdd->max_hw_heartbeat_ms
>>>>>  	 */
>>>>> -	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
>>>>> -		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
>>>>> +	if (req * MSEC_PER_SEC > wdd->max_hw_heartbeat_ms)
>>>>> +		wdd->timeout = req;
>>>>>  	else
>>>>> -		wdd->timeout = top_s;
>>>>> +		wdd->timeout = timeout / MSEC_PER_SEC;
>>>>>  
>>>>>  	return 0;
>>>>>  }
>>>>> @@ -238,6 +294,41 @@ static int dw_wdt_resume(struct device *dev)
>>>>>  
>>>>>  static SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
>>>>>  
>>>>> +static void dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
>>>>> +{
>>>>> +	u32 data, of_tops[DW_WDT_NUM_TOPS];
>>>>> +	const u32 *tops;
>>>>> +	int ret, idx;
>>>>> +
>>>>> +	/*
>>>>> +	 * Retrieve custom or fixed counter values depending on the
>>>>> +	 * WDT_USE_FIX_TOP flag found in the component specific parameters
>>>>> +	 * #1 register.
>>>>> +	 */
>>>>> +	data = readl(dw_wdt->regs + WDOG_COMP_PARAMS_1_REG_OFFSET);
>>>>> +	if (data & WDOG_COMP_PARAMS_1_USE_FIX_TOP) {
>>>>> +		tops = dw_wdt_fix_tops;
>>>>> +	} else {
>>>>> +		ret = of_property_read_variable_u32_array(dev_of_node(dev),
>>>>> +			"snps,watchdog-tops", of_tops, DW_WDT_NUM_TOPS,
>>>>> +			DW_WDT_NUM_TOPS);
>>>>> +		if (ret < 0) {
>>>>> +			dev_warn(dev, "No valid TOPs array specified\n");
>>>>> +			tops = dw_wdt_fix_tops;
>>>>> +		} else {
>>>>> +			tops = of_tops;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	/*
>>>>> +	 * We'll keep the timeout values in ms to approximate requested
>>>>> +	 * timeouts with better accuracy.
>>>>> +	 */
>>>>> +	for (idx = 0; idx < DW_WDT_NUM_TOPS; ++idx)
>>>>> +		dw_wdt->timeouts[idx] =
>>>>> +			mult_frac(tops[idx], MSEC_PER_SEC, dw_wdt->rate);
>>>>
>>>> tops[idx] type is u32. Its value can be up to 0xffffffff. That means
>>>> dw_wdt->rate must be >= 1000 to avoid overflow, which you should check.
>>>
>>> Right. I don't think that TOPs with timeouts bigger than
>>> 0xffffffff milliseconds have any valuable usecases, so I'll just round
>>> the overflows down to FFs.
>>>
>>
>> Neither do unsorted random timeouts milli-seconds apart. You see the need
>> to address one, so addressing other weaknesses is appropriate.
> 
> Don't really understand what you mean. Do you intend to filter the
> unreachable timeouts out from the timeouts array? If so this isn't
> possible with current design. I would have to implement a more complex
> data structure, like an array of pairs {TOP, timeout} and refactor the
> timeout search algorithm. Don't really think this optimization is required
> seeing watchdog timeout set operation is normally performed just a few times
> per watchdog usage session.
> 

You state that defining a tops[idx] value > 0xffffffff / 1000 would be
unreasonable, while at the same time you argue that a sequence of tops[idx]
values of, say, 45, 46, 47, 43, 42, 99, 98, 55 would be perfectly reasonable
and needs to be handled. All I am saying is that you need to deal with all odd
cases, and that you can not assume that there is no tops[idx] value that results
in an overflow. If "45, 46, 47, 43, 42, 99, 98, 55" is reasonable, so is
0xffffffff.

Guenter
