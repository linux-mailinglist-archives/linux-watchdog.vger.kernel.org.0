Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 058B363C9A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbfGIUP6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:15:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45207 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbfGIUP6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:15:58 -0400
Received: by mail-pl1-f196.google.com with SMTP id y8so5949101plr.12
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jul 2019 13:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3OyCTROGSOtwC2JLsqiiLooC2B8qUx/I5QiV5tieBzw=;
        b=GujH4kmLP+42ATFTAIzdQSfM1SuOY+Ufbt9goC1VtUp1ydZeHlu1QKFTjmpws94FVp
         IlrO+ZG9Ipo7HDJGZE5gziQqn9PoEXs6tozuqSD3uM+1CEfp0LG4u6Vvqx+1WB48hXiC
         wgjSvvywLQ/h9mi4XUb2g8cDwoxJhaePW0f9xaphJ7+e6Dry/sM3rAWhqfna6IMnus0U
         967Qlp11PV2OKob8KKUUuRxzGPSGeIQ31KG9l27UvVqzxjexHYpLATXkPna2Mk6tj/nV
         8vSgBc36488/5X+AfH6GdFVRWvdKgje6elsxS2Q1WvxVRW2Yvh2M/xluVI4kVxKve148
         JwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3OyCTROGSOtwC2JLsqiiLooC2B8qUx/I5QiV5tieBzw=;
        b=oG18ep1vxj3CWJFMz/XnEvrl6+k84K2a/dn/TpjRtfLfPk5ug2KmxRiH+40xpOdF0n
         wwnjjMBYFwc+RzHcrpA+ARSr1xoUGVfzJhesgF9hVOma1qsVtoaEcxkWLWULcOGt+zp4
         PA5Ux55Zb0oEVOjwtsD/+Ve2b/s6vV1mff4YfaLtouOyVlj/GCizLabg4mCiXoSM9s/p
         tUShXrxGr+7YVaA5Yr9B7RLcub5BclBNgC+wOiVJKs0KOhYHNMVcmP0H0dJMj3wYgoEK
         QirM9gqeDurFPODHzFyhVY7SSxX9kp3HrC5gpd1egJDIqHQZLRlQzitQf23BeCVby2S+
         8tjA==
X-Gm-Message-State: APjAAAVLdUvBE9A8wYeU5S8I3MVlIelpHkRjztKpqaWADjsjip3lQo3D
        l3EOq1o4IX2Gfwf1YCaZ46A=
X-Google-Smtp-Source: APXvYqwX+2/XkAalDSVgttZIYxzkmAbWVpU9RuB0/TckQQguODmxy0AiqS+/MfMySOTOo9kNM6gsOw==
X-Received: by 2002:a17:902:2be8:: with SMTP id l95mr32127269plb.231.1562703357854;
        Tue, 09 Jul 2019 13:15:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2sm117680pgo.92.2019.07.09.13.15.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 13:15:57 -0700 (PDT)
Date:   Tue, 9 Jul 2019 13:15:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] watchdog: cadence_wdt: Move clock detection
 earlier in probe
Message-ID: <20190709201556.GB27937@roeck-us.net>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-2-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709200801.42313-2-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 09, 2019 at 08:09:03PM +0000, Melin Tomas wrote:
> Timeout calculation needs clock frequency, so init clock and calculate
> prescaler value earlier in the probe.
> 
> Preparational step for calculating maximum and minimum timeout values
> for driver.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/cadence_wdt.c | 50 +++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index a22f2d431a35..ddbf602bdc40 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -300,6 +300,31 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	if (!wdt)
>  		return -ENOMEM;
>  
> +	wdt->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(wdt->clk)) {
> +		dev_err(dev, "input clock not found\n");
> +		return PTR_ERR(wdt->clk);
> +	}
> +
> +	ret = clk_prepare_enable(wdt->clk);
> +	if (ret) {
> +		dev_err(dev, "unable to enable clock\n");
> +		return ret;
> +	}
> +	ret = devm_add_action_or_reset(dev, cdns_clk_disable_unprepare,
> +				       wdt->clk);
> +	if (ret)
> +		return ret;
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
> @@ -333,31 +358,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(cdns_wdt_device);
>  	watchdog_set_drvdata(cdns_wdt_device, wdt);
>  
> -	wdt->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(wdt->clk)) {
> -		dev_err(dev, "input clock not found\n");
> -		return PTR_ERR(wdt->clk);
> -	}
> -
> -	ret = clk_prepare_enable(wdt->clk);
> -	if (ret) {
> -		dev_err(dev, "unable to enable clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, cdns_clk_disable_unprepare,
> -				       wdt->clk);
> -	if (ret)
> -		return ret;
> -
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
>  	watchdog_stop_on_reboot(cdns_wdt_device);
> -- 
> 2.17.2
> 
