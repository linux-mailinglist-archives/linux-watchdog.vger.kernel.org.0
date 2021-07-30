Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93F13DB271
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhG3Epq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhG3Epp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:45:45 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67943C0613C1;
        Thu, 29 Jul 2021 21:45:41 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id o185so11441006oih.13;
        Thu, 29 Jul 2021 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zEWrjTmo3MRUFNpFLl3xWErCSGWlUtWoDdfX2AHaVUI=;
        b=RqBAr9ka+yi/PzlKqTMaJt6e0IVUvRZ9aDYZHsCdEm8qpBUoE0TQUUKnV0bKK1KvAs
         Rum1G1L8K/ODaF8c1SRiNiTVLW+Rh8kg9RefwnBGjemoC0sdWnIElUIz3Qn9eztAdR1y
         2H23/nzqWTPr+0orDB9pOQG9NIuI8/2b3K/vaY8u1Oi2HP39xffFLdwj+A0uGtPAQQU6
         F0i/cK3BTknOK03/tLsNM6bnKtwZlQUnml8/dN5wZPHYYp8QwqdTZ9Jg8U1zhx3kVzrR
         vi6/TeeTmp1kDlvSktLjG/xvRZijeyL+wQEXRVzlmqK1M0zv5ErG2CQLIwsS63QBStlg
         4y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=zEWrjTmo3MRUFNpFLl3xWErCSGWlUtWoDdfX2AHaVUI=;
        b=UbOHEjJbwkhyvu8oCLhEMxRU/5va/Se5fJjVaPqOKvpHThfy/vD6nUvqD2n2L0k7lT
         BwL+uRRb89YMeInXlevfvbcWKz8e/6ZRrFgPhepZ8aMnX81w9/lrjVFifdY2R9A1IIv1
         nlc6mVQnEhWaWHRKHCQOfZK9N3/9duwIQxeTczo124MKd6VZ1WFIN5VWCgg+aVfrA5cl
         O70z13jgFjEIbnDdfwRU7o/YfP14xcjqXeNNYGqr3yQGJCu3Vx1tyb+qt23QauowxhRt
         DgA4pYB4omTWymdh+seJ1v9hZOaBOiKmNFvxRO6ofoxCdsYsIB+ajabV9oZKdZzJogzO
         u3VQ==
X-Gm-Message-State: AOAM533/Pw/Zt2nIAfXQXeeq4hcOqAF7gxQgMN9BNXn0H4wV/gxmzAje
        SnocBdgJMz5bMEuK71fJhuA=
X-Google-Smtp-Source: ABdhPJz61dqqcK+n5Axb1Waxu7+0cvefK3q7Pe2mYa5sv6JQBavFLROP0E25WdcZeZP8p8c5E3umew==
X-Received: by 2002:aca:6109:: with SMTP id v9mr510193oib.147.1627620340741;
        Thu, 29 Jul 2021 21:45:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f16sm119238oiw.29.2021.07.29.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:45:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 29 Jul 2021 21:45:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Artem Lapkin <email2tema@gmail.com>
Cc:     narmstrong@baylibre.com, wim@linux-watchdog.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v4 1/3] watchdog: meson_gxbb_wdt: add nowayout parameter
Message-ID: <20210730044538.GA2110311@roeck-us.net>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-2-art@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730041355.2810397-2-art@khadas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 30, 2021 at 12:13:53PM +0800, Artem Lapkin wrote:
> Add nowayout module parameter
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---

<Formletter>  
Change log goes here. If it is missing, I won't know what changed.
That means I will have to dig out older patch versions to compare.
That costs time and would hold up both this patch as well as all other
patches which I still have to review.

For this reason, I will not review patches without change log.
</Formletter>

The change is small and recent enough that I remember, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

but please keep this in mind for future submissions.

Thanks,
Guenter

>  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..5aebc3a09652 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -29,6 +29,11 @@
>  #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
>  #define GXBB_WDT_TCNT_CNT_SHIFT			16
>  
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
>  struct meson_gxbb_wdt {
>  	void __iomem *reg_base;
>  	struct watchdog_device wdt_dev;
> @@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>  	data->wdt_dev.min_timeout = 1;
>  	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>  	watchdog_set_drvdata(&data->wdt_dev, data);
>  
>  	/* Setup with 1ms timebase */
> -- 
> 2.25.1
> 
