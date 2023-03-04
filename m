Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213376AAB5F
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCDRCk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRCj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:02:39 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0131E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:02:39 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id r4so3856553ila.2
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GI4FTjPwXlj90xVRrxBoKGNNANlvLMMD/N6xi4rU2oU=;
        b=nMQqLdCWd7kta96xkMj1YKgYeMGif+BiDFyy8zM/iVB9Oq+KqBoiHYF9CFL281rUZ7
         WtpTqh4Wt/T6JyEqN0RzrT8F8Pqjsg6KqV/PRAHBMlpkRNVj8++9WYOEvWcRsT2T5QuV
         d3yYKnB4DZ+40Pn+DV4e5iXrf6WZo02jBwYWAMMOzXPk+db1IEFm+Byn7DySfqnQdFvq
         rF7NGQQOoaR90Klk2W1uhqd/ynEzDyzhO+RdDa83oapEtU7yQ/atp9rdIWRr46ZJUaCP
         8+bpIxBFS/agx2+54HXFsRfz+KM9gFxtXuOPQ5qpk+6UHMooCEBdzm1iVbntyEyM/40a
         LMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GI4FTjPwXlj90xVRrxBoKGNNANlvLMMD/N6xi4rU2oU=;
        b=Zr7T1+pG6B/qnsvTeFKQGnpgDURdKH2sbfXIl89IPntvtSbdwKxF4b4ZwSo06g3rke
         SR376ECfeSuC68yC9bIbegBr+flF58koE1LRj/7YuAbk/br5Q1Xm3daSOZpoCr6BfLl0
         fyDuqwJp40jV1/4vv/MsstZa5tIjY40NANLMUgZdiA8mE75SAi923UKcvxYaXAxMZ29F
         Sgwugsp/86NxYOpY/LkICFKI5/Vc3XgTjGvmrAyWPME06ty6XLFaLVVXXd9jhx1FjOCD
         pqIopr1JP7cDQ6DEXu6B5EDhOIRC+Q/tBcYShNB0WEI0dcv6zMptzN761WPb7D6JVu6x
         Y7Uw==
X-Gm-Message-State: AO0yUKUztFwlB9LVm1TpcS3A/EsVYajkt00VjHNskl/nShNqhWxeIs7u
        Yz8djgWl6aFTzfd0C+0E3aw=
X-Google-Smtp-Source: AK7set+hRn0hblIMw2dRooWx1tTzAx0rDgTco1rXqLQojD+JBE/SOoXymKBhVnEYLwO8MZ/aTMD7sA==
X-Received: by 2002:a05:6e02:1bea:b0:317:9c76:db69 with SMTP id y10-20020a056e021bea00b003179c76db69mr5006047ilv.1.1677949358754;
        Sat, 04 Mar 2023 09:02:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g19-20020a02c553000000b003a2a167e7d9sm1690730jaj.96.2023.03.04.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:02:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:02:37 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 05/34] watchdog: at91rm9200: Convert to platform remove
 callback returning void
Message-ID: <6013e551-6489-4aab-9dc1-1c6c125d90e9@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-6-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:47PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/at91rm9200_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
> index d57409c1a4d1..d20ec27ba354 100644
> --- a/drivers/watchdog/at91rm9200_wdt.c
> +++ b/drivers/watchdog/at91rm9200_wdt.c
> @@ -258,7 +258,7 @@ static int at91wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int at91wdt_remove(struct platform_device *pdev)
> +static void at91wdt_remove(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	int res;
> @@ -269,8 +269,6 @@ static int at91wdt_remove(struct platform_device *pdev)
>  
>  	misc_deregister(&at91wdt_miscdev);
>  	at91wdt_miscdev.parent = NULL;
> -
> -	return 0;
>  }
>  
>  static void at91wdt_shutdown(struct platform_device *pdev)
> @@ -299,7 +297,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
>  
>  static struct platform_driver at91wdt_driver = {
>  	.probe		= at91wdt_probe,
> -	.remove		= at91wdt_remove,
> +	.remove_new	= at91wdt_remove,
>  	.shutdown	= at91wdt_shutdown,
>  	.suspend	= pm_ptr(at91wdt_suspend),
>  	.resume		= pm_ptr(at91wdt_resume),
> -- 
> 2.39.1
> 
