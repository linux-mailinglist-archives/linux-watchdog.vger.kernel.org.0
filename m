Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A299F914C
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Nov 2019 15:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKLOBr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Nov 2019 09:01:47 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33598 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfKLOBr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Nov 2019 09:01:47 -0500
Received: by mail-pf1-f194.google.com with SMTP id c184so13456597pfb.0;
        Tue, 12 Nov 2019 06:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JgqCofgtJYp0dzpURburNRCFdvpiYcdMiJ7tKd6vmVs=;
        b=TxNPrigQHYZiXVCb/Xlk/evlVYkMRL518dN+GsMVvWQwpk+KyTzeXiJXIAmK/Uyg3q
         5qRlWJEpsR00DCAxkWEDT4tdkOSOBBopZEKjya4BZ8An+ra+Ma5KuQ5nQdhDeZt/gdQm
         +yMBsHZo0/PZ7vvxqJKSk6QYHUNf6Ba7TW4ha1U3zTHbZr969FM40pj4Tu4gNDKUIu6+
         kmZHgg1LttkfVDKtJ3D3Z5172JBrGSpP7/fpJe5I1GlrOSvewWRtODTNsgX768UMwueS
         TSMRLTAqbgpkNZi7yNzSNk7mSBI1TIMBNos8D1pWrCji64eV0S1LrPrMVtGPmts6R0k0
         ZcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JgqCofgtJYp0dzpURburNRCFdvpiYcdMiJ7tKd6vmVs=;
        b=CIh3IEzXvx1iKa3PUb+j29mew06FV6yeHmJRRC++xrhMlFrbsMFP11S76S1IkcCQVy
         mxj2OVYS+PY3oqPtxr3jxVlKwZ0DOCpYFxpl6yPr1T7vjUYfIfZjW9chouLaa2h/5Yfw
         9sez36QdMnrQKOAHDQwahVYRlxc7qcWAS/OKfME9FGTwOOnDApIB1mnuRgGNrELIC2XT
         boIQTJvnfJ5gPRcEuynUKmWBJmI9gFVvrpDtmie/riQ01uzVkgAwaLnbJErzc0HnmN3P
         Lr563jewGh2qeyD9TSA+2LemFFhOyrXKQOhO7dfwcPR2i7MUPd2dNPomwUAN9KYUldAj
         cgqQ==
X-Gm-Message-State: APjAAAVJiQr0j+czm06zO8UyVA96zjbpCRHQWcaIoTUX+fQCeWPDybBn
        Rzgjd3j87hP/KA2fPUTASpSR34Q8
X-Google-Smtp-Source: APXvYqyjaCjUsanq1OzeWh5uvGPoCqQw3p5+IwUGAkVK7/eWVGUplg7bJfA53EqbhLQUl8kFkP/0YA==
X-Received: by 2002:a62:7c52:: with SMTP id x79mr36147155pfc.18.1573567305323;
        Tue, 12 Nov 2019 06:01:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6sm17862433pfa.124.2019.11.12.06.01.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 06:01:44 -0800 (PST)
Subject: Re: [PATCH v3 3/3] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
To:     Eugen.Hristev@microchip.com, robh+dt@kernel.org,
        wim@linux-watchdog.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
 <1573474383-21915-3-git-send-email-eugen.hristev@microchip.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <96cb6c03-d47d-3101-f91e-b2bdce1772fb@roeck-us.net>
