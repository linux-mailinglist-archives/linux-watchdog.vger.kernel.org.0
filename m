Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6416D881CE
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 19:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfHIR6W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 13:58:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41107 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfHIR6V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 13:58:21 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so45089733pls.8;
        Fri, 09 Aug 2019 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wH9aLmxVyeLqH8teBzKQ8Oq3geEAJ0/zb7POyTQ91+A=;
        b=I1ZlMwZuj94yIk7lG9smG5z7QYmTEe1yEN/Cg0ky9TGx7xfwhhm5zyXt7re3+A4HS5
         K9AsRRkywUvKKOtj4io5g2IRee/QIoDw9qWwMJ+bU7kC6I+9J7wkDs6+B8v49ppFMTRe
         RUDkXEIIcQgmvK207NT8vlEsTsZXSaG3mS85DkfnXfd6ew39rPbambzGPLKZgYUGhwJL
         L2IkEhHt1MIOrT3IUdpyIyLf/ywWVU2e/p3dCcTHRz6jwiESaW+f6h9zD0pIzr5BZ6o3
         4JgB8bqwgDlQFrPEAXNwMyWKYCn9koLhc6HBIYupPVG6DtvINlYgNRQ6g2sXpUuZSN9p
         UjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wH9aLmxVyeLqH8teBzKQ8Oq3geEAJ0/zb7POyTQ91+A=;
        b=GLmvy4AHlEZUC/p7vOQUxR+e540D6Ts8VnHlO6BbBZJUZpr+UK0UaVOfp9rqqVzbd6
         E20FycpIH+Wz0CGhjRIAeAJiVrY+ZawWh63NWDolbPM8HlN0aCt2Wk3mvXikReGEuD53
         mQTIPoOslqUYSPmL5MUYOs3e3Q5O0leBItERnyiVV3iP7bMOKI0xL9JfPHyed+XEANko
         GvKAcT8ixPXGs2O8HC6k36QmFCS7Yyyn7egYgMgsfTSSR/S6Vq5OhIDD/ub9FEOjWmQd
         Sowe7w3+JiJDeJ/tZRFuf15RAupOxCir6jqn67coLZXI5rB7okjBbhhc/U5Cl99cVcLa
         dcbw==
X-Gm-Message-State: APjAAAUKX/w02ySsBbHslyQuNEhO3ax+9cYCS7jPd2fg07yLxkyNT8Yo
        Igzy1/i69+nf0EEEiASE/uU=
X-Google-Smtp-Source: APXvYqyBN+/v4tjGLak++NomyUV9Y7N0tO3B9cWK0w9YeT9JKn741MX7ieLvy+lKEJgO8tsL4hzH2A==
X-Received: by 2002:a17:902:449:: with SMTP id 67mr20728447ple.105.1565373501008;
        Fri, 09 Aug 2019 10:58:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m13sm38815673pgn.57.2019.08.09.10.58.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 10:58:20 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:58:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Malaterre <malat@debian.org>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH 1/3] watchdog: jz4740: Use WDT clock provided by TCU
 driver
Message-ID: <20190809175819.GA23562@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
 <20190809115930.6050-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809115930.6050-2-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 01:59:28PM +0200, Paul Cercueil wrote:
