Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76B46AAB64
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCDRFQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRFQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:05:16 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68681E2B1
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:05:14 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id e11so2317665ioe.3
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3IzN0qh89iCgBZLCfLSih1ZxGnYl5p7nEDA1DouDIA=;
        b=REcoO/Wpt9xAASBGR7n+E9SU2h/4xCB6VMY4nQlnLzwl8ZT0u4GNeHCkgt4279TT+A
         FfIahMS+ErbaA4hvpJsWfYzcwp0etaD0+iEOuzLhTb2SxBQim+hi1MCH4+JvaUpjjgX1
         Nsy3HuX7L91giXeO/KBzwuXzHvd7hhMke5L3+ucFAxePudpAistaIFBRCw0IU+XgY0c4
         5tnF9URP8C0Hef+l6k4aI6Nqg9qGBjpqkhWDGZLNOAW6NIMw5uEo5UmNdiJpcuXFlEeT
         X+W4ve2MSId5pr1LstMskWwjQYJAL5N89L+++yCxW8EHPRasZ+gjwzNcPIMCjVHm2Fip
         FTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3IzN0qh89iCgBZLCfLSih1ZxGnYl5p7nEDA1DouDIA=;
        b=NNt8NsTNQ5I6PaY0KGbuu3zUw0e05/qxqTxL3Jr2+a/5RV4lvDqzV3PUnNl2h+lyRG
         wROiK11h7DajWzLbpjwGEPxKjkrVUyuh5BNKfXsO843dewnN8wSi5Sso10n2BR5AYOXo
         Gtm6MCW2By5eEoSL3xUeScdM+Lq2Hre3Mxjm5JDaPEjXVe36klYaud06F4gTCXOXPZOR
         wSUajxSY51rYc4m4nFkSVnvZJDut564LyaTFKTD4yEacJ1QYDxPrO6o3uvOekOBmYasM
         k+tTG+SnHvcBD3neKc5c7citH5n7EBe9gcCcesIug04NcEr3V4RiDJqihrRre9+Mwcwy
         5D2g==
X-Gm-Message-State: AO0yUKUnWd3ZPAHi22xaAht7qVQ3LxNxxNSmMhXuXkiesD13sq3PBup+
        XzhSWJnaL9Y4vxIzQlaWsFE=
X-Google-Smtp-Source: AK7set8tEcmFvu2oaPzgxSI2qoZlll36kbN7mVLTaFc9hgVjcRceuwDvFwx0IXgVKvn875c0CRSXuA==
X-Received: by 2002:a05:6602:428f:b0:74c:c47e:e338 with SMTP id cd15-20020a056602428f00b0074cc47ee338mr3689894iob.1.1677949514232;
        Sat, 04 Mar 2023 09:05:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y13-20020a056602214d00b0074ca0fd3ac4sm1665277ioy.29.2023.03.04.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:05:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:05:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 09/34] watchdog: bcm_kona: Convert to platform remove
 callback returning void
Message-ID: <cbcfc725-74a4-45d8-986c-e924747ade0e@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-10-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:51PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/bcm_kona_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
> index 8237c4e9c2a0..49e12d47b073 100644
> --- a/drivers/watchdog/bcm_kona_wdt.c
> +++ b/drivers/watchdog/bcm_kona_wdt.c
> @@ -310,12 +310,10 @@ static int bcm_kona_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int bcm_kona_wdt_remove(struct platform_device *pdev)
> +static void bcm_kona_wdt_remove(struct platform_device *pdev)
>  {
>  	bcm_kona_wdt_debug_exit(pdev);
>  	dev_dbg(&pdev->dev, "Watchdog driver disabled");
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id bcm_kona_wdt_of_match[] = {
> @@ -330,7 +328,7 @@ static struct platform_driver bcm_kona_wdt_driver = {
>  			.of_match_table = bcm_kona_wdt_of_match,
>  		  },
>  	.probe = bcm_kona_wdt_probe,
> -	.remove = bcm_kona_wdt_remove,
> +	.remove_new = bcm_kona_wdt_remove,
>  };
>  
>  module_platform_driver(bcm_kona_wdt_driver);
> -- 
> 2.39.1
> 
