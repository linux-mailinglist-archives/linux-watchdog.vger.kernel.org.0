Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665986AAB77
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjCDRKt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRKr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:10:47 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F97412BF4
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:10:46 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id k9so3333321ilu.13
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o92Ndb8zdrZV2q/Zf1jXZ7CuFJwGWoKG0a6TIK8APpI=;
        b=WLr2MgLWz79uSQ7y2zcGBjYBP30dn9caxiBH61zrgGxdg+cVcbCv0UKrOpkzk4xEPr
         en2/1I5smYSauvR5/N91+f4AUFZaJiMqoGEOv8BMi9nlYvfzjAocvirxmdw6Ttj0pcHW
         FrkGQGif9lhTxzKjBjaFS0RumL67kyjBga4k7X/W8/Ze2AKP0Hez7106vOE+wxUgms8f
         qAWQXcjhs21MW2xW5IznDUJdsqvbo9quCPkCA8RZg1Ld/ltsUvuArRazFoNuj6M0YUwg
         enB6OrQuYu87o54NLe/r2PcxSEXImVndDXvbNVe63XlosgzbHAmPX02FklFbZcJVNcfl
         v/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o92Ndb8zdrZV2q/Zf1jXZ7CuFJwGWoKG0a6TIK8APpI=;
        b=ws88NuptCPzlVtc5L8Oh2HemFyUzSBP+bWpbI8G2+zGe6u33QsXMNue8AfNQ1oKKgH
         y8t6VL6l4RlLPA8bGCljg67gEHsbF7nInGW6s9VWnDWf9/UhT3aeOa3FFAm0BVhXXOqJ
         aGpotmVzrGZjOxm36tks2JZ+dtZvlmmF5Ryox3V24WM9RmM5qucG7LLhALbUa96ycw0W
         a2PWY9uVwF82zkvxtFU/0u37UunRyFKiLFbeGwO8Z7bPyj7lCRfVeeadlTYev7UfQ17/
         4RVF8WMOlOLtkkXgSi21oZnrv+L6DxZ28Dg2Q4i9Atv4idFr9aNvW0pC7lfD6z2qAdDr
         3Guw==
X-Gm-Message-State: AO0yUKVXFXiIEuiL2MT7fDeUfmjujSvejTEJPOTozDWchvVMtqeNJpGo
        UXilQbiFjaNbbUgPzUSe9vaqFFoVA0k=
X-Google-Smtp-Source: AK7set9sxHa+axUmCqJegCD9MmCA9ztXKOiATURjteyXqglh4CcgMLex4yuGMWWDkYhaL1VruAcl/Q==
X-Received: by 2002:a05:6e02:20e6:b0:315:7fec:f1f0 with SMTP id q6-20020a056e0220e600b003157fecf1f0mr4457535ilv.7.1677949845722;
        Sat, 04 Mar 2023 09:10:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a25-20020a056638019900b003a058610fc8sm1709950jaq.82.2023.03.04.09.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:10:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:10:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 24/34] watchdog: renesas: Convert to platform remove
 callback returning void
Message-ID: <126e3d78-c653-4eeb-8c43-96297f44f24d@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-25-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-25-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:06PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/renesas_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 41d58ea5eb2f..12c41d6e5cd6 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -292,14 +292,12 @@ static int rwdt_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int rwdt_remove(struct platform_device *pdev)
> +static void rwdt_remove(struct platform_device *pdev)
>  {
>  	struct rwdt_priv *priv = platform_get_drvdata(pdev);
>  
>  	watchdog_unregister_device(&priv->wdev);
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused rwdt_suspend(struct device *dev)
> @@ -339,7 +337,7 @@ static struct platform_driver rwdt_driver = {
>  		.pm = &rwdt_pm_ops,
>  	},
>  	.probe = rwdt_probe,
> -	.remove = rwdt_remove,
> +	.remove_new = rwdt_remove,
>  };
>  module_platform_driver(rwdt_driver);
>  
> -- 
> 2.39.1
> 
