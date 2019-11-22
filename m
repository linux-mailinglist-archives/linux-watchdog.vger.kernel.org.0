Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B282B105FF4
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 06:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKVF3F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 00:29:05 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46731 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVF3F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 00:29:05 -0500
Received: by mail-pg1-f194.google.com with SMTP id r18so2772389pgu.13;
        Thu, 21 Nov 2019 21:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LxWfYlOsK8SYuCtxV6P8f0iEPY1doejcu7wglQtrsMQ=;
        b=ID1NL/6jXGNb7H8u6u7jSBgvc9YUktaocc9XZPnyoA7iGpYGGhCm75mqvq1iZvVXLL
         sCReSkgBfW0JT0L0QDIuhiWPGyfF6CrcLTumGwy76XaGDGKSnZly9Dmc1NhmuO16Q4ps
         IzwWwGTpR7N+3iEmQthLSprBphik4x9wTdyg1FxswQizZ0YyCBZs+CZ+K2U1K/RVx3Eg
         4xvslP4XZhyAh09cpHB03mu9j64de9dDkBIcmYyOmDoJtlW+tIo6dCWY7h/zYtew7p0k
         W626te5X6yzAUlGI76VucgTldRIKuWqKbLH+LGsKs1tASWB8Tj4ndGvT0KljMV6zarsD
         GNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LxWfYlOsK8SYuCtxV6P8f0iEPY1doejcu7wglQtrsMQ=;
        b=KP7JdcAKg8l3Aq9hkcMDZuPOwPW0LLpLuX3f98gHSHKdITQblV9F14eRJZtuWbMo4j
         YQXvc6i5wIxbs8LuIEA+Vjc0wBCKtcXTsVmzJMQO5ETq4QvO4t14qr/U8fCmEv1re+aF
         /U+keJ+YLu0vrngp3WsZYPSTSf0WFMvSEIwYvqmhrJwt+VfP0VvDh8Qem/hesy1oFAHp
         S9UWSpn5oUp5Ynk2nxQHkaRmmav/2/6QazqZA/MOCTU63PIsTu+esN0lUZEprmhDwWJh
         QE8KSqhG0ss8AdTKc9gYUrtXJAoY4iWx9+Y3iACzQ2MAXL2yJvIZqueXlRdzp2BNPP9y
         yXzw==
X-Gm-Message-State: APjAAAVAu517PHtTfN9oi/65x0xMHEQsjSSM/c3JjgX3YBsPSat4UwgW
        4ZLIzxFSit3I3mrPoQPkhoM=
X-Google-Smtp-Source: APXvYqzmb7a7ElSTnBjmtfRBznEKvm9KiSrunoPdv7DgVFzYK64p9/Ee0wQmJ5exyNsLP+OD2biuNA==
X-Received: by 2002:a62:545:: with SMTP id 66mr15158430pff.1.1574400543790;
        Thu, 21 Nov 2019 21:29:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y22sm5349584pfn.6.2019.11.21.21.29.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 21:29:03 -0800 (PST)
Date:   Thu, 21 Nov 2019 21:29:02 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas.Ferre@microchip.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 3/3] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Message-ID: <20191122052902.GA21879@roeck-us.net>
References: <1574067012-18559-1-git-send-email-eugen.hristev@microchip.com>
 <1574067012-18559-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574067012-18559-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 18, 2019 at 08:50:36AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add support for SAM9X60 WDT into sama5d4_wdt.
