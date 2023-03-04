Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D5E6AAB59
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCDRBV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:01:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjCDRBU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:01:20 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C221E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:01:19 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id bf15so2304768iob.7
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t7hBMQ045yf/Sxv9b5l7FJZb7n6Q/680Jyj2835uf1w=;
        b=P4nse2Z0pEmFe1be0MbqGrgvZpSyDcafIlisBKSapMV1bzTEtJDOn0rnmUQgz1YJqv
         /FdaK/G8jOeFZBWwYJAaXtSiS6y/HbpeHrllk1fC2ISkPJvokEGLmdNCR1HwUZmR+Znq
         vaEAsF+hrJPb08zg36+ppmske9IBotbA+4Oughadhpmb/2rtCHm/Z9SnkC7bf8Ehkasj
         i6lZJlxz001crOwZBjtXidNPcXWwnn6u0E0LkKq33sRjooGe/2cYauAuSWZ2eEJqUnAi
         FNeyLI1ddaKDTPQEQrRcxwaYGxU/qZG07ucPZCwt9VaTgIMDsZKHzbPj8h/V+vFiLHjk
         xpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7hBMQ045yf/Sxv9b5l7FJZb7n6Q/680Jyj2835uf1w=;
        b=Iepvwt0xvJZSbI/3REgIz2D6DX7XyQaX+HNzqimgrBIk5bLj3OdUkCvzAu/r3zXYOr
         E3DpWqc95dhG42i2sZkSsfNX5INsj7P0e452yiAnM2JcScw2Q2/HwPWs+qmwTgD8oC4b
         HNVPAWoJb2eX2XEnYrQrYqYTWaKPyveUjlaV7s/BQ1fuQ5KAcehiZViso9dsyXHY8mKo
         H1ogUq5X9Zor1rBPJCmiaNEN+wS7OQ765g95itNybbl79asdxrzv7HpAjJlbm4Wf8vMS
         6djAPpnIIjj4lRzgm6kpr/LoUEVJ8soPIDbAry2l9t8kUD7RggnqbSioJU6h8QBJnO7g
         SJNA==
X-Gm-Message-State: AO0yUKULKh6wwsJtikREJGPlYBXnJ/GRp2LsA84h/gCqTBEytFpV66d1
        n/8xWR25xzbVOZmsz9RKBoa4LVXoAP4=
X-Google-Smtp-Source: AK7set9fYaOD6esvwDyrQTxFWP/QjXyYnSx+e9t0i74QmMFKmGY/yDsRGJ51o4TRW8SoyE+euyGqNQ==
X-Received: by 2002:a6b:e80f:0:b0:74c:bc11:bcbf with SMTP id f15-20020a6be80f000000b0074cbc11bcbfmr3773700ioh.4.1677949278970;
        Sat, 04 Mar 2023 09:01:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x7-20020a6bd007000000b00740710c0a65sm1732362ioa.47.2023.03.04.09.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 09:01:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8cdd45e2-a381-11ef-baac-827a05b73a82@roeck-us.net>
Date:   Sat, 4 Mar 2023 09:01:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/34] watchdog: bcm47xx: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-9-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230303213716.2123717-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/3/23 13:36, Uwe Kleine-König wrote:
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
> ---
>   drivers/watchdog/bcm47xx_wdt.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_wdt.c
> index 05425c1dfd4c..841ca1839f7f 100644
> --- a/drivers/watchdog/bcm47xx_wdt.c
> +++ b/drivers/watchdog/bcm47xx_wdt.c
> @@ -218,13 +218,11 @@ static int bcm47xx_wdt_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int bcm47xx_wdt_remove(struct platform_device *pdev)
> +static void bcm47xx_wdt_remove(struct platform_device *pdev)
>   {
>   	struct bcm47xx_wdt *wdt = dev_get_platdata(&pdev->dev);
>   
>   	watchdog_unregister_device(&wdt->wdd);
> -
> -	return 0;
>   }
>   
>   static struct platform_driver bcm47xx_wdt_driver = {
> @@ -232,7 +230,7 @@ static struct platform_driver bcm47xx_wdt_driver = {
>   		.name	= "bcm47xx-wdt",
>   	},
>   	.probe		= bcm47xx_wdt_probe,
> -	.remove		= bcm47xx_wdt_remove,
> +	.remove_new	= bcm47xx_wdt_remove,

Much better would be to call devm_watchdog_register_device() instead of
watchdog_register_device() and drop the remove function entirely.

Guenter

