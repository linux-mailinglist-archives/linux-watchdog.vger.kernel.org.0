Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93ED386C8E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 23:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbhEQVtV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 17:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEQVtU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 17:49:20 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C0BC061573;
        Mon, 17 May 2021 14:48:03 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c20so7394533qkm.3;
        Mon, 17 May 2021 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6DqWCueOVy+KKDmUzeIT3Pc8Hvr7DDML2WOb6qWHEFk=;
        b=Iqjd3wmClbb4tXj8FjSiEaDTV2iPWWADkI1RR7Pgykt5bILM8oKZ+uD69p26i15le2
         zon+xEW+FvCV/0SmPpK9FHFiptn3bvHC/A0oWTRUsftrlbhLvpnvf1UcWN4KZDwIEvpn
         Gw4CoGpx+CB4NLDDwa5rxilX4HoDyiWb69SfjKuPWZgMaKTD8h5Fqsysmcln/wa0gD8G
         cIvIGNHTNDwfD2yDSba7a6ESEPBcdueq7UAm5lIEq1/9GYe8JVaNM9N4Ev8la9Yn9huf
         kmPXBCW1NK1eQZ5fqW0ySCXMZvYBzfe2VXLT+Pv1UNVriL46jCjELwev33ev6o+xXDaE
         w9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=6DqWCueOVy+KKDmUzeIT3Pc8Hvr7DDML2WOb6qWHEFk=;
        b=HeS+wEokIFY2PCgrUpqEMF7Nu+PKsATD2USFsBfdfpRus8H5HHsoJnlUsOdHuAzKiR
         ur7XJyBTbGPzwVr54e5aGoxtMvUmu32v5TzEOyMeWMsds5k0gq5ejJQzdP80as+xcs8G
         JHclbFggSLjleFl2mhKC7t/7bUPg+LDDSJbmsbZ/ffaqzdFG63PMHoT8DQzC4jQ2RNcT
         cHOxOvAFnud2bwOc/FtfgQcAsIBReAcVJI27NIbKQkcAczLmJfI/gGAfDUn+9Gxml2Oa
         bQXL1sAVy9ZGaYX0rGsce0k7+Gh0HSnHfcCxEgjAAAy27gastKue5IcLYvynw5ciLF+q
         6tCg==
X-Gm-Message-State: AOAM532I3pGalcHHPdFl8j4FdTD/zo5v/qaMH5VOjgwhO5WOHYuwQpb8
        2LqKj0QFJ31Sl3XqKYuYoFY=
X-Google-Smtp-Source: ABdhPJxTt7huSvsM43negINDBDM7xI6cAuilm6xm0a3pYsPPSpZrtWMUPvOHjJDzHWAbLSbJAX8yZg==
X-Received: by 2002:ae9:c218:: with SMTP id j24mr2111212qkg.94.1621288082849;
        Mon, 17 May 2021 14:48:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6sm11403038qti.4.2021.05.17.14.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:48:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 17 May 2021 14:48:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v1 1/1] watchdog: sp805: Use devm_clk_get_optional()
Message-ID: <20210517214800.GA3623005@roeck-us.net>
References: <20210517174456.22050-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517174456.22050-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 17, 2021 at 08:44:56PM +0300, Andy Shevchenko wrote:
> Replace open coded variants of devm_clk_get_optional().
> 
> While at it, drop unneeded OF and ACPI dependency as the APIs in use
> are provider agnostic.
> 
> Cc: Srinath Mannam <srinath.mannam@broadcom.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp805_wdt.c | 40 +++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 58a00e1ab23b..531551216c8c 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -11,7 +11,6 @@
>   * warranty of any kind, whether express or implied.
>   */
>  
> -#include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/resource.h>
>  #include <linux/amba/bus.h>
> @@ -23,8 +22,8 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> -#include <linux/of.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> @@ -231,6 +230,7 @@ static int
>  sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct sp805_wdt *wdt;
> +	u64 rate = 0;
>  	int ret = 0;
>  
>  	wdt = devm_kzalloc(&adev->dev, sizeof(*wdt), GFP_KERNEL);
> @@ -243,25 +243,23 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	if (adev->dev.of_node) {
> -		wdt->clk = devm_clk_get(&adev->dev, NULL);
> -		if (IS_ERR(wdt->clk)) {
> -			dev_err(&adev->dev, "Clock not found\n");
> -			return PTR_ERR(wdt->clk);
> -		}
> -		wdt->rate = clk_get_rate(wdt->clk);
> -	} else if (has_acpi_companion(&adev->dev)) {
> -		/*
> -		 * When Driver probe with ACPI device, clock devices
> -		 * are not available, so watchdog rate get from
> -		 * clock-frequency property given in _DSD object.
> -		 */
> -		device_property_read_u64(&adev->dev, "clock-frequency",
> -					 &wdt->rate);
> -		if (!wdt->rate) {
> -			dev_err(&adev->dev, "no clock-frequency property\n");
> -			return -ENODEV;
> -		}
> +	/*
> +	 * When driver probe with ACPI device, clock devices
> +	 * are not available, so watchdog rate get from
> +	 * clock-frequency property given in _DSD object.
> +	 */
> +	device_property_read_u64(&adev->dev, "clock-frequency", &rate);
> +
> +	wdt->clk = devm_clk_get_optional(&adev->dev, NULL);
> +	if (IS_ERR(wdt->clk))
> +		return dev_err_probe(&adev->dev, PTR_ERR(wdt->clk), "Clock not found\n");
> +
> +	wdt->rate = clk_get_rate(wdt->clk);
> +	if (!wdt->rate)
> +		wdt->rate = rate;
> +	if (!wdt->rate) {
> +		dev_err(&adev->dev, "no clock-frequency property\n");
> +		return -ENODEV;
>  	}
>  
>  	wdt->adev = adev;
> -- 
> 2.30.2
> 