> Instead of requesting the "ext" clock and handling the watchdog clock
> divider and gating in the watchdog driver, we now request and use the
> "wdt" clock that is supplied by the ingenic-timer "TCU" driver.
> 
> The major benefit is that the watchdog's clock rate and parent can now
> be specified from within devicetree, instead of hardcoded in the driver.
> 
> Also, this driver won't poke anymore into the TCU registers to
> enable/disable the clock, as this is now handled by the TCU driver.
> 
> On the bad side, we break the ABI with devicetree - as we now request a
> different clock. In this very specific case it is still okay, as every
> Ingenic JZ47xx-based board out there compile the devicetree within the
> kernel; so it's still time to push breaking changes, in order to get a
> clean devicetree that won't break once it musn't.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig      |  1 +
>  drivers/watchdog/jz4740_wdt.c | 75 ++++++++++++++---------------------
>  2 files changed, 31 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 8188963a405b..820d8a472310 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1645,6 +1645,7 @@ config INDYDOG
>  config JZ4740_WDT
>  	tristate "Ingenic jz4740 SoC hardware watchdog"
>  	depends on MACH_JZ4740 || MACH_JZ4780
> +	depends on COMMON_CLK
>  	select WATCHDOG_CORE
>  	help
>  	  Hardware driver for the built-in watchdog timer on Ingenic jz4740 SoCs.
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index d4a90916dd38..07fbd9d96e84 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -18,19 +18,6 @@
>  #include <linux/err.h>
>  #include <linux/of.h>
>  
> -#include <asm/mach-jz4740/timer.h>
> -
> -#define JZ_WDT_CLOCK_PCLK 0x1
> -#define JZ_WDT_CLOCK_RTC  0x2
> -#define JZ_WDT_CLOCK_EXT  0x4
> -
> -#define JZ_WDT_CLOCK_DIV_1    (0 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_4    (1 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_16   (2 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_64   (3 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_256  (4 << TCU_TCSR_PRESCALE_LSB)
> -#define JZ_WDT_CLOCK_DIV_1024 (5 << TCU_TCSR_PRESCALE_LSB)
> -
>  #define DEFAULT_HEARTBEAT 5
>  #define MAX_HEARTBEAT     2048
>  
> @@ -50,7 +37,8 @@ MODULE_PARM_DESC(heartbeat,
>  struct jz4740_wdt_drvdata {
>  	struct watchdog_device wdt;
>  	void __iomem *base;
> -	struct clk *rtc_clk;
> +	struct clk *clk;
> +	unsigned long clk_rate;
>  };
>  
>  static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
> @@ -65,32 +53,14 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  				    unsigned int new_timeout)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
> -	unsigned int rtc_clk_rate;
> -	unsigned int timeout_value;
> -	unsigned short clock_div = JZ_WDT_CLOCK_DIV_1;
> +	u16 timeout_value = (u16)(drvdata->clk_rate * new_timeout);
>  	u8 tcer;
>  
> -	rtc_clk_rate = clk_get_rate(drvdata->rtc_clk);
> -
> -	timeout_value = rtc_clk_rate * new_timeout;
> -	while (timeout_value > 0xffff) {
> -		if (clock_div == JZ_WDT_CLOCK_DIV_1024) {
> -			/* Requested timeout too high;
> -			* use highest possible value. */
> -			timeout_value = 0xffff;
> -			break;
> -		}
> -		timeout_value >>= 2;
> -		clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
> -	}
> -
>  	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
>  	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> -	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
>  
>  	writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
>  	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
> -	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
>  
>  	if (tcer & TCU_WDT_TCER_TCEN)
>  		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
> @@ -102,11 +72,15 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
> +	int ret;
>  	u8 tcer;
>  
> +	ret = clk_prepare_enable(drvdata->clk);
> +	if (ret)
> +		return ret;
> +
>  	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
>  
> -	jz4740_timer_enable_watchdog();
>  	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>  
>  	/* Start watchdog if it wasn't started already */
> @@ -121,7 +95,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
>  	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> -	jz4740_timer_disable_watchdog();
> +	clk_disable_unprepare(drvdata->clk);
>  
>  	return 0;
>  }
> @@ -162,6 +136,8 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct jz4740_wdt_drvdata *drvdata;
>  	struct watchdog_device *jz4740_wdt;
> +	struct resource	*res;
> +	long rate;
>  	int ret;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(struct jz4740_wdt_drvdata),
> @@ -169,15 +145,30 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
> -		heartbeat = DEFAULT_HEARTBEAT;
> +	drvdata->clk = devm_clk_get(&pdev->dev, "wdt");
> +	if (IS_ERR(drvdata->clk)) {
> +		dev_err(&pdev->dev, "cannot find WDT clock\n");
> +		return PTR_ERR(drvdata->clk);
> +	}
> +
> +	/* Set smallest clock possible */
> +	rate = clk_round_rate(drvdata->clk, 1);
> +	if (rate < 0)
> +		return rate;
>  
> +	ret = clk_set_rate(drvdata->clk, rate);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->clk_rate = rate;
>  	jz4740_wdt = &drvdata->wdt;
>  	jz4740_wdt->info = &jz4740_wdt_info;
>  	jz4740_wdt->ops = &jz4740_wdt_ops;
> -	jz4740_wdt->timeout = heartbeat;
>  	jz4740_wdt->min_timeout = 1;
> -	jz4740_wdt->max_timeout = MAX_HEARTBEAT;
> +	jz4740_wdt->max_timeout = 0xffff / rate;
> +	jz4740_wdt->timeout = clamp(heartbeat,
> +				    jz4740_wdt->min_timeout,
> +				    jz4740_wdt->max_timeout);
>  	jz4740_wdt->parent = dev;
>  	watchdog_set_nowayout(jz4740_wdt, nowayout);
>  	watchdog_set_drvdata(jz4740_wdt, drvdata);
> @@ -186,12 +177,6 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(drvdata->base))
>  		return PTR_ERR(drvdata->base);
>  
> -	drvdata->rtc_clk = devm_clk_get(dev, "rtc");
> -	if (IS_ERR(drvdata->rtc_clk)) {
> -		dev_err(dev, "cannot find RTC clock\n");
> -		return PTR_ERR(drvdata->rtc_clk);
> -	}
> -
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>  