Date:   Tue, 12 Nov 2019 06:01:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573474383-21915-3-git-send-email-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/19 4:13 AM, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add support for SAM9X60 WDT into sama5d4_wdt.
> This means that this driver gets a flag inside the data struct
> that represents the sam9x60 support.
> This flag differentiates between the two hardware blocks, and is set
> according to the compatible of the driver instantiation.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v3:
> - changed need_irq to bool, instead of a single bit variable.
> - the platform data config struct is gone now, changed to a pointer to a bool
> to have the sam9x60_support as 'true', pointing to a static bool with true value.
> Can have a better solution than this ?
> - the specific sam9x60_support flag is assigned at probe time, corresponding
> to the flag value in .data
> 
> 
>   drivers/watchdog/at91sam9_wdt.h |  14 +++++
>   drivers/watchdog/sama5d4_wdt.c  | 120 ++++++++++++++++++++++++++++++----------
>   2 files changed, 105 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 2ca5fc5..2a85135 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -20,7 +20,10 @@
>   #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>   #define  AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
>   #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
> +#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>   #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> +#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
>   #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
>   #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
>   #define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> @@ -33,4 +36,15 @@
>   #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>   #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>   
> +#define AT91_SAM9X60_VR		0x08			/* Watchdog Timer Value Register */
> +
> +#define AT91_SAM9X60_WLR		0x0c
> +#define  AT91_SAM9X60_COUNTER	(0xfff << 0)		/* Watchdog Period Value */
> +#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
> +
> +#define AT91_SAM9X60_IER		0x14		/* Interrupt Enable Register */
> +#define  AT91_SAM9X60_PERINT		BIT(0)		/* Period Interrupt Enable */
> +#define AT91_SAM9X60_IDR		0x18		/* Interrupt Disable Register */
> +#define AT91_SAM9X60_ISR		0x1c		/* Interrupt Status Register */
> +
>   #endif
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index d193a60..cf53354 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -2,7 +2,7 @@
>   /*
>    * Driver for Atmel SAMA5D4 Watchdog Timer
>    *
> - * Copyright (C) 2015 Atmel Corporation
> + * Copyright (C) 2015-2019 Microchip Technology Inc. and its subsidiaries
>    */
>   
>   #include <linux/delay.h>
> @@ -11,6 +11,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
>   #include <linux/reboot.h>
> @@ -26,10 +27,13 @@
>   #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
>   
>   struct sama5d4_wdt {
> -	struct watchdog_device	wdd;
> -	void __iomem		*reg_base;
> -	u32			mr;
> -	unsigned long		last_ping;
> +	struct watchdog_device		wdd;

Why add another tab here ? That seems excessive.

> +	void __iomem			*reg_base;
> +	u32				mr;
> +	u32				ir;
> +	unsigned long			last_ping;
> +	bool				need_irq;
> +	bool				sam9x60_support;
>   };
>   
>   static int wdt_timeout;
> @@ -78,7 +82,12 @@ static int sama5d4_wdt_start(struct watchdog_device *wdd)
>   {
>   	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>   
> -	wdt->mr &= ~AT91_WDT_WDDIS;
> +	if (wdt->sam9x60_support) {
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
> +		wdt->mr &= ~AT91_SAM9X60_WDDIS;
> +	} else {
> +		wdt->mr &= ~AT91_WDT_WDDIS;
> +	}
>   	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>   
>   	return 0;
> @@ -88,7 +97,12 @@ static int sama5d4_wdt_stop(struct watchdog_device *wdd)
>   {
>   	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>   
> -	wdt->mr |= AT91_WDT_WDDIS;
> +	if (wdt->sam9x60_support) {
> +		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
> +		wdt->mr |= AT91_SAM9X60_WDDIS;
> +	} else {
> +		wdt->mr |= AT91_WDT_WDDIS;
> +	}
>   	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
>   
>   	return 0;
> @@ -109,6 +123,14 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
>   	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
>   	u32 value = WDT_SEC2TICKS(timeout);
>   
> +	if (wdt->sam9x60_support) {
> +		wdt_write(wdt, AT91_SAM9X60_WLR,
> +			  AT91_SAM9X60_SET_COUNTER(value));
> +
> +		wdd->timeout = timeout;
> +		return 0;
> +	}
> +
>   	wdt->mr &= ~AT91_WDT_WDV;
>   	wdt->mr |= AT91_WDT_SET_WDV(value);
>   
> @@ -143,8 +165,14 @@ static const struct watchdog_ops sama5d4_wdt_ops = {
>   static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
>   {
>   	struct sama5d4_wdt *wdt = platform_get_drvdata(dev_id);
> +	u32 reg;
>   
> -	if (wdt_read(wdt, AT91_WDT_SR)) {
> +	if (wdt->sam9x60_support)
> +		reg = wdt_read(wdt, AT91_SAM9X60_ISR);
> +	else
> +		reg = wdt_read(wdt, AT91_WDT_SR);
> +
> +	if (reg) {
>   		pr_crit("Atmel Watchdog Software Reset\n");
>   		emergency_restart();
>   		pr_crit("Reboot didn't succeed\n");
> @@ -157,13 +185,14 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>   {
>   	const char *tmp;
>   
> -	wdt->mr = AT91_WDT_WDDIS;
> +	if (wdt->sam9x60_support)
> +		wdt->mr = AT91_SAM9X60_WDDIS;
> +	else
> +		wdt->mr = AT91_WDT_WDDIS;
>   
>   	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
>   	    !strcmp(tmp, "software"))
> -		wdt->mr |= AT91_WDT_WDFIEN;
> -	else
> -		wdt->mr |= AT91_WDT_WDRSTEN;
> +		wdt->need_irq = true;
>   
>   	if (of_property_read_bool(np, "atmel,idle-halt"))
>   		wdt->mr |= AT91_WDT_WDIDLEHLT;
> @@ -176,21 +205,46 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
>   
>   static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
>   {
> -	u32 reg;
> +	u32 reg, val;
> +
> +	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
>   	/*
>   	 * When booting and resuming, the bootloader may have changed the
>   	 * watchdog configuration.
>   	 * If the watchdog is already running, we can safely update it.
>   	 * Else, we have to disable it properly.
>   	 */
> -	if (wdt_enabled) {
> -		wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
> -	} else {
> +	if (!wdt_enabled) {
>   		reg = wdt_read(wdt, AT91_WDT_MR);
> -		if (!(reg & AT91_WDT_WDDIS))
> +		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
> +			wdt_write_nosleep(wdt, AT91_WDT_MR,
> +					  reg | AT91_SAM9X60_WDDIS);
> +		else if (!wdt->sam9x60_support &&
> +			 (!(reg & AT91_WDT_WDDIS)))
>   			wdt_write_nosleep(wdt, AT91_WDT_MR,
>   					  reg | AT91_WDT_WDDIS);
>   	}
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
>   	return 0;
>   }
>   
> @@ -200,14 +254,16 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   	struct watchdog_device *wdd;
>   	struct sama5d4_wdt *wdt;
>   	void __iomem *regs;
> +	const void *data;
>   	u32 irq = 0;
> -	u32 timeout;
>   	int ret;
>   
>   	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>   	if (!wdt)
>   		return -ENOMEM;
>   
> +	data = of_device_get_match_data(&pdev->dev);
> +
>   	wdd = &wdt->wdd;
>   	wdd->timeout = WDT_DEFAULT_TIMEOUT;
>   	wdd->info = &sama5d4_wdt_info;
> @@ -215,6 +271,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   	wdd->min_timeout = MIN_WDT_TIMEOUT;
>   	wdd->max_timeout = MAX_WDT_TIMEOUT;
>   	wdt->last_ping = jiffies;
> +	wdt->sam9x60_support = data ? *(bool *)data : false;

	wdt->sam9x60_support = of_device_is_compatible(dev, "microchip,sam9x60-wdt");

should do.

>   
>   	watchdog_set_drvdata(wdd, wdt);
>   
> @@ -224,15 +281,17 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   
>   	wdt->reg_base = regs;
>   
> -	irq = irq_of_parse_and_map(dev->of_node, 0);
> -	if (!irq)
> -		dev_warn(dev, "failed to get IRQ from DT\n");
> -
>   	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
>   	if (ret)
>   		return ret;
>   
> -	if ((wdt->mr & AT91_WDT_WDFIEN) && irq) {
> +	irq = irq_of_parse_and_map(dev->of_node, 0);
> +	if (!irq) {

Why call irq_of_parse_and_map() in the first place if need_irq is false ?
Doesn't this generate an unnecessary warning if need_irq is false and
if there is no interrupt node ?

> +		dev_warn(dev, "failed to get IRQ from DT\n");
> +		wdt->need_irq = false;
> +	}
> +
> +	if (wdt->need_irq) {
>   		ret = devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
>   				       IRQF_SHARED | IRQF_IRQPOLL |
>   				       IRQF_NO_SUSPEND, pdev->name, pdev);
> @@ -244,11 +303,6 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   
>   	watchdog_init_timeout(wdd, wdt_timeout, dev);
>   
> -	timeout = WDT_SEC2TICKS(wdd->timeout);
> -
> -	wdt->mr |= AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
> -	wdt->mr |= AT91_WDT_SET_WDV(timeout);
> -
>   	ret = sama5d4_wdt_init(wdt);
>   	if (ret)
>   		return ret;
> @@ -268,8 +322,16 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static bool sam9x60_config = true;
> +
>   static const struct of_device_id sama5d4_wdt_of_match[] = {
> -	{ .compatible = "atmel,sama5d4-wdt", },
> +	{
> +		.compatible = "atmel,sama5d4-wdt",
> +	},
> +	{
> +		.compatible = "microchip,sam9x60-wdt",
> +		.data = &sam9x60_config,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
> 

