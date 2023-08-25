Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41D5787EF2
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Aug 2023 06:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbjHYEP2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Aug 2023 00:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241599AbjHYEPR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Aug 2023 00:15:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712511FF1
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 21:15:12 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3ff006454fdso4438345e9.1
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1692936911; x=1693541711;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/y+2e7tyEH/8XXEzBXEvbs1HVfpIcen81u4rY1OqZs=;
        b=mH4xnMWQJeiZ6pemGzzkNGNZLCG5RAGBJzZ4fnm/R5ZculopKZNjRExvOWtmsYHznu
         7kMfE5Qh8M+XnD7hgb9Gc4AfWTMuK3JqnruJBc64mOobdpuj138dcqFOuUwvkUalgK2h
         /0P6410XQX+wWfrIq3CLhRYfUNIajWFoQmAobdiFwPmfqUaWo3JQPo4C4wxPKKPoogag
         9KU7AEcvSooECvg6w3O0d60ODnXuTmzEZlV3zFTHc30ZKm8O2tK+FiwydbK4iqxiLxUs
         2nqYpQGqQRne5qzavUuqIM2MnZtKaLod4Q1hvNylU2SyAxBNzF3i1WwEI8ezSuNjT8iu
         a6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692936911; x=1693541711;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/y+2e7tyEH/8XXEzBXEvbs1HVfpIcen81u4rY1OqZs=;
        b=cEVj/i/ZHsV20KPEDJLtHxlb+EFz4WbOO6vq7t/D4RQV6SO8dWklLifSjDXaeZY6C0
         9y04AxMgIR8jXcpHDOT4Z+SMKH/9QNYC1TG+E6L2f3AcDrEH+YuWcBeq4algISr/Sq9Q
         tRr+idKYvVypXUShS8hkib/FnZ9n/c6CYUrsNsmNb1sUizIk2ljX30vRlWm5jWYWhTJ1
         v6s2EY6g70+p4ZZx3j/pTIQQH0JKm9BJsArCorQ8/GMQnUcqfPM9SbOj//NLRe0tz8Tf
         EwCGA/Pq+7yKm7xPOrBeBM/Rlxsf/pbH3OSvT/uBULBshgh8ZnWIJYFszt9zUNVSV7w6
         vfkQ==
X-Gm-Message-State: AOJu0Yy/CfLiwA7rtXWl018tXVgtDmxHHpithjezN0kEdsCwkL411yfS
        hW6lS4UY/rRRF8ThLkMabZblxQ==
X-Google-Smtp-Source: AGHT+IGMzqwRjrMv2uoUT9v1EVMOB34ExxgEm5arRlt2EPjF5FG6GBrCHFM33fXH/1WzLYiUkCSXmg==
X-Received: by 2002:a05:600c:ce:b0:3fe:f726:4a94 with SMTP id u14-20020a05600c00ce00b003fef7264a94mr8175608wmm.14.1692936910780;
        Thu, 24 Aug 2023 21:15:10 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.1])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b004013797efb6sm3839357wmj.9.2023.08.24.21.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 21:15:10 -0700 (PDT)
Message-ID: <5d16a423-b184-4c5c-ad55-06e34811ca9a@tuxon.dev>
Date:   Fri, 25 Aug 2023 07:15:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 1/3] watchdog: at91sam9_wdt: Use the
 devm_clk_get_enabled() helper function
Content-Language: en-US
To:     Jinjie Ruan <ruanjinjie@huawei.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
        linux@roeck-us.net, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, xt.hu@cqplus1.com
References: <20230824135514.2661364-2-ruanjinjie@huawei.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230824135514.2661364-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/24/23 16:55, Jinjie Ruan wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  drivers/watchdog/at91sam9_wdt.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
> index fed7be246442..b111b28acb94 100644
> --- a/drivers/watchdog/at91sam9_wdt.c
> +++ b/drivers/watchdog/at91sam9_wdt.c
> @@ -348,25 +348,21 @@ static int __init at91wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	wdt->sclk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(wdt->sclk))
> -		return PTR_ERR(wdt->sclk);
> -
> -	err = clk_prepare_enable(wdt->sclk);
> -	if (err) {
> +	wdt->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(wdt->sclk)) {
>  		dev_err(&pdev->dev, "Could not enable slow clock\n");
> -		return err;
> +		return PTR_ERR(wdt->sclk);
>  	}
>  
>  	if (pdev->dev.of_node) {
>  		err = of_at91wdt_init(pdev->dev.of_node, wdt);
>  		if (err)
> -			goto err_clk;
> +			return err;
>  	}
>  
>  	err = at91_wdt_init(pdev, wdt);
>  	if (err)
> -		goto err_clk;
> +		return err;
>  
>  	platform_set_drvdata(pdev, wdt);
>  
> @@ -374,11 +370,6 @@ static int __init at91wdt_probe(struct platform_device *pdev)
>  		wdt->wdd.timeout, wdt->nowayout);
>  
>  	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(wdt->sclk);
> -
> -	return err;
>  }
>  
>  static int __exit at91wdt_remove(struct platform_device *pdev)
> @@ -388,7 +379,6 @@ static int __exit at91wdt_remove(struct platform_device *pdev)
>  
>  	pr_warn("I quit now, hardware will probably reboot!\n");
>  	del_timer(&wdt->timer);
> -	clk_disable_unprepare(wdt->sclk);
>  
>  	return 0;
>  }
