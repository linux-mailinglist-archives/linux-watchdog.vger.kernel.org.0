Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AA66AAB68
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCDRGu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRGt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:06:49 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FFD1E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:06:48 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id r4so3863748ila.2
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eEsduguoHp8xfjcn86oySH3J0qYcJhf0bsI2GP/F+0=;
        b=cbnVFCvjb0KC6uBY9ZRKiakCQ3hiuxsYXBQUNoXRtJjZiZhajirKHU+pQVlrLuvudc
         fspAk9Vci0/u2IS3TrHOMhJc8Gnwn/mkDUoMEWsikOutTZb/HeFZP0J3FgxnWv404BEP
         O2kQU0lG/q4zvgDzVWkYOyW06pxe6LPGUrikrsd1m1+aspQ/LOvvrXyAEHjuD5wYPryC
         JQ6LjSBIPXfMFOGRFEljzS3yRlQRwzx1msQ3qogHRTSofZpl37AHAgW9b32V+k27TyIq
         6DHQAQnloPI4RYFZ6Z8lQhe3dHx/OCpS4HsPo5CgiIuW2lXpgSZYSEvQmgDNcqcGqIy8
         YtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eEsduguoHp8xfjcn86oySH3J0qYcJhf0bsI2GP/F+0=;
        b=BFrcgtXRP6omMGghG0JYccz+DQKLPrAojCTIxxtG373AaKJP8HcqXagGnfi81c0O8S
         nf9ASuPU7LReMbOoQeP6HdDeGUgzcEdvyjDdIFHzGWTU3F39je2s+7n/4+2yws3aa7Dq
         r1Lj0NUQFNwR5F3sOwTUIQG7rf6oApjYnKC2ZvBqAPXfjtqTH5RbzSaJ2x0Vc9J2ls3m
         iwOxndvPkfY0ZllEr2ftc8DjPMEykJGIgIh17GYGoCmksqfOI6CLdUPZKB9OBulVisSt
         r6HTYtybBJFF0nTyekxOKgWF+ETUXJBDV/WTUv9byz+WGYjwFETYkgNR6yJd6Zu8qZeO
         elIA==
X-Gm-Message-State: AO0yUKXEnRXE58IsIz8vT6EcD8KQcHXUjR96YS2eHDMJDF0MaGAUn5bC
        EL06gAtphjQkbFAu3qCkBCs=
X-Google-Smtp-Source: AK7set/hW+ZZJUV4fgGq8GazDRKHR0cLt22V9f1f7AoqTkqhzqMJ9p6xeZeV0Zd/rUMX7KKYdhSjAA==
X-Received: by 2002:a92:b30f:0:b0:315:375c:dc5a with SMTP id p15-20020a92b30f000000b00315375cdc5amr3719071ilh.20.1677949608244;
        Sat, 04 Mar 2023 09:06:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i22-20020a02cc56000000b003b331f0bbdfsm1660773jaq.97.2023.03.04.09.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:06:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:06:46 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 12/34] watchdog: gef: Convert to platform remove callback
 returning void
Message-ID: <402a2f68-2b78-43ad-afc8-37dada783348@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-13-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:54PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/gef_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
> index df5406aa7d25..97afc907f659 100644
> --- a/drivers/watchdog/gef_wdt.c
> +++ b/drivers/watchdog/gef_wdt.c
> @@ -283,15 +283,13 @@ static int gef_wdt_probe(struct platform_device *dev)
>  	return misc_register(&gef_wdt_miscdev);
>  }
>  
> -static int gef_wdt_remove(struct platform_device *dev)
> +static void gef_wdt_remove(struct platform_device *dev)
>  {
>  	misc_deregister(&gef_wdt_miscdev);
>  
>  	gef_wdt_handler_disable();
>  
>  	iounmap(gef_wdt_regs);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id gef_wdt_ids[] = {
> @@ -308,7 +306,7 @@ static struct platform_driver gef_wdt_driver = {
>  		.of_match_table = gef_wdt_ids,
>  	},
>  	.probe		= gef_wdt_probe,
> -	.remove		= gef_wdt_remove,
> +	.remove_new	= gef_wdt_remove,
>  };
>  
>  static int __init gef_wdt_init(void)
> -- 
> 2.39.1
> 
