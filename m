Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3A26AAB7E
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCDRNE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjCDRND (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:13:03 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A891259D3
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:13:02 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id 4so3859230ilz.6
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9b95yFvddWsqCC0z2cdGiYB6SX1FfcTrH8eKSeioZo=;
        b=TW/dZupWaZt+kGqyrC8W7Hjdsg6dABdhT20YubOT11yOVq9/XCylFOMRdyzhjJKKsS
         w/Us6M1accm8HHel5B0fscMBKDvHADNVaOK+5IZ0L50U1TFQMKv39Js1pq4mCWHvGg0t
         wyKDWymL1I2ebTDCzZjuKTdVtRX2P3q597Edjh7jDcxZEi8D311Pm55HHUBAhPMFgf5X
         sqdVh08uJ1lbKD/czzWcRio7OkFDoUsUN5TmA/gopC4hddb0eWcam4pJNnf/tiS/qMjC
         Oxv3ABZzZwDZEZo4MaC4vayGgUmv3viLy3o5ZYvaaWUuIZxY0FntMf5gPBZqk8ozSY9p
         Jcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9b95yFvddWsqCC0z2cdGiYB6SX1FfcTrH8eKSeioZo=;
        b=nM8m3u051rCgzIf9rtFhqsO42zTrCzx/f7TKlkR/EpEem7ceDcV7otLW6wx5pHCBfo
         LwGGPJS3oGveyBwLxP6EmnEf1neIQRF89pv4ehbxcCpyusk+zhXpWaRCY1MmbJnhQXZN
         dPWuaoPE0+cxBxw9KY0a61E5Q60Op2yrIBW0jFFguFQI1xDdUc1G2KcALd5qt79Sza3K
         va9YKErWd33JJoJekJ7jnn27Z7yRMcwVQ7LdbZ/WZ+6oAnK5a5e4XBOHs7UgmaNP027P
         vqnysc0vTcT5ukX8t/fbpL2uvwbYom2guW/hCpfbEuE4O/k9xBM7d6Pyy61PMTsmGFtP
         OmFQ==
X-Gm-Message-State: AO0yUKUpbtivLcrQlWdVTGhagqSaVrAS++s2XB8gc3C2jZNLs2Rn92gw
        BCqjgOW58Q7bxCHHwLP+0T25ZtsLOgw=
X-Google-Smtp-Source: AK7set8M7NvVXnl4uZHN9CV8VcyX90fm29vXhXO7rdHvZT2WHHtxhmucF6P4BBOf9Gpja8sCyn0IbA==
X-Received: by 2002:a05:6e02:1ba8:b0:313:ce4b:a435 with SMTP id n8-20020a056e021ba800b00313ce4ba435mr5025871ili.25.1677949982064;
        Sat, 04 Mar 2023 09:13:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k18-20020a02ccd2000000b003c4f3850000sm1730426jaq.49.2023.03.04.09.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:13:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:13:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 29/34] watchdog: sa1100: Convert to platform remove
 callback returning void
Message-ID: <39aa67c7-aab2-4081-a3b7-d8de92dbaad5@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-30-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-30-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 03, 2023 at 10:37:11PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sa1100_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
> index 82ac5d19f519..5d2df008b92a 100644
> --- a/drivers/watchdog/sa1100_wdt.c
> +++ b/drivers/watchdog/sa1100_wdt.c
> @@ -229,19 +229,17 @@ static int sa1100dog_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int sa1100dog_remove(struct platform_device *pdev)
> +static void sa1100dog_remove(struct platform_device *pdev)
>  {
>  	misc_deregister(&sa1100dog_miscdev);
>  	clk_disable_unprepare(clk);
>  	clk_put(clk);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver sa1100dog_driver = {
>  	.driver.name = "sa1100_wdt",
>  	.probe	  = sa1100dog_probe,
> -	.remove	  = sa1100dog_remove,
> +	.remove_new	  = sa1100dog_remove,
>  };
>  module_platform_driver(sa1100dog_driver);
>  
> -- 
> 2.39.1
> 
