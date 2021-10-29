Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A196943F3D3
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 02:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhJ2AXw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 20:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhJ2AXv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 20:23:51 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD84C061570;
        Thu, 28 Oct 2021 17:21:23 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id t7-20020a4aadc7000000b002b8733ab498so2753587oon.3;
        Thu, 28 Oct 2021 17:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hkISm2XQKHK0ZSZ3i+ztII2UptzAIeO96Q6bGgxxNrg=;
        b=Br6M5j0tpkSgGtf7MMDs1LqU46PDGPRLUwuKd3n39tlbKGGKim18R6fuq5QHKbJa5Z
         xglkyT+iThEp02rKXHo4pyktZCV7TFLB5mJXvZnQ0/ec0/N8fr9qsid7NLTCH3J00ihv
         qfJEAtjoo+97YPBqqF3Xm/6Fhe0w4rfx3WJbjwP3RtZ979D+i6EAtqf2o+kQuPE6Qvl2
         e+aj0whV9Xvgoevp0ItcCt/W3eH8Wg7vqKY2YgYUoHdHyU7j0KytxzGyVqbe8jxARmMD
         2xBNnX+9cZLNK/XacRbXDR9VFodIq0MdAwtozoyJBelXVhvKjQCAj7Y8NsxV/7REbpE8
         4ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hkISm2XQKHK0ZSZ3i+ztII2UptzAIeO96Q6bGgxxNrg=;
        b=5aCsmMbT5oGtAcTLJCs4SqAt3bmHC/HsLgq2B48v+qWSQtLcMG9QbDlSaLTfEKRvpl
         ZKXtuvY+T1xOXpbXHe7YO5HCjmW/gZDu4JcxoKaeICpGhUo6Vwn4xbNZaiuugzX3fRkZ
         sISyskTE4Tp0RC02rmR6RYKce4rcDXDDC5FgYQGRBE545LS6fbRzlb7/UzPD+x6S4Ls3
         dJP58Yi4rjlJZqGGVh1+FaueeN3Do6fH8Q60th8JM0+KUGW9d5Ncss8aNo8M+hK4ZVov
         UQB2I7ySzOeeWf9CRCPT7FNzzHhvXubWHfy56YI2DJCaLMtZ0pBHA6RE9chKud61SM6B
         vgNw==
X-Gm-Message-State: AOAM533Y26RyLoc0UxzGu5OVflTeV1Jo9gvUGH5hFj4YLp6mzmBnxzAu
        eX65V/uNuO+et7reYA77gfNDVOcgl74=
X-Google-Smtp-Source: ABdhPJzsfsqS32TLHTj3+SSLozXuQ4XtOR4hsfFwSwzl6PJDg3deazVRYIKPw1O5HwjI/9g8yQIXZg==
X-Received: by 2002:a4a:6f59:: with SMTP id i25mr5467536oof.78.1635466882869;
        Thu, 28 Oct 2021 17:21:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w22sm1392938oie.26.2021.10.28.17.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 17:21:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 5/7] watchdog: s3c2410: Introduce separate source clock
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-6-semen.protsenko@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <51128b74-de5d-1758-282b-1d4c5250a38d@roeck-us.net>
Date:   Thu, 28 Oct 2021 17:21:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/28/21 11:35 AM, Sam Protsenko wrote:
> Some Exynos chips (like Exynos850) have dedicated source clock. That
> clock is provided from device tree as "watchdog_src" clock. In such
> case, "watchdog" clock is just a peripheral clock used for register
> interface. If "watchdog_src" is present, use its rate instead of
> "watchdog" for all timer related calculations.
> 

If the "watchdog_src" clock is present, is "watchdog" clock still needed ?
Please state that explicitly, since it is kind of unusual.

Guenter

> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/watchdog/s3c2410_wdt.c | 33 +++++++++++++++++++++++++++------
>   1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index a5ef7171a90e..bfc5872ca497 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -126,6 +126,8 @@ struct s3c2410_wdt_variant {
>   struct s3c2410_wdt {
>   	struct device		*dev;
>   	struct clk		*clock;
> +	struct clk		*clock_src;
> +	unsigned long		freq_src;
>   	void __iomem		*reg_base;
>   	unsigned int		count;
>   	spinlock_t		lock;
> @@ -213,10 +215,8 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
>   
>   /* functions */
>   
> -static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
> +static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
>   {
> -	unsigned long freq = clk_get_rate(clock);
> -
>   	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
>   				       / S3C2410_WTCON_MAXDIV);
>   }
> @@ -364,7 +364,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>   				    unsigned int timeout)
>   {
>   	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> -	unsigned long freq = clk_get_rate(wdt->clock);
> +	unsigned long freq = wdt->freq_src;
>   	unsigned int count;
>   	unsigned int divisor = 1;
>   	unsigned long wtcon;
> @@ -627,13 +627,27 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	/* "watchdog_src" clock is optional; if it's not present -- just skip */
> +	wdt->clock_src = devm_clk_get(dev, "watchdog_src");
> +	if (!IS_ERR(wdt->clock_src)) {
> +		ret = clk_prepare_enable(wdt->clock_src);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable source clock\n");
> +			ret = PTR_ERR(wdt->clock_src);
> +			goto err_clk;
> +		}
> +		wdt->freq_src = clk_get_rate(wdt->clock_src);
> +	} else {
> +		wdt->freq_src = clk_get_rate(wdt->clock);
> +	}
> +
>   	wdt->wdt_device.min_timeout = 1;
> -	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
> +	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->freq_src);
>   
>   	ret = s3c2410wdt_cpufreq_register(wdt);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to register cpufreq\n");
> -		goto err_clk;
> +		goto err_clk_src;
>   	}
>   
>   	watchdog_set_drvdata(&wdt->wdt_device, wdt);
> @@ -707,6 +721,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>    err_cpufreq:
>   	s3c2410wdt_cpufreq_deregister(wdt);
>   
> + err_clk_src:
> +	if (!IS_ERR(wdt->clock_src))
> +		clk_disable_unprepare(wdt->clock_src);
> +
>    err_clk:
>   	clk_disable_unprepare(wdt->clock);
>   
> @@ -727,6 +745,9 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>   
>   	s3c2410wdt_cpufreq_deregister(wdt);
>   
> +	if (!IS_ERR(wdt->clock_src))
> +		clk_disable_unprepare(wdt->clock_src);
> +
>   	clk_disable_unprepare(wdt->clock);
>   
>   	return 0;
> 

