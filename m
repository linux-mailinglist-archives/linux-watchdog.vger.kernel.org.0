Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76EF45478E
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237774AbhKQNkF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237803AbhKQNkB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:40:01 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AB6C0613B9;
        Wed, 17 Nov 2021 05:37:03 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso4710661otj.11;
        Wed, 17 Nov 2021 05:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I69eXKu9Pl9dcVGlyyS6P2u2DpqiSOQReWIUssSKHr4=;
        b=UDJkqdSNbsaPGEUX5pO+I54nBdurPqbp34UHACckVnsxoYIFmjdwWEQfLk6XR3Vpx4
         IQYwmlPEKV7KQG38xyG1sAVSE8Aard7CXBwHNjWdc19o8HQrGL9A+VXkScArD8s+Q26D
         BX62LlSEI/uEg5Bp1hrRmYtguHDKXYNaD6t5yPwtx8/K+e0DGCy5SrieG02W0YYG65CN
         ncYhqQ681MotnGXegS/hW+nsNS7YdbrAX/KnWJIoo1dd5H6+34BD1wvnrUKz/QvJS+ep
         F4xzJ3TQIWRbKS4jiGli+hgeyh35gr0E+NeI71tORmgndLtE6NWghTO7m3o6IsRAA+Hh
         NqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=I69eXKu9Pl9dcVGlyyS6P2u2DpqiSOQReWIUssSKHr4=;
        b=6Lf22iOgv1+EJKDvxoUwmaTjHogtHUJ8ERS+1NxNeV919EpT1/TUm1VZSVagy7VMa4
         ibQV14jaP6UcSEUsMBVS2W1jqV9LJSyFFvTGr6sIHSpb8iQ1oGaokaXhbJzRKNu29VsP
         njzmwYbCiauiTRtVvQzIWYtfMrkot9PHOYrla4ZkQ8isLr12cZ693ObgwK4tVt4lq5l0
         l6vVx+DEkJveyvQPOdQ/YtKcq4RDSiU07TRDzKjwsPykVlCGQCPsRWRjQL2xlum6jzTJ
         YFlx4DCeTn3Jsrxsb40IdZVmix1J7oncK2hS1oB/VbliGAQFls6d2BktOHCIdBcDFbOQ
         TqIA==
X-Gm-Message-State: AOAM531fXv2BInAvBDTfjwMvEkP/IpMKMC2PWNLM4IgJxySnBt9toOZh
        U0gAd0ySdiSw366+AEDuwIc=
X-Google-Smtp-Source: ABdhPJz4yUNC7v+cd/88GA1RzQxxZqAhe7CEtNmmAYx3eXRfhJ8I+e1Iyy9aCgNK2GGfNDQzeX4GVg==
X-Received: by 2002:a9d:7459:: with SMTP id p25mr10949050otk.247.1637156222710;
        Wed, 17 Nov 2021 05:37:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e28sm4716430oiy.10.2021.11.17.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:37:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:37:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/12] watchdog: s3c2410: Support separate source clock
