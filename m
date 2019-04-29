Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D087FE42A
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 16:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfD2ODf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 10:03:35 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41228 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfD2ODe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 10:03:34 -0400
Received: by mail-pg1-f196.google.com with SMTP id f6so5202436pgs.8;
        Mon, 29 Apr 2019 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uslsFA9EF/SPU5vqGUl5d3XfzpJWBrXq+tyb49DNy70=;
        b=RknxYTxTbl2y3sdmFTGZvViRuVzYyA3yqUXrn8mrAEoAuEB9DtNPs6kr7RRFPv/+4c
         TWOK1wvGiECtE+ngR7lBG6oOOQ3A6AqG+F7pjGNUdKHO/0OYOoasfXy7a3Z771LIKryl
         IBzzH/HJYSytSRf2cReL80QcXfPlVHMVPHesVBMy06tW11wYIqUkdvTyFyYOMgnV8sHF
         o1IMYt8DNhTLANAqhuipc0jvHEeXbfeXYXtpwZKCaDoGMq98h2gEBTPmGOMFcTYFDwKL
         LD7T49hnFiHyU8HHCiBj5mW9h9rp/z8l0tI6LX5WiXiHd5FnbSxq/OHtMiF5NnY8m4MW
         TLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uslsFA9EF/SPU5vqGUl5d3XfzpJWBrXq+tyb49DNy70=;
        b=smKRJbRAsdoCmabQVjWAXsdr/kedHY2lX+FlvaHbCb8u3xBgB4tcz4svgFhZsQJHf4
         bAWFnV05tjAnyNjBpClCKKeKYw7hO/aROyIGouQ4MM4PdrUEyGQ+lpiPu9jhHBiWaJlT
         6mxzBPUR67Lpp99n7kn9cgdaVfvEuIuc6Zqs39e+qjD9KCiFeU3v7igq4QKKQP87ndXO
         6/q0y5Lyeem5or2rnEtW2teQjC/bHx5/tLPD8XRqZgE2G8cFBmJVU7nVt4Fxkcj02P2O
         dOpa26aEAGAnUOGuhdqeQywKkcm/J4MH3u6iGEEmSc4tQk5HDucs75LGT5+uiQCdcRYe
         hNAg==
X-Gm-Message-State: APjAAAVBzYojJ7mtgz6Ft7X4oGqBH5yWAPuvkqJP5TUcna9KT5kn7bw6
        Zfy8JER/dOJi0tQCDuBFltI=
X-Google-Smtp-Source: APXvYqyy2rlHz/74ouEK0vx1NWiUEKkhwkER336hUks05lx2hjYQX6OBLUMoPMS0uJjlFI1o6FEckQ==
X-Received: by 2002:a62:6587:: with SMTP id z129mr64788242pfb.88.1556546613540;
        Mon, 29 Apr 2019 07:03:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g128sm21161pfb.131.2019.04.29.07.03.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 07:03:32 -0700 (PDT)
Subject: Re: [PATCH] watchdog: stm32: add dynamic prescaler support
To:     Ludovic BARRE <ludovic.barre@st.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <1556286075-29496-1-git-send-email-ludovic.Barre@st.com>
 <20190426141651.GA1715@roeck-us.net>
 <192f7556-89e4-68f1-2274-f3bdbe0083ae@st.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <70963a09-377c-e862-dfda-8955b8bf24b8@roeck-us.net>
