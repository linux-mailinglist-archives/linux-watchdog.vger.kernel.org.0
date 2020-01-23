Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B33D1472D9
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2020 21:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgAWUvf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jan 2020 15:51:35 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33265 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbgAWUve (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jan 2020 15:51:34 -0500
Received: by mail-pf1-f193.google.com with SMTP id z16so2113763pfk.0;
        Thu, 23 Jan 2020 12:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K77eSmdWz1+NmXI8IIP5zQeFXy1IFpWD093Uxox8NOU=;
        b=BBLW0BaOM4on5DdbdiLtHMKuO3T+8QsfvdYTK7GTXpdRNA55oWvBeHqXf5ZnQ6TIeT
         OUVrXQfTNhVjfCFWsAS49kxX+2BD2+pgWiAgwgSGD8V4qsj7yoVywYf8Cms5y4D1Xu1b
         z1G4xae69m4Te+xqkX9KkY1ssW8BajBuwaQlagtgmUALCeX67R6GonJdfn46HpBUTA9U
         8qXquGmhhgWfS5NupBE+D8KURUVYO3O6LRwu0o5BE9W30ecndLvVH3SsA+k9GgKtLHNy
         P0up6IVmeOqgtKWmSUy0mhHcbkTYzAY94tjX6/S1nSJapmbxJ0GAWFc0OmBJNhwL0Uf6
         t8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=K77eSmdWz1+NmXI8IIP5zQeFXy1IFpWD093Uxox8NOU=;
        b=Q7xWOQD5IvD1pWdFkCs0Eh3C3wOmK2zkUOmkCnWrMyYsjtVXEGvmJ5cBPWAr18LKeb
         ix+kJ8MwjfakpN0gDOsofy4cqCZULf7t3wzLpReIie6/e7bwkKWdY2P7Wf/NjOHhrZ3K
         rSshASKm2FKRLXFSj/UxIqa1RNgSsvbl9v7hNRb2jDfghZfTGnWQIRMpEhSgyEDVUwOP
         aL/o2AgpydvSlqBDs8CA6masys113Vw1Cpw0bIds0/0BKGruBSIcXwHWz5iZeQSfzFcU
         1DOa5PBJRQpCwUL79U+8VJdNnHogf38mSa7W/Q59n0lFnE4d3P2uN0VpW5vUnBaEZ0Vi
         QmtA==
X-Gm-Message-State: APjAAAXz3m3fR16ThOJwreczyZrzf59uqmEYx+aFyZ2mecsIoUl+sdXH
        M3rpQMjasXsaukNt4qvUFhw=
X-Google-Smtp-Source: APXvYqwZr0tJhNHkcK7303hXr6iMNRlpKCJAuvyzomKYlS0IIbomaWFESDZPFsmpV8QzGpznGP2gdQ==
X-Received: by 2002:a63:d54c:: with SMTP id v12mr234596pgi.227.1579812694248;
        Thu, 23 Jan 2020 12:51:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z130sm4106020pgz.6.2020.01.23.12.51.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 12:51:33 -0800 (PST)
Date:   Thu, 23 Jan 2020 12:51:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/3] watchdog: da9062: add power management ops
Message-ID: <20200123205132.GA13377@roeck-us.net>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108095704.23233-4-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 08, 2020 at 10:57:04AM +0100, Marco Felsch wrote:
> Disable the watchdog during suspend if it is enabled and re-enable it on
> resume. So we can sleep without the interruptions.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
> - add dlg,use-sw-pm check to differentiate between automatic and manual
>   disabling/enabling.
> ---
>  drivers/watchdog/da9062_wdt.c | 37 +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index e149e66a6ea9..c9b9d6394525 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -15,6 +15,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>
>  #include <linux/mfd/da9062/core.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
>  
> @@ -30,6 +31,7 @@ static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
>  struct da9062_watchdog {
>  	struct da9062 *hw;
>  	struct watchdog_device wdtdev;
> +	bool use_sw_pm;
>  };
>  
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
> @@ -198,6 +200,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	if (!wdt)
>  		return -ENOMEM;
>  
> +	wdt->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
> +
>  	wdt->hw = chip;
>  
>  	wdt->wdtdev.info = &da9062_watchdog_info;
> @@ -212,6 +216,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
>  
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> +	dev_set_drvdata(dev, &wdt->wdtdev);
>  
>  	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
>  	if (ret < 0)
> @@ -220,10 +225,42 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  	return da9062_wdt_ping(&wdt->wdtdev);
>  }
>  
> +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> +
> +	if (!wdt->use_sw_pm)
> +		return 0;
> +
> +	if (watchdog_active(wdd))
> +		return da9062_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused da9062_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> +
> +	if (!wdt->use_sw_pm)
> +		return 0;
> +
> +	if (watchdog_active(wdd))
> +		return da9062_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
> +			 da9062_wdt_suspend, da9062_wdt_resume);
> +
>  static struct platform_driver da9062_wdt_driver = {
>  	.probe = da9062_wdt_probe,
>  	.driver = {
>  		.name = "da9062-watchdog",
> +		.pm = &da9062_wdt_pm_ops,
>  		.of_match_table = da9062_compatible_id_table,
>  	},
>  };
