Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28611454765
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237690AbhKQNiE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhKQNiA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:38:00 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22ADC061570;
        Wed, 17 Nov 2021 05:35:01 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id m6so6497536oim.2;
        Wed, 17 Nov 2021 05:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N4KroYh7gA6QQ0Osj9IEISfYhSd6D7lKBAuwYIm3VYc=;
        b=Y+7mzg37hs7yPTRl20tVx+T5qrK8YER5GDZWXZE0PLUeJOXCgb078OJciMw0w2+vk0
         tQ1kkvKRl90wXz+DdK/+W1YD9cUGv4LubnTM0GwrAdcXXgVQmEKB7bdGy4C19Xwkpc/2
         1olwHuXkyd5gWzLniNeX5kRZ/ycWmLvXqjz0xag9XmNt6MTlJvvJZQzIk4X40nC2cpXw
         xH7YwLBfarD6bNFXRB+AQ5+NN6VtbyczQdlLZIYHbqnt5fpIXOEX64Hs80k3Jf/fkJub
         6yvDBife2RrlY/u1aPe5WN0X9iXXs92SeC4cmlmm8+fD61cJoh9nyBvssw9aG3y4x2GB
         Lg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=N4KroYh7gA6QQ0Osj9IEISfYhSd6D7lKBAuwYIm3VYc=;
        b=B3RIVsSAn98Msee6L5hRAt6NSN0O+Ox0eW70pXngjf44fcRZ7xgG4X/7k2GZczwT+6
         oQZ9FKRgZyoqexWNd99Ggw/gWXutfs54ZVKgC50sTQVN7Ou95JQixe3hCMhJcSo+vZ7C
         vxvhhg4HCnEy9SEiO4qBcuxN68wdxtigcugwrULLoE62z1y48XvxIntWjCR47dVqx0dE
         T9hfnpzmlo1wc8sNxjZVyIUKKJqpE3XHt6k8VfGxKquFvVHkQg6DRrzDUYzlMwopZ+GP
         JFx7jSD0qLDK4hAVvGLQlMmO5jABNH0bwEyhF0yJzj1rPD3pKZUH2amw0tsv4Nf7SPfn
         bqpw==
X-Gm-Message-State: AOAM532pFOD2Wr6+hfLgrfVKWpuPq0eg29m0mEUXpTO5Ftfpk9NsAUv1
        cFpfe1NhWSB0tvnSh2TUtbrYW43IqU8=
X-Google-Smtp-Source: ABdhPJxCeEy4ds8MLtJ2q7A0SJ6W3n2FCNrATMmWMRda0ojnCAdqSUhp5e3X3SSyBHwlV9a9hEUqVA==
X-Received: by 2002:a05:6808:14c4:: with SMTP id f4mr14852788oiw.76.1637156101349;
        Wed, 17 Nov 2021 05:35:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm4217973otg.10.2021.11.17.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:35:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:34:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/12] watchdog: s3c2410: Let kernel kick watchdog
Message-ID: <20211117133459.GD2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-5-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:35PM +0200, Sam Protsenko wrote:
> When "tmr_atboot" module param is set, the watchdog is started in
> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
> watchdog core driver know it's running. This way watchdog core can kick
> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
> enabled), until user space takes control.
> 
> WDOG_HW_RUNNING bit must be set before registering the watchdog. So the
> "tmr_atboot" handling code is moved before watchdog registration, to
> avoid performing the same check twice. This is also logical because
> WDOG_HW_RUNNING bit makes WDT core expect actually running watchdog.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - Added explanation on moving the code block to commit message
>   - [PATCH 03/12] handles the case when tmr_atboot is present but valid
>     timeout wasn't found
> 
>  drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 00421cf22556..0845c05034a1 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -604,6 +604,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	/*
> +	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
> +	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> +	 *
> +	 * If we're not enabling the watchdog, then ensure it is disabled if it
> +	 * has been left running from the bootloader or other source.
> +	 */
> +	if (tmr_atboot) {
> +		dev_info(dev, "starting watchdog timer\n");
> +		s3c2410wdt_start(&wdt->wdt_device);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
> +	} else {
> +		s3c2410wdt_stop(&wdt->wdt_device);
> +	}
> +
>  	ret = watchdog_register_device(&wdt->wdt_device);
>  	if (ret)
>  		goto err_cpufreq;
> @@ -612,17 +627,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_unregister;
>  
> -	if (tmr_atboot) {
> -		dev_info(dev, "starting watchdog timer\n");
> -		s3c2410wdt_start(&wdt->wdt_device);
> -	} else {
> -		/* if we're not enabling the watchdog, then ensure it is
> -		 * disabled if it has been left running from the bootloader
> -		 * or other source */
> -
> -		s3c2410wdt_stop(&wdt->wdt_device);
> -	}
> -
>  	platform_set_drvdata(pdev, wdt);
>  
>  	/* print out a statement of readiness */
> -- 
> 2.30.2
> 
