Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41891B883D
	for <lists+linux-watchdog@lfdr.de>; Sat, 25 Apr 2020 19:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDYRtz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 25 Apr 2020 13:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726145AbgDYRty (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 25 Apr 2020 13:49:54 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D0AC09B04D;
        Sat, 25 Apr 2020 10:49:53 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d184so6453692pfd.4;
        Sat, 25 Apr 2020 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JI7LWCrJcKXSG7jmqn2fYpy9kGlRpYQ0ritpTH6XPvM=;
        b=OArdnBDtDw2iWAhYxHs545X78NlyGFf7WP2PJaAMxaYxEd0kXjnOVXmAHjGfU4YavB
         wauqwAKpUx0sBuABVq0LOnD9r9lUqlT5e31A4x5EpoooCcXUy3A/uohMj39unbvUtOJ8
         wIWCmZ5It1NEzxzoFk4PKfUf+aQguYoyeVoTawLnnC5fkIwCqIODe6NznZKttyLV8C+Q
         Kw3rN7UCS1vjSp2+iM6zyg9pAgWyS3tEBfm39hawhnxcCrzFZa3/6PRq7u7pwNp3ngep
         hqoDBNXtpZ1UzP7WZzZIvKhWsdXUf7RxFmVRHk5VdTqyTPSZ/o6XeMWj3V8uJkoPt9ea
         yNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JI7LWCrJcKXSG7jmqn2fYpy9kGlRpYQ0ritpTH6XPvM=;
        b=XMk8nCXESFsAAIfutTwlgywahTWpaXTefd5D9O96GI8YMm1moqr31hDB68zSeCREC4
         Vz0QV6XSKS9ouPQcpuW8F+gwSWTn3fOhR0PBQWMx4ZSlP9magKeqtiAj8nE8Mm92zxsl
         1j7mIj/HK80iIETDTPcH4QvqK+t5F57tOIZGJTQ1HJPLdvrU5e/TkjGTt/3RgvFd+NtW
         Iyj/6OoEMhfghBYvelT9ZSZNpMQVKZGrW6drKDVZDJAg/X3QFmMmwgFrUYLKjsEkk25V
         78s8xWpepLBd543oVx4zITMNdpNtlReeLfeQReUnnT6IfDOjnrlGV/EBaz8LgYUzWxjr
         fIDw==
X-Gm-Message-State: AGi0PuYXxvgqsGB+7z3qW+2++pLvEXAQjD2f4L+PIs/Vl/KXl0xPpL5h
        eokktUHDg7sTxMYc+ExToyI=
X-Google-Smtp-Source: APiQypJrd91zeWZJKkT5CZ2aJ7UzaxGMVYIzjeGiQy97sa5U9sWQwSLNfZbJKB3aemNY29P08CfRzg==
X-Received: by 2002:a63:64c1:: with SMTP id y184mr14455078pgb.351.1587836992847;
        Sat, 25 Apr 2020 10:49:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x200sm7594989pgx.50.2020.04.25.10.49.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 10:49:52 -0700 (PDT)
Date:   Sat, 25 Apr 2020 10:49:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] watchdog: da9062: Initialize timeout during probe
Message-ID: <20200425174951.GA42971@roeck-us.net>
References: <20200403130728.39260-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403130728.39260-1-s.riedmueller@phytec.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 03, 2020 at 03:07:26PM +0200, Stefan Riedmueller wrote:
> During probe try to set the timeout from device tree and fall back to
> either the pre-configured timeout set by e.g. the bootloader in case the
> watchdog is already running or the default value.
> 
> If the watchdog is already running make sure to update the timeout and
> tell the framework about the running state to make sure the watchdog is
> handled correctly until user space takes over. Updating the timeout also
> removes the need for an additional manual ping so we can remove that as
> well.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
>  - Reworked the patch to use the pre-configured timeout instead of the default
>    value as a fallback in case no DT value is present.
>  - To achieve the previous point watchdog_init_timeout was added to get the
>    DT value if present.
>  - Added a timeout update if the watchdog is running to set the desired
>    timeout and in this instance removed the manual ping at the end.
>  - Removed info message.
> ---
>  drivers/watchdog/da9062_wdt.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 0ad15d55071c..10b37dd65bed 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -35,6 +35,15 @@ struct da9062_watchdog {
>  	bool use_sw_pm;
>  };
>  
> +static unsigned int da9062_wdt_read_timeout(struct da9062_watchdog *wdt)
> +{
> +	unsigned int val;
> +
> +	regmap_read(wdt->hw->regmap, DA9062AA_CONTROL_D, &val);
> +
> +	return wdt_timeout[val & DA9062AA_TWDSCALE_MASK];
> +}
> +
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
>  {
>  	unsigned int i;
> @@ -183,7 +192,7 @@ MODULE_DEVICE_TABLE(of, da9062_compatible_id_table);
>  static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	int ret;
> +	unsigned int timeout;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
>  
> @@ -213,11 +222,19 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
>  	dev_set_drvdata(dev, &wdt->wdtdev);
>  
> -	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
> -	if (ret < 0)
> -		return ret;
> +	timeout = da9062_wdt_read_timeout(wdt);
> +	if (timeout)
> +		wdt->wdtdev.timeout = timeout;
> +
> +	/* Set timeout from DT value if available */
> +	watchdog_init_timeout(&wdt->wdtdev, 0, dev);
> +
> +	if (timeout) {
> +		da9062_wdt_set_timeout(&wdt->wdtdev, wdt->wdtdev.timeout);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
> +	}
>  
> -	return da9062_wdt_ping(&wdt->wdtdev);
> +	return devm_watchdog_register_device(dev, &wdt->wdtdev);
>  }
>  
>  static int __maybe_unused da9062_wdt_suspend(struct device *dev)
