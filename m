Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFFEA1A28
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2019 14:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfH2MeT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Aug 2019 08:34:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42391 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbfH2MeT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Aug 2019 08:34:19 -0400
Received: by mail-pf1-f194.google.com with SMTP id i30so1948772pfk.9;
        Thu, 29 Aug 2019 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hoSgxGfLWDjVWQEJCZaqJ3F8kDNAPRCTaMTratSfRP8=;
        b=ueV2/DJA1LOxjEIAFq+h4TtcLWZiShftbeAZ33XNTZXZKruCFcToiivYlcMqfI5SSZ
         hyu/QNabzcRMZ+91u0lMKS+cmezgOvupRlT0Ius/IwBYSir3RWESQsvCx58TMfIeSWrF
         nipPvWWUmNHl3b8hch21xpqvFD2yyWzm3y+7PJXQfTO3aQRpHuexjYTMOS8mwOp3TAk9
         elFrdO2rCObSb8sd6Q2BRbWPbym/uflQfR17bn5OngY0N2wQ8C3c/uZF0ccerdTy40gx
         tA5ETl8dzLZJgyvgIaWgnmpUVZCzEdosNH40XiEfnS6PBRxsmb5RIxfZH1vTV/4bvbzH
         b4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hoSgxGfLWDjVWQEJCZaqJ3F8kDNAPRCTaMTratSfRP8=;
        b=PVKqxbSayC7z4PXlp2+QCW0a+Oc3sxjX1rvpjn8MPvg7LIugnyY8mkgFvaedt4XrdU
         WQ81D2oEA8PiNRez2jjALisCNY6KR4vCOKCwYvYAVk1AVh/YFe6wRhYLE3bTag+xWC6e
         qYC+RIB0ufc3iVobIXo/CNyNZSkw23xelwz6So88neeUiBdLR58uGKp5dLc0c3HNYG7/
         eWnc+EZGNkWvc2dNkNEDZF77BOYq1UF+Nz4Mrnm6Ncp/6RY4pgxfVKMvEqPN54Q3B3CU
         XO5CjRage6RFXbd54oUve8D5cDvQApWfLiWNcD3ZeblarYZPppA32//Ge17be8+3KC3j
         51KQ==
X-Gm-Message-State: APjAAAXgyTSWpxcoo0kH9gtSoejMweAh00fr7YfZo6+35tkR/wzWoA4Z
        Cs4cyTXRxOkYavvg5NCHHAO/G78x
X-Google-Smtp-Source: APXvYqwuWc+qsD5h5xgmjX8MEN9L4+twnTk+SKvBvgw8xzoU+5GlrTe5OOOrrPRvPNp7igxJoKdvbQ==
X-Received: by 2002:a63:6eca:: with SMTP id j193mr7965259pgc.74.1567082057339;
        Thu, 29 Aug 2019 05:34:17 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id e9sm1962307pge.39.2019.08.29.05.34.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 05:34:16 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: orion_wdt: use timer1 as a pretimeout
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20190829015340.25323-1-chris.packham@alliedtelesis.co.nz>
 <40a379bd-030a-26b1-47e1-ad805c2353f6@roeck-us.net>
 <6da9aaef9d1dab3436dc9204edf94ef0782dde00.camel@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ef5d2227-90ad-19d4-5d40-5cd21c669266@roeck-us.net>
