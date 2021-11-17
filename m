Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4276A454791
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237769AbhKQNk1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhKQNkY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:40:24 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F264C061570;
        Wed, 17 Nov 2021 05:37:26 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id x1-20020a4aea01000000b002c296d82604so1079493ood.9;
        Wed, 17 Nov 2021 05:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ao5IAeb8fqJjTHl5SOq4atwKMb2Ljlv+m0qlQXSS4M4=;
        b=drDoMbTwOFt4QLQphLBJtu+eVHeOazXIAXMc72JBOZxy0ElYTAvdpVH5tY6mKsExq6
         gXaD9YYXe9OpeLCFxLIY37NMNNVbgg8aKH/U2vQ7aGH5JOa16AXkG24wyzNV5+23RVEa
         iq2lYYluZWPESZu2UGwUo4yue4gr+I747lZ6eX2BrTxZ5jCTXdH8NOv+kns65c9AGE4r
         bjjTtw6Af0zgTt7VWoTG5zEcpCwD+zU4haTTXhtMxSGX13qNUawoLH8li7sQARsyLkCb
         8mP3NYNjGPcBk6d1N98m9381aXFkuo69R2jsGegTV9iJfFN7nDx0VE8XJ2s2DqTclAj5
         b5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Ao5IAeb8fqJjTHl5SOq4atwKMb2Ljlv+m0qlQXSS4M4=;
        b=IdaA6koyhgEYGO9ZS8WeBLpDA+rJYpFnpWBdMugdBoFmel0sgbfWPUt36MXieYlDB5
         mAFvi03woRfc+lxiY5c9hWCJkL1YwClG3gRV/1RFn51h0gUlfeSxBCVV6Ec7cuK8gvOy
         VEvgbD7W51dKtaufCdQveuU5010hKmflBCWbU7IPll6jxQkh4Ocf4mzyTsJ13Fzl2sFw
         UOn18wZiaYPwHlFn3VlckHPcMEaK7glddjlUvf+ghJ+MZ0/jZyTyd39/vUZ4RtuaypXh
         PbMF1rNma8h58IplklrpyJWhkxVQ+86tz6lLYIIlzagDSVyYsNK7lq56sn+/MvickNni
         r+jA==
X-Gm-Message-State: AOAM532blLU2spy9yjz1Em7RrhL/6+L9LMUkNB0ElPxUWjdypSyQm7WY
        5IXq7KCUULkI9ArEqvrQq5I=
X-Google-Smtp-Source: ABdhPJx1coylXfQxDys1b+PpYciHX5IJdP0elIwy5NJmgbaVFNEGZp5+EXXDKUjSdX5XRl8sqzVydQ==
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr3920687oos.25.1637156245667;
        Wed, 17 Nov 2021 05:37:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bh12sm5127267oib.25.2021.11.17.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:37:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:37:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 11/12] watchdog: s3c2410: Remove superfluous err label
Message-ID: <20211117133724.GK2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-12-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-12-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:42PM +0200, Sam Protsenko wrote:
> 'err' label in probe function is not really need, it just returns.
> Remove it and replace all 'goto' statements with actual returns in
> place.
> 
> No functional change here, just a cleanup patch.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index f31bc765a8a5..96aa5d9c6ed4 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -627,22 +627,18 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>  	if (wdt_irq == NULL) {
>  		dev_err(dev, "no irq resource specified\n");
> -		ret = -ENOENT;
> -		goto err;
> +		return -ENOENT;
>  	}
>  
>  	/* get the memory region for the watchdog timer */
>  	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(wdt->reg_base)) {
> -		ret = PTR_ERR(wdt->reg_base);
> -		goto err;
> -	}
> +	if (IS_ERR(wdt->reg_base))
> +		return PTR_ERR(wdt->reg_base);
>  
>  	wdt->bus_clk = devm_clk_get(dev, "watchdog");
>  	if (IS_ERR(wdt->bus_clk)) {
>  		dev_err(dev, "failed to find bus clock\n");
> -		ret = PTR_ERR(wdt->bus_clk);
> -		goto err;
> +		return PTR_ERR(wdt->bus_clk);
>  	}
>  
>  	ret = clk_prepare_enable(wdt->bus_clk);
> @@ -757,7 +753,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   err_bus_clk:
>  	clk_disable_unprepare(wdt->bus_clk);
>  
> - err:
>  	return ret;
>  }
>  
> -- 
> 2.30.2
> 
