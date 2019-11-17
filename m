Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA0AFFA95
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Nov 2019 16:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfKQPvE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Nov 2019 10:51:04 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35436 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfKQPvD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Nov 2019 10:51:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so8222849plp.2;
        Sun, 17 Nov 2019 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mvk/5+HyZMsINjvl36l4CuYhFZhGbr+Nf6h8r+h9gJo=;
        b=U0nnKQsnNv10OeJGYPFYAqV/qnLe3nqYhxcv5DtJ80VTsh/3USZwXSSuomZt4Oo/eS
         YDwlPZ/Q8bBSGwGZLwcbhgwGL931dsZ7SXY92pOy8S7ut03lpqPra9e+OLGFdZBDBCxR
         XkR2oGnqEPGl/ahRiVIflPYLShyovk0A2/qUTyPbIdD7BGS5kLmTuN807RKVQZVsvYs+
         kEpguJnDRbeMA1Wg+tpNsDadL8qVWYYJTZ0T/L0AbVNib1hIkAqQpPfFUBKuILKC+jeq
         reaP+94aDH0t40Dm9FlCdOM3MjVN/ojc6D7JsSBwY0qDf4aVF7IJPOdulax+4UsRGnis
         k1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mvk/5+HyZMsINjvl36l4CuYhFZhGbr+Nf6h8r+h9gJo=;
        b=M8uoUa2viXQG83Oks0r4KpM3gnjlbA09z3glJXnQIugk4rnt+JQL3P8rXJrM3acVJr
         b/6P/Ktvpm+6ZWvDAJCpy4BFRw/sfhsdgT3LkTbgPULELpmAOd2zmPmxahsB7aamdtLD
         7wjyKTgCili0uYdUgTODFfOAA775jYeK91djVAEGsje0DycUyLbsBdG7U9SRw9LIB4nc
         HQsFTNX+2W69s4VO1ZenYB0cli2kgBlqYKQxpoJVKWwFw4CLGuNCDmjAcg3S9l6FMl7H
         56ScRhdhpCtBs1/l3QH0c71BVPxX+/cayPwJCn4OEJUc4YpbcPrWUxIIAdlHUAU+F4iu
         3XUA==
X-Gm-Message-State: APjAAAVeTMtyAnb6TpgE49yRN6+P/de6T53792h8XbF3/EJBA1GYCinn
        3GNuhThQf7SHkLmTyKg97eE=
X-Google-Smtp-Source: APXvYqxYtuBxWqrexEp5vsffMEa2Xgqw/Tgjel/l1SJd1fKj9l9+yy/mPEbgSLZCjvCuIu838hDiGg==
X-Received: by 2002:a17:902:6ac9:: with SMTP id i9mr25443999plt.218.1574005862482;
        Sun, 17 Nov 2019 07:51:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1sm16706132pjc.23.2019.11.17.07.51.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 07:51:01 -0800 (PST)
Subject: Re: [PATCH v2 1/3] watchdog: jz4740: Use WDT clock provided by TCU
 driver
To:     Paul Cercueil <paul@crapouillou.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        Artur Rojek <contact@artur-rojek.eu>
References: <20191023174714.14362-1-paul@crapouillou.net>
 <1573926653.3.0@crapouillou.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0567a89d-bc2d-849c-17ac-0c8bd4735d56@roeck-us.net>
Date:   Sun, 17 Nov 2019 07:51:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573926653.3.0@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/16/19 9:50 AM, Paul Cercueil wrote:
> Hi Guenter,
> 
> I noticed you already acked all the patches in the V1 but expected them to go through the MIPS tree; could you take them into your tree instead?
> 
Hmm, I seem to recall there was a reason for it to go through the mips tree.
Maybe that reason no longer exists. I added the series to my watchdog-next
tree for Wim to pick up. We'll see what 0-day has to say.

Guenter