Message-ID: <20211117133700.GJ2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-11-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-11-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:41PM +0200, Sam Protsenko wrote:
> Right now all devices supported in the driver have the single clock: it
> acts simultaneously as a bus clock (providing register interface
> clocking) and source clock (driving watchdog counter). Some newer Exynos
> chips, like Exynos850, have two separate clocks for that. In that case
> two clocks will be passed to the driver from the resource provider, e.g.
> Device Tree. Provide necessary infrastructure to support that case:
>   - use source clock's rate for all timer related calculations
>   - use bus clock to gate/ungate the register interface
> 
> All devices that use the single clock are kept intact: if only one clock
> is passed from Device Tree, it will be used for both purposes as before.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Removed has_src_clk field: clk framework can handle NULL clk; added
>     s3c2410wdt_get_freq() function instead, to figure out which clock to
>     use for getting the rate
> 
> Changes in v2:
>   - Reworded commit message to be more formal
>   - Used separate "has_src_clk" trait to tell if source clock is present
>   - Renamed clock variables to match their purpose
>   - Removed caching source clock rate, obtaining it in place each time
>     instead
>   - Renamed err labels for more consistency
> 
>  drivers/watchdog/s3c2410_wdt.c | 56 +++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index f211be8bf976..f31bc765a8a5 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -153,7 +153,8 @@ struct s3c2410_wdt_variant {
>  
>  struct s3c2410_wdt {
>  	struct device		*dev;
> -	struct clk		*clock;
> +	struct clk		*bus_clk; /* for register interface (PCLK) */
> +	struct clk		*src_clk; /* for WDT counter */
>  	void __iomem		*reg_base;
>  	unsigned int		count;
>  	spinlock_t		lock;
> @@ -231,9 +232,14 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
>  
>  /* functions */
>  
> -static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
> +static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
>  {
> -	unsigned long freq = clk_get_rate(clock);
> +	return clk_get_rate(wdt->src_clk ? wdt->src_clk : wdt->bus_clk);
> +}
> +
> +static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
> +{
> +	const unsigned long freq = s3c2410wdt_get_freq(wdt);
>  
>  	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
>  				       / S3C2410_WTCON_MAXDIV);
> @@ -383,7 +389,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  				    unsigned int timeout)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> -	unsigned long freq = clk_get_rate(wdt->clock);
> +	unsigned long freq = s3c2410wdt_get_freq(wdt);
>  	unsigned int count;
>  	unsigned int divisor = 1;
>  	unsigned long wtcon;
> @@ -632,26 +638,42 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	wdt->clock = devm_clk_get(dev, "watchdog");
> -	if (IS_ERR(wdt->clock)) {
> -		dev_err(dev, "failed to find watchdog clock source\n");
> -		ret = PTR_ERR(wdt->clock);
> +	wdt->bus_clk = devm_clk_get(dev, "watchdog");
> +	if (IS_ERR(wdt->bus_clk)) {
> +		dev_err(dev, "failed to find bus clock\n");
> +		ret = PTR_ERR(wdt->bus_clk);
>  		goto err;
>  	}
>  
> -	ret = clk_prepare_enable(wdt->clock);
> +	ret = clk_prepare_enable(wdt->bus_clk);
>  	if (ret < 0) {
> -		dev_err(dev, "failed to enable clock\n");
> +		dev_err(dev, "failed to enable bus clock\n");
>  		return ret;
>  	}
>  
> +	/*
> +	 * "watchdog_src" clock is optional; if it's not present -- just skip it
> +	 * and use "watchdog" clock as both bus and source clock.
> +	 */
> +	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
> +	if (!IS_ERR(wdt->src_clk)) {
> +		ret = clk_prepare_enable(wdt->src_clk);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable source clock\n");
> +			ret = PTR_ERR(wdt->src_clk);
> +			goto err_bus_clk;
> +		}
> +	} else {
> +		wdt->src_clk = NULL;
> +	}
> +
>  	wdt->wdt_device.min_timeout = 1;
> -	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
> +	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
>  
>  	ret = s3c2410wdt_cpufreq_register(wdt);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to register cpufreq\n");
> -		goto err_clk;
> +		goto err_src_clk;
>  	}
>  
>  	watchdog_set_drvdata(&wdt->wdt_device, wdt);
> @@ -729,8 +751,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   err_cpufreq:
>  	s3c2410wdt_cpufreq_deregister(wdt);
>  
> - err_clk:
> -	clk_disable_unprepare(wdt->clock);
> + err_src_clk:
> +	clk_disable_unprepare(wdt->src_clk);
> +
> + err_bus_clk:
> +	clk_disable_unprepare(wdt->bus_clk);
>  
>   err:
>  	return ret;
> @@ -749,7 +774,8 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>  
>  	s3c2410wdt_cpufreq_deregister(wdt);
>  
> -	clk_disable_unprepare(wdt->clock);
> +	clk_disable_unprepare(wdt->src_clk);
> +	clk_disable_unprepare(wdt->bus_clk);
>  
>  	return 0;
>  }
> -- 
> 2.30.2
> 