> This means that this driver gets a flag inside the data struct
> that represents the sam9x60 support.
> This flag differentiates between the two hardware blocks, and is set
> according to the compatible of the driver instantiation.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v5:
> - Fixed checkpatch issues for excessive long lines in header file
> 
> Changes in v4:
> - check compatible with different of_ function
> - call irq parse and map only if need_irq
> - changed tabbing in struct defintion
> 
> Changes in v3:
> - changed need_irq to bool, instead of a single bit variable.
> - the platform data config struct is gone now, changed to a pointer to a bool
> to have the sam9x60_support as 'true', pointing to a static bool with true value.
> Can have a better solution than this ?
> - the specific sam9x60_support flag is assigned at probe time, corresponding
> to the flag value in .data
> 
>  drivers/watchdog/at91sam9_wdt.h |  21 ++++++++
>  drivers/watchdog/sama5d4_wdt.c  | 109 +++++++++++++++++++++++++++++++---------
>  2 files changed, 105 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index abfe34d..298d545 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -24,7 +24,10 @@
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>  #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
>  #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
> +#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> +#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
>  #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
>  #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
>  #define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> @@ -37,4 +40,22 @@
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
> +/* Watchdog Timer Value Register */
> +#define AT91_SAM9X60_VR		0x08
> +
> +/* Watchdog Window Level Register */
> +#define AT91_SAM9X60_WLR	0x0c
> +/* Watchdog Period Value */
> +#define  AT91_SAM9X60_COUNTER	(0xfffUL << 0)
> +#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
> +
> +/* Interrupt Enable Register */
> +#define AT91_SAM9X60_IER	0x14
> +/* Period Interrupt Enable */
> +#define  AT91_SAM9X60_PERINT	BIT(0)
> +/* Interrupt Disable Register */
> +#define AT91_SAM9X60_IDR	0x18
> +/* Interrupt Status Register */
> +#define AT91_SAM9X60_ISR	0x1c
> +
>  #endif
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index d193a60..e5d11d6 100644
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
> @@ -29,7 +30,10 @@ struct sama5d4_wdt {
>  	struct watchdog_device	wdd;
>  	void __iomem		*reg_base;
>  	u32			mr;
> +	u32			ir;
>  	unsigned long		last_ping;
> +	bool			need_irq;
> +	bool			sam9x60_support;
>  };
>  
>  static int wdt_timeout;
> @@ -78,7 +82,12 @@ static int sama5d4_wdt_start(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	wdt->mr &= ~AT91_WDT_WDDIS;
> +	if (wdt->sam9x60_support) {
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
> +		wdt->mr &= ~AT91_SAM9X60_WDDIS;
> +	} else {
> +		wdt->mr &= ~AT91_WDT_WDDIS;
> +	}
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
> @@ -88,7 +97,12 @@ static int sama5d4_wdt_stop(struct watchdog_device *wdd)
>  {
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> -	wdt->mr |= AT91_WDT_WDDIS;
> +	if (wdt->sam9x60_support) {
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
> +		wdt->mr |= AT91_SAM9X60_WDDIS;
> +	} else {
> +		wdt->mr |= AT91_WDT_WDDIS;
> +	}
>  	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>  
>  	return 0;
> @@ -109,6 +123,14 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
>  	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>  	u32 value = WDT_SEC2TICKS(timeout);
>  
> +	if (wdt->sam9x60_support) {
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
> @@ -143,8 +165,14 @@ static const struct watchdog_ops sama5d4_wdt_ops = {
>  static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
>  {
>  	struct sama5d4_wdt *wdt = platform_get_drvdata(dev_id);
> +	u32 reg;
>  
> -	if (wdt_read(wdt, AT91_WDT_SR)) {
> +	if (wdt->sam9x60_support)
> +		reg = wdt_read(wdt, AT91_SAM9X60_ISR);
> +	else
> +		reg = wdt_read(wdt, AT91_WDT_SR);
> +
> +	if (reg) {
>  		pr_crit("Atmel Watchdog Software Reset\n");
>  		emergency_restart();
>  		pr_crit("Reboot didn't succeed\n");
> @@ -157,13 +185,14 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>  {
>  	const char *tmp;
>  
> -	wdt->mr = AT91_WDT_WDDIS;
> +	if (wdt->sam9x60_support)
> +		wdt->mr = AT91_SAM9X60_WDDIS;
> +	else
> +		wdt->mr = AT91_WDT_WDDIS;
>  
>  	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
>  	    !strcmp(tmp, "software"))
> -		wdt->mr |= AT91_WDT_WDFIEN;
> -	else
> -		wdt->mr |= AT91_WDT_WDRSTEN;
> +		wdt->need_irq = true;
>  
>  	if (of_property_read_bool(np, "atmel,idle-halt"))
>  		wdt->mr |= AT91_WDT_WDIDLEHLT;
> @@ -176,21 +205,46 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
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
> +		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
> +			wdt_write_nosleep(wdt, AT91_WDT_MR,
> +					  reg | AT91_SAM9X60_WDDIS);
> +		else if (!wdt->sam9x60_support &&
> +			 (!(reg & AT91_WDT_WDDIS)))
>  			wdt_write_nosleep(wdt, AT91_WDT_MR,
>  					  reg | AT91_WDT_WDDIS);
>  	}
> +
> +	if (wdt->sam9x60_support) {
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
> @@ -201,7 +255,6 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	struct sama5d4_wdt *wdt;
>  	void __iomem *regs;
>  	u32 irq = 0;
> -	u32 timeout;
>  	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> @@ -215,6 +268,8 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	wdd->min_timeout = MIN_WDT_TIMEOUT;
>  	wdd->max_timeout = MAX_WDT_TIMEOUT;
>  	wdt->last_ping = jiffies;
> +	wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
> +						       "microchip,sam9x60-wdt");
>  
>  	watchdog_set_drvdata(wdd, wdt);
>  
> @@ -224,15 +279,19 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
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
> +	if (wdt->need_irq) {
> +		irq = irq_of_parse_and_map(dev->of_node, 0);
> +		if (!irq) {
> +			dev_warn(dev, "failed to get IRQ from DT\n");
> +			wdt->need_irq = false;
> +		}
> +	}
> +
> +	if (wdt->need_irq) {
>  		ret = devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
>  				       IRQF_SHARED | IRQF_IRQPOLL |
>  				       IRQF_NO_SUSPEND, pdev->name, pdev);
> @@ -244,11 +303,6 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
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
> @@ -269,7 +323,12 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id sama5d4_wdt_of_match[] = {
> -	{ .compatible = "atmel,sama5d4-wdt", },
> +	{
> +		.compatible = "atmel,sama5d4-wdt",
> +	},
> +	{
> +		.compatible = "microchip,sam9x60-wdt",
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
