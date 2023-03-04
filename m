Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D216AAB72
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjCDRKE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:10:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRKD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:10:03 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FFE12BF4
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:10:02 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id v10so2310372iox.8
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lF6FYYiCKVEvgNbSd0cjdxqH2QSALTXpf9+oGXCBCmM=;
        b=T1ZIT5vMNOsrBTWk2YVd0mYOhSo2Z941r9VUXWupi0LyEiV90LSXKlWXz0aQXVgIbp
         R15mBLauMgiTsG2UvvhKM90wJJFar/1jHg0+zUWKkZATg3YFSud9D9uYBUnb1R9S8H5J
         NlWUB2oVgNxOEnQmwA03/tadHKMW1m0hRBlcd4FJrlB00h939e8vtEg3iNj3UOzE87UR
         LAlPYYTXkXAy2Uq7FamwDHB18h4xJ/VM8WnIKET5Zze9iTFCcmudtGtie5K3bdGITxhI
         oDYYHcywOZPM2tVoFDq2nue9eWt9ucOSlnbWqVw7AlY8Mm0h5V9ckd550HGioFW4Kfdi
         WM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lF6FYYiCKVEvgNbSd0cjdxqH2QSALTXpf9+oGXCBCmM=;
        b=F01ZGgnaP74P43D+3Y3qBIMF9PT90WKOhQVUHaDNsJCXvMLh/Wv4RYjxkGmay4IMNK
         zwSGpsLLnSkTuLpo1Tse3ZlRMtiMMGxioZpy9NjsMt3flg30MuIKqmDh470ba8a+HWpc
         NGxhw1f8fncXesCH8mJk929GXQ15pw1Ka9sS/IDswgTDy9gArw8Z6M2Q0Tqj+ORLa7Q6
         Iagoqam7+7JgZh8oj0e6qSuw91VV2trO7m1i3jnfAn37t/dL4DwQ+ne/cuYhKcAvVIOZ
         fxJzXCRMfZ2S8nrx7EhbqCRU3y1SGHV57kSZi441IUQGItZ3squx30Wp0Vc0WJaYXRfR
         niUA==
X-Gm-Message-State: AO0yUKUT33WHGxCDSVbBWL9GPiPRwq6l3iDaFelcIjrjgorDT595W0rr
        EdP6rbyDtglmRTOxgSBGgYw=
X-Google-Smtp-Source: AK7set/8EAC2WDnR6DanYDRh2zk3nr7V21Zmn0Vz8iLHS3GCV0fZ7tp9G4QJB5STpR34sexXHCqKgg==
X-Received: by 2002:a5e:8819:0:b0:74d:114c:832b with SMTP id l25-20020a5e8819000000b0074d114c832bmr4097247ioj.20.1677949802363;
        Sat, 04 Mar 2023 09:10:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a5eda48000000b0073df2110f58sm1697688iop.7.2023.03.04.09.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:10:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:10:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 21/34] watchdog: orion: Convert to platform remove
 callback returning void
Message-ID: <0ea492a1-70b7-4a14-9b89-c33c2af5bf5a@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-22-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-22-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:03PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/orion_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index e25e6bf4647f..5ec2dd8fd5fa 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -649,7 +649,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int orion_wdt_remove(struct platform_device *pdev)
> +static void orion_wdt_remove(struct platform_device *pdev)
>  {
>  	struct watchdog_device *wdt_dev = platform_get_drvdata(pdev);
>  	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
> @@ -657,7 +657,6 @@ static int orion_wdt_remove(struct platform_device *pdev)
>  	watchdog_unregister_device(wdt_dev);
>  	clk_disable_unprepare(dev->clk);
>  	clk_put(dev->clk);
> -	return 0;
>  }
>  
>  static void orion_wdt_shutdown(struct platform_device *pdev)
> @@ -668,7 +667,7 @@ static void orion_wdt_shutdown(struct platform_device *pdev)
>  
>  static struct platform_driver orion_wdt_driver = {
>  	.probe		= orion_wdt_probe,
> -	.remove		= orion_wdt_remove,
> +	.remove_new	= orion_wdt_remove,
>  	.shutdown	= orion_wdt_shutdown,
>  	.driver		= {
>  		.name	= "orion_wdt",
> -- 
> 2.39.1
> 
