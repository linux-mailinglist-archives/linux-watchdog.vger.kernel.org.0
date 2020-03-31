Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1637199AA1
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 Mar 2020 18:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731117AbgCaQA6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 Mar 2020 12:00:58 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44670 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730286AbgCaQA6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 Mar 2020 12:00:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id b72so10503717pfb.11;
        Tue, 31 Mar 2020 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=taluGmW7CXsRxxAUESqt+d4hAzy0kA0u/yxDfpjf+rM=;
        b=GdF9zsV7IE7SbPKagJJUruD8yVaU1qODPzCBsbOQcVxNZDzYxv7hcS40rvj194m5iM
         sxXWgLcHyvwOPHbv/lf5Y+maeDmMBMm5dkY9+8XHE11unHXChTgECEP7V6UPm0KicnEz
         0rVmZRAXdy9DztRCIaYV7kwtXUwCTCf5YN/LaYwLgeR4HerNSR2kvDy4TFSN8vi4Xq/b
         lUu7BnVAyJNVBFMY0GzOzBCGPozaf55rQCAASpMJCJzVBbfnw18CXGYTDsQEEFWTI2RY
         667oXkQN0lbmZJtIcZXvNHRPKelvZD+KDywIr+6Ydxq5Z9OOvcdsmWj8W1LBRiZHpuMk
         nEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=taluGmW7CXsRxxAUESqt+d4hAzy0kA0u/yxDfpjf+rM=;
        b=t4rKs13H+n4VihgGsix1Oa8671SJ2RPcG0rWl2cRbjODd6HthL0EA85FJJd2pjgQfO
         u2ikPrqYynvrQ+4aagnJV5d5fUPbFreTVEyVborTqo8bXgYChv3PKp0O3Gk8wsQ4mBQC
         kBqoQFC/JwJKsjcAUp/bP/XW4XPsqhtn0H8yoWpp20YvHQIzYsvMFuZL4dWmT7M+BpyS
         g3jnzv3ga6A5eR4ATZmeAHWGmsIqAoXTbztPFaNYoGnq83zBhMmVzc+Q5+Dme4KKqd0i
         PPuQ95qJlFGz7jNaHgTix8pY/g264s6l2iyOYrqe8nqR432+8PF5wZb3PWSfDhkbJHe9
         HvcQ==
X-Gm-Message-State: AGi0PuYzKA8BxCxSW8P3tUF0E8I16Fu0HhOCu0ZEC3D563Ti2+sWV5gr
        Jz7SKWm1uOMvavwe53LdstsUCeLe
X-Google-Smtp-Source: APiQypKvYt7+e1jMI+FrEl5EN2RNuaPTl6gPVGE0LLvnv1PhCAMk+CK6GFt3Hy+Jn7QhJV7GbSXx+w==
X-Received: by 2002:a63:6d87:: with SMTP id i129mr2457339pgc.54.1585670456889;
        Tue, 31 Mar 2020 09:00:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v59sm2253702pjb.26.2020.03.31.09.00.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 09:00:55 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:00:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: da9062: Use pre-configured timeout until
 userspace takes over
Message-ID: <20200331160054.GA64188@roeck-us.net>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326150203.371673-1-s.riedmueller@phytec.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 26, 2020 at 04:02:01PM +0100, Stefan Riedmueller wrote:
> If the watchdog is already running during probe read back its
> pre-configured timeout (set e.g. by the bootloader) and use it to ping
> the watchdog until userspace takes over. Otherwise the default timeout
> set before might not result in a fast enough ping.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/watchdog/da9062_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 0ad15d55071c..6d81b1276b87 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -35,6 +35,14 @@ struct da9062_watchdog {
>  	bool use_sw_pm;
>  };
>  
> +static unsigned int da9062_wdt_read_timeout(struct da9062_watchdog *wdt)
> +{
> +	int val;
> +
> +	regmap_read(wdt->hw->regmap, DA9062AA_CONTROL_D, &val);
> +	return wdt_timeout[val & DA9062AA_TWDSCALE_MASK];
> +}
> +
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
>  {
>  	unsigned int i;
> @@ -184,6 +192,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	int ret;
> +	int timeout;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
>  
> @@ -213,6 +222,13 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
>  	dev_set_drvdata(dev, &wdt->wdtdev);
>  
> +	timeout = da9062_wdt_read_timeout(wdt);
> +	if (timeout > 0) {
> +		wdt->wdtdev.timeout = timeout;
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
> +		dev_info(wdt->hw->dev, "watchdog is running (%u s)", timeout);

The user won't know what "(%u s)" means.e that "%u" reflects the timeout.
Also, the newline at the end is missing.

Personally, I think the message is just noise and should be dropped entirely.

Guenter

> +	}
> +
>  	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
>  	if (ret < 0)
>  		return ret;
