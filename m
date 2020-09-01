Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B2D25955D
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 17:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgIAPum (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 11:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728819AbgIAPuh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 11:50:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C556C06125F;
        Tue,  1 Sep 2020 08:50:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u20so1033506pfn.0;
        Tue, 01 Sep 2020 08:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HeGBPCmtRrSwxguF1t/lDmn0Piwm4iwKIT8Cjmy4NkE=;
        b=jUGWBg6UDQJ3uPksKhZadG9q93rq50zkSmOYkb+I7uRfsp/K3JEQx5xPSTtkl2PUNp
         4w7XOHG2bNhNAFOVF1ZueSiw3Z75ZRe+xy9lCQNrI+YtELLCDhDo8MdRUtX5D9Hiiivn
         N4PVbwfK7wVcHIDBrX46RpEkpLfiZ7Ro+pK/5YvV5kLWkDY3r21BXmHOc3xmrBlvZVq6
         EdVxlShmrwWim2V2Ga6mF+8NXk68vqhq1VwC9dadxI2zheO4vtl2A85KmYKJ8m4UJ3CW
         1Q18tBTLxdCprt7NxK+ia4He3scuEY/Xymwvd/UNlKcBogbWmaGjTkDWPvkNOtBeE7Sy
         lrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HeGBPCmtRrSwxguF1t/lDmn0Piwm4iwKIT8Cjmy4NkE=;
        b=rdC7epMpy2mueL2J/sQvOtHA/lU1l1bdYBubEsdLCN1CWJaKysN4dijjrSchTf3XsV
         cqk0qahaFAvvlfLcM+aphlLSwqOcDd+vu5WA7M1fFL1SGP77RCkbnjInYLB7BZ9S1zqG
         66LGKKrPnrHo7s8JXTUWdTbyErGoQBE1neOW2+TIMT/7niLkK4mIMxL5ueK0r9FeBcYo
         Ga5c9HZ0MutHW5pyIsZJgEPWvIzGPC9zxK1cgGiop4Xo0+Qx2fP4vVr32Av5POg1buKR
         bboIn/09f/4OxZ43TUWwOROy7OreUousAAQaeJ9PcsjrCpmQxAs9iv34T/mccbQJPXfX
         eqMg==
X-Gm-Message-State: AOAM531jLMgd3Yt8c59age4olMAVZUZSiChIn9dzaIgEwgXOofVA+nTb
        Fuf83BsvTb+7V99RViz1Vvs=
X-Google-Smtp-Source: ABdhPJyGGjI8lazFMYb/Odt42bJDkZ204tyXwU4ZazliCZIiAlQ0mvO/XkGrMisfYInXA8eBXVmzFA==
X-Received: by 2002:a65:6714:: with SMTP id u20mr2085793pgf.252.1598975431993;
        Tue, 01 Sep 2020 08:50:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x144sm2324377pfc.82.2020.09.01.08.50.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 08:50:31 -0700 (PDT)
Date:   Tue, 1 Sep 2020 08:50:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: rti: Simplify with dev_err_probe()
Message-ID: <20200901155030.GC106798@roeck-us.net>
References: <20200901153141.18960-1-krzk@kernel.org>
 <20200901153141.18960-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901153141.18960-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 01, 2020 at 05:31:41PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
> It is unusual to expect deferred probe from pm_runtime_get()...
> ---
>  drivers/watchdog/rti_wdt.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 705e8f7523e8..836319cbaca9 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -205,11 +205,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	clk = clk_get(dev, NULL);
> -	if (IS_ERR(clk)) {
> -		if (PTR_ERR(clk) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get clock\n");
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>  
>  	wdt->freq = clk_get_rate(clk);
>  
> @@ -230,11 +227,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "runtime pm failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "runtime pm failed\n");
>  
>  	platform_set_drvdata(pdev, wdt);
>  
> -- 
> 2.17.1
> 
