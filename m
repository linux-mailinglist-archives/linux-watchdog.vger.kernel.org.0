Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951D1A108F
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2019 06:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfH2EpS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Aug 2019 00:45:18 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38339 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfH2EpS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Aug 2019 00:45:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id w11so993972plp.5;
        Wed, 28 Aug 2019 21:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eAJdWXXwqDC2rYWcpQVpjHu5thURl/neyh9e6T45BNA=;
        b=N2K5EdT2QQVTpqU0+2pBkd40GNeJPdCCgM6r7zwWlxw9kFlVih/OGz3WtS2tFunSh9
         Qmrskcmnka7O7gIllw7gTxx4H6aChtfg/5iWdLUMiB1PcN006rr6Yq7Jrg9Jrx29nnWN
         dq004QXMB4kGrB5DvW76hgTwwwR/PNBgDpptZOz+vnfSZtw/lI6VepfwoBUvy9kfpYSa
         hnXuWA8qaUa2mskaM47qDZoYzILVHl203Xiclz7mKd8XVRULQCxxceNlLZ/F2RgrpdyT
         vF5S0PO3vSC8Vgw4GM5yMYElnezKMu1+axt/cT9ASGbTpqAC+sUq8HpFFi5HPPrgbCKN
         Qc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eAJdWXXwqDC2rYWcpQVpjHu5thURl/neyh9e6T45BNA=;
        b=dPzGtEfM5NIbIkAq3Ky4InCTBbvz++k1scSu4c07WkCviIFvOe3CYzB+ozET8QQR+G
         V/QiW73ot5fpu6p5g0wEPlaC/JVaBPw3Bo/21k5xjeFPKsENqL6RNbxBmOJlcaQaJjNe
         yGXP5pwH60OUDCUFPjrvtVavR1+LSjlvIfsJIM5HD7yC0cICSHcrGI4nkdvptqghyE65
         lb8ZkaI7AL2lm/y/14pTrk8TnZ8Tj4vpzEy0E+WEwZgFaOHt829Cg4AmwVEMu9AtI3iz
         O6M/vlzNZU0UagLA9uxtSreLopux2QvqIQ4n1j8XSje1xfgz1aj739TfZ2IFfBVmnAdV
         u4iA==
X-Gm-Message-State: APjAAAUIdDMSPxhJ8yEn7hkPM68tqgo8JpRUQNvAjazhJT/31IF4gYb2
        7L/ZU20BIjw4k6F9+032iA/6kbea
X-Google-Smtp-Source: APXvYqx5UnwD2Ljo0vaQaK85H5HfUQLM0Cb3ra1RpbpCHd6TEOLH46Udz8tOo00KrSXUZ3t4v8C9eQ==
X-Received: by 2002:a17:902:6b43:: with SMTP id g3mr7897864plt.124.1567053916125;
        Wed, 28 Aug 2019 21:45:16 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id v145sm1210735pfc.31.2019.08.28.21.45.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 21:45:15 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: orion_wdt: use timer1 as a pretimeout
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190829015340.25323-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <40a379bd-030a-26b1-47e1-ad805c2353f6@roeck-us.net>
Date:   Wed, 28 Aug 2019 21:45:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829015340.25323-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/28/19 6:53 PM, Chris Packham wrote:
> The orion watchdog can either reset the CPU or generate an interrupt.
> The interrupt would be useful for debugging as it provides panic()
> output about the watchdog expiry, however if the interrupt is used the
> watchdog can't reset the CPU in the event of being stuck in a loop with
> interrupts disabled or if the CPU is prevented from accessing memory
> (e.g. an unterminated DMA).
> 
> The Armada SoCs have spare timers that aren't currently used by the
> Linux kernel. We can use timer1 to provide a pre-timeout ahead of the
> watchdog timer and provide the possibility of gathering debug before the
> reset triggers.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> This was submitted previously[1], the other patches two from the series have
> been picked up but this one seems to have fallen through the gaps.
> 

I had marked it as "under review" but I don't recall why. Maybe it was because
it depended on the other patches, but I don't recall, and I didn't keep track
of those patches either. Sorry for that.

> Changes in v3:
> - rebase against linux/master
> Changes in v2:
> - apply changes to armada-38x only
> 
> [1] - https://lore.kernel.org/linux-watchdog/20190305201924.14853-4-chris.packham@alliedtelesis.co.nz/
> 
>   drivers/watchdog/orion_wdt.c | 59 ++++++++++++++++++++++++++++++------
>   1 file changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index cdb0d174c5e2..f2e90bfd7186 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -46,6 +46,11 @@
>   #define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
>   #define WDT_A370_EXPIRED	BIT(31)
>   
> +#define TIMER1_VAL_OFF		0x001c
> +#define TIMER1_ENABLE_BIT	BIT(2)
> +#define TIMER1_FIXED_ENABLE_BIT	BIT(12)
> +#define TIMER1_STATUS_BIT	BIT(8)
> +

It would be better to group the bits associated with a single register together.
The bits above are not associated with TIMER1_VAL_OFF, yet the grouping suggests
that this may be the case.

