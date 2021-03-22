Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED61F34469C
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Mar 2021 15:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhCVOFy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Mar 2021 10:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhCVOFr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Mar 2021 10:05:47 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C614AC061574;
        Mon, 22 Mar 2021 07:05:47 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id i81so11672117oif.6;
        Mon, 22 Mar 2021 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+FYCyq3yVRRWigPORZ/Gk/MLSscCfpNWgxFGt1gPo90=;
        b=ZUYY10TC+TlwDOFGJ6iv9ppI1m8JGLq19C6eFEMUJro3PH2P80bkHrhIoea2kO2531
         gTH4Hett1ZDVmlKMw2d3FV6mhUwYFBiQMvxGUZ1YQTQUjR7Y6xJBYXiDAxl6mMg7FgmC
         6rOtbcgEbFIb15avd0q8f3EUgNLoYCZYmiaS+OACAjLIsrARNFFXP7Qb1Z5Naf4Bw4Sk
         VBmJrGIkg9o9Nl13ly7zEwzk2c8jclbucXn58QAwL9FnYz8xEbVYhaSUpQrOLesow4Iu
         v5Yloxgs0gFbP/hvtyVb1zlsnKR8+el+SmIR/xfGJBk9+Jmp00YIlJv/C3FIiUsZIcG/
         +6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+FYCyq3yVRRWigPORZ/Gk/MLSscCfpNWgxFGt1gPo90=;
        b=MEbdPrb/pTJRNPRiTFxJVRU+Q27Vd4yCGHuyFIe7huAH4ZIu57fh+w5L6nQpGdIp+l
         2tazhrjCIHAlMf2DgwDfBl3XVfwnRLWm1UaqTteCf94D26lh169HTzJEJvio+aV5rYSd
         2C3h53gv/WHCY0uqTXkIj43e0ZHxSv13+Db6i0T9ktI/gPncgzUPe7O4KaYFkmYd2Wg8
         wcdP/+4vOOZw5jOoldzMsEJStUNebAIFvhm+paCt0ZtKoFx38eMgM4TuYHXcr+w9QcWo
         aAsVeWQTHKXUhTnvAjKYhOfMRIf2BMmJKKIfOPJBOE9U+Af+FdF7kxOrloA9cPfqmkQL
         hP2Q==
X-Gm-Message-State: AOAM5333WngsScBLIw87OEiEwv4mmfva3doQvO3Yv4G1K2Y167wg5OJU
        R2mwxr5EKxXjnjVQHaSQSaA=
X-Google-Smtp-Source: ABdhPJzW8zlJ/lt0Af8cSFLLUVOvxfeVa+Ho+kwr0XNueiHstG8DmnL8VOVVXRIpuVbNTBTAsPr3RA==
X-Received: by 2002:aca:4d8f:: with SMTP id a137mr9919970oib.132.1616421947266;
        Mon, 22 Mar 2021 07:05:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f8sm3123176oij.4.2021.03.22.07.05.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 07:05:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 22 Mar 2021 07:05:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [RFC RESEND PATCH v2 8/8] watchdog: retu_wdt: Clean-up by using
 managed work init
Message-ID: <20210322140545.GC140507@roeck-us.net>
References: <cover.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
 <5f1a80d6f88d12b23dbb864e3201fe720cd9bb74.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f1a80d6f88d12b23dbb864e3201fe720cd9bb74.1616395565.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 22, 2021 at 09:38:37AM +0200, Matti Vaittinen wrote:
> Few drivers implement remove call-back only for ensuring a delayed
> work gets cancelled prior driver removal. Clean-up these by switching
> to use devm_delayed_work_autocancel() instead.
> 
> This change is compile-tested only. All testing is appreciated.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/retu_wdt.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
> index 258dfcf9cbda..2b9017e1cd91 100644
> --- a/drivers/watchdog/retu_wdt.c
> +++ b/drivers/watchdog/retu_wdt.c
> @@ -8,6 +8,7 @@
>   * Rewritten by Aaro Koskinen.
>   */
>  
> +#include <linux/devm-helpers.h>
>  #include <linux/slab.h>
>  #include <linux/errno.h>
>  #include <linux/device.h>
> @@ -127,9 +128,12 @@ static int retu_wdt_probe(struct platform_device *pdev)
>  	wdev->rdev		= rdev;
>  	wdev->dev		= &pdev->dev;
>  
> -	INIT_DELAYED_WORK(&wdev->ping_work, retu_wdt_ping_work);
> +	ret = devm_delayed_work_autocancel(&pdev->dev, &wdev->ping_work,
> +					   retu_wdt_ping_work);
> +	if (ret)
> +		return ret;
>  
> -	ret = watchdog_register_device(retu_wdt);
> +	ret = devm_watchdog_register_device(&pdev->dev, retu_wdt);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -138,25 +142,11 @@ static int retu_wdt_probe(struct platform_device *pdev)
>  	else
>  		retu_wdt_ping_enable(wdev);
>  
> -	platform_set_drvdata(pdev, retu_wdt);
> -
> -	return 0;
> -}
> -
> -static int retu_wdt_remove(struct platform_device *pdev)
> -{
> -	struct watchdog_device *wdog = platform_get_drvdata(pdev);
> -	struct retu_wdt_dev *wdev = watchdog_get_drvdata(wdog);
> -
> -	watchdog_unregister_device(wdog);
> -	cancel_delayed_work_sync(&wdev->ping_work);
> -
>  	return 0;
>  }
>  
>  static struct platform_driver retu_wdt_driver = {
>  	.probe		= retu_wdt_probe,
> -	.remove		= retu_wdt_remove,
>  	.driver		= {
>  		.name	= "retu-wdt",
>  	},
> -- 
> 2.25.4
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
