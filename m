Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FA232214E
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 22:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhBVVYs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 16:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhBVVYr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 16:24:47 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6662CC061574;
        Mon, 22 Feb 2021 13:24:07 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id l16so4491227oti.12;
        Mon, 22 Feb 2021 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TEtTsiUpkLBUItx7zYv4JXU3T0bgaTzmjKFAqK2MQBQ=;
        b=dCSif1Sl6pHPXkBM2bsoFH7TqpR7Ntuaxv+3hyT/2HTivk1e5bEihkkR6WtAezKUc/
         RA/X6WKDJCXkp4ELdkNjdNz4uOP1DWIrMv06YQOpc16tUfSzEW/SD2YUFphbDdqNc4jf
         3+7iSW9n1I+kyklWw10B2sOBN/ygh+E6KSHfHSAlDOsCY8SoxK7Rjj0fBD1Jdjayf1IY
         Z+Ftqthrzcjih7E2hXg2imOIJM2UVemqRO4LPAxZq0RPvVeo6Qqf+aWIqDz1iFWAse+Z
         Ik/m4Xm+3iFGSf0j3cDrH0LiPeQsSERjmC6Lp5xO/P2VTA8cJruhFISpmff3XNIPAFfp
         Jg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TEtTsiUpkLBUItx7zYv4JXU3T0bgaTzmjKFAqK2MQBQ=;
        b=XFbpWi0Qu8e2BJWHQcHwvIIkXblWnI9/FuPEyyT9RUEhGkGzjJVhLFfWhm4sqOtKd6
         HJ2lFuuaxkZ6HM+QBNH+oIUv8YoDswu9lUl/tDdYt5R+X7ppuHPXKMZjVKbUgqDb8K73
         SsPpgRLQaua0EVga1iL4xwPWufMDrrbOY+SyPHQWY2JWyx4Z2gVkbaxW+VaexCxvcLL6
         iAS/7gkKv2PGK1NE4tMVC3YZzgpqQD2BhVxrIw2vxJ+57ZK7MWLlzDdtPbaRxyo3+fnQ
         QMXAMxq4EXRp8d0FFW3iGrzQDxVEQKXl1tbBf+klImLQgbDlpTrLA3IXrcupTGhk1dLd
         xLbg==
X-Gm-Message-State: AOAM530rLbJQwi5PuiZYuDrZxk6b9s4lPyioDUZy+ArLZZACTITZ9O4c
        aAusKP3u+/LV4NDFnia671FINq2yhf4=
X-Google-Smtp-Source: ABdhPJwkeW5osuIN6Enx/nEdLjQNvxoZSlIoH4wG/YgiIH7oRqNJMjZsSu/kTP+HvjcieE1BbwKvOQ==
X-Received: by 2002:a05:6830:1c63:: with SMTP id s3mr14451850otg.309.1614029046513;
        Mon, 22 Feb 2021 13:24:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20sm3711398oor.14.2021.02.22.13.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 13:24:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: bcm7038_wdt: add big endian support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210222200338.24696-1-noltari@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9381ef9e-a569-9bcd-5546-a48922e4961d@roeck-us.net>
Date:   Mon, 22 Feb 2021 13:24:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222200338.24696-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/22/21 12:03 PM, Álvaro Fernández Rojas wrote:
> bcm7038_wdt can be used on bmips (bcm63xx) devices too.
> 
It might make sense to actually enable it for BCM63XX.

> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/watchdog/bcm7038_wdt.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
> index 979caa18d3c8..62494da1ac57 100644
> --- a/drivers/watchdog/bcm7038_wdt.c
> +++ b/drivers/watchdog/bcm7038_wdt.c
> @@ -34,6 +34,24 @@ struct bcm7038_watchdog {                                 
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  
> +static inline void bcm7038_wdt_write(unsigned long data, void __iomem *reg)
> +{
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +	__raw_writel(data, reg);
> +#else
> +	writel(data, reg);
> +#endif
> +}
> +
> +static inline unsigned long bcm7038_wdt_read(void __iomem *reg)
> +{
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +	return __raw_readl(reg);
> +#else
> +	return readl(reg);
> +#endif
> +}
> +

This needs further explanation. Why not just use __raw_writel() and
__raw_readl() unconditionally ? Also, is it known for sure that,
say, bmips_be_defconfig otherwise uses the wrong endianness
(vs. bmips_stb_defconfig which is a little endian configuration) ?

Thanks,
Guenter

>  static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
>  {
>  	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
> @@ -41,15 +59,15 @@ static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
>  
>  	timeout = wdt->rate * wdog->timeout;
>  
> -	writel(timeout, wdt->base + WDT_TIMEOUT_REG);
> +	bcm7038_wdt_write(timeout, wdt->base + WDT_TIMEOUT_REG);
>  }
>  
>  static int bcm7038_wdt_ping(struct watchdog_device *wdog)
>  {
>  	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
>  
> -	writel(WDT_START_1, wdt->base + WDT_CMD_REG);
> -	writel(WDT_START_2, wdt->base + WDT_CMD_REG);
> +	bcm7038_wdt_write(WDT_START_1, wdt->base + WDT_CMD_REG);
> +	bcm7038_wdt_write(WDT_START_2, wdt->base + WDT_CMD_REG);
>  
>  	return 0;
>  }
> @@ -66,8 +84,8 @@ static int bcm7038_wdt_stop(struct watchdog_device *wdog)
>  {
>  	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
>  
> -	writel(WDT_STOP_1, wdt->base + WDT_CMD_REG);
> -	writel(WDT_STOP_2, wdt->base + WDT_CMD_REG);
> +	bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
> +	bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
>  
>  	return 0;
>  }
> @@ -88,7 +106,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct watchdog_device *wdog)
>  	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
>  	u32 time_left;
>  
> -	time_left = readl(wdt->base + WDT_CMD_REG);
> +	time_left = bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
>  
>  	return time_left / wdt->rate;
>  }
> 