Date:   Thu, 29 Aug 2019 05:34:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6da9aaef9d1dab3436dc9204edf94ef0782dde00.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/28/19 10:05 PM, Chris Packham wrote:
> On Wed, 2019-08-28 at 21:45 -0700, Guenter Roeck wrote:
>> On 8/28/19 6:53 PM, Chris Packham wrote:
>>> The orion watchdog can either reset the CPU or generate an interrupt.
>>> The interrupt would be useful for debugging as it provides panic()
>>> output about the watchdog expiry, however if the interrupt is used the
>>> watchdog can't reset the CPU in the event of being stuck in a loop with
>>> interrupts disabled or if the CPU is prevented from accessing memory
>>> (e.g. an unterminated DMA).
>>>
>>> The Armada SoCs have spare timers that aren't currently used by the
>>> Linux kernel. We can use timer1 to provide a pre-timeout ahead of the
>>> watchdog timer and provide the possibility of gathering debug before the
>>> reset triggers.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> This was submitted previously[1], the other patches two from the series have
>>> been picked up but this one seems to have fallen through the gaps.
>>>
>>
>> I had marked it as "under review" but I don't recall why. Maybe it was because
>> it depended on the other patches, but I don't recall, and I didn't keep track
>> of those patches either. Sorry for that.
>>
> 
> No problem. I think it was related to discussions around the other
> patches. I had meant to follow up earlier.
> 
>>> Changes in v3:
>>> - rebase against linux/master
>>> Changes in v2:
>>> - apply changes to armada-38x only
>>>
>>> [1] - https://lore.kernel.org/linux-watchdog/20190305201924.14853-4-chris.packham@alliedtelesis.co.nz/
>>>
>>>    drivers/watchdog/orion_wdt.c | 59 ++++++++++++++++++++++++++++++------
>>>    1 file changed, 50 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
>>> index cdb0d174c5e2..f2e90bfd7186 100644
>>> --- a/drivers/watchdog/orion_wdt.c
>>> +++ b/drivers/watchdog/orion_wdt.c
>>> @@ -46,6 +46,11 @@
>>>    #define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
>>>    #define WDT_A370_EXPIRED	BIT(31)
>>>    
>>> +#define TIMER1_VAL_OFF		0x001c
>>> +#define TIMER1_ENABLE_BIT	BIT(2)
>>> +#define TIMER1_FIXED_ENABLE_BIT	BIT(12)
>>> +#define TIMER1_STATUS_BIT	BIT(8)
>>> +
>>
>> It would be better to group the bits associated with a single register together.
>> The bits above are not associated with TIMER1_VAL_OFF, yet the grouping suggests
>> that this may be the case.
> 
> Will fix.
> 
>>
>>>    static bool nowayout = WATCHDOG_NOWAYOUT;
>>>    static int heartbeat = -1;		/* module parameter (seconds) */
>>>    
>>> @@ -158,6 +163,7 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>>>    				   struct orion_watchdog *dev)
>>>    {
>>>    	int ret;
>>> +	u32 val;
>>>    
>>>    	dev->clk = of_clk_get_by_name(pdev->dev.of_node, "fixed");
>>>    	if (IS_ERR(dev->clk))
>>> @@ -169,38 +175,48 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>>>    	}
>>>    
>>>    	/* Enable the fixed watchdog clock input */
>>> -	atomic_io_modify(dev->reg + TIMER_CTRL,
>>> -			 WDT_AXP_FIXED_ENABLE_BIT,
>>> -			 WDT_AXP_FIXED_ENABLE_BIT);
>>> +	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
>>
>> This always sets TIMER1_FIXED_ENABLE_BIT, but later the enable bit is set
>> only conditionally. I don't know what is correct, but this asks for a comment.
> 
> The fixed part is safe to set. It just means that the rate is constant.
> I'll add a comment.
> 
>>
>>> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>>>    
>>>    	dev->clk_rate = clk_get_rate(dev->clk);
>>> +
>>
>> We can only hope we won't see another patch two days from now where someone
>> removes this added line.
>>
>> I can understand such changes if they fix a checkpatch issue,
>> but otherwise please refrain from whitespace changes.
> 
> I think it was to appease checkpatch, the one below certainly was. If
> it's not needed for checkpatch I'll drop it in the next version.
> 
>>
>>>    	return 0;
>>>    }
>>>    
>>>    static int orion_wdt_ping(struct watchdog_device *wdt_dev)
>>>    {
>>>    	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
>>> +
>>>    	/* Reload watchdog duration */
>>>    	writel(dev->clk_rate * wdt_dev->timeout,
>>>    	       dev->reg + dev->data->wdt_counter_offset);
>>> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
>>> +		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
>>> +		       dev->reg + TIMER1_VAL_OFF);
>>> +
>>>    	return 0;
>>>    }
>>>    
>>>    static int armada375_start(struct watchdog_device *wdt_dev)
>>>    {
>>>    	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
>>> -	u32 reg;
>>> +	u32 reg, val;
>>>    
>>
>> Is the second variable here and below really necessary ?
>>
> 
> No I can use reg.
> 
>>>    	/* Set watchdog duration */
>>>    	writel(dev->clk_rate * wdt_dev->timeout,
>>>    	       dev->reg + dev->data->wdt_counter_offset);
>>> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
>>> +		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
>>> +		       dev->reg + TIMER1_VAL_OFF);
>>>    
>>>    	/* Clear the watchdog expiration bit */
>>>    	atomic_io_modify(dev->reg + TIMER_A370_STATUS, WDT_A370_EXPIRED, 0);
>>>    
>>>    	/* Enable watchdog timer */
>>> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit,
>>> -						dev->data->wdt_enable_bit);
>>> +	val = dev->data->wdt_enable_bit;
>>> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
>>> +		val |= TIMER1_ENABLE_BIT;
>>> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>>>    
>>>    	/* Enable reset on watchdog */
>>>    	reg = readl(dev->rstout);
>>> @@ -277,7 +293,7 @@ static int orion_stop(struct watchdog_device *wdt_dev)
>>>    static int armada375_stop(struct watchdog_device *wdt_dev)
>>>    {
>>>    	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
>>> -	u32 reg;
>>> +	u32 reg, mask;
>>>    
>>>    	/* Disable reset on watchdog */
>>>    	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit,
>>> @@ -287,7 +303,10 @@ static int armada375_stop(struct watchdog_device *wdt_dev)
>>>    	writel(reg, dev->rstout);
>>>    
>>>    	/* Disable watchdog timer */
>>> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
>>> +	mask = dev->data->wdt_enable_bit;
>>> +	if (wdt_dev->info->options & WDIOF_PRETIMEOUT)
>>> +		mask += TIMER1_ENABLE_BIT;
>>
>> FWIW, += is a bit unusual for a mask. Is it guaranteed that
>> the bit is never already set ? Any special reason for using +=
>> instead of |= here, but not above ?
>>
> 
> I have no idea why on earth I used +=, slip of the keyboard perhaps, |=
> is obviously the correct thing to use.
> 
>>> +	atomic_io_modify(dev->reg + TIMER_CTRL, mask, 0);
>>>    
>>>    	return 0;
>>>    }
>>> @@ -349,7 +368,7 @@ static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>>>    	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
>>>    }
>>>    
>>> -static const struct watchdog_info orion_wdt_info = {
>>> +static struct watchdog_info orion_wdt_info = {
>>>    	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>>>    	.identity = "Orion Watchdog",
>>>    };
>>> @@ -368,6 +387,16 @@ static irqreturn_t orion_wdt_irq(int irq, void *devid)
>>>    	return IRQ_HANDLED;
>>>    }
>>>    
>>> +static irqreturn_t orion_wdt_pre_irq(int irq, void *devid)
>>> +{
>>> +	struct orion_watchdog *dev = devid;
>>> +
>>> +	atomic_io_modify(dev->reg + TIMER_A370_STATUS,
>>> +			 TIMER1_STATUS_BIT, 0);
>>> +	watchdog_notify_pretimeout(&dev->wdt);
>>> +	return IRQ_HANDLED;
>>> +}
>>> +
>>>    /*
>>>     * The original devicetree binding for this driver specified only
>>>     * one memory resource, so in order to keep DT backwards compatibility
>>> @@ -589,6 +618,18 @@ static int orion_wdt_probe(struct platform_device *pdev)
>>>    		}
>>>    	}
>>>    
>>> +	irq = platform_get_irq(pdev, 1);
>>
>> platform_get_irq() may return -EPROBE_DEFER. Are you sure you want to ignore
>> the interrupt (and thus disable the pretimeout) if that is the case ?
>>
> 
> In any current system that uses this driver I can't imagine a case
> where we would see -EPROBE_DEFER here and not for the index 0 interrupt
> above. And even then these are SoC interrupt sources so it's unlikely
> that they would be deferred.
> 
> I do need to handle the case where the 2nd irq is not provided (which
> is what I was going for here). IMHO I think it's better to get on with
> things rather than deferring the entire driver probe just because an
> optional feature isn't ready for use. But if you want me to handle
> -EPROBE_DEFER here I will.
> 

Your call, but maybe add a comment to avoid future questions.

Thanks,
Guenter

>>> +	if (irq > 0) {
>>> +		orion_wdt_info.options |= WDIOF_PRETIMEOUT;
>>> +		ret = devm_request_irq(&pdev->dev, irq, orion_wdt_pre_irq,
>>> +				       0, pdev->name, dev);
>>> +		if (ret < 0) {
>>> +			dev_err(&pdev->dev, "failed to request IRQ\n");
>>> +			goto disable_clk;
>>> +		}
>>> +	}
>>> +
>>> +
>>>    	watchdog_set_nowayout(&dev->wdt, nowayout);
>>>    	ret = watchdog_register_device(&dev->wdt);
>>>    	if (ret)
>>>
>>
>>

