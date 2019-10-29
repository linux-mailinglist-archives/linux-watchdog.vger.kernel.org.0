Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E81E8973
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 14:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfJ2N2f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 09:28:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45683 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ2N2e (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 09:28:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id c7so8414266pfo.12;
        Tue, 29 Oct 2019 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GCDhOdMxr85O3msuI3+nUJ2Ne0BfGf3lpETXl1wRKd8=;
        b=QYOxL2v0VMygFhR/HLTRU3MnC+8DXDu1fjLfH54tV9yv3lL/KN0hsdkYpbVdS/BA8Y
         N/ysk5cMk6NDPS1BICIaThvzu2kThlHmczTqiQ+G3MVEAwEY3rbtoajAROxqI6LMGG+v
         1+rel+ABU+ePaZQN5otOQW+0GGkOf1gTRMf9ydaGSjFbp/2QsV+uO1pB9IG/vY+r3RUf
         /PTI7v0HsR8iOXwiGgkwibsLiWQJ51QMRgKtv/WD9x1ezpGKCsASWsKlzQjwrOpAgxdO
         rZOiQHQDMnoqVZzAec6bhFJaGK0q0cDveUeMkZygwGNoKPpmg6npnKgU939J+20ZRvLS
         flMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=GCDhOdMxr85O3msuI3+nUJ2Ne0BfGf3lpETXl1wRKd8=;
        b=LNyZyVUkFUWi+UQeaCuEzw4JlCZ+IKjZBBcosP3XEu8bHZIlAKetNQ9Y3fXAlYUAsb
         3768h/L9lFbf9nOV/9Qb2FxfaSNaBU/zxddKXcGHOIlGZY+8CJDDMfIJC4cYMnULafw/
         Hn92Br8ENwO9VSW62UCWm2I0gm4XZeGBOQCH+5BR/YhnI6BTcgbnQlcr3NdKShH1ecl7
         O7w3AMpIycRaI949MhzFIA4psioOlcRnrBxLOkwopx18aQQh/SMMm7+Vfbz3msj93ptD
         Xw/KmbdqxklYUzCt8sF1w7I02K0/M4Cu0aMsVcU5TD41PVU18rLbbiRuT7Il5GAwqiQL
         fZUw==
X-Gm-Message-State: APjAAAUEKKi+Kx/L6IKeXdW+qApx7YDaRF+wss6lSEQH90DqGPb2cjor
        ebR3EAJuP5VxybKNG5bxLhf3NTw8
X-Google-Smtp-Source: APXvYqyk8I6qxU2Btly1TSSuxsSM3y5AhmxmLdm20bpbOYhrBqAUnqL89P+lZLpMjMY9W3SfbAJcrw==
X-Received: by 2002:a63:fe06:: with SMTP id p6mr8181830pgh.245.1572355713775;
        Tue, 29 Oct 2019 06:28:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b17sm15429891pfr.17.2019.10.29.06.28.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 06:28:33 -0700 (PDT)
Date:   Tue, 29 Oct 2019 06:28:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Message-ID: <20191029132831.GA5643@roeck-us.net>
References: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
 <1571648890-15140-2-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571648890-15140-2-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 21, 2019 at 09:14:09AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add support for SAM9X60 WDT into sama5d4_wdt.
> This means that this driver will have a platform data that will
> hold differences.
> Added definitions of different bits.
> The ops functions will differentiate between the two hardware blocks.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> 
> Hello,
> 
> This is a rework of the separate sam9x60 watchdog driver into a single driver
> that supports both hardware blocks (sam9x60 and sama5d4)
> This was done as suggested on the original patches on the mailing list.
> 
> Thanks,
> Eugen
> 
>  drivers/watchdog/at91sam9_wdt.h |  14 +++++
>  drivers/watchdog/sama5d4_wdt.c  | 127 +++++++++++++++++++++++++++++++---------
>  2 files changed, 112 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 390941c..7a053fd 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -20,7 +20,10 @@
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>  #define		AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
>  #define			AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define		AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
> +#define		AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>  #define		AT91_WDT_WDFIEN		(1     << 12)		/* Fault Interrupt Enable */
> +#define		AT91_SAM9X60_WDDIS		BIT(12)		/* Disable */
>  #define		AT91_WDT_WDRSTEN	(1     << 13)		/* Reset Processor */
>  #define		AT91_WDT_WDRPROC	(1     << 14)		/* Timer Restart */
>  #define		AT91_WDT_WDDIS		(1     << 15)		/* Watchdog Disable */
> @@ -33,4 +36,15 @@
>  #define		AT91_WDT_WDUNF		(1 << 0)		/* Watchdog Underflow */
>  #define		AT91_WDT_WDERR		(1 << 1)		/* Watchdog Error */
>  
> +#define AT91_SAM9X60_VR		0x08			/* Watchdog Timer Value Register */
> +
> +#define AT91_SAM9X60_WLR		0x0c
> +#define		AT91_SAM9X60_COUNTER	(0xfff << 0)		/* Watchdog Period Value */
> +#define		AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
> +
> +#define AT91_SAM9X60_IER		0x14			/* Interrupt Enable Register */
> +#define		AT91_SAM9X60_PERINT		BIT(0)		/* Period Interrupt Enable */
> +#define AT91_SAM9X60_IDR		0x18			/* Interrupt Disable Register */
> +#define AT91_SAM9X60_ISR		0x1c			/* Interrupt Status Register */
> +

Those tabs are getting messy, and the mix of BIT() and shift is messy too.
Mind cleaning it up a bit ? Especially, two tabs after #define doesn't really
add value (use two spaces), and use BIT() throughout or not at all.

>  #endif
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index d193a60..b92afd7 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -2,7 +2,7 @@
>  /*
>   * Driver for Atmel SAMA5D4 Watchdog Timer
>   *
> - * Copyright (C) 2015 Atmel Corporation
> + * Copyright (C) 2015-2019 Microchip Technology Inc. and its subsidiaries
>   */
>  
>  #include <linux/delay.h>
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/reboot.h>
> @@ -25,11 +26,18 @@
>  
>  #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
>  
> +struct sama5d4_wdt_data {
> +	const unsigned int		sam9x60_support;
> +};
> +
>  struct sama5d4_wdt {
> -	struct watchdog_device	wdd;
> -	void __iomem		*reg_base;
> -	u32			mr;
> -	unsigned long		last_ping;
> +	struct watchdog_device		wdd;
> +	const struct sama5d4_wdt_data	*data;
> +	void __iomem			*reg_base;
> +	u32				mr;
> +	u32				ir;
> +	unsigned long			last_ping;
> +	unsigned int			need_irq:1;

This can be a bool. Making it a bit just adds complexity to the code.

>  };
>  
>  static int wdt_timeout;
> @@ -78,7 +86,12 @@ static int sama5d4_wdt_start(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	wdt->mr &= ~AT91_WDT_WDDIS;
> +	if (wdt->data->sam9x60_support) {
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
> +		wdt->mr &= ~AT91_SAM9X60_WDDIS;
> +	} else {
> +		wdt->mr &= ~AT91_WDT_WDDIS;
> +	}
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
> @@ -88,7 +101,12 @@ static int sama5d4_wdt_stop(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	wdt->mr |= AT91_WDT_WDDIS;
> +	if (wdt->data->sam9x60_support) {
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
> +		wdt->mr |= AT91_SAM9X60_WDDIS;
> +	} else {
> +		wdt->mr |= AT91_WDT_WDDIS;
> +	}
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
> @@ -109,6 +127,14 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  	u32 value = WDT_SEC2TICKS(timeout);
>  
> +	if (wdt->data->sam9x60_support) {
> +		wdt_write(wdt, AT91_SAM9X60_WLR,
> +			  AT91_SAM9X60_SET_COUNTER(value));
> +
> +		wdd->timeout = timeout;
> +		return 0;
> +	}
> +
>  	wdt->mr &= ~AT91_WDT_WDV;
>  	wdt->mr |= AT91_WDT_SET_WDV(value);
>  
> @@ -143,8 +169,14 @@ static const struct watchdog_ops sama5d4_wdt_ops = {
>  static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
>  {
>  	struct sama5d4_wdt *wdt = platform_get_drvdata(dev_id);
> +	u32 reg;
>  
> -	if (wdt_read(wdt, AT91_WDT_SR)) {
> +	if (wdt->data->sam9x60_support)
> +		reg = wdt_read(wdt, AT91_SAM9X60_ISR);
> +	else
> +		reg = wdt_read(wdt, AT91_WDT_SR);
> +
> +	if (reg) {
>  		pr_crit("Atmel Watchdog Software Reset\n");
>  		emergency_restart();
>  		pr_crit("Reboot didn't succeed\n");
> @@ -157,13 +189,14 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>  {
>  	const char *tmp;
>  
> -	wdt->mr = AT91_WDT_WDDIS;
> +	if (wdt->data->sam9x60_support)
> +		wdt->mr = AT91_SAM9X60_WDDIS;
> +	else
> +		wdt->mr = AT91_WDT_WDDIS;
>  
>  	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
>  	    !strcmp(tmp, "software"))
> -		wdt->mr |= AT91_WDT_WDFIEN;
> -	else
> -		wdt->mr |= AT91_WDT_WDRSTEN;
> +		wdt->need_irq = 1;
>  
>  	if (of_property_read_bool(np, "atmel,idle-halt"))
>  		wdt->mr |= AT91_WDT_WDIDLEHLT;
> @@ -176,21 +209,46 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>  
>  static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
>  {
> -	u32 reg;
> +	u32 reg, val;
> +
> +	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
>  	/*
>  	 * When booting and resuming, the bootloader may have changed the
>  	 * watchdog configuration.
>  	 * If the watchdog is already running, we can safely update it.
>  	 * Else, we have to disable it properly.
>  	 */
> -	if (wdt_enabled) {
> -		wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
> -	} else {
> +	if (!wdt_enabled) {
>  		reg = wdt_read(wdt, AT91_WDT_MR);
> -		if (!(reg & AT91_WDT_WDDIS))
> +		if (wdt->data->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
> +			wdt_write_nosleep(wdt, AT91_WDT_MR,
> +					  reg | AT91_SAM9X60_WDDIS);
> +		else if (!wdt->data->sam9x60_support &&
> +			 (!(reg & AT91_WDT_WDDIS)))
>  			wdt_write_nosleep(wdt, AT91_WDT_MR,
>  					  reg | AT91_WDT_WDDIS);
>  	}
> +
> +	if (wdt->data->sam9x60_support) {
> +		if (wdt->need_irq)
> +			wdt->ir = AT91_SAM9X60_PERINT;
> +		else
> +			wdt->mr |= AT91_SAM9X60_PERIODRST;
> +
> +		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
> +		wdt_write(wdt, AT91_SAM9X60_WLR, AT91_SAM9X60_SET_COUNTER(val));
> +	} else {
> +		wdt->mr |= AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
> +		wdt->mr |= AT91_WDT_SET_WDV(val);
> +
> +		if (wdt->need_irq)
> +			wdt->mr |= AT91_WDT_WDFIEN;
> +		else
> +			wdt->mr |= AT91_WDT_WDRSTEN;
> +	}
> +
> +	wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
> +
>  	return 0;
>  }
>  
> @@ -201,13 +259,14 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	struct sama5d4_wdt *wdt;
>  	void __iomem *regs;
>  	u32 irq = 0;
> -	u32 timeout;
>  	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
>  		return -ENOMEM;
>  
> +	wdt->data = of_device_get_match_data(&pdev->dev);
> +
>  	wdd = &wdt->wdd;
>  	wdd->timeout = WDT_DEFAULT_TIMEOUT;
>  	wdd->info = &sama5d4_wdt_info;
> @@ -224,15 +283,17 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  
>  	wdt->reg_base = regs;
>  
> -	irq = irq_of_parse_and_map(dev->of_node, 0);
> -	if (!irq)
> -		dev_warn(dev, "failed to get IRQ from DT\n");
> -
>  	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
>  	if (ret)
>  		return ret;
>  
> -	if ((wdt->mr & AT91_WDT_WDFIEN) && irq) {
> +	irq = irq_of_parse_and_map(dev->of_node, 0);
> +	if (!irq) {
> +		dev_warn(dev, "failed to get IRQ from DT\n");
> +		wdt->need_irq = 0;

Does it make sense to ignore that ?

> +	}
> +
> +	if (wdt->need_irq) {
>  		ret = devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
>  				       IRQF_SHARED | IRQF_IRQPOLL |
>  				       IRQF_NO_SUSPEND, pdev->name, pdev);
> @@ -244,11 +305,6 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_init_timeout(wdd, wdt_timeout, dev);
>  
> -	timeout = WDT_SEC2TICKS(wdd->timeout);
> -
> -	wdt->mr |= AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
> -	wdt->mr |= AT91_WDT_SET_WDV(timeout);
> -
>  	ret = sama5d4_wdt_init(wdt);
>  	if (ret)
>  		return ret;
> @@ -268,8 +324,21 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static struct sama5d4_wdt_data sama5d4_config;
> +
> +static struct sama5d4_wdt_data sam9x60_config = {
> +	.sam9x60_support = 1,
> +};

Unless there is reason to believe that there will be other
configuration data, please just assign the flag value directly
to .data and add a variable to struct sama5d4_wdt to access it.
Please make that variable a bool.

> +
>  static const struct of_device_id sama5d4_wdt_of_match[] = {
> -	{ .compatible = "atmel,sama5d4-wdt", },
> +	{
> +		.compatible = "atmel,sama5d4-wdt",
> +		.data = &sama5d4_config,
> +	},
> +	{
> +		.compatible = "microchip,sam9x60-wdt",
> +		.data = &sam9x60_config,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
