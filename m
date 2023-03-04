Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2D86AAB6E
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjCDRJK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRJK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:09:10 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABA1DBEB
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:09:06 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id y9so2813202ill.3
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOtYyd2I4kv3VE9U2qm1pnJl6Dh54hafnZmGxJleXAI=;
        b=cFoUtYKzoBzknQ/xJBBLF36V9qFpZTFaWB3NQlPugKFNnfTNpA99F8x4qlyCxIeVJP
         Y0JmA4ViHkiYOeDikEacaSfoMdwPtMSRBfEchSrUhGSmzSvYg6/8FFYdC80nJRkQ6DJK
         sDn/mGSPHVoPuHo+ebIhX3+d1nydr+baUxe8QyeHfailAo3BaF+JBT3G9kEAnVPIZJd9
         s8AFwXGftqm232i767A9CvwHGqjMxe8MQlmFrVArh0RuPUL8dhsTcqilPT5a5PgIBgdB
         Osz1pHQ/DQR3aJtGJqb9M3VeWtQ2aSj2yQGV6IlFgaLauH6DMUim7BnHjarCcnDC9RbO
         dpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOtYyd2I4kv3VE9U2qm1pnJl6Dh54hafnZmGxJleXAI=;
        b=k9soSDXNFRyN3ImgcHLOpDbbq6/WQpr3HJr8gO6oik6vXMf2ROhC1tflt3WzgCjTA0
         JSgbsXa9puYjA0AlvNjpTBfLsU/TH3ZHwHm1fkvHmuf8kUfOhkZeiQn3QyZ2ovqKSena
         ghM/IvjrOZXxA8rkDhJf3hxJrFVXhR52fX8spZLSy22npK1t0jbWFQP1KFKmEt66Zw3r
         N7abjP5MGRLnUFWUnKrY9ixBE+pOvlZ8mvaVTopdh5vEwcGNzjfsu5tVreTNnEnWna9R
         u1f+WcxJOYSniOx6KXILIq7Xta7age4itnOl50hF88sImGs2Zr2uScKJqomc9njl4fti
         a3+g==
X-Gm-Message-State: AO0yUKVPbbzGBAkKBSXahuepvtOLpxN/WBy20XWBYJxftOPou/roQCxa
        GY/OBXbjN+o+Xrp4oBIW6bO5ll2oP3M=
X-Google-Smtp-Source: AK7set+7Re81jYboltVzUpNhXpC5qJ69mEJwVOWEzbhwxdOyuFA4pkI+GZ8MGIOKnXgZwELO3/955g==
X-Received: by 2002:a05:6e02:1b09:b0:315:34b8:4c6d with SMTP id i9-20020a056e021b0900b0031534b84c6dmr4745506ilv.17.1677949745873;
        Sat, 04 Mar 2023 09:09:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r16-20020a92d450000000b00316e39f1285sm1459571ilm.82.2023.03.04.09.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:09:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:09:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 17/34] watchdog: mtx-1: Convert to platform remove
 callback returning void
Message-ID: <cafca8cf-39e6-4f0f-b653-4686bd323688@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-18-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:59PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/mtx-1_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
> index ea1bbf5ee528..152e41ecbb14 100644
> --- a/drivers/watchdog/mtx-1_wdt.c
> +++ b/drivers/watchdog/mtx-1_wdt.c
> @@ -221,7 +221,7 @@ static int mtx1_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int mtx1_wdt_remove(struct platform_device *pdev)
> +static void mtx1_wdt_remove(struct platform_device *pdev)
>  {
>  	/* FIXME: do we need to lock this test ? */
>  	if (mtx1_wdt_device.queue) {
> @@ -230,12 +230,11 @@ static int mtx1_wdt_remove(struct platform_device *pdev)
>  	}
>  
>  	misc_deregister(&mtx1_wdt_misc);
> -	return 0;
>  }
>  
>  static struct platform_driver mtx1_wdt_driver = {
>  	.probe = mtx1_wdt_probe,
> -	.remove = mtx1_wdt_remove,
> +	.remove_new = mtx1_wdt_remove,
>  	.driver.name = "mtx1-wdt",
>  	.driver.owner = THIS_MODULE,
>  };
> -- 
> 2.39.1
> 
