Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFDF7627DF
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2019 20:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbfGHSDl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jul 2019 14:03:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38747 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfGHSDl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jul 2019 14:03:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id z75so8074970pgz.5
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Jul 2019 11:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8Fv4jm8UKUSRqMWaXyAnmh8jffuO2lweOrXfAJGaGlM=;
        b=uGA1kizTLGs8j4KQ3Kgr/u1ZANEp9WbVnN9wDqt4Wx0Yt9l53V3cp+JXs5m7jl85cJ
         ZAp4qR7MH5mRlk7tRbcsHYprVWa3lSUogAMJhXx1haU8jdLV33n6w+ZgZEoo6vR851XF
         Iwvafg8QDfsNILSz1rfT0smfgN1QVUCJ8yqE33A4arXG9XHyeu2RrD3aEhaKB273Aqe8
         Ns02dey1jn7ycrjQN0B0Tfp7WQLAmrYQZ+YvmbmEvzn5Y74uj0wk0t7SHi8fcSjdpYQ3
         xIvzvXOP9wfb6tbAh9cvO3mWt6/jO4CgFD0zyMZGX08N394n3ndxCUirD5UZiQd8/CrQ
         kDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=8Fv4jm8UKUSRqMWaXyAnmh8jffuO2lweOrXfAJGaGlM=;
        b=eMMP5ctfjLHiLsCUw/wyWmXyP+LkFCfn89++q2YCC/ApDw6gkZnrAio7i9lavyb8En
         Cw6TvgoIvTfWeJzT7+yMYKCpbm0gMhJ1Bc5lmgJDMgpdfZOkRsYQCrh+6Q8msejSAfdF
         T8AsBWv2/4UQPyNqGRAuieNUyhutHvfnTQsCu8IiPr4QohJ6B/7+xIQZ+klX03KGNEEO
         6J6PF1JhgC4iTiIfnNVb5sa4jB2Jr5/X/jNpGmq5bt4izJ4GtMiktG18vW8O9w6vntzy
         +y2Tyi2XiQC7RfoMmqWGnnpXTenjkdQWVvx5DZ5h9BNBsHE3hHR608CGcZR0wDBBo49n
         dTQw==
X-Gm-Message-State: APjAAAWm41agDD22TIw/m8kugNqjlq0uvmZsehi4vV613YsE4fODW18i
        r1OVb6TGMlyynEVmGPRzGgsBIyz2
X-Google-Smtp-Source: APXvYqwCG5eESWFGtyMLFNQCIOnNGHWB2fo0GiK+fAWQCuQDDdRhTbVUZqff+fV3dayY8ItHs3LaHA==
X-Received: by 2002:a65:6497:: with SMTP id e23mr24431867pgv.89.1562609020460;
        Mon, 08 Jul 2019 11:03:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r1sm20316313pfq.100.2019.07.08.11.03.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:03:39 -0700 (PDT)
Date:   Mon, 8 Jul 2019 11:03:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] watchdog: cadence_wdt: Move clock detection
 eariler in probe
Message-ID: <20190708180338.GA14226@roeck-us.net>
References: <20190705114522.42565-1-tomas.melin@vaisala.com>
 <20190705114522.42565-2-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705114522.42565-2-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 05, 2019 at 11:46:02AM +0000, Melin Tomas wrote:
> Timeout calculation needs clock frequency, so init clock and calculate
> prescaler value eariler in the probe.
> 
earlier; also in subject line

> Preparational step for calculating maximum and minimum timeout values
> for driver.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index c3924356d173..415bd6dd1edb 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -295,6 +295,22 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	if (!wdt)
>  		return -ENOMEM;
>  
> +	wdt->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(wdt->clk)) {
> +		dev_err(&pdev->dev, "input clock not found\n");
> +		ret = PTR_ERR(wdt->clk);
> +		return ret;

		return PTR_ERR(wdt->clk);

[ ok, that is from the old code ... ]

> +	}
> +
> +	clock_f = clk_get_rate(wdt->clk);
> +	if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> +		wdt->prescaler = CDNS_WDT_PRESCALE_512;
> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
> +	} else {
> +		wdt->prescaler = CDNS_WDT_PRESCALE_4096;
> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_4096;
> +	}
> +
>  	cdns_wdt_device = &wdt->cdns_wdt_device;
>  	cdns_wdt_device->info = &cdns_wdt_info;
>  	cdns_wdt_device->ops = &cdns_wdt_ops;
> @@ -334,28 +350,12 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(cdns_wdt_device);
>  	watchdog_set_drvdata(cdns_wdt_device, wdt);
>  
> -	wdt->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(wdt->clk)) {
> -		dev_err(&pdev->dev, "input clock not found\n");
> -		ret = PTR_ERR(wdt->clk);
> -		return ret;
> -	}
> -
>  	ret = clk_prepare_enable(wdt->clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "unable to enable clock\n");
>  		return ret;
>  	}
>  
The substantial difference here is that clk_prepare_enable() was called
before the actual clock rate was retrieved. I don't know if that makes
a substantial difference, but on the other side I don't see why the above
code isn't moved as well. What I _do_ see, however, is that this patch
isn't based on the latest mainline kenrel, since mainline has a call to
devm_add_action_or_reset() after clk_prepare_enable(). Please rebase.

> -	clock_f = clk_get_rate(wdt->clk);
> -	if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> -		wdt->prescaler = CDNS_WDT_PRESCALE_512;
> -		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
> -	} else {
> -		wdt->prescaler = CDNS_WDT_PRESCALE_4096;
> -		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_4096;
> -	}
> -
>  	spin_lock_init(&wdt->io_lock);
>  
>  	ret = watchdog_register_device(cdns_wdt_device);
