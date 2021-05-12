Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB4E37BF03
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 15:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhELN7R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 09:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELN7R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 09:59:17 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0C2C061574;
        Wed, 12 May 2021 06:58:09 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso20566540otb.13;
        Wed, 12 May 2021 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WGXaBS28zz51CK0WFE0Kv69wdQDd8SbaKjqA6EoSxJI=;
        b=BpGBM/mGowxVCrCqMocUHv5X7QPLZl4OC4fOOmk1jSHxzgESJVNBjZHCFlpyk36DqV
         1O/yMZIey1I3whwVqT1lX4DmmwMPo2rIJ1cZE+YtINpJV2GRxSKIVLVIqs1nYl/vUrGy
         uE7255NMWA/PdaugAmjwV8fcFPQ88pS/TcRKrw8Mur2QuxOU8gQGPMuJFAExQ19CrkT7
         UI+EyHTBa2M/MntzcDDWEvipyHKfr8HUIRsXNzZStq82Pitu+3Zqyi5P0j8Fa4+3OwZb
         vqYv6IDYCoCxQ8b5Dq+tRcIpIWFxyHNeqBC2iYuFNJS6QGcK3rwrPsyTOsP7hthPzReQ
         hIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WGXaBS28zz51CK0WFE0Kv69wdQDd8SbaKjqA6EoSxJI=;
        b=sKEZtOJiUwmuE/a+eiqXmgH+fJzIhQw0WK3V4ZHZKIEoMHdzph3w2CoOdhtZZEgh/M
         m2zz9IQjZ1TTlW68FVr7WIR4gU+93iGiDw2RJc3UBt5V8cXfyb7cUaojrfo51/FKFpIV
         68Xf6JFjzMVF8j0dZFOxNhhIOlK7jFRdzkumeTz7letI0CbnbbI1QGk5JklymQcTH/YV
         26Mb/F8zkHBGzp2YPZb914f03/H9wi/SnLTCtwWNorag65BNLOFmiF1o9OpTpH/9Rb3r
         c6iMkRiYIqntVyVMK8SpjiL1y9ZH/llNfvvhDcT082jzz5hFoV9tSwEts2uswekEWuV/
         p+2A==
X-Gm-Message-State: AOAM531TrPtls6dHaCC1XnYMIoTy/IVZQdOB2U2wu32e0f9X+x8tSLpz
        XkIBnFsLe3aAVtW8dpv93nE=
X-Google-Smtp-Source: ABdhPJwTsVwr4E7FCdeSrzIC/1Dirq5RBQHWYxwaAztDWOxeaKsDlM5LxphiCfuvyctmpCsCc4W8tQ==
X-Received: by 2002:a05:6830:4030:: with SMTP id i16mr7194414ots.294.1620827888519;
        Wed, 12 May 2021 06:58:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e20sm17225oot.11.2021.05.12.06.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:58:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 06:58:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     shruthi.sanil@intel.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        kris.pan@linux.intel.com, mgross@linux.intel.com,
        srikanth.thokala@intel.com, lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com
Subject: Re: [PATCH 01/10] watchdog: keembay: Update WDT pre-timeout during
 the initialization
Message-ID: <20210512135806.GA1333995@roeck-us.net>
References: <20210512084724.14634-1-shruthi.sanil@intel.com>
 <20210512084724.14634-2-shruthi.sanil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512084724.14634-2-shruthi.sanil@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:17:15PM +0530, shruthi.sanil@intel.com wrote:
> From: Shruthi Sanil <shruthi.sanil@intel.com>
> 
> The pretimeout register has a default reset value. Hence
> when a smaller WDT timeout is set which would be lesser than the
> default pretimeout, the system behaves abnormally, starts
> triggering the pretimeout interrupt even when the WDT is
> not enabled, most of the times leading to system crash.
> Hence an update in the pre-timeout is also required for the
> default timeout that is being configured.
> 
> Fixes: fa0f8d51e90d ("watchdog: Add watchdog driver for Intel Keembay Soc")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kris Pan <kris.pan@intel.com>
> Signed-off-by: Shruthi Sanil <shruthi.sanil@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/keembay_wdt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> index 547d3fea33ff..f2f5c9fae29c 100644
> --- a/drivers/watchdog/keembay_wdt.c
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -29,6 +29,7 @@
>  #define WDT_LOAD_MAX		U32_MAX
>  #define WDT_LOAD_MIN		1
>  #define WDT_TIMEOUT		5
> +#define WDT_PRETIMEOUT		4
>  
>  static unsigned int timeout = WDT_TIMEOUT;
>  module_param(timeout, int, 0);
> @@ -224,11 +225,13 @@ static int keembay_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.min_timeout	= WDT_LOAD_MIN;
>  	wdt->wdd.max_timeout	= WDT_LOAD_MAX / wdt->rate;
>  	wdt->wdd.timeout	= WDT_TIMEOUT;
> +	wdt->wdd.pretimeout	= WDT_PRETIMEOUT;
>  
>  	watchdog_set_drvdata(&wdt->wdd, wdt);
>  	watchdog_set_nowayout(&wdt->wdd, nowayout);
>  	watchdog_init_timeout(&wdt->wdd, timeout, dev);
>  	keembay_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
> +	keembay_wdt_set_pretimeout(&wdt->wdd, wdt->wdd.pretimeout);
>  
>  	ret = devm_watchdog_register_device(dev, &wdt->wdd);
>  	if (ret)
> -- 
> 2.17.1
> 
