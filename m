Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F74298FB3
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 15:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781562AbgJZOo0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 10:44:26 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39377 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781778AbgJZOo0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 10:44:26 -0400
Received: by mail-ot1-f67.google.com with SMTP id o14so8189872otj.6;
        Mon, 26 Oct 2020 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SWHByFc5rZ8zVa3HNcGb24ym5ItvsiPwVXkGJHx+rO4=;
        b=Lf6TV6+IH/lrYJh1aidxO4SwT2JvxDiTXRFPmd2EgJj/UGGdnj59qACw5Bh3DhI8UR
         rqhq4+5NMoFY41uw48uHAPa01QoRqMa4WTo9FT2VL3lnRBuAP2bQx1sCJzEe6GQL6xoX
         N000091FldrUmewadVQOxer/ONJWHAZeKOqezu7vOVW38IgwG65C17pgpKQ21i2fuSc5
         mEg59JR2qjG7B7NX5bwDttvkPHBgBcmtA2LIBHjXPLGfnL7xNqyw5vCvNxkj2RD0SVt8
         BtzpXbPhlUZsYtGbcMuLtE1MrHPv8505QUGwUW+wY4/g2bMV6uR9UdQM6TbY4A46+bmC
         rbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SWHByFc5rZ8zVa3HNcGb24ym5ItvsiPwVXkGJHx+rO4=;
        b=bVzOU9R/x2mzIqLPpr+6/PXHVnpzwSdN4zGF5K6nmoH8kQLJ1O4zco+VD3jycAQkZb
         EJfdB0WfYspKL5IBmnj/3SiwZu+nbQeZ5Hy7R6JBEFefON7750VneZ9mRHbBFQbDdlSh
         IOo6yXYFyk73MR0afuELkiI1A/zHKlnxzqcPi/Bh1afq8LRPjBH+1mzVLQfa+Ob0qXRz
         unrAkwjBlWfZ8MZqrZpSxWwQcTJuDGF5YC3Vo/2rLzylMxmRlmElbal1D694gqhDpGdT
         YsrevpiOe6ET7HROeo+653Q2S5qT4NASKZf1F5g2XyjTVJjZNlrbltLYL7SxQi4ZLUcX
         lqMg==
X-Gm-Message-State: AOAM531RdnbwSFrJvgkT4nxsy8m/1PqIu/+nIUTWK0dLbD5Rmv42ploV
        aDBeHPtOTMoaJEGoq4OdygI=
X-Google-Smtp-Source: ABdhPJzTdV3w6+BWL5oNyp1bOBKuq3b2zOQ6Af+QChA68OtHxKiLWU1WzHCPj4L8ifLxCGK8TdF5PQ==
X-Received: by 2002:a05:6830:4033:: with SMTP id i19mr15473834ots.127.1603723464703;
        Mon, 26 Oct 2020 07:44:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a80sm4135288oib.2.2020.10.26.07.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:44:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] watchdog: sprd: check busy bit before kick watchdog
To:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
References: <20201026080919.28413-1-zhang.lyra@gmail.com>
 <20201026080919.28413-4-zhang.lyra@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e1d01b18-44c1-0285-62bc-48d7c19e1bdb@roeck-us.net>
Date:   Mon, 26 Oct 2020 07:44:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026080919.28413-4-zhang.lyra@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/26/20 1:09 AM, Chunyan Zhang wrote:
> From: Lingling Xu <ling_ling.xu@unisoc.com>
> 
> As the specification described, checking busy bit must be done before kick
> watchdog.
> 

That is a key functional change: So far the code checked if a value
was accepted after loading it. That is no longer the case. Effectively,
with this change, the _next_ operation will now check if the previous
operation was accepted. Is this intentional ?

Also, does this really solve a problem, or is it just an optimization ?
By checking for busy prior to an operation instead of after it the only
real difference is that the busy check will most likely succeed immediately
because enough time has passed since the last write.

Ultimately it is your call how you want to handle this, but I think the
impact should be spelled out.

Guenter

> Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  drivers/watchdog/sprd_wdt.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index 4f2a8c6d6485..14071c66ff49 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -108,20 +108,8 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
>  	u32 tmr_step = timeout * SPRD_WDT_CNT_STEP;
>  	u32 prtmr_step = pretimeout * SPRD_WDT_CNT_STEP;
>  
> -	sprd_wdt_unlock(wdt->base);
> -	writel_relaxed((tmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> -		      SPRD_WDT_LOW_VALUE_MASK, wdt->base + SPRD_WDT_LOAD_HIGH);
> -	writel_relaxed((tmr_step & SPRD_WDT_LOW_VALUE_MASK),
> -		       wdt->base + SPRD_WDT_LOAD_LOW);
> -	writel_relaxed((prtmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> -			SPRD_WDT_LOW_VALUE_MASK,
> -		       wdt->base + SPRD_WDT_IRQ_LOAD_HIGH);
> -	writel_relaxed(prtmr_step & SPRD_WDT_LOW_VALUE_MASK,
> -		       wdt->base + SPRD_WDT_IRQ_LOAD_LOW);
> -	sprd_wdt_lock(wdt->base);
> -
>  	/*
> -	 * Waiting the load value operation done,
> +	 * Waiting the last load value operation done,
>  	 * it needs two or three RTC clock cycles.
>  	 */
>  	do {
> @@ -134,6 +122,19 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
>  
>  	if (delay_cnt >= SPRD_WDT_LOAD_TIMEOUT)
>  		return -EBUSY;
> +
> +	sprd_wdt_unlock(wdt->base);
> +	writel_relaxed((tmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> +		      SPRD_WDT_LOW_VALUE_MASK, wdt->base + SPRD_WDT_LOAD_HIGH);
> +	writel_relaxed((tmr_step & SPRD_WDT_LOW_VALUE_MASK),
> +		       wdt->base + SPRD_WDT_LOAD_LOW);
> +	writel_relaxed((prtmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> +			SPRD_WDT_LOW_VALUE_MASK,
> +		       wdt->base + SPRD_WDT_IRQ_LOAD_HIGH);
> +	writel_relaxed(prtmr_step & SPRD_WDT_LOW_VALUE_MASK,
> +		       wdt->base + SPRD_WDT_IRQ_LOAD_LOW);
> +	sprd_wdt_lock(wdt->base);
> +
>  	return 0;
>  }
>  
> 