Date:   Mon, 29 Apr 2019 07:03:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <192f7556-89e4-68f1-2274-f3bdbe0083ae@st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/29/19 6:51 AM, Ludovic BARRE wrote:
> Hi Guenter
> 
> On 4/26/19 4:16 PM, Guenter Roeck wrote:
>> On Fri, Apr 26, 2019 at 03:41:15PM +0200, Ludovic Barre wrote:
>>> From: Ludovic Barre <ludovic.barre@st.com>
>>>
>>> This patch allows to define the max prescaler by compatible.
>>> To set a large range of timeout, the prescaler should be set
>>> dynamically (from the timeout request) to improve the resolution
>>> in order to have a timeout close to the expected value.
>>>
>>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>>> ---
>>>   drivers/watchdog/stm32_iwdg.c | 70 +++++++++++++++++++++++++------------------
>>>   1 file changed, 41 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
>>> index e00e3b3..91d0a89 100644
>>> --- a/drivers/watchdog/stm32_iwdg.c
>>> +++ b/drivers/watchdog/stm32_iwdg.c
>>> @@ -34,18 +34,10 @@
>>>   #define KR_KEY_EWA    0x5555 /* write access enable */
>>>   #define KR_KEY_DWA    0x0000 /* write access disable */
>>> -/* IWDG_PR register bit values */
>>> -#define PR_4        0x00 /* prescaler set to 4 */
>>> -#define PR_8        0x01 /* prescaler set to 8 */
>>> -#define PR_16        0x02 /* prescaler set to 16 */
>>> -#define PR_32        0x03 /* prescaler set to 32 */
>>> -#define PR_64        0x04 /* prescaler set to 64 */
>>> -#define PR_128        0x05 /* prescaler set to 128 */
>>> -#define PR_256        0x06 /* prescaler set to 256 */
>>> +#define PR_SHIFT    2
>>>   /* IWDG_RLR register values */
>>> -#define RLR_MIN        0x07C /* min value supported by reload register */
>>> -#define RLR_MAX        0xFFF /* max value supported by reload register */
>>> +#define RLR_MAX        GENMASK(11, 0) /* max value of reload register */
>>>   /* IWDG_SR register bit mask */
>>>   #define FLAG_PVU    BIT(0) /* Watchdog prescaler value update */
>>> @@ -55,15 +47,28 @@
>>>   #define TIMEOUT_US    100000
>>>   #define SLEEP_US    1000
>>> -#define HAS_PCLK    true
>>> +struct stm32_iwdg_data {
>>> +    bool has_pclk;
>>> +    u32 max_prescaler;
>>> +};
>>> +
>>> +static const struct stm32_iwdg_data stm32_iwdg_data = {
>>> +    .has_pclk = false,
>>> +    .max_prescaler = 256,
>>> +};
>>> +
>>> +static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
>>> +    .has_pclk = true,
>>> +    .max_prescaler = 1024,
>>> +};
>>>   struct stm32_iwdg {
>>>       struct watchdog_device    wdd;
>>> +    const struct stm32_iwdg_data *data;
>>>       void __iomem        *regs;
>>>       struct clk        *clk_lsi;
>>>       struct clk        *clk_pclk;
>>>       unsigned int        rate;
>>> -    bool            has_pclk;
>>>   };
>>>   static inline u32 reg_read(void __iomem *base, u32 reg)
>>> @@ -80,21 +85,30 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
>>>   {
>>>       struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
>>>       u32 val = FLAG_PVU | FLAG_RVU;
>>> -    u32 reload;
>>> +    u32 timeout, presc, iwdg_rlr, iwdg_pr;
>>>       int ret;
>>>       dev_dbg(wdd->parent, "%s\n", __func__);
>>> -    /* prescaler fixed to 256 */
>>> -    reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
>>> -             RLR_MIN, RLR_MAX);
>>> +    timeout = clamp_t(unsigned int, wdd->timeout,
>>> +              wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
>>> +
>>> +    if (timeout != wdd->timeout)
>>> +        dev_warn(wdd->parent, "timeout skrinked to %d\n", timeout);
>>> +
>>
>> Valid values for timeout should be set in the set_timeout function,
>> not here. As such, there is no need for this warning. More specifically,
>> if the selected timeout is between min_timeout and max_hw_heartbeat_ms,
>> and the hardware can not meet the exact requested value, the set_timeout
>> function should adjust wdd->timeout value accordingly.
>>
> 
> Ok, so I will adjust the timeout (with prescaler and reload look-up)
> value in set_timeout function. thanks
> 
>> Example: The requested timeout is 55 seconds, but the hardware can
>> only support either 32 or 64 seconds. The set_timeout function should
>> then set wdd->timeout to either 32 or 64.
>>
>> Furthermore, this is a valid condition. For example, the timeout could
>> be set for one hour (or day), and the maximum heartbeat could be one
>> minute. In that situation, the watchdog core handles heartbeat/ping
>> requests. Again, this does not warrant a warning.
>>
>> On top of all that, if the hardware can not set a minimum timeout of
>> 1 second, min_timeout should not be set to 1 second. It should be set
>> to the actual minimum supportable value if that value is larger than
>> 1 second.
>>
>>> +    presc = DIV_ROUND_UP(timeout * wdt->rate, RLR_MAX + 1);
>>> +
>>> +    /* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
>>> +    presc = roundup_pow_of_two(presc);
>>> +    iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
>>> +    iwdg_rlr = ((timeout * wdt->rate) / presc) - 1;
>>>       /* enable write access */
>>>       reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
>>>       /* set prescaler & reload registers */
>>> -    reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
>>> -    reg_write(wdt->regs, IWDG_RLR, reload);
>>> +    reg_write(wdt->regs, IWDG_PR, iwdg_pr);
>>> +    reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
>>>       reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
>>>       /* wait for the registers to be updated (max 100ms) */
>>> @@ -150,7 +164,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>>>       }
>>>       /* optional peripheral clock */
>>> -    if (wdt->has_pclk) {
>>> +    if (wdt->data->has_pclk) {
>>>           wdt->clk_pclk = devm_clk_get(&pdev->dev, "pclk");
>>>           if (IS_ERR(wdt->clk_pclk)) {
>>>               dev_err(&pdev->dev, "Unable to get pclk clock\n");
>>> @@ -191,8 +205,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
>>>   };
>>>   static const struct of_device_id stm32_iwdg_of_match[] = {
>>> -    { .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
>>> -    { .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
>>> +    { .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
>>> +    { .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
>>>       { /* end node */ }
>>>   };
>>>   MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
>>> @@ -200,20 +214,17 @@ MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
>>>   static int stm32_iwdg_probe(struct platform_device *pdev)
>>>   {
>>>       struct watchdog_device *wdd;
>>> -    const struct of_device_id *match;
>>>       struct stm32_iwdg *wdt;
>>>       struct resource *res;
>>>       int ret;
>>> -    match = of_match_device(stm32_iwdg_of_match, &pdev->dev);
>>> -    if (!match)
>>> -        return -ENODEV;
>>> -
>>>       wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
>>>       if (!wdt)
>>>           return -ENOMEM;
>>> -    wdt->has_pclk = match->data;
>>> +    wdt->data = of_device_get_match_data(&pdev->dev);
>>> +    if (!wdt->data)
>>> +        return -ENODEV;
>>>       /* This is the timer base. */
>>>       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> @@ -231,8 +242,9 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>>>       wdd = &wdt->wdd;
>>>       wdd->info = &stm32_iwdg_info;
>>>       wdd->ops = &stm32_iwdg_ops;
>>> -    wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
>>> -    wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
>>> +    wdd->min_timeout = 1;
>>
>> Is this guaranteed to be no larger than 1 under all circumstances ?
>>
>> [ Not that the old code was necessarily correct - it might have set
>>    min_timeout to 0 if wdt->rate is high ]
> 
> Infact, for not guaranteed the min timeout at 1s, the input clock
> (wdt->rate) should be < at 12Hz.
> 
> On ST micro controller/processor the wdt->rate is based on LSI
> (Low Speed Internal) clock which is defined around 32KHz-39KHz
> 
> I wanted avoid to set 0, due to min_timeout definition
> ("unsigned int" in struct watchdog_device) and comparator used
> in watchdog_timeout_invalid function.
> 
> if the calculated value is < 1 => I could set 1,
> else I round on UP or Down value?
> 

The minimum is 1 second. Other than that, if you want to round it up or
down is really your call. The easiest would probably be to use DIV_ROUND_UP();
that would take care of all situations.

Thanks,
Guenter

> Regards,
> Ludo
> 
>>
>>> +    wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
>>> +                    1000) / wdt->rate;
>>>       wdd->parent = &pdev->dev;
>>>       watchdog_set_drvdata(wdd, wdt);
>>> -- 
>>> 2.7.4
>>>
> 

