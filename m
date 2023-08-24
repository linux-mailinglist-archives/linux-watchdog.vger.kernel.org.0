Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFDC787487
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Aug 2023 17:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237072AbjHXPrf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Aug 2023 11:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbjHXPrG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Aug 2023 11:47:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB4C1B0
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 08:47:00 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-26f3e26e59cso33719a91.0
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692892020; x=1693496820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KupZybbNeuYvowlyv49Esa6YtE/PSmlLNVj4PVB8Iwg=;
        b=OTpO5kS/pvve2X8ojWhslKnZeS7skOebDhO2MF0cSG4sgLZypv/kiHw9HU8WSZHWmS
         zXqujEtSDDFXRpUq444xUc0fKs9kGVHYkcVCPwOdyNgqlyn6ShyRkLQYkoNNSnaIsBli
         MPxA0EHZVRZ3P2CzDW4rp/eaBtCQfnxTgFRI+fuS3sw5PbT1y9JwYJUfOX9pIrPhwHYW
         TauGIlIJV37WNaqm+jUHF6jM9S7wD5sNAd3dQ/T03yu+NbtxA24QWLhEKWmdViT2ffNs
         FFJkHfZDcrLHcNsS/KhA/nqI1TrLtIqNTD+d0Q9VhdY8OOw6MG+qLWWNK70Dl7RoL3+C
         IXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692892020; x=1693496820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KupZybbNeuYvowlyv49Esa6YtE/PSmlLNVj4PVB8Iwg=;
        b=RGg7gRUCSieTGk51CIYXrscDufZMf3rpYcUdGVWOqcLAl7QYda+ACNuQoXC29dULrb
         Ix2A5ejV67QD8GzNsqT5/EsQ0WG28iiGl2Omq4IUUcmFq2LfIlAj52fFvCYZHR0u3PIy
         TlYbloRUR2dczGdvi52FMDBjKi5eKd8nLziiXM22zBtQsqj4tEuuQKQdMgwijzPkteDj
         o6W5LmkbY2My0248dVeQmQtDxfqCYcSo1f3HO+FhH8YM8rta19jgHqh8tWaE6bcAiKtP
         enGIpcPFSq1KU9GGkEP082h4j5KFPOeSC+7IBZLLIsxArycebM+Ow7PlcJQbcIOY5soO
         5+GA==
X-Gm-Message-State: AOJu0YwzINvtMuzgc5GWGkTEO8BEihlTQNkECNccYEqYiaIygtE2Izfw
        inXJMQdOpBP+jFxWzNm+RvSrYtGIPGY=
X-Google-Smtp-Source: AGHT+IGbVjP7dTUom1F74Zo1Gd/YEv42xZqtuQOlC/Ln/ZP/zRbzRHPszuxqbsjIZj+hnlNbn9+sow==
X-Received: by 2002:a17:90a:a090:b0:26b:494f:ae5d with SMTP id r16-20020a17090aa09000b0026b494fae5dmr23217429pjp.1.1692892019920;
        Thu, 24 Aug 2023 08:46:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ci24-20020a17090afc9800b00265a7145fe5sm1758258pjb.41.2023.08.24.08.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 08:46:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Aug 2023 08:46:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@tuxon.dev, xt.hu@cqplus1.com
Subject: Re: [PATCH -next 1/3] watchdog: at91sam9_wdt: Use the
 devm_clk_get_enabled() helper function
Message-ID: <3971ee12-dd25-4be7-b052-d23e288fc3b8@roeck-us.net>
References: <20230824135514.2661364-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824135514.2661364-2-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 24, 2023 at 09:55:12PM +0800, Jinjie Ruan wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
> -- 
> 2.34.1
> 
