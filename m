Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429ED37BF49
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhELOGj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhELOGf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:06:35 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7724EC061574;
        Wed, 12 May 2021 07:05:27 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id d21so22323787oic.11;
        Wed, 12 May 2021 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=edBSuflvyMtKQbFozKmNoukGINHquKNzkPsEsLyiXgo=;
        b=pO2IR4MLv+yliTv6SG98VVPB3eI0jlbd8FPqddcwilE22dk0E34V//YqW7Vegt2RIB
         m+Mwd6twCIWL3RQ3Tx9z5nuh6OdI+1ovXWA7FIzfi0c/1B6+RWRGPwvxGoV3F6Z4i/2+
         f4zEwRmljN7IPDgtXYOBXAYSYNc4IyJaUgtUV9CVLuqaU9HPq+xBpgIoU9UdGyerFIKY
         ZQT9k7A7VCA6ZQvAYa5cf0ibGkNVVRoCnDrwALr8HakWh97R0kbdjSVGEwW14cyz5t0z
         fuP77yn4xrvA2hgErodQtQzHO8zYK2ezxIsjhqC3bQfQc5htDNHqDDzHYI2rCyRzDKRx
         L+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=edBSuflvyMtKQbFozKmNoukGINHquKNzkPsEsLyiXgo=;
        b=PrMmxOzbcTi01VoX09p2USu0E3wUfPZ/PdeBMBL7hUbqCbSlnygjVXtJexlN6bMKvS
         SVYF+q07ECabdGHRU2Y4awFmvqWq/UUVXXGyeLD3kCIiW0/V/UlW8rnEn4GnQzrO2o+o
         W9/eFvwbtT5PE3zsvwuHQHOD/TQB9h36z5fn4P1Eo/L9uUWyotMAS7QTw82nnviYu9P0
         3J+Gymc2DfnsecBji6jB8FbjWknrW3IA5Hkx6dsXNushaIcfW/YzABaftaBVXqmSxcaK
         QFcBtf5+aiXObd74sorKnZOrTO945M4oYok/oES94lpVKa1VaLywVFrbYNRd0BkbZvfe
         nVEA==
X-Gm-Message-State: AOAM530wb9kIt6eM4GRrz98/XxLJ1O7t1bAzeBAA6WcDOlsiTNWm09uQ
        b/OJNJIeiXvvDzaALA2/foQ=
X-Google-Smtp-Source: ABdhPJyk1Y59P0h+n6Pkm5IFG9TD77O0fT5dnWbLg1+cA8jZjv7d+UDYAqpy1+IQdu45RUtddQrSyw==
X-Received: by 2002:aca:d544:: with SMTP id m65mr26548541oig.73.1620828326961;
        Wed, 12 May 2021 07:05:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x30sm4112562ott.41.2021.05.12.07.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:05:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:05:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 10/10] watchdog: keembay: Typo corrections and other
 blank operations
Message-ID: <20210512140524.GJ1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-11-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-11-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:24PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> Corrected typos, aligned the tabs and added new lines
> wherever required for better readability
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index 0a8cf5b35699..6a2699021263 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -26,11 +26,14 @@
>  #define WDT_TH_INT_MASK		BIT(8)
>  #define WDT_TO_INT_MASK		BIT(9)
>  #define WDT_INT_CLEAR_SMC	0x8200ff18
> +
>  #define WDT_UNLOCK		0xf1d0dead
>  #define WDT_DISABLE		0x0
>  #define WDT_ENABLE		0x1
> +
>  #define WDT_LOAD_MAX		U32_MAX
>  #define WDT_LOAD_MIN		1
> +
>  #define WDT_TIMEOUT		5
>  #define WDT_PRETIMEOUT		4
>  
> @@ -144,7 +147,7 @@ static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
>  	struct arm_smccc_res res;
>  
>  	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TO_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
> -	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
> +	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-secure wdt timeout.\n");
>  	emergency_restart();
>  
>  	return IRQ_HANDLED;
> @@ -158,7 +161,7 @@ static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
>  	keembay_wdt_set_pretimeout(&wdt->wdd, 0x0);
>  
>  	arm_smccc_smc(WDT_INT_CLEAR_SMC, WDT_TH_INT_MASK, 0, 0, 0, 0, 0, 0, &res);
> -	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
> +	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-secure wdt pre-timeout.\n");
>  	watchdog_notify_pretimeout(&wdt->wdd);
>  
>  	return IRQ_HANDLED;
> @@ -278,8 +281,8 @@ static const struct of_device_id keembay_wdt_match[] = {
>  MODULE_DEVICE_TABLE(of, keembay_wdt_match);
>  
>  static struct platform_driver keembay_wdt_driver = {
> -	.probe		= keembay_wdt_probe,
> -	.driver		= {
> +	.probe	= keembay_wdt_probe,
> +	.driver	= {
>  		.name		= "keembay_wdt",
>  		.of_match_table	= keembay_wdt_match,
>  		.pm		= &keembay_wdt_pm_ops,
> -- 
> 2.17.1
> 
