Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC7C2AAC34
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Nov 2020 17:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgKHQ3l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 11:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgKHQ3l (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 11:29:41 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD94C0613CF;
        Sun,  8 Nov 2020 08:29:41 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id l26so1565450oop.9;
        Sun, 08 Nov 2020 08:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=58YgForHvEbG1nbMeYKdaiUjq7ppLexKuMYgSAgP4yY=;
        b=WRw/2yfbFm6ncecELbdE0cDvy+UiRXzqwzb+HpMkF+mOkh58tBfpNUxANa3Kq5LO4o
         Fe08oCbap8WSkjyJWktuoDcfcp7Ohu71/hscyhVwBU9lNe3yQ/ruIW83x/tLFzhuvWf2
         Apozno6nEexm/ES7tVmAk3vefqhumj6BOcDkN9S/s9CQRQlgQuEiBLECSZuWuyIBln2n
         kxHdLON77posVMhaE22fv0uR4+ny+R/72sw76m8mXaHKrjHnyCimyWC15pExMd5cKNEH
         Oxz+hiSjYgUvFmrQydodjjm0+dLrwd2hIJ/OYMt4GZ7dD7HIsLxb0ghGoV0AzCEaWmGM
         54pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=58YgForHvEbG1nbMeYKdaiUjq7ppLexKuMYgSAgP4yY=;
        b=hefE3SSNils4ca9D742w7lRwaw+SQmCKmeiZAT2qV5rs1ZahZc0pE3O2FSvENk26Cp
         XEldjGUdEl6Me6Z2kGmbXUZFWHA6BAHx7tU9blXRbNjkat7ljOOfFtLJCggWmL2dSGq8
         yJcTJc26yKiD5Eqbr6ibTgDyBlykXMaHKz1R6fwrTbqUy2uEM9fJfRCe/WO5C+X8O77+
         alEuoyaSX7u6cQ9U+h9g17bIPaRQjH54rk0dirAPR4tGfvtQP+xkbMt1IoCmwpDxeN7A
         49mT7CVV1B0UqDIxAyJ82nDLkqx0MFi6aI5gtJLF9Xp4YMHiHxH0h9gsgbtgEq7HHpxH
         qi/A==
X-Gm-Message-State: AOAM531RL3sftVKlvexCpD8WaIbrV4AbGon7fuq1V1UGwiCPV75aQZeq
        FenCtsR3hdIXBqwwU3w5TVg=
X-Google-Smtp-Source: ABdhPJwdNalpNd3XJ7W6ahdm8KjldOFvvaiD4CNy22CCY9zXHhhgxgWoyt9l1Sn/gl7h6OpgzL/L4w==
X-Received: by 2002:a4a:a542:: with SMTP id s2mr5633086oom.24.1604852980533;
        Sun, 08 Nov 2020 08:29:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10sm1875017otq.69.2020.11.08.08.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 08:29:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 2/3] watchdog: sprd: check busy bit before new loading
 rather than after that
To:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
References: <20201029023933.24548-1-zhang.lyra@gmail.com>
 <20201029023933.24548-3-zhang.lyra@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5cd5eadd-e1d1-7f6d-b993-106c0fe94d7d@roeck-us.net>
Date:   Sun, 8 Nov 2020 08:29:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029023933.24548-3-zhang.lyra@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/28/20 7:39 PM, Chunyan Zhang wrote:
> From: Lingling Xu <ling_ling.xu@unisoc.com>
> 
> As the specification described, users must check busy bit before start
> a new loading operation to make sure that the previous loading is done
> and the device is ready to accept a new one.
> 
> [ chunyan: Massaged changelog ]
> 
> Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sprd_wdt.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index f3c90b4afead..b9b1daa9e2a4 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -108,18 +108,6 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
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
>  	 * Waiting the load value operation done,
>  	 * it needs two or three RTC clock cycles.
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