> Cheers,
> -Paul
> 
> 
> Le mer., oct. 23, 2019 at 19:47, Paul Cercueil <paul@crapouillou.net> a écrit :
>> Instead of requesting the "ext" clock and handling the watchdog clock
>> divider and gating in the watchdog driver, we now request and use the
>> "wdt" clock that is supplied by the ingenic-timer "TCU" driver.
>>
>> The major benefit is that the watchdog's clock rate and parent can now
>> be specified from within devicetree, instead of hardcoded in the driver.
>>
>> Also, this driver won't poke anymore into the TCU registers to
>> enable/disable the clock, as this is now handled by the TCU driver.
>>
>> On the bad side, we break the ABI with devicetree - as we now request a
>> different clock. In this very specific case it is still okay, as every
>> Ingenic JZ47xx-based board out there compile the devicetree within the
>> kernel; so it's still time to push breaking changes, in order to get a
>> clean devicetree that won't break once it musn't.
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Tested-by: Artur Rojek <contact@artur-rojek.eu>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>
>> Notes:
>>     v2: Rebase on top of 5.4-rc4
>>
>>  drivers/watchdog/Kconfig      |  1 +
>>  drivers/watchdog/jz4740_wdt.c | 75 ++++++++++++++---------------------
>>  2 files changed, 31 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 58e7c100b6ad..6421187769cf 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1642,6 +1642,7 @@ config INDYDOG
>>  config JZ4740_WDT
>>      tristate "Ingenic jz4740 SoC hardware watchdog"
>>      depends on MACH_JZ4740 || MACH_JZ4780
>> +    depends on COMMON_CLK
>>      select WATCHDOG_CORE
>>      help
>>        Hardware driver for the built-in watchdog timer on Ingenic jz4740 SoCs.
>> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
>> index c6052ae54f32..72920f09f4a7 100644
>> --- a/drivers/watchdog/jz4740_wdt.c
>> +++ b/drivers/watchdog/jz4740_wdt.c
>> @@ -18,19 +18,6 @@
>>  #include <linux/err.h>
>>  #include <linux/of.h>
>>
>> -#include <asm/mach-jz4740/timer.h>
>> -
>> -#define JZ_WDT_CLOCK_PCLK 0x1
>> -#define JZ_WDT_CLOCK_RTC  0x2
>> -#define JZ_WDT_CLOCK_EXT  0x4
>> -
>> -#define JZ_WDT_CLOCK_DIV_1    (0 << TCU_TCSR_PRESCALE_LSB)
>> -#define JZ_WDT_CLOCK_DIV_4    (1 << TCU_TCSR_PRESCALE_LSB)
>> -#define JZ_WDT_CLOCK_DIV_16   (2 << TCU_TCSR_PRESCALE_LSB)
>> -#define JZ_WDT_CLOCK_DIV_64   (3 << TCU_TCSR_PRESCALE_LSB)
>> -#define JZ_WDT_CLOCK_DIV_256  (4 << TCU_TCSR_PRESCALE_LSB)
>> -#define JZ_WDT_CLOCK_DIV_1024 (5 << TCU_TCSR_PRESCALE_LSB)
>> -
>>  #define DEFAULT_HEARTBEAT 5
>>  #define MAX_HEARTBEAT     2048
>>
>> @@ -50,7 +37,8 @@ MODULE_PARM_DESC(heartbeat,
>>  struct jz4740_wdt_drvdata {
>>      struct watchdog_device wdt;
>>      void __iomem *base;
>> -    struct clk *rtc_clk;
>> +    struct clk *clk;
>> +    unsigned long clk_rate;
>>  };
>>
>>  static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
>> @@ -65,32 +53,14 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>                      unsigned int new_timeout)
>>  {
>>      struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>> -    unsigned int rtc_clk_rate;
>> -    unsigned int timeout_value;
>> -    unsigned short clock_div = JZ_WDT_CLOCK_DIV_1;
>> +    u16 timeout_value = (u16)(drvdata->clk_rate * new_timeout);
>>      u8 tcer;
>>
>> -    rtc_clk_rate = clk_get_rate(drvdata->rtc_clk);
>> -
>> -    timeout_value = rtc_clk_rate * new_timeout;
>> -    while (timeout_value > 0xffff) {
>> -        if (clock_div == JZ_WDT_CLOCK_DIV_1024) {
>> -            /* Requested timeout too high;
>> -            * use highest possible value. */
>> -            timeout_value = 0xffff;
>> -            break;
>> -        }
>> -        timeout_value >>= 2;
>> -        clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
>> -    }
>> -
>>      tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
>>      writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
>> -    writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
>>
>>      writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
>>      writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
>> -    writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
>>
>>      if (tcer & TCU_WDT_TCER_TCEN)
>>          writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
>> @@ -102,11 +72,15 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>  static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
>>  {
>>      struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>> +    int ret;
>>      u8 tcer;
>>
>> +    ret = clk_prepare_enable(drvdata->clk);
>> +    if (ret)
>> +        return ret;
>> +
>>      tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
>>
>> -    jz4740_timer_enable_watchdog();
>>      jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>>
>>      /* Start watchdog if it wasn't started already */
>> @@ -121,7 +95,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
>>      struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>>
>>      writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
>> -    jz4740_timer_disable_watchdog();
>> +    clk_disable_unprepare(drvdata->clk);
>>
>>      return 0;
>>  }
>> @@ -162,21 +136,38 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>>      struct device *dev = &pdev->dev;
>>      struct jz4740_wdt_drvdata *drvdata;
>>      struct watchdog_device *jz4740_wdt;
>> +    long rate;
>> +    int ret;
>>
>>      drvdata = devm_kzalloc(dev, sizeof(struct jz4740_wdt_drvdata),
>>                     GFP_KERNEL);
>>      if (!drvdata)
>>          return -ENOMEM;
>>
>> -    if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
>> -        heartbeat = DEFAULT_HEARTBEAT;
>> +    drvdata->clk = devm_clk_get(&pdev->dev, "wdt");
>> +    if (IS_ERR(drvdata->clk)) {
>> +        dev_err(&pdev->dev, "cannot find WDT clock\n");
>> +        return PTR_ERR(drvdata->clk);
>> +    }
>> +
>> +    /* Set smallest clock possible */
>> +    rate = clk_round_rate(drvdata->clk, 1);
>> +    if (rate < 0)
>> +        return rate;
>> +
>> +    ret = clk_set_rate(drvdata->clk, rate);
>> +    if (ret)
>> +        return ret;
>>
>> +    drvdata->clk_rate = rate;
>>      jz4740_wdt = &drvdata->wdt;
>>      jz4740_wdt->info = &jz4740_wdt_info;
>>      jz4740_wdt->ops = &jz4740_wdt_ops;
>> -    jz4740_wdt->timeout = heartbeat;
>>      jz4740_wdt->min_timeout = 1;
>> -    jz4740_wdt->max_timeout = MAX_HEARTBEAT;
>> +    jz4740_wdt->max_timeout = 0xffff / rate;
>> +    jz4740_wdt->timeout = clamp(heartbeat,
>> +                    jz4740_wdt->min_timeout,
>> +                    jz4740_wdt->max_timeout);
>>      jz4740_wdt->parent = dev;
>>      watchdog_set_nowayout(jz4740_wdt, nowayout);
>>      watchdog_set_drvdata(jz4740_wdt, drvdata);
>> @@ -185,12 +176,6 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>>      if (IS_ERR(drvdata->base))
>>          return PTR_ERR(drvdata->base);
>>
>> -    drvdata->rtc_clk = devm_clk_get(dev, "rtc");
>> -    if (IS_ERR(drvdata->rtc_clk)) {
>> -        dev_err(dev, "cannot find RTC clock\n");
>> -        return PTR_ERR(drvdata->rtc_clk);
>> -    }
>> -
>>      return devm_watchdog_register_device(dev, &drvdata->wdt);
>>  }
>>
>> -- 
>> 2.23.0
>>
> 
> 
> 

