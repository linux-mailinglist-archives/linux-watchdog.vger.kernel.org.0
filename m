Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2969BA3CB0
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfH3QzX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:55:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:47065 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbfH3QzX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:55:23 -0400
Received: by mail-pf1-f193.google.com with SMTP id q139so4979122pfc.13;
        Fri, 30 Aug 2019 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uxhSDhOFMCtubNyqUSOxE1i/AaCpvCejOjblYk0TE1E=;
        b=ucYHlmIQfMOy4rBebqky9ZNDpR87gqWM7fE4aE8DaWQgigF+tmGjNm/AG6Nz6ZlIFq
         rF5yyv0LKP8/4ZMZ1P4UB9JFKVU+rLlIOqNARIqg39zQO3bgauo6lQEp+7CQAmHb+QZM
         j6KXhBhUb7QEYEr8bKfusnBMuNLIKK659KjTWZ79xJvE/OQOELIpJV1dblpQioe1oM59
         03XtJbrMHObR7CjgirQPfFQgckq+wk94Glnl/B4PNkSzEUrJAxTSUYPh8dNQqbmBIkgp
         dDznOZspm7/PTFB0xW2ezYSfLyXXfOA5rt536PH6WLgiD60two8J6KhCpUif4F7CGfpO
         YzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=uxhSDhOFMCtubNyqUSOxE1i/AaCpvCejOjblYk0TE1E=;
        b=kzQyWZtMFolz13NZcDfqWxQF6QE/bvbXUO4J7n3WyDoO4XLY9WDqa8uR8g6Owsmb5O
         Ygn0R0T20pHx7RAXflBbm4zPfLuIo3Sqb8maWyGW2UnLctlGDo5eMEGcx3XIb3CqonVx
         FItdMop8lW7VifEslzSkH/qKgb7zpWDjIBTuMha79lcYCqOLY6LyjYQY9RHhuDgfSP4l
         Q89SyxZB4PUYlNcse2sehVMMxxtGw7z+Ky2SX5Beg+csJxDdyz28PZZ3eMfoHcb92TzJ
         HLbd1rVe42E+Hc0CRQowLs5jwG+wwP3nXw6ZjS014+nAQD+FkW+GWjqu4DU79dGuRjDG
         ZJgQ==
X-Gm-Message-State: APjAAAV5amG47B1TC6gmD/PLTIorZAsbFIDf/6wZCoTdF59U5U75dwT8
        3PZ1zC6/knj6vNoHPKLx05A=
X-Google-Smtp-Source: APXvYqxEaDWsI/ocIUa/2mS17VU15m5rm/xcWpj4LHQlHr3vB0hgd5hstROn+FXtTQOU+U7oIwNHmg==
X-Received: by 2002:a63:2447:: with SMTP id k68mr13985260pgk.219.1567184122078;
        Fri, 30 Aug 2019 09:55:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o130sm11001167pfg.171.2019.08.30.09.55.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:55:21 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:55:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] watchdog: orion_wdt: use timer1 as a pretimeout
