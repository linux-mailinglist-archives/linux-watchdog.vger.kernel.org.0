Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19846377B32
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 06:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhEJE0o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 00:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhEJE0o (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 00:26:44 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4309DC061573
        for <linux-watchdog@vger.kernel.org>; Sun,  9 May 2021 21:25:40 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id s1-20020a4ac1010000b02901cfd9170ce2so3207599oop.12
        for <linux-watchdog@vger.kernel.org>; Sun, 09 May 2021 21:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tad+zY1kS4GIfLGyjh9RrO9xoCH5F/ueUr8sFIEm0do=;
        b=OuBfqfEeksN8OiyIOpTtIZihoSCOmvqt0j7V/ZK8wP8NDJdL+p2Kf8kxTLGyWx3xOG
         vzRZZXaB26m9kzcer/zjDwAUu6ZrdaffHiogQDI8Q+lHwxmTc2ipBOz0wWICruPYSZ39
         ye1pMDOK4kKgXIio/oDLubpb4DGKdoYIQa1CaBfNmhwvOlJDqHKF7xyVq46VpEDS2meI
         NpDoY3XsLu5xSkWZn17anEX2/goQgBX21Pa+iMjmzQCoYYvJMbKqPGQy3niguYKOH0Tm
         WEsvqXzfzVe9bu7qfszfPp8Go1Hr34S5/0BXZ9N8/h+AcwbWT7D2WTzx4Vv6s1JV7Pc1
         8JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tad+zY1kS4GIfLGyjh9RrO9xoCH5F/ueUr8sFIEm0do=;
        b=KrygxfyVYRs/cZzyrEX1ENM0NVHuEVtfFpNphmMPR9OzEue+zgXksgOx51LJFG3UKo
         QQwtey3ri1bSZAiQ0wBu0kDLPfNT7mGfWyIj0UKfPuHMaUhh3M0mva6c7ABYYD/Bn3Q2
         zIsZ2hHXuCGQbf2YCropGtbnoVMDZqWKqjcGxKO+alb5UeiBUB70+/NMgf/wr5lZ+8/Y
         gQoWlTTGapIKdJyDvpGcbMocBnKlpJeG1ypXhIjMdcpVZJrhFP0aKwXpAEusG4z5JCMN
         2y2mSIYXLhj43c5I0auGF+c93nAdNKNuHaZvoXHX8inWi4a6ZrnppZH74yo3rvl0PEFT
         aO6g==
X-Gm-Message-State: AOAM530qXa4QfgV+T/7ii8eRuj6fcfqGfv5hlfn6qzIvBv1OdgdD4jIg
        URV8VYrKa34qXO/tbyGkCMg=
X-Google-Smtp-Source: ABdhPJww6t/pqZuXA0k2XxQ2+Z7OfC0TUhMFvqM42jH5lXpIRRcbZrcrkmVSgzBfJlKu7kKPHars+w==
X-Received: by 2002:a4a:abc8:: with SMTP id o8mr17413297oon.77.1620620739639;
        Sun, 09 May 2021 21:25:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm2881048otu.79.2021.05.09.21.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 May 2021 21:25:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Fu Wei <fu.wei@linaro.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Timur Tabi <timur@codeaurora.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
References: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: sbsa: Support architecture version 1
Message-ID: <87833e5a-978a-aac5-fc4b-1a922864066b@roeck-us.net>
Date:   Sun, 9 May 2021 21:25:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/9/21 8:41 PM, Shaokun Zhang wrote:
> Arm Base System Architecture 1.0[1] has introduced watchdog
> revision 1 that increases the length the watchdog offset

Is that how they call the watchdog count register ?

Also, doesn't that mean that the maximum timeout supported
by the hardware is now larger ?

> regiter to 48 bit, while other operation of the watchdog remains

register

> the same.
> Let's support the feature infered it from the architecture version

I can't parse this sentence.

> of watchdog in W_IID register. If the version is 0x1, the watchdog

W_IIDR ?

> offset register will be 48 bit, otherwise it will be 32 bit.

48 or 64 ? The code says 64.

> 
> [1] https://developer.arm.com/documentation/den0094/latest
> 

There is no download link at that location. Someone with access
to the documentation will have to confirm this.

> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Fu Wei <fu.wei@linaro.org>
> Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> Cc: Al Stone <al.stone@linaro.org>
> Cc: Timur Tabi <timur@codeaurora.org>
> Cc: Jianchao Hu <hujianchao@hisilicon.com>
> Cc: Huiqiang Wang <wanghuiqiang@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>   drivers/watchdog/sbsa_gwdt.c | 46 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index f0f1e3b2e463..ca4f7c416f1e 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -73,16 +73,21 @@
>   #define SBSA_GWDT_WCS_WS0	BIT(1)
>   #define SBSA_GWDT_WCS_WS1	BIT(2)
>   
> +#define SBSA_GWDT_VERSION_MASK  0xF
> +#define SBSA_GWDT_VERSION_SHIFT 16
> +
>   /**
>    * struct sbsa_gwdt - Internal representation of the SBSA GWDT
>    * @wdd:		kernel watchdog_device structure
>    * @clk:		store the System Counter clock frequency, in Hz.
> + * @version:            store the architecture version
>    * @refresh_base:	Virtual address of the watchdog refresh frame
>    * @control_base:	Virtual address of the watchdog control frame
>    */
>   struct sbsa_gwdt {
>   	struct watchdog_device	wdd;
>   	u32			clk;
> +	int			version;
>   	void __iomem		*refresh_base;
>   	void __iomem		*control_base;
>   };
> @@ -113,6 +118,27 @@ MODULE_PARM_DESC(nowayout,
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
>   /*
> + * Read and write are 32 or 64 bits depending on watchdog architecture
> + * version: if version is equal 0, its 32-bits operation; otherwise 64-bits
> + * operation is chosen.
> + */
> +static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
> +{
> +	if (gwdt->version == 0)
> +		return (u64)readl(gwdt->control_base + SBSA_GWDT_WOR);

Unnecessary typecast.

> +	else
> +		return readq(gwdt->control_base + SBSA_GWDT_WOR);
> +}
> +
> +static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)

What is the point of making val an u64 variable ? Without changing
the maximum timeout it will never be larger than 0xffffffff.

> +{
> +	if (gwdt->version == 0)
> +		writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
> +	else
> +		writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
> +}
> +
> +/*
>    * watchdog operation functions
>    */
>   static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
> @@ -123,16 +149,14 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>   	wdd->timeout = timeout;
>   
>   	if (action)
> -		writel(gwdt->clk * timeout,
> -		       gwdt->control_base + SBSA_GWDT_WOR);
> +		sbsa_gwdt_reg_write(gwdt->clk * timeout, gwdt);
>   	else
>   		/*
>   		 * In the single stage mode, The first signal (WS0) is ignored,
>   		 * the timeout is (WOR * 2), so the WOR should be configured
>   		 * to half value of timeout.
>   		 */
> -		writel(gwdt->clk / 2 * timeout,
> -		       gwdt->control_base + SBSA_GWDT_WOR);
> +		sbsa_gwdt_reg_write(gwdt->clk / 2 * timeout, gwdt);
>   
>   	return 0;
>   }
> @@ -149,7 +173,7 @@ static unsigned int sbsa_gwdt_get_timeleft(struct watchdog_device *wdd)
>   	 */
>   	if (!action &&
>   	    !(readl(gwdt->control_base + SBSA_GWDT_WCS) & SBSA_GWDT_WCS_WS0))
> -		timeleft += readl(gwdt->control_base + SBSA_GWDT_WOR);
> +		timeleft += sbsa_gwdt_reg_read(gwdt);
>   
>   	timeleft += lo_hi_readq(gwdt->control_base + SBSA_GWDT_WCV) -
>   		    arch_timer_read_counter();
> @@ -172,6 +196,17 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
>   	return 0;
>   }
>   
> +static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
> +	int ver;
> +
> +	ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
> +	ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
> +
> +	gwdt->version = ver;
> +}
> +
>   static int sbsa_gwdt_start(struct watchdog_device *wdd)
>   {
>   	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
> @@ -300,6 +335,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>   	 * it's also a ping, if watchdog is enabled.
>   	 */
>   	sbsa_gwdt_set_timeout(wdd, wdd->timeout);
> +	sbsa_gwdt_get_version(wdd);
>   
>   	watchdog_stop_on_reboot(wdd);
>   	ret = devm_watchdog_register_device(dev, wdd);
> 

