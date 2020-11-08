Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CE22AAC37
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Nov 2020 17:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgKHQaF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 11:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgKHQaE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 11:30:04 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F3CC0613CF;
        Sun,  8 Nov 2020 08:30:04 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id z16so6279083otq.6;
        Sun, 08 Nov 2020 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XltMNnUXdEudxhYtqFAoW6aR7yvVclogZq3FZUgsGyA=;
        b=k0g2zcZj8Z9z0aIcNnAk3fPznmWI4OlnmThW86iS+gmfDS2UcrA56BsVldIOEfYUgZ
         TNorAEk2cZLEKhMCOYH0y7EJoMm4XSwal3+PiiAtuuPMJ6VOPzSftyXM+C2lUJhXThjR
         QWKJbuaQ9cv6VeSrm01R045ms+0/IlZRwL8SlswZ/apB4qLyO1H6YTWWzEsT59bxyRB2
         gl98Pa/rN+FQfsIR6CXV3EPmRycWiY8HESHD/LZLGsaoslm8R9ezlHnOUkASG8xOHPs/
         yo+JOnsGpFL/Z6MMGnorr3PNzdCLPOGTB85CSXk/j2D66CqZk1t4MUJJO0rP1VPnLrMw
         9cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XltMNnUXdEudxhYtqFAoW6aR7yvVclogZq3FZUgsGyA=;
        b=IJQsRiSfT+xg9ODOFcMqlnpUpn/UZOxaTLAfwLxf+elz+SfOwI/GiKon5uYiQ9mEhj
         Z1KCD6wTte6UcLzTP7YYBzOvAfEW17eIu1EmjetBC3pPcoKHF0bEyaDz7ujeBMN+GuXt
         Lsa4nuFwLL/fZZSo/nIO0y1fiN8nsldW5MBPatogH6Ya45efYtxKt4kRNZh6CgCgJqNO
         jVn7DIn/ffkrdEqjZofBmXcXkoFBy9zfwHXTcQWikVz4tbSsi65u1UNRgJCoqVjAxFri
         XEAMkW4TB+CeAdNKdsTiZLF/oFzdP9Pfwl2xH7Xa3xq3KWT7h0DDLpfnxIcW7oBuUNiy
         8VaA==
X-Gm-Message-State: AOAM531Bl5/jWe94WRBLxgvlInrutZ2FY6hq22a074iM5h56InZiXrPA
        kRrzT/UZQ83T49Z5NzZbVqs=
X-Google-Smtp-Source: ABdhPJzXo6HAGrCg4uJU1vYLeeZ76Yv8At7lYVdH8TzThV+PpiUT4ecM8f5e6hc2qe5zpfwcWHfdXQ==
X-Received: by 2002:a05:6830:2102:: with SMTP id i2mr3633064otc.85.1604853004038;
        Sun, 08 Nov 2020 08:30:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z12sm1923908oti.45.2020.11.08.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 08:30:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: sprd: change to use usleep_range()
 instead of busy loop
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
 <20201029023933.24548-4-zhang.lyra@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7b61713e-5808-d157-5b1a-08b1a275a631@roeck-us.net>
Date:   Sun, 8 Nov 2020 08:30:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029023933.24548-4-zhang.lyra@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/28/20 7:39 PM, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> After changing to check busy bit for the previous loading operation instead
> of the current one, for most of cases, the busy bit is not set for the
> first time of read, so there's no need to check so frequently, so this
> patch use usleep_range() to replace cpu_relax() to avoid busy loop.
> 
> Also this patch change the max times to 11 which would be enough, since
> according to the specification, the busy bit would be set after a new
> loading operation and last 2 or 3 RTC clock cycles (about 60us~92us).
> 
> Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> Original-by: Lingling Xu <ling_ling.xu@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sprd_wdt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index b9b1daa9e2a4..e8097551dfcd 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -53,7 +53,7 @@
>  
>  #define SPRD_WDT_CNT_HIGH_SHIFT		16
>  #define SPRD_WDT_LOW_VALUE_MASK		GENMASK(15, 0)
> -#define SPRD_WDT_LOAD_TIMEOUT		1000
> +#define SPRD_WDT_LOAD_TIMEOUT		11
>  
>  struct sprd_wdt {
>  	void __iomem *base;
> @@ -109,15 +109,17 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
>  	u32 prtmr_step = pretimeout * SPRD_WDT_CNT_STEP;
>  
>  	/*
> -	 * Waiting the load value operation done,
> -	 * it needs two or three RTC clock cycles.
> +	 * Checking busy bit to make sure the previous loading operation is
> +	 * done. According to the specification, the busy bit would be set
> +	 * after a new loading operation and last 2 or 3 RTC clock
> +	 * cycles (about 60us~92us).
>  	 */
>  	do {
>  		val = readl_relaxed(wdt->base + SPRD_WDT_INT_RAW);
>  		if (!(val & SPRD_WDT_LD_BUSY_BIT))
>  			break;
>  
> -		cpu_relax();
> +		usleep_range(10, 100);
>  	} while (delay_cnt++ < SPRD_WDT_LOAD_TIMEOUT);
>  
>  	if (delay_cnt >= SPRD_WDT_LOAD_TIMEOUT)
> 

