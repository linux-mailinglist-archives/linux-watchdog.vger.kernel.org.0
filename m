Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE10A6AAB76
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCDRKc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRKb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:10:31 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81A412BF4
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:10:30 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id s8so3840628ilv.10
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7i5XACfn4Oqt86KYuAqDZHtw65GI4S6wktc2ezC32M=;
        b=KkDBj7i9iE43O0RCpbe/2OcnlHFGP0TSQPjkD6wAfjn/O3L0Bl+WIu1siQKxUvXMzq
         sQ0gII96cqaD5Nv/6X+nJqzPw4JpyGfquoVxVjrL+pqfQ+Gmi5ZsE6TyWxzytivVbcaa
         SxWlWfNHAd1GZH/v9OIGU2Ekw3nfU/GhCYaslyu9SV4rHirMVqlNDp4bZdIIWc9IJYO5
         lA2YoZdvedw/APwQORNBIurWNAecU1j3QZmdApAIGx3ehKwQqSM8SJ3OgUk3jG+wubTw
         d5Z3R/qnsX33bJkhJ/iyvkZFBy58+jTlZkINBq8DkQOZIeg1uyVkbfToxaAul3E61hJT
         xINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7i5XACfn4Oqt86KYuAqDZHtw65GI4S6wktc2ezC32M=;
        b=ydE7imcX5n+ujwhjbZFoLzLKa8nYAYbOSJ2pCFgpDlnWGhPrmdeAcnrbe0NWoaXSSq
         8IfhyQL+a2ANQiwTWRMJm/26nbvA7HFh9iAu+UW+3RYfJWGWFLPV/ayd4puObpr+tH8q
         8HH4KXYbCPGwh+ij8GhJ1A9LvBmVTp+jXMS0iWJcQpdcG3W7DZbGWXXRLZcMMH1/SOHK
         GdhWFfRYITDrxJyXPX56rE3U6a0IsN94Sv4z5noCVDF9aE5fD4Exci6uES/8kj/8T6wO
         NC3lyVS6BvCN17It9IECyJ3QxOMUBSF2SUtNiUhiuSrqgAUB/cwGBJRoyj3e2Ld7bgHg
         HhUw==
X-Gm-Message-State: AO0yUKWHBED0QZhKXaqCx9t5j3UcB5A/D/aUqbjG1A4+t4A6gRyy+NHj
        61pDrROu06Ul1QB4nj3s7wc=
X-Google-Smtp-Source: AK7set/02Y+ozgGG616IXKPlZ58wbuQmMDiSiWVTmOs7780epIcS1mH0uOVtj+zIwt+47zmvIOS1dg==
X-Received: by 2002:a92:c542:0:b0:316:e54a:69ac with SMTP id a2-20020a92c542000000b00316e54a69acmr5081868ilj.4.1677949830076;
        Sat, 04 Mar 2023 09:10:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k19-20020a02a713000000b0038a5b48f3d4sm1701857jam.3.2023.03.04.09.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:10:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:10:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 23/34] watchdog: rdc321x: Convert to platform remove
 callback returning void
Message-ID: <7ad7b710-7edf-4752-8674-f052b531809d@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-24-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-24-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:05PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/rdc321x_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
> index f0c94ea51c3e..6176f4343fc5 100644
> --- a/drivers/watchdog/rdc321x_wdt.c
> +++ b/drivers/watchdog/rdc321x_wdt.c
> @@ -257,7 +257,7 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rdc321x_wdt_remove(struct platform_device *pdev)
> +static void rdc321x_wdt_remove(struct platform_device *pdev)
>  {
>  	if (rdc321x_wdt_device.queue) {
>  		rdc321x_wdt_device.queue = 0;
> @@ -265,13 +265,11 @@ static int rdc321x_wdt_remove(struct platform_device *pdev)
>  	}
>  
>  	misc_deregister(&rdc321x_wdt_misc);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver rdc321x_wdt_driver = {
>  	.probe = rdc321x_wdt_probe,
> -	.remove = rdc321x_wdt_remove,
> +	.remove_new = rdc321x_wdt_remove,
>  	.driver = {
>  		.name = "rdc321x-wdt",
>  	},
> -- 
> 2.39.1
> 
