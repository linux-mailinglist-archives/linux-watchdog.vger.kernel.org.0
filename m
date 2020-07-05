Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB511214D4B
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Jul 2020 17:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgGEPHf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jul 2020 11:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEPHf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jul 2020 11:07:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB09C061794;
        Sun,  5 Jul 2020 08:07:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t15so1522186pjq.5;
        Sun, 05 Jul 2020 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oWGjpobOxzlgwjb1kbGd6v3TL3FL54/58+CeQAJAuJ0=;
        b=i946XFFCKKCU8GwBwPNdoOw3vsFKf9p/fhx8beEFAlkdb9uNPcthLKLOKUTlrdSLz3
         kjS7d8qyKyHaRjy6YiaJDxXxSNdNMdAMGfwMBrAW14PzAdh+RL91tVl+Q59Rw/NXiTxS
         20YhY5EaRtTnLrN5A8WNHM8/aCtwBcO0KYT6SXURYnS7+pCIhqbG00DBllv/B0aZeGsm
         900zWbGXvF9wyKOrXbaN/HtWKRncm3hpN5KaQDWt/9xQKHu9k3ZiXsad1V2jamvNxDNi
         dade+mPdftbso0wToPi6lPWHaSv+Sj1C4GDpHgxQx3Nq/Z1g+j8DC+00aQ+xR91T3EIE
         TJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oWGjpobOxzlgwjb1kbGd6v3TL3FL54/58+CeQAJAuJ0=;
        b=GQsjLdK5LeNVc32YunpG0n6EaZm7ZZhbY9eHkV5w+juSI6g1tvyfF38ufEZAWeATNl
         HMVoVPBk8Tgd+mftY4l8vETmZzkRPRETnjQEnp3sS7U/SCsTsh7TOy0DcXYWZGh7wF/q
         pyicG3vhCfFDlWRWrIUn9NBhLB58y+7fl3Xg9zmpMcpLBFMPeqd5iDdxqrUoqYoDyUnc
         VBh1skK5WhrrEWoBBrgoYI2EVn54pIk3krKYllx+w5Eg6KZfVroWm8rCk4Brn5tvGh8+
         OKYjNAJir6hOjoicA0xulqWvSyykddiPp4nxHesz0iNJIzdFOoPRdZ//qw2q+OpyrIYx
         9cKQ==
X-Gm-Message-State: AOAM530Pq+Iq9sNxLtlOrlifovu0Zc55YClKop911571iCrTe0tT3Uuv
        XCKYDhDlHuO4kub35Pw54TPJ0MtOOlo=
X-Google-Smtp-Source: ABdhPJzc31fO0WKOCE7yIYY7Ka6DQ0woxsrO7Cyb4HcmjxkwR4wOwSWRqdLdqey1KdMOfSRpIQrQSA==
X-Received: by 2002:a17:90b:3555:: with SMTP id lt21mr50581897pjb.234.1593961654790;
        Sun, 05 Jul 2020 08:07:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r204sm9951785pfc.134.2020.07.05.08.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 08:07:34 -0700 (PDT)
Subject: Re: [PATCHv2 4/5] watchdog: rti-wdt: attach to running watchdog
 during probe
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
References: <20200703120406.7092-1-t-kristo@ti.com>
 <20200703120406.7092-5-t-kristo@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8eecaa6a-2e0e-14b3-473a-0674f9b2be26@roeck-us.net>
Date:   Sun, 5 Jul 2020 08:07:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703120406.7092-5-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/3/20 5:04 AM, Tero Kristo wrote:
> If the RTI watchdog is running already during probe, the driver must
> configure itself to match the HW. Window size and timeout is probed from
> hardware, and the last keepalive ping is adjusted to match it also.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/watchdog/rti_wdt.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 110bfc8d0bb3..987e5a798cb4 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -213,6 +213,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	struct watchdog_device *wdd;
>  	struct rti_wdt_device *wdt;
>  	struct clk *clk;
> +	u32 last_ping = 0;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
> @@ -258,11 +259,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	wdd->min_timeout = 1;
>  	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
>  		wdt->freq * 1000;
> -	wdd->timeout = DEFAULT_HEARTBEAT;

What if the watchdog is not running ?

>  	wdd->parent = dev;
>  
> -	watchdog_init_timeout(wdd, heartbeat, dev);
> -
>  	watchdog_set_drvdata(wdd, wdt);
>  	watchdog_set_nowayout(wdd, 1);
>  	watchdog_set_restart_priority(wdd, 128);
> @@ -274,12 +272,34 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		goto err_iomap;
>  	}
>  
> +	if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
> +		u32 time_left;
> +
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		time_left = rti_wdt_get_timeleft(wdd);
> +		heartbeat = readl(wdt->base + RTIDWDPRLD);
> +		heartbeat <<= WDT_PRELOAD_SHIFT;
> +		heartbeat /= wdt->freq;
> +

This ignores any heartbeat configured as module parameter, which most
people will consider unexpected. It might be worthwhile documenting that.

> +		wsize = readl(wdt->base + RTIWWDSIZECTRL);
> +		ret = rti_wdt_setup_hw_hb(wdd);
> +		if (ret)
> +			goto err_iomap;
> +
> +		last_ping = -(time_left - heartbeat) * 1000;

Why the double negation ?

		last_ping = (heartbeat - time_left) * 1000;

seems simpler. Also, what if heartbeat - time_left is negative for whatever
reason ?

I am not sure if it is a good idea to call rti_wdt_get_timeleft()
here. It might be better to add a helper function such as
rti_wdt_get_timeleft_ms() to return the time left in milli-seconds
for improved accuracy.

> +	}
> +
> +	watchdog_init_timeout(wdd, heartbeat, dev);
> +
>  	ret = watchdog_register_device(wdd);
>  	if (ret) {
>  		dev_err(dev, "cannot register watchdog device\n");
>  		goto err_iomap;
>  	}
>  
> +	if (last_ping)
> +		watchdog_set_last_hw_keepalive(wdd, last_ping);
> +
>  	return 0;
>  
>  err_iomap:
> 

