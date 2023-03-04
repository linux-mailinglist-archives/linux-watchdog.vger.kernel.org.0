Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A533E6AAB7A
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjCDRME (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCDRMD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:12:03 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB4E13510
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:12:03 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id y9so2816065ill.3
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuJaCrXIlU+LfdzmQU+e87uhvhtHNF3jdL4Wz8OiQFY=;
        b=gluO85qjg16SkbgIU508cjbxaf29ssjxCO0D69IX0D/O4mJWCwv9sd3l6L0lNEnFLf
         BsmJ86xneoZJ0xR0tuv/oPvjUsUl0V7yjJQnZOzHfHNay7KhFbElZ17ryc3lGbwSjPDn
         g+Rj8O41b0DEh5UVcT25vOd81WjIrD6/26V9sHF1NIX9SP8eHbBKMLqr74ofTIHID9wV
         948+yXWSEf9EzZtVcx2x6Oj8aBRtRRYnJVBvbDNQOqh2wTzPDtOHS0M2tgXlr/CdHIUF
         Lk6modVxUAMupij/IWu0WAiRmDX6Df5AWxF5ph0jPJEq0RbQeZvArbEgOMxbOK8RGZQ+
         HwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuJaCrXIlU+LfdzmQU+e87uhvhtHNF3jdL4Wz8OiQFY=;
        b=GggytbBhis/QV2JF9wi0B80RBZNN5ISh+Gt5kvQvWkzU7LVvtjzZYbyN5oPLDcRrl1
         uzkC6edNdTnrUXVZViRZ75uH5/ezMG45cm0K6xjeAnh0Jk4EDDFfPhqu0DB02LyG8Tvx
         TpOrcZqQPFHaSXOO0SIlJ5JninfDOPMuTaR5a/XFqZ+AyzoJEi2kZFbkUcfZTcXRDTbs
         +LiZ16rN933i6caguAY7ZCV7sv7mD1bQppvwfOCTI84bk+K8pcebRXakDBlEA/7FQM5/
         F1+VOJk1QsAk4TDD/wulx33WkN41OqsmMzafosp85BHa9ie4vklETWUXYKBMwA4sc4kN
         YO3g==
X-Gm-Message-State: AO0yUKWowvXO6j5syBSX4dOOmWKZl0RpSHnSNGw2fYm5UIOC31Gp5eg+
        NjnvLCBT1gRU85lDoIKlMV0=
X-Google-Smtp-Source: AK7set+MtTQpFqWSugnyAyNIW+FIxRTWNWpVpYNb/3NLOmWC/KUERRKT6Cb0LzgI4kVscAC2GGwpnQ==
X-Received: by 2002:a92:7406:0:b0:315:5651:3317 with SMTP id p6-20020a927406000000b0031556513317mr4332291ilc.14.1677949922433;
        Sat, 04 Mar 2023 09:12:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g22-20020a02bb96000000b003c51ac57342sm1699459jan.126.2023.03.04.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:12:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:12:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 26/34] watchdog: rn5t618: Convert to platform remove
 callback returning void
Message-ID: <352680b1-5437-4b96-b06d-c97df3939aed@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-27-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-27-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:08PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/rn5t618_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
> index 40d8ebd8c0ac..b0da5cc8ccdf 100644
> --- a/drivers/watchdog/rn5t618_wdt.c
> +++ b/drivers/watchdog/rn5t618_wdt.c
> @@ -181,18 +181,16 @@ static int rn5t618_wdt_probe(struct platform_device *pdev)
>  	return watchdog_register_device(&wdt->wdt_dev);
>  }
>  
> -static int rn5t618_wdt_remove(struct platform_device *pdev)
> +static void rn5t618_wdt_remove(struct platform_device *pdev)
>  {
>  	struct rn5t618_wdt *wdt = platform_get_drvdata(pdev);
>  
>  	watchdog_unregister_device(&wdt->wdt_dev);
> -
> -	return 0;
>  }

Better call devm_watchdog_register_device() in the probe function and drop
the remove function entirely.

Guenter

>  
>  static struct platform_driver rn5t618_wdt_driver = {
>  	.probe = rn5t618_wdt_probe,
> -	.remove = rn5t618_wdt_remove,
> +	.remove_new = rn5t618_wdt_remove,
>  	.driver = {
>  		.name	= DRIVER_NAME,
>  	},
> -- 
> 2.39.1
> 
