Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992DD4588A7
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Nov 2021 05:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhKVEjP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 23:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbhKVEjJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 23:39:09 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C84C061748
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 20:36:03 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so26983533otl.3
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 20:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ClZ4CZj1xsztminVXvIeT83LgXTSlicvr7kgVm0F2qw=;
        b=hW2YHqVSQ+ARzdOQ9lFReenKNHAW2rgznUutbe/pRB3YGyggweQpT1QwcYN30lEJ9y
         zzCyT6BIY0Q4GJE6KjU6phJz/QK4Ad8OYsLOdaVOi3vcFGguet0K/Wo6vSHKlfytcanC
         PE8KNwNCl2XRk8M9udQgaXJ9oxmcouXKhwRqa+EB2zbSWhWJGY480knTgLrCMQ40A0cU
         H32xD6ASV+/L5yJVGEyvwpo7lAWI5qi0u/4AamAhGw5nalJs1O6OaINNOs3ZQTO2t8QC
         G5+RAlVm3pe8H2No+FmTucJG844ajoMPnHyPEorf2T2VOLY1gYcS1sk3r46YewqDt1UQ
         cS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ClZ4CZj1xsztminVXvIeT83LgXTSlicvr7kgVm0F2qw=;
        b=1eGMz7sn+tPKq8TmXvey/OlFVqlE/E0z9tcwStqTtCP41laTo8Djy1HA9gg0L4uClF
         VljapLf0aAPgQN92c+lYbV/F5/sA7UF+6l8tfkCataIkDYDzzvzOHmKohJx7qOHApORo
         WjJTqST+Sxfna1zaahkhKtSu96Gkn3/HwPVKXeZmPhmYqLe9CyNSaS1XxXtNTn6wXGAp
         LReu/ZxAv518xh+WQp1tX9yWg/aH0JL0C3SNBj81yosLQlNqTbOjrkY5Ht/d2/f/jISS
         qFimoIlv5aYpXERBqa9eE4bYiWYvRpaQ2K37D5+6TGcGD7twkOVb/ibc5ZtXBINLsMXI
         3ozQ==
X-Gm-Message-State: AOAM532j+g4GC0bghWPkyMEo18BaR25Hmaa12Ah38wIjW+C3aTrCzSEg
        5G6h0LPBEK9oTHo4fpPoRT24QSvF0Xs=
X-Google-Smtp-Source: ABdhPJx2Qy2PUW2DiqBm4I3yRSa+oo5PRhcWU1jyEczzDlflqY31FSIR1EjUz+aatg4GzSQh5rqEVg==
X-Received: by 2002:a9d:390:: with SMTP id f16mr22607362otf.325.1637555762868;
        Sun, 21 Nov 2021 20:36:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h3sm327067oon.34.2021.11.21.20.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 20:36:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: ixp4xx: Implement restart
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <20211122013256.3050966-1-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0ec25f9a-506f-62d9-be78-705929babd64@roeck-us.net>
Date:   Sun, 21 Nov 2021 20:36:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211122013256.3050966-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/21/21 5:32 PM, Linus Walleij wrote:
> Implement watchdog restart in the IXP4xx watchdog timer.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/watchdog/ixp4xx_wdt.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
> index 31b03fa71341..7b188591f6d4 100644
> --- a/drivers/watchdog/ixp4xx_wdt.c
> +++ b/drivers/watchdog/ixp4xx_wdt.c
> @@ -18,6 +18,7 @@
>   #include <linux/bits.h>
>   #include <linux/platform_device.h>
>   #include <linux/clk.h>
> +#include <linux/delay.h>
>   #include <linux/soc/ixp4xx/cpu.h>
>   
>   struct ixp4xx_wdt {
> @@ -84,10 +85,25 @@ static int ixp4xx_wdt_set_timeout(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static int ixp4xx_wdt_restart(struct watchdog_device *wdd,
> +                              unsigned long action, void *data)
> +{
> +	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
> +
> +	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
> +	__raw_writel(0, iwdt->base + IXP4XX_OSWT_OFFSET);
> +	__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
> +		     iwdt->base + IXP4XX_OSWE_OFFSET);
> +	msleep(1000);
> +

A restart handler should not sleep, and it doesn't make sense either since
it is called from machine_restart() and nothing else is supposed to happen
at this point. Also, are you sure that this is going to take 1 second ? That
seems excessive.

Thanks,
Guenter

> +	return 0;
> +}
> +
>   static const struct watchdog_ops ixp4xx_wdt_ops = {
>   	.start = ixp4xx_wdt_start,
>   	.stop = ixp4xx_wdt_stop,
>   	.set_timeout = ixp4xx_wdt_set_timeout,
> +	.restart = ixp4xx_wdt_restart,
>   	.owner = THIS_MODULE,
>   };
>   
> 

