Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D7C3D5047
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 00:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhGYVW5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 17:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhGYVWz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 17:22:55 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7D7C061757;
        Sun, 25 Jul 2021 15:03:23 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id w6so4184737qvh.3;
        Sun, 25 Jul 2021 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xTPjnj72RwbhWrm3sC22xz3JtSJ1xCVRc3vlUqpnb6Y=;
        b=kIOBsPesdK2Cs/aBRn+UN2bNhmfV/Ed2O3V9k7+1DLbEecS2KgJLN3n2EbX2GQzle7
         MrAtdS7vEQCE4pPNcVCo/qMxJRnxC2xeDDRLnVW4NLtw6Eixt7Jdl3TolGBgbXvRKyO4
         pOs/UxMMr/Jc3maO4KISlWRIMrIownJQLQlHdphY1p7J6wvHcndoJAD6wVuPkpUAjRHS
         GdJu1vM24M332DkPq2s3A+b95uB/+RFvnEkIJufLUe2uhhEzWTWgExuEcJGwGNQ2fO+b
         fzCzW/onlGQIj+4MmJqofq/pE8dhLQxkJ6bBxL4p7ufESP8qCoAd1h7njIlvGFGLxg+f
         HpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xTPjnj72RwbhWrm3sC22xz3JtSJ1xCVRc3vlUqpnb6Y=;
        b=q4KVcl6EHefz3Rv62Csj6/rtFFbZSJMXg41NffT3mnvLo0Bh0WwxMtI4jZupKsu4aQ
         owTFji+9u5ohSfYGcbjhZRZZDd2MHLJH7sYe8OAIw5qgbXroHKlHcuV3ngjYasTnHZfn
         5CU30PiG6Hj8hnHUmVJhSwEmuCONETgtqDVeHAHscqYIk1l2ZqJYg3UA/BTzn203bynU
         77zTubAvYH1rAfwU2lVrVoeC3+4IfNto9166BN8NdgGNmf8vvAPpNt1Rs2NTiNIfemDT
         b5NiNGsTVcgXmrq0S0ZghitQ4r0hbgbVV6Y19ztbFufM1UaVDJYRJAdLh4WOimfS8e96
         tGEw==
X-Gm-Message-State: AOAM533U1kHnnH0A9UXkL4o+HPhA8ckM19dP6efY5rGVHRbFkyhqBQwB
        aBH2MfcrPuGUF6CwGQegx2k=
X-Google-Smtp-Source: ABdhPJyHir4b8kg9TVSretHh3TO/jkvMR4MIY+rgTiUFbIJcmzbyoAbuEDDudop27NJ/+XsTVVE5fg==
X-Received: by 2002:a0c:fd48:: with SMTP id j8mr15179898qvs.60.1627250602643;
        Sun, 25 Jul 2021 15:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f62sm17871347qke.135.2021.07.25.15.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 15:03:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Jul 2021 15:03:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] watchdog: f71808e_wdt: refactor to platform
 device/driver pair
Message-ID: <20210725220320.GE3578169@roeck-us.net>
References: <cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de>
 <a9bb50af88c4d64df229f2475c8f38de95ea3295.1626948810.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9bb50af88c4d64df229f2475c8f38de95ea3295.1626948810.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 22, 2021 at 12:14:43PM +0200, Ahmad Fatoum wrote:
> Driver so far wasn't ported to the driver model and registered
> the watchdog device out of the init after probing the I/O ports
> for a watchdog with correct vendor and device revision.
> 
> Keep the device detection part at init time, but move watchdog
> registration to a platform driver probe function.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 42 +++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index efc6981d9a9b..d4cae73da002 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -13,6 +13,7 @@
>  #include <linux/io.h>
>  #include <linux/ioport.h>
>  #include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>  
>  #define DRVNAME "f71808e_wdt"
> @@ -432,10 +433,18 @@ static const struct watchdog_ops fintek_wdt_ops = {
>  	.set_timeout = fintek_wdt_set_timeout,
>  };
>  
> -static int __init watchdog_init(int sioaddr)
> +static int fintek_wdt_probe(struct platform_device *pdev)
>  {
>  	struct watchdog_device *wdd;
>  	int wdt_conf, err = 0;
> +	struct resource *res;
> +	int sioaddr;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!res)
> +		return -ENXIO;
> +
> +	sioaddr = res->start;
>  
>  	watchdog.sioaddr = sioaddr;
>  	watchdog.ident.options = WDIOF_SETTIMEOUT
> @@ -468,6 +477,7 @@ static int __init watchdog_init(int sioaddr)
>  
>  	superio_exit(sioaddr);
>  
> +	wdd->parent		= &pdev->dev;
>  	wdd->info               = &watchdog.ident;
>  	wdd->ops                = &fintek_wdt_ops;
>  	wdd->min_timeout        = 1;
> @@ -488,7 +498,7 @@ static int __init watchdog_init(int sioaddr)
>  	fintek_wdt_set_timeout(wdd, timeout);
>  	fintek_wdt_set_pulse_width(pulse_width);
>  
> -	return watchdog_register_device(wdd);
> +	return devm_watchdog_register_device(&pdev->dev, wdd);
>  }
>  
>  static int __init fintek_wdt_find(int sioaddr)
> @@ -554,9 +564,19 @@ static int __init fintek_wdt_find(int sioaddr)
>  	return err;
>  }
>  
> +static struct platform_driver fintek_wdt_driver = {
> +	.probe          = fintek_wdt_probe,
> +	.driver         = {
> +		.name   = DRVNAME,
> +	},
> +};
> +
> +static struct platform_device *fintek_wdt_pdev;
> +
>  static int __init fintek_wdt_init(void)
>  {
>  	static const unsigned short addrs[] = { 0x2e, 0x4e };
> +	struct resource wdt_res = {};
>  	int err = -ENODEV;
>  	int i;
>  
> @@ -573,12 +593,26 @@ static int __init fintek_wdt_init(void)
>  	if (i == ARRAY_SIZE(addrs))
>  		return err;
>  
> -	return watchdog_init(addrs[i]);
> +	platform_driver_register(&fintek_wdt_driver);
> +
> +	wdt_res.name = "superio port";
> +	wdt_res.flags = IORESOURCE_IO;
> +	wdt_res.start = addrs[i];
> +	wdt_res.end   = addrs[i] + 1;
> +
> +	fintek_wdt_pdev = platform_device_register_simple(DRVNAME, -1, &wdt_res, 1);
> +	if (IS_ERR(fintek_wdt_pdev)) {
> +		platform_driver_unregister(&fintek_wdt_driver);
> +		return PTR_ERR(fintek_wdt_pdev);
> +	}
> +
> +	return 0;
>  }
>  
>  static void __exit fintek_wdt_exit(void)
>  {
> -	watchdog_unregister_device(&watchdog.wdd);
> +	platform_device_unregister(fintek_wdt_pdev);
> +	platform_driver_unregister(&fintek_wdt_driver);
>  }
>  
>  MODULE_DESCRIPTION("F71808E Watchdog Driver");
> -- 
> git-series 0.9.1
