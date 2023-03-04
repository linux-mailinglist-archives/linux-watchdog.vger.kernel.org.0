Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8B06AAB71
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjCDRJt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRJs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:09:48 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778C612BF4
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:09:47 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id x10so3827918ill.12
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjTTEL5ySzoVt35gIAc/Vg9xNc1YcuBae/+4d/rCqRE=;
        b=X7bVUGjZGCFI9a+J1+VOMdbELQMzDRqdY0xQAQfoyiXFHOgBfh981qRW3tA7PwvHPZ
         OXxeruohhEgsUcc2sHpijn8cX6uUAZLQQ9fGus+0TwN56LMWB2upApsLtPAIBVqlGBOn
         OaBp5P8aZS06ud0vTcLrV14A3G8yB4k/O1ezgiMLVDVFjGp+PLgD81Ly0/FVHI0TdFAV
         y8tUA7ZGJuAjYr78+fCqLDbxK+RwG3BbGf0VpSCdyUSaxoHF2Skl+yoBw8gOARhxz9qB
         ijhZfRAtnQ2L2S4FwXE5hhhnWmBj7WRKGHNKmBRKZiO1u4p/5rKU7xkPdn3zFL3NHds2
         8gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjTTEL5ySzoVt35gIAc/Vg9xNc1YcuBae/+4d/rCqRE=;
        b=wDcyaKTkUgWk9BP5foLa7LJiLciVe6+BIKfdks9kTO5zXRgZMe9q+QwJGB/WUSnn4o
         8odfjrenzvJt4OmZCp0CUcefuu79G2ZNknG2ojZk4NTZ0jUgq6FMJh1MicY4sE+wO33l
         b6TUrKmZELMPdO/mA0JggqjlxIo9V9LErfPdCgk9fgcjzjePEA6zJEcbCETFZDbrRwN/
         POU36MdAKw1PkiEdcWF1C7ruDJR3ucWbVVmPQceh71ttv023e901+7BHQRd2yEBNvxvW
         XtESI2S8fB8n5OEnzN+bL85pGco0vWzKH3Uc3cXtb1BLVmQkdPYZMHjVIR2PDwOl/u51
         KIBQ==
X-Gm-Message-State: AO0yUKUwxnI+f2tX/rNU/Qg0WpxLSlEztJs2eqo55QsJGmAvCQ+Ah8J3
        plSdRm9Kukpg5KZHNeBkYTo=
X-Google-Smtp-Source: AK7set/YGMpe+XNtSvvbZFQ3sh2KVT0KSCnukVn15tp9vfOXDx40UZfvBeLnG3PbHp639j+ep+oAPw==
X-Received: by 2002:a05:6e02:18ce:b0:310:c1b3:9906 with SMTP id s14-20020a056e0218ce00b00310c1b39906mr5237417ilu.25.1677949786814;
        Sat, 04 Mar 2023 09:09:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h23-20020a02cd37000000b0039c492ae300sm1642607jaq.114.2023.03.04.09.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:09:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:09:45 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 20/34] watchdog: omap: Convert to platform remove
 callback returning void
Message-ID: <aa10422a-e6de-4333-b908-64ba78de1983@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-21-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-21-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:02PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/omap_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index e75aa86f63cb..a7a12f2fe9de 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -306,14 +306,12 @@ static void omap_wdt_shutdown(struct platform_device *pdev)
>  	mutex_unlock(&wdev->lock);
>  }
>  
> -static int omap_wdt_remove(struct platform_device *pdev)
> +static void omap_wdt_remove(struct platform_device *pdev)
>  {
>  	struct omap_wdt_dev *wdev = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(wdev->dev);
>  	watchdog_unregister_device(&wdev->wdog);
> -
> -	return 0;
>  }
>  
>  /* REVISIT ... not clear this is the best way to handle system suspend; and
> @@ -359,7 +357,7 @@ MODULE_DEVICE_TABLE(of, omap_wdt_of_match);
>  
>  static struct platform_driver omap_wdt_driver = {
>  	.probe		= omap_wdt_probe,
> -	.remove		= omap_wdt_remove,
> +	.remove_new	= omap_wdt_remove,
>  	.shutdown	= omap_wdt_shutdown,
>  	.suspend	= pm_ptr(omap_wdt_suspend),
>  	.resume		= pm_ptr(omap_wdt_resume),
> -- 
> 2.39.1
> 