>   static bool nowayout = WATCHDOG_NOWAYOUT;
>   static int heartbeat = -1;		/* module parameter (seconds) */
>   
> @@ -158,6 +163,7 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>   				   struct orion_watchdog *dev)
>   {
>   	int ret;
> +	u32 val;
>   
>   	dev->clk = of_clk_get_by_name(pdev->dev.of_node, "fixed");
>   	if (IS_ERR(dev->clk))
> @@ -169,38 +175,48 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>   	}
>   
>   	/* Enable the fixed watchdog clock input */
> -	atomic_io_modify(dev->reg + TIMER_CTRL,
> -			 WDT_AXP_FIXED_ENABLE_BIT,
> -			 WDT_AXP_FIXED_ENABLE_BIT);
> +	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;

This always sets TIMER1_FIXED_ENABLE_BIT, but later the enable bit is set
only conditionally. I don't know what is correct, but this asks for a comment.

> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>   
>   	dev->clk_rate = clk_get_rate(dev->clk);
> +

We can only hope we won't see another patch two days from now where someone
removes this added line.

I can understand such changes if they fix a checkpatch issue,
but otherwise please refrain from whitespace changes.

>   	return 0;
>   }
>   
>   static int orion_wdt_ping(struct watchdog_device *wdt_dev)
>   {
>   	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> +
>   	/* Reload watchdog duration */
>   	writel(dev->clk_rate * wdt_dev->timeout,
>   	       dev->reg + dev->data->wdt_counter_offset);
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
> +		       dev->reg + TIMER1_VAL_OFF);
> +
>   	return 0;
>   }
>   
>   static int armada375_start(struct watchdog_device *wdt_dev)
>   {
>   	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> -	u32 reg;
> +	u32 reg, val;
>   

Is the second variable here and below really necessary ?

>   	/* Set watchdog duration */
>   	writel(dev->clk_rate * wdt_dev->timeout,
>   	       dev->reg + dev->data->wdt_counter_offset);
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
> +		       dev->reg + TIMER1_VAL_OFF);
>   
>   	/* Clear the watchdog expiration bit */
>   	atomic_io_modify(dev->reg + TIMER_A370_STATUS, WDT_A370_EXPIRED, 0);
>   
>   	/* Enable watchdog timer */
> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit,
> -						dev->data->wdt_enable_bit);
> +	val = dev->data->wdt_enable_bit;
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		val |= TIMER1_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>   
>   	/* Enable reset on watchdog */
>   	reg = readl(dev->rstout);
> @@ -277,7 +293,7 @@ static int orion_stop(struct watchdog_device *wdt_dev)
>   static int armada375_stop(struct watchdog_device *wdt_dev)
>   {
>   	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> -	u32 reg;
> +	u32 reg, mask;
>   
>   	/* Disable reset on watchdog */
>   	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit,
> @@ -287,7 +303,10 @@ static int armada375_stop(struct watchdog_device *wdt_dev)
>   	writel(reg, dev->rstout);
>   
>   	/* Disable watchdog timer */
> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
> +	mask = dev->data->wdt_enable_bit;
> +	if (wdt_dev->info->options & WDIOF_PRETIMEOUT)
> +		mask += TIMER1_ENABLE_BIT;

FWIW, += is a bit unusual for a mask. Is it guaranteed that
the bit is never already set ? Any special reason for using +=
instead of |= here, but not above ?

> +	atomic_io_modify(dev->reg + TIMER_CTRL, mask, 0);
>   
>   	return 0;
>   }
> @@ -349,7 +368,7 @@ static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>   	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
>   }
>   
> -static const struct watchdog_info orion_wdt_info = {
> +static struct watchdog_info orion_wdt_info = {
>   	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>   	.identity = "Orion Watchdog",
>   };
> @@ -368,6 +387,16 @@ static irqreturn_t orion_wdt_irq(int irq, void *devid)
>   	return IRQ_HANDLED;
>   }
>   
> +static irqreturn_t orion_wdt_pre_irq(int irq, void *devid)
> +{
> +	struct orion_watchdog *dev = devid;
> +
> +	atomic_io_modify(dev->reg + TIMER_A370_STATUS,
> +			 TIMER1_STATUS_BIT, 0);
> +	watchdog_notify_pretimeout(&dev->wdt);
> +	return IRQ_HANDLED;
> +}
> +
>   /*
>    * The original devicetree binding for this driver specified only
>    * one memory resource, so in order to keep DT backwards compatibility
> @@ -589,6 +618,18 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	irq = platform_get_irq(pdev, 1);

platform_get_irq() may return -EPROBE_DEFER. Are you sure you want to ignore
the interrupt (and thus disable the pretimeout) if that is the case ?

> +	if (irq > 0) {
> +		orion_wdt_info.options |= WDIOF_PRETIMEOUT;
> +		ret = devm_request_irq(&pdev->dev, irq, orion_wdt_pre_irq,
> +				       0, pdev->name, dev);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to request IRQ\n");
> +			goto disable_clk;
> +		}
> +	}
> +
> +
>   	watchdog_set_nowayout(&dev->wdt, nowayout);
>   	ret = watchdog_register_device(&dev->wdt);
>   	if (ret)
> 

