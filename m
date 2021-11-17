Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3A4454763
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237675AbhKQNhl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhKQNhj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:37:39 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DC3C061570;
        Wed, 17 Nov 2021 05:34:41 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso4725026otg.9;
        Wed, 17 Nov 2021 05:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wy9KWdFsPS86+5pUwTqQCS5sOdpXwF6+MAP4+khwDIE=;
        b=PSFUoVkFmJ+fRZ0F+yncGWzFm20mTllys+Pku7rT+GV1EPQ7eGP4E06k8/pQA8v9m5
         R20NJD1UQaMPNKlrsD6sESfp0TeNotlaNJHNOQKPrG2ZgJzG2APDQoduvKvKsku6Yk+V
         o4PGDiaXFY1Ic45stbW7zoEf91YweSV8zUpZGOIvLS3p+gN4vlVZSXlVikITM93veDwb
         hqtp1XqQxgjstqFWK5KV8eI2lGlIWoAMz7HmrqiyuPNa29FyFz8jzZsHEJByzFc5X87v
         g17eg/HVhnlVl19wXAlxbWpLEISphQE7ucX2a/yQzHox/IwSCG++DnXsrebmEDGX4JFZ
         H06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Wy9KWdFsPS86+5pUwTqQCS5sOdpXwF6+MAP4+khwDIE=;
        b=5Wd0GVBV6PohjDIB+b7Ln5wl6x8kzyvGGjEvEBffh2oGyQv2sDr7d8blewSyUcZmNH
         ryUOjX5pwA/XwykdlhvpLtOsd3+x8QvMRQT/w4h/yF8zQr9uSR2Rx32yfNrVwxMpishe
         OR64V3Mb+EUGldl4e8eoeqz5SweNLyvtqFAt6haV6XESKR6xPUIgiY/9R5tJgnkJssI+
         7j0OQ5p6jVDSqPhnpA2omimB0YjPtw+ShSUopba2QiM+6QRfKXaDMSHJvEyCCIxuTnmI
         GBL59NM2j9gNZlXb8dwIbHNI74irAIpVORHy2z5g68jdqk4DWhuXzWNuWeX/VyGOUjq0
         vfPA==
X-Gm-Message-State: AOAM53169lNA7LrZG2+MBc4O5871C55ZCxGo1OY922zK8HsCoY7cGI0D
        /s4wWVnaJfAo+0E0iZ+ZIEA=
X-Google-Smtp-Source: ABdhPJxbLXZmbETiNeKa0D8vvqG/dHkHE+dHKJFgixByALJaKy34a4aFKthB8B7OalwO0Ee21dDxzg==
X-Received: by 2002:a05:6830:3110:: with SMTP id b16mr13839649ots.212.1637156080631;
        Wed, 17 Nov 2021 05:34:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bf17sm5144950oib.27.2021.11.17.05.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:34:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:34:38 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/12] watchdog: s3c2410: Fail probe if can't find
 valid timeout
Message-ID: <20211117133438.GC2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-4-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-4-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:34PM +0200, Sam Protsenko wrote:
> Driver can't work properly if there no valid timeout was found in
> s3c2410wdt_set_heartbeat(). Ideally, that function should be reworked in
> a way that it's always able to find some valid timeout. As a temporary
> solution let's for now just fail the driver probe in case the valid
> timeout can't be found in s3c2410wdt_set_heartbeat() function.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 2395f353e52d..00421cf22556 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -515,7 +515,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	struct s3c2410_wdt *wdt;
>  	struct resource *wdt_irq;
>  	unsigned int wtcon;
> -	int started = 0;
>  	int ret;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> @@ -581,15 +580,15 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
>  					wdt->wdt_device.timeout);
>  	if (ret) {
> -		started = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
> -					S3C2410_WATCHDOG_DEFAULT_TIME);
> -
> -		if (started == 0)
> -			dev_info(dev,
> -				 "tmr_margin value out of range, default %d used\n",
> +		ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
> +					       S3C2410_WATCHDOG_DEFAULT_TIME);
> +		if (ret == 0) {
> +			dev_warn(dev, "tmr_margin value out of range, default %d used\n",
>  				 S3C2410_WATCHDOG_DEFAULT_TIME);
> -		else
> -			dev_info(dev, "default timer value is out of range, cannot start\n");
> +		} else {
> +			dev_err(dev, "failed to use default timeout\n");
> +			goto err_cpufreq;
> +		}
>  	}
>  
>  	ret = devm_request_irq(dev, wdt_irq->start, s3c2410wdt_irq, 0,
> @@ -613,10 +612,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_unregister;
>  
> -	if (tmr_atboot && started == 0) {
> +	if (tmr_atboot) {
>  		dev_info(dev, "starting watchdog timer\n");
>  		s3c2410wdt_start(&wdt->wdt_device);
> -	} else if (!tmr_atboot) {
> +	} else {
>  		/* if we're not enabling the watchdog, then ensure it is
>  		 * disabled if it has been left running from the bootloader
>  		 * or other source */
> -- 
> 2.30.2
> 
