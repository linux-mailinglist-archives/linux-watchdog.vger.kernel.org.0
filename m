Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87995A3E24
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Aug 2022 16:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiH1OkH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 28 Aug 2022 10:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiH1OkC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 28 Aug 2022 10:40:02 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E231112629
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Aug 2022 07:39:59 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id q15so571462pfn.11
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Aug 2022 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc;
        bh=2xe+22rvKRL74qdhEFSfvmZTtFkmDEyWfR2pBtrVfX0=;
        b=hqgyNUyl2R+/1wVIOO+JoCMTUPmRS6Gq+z6OskSNrPR+PNP5CyTz6KrczG+0fTKPbz
         KIe2eaGId0svqBOdbCw4ZbFn28l0+tqFZ/pIzvKXGKqd461A5r3MTTZjDpBHp0wJIlPo
         yIazUw3MSVmRvRA+hWcbBX+BUOBGeIzxczWTr3LPSWewCqVfVOzDmSgMTJCXwiHVSJHX
         rGdXgaJ2KxB1zmuooBDox4jlGe/aBbvidEQ0o7PYbvgGoKD0cNDU8h8eiJyzjbG46Eoh
         L4Rl485sV21sTnvjnrqoR/yrDNytXA0GoU3kW+vRyBOz18xzhj07V8grwDY2ovJWM1Oe
         gL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc;
        bh=2xe+22rvKRL74qdhEFSfvmZTtFkmDEyWfR2pBtrVfX0=;
        b=Byd66yirwmlGXmEaOWYUPUTBeIEQrIAzUUNyt0CgoOTOZgr/jJ1wi0ahxVF31axxyq
         E+wNidxHeTFR0YVzBSpWf4Rxk4ehKN+RqCWEAKja0DMFC8Z46LqTuNRInBy1cUjaqwYH
         AT6kc8Y6oT7VCy207rG+M4CdstFutKf8n7aMQeFnClXGvtjkr0EAu00INfXQzOaHRvOa
         2IdOjAixUlPwoY0qcU6dwopNwzkskbmz5OqPv6IxExMCS/uLrYkR0qL0O4KQOmO7yYw0
         Hqf1Pz063Z/LEKN7wVcuMdlgZp0ti03axojkxAepdVle9ShmBZi6tKt40F1CgqArpIwU
         vn1g==
X-Gm-Message-State: ACgBeo3TybpcyEVhRFjQURRWBadK/B6bRrDi8F8Hq47q7JxlC+5o/9+E
        /r6cX2fbeHjwli3DE3fqPkTSe6mfm0IXdg==
X-Google-Smtp-Source: AA6agR6Go1hb0gAGEuyNZuWaA1hbr0WoQpNkQ82Lawkw/SV8OnNcG/oRzJyO9Qs8o8bnVlNw6MjHGQ==
X-Received: by 2002:a63:81c1:0:b0:42b:7aca:ddeb with SMTP id t184-20020a6381c1000000b0042b7acaddebmr9033292pgd.201.1661697599047;
        Sun, 28 Aug 2022 07:39:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13-20020a63554d000000b00427564b6b57sm4649338pgm.7.2022.08.28.07.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 07:39:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec167bd9-e514-648b-f87c-bb320115cba7@roeck-us.net>
Date:   Sun, 28 Aug 2022 07:39:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Sergei Antonov <saproj@gmail.com>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org
References: <20220827142414.4017751-1-saproj@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] watchdog: ftwdt010_wdt: implement _restart() function
In-Reply-To: <20220827142414.4017751-1-saproj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/27/22 07:24, Sergei Antonov wrote:
> Implement ftwdt010_wdt_restart(). It enables watchdog with timeout = 0
> and disabled IRQ. Since it needs code similar to ftwdt010_wdt_start(),
> add a new function ftwdt010_enable() and move common code there.
> 
> v1 -> v2:
> Do not let IRQ trigger when restarting.
> Add a helper function ftwdt010_enable().
> 

Version history should be after ---. Otherwise

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sergei Antonov <saproj@gmail.com>
> ---
>   drivers/watchdog/ftwdt010_wdt.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> index 21dcc7765688..0a5bbfd2823f 100644
> --- a/drivers/watchdog/ftwdt010_wdt.c
> +++ b/drivers/watchdog/ftwdt010_wdt.c
> @@ -47,21 +47,28 @@ struct ftwdt010_wdt *to_ftwdt010_wdt(struct watchdog_device *wdd)
>   	return container_of(wdd, struct ftwdt010_wdt, wdd);
>   }
>   
> -static int ftwdt010_wdt_start(struct watchdog_device *wdd)
> +static void ftwdt010_enable(struct ftwdt010_wdt *gwdt,
> +			    unsigned int timeout,
> +			    bool need_irq)
>   {
> -	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
>   	u32 enable;
>   
> -	writel(wdd->timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
> +	writel(timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
>   	writel(WDRESTART_MAGIC, gwdt->base + FTWDT010_WDRESTART);
>   	/* set clock before enabling */
>   	enable = WDCR_CLOCK_5MHZ | WDCR_SYS_RST;
>   	writel(enable, gwdt->base + FTWDT010_WDCR);
> -	if (gwdt->has_irq)
> +	if (need_irq)
>   		enable |= WDCR_WDINTR;
>   	enable |= WDCR_ENABLE;
>   	writel(enable, gwdt->base + FTWDT010_WDCR);
> +}
>   
> +static int ftwdt010_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
> +
> +	ftwdt010_enable(gwdt, wdd->timeout, gwdt->has_irq);
>   	return 0;
>   }
>   
> @@ -93,6 +100,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
> +				unsigned long action, void *data)
> +{
> +	ftwdt010_enable(to_ftwdt010_wdt(wdd), 0, false);
> +	return 0;
> +}
> +
>   static irqreturn_t ftwdt010_wdt_interrupt(int irq, void *data)
>   {
>   	struct ftwdt010_wdt *gwdt = data;
> @@ -107,6 +121,7 @@ static const struct watchdog_ops ftwdt010_wdt_ops = {
>   	.stop		= ftwdt010_wdt_stop,
>   	.ping		= ftwdt010_wdt_ping,
>   	.set_timeout	= ftwdt010_wdt_set_timeout,
> +	.restart	= ftwdt010_wdt_restart,
>   	.owner		= THIS_MODULE,
>   };
>   