Message-ID: <20190830165520.GJ7911@roeck-us.net>
References: <20190829215224.27956-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829215224.27956-1-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 30, 2019 at 09:52:24AM +1200, Chris Packham wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v6:
> - Fix bitwise operation in armada375_stop()
> - Add comment about 2nd interrupt being optional
> Changes in v5:
> - Group bit values with register addresses
> - Address review comments from Gunter
> Changes in v3:
> - rebase against linux/master
> Changes in v2:
> - apply changes to armada-38x only
> 
>  drivers/watchdog/orion_wdt.c | 66 +++++++++++++++++++++++++++++-------
>  1 file changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index cdb0d174c5e2..1cccf8eb1c5d 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -35,7 +35,15 @@
>   * Watchdog timer block registers.
>   */
>  #define TIMER_CTRL		0x0000
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
>  #define WDT_MAX_CYCLE_COUNT	0xffffffff
>  
> @@ -43,9 +51,6 @@
>  #define WDT_A370_RATIO_SHIFT	5
>  #define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
>  
> -#define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
> -#define WDT_A370_EXPIRED	BIT(31)
> -
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static int heartbeat = -1;		/* module parameter (seconds) */
>  
> @@ -158,6 +163,7 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>  				   struct orion_watchdog *dev)
>  {
>  	int ret;
> +	u32 val;
>  
>  	dev->clk = of_clk_get_by_name(pdev->dev.of_node, "fixed");
>  	if (IS_ERR(dev->clk))
> @@ -168,10 +174,9 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>  		return ret;
>  	}
>  
> -	/* Enable the fixed watchdog clock input */
> -	atomic_io_modify(dev->reg + TIMER_CTRL,
> -			 WDT_AXP_FIXED_ENABLE_BIT,
> -			 WDT_AXP_FIXED_ENABLE_BIT);
> +	/* Fix the wdt and timer1 clock freqency to 25MHz */
> +	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
>  
>  	dev->clk_rate = clk_get_rate(dev->clk);
>  	return 0;
> @@ -183,6 +188,10 @@ static int orion_wdt_ping(struct watchdog_device *wdt_dev)
>  	/* Reload watchdog duration */
>  	writel(dev->clk_rate * wdt_dev->timeout,
>  	       dev->reg + dev->data->wdt_counter_offset);
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
> +		       dev->reg + TIMER1_VAL_OFF);
> +
>  	return 0;
>  }
>  
> @@ -194,13 +203,18 @@ static int armada375_start(struct watchdog_device *wdt_dev)
>  	/* Set watchdog duration */
>  	writel(dev->clk_rate * wdt_dev->timeout,
>  	       dev->reg + dev->data->wdt_counter_offset);
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
> +		       dev->reg + TIMER1_VAL_OFF);
>  
>  	/* Clear the watchdog expiration bit */
>  	atomic_io_modify(dev->reg + TIMER_A370_STATUS, WDT_A370_EXPIRED, 0);
>  
>  	/* Enable watchdog timer */
> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit,
> -						dev->data->wdt_enable_bit);
> +	reg = dev->data->wdt_enable_bit;
> +	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
> +		reg |= TIMER1_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, reg, reg);
>  
>  	/* Enable reset on watchdog */
>  	reg = readl(dev->rstout);
> @@ -277,7 +291,7 @@ static int orion_stop(struct watchdog_device *wdt_dev)
>  static int armada375_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> -	u32 reg;
> +	u32 reg, mask;
>  
>  	/* Disable reset on watchdog */
>  	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit,
> @@ -287,7 +301,10 @@ static int armada375_stop(struct watchdog_device *wdt_dev)
>  	writel(reg, dev->rstout);
>  
>  	/* Disable watchdog timer */
> -	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
> +	mask = dev->data->wdt_enable_bit;
> +	if (wdt_dev->info->options & WDIOF_PRETIMEOUT)
> +		mask |= TIMER1_ENABLE_BIT;
> +	atomic_io_modify(dev->reg + TIMER_CTRL, mask, 0);
>  
>  	return 0;
>  }
> @@ -349,7 +366,7 @@ static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>  	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
>  }
>  
> -static const struct watchdog_info orion_wdt_info = {
> +static struct watchdog_info orion_wdt_info = {
>  	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
>  	.identity = "Orion Watchdog",
>  };
> @@ -368,6 +385,16 @@ static irqreturn_t orion_wdt_irq(int irq, void *devid)
>  	return IRQ_HANDLED;
>  }
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
>  /*
>   * The original devicetree binding for this driver specified only
>   * one memory resource, so in order to keep DT backwards compatibility
> @@ -589,6 +616,19 @@ static int orion_wdt_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* Optional 2nd interrupt for pretimeout */
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
>  	watchdog_set_nowayout(&dev->wdt, nowayout);
>  	ret = watchdog_register_device(&dev->wdt);
>  	if (ret)
> -- 
> 2.23.0
> 
