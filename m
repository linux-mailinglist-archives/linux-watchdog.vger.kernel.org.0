Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D604CA1A5E
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2019 14:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfH2MqI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Aug 2019 08:46:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35695 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfH2MqH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Aug 2019 08:46:07 -0400
Received: by mail-pl1-f196.google.com with SMTP id gn20so1536641plb.2;
        Thu, 29 Aug 2019 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ytw5oM6/0UNrrgMY7YKw3kXMYdeOKbrMd7NM/PN006U=;
        b=cekFe4Uwo6VfhBdfjynyshToBln1E/pkApGZYB8S+NkWSCwarIT3fN1XLETPtheTaS
         4hEaciid81F4yn0zCr8iVQh54YsIOeq1Lkz1BUgzwWoH4wZvcu6qxGgtL8vopc9bPcvO
         ggIh+5/xuSffuAuFNxBb/hxR1ivkouM6Qn8tOz1fb3AoH3lJYE4/CnpgIskA2gVcrMcs
         PvKSUiAa80KV5q0uVQasaUQZmfVhZSFRSL5oCqB9m0sX2kur+2tEwMBKpIhkwqswN0B7
         DWqwdRiPVpj86Kd0Nm7vZiRHHkHFwidu2QzeagegQpM6oOsIgAvyPyA9jwNhijyYTvG8
         H4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ytw5oM6/0UNrrgMY7YKw3kXMYdeOKbrMd7NM/PN006U=;
        b=S95WnoqoePKbUFhCZ47RGmJAn0k4HRIfEgpSkO4C5LDGQt9M/IIOhVEFbqxkLpfjow
         /Xtaw7c/2BzI2+yo3OCVg5UGJ5xhBVjIy9H1cfBza1JQo6x0CZFN0GQVRPlm5VBEAYlc
         ITrsd5sAQt1ZkRoV70kiT/vtQxgUvvt/0LqBc4I65HQMH9YeWMDKHMYqCKvNYCuwh8ok
         NarPYRR9ZfLhf8qtSp/6GYDa5A2PydKlVqEby3C3N7S3IiEcGI2d0+AnUM2wjQhjhtmI
         frzN1He11+7UGb7YaOnP0JTcIS8biOs5ZbCOCsmyBFV7gf7ScxfthrFKA96bHb9pKEUy
         EWCg==
X-Gm-Message-State: APjAAAX+zU8w7HRwD/+y8pxX8dNRVnC8l/KkOCIsmpK94ZOGyY0RBhr6
        hLJ/6woLzrYeMVBSYKeg6caAR6UJ
X-Google-Smtp-Source: APXvYqw+FLjGay1zj1Ujue1rPNfIC25ZNvGguPcwJYKDhLmAN9+xDaVMQ6mjq++xFm+eLYXAgVA15w==
X-Received: by 2002:a17:902:1105:: with SMTP id d5mr9896229pla.197.1567082766859;
        Thu, 29 Aug 2019 05:46:06 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id v184sm2497989pgd.34.2019.08.29.05.46.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 05:46:06 -0700 (PDT)
Subject: Re: [PATCH v5] watchdog: orion_wdt: use timer1 as a pretimeout
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190829085042.30886-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <eb3c9f1b-5a60-cb36-8cc5-6a83bf9678ba@roeck-us.net>
Date:   Thu, 29 Aug 2019 05:46:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829085042.30886-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/29/19 1:50 AM, Chris Packham wrote:
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
> Changes in v5:
> - Group bit values with register addresses
> - Address review comments from Gunter
> Changes in v4:
> - rebase against linux/master
> Changes in v2:
> - apply changes to armada-38x only
> 
>   drivers/watchdog/orion_wdt.c | 65 ++++++++++++++++++++++++++++--------
>   1 file changed, 52 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index cdb0d174c5e2..5a23cb448ed5 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -35,7 +35,15 @@
>    * Watchdog timer block registers.
>    */
>   #define TIMER_CTRL		0x0000
> -#define TIMER_A370_STATUS	0x04
> +#define TIMER1_FIXED_ENABLE_BIT	BIT(12)
> +#define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
> +#define TIMER1_ENABLE_BIT	BIT(2)
> +
> +#define TIMER_A370_STATUS	0x0004
> +#define WDT_A370_EXPIRED	BIT(31)
> +#define TIMER1_STATUS_BIT	BIT(8)
> +
> +#define TIMER1_VAL_OFF		0x001c
>   
>   #define WDT_MAX_CYCLE_COUNT	0xffffffff
>   
> @@ -43,9 +51,6 @@
>   #define WDT_A370_RATIO_SHIFT	5
>   #define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
>   
> -#define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
> -#define WDT_A370_EXPIRED	BIT(31)
> -
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
> @@ -168,10 +174,9 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>   		return ret;
>   	}
>   
> -	/* Enable the fixed watchdog clock input */
> -	atomic_io_modify(dev->reg + TIMER_CTRL,
> -			 WDT_AXP_FIXED_ENABLE_BIT,
> -			 WDT_AXP_FIXED_ENABLE_BIT);
> +	/* Fix the wdt and timer1 clock freqency to 25MHz */
> +	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>   
>   	dev->clk_rate = clk_get_rate(dev->clk);
>   	return 0;
> @@ -183,6 +188,10 @@ static int orion_wdt_ping(struct watchdog_device *wdt_dev)
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
> @@ -194,13 +203,18 @@ static int armada375_start(struct watchdog_device *wdt_dev)
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
> +	reg = dev->data->wdt_enable_bit;
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		reg |= TIMER1_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, reg, reg);
>   
>   	/* Enable reset on watchdog */
>   	reg = readl(dev->rstout);
> @@ -277,7 +291,7 @@ static int orion_stop(struct watchdog_device *wdt_dev)
>   static int armada375_stop(struct watchdog_device *wdt_dev)
>   {
>   	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> -	u32 reg;
> +	u32 reg, mask;
>   
>   	/* Disable reset on watchdog */
>   	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit,
> @@ -287,7 +301,10 @@ static int armada375_stop(struct watchdog_device *wdt_dev)
>   	writel(reg, dev->rstout);
>   
>   	/* Disable watchdog timer */
> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
> +	mask = dev->data->wdt_enable_bit;
> +	if (wdt_dev->info->options & WDIOF_PRETIMEOUT)
> +		mask &= ~TIMER1_ENABLE_BIT;

Sorry, I am lost. Why &= and ~ ?

Guenter

> +	atomic_io_modify(dev->reg + TIMER_CTRL, mask, 0);
>   
>   	return 0;
>   }
> @@ -349,7 +366,7 @@ static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>   	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
>   }
>   
> -static const struct watchdog_info orion_wdt_info = {
> +static struct watchdog_info orion_wdt_info = {
>   	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>   	.identity = "Orion Watchdog",
>   };
> @@ -368,6 +385,16 @@ static irqreturn_t orion_wdt_irq(int irq, void *devid)
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
> @@ -589,6 +616,18 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	irq = platform_get_irq(pdev, 1);
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

