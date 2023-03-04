Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1A96AAB67
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjCDRGe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRGd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:06:33 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7391E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:06:32 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id x10so3824621ill.12
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1L45Q+D6bH5eB9ZTGCFxGb6PjlHs9bIugECXn3/Wo8=;
        b=XJ65oOUQBUia0VLSlV/Kbh78q6XYddl8+uWs2/vttvsY1fFNjjBFC0Q167/RAyXog1
         9jvzqAEo7IhWAPj8fv/GIFeavXCLoPfiis/5mY3g3AGYhnQx58kO6m2aMVCJvA/yeL2S
         7j1bPPlmyqSfI/LOGvOPB3s38dbk+TJKbm6vaiKr+dYNLvMvXFCpoWOAcVVU+7pdA2qR
         oF9wbx/3MPk5SCSA79L5GpLkxKhbBmt4mQ/45xRbldi4/2pCkqaihwl5j9Hin+EdwJvq
         3kiLzMJAsSTCueiOsMUKPKGoVPC77LyhHGFAvclDhpB1hHMQK56yUrhBixlt6lbEGaKB
         l2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1L45Q+D6bH5eB9ZTGCFxGb6PjlHs9bIugECXn3/Wo8=;
        b=KIwBMYBgu+PFlHOD2/BS40VifI3Gm6AfEQAWA36WijAUIzV+usqZuUFLxIW8hQApow
         Z1mwA4XJhgeIc0wCTAuWJJxo4JIEQ6pp6KRToX0O2T2gnniN1Q/PF/QEm4aAAI/YU3In
         FFSAcProIJcvnfMjUxT7Y5LjvsrqS1QWG//rCFf6dfjzoJJwvarRJlwrhyEJQ4OGcqXZ
         lps9i5ocJrBswBCn1SJ4auPVOdDg7PjR1Mb+Ts+esRI1DFeNpICiToadmULxox5WUxet
         4KV8ApiZuz/Cn0OjecXhvFtSsjOu/r6mZMOo9wB9RElbmbQ73XMPEi7K0GhUWeGU3RBf
         VXsQ==
X-Gm-Message-State: AO0yUKU6gQvNbxKO3kYKXqMjd1buo+YdFqda6ylG5NiE4JR8LFgwhzTE
        ERV7PrTn2EbQdYQzrr6oBz8=
X-Google-Smtp-Source: AK7set8gJzB7BZIykctkwJZd7cCvzw6r3gRrNrtO1jWSwyb8REuNlrKszeXPI/LmRTtoYQcW8Yeojg==
X-Received: by 2002:a05:6e02:1ba8:b0:313:ce4b:a435 with SMTP id n8-20020a056e021ba800b00313ce4ba435mr5008848ili.25.1677949592090;
        Sat, 04 Mar 2023 09:06:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k16-20020a02c770000000b0039e5786d7b7sm1731062jao.18.2023.03.04.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:06:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:06:30 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 11/34] watchdog: dw: Convert to platform remove callback
 returning void
Message-ID: <f4cea51f-edd8-4bb1-baba-afe1eab4f3d9@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-12-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-12-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:53PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/dw_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 462f15bd5ffa..6f88bd81f8a1 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -681,7 +681,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int dw_wdt_drv_remove(struct platform_device *pdev)
> +static void dw_wdt_drv_remove(struct platform_device *pdev)
>  {
>  	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
>  
> @@ -691,8 +691,6 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
>  	reset_control_assert(dw_wdt->rst);
>  	clk_disable_unprepare(dw_wdt->pclk);
>  	clk_disable_unprepare(dw_wdt->clk);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_OF
> @@ -705,7 +703,7 @@ MODULE_DEVICE_TABLE(of, dw_wdt_of_match);
>  
>  static struct platform_driver dw_wdt_driver = {
>  	.probe		= dw_wdt_drv_probe,
> -	.remove		= dw_wdt_drv_remove,
> +	.remove_new	= dw_wdt_drv_remove,
>  	.driver		= {
>  		.name	= "dw_wdt",
>  		.of_match_table = of_match_ptr(dw_wdt_of_match),
> -- 
> 2.39.1
> 
