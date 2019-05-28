Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED592CE42
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2019 20:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfE1SMC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 May 2019 14:12:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40556 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfE1SMC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 May 2019 14:12:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id d30so11452964pgm.7;
        Tue, 28 May 2019 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hUt8K2ypPhLBPyqRkbVgCT5Vpp9C4WLcDfaVJUOjOYM=;
        b=OmpDdEZ6RfUnjERd1c2l+Xy+OCAuXduB3U4/ShhUh/d3vyh5kBbayCjKoUx7CyWVM+
         mZegsapNYWPSCKExQWlzvncImyXL1u7gTl5UzRaPvkPfyYBkS1+Km9Ac3wj/IQ0INru8
         FS3Np2qwf7PzeGFaCm44t4+OeaaJXiHKTcUclPeLoPSd2nTKq0X34MUBfrzJXP0E06VY
         8tVms7ALs/1VN1wDI/omFipbLuBzkh2WkVgPwBAyiRrvEPyyGvN90xm8rnEA0u+WBcOj
         UYWt1BTBYQypy3r7JfTE0yLgD+WVmOmrmN833eFIHBKOpl7B4DLqV8Ef3XE5x3EKsuuY
         7WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hUt8K2ypPhLBPyqRkbVgCT5Vpp9C4WLcDfaVJUOjOYM=;
        b=PMyAO+g3KH6wcizI+IjVyny+wB+IHtaJesPJEfzQBflgjrmJFzHXwoBqCDDP7MKXmL
         YhtSzGhghJyn5olEutEeI0Y/UcGqPl+nT2H5wavoWO3ovv3RccGW6y25tQvm/bktoMQG
         eqX8t3LSQur7CobWXoFpbLFmd2VtFhV5iV8aXoFI6l9Fu6L7/R7ZA1dGkzD3pU/5Aek4
         s9KJgJZQkaWKPDnDUg+JtTjcy2lXRu9utSA6jhHRvVgDuRu1ilI9d/SVriGT28CnCBEb
         GbxaUyLLKCl7X1l5tYK6kIUaCE0UyGGyOKeyO0rSPYZb5PlRcY7hFb3IF30iIvupE0xL
         X54g==
X-Gm-Message-State: APjAAAXQk9GrQeeS0T3nzBsr1I0CpKmTxk0WG+9ks1k70vUxCZ8y3n92
        jrWEjLMo50IwGUOUwjxEmv2FqOs4
X-Google-Smtp-Source: APXvYqzs5SR6oz1qrAugWunCBCp7FxevcBYiDqb0OMKzufFY7VwPhkbVzW4sE+3BmgUfDbwgwdeuBA==
X-Received: by 2002:a63:4f07:: with SMTP id d7mr82977335pgb.77.1559067121435;
        Tue, 28 May 2019 11:12:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k27sm21020742pfh.147.2019.05.28.11.12.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:12:00 -0700 (PDT)
Date:   Tue, 28 May 2019 11:11:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] watchdog: jz4740: Use register names from
 <linux/mfd/ingenic-tcu.h>
Message-ID: <20190528181159.GA24853@roeck-us.net>
References: <20190521155313.19326-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521155313.19326-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, May 21, 2019 at 05:53:10PM +0200, Paul Cercueil wrote:
> Use the macros from <linux/mfd/ingenic-tcu.h> instead of declaring our
> own.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/jz4740_wdt.c | 39 ++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index d1bc7cbd4f2b..51be321c775a 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -13,6 +13,7 @@
>   *
>   */
>  
> +#include <linux/mfd/ingenic-tcu.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> @@ -28,23 +29,16 @@
>  
>  #include <asm/mach-jz4740/timer.h>
>  
> -#define JZ_REG_WDT_TIMER_DATA     0x0
> -#define JZ_REG_WDT_COUNTER_ENABLE 0x4
> -#define JZ_REG_WDT_TIMER_COUNTER  0x8
> -#define JZ_REG_WDT_TIMER_CONTROL  0xC
> -
>  #define JZ_WDT_CLOCK_PCLK 0x1
>  #define JZ_WDT_CLOCK_RTC  0x2
>  #define JZ_WDT_CLOCK_EXT  0x4
>  
> -#define JZ_WDT_CLOCK_DIV_SHIFT   3
> -
> -#define JZ_WDT_CLOCK_DIV_1    (0 << JZ_WDT_CLOCK_DIV_SHIFT)
> -#define JZ_WDT_CLOCK_DIV_4    (1 << JZ_WDT_CLOCK_DIV_SHIFT)
> -#define JZ_WDT_CLOCK_DIV_16   (2 << JZ_WDT_CLOCK_DIV_SHIFT)
> -#define JZ_WDT_CLOCK_DIV_64   (3 << JZ_WDT_CLOCK_DIV_SHIFT)
> -#define JZ_WDT_CLOCK_DIV_256  (4 << JZ_WDT_CLOCK_DIV_SHIFT)
> -#define JZ_WDT_CLOCK_DIV_1024 (5 << JZ_WDT_CLOCK_DIV_SHIFT)
> +#define JZ_WDT_CLOCK_DIV_1    (0 << TCU_TCSR_PRESCALE_LSB)
> +#define JZ_WDT_CLOCK_DIV_4    (1 << TCU_TCSR_PRESCALE_LSB)
> +#define JZ_WDT_CLOCK_DIV_16   (2 << TCU_TCSR_PRESCALE_LSB)
> +#define JZ_WDT_CLOCK_DIV_64   (3 << TCU_TCSR_PRESCALE_LSB)
> +#define JZ_WDT_CLOCK_DIV_256  (4 << TCU_TCSR_PRESCALE_LSB)
> +#define JZ_WDT_CLOCK_DIV_1024 (5 << TCU_TCSR_PRESCALE_LSB)
>  
>  #define DEFAULT_HEARTBEAT 5
>  #define MAX_HEARTBEAT     2048
> @@ -72,7 +66,7 @@ static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writew(0x0, drvdata->base + JZ_REG_WDT_TIMER_COUNTER);
> +	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
>  	return 0;
>  }
>  
> @@ -95,18 +89,17 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  			break;
>  		}
>  		timeout_value >>= 2;
> -		clock_div += (1 << JZ_WDT_CLOCK_DIV_SHIFT);
> +		clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
>  	}
>  
> -	writeb(0x0, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
> -	writew(clock_div, drvdata->base + JZ_REG_WDT_TIMER_CONTROL);
> +	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> +	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
>  
> -	writew((u16)timeout_value, drvdata->base + JZ_REG_WDT_TIMER_DATA);
> -	writew(0x0, drvdata->base + JZ_REG_WDT_TIMER_COUNTER);
> -	writew(clock_div | JZ_WDT_CLOCK_RTC,
> -		drvdata->base + JZ_REG_WDT_TIMER_CONTROL);
> +	writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
> +	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
> +	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
>  
> -	writeb(0x1, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
> +	writeb(0x1, drvdata->base + TCU_REG_WDT_TCER);
>  
>  	wdt_dev->timeout = new_timeout;
>  	return 0;
> @@ -124,7 +117,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writeb(0x0, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
> +	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
>  	jz4740_timer_disable_watchdog();
>  
>  	return 0;
> -- 
> 2.21.0.593.g511ec345e18
> 
