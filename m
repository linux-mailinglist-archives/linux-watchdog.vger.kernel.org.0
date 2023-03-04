Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD046AAB5D
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjCDRCP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCDRCO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:02:14 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9A91E5C3
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:02:13 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id 76so2297902iou.9
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icEavWQSKnLsTl1ys1YmkBsmjR54oJVwsoOI3V6Ctao=;
        b=a5RsgEQ5wpjEi4ltIwCi61SJ2x1kLRbxz5DQxAoKNLczQ2DCap+T4yglqn8VV6Lr47
         /X4aAVnv70JupaXS+8Kk8PW6S+/Umg3U+u512djqs0Pzjys09VXZpXXO3/FdGzPFbigU
         HFX7ZRNZl1HoWj9msrvsQUnwrs9FYA2Ci8NW/xGhCj3Ulo5OnhgqEt2skknrZbPXHgDh
         FzTxfNOlu1hi6/Ut2B+p8oMOAlK3rrhpOsDVrYr/1tOKD8e7Bn3zeSklSHhlbIsuGqhs
         PxW/Tq+ELiAbL7Rr1yMJwJ6LETuOouOQpWR3z8dFk1cGXO7OIg8XSlLYyS4GUX1g9zv+
         HKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icEavWQSKnLsTl1ys1YmkBsmjR54oJVwsoOI3V6Ctao=;
        b=gsTeEtuWXkjoCBPB717ubw8oeHEJGp7VNKRKV2V43aI+nIaK8Ud9q/5fJDuV/Hvn0j
         1rNHbPIU/HmMdxfcgGOy0lP7nq64yfdyWP7wnT39qbjFNg1n9n5jPX9Dcuf/+Gp+OnAX
         A5NBD4ePFTJSIyyLWeflolbf4++7X7UBjH6TMoTxRcbQ4aepBO/fn7IHuSWGaYMJ1b1M
         nMd1MnB36q7G1c5iLQVCFXywYQ7Nj7yHxtxH0m2/JlywKnpM6+eiHGfvt0Ewi9G3skzd
         WaJoMSgwkrQqwVfeV+ZmX1crBUz+TlMH+7Ka9keXpGh9ge0bTRM466S2stZa4nldJtLY
         OrJg==
X-Gm-Message-State: AO0yUKVq7FKjxbtjAfuyvHRroxLR4MZnk5wARN3yu7+WGJ9Uxfung3rC
        O6smvBAS/gCRBJ4rkR1Zx5k=
X-Google-Smtp-Source: AK7set8LFQgJReeTPmFHb1JZaiL7MMQ8k+0foCb6amvv6nyZCYr1y8PBGwtxW2lPrdL78VhQ53UZjw==
X-Received: by 2002:a5d:8f90:0:b0:74c:88df:2cbb with SMTP id l16-20020a5d8f90000000b0074c88df2cbbmr4039111iol.3.1677949332503;
        Sat, 04 Mar 2023 09:02:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s9-20020a6bd309000000b00746c717e922sm1733234iob.43.2023.03.04.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:02:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:02:11 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 03/34] watchdog: advantechwdt: Convert to platform remove
 callback returning void
Message-ID: <73c31ecf-91e2-46ce-9ce3-abd221548b1a@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-4-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:45PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/advantechwdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/advantechwdt.c b/drivers/watchdog/advantechwdt.c
> index 554fe85da50e..7a0acbc3e4dd 100644
> --- a/drivers/watchdog/advantechwdt.c
> +++ b/drivers/watchdog/advantechwdt.c
> @@ -279,14 +279,12 @@ static int __init advwdt_probe(struct platform_device *dev)
>  	goto out;
>  }
>  
> -static int advwdt_remove(struct platform_device *dev)
> +static void advwdt_remove(struct platform_device *dev)
>  {
>  	misc_deregister(&advwdt_miscdev);
>  	release_region(wdt_start, 1);
>  	if (wdt_stop != wdt_start)
>  		release_region(wdt_stop, 1);
> -
> -	return 0;
>  }
>  
>  static void advwdt_shutdown(struct platform_device *dev)
> @@ -296,7 +294,7 @@ static void advwdt_shutdown(struct platform_device *dev)
>  }
>  
>  static struct platform_driver advwdt_driver = {
> -	.remove		= advwdt_remove,
> +	.remove_new	= advwdt_remove,
>  	.shutdown	= advwdt_shutdown,
>  	.driver		= {
>  		.name	= DRV_NAME,
> -- 
> 2.39.1
> 
