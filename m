Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E121B883F
	for <lists+linux-watchdog@lfdr.de>; Sat, 25 Apr 2020 19:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDYRuZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 25 Apr 2020 13:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726061AbgDYRuY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 25 Apr 2020 13:50:24 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A625DC09B04D;
        Sat, 25 Apr 2020 10:50:24 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o185so6279935pgo.3;
        Sat, 25 Apr 2020 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9/QIx+i/eRYyKxO5ZdGrT4Lvyj8gVgN5Twlj76RA4LI=;
        b=UnpXZf/pYEbBAXXEd12+Pr3ZwsfycFi2qHe/qA9tlLXecbynjcMKjDIELwVCliCfET
         rQhmas6SO84qqRSjcEd2Tc80fLyU4sGYqOGzcR1QrnIk57mMpq7Ph2Ezc6fUm/ouZ8yi
         PK3KcS15q8ggm7OavPF6kcjd2ss8gPVMlWeuui6w/yX/R72XuVrKFhPrNF4Hy21JHtnv
         tKbTIwFb9gZIkyiQKhfm33o1sAY6I4vIMPNj6QE+oXJ93N9cZUQmeZC3AC14m+4GukI4
         W9Tar28Pd/jAsrVNTrugpVF8ZII58Kb8+ncHwRncJI1ASgaQwtrlwZ2rOdpEAgWrOpd4
         Evjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9/QIx+i/eRYyKxO5ZdGrT4Lvyj8gVgN5Twlj76RA4LI=;
        b=i490UrE5DGURbtZbR0E0QFl4BB/oMUtf7hfWXobgESFOKfxTckHMl15xioNUqXHX2T
         rglu1uj+uFrbf9T9d3MRLzQM//hDed0YUOpNRom0mFDz62g1UK3fAJLmGv5O4SDjIlet
         759vCI8K7a+X/UVnDDAWzEOxU4pihPvVvkrV+RGKvCg0tNxJ+TX74QT5+/oCTlwqdRPD
         9nqYLGdbyaR2id3613Lp+U9BrDjFPWnWiYdY9uA5cK2Ftvi8AelmCD5qjPP/gdjJ6t+u
         yzMzUndmZBhVhqfe7j8xvgMzCAXF5KK7dAhkHMZBpYlnrVpSyqr25BX+ELOCBJ6Fd9fX
         uoKw==
X-Gm-Message-State: AGi0PuZ5AqgRTOrMFlOC28FQAcWKg24nlqUF2q7qUbPOvmk6f38uNZlR
        JneQRg5opkOK64u1+U6xVrc3vUQJ
X-Google-Smtp-Source: APiQypJWL3Rx6/LNTBvbdLOOA1SN+geZWB8ce37VRwRJMZU/+SEsJXhEwTiojcU4dvlO0T4XD9pN4w==
X-Received: by 2002:a63:cc:: with SMTP id 195mr14821173pga.373.1587837024243;
        Sat, 25 Apr 2020 10:50:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z23sm8541883pfr.136.2020.04.25.10.50.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 10:50:23 -0700 (PDT)
Date:   Sat, 25 Apr 2020 10:50:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] watchdog: da9063: Make use of pre-configured
 timeout during probe
Message-ID: <20200425175022.GA43048@roeck-us.net>
References: <20200403130728.39260-1-s.riedmueller@phytec.de>
 <20200403130728.39260-2-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403130728.39260-2-s.riedmueller@phytec.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 03, 2020 at 03:07:27PM +0200, Stefan Riedmueller wrote:
> The watchdog might already be running during boot with a timeout set by
> e.g. the bootloader. Make use of this pre-configured timeout instead of
> falling back to the default timeout if no device tree value is given.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
>  - Reworked patch to use the pre-configured timeout onyl as a fallback
>    instead of the default value.
>  - Removed info message.
> ---
>  drivers/watchdog/da9063_wdt.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 3d65e92a4e3f..423584252606 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -46,15 +46,16 @@ static unsigned int da9063_wdt_timeout_to_sel(unsigned int secs)
>  }
>  
>  /*
> - * Return 0 if watchdog is disabled, else non zero.
> + * Read the currently active timeout.
> + * Zero means the watchdog is disabled.
>   */
> -static unsigned int da9063_wdt_is_running(struct da9063 *da9063)
> +static unsigned int da9063_wdt_read_timeout(struct da9063 *da9063)
>  {
>  	unsigned int val;
>  
>  	regmap_read(da9063->regmap, DA9063_REG_CONTROL_D, &val);
>  
> -	return val & DA9063_TWDSCALE_MASK;
> +	return wdt_timeout[val & DA9063_TWDSCALE_MASK];
>  }
>  
>  static int da9063_wdt_disable_timer(struct da9063 *da9063)
> @@ -191,6 +192,7 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct da9063 *da9063;
>  	struct watchdog_device *wdd;
> +	unsigned int timeout;
>  
>  	if (!dev->parent)
>  		return -EINVAL;
> @@ -214,13 +216,19 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_restart_priority(wdd, 128);
>  	watchdog_set_drvdata(wdd, da9063);
>  
> -	/* Set default timeout, maybe override it with DT value, scale it */
>  	wdd->timeout = DA9063_WDG_TIMEOUT;
> +
> +	/* Use pre-configured timeout if watchdog is already running. */
> +	timeout = da9063_wdt_read_timeout(da9063);
> +	if (timeout)
> +		wdd->timeout = timeout;
> +
> +	/* Set timeout, maybe override it with DT value, scale it */
>  	watchdog_init_timeout(wdd, 0, dev);
>  	da9063_wdt_set_timeout(wdd, wdd->timeout);
>  
> -	/* Change the timeout to the default value if the watchdog is running */
> -	if (da9063_wdt_is_running(da9063)) {
> +	/* Update timeout if the watchdog is already running. */
> +	if (timeout) {
>  		da9063_wdt_update_timeout(da9063, wdd->timeout);
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  	}
