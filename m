Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499016AAB60
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCDRCz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRCy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:02:54 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79851BD2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:02:52 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id g9so3836801ila.8
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCdujuwAoemQ042S6Z+fhmomwklVEttinAabuD9sOBA=;
        b=kApsp6UfxZyqMmu385g0wyR46ZcT7yZGCzVGppvP/PUM3k4mQ4oKFZlB/i0Ax5rGwl
         5OMgbpW6N9r1AJ1Q/SG/bz3xx7wK0ag8qA4n5g42N2NddWc9F0FilDIxYYYbRwmIQ6mE
         Slz26HqrJM30Js0UVLg2gD4bWtZg3lI9m9Fp7GPsHwLilD6yDmMbULko995g/7kUMCwu
         EJExyZ2tNOIiPfDBlrlnDAhzDYybMB6REqu7lF4O+iVWCRFXEYSJhmSonNM8AadeLqol
         R7wcHCC4+DHJLFmcDuTPMYWk2lle8GNMYKrtWSg1qNCNqjQR/ETuv74+boY5XI/3JLum
         0K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCdujuwAoemQ042S6Z+fhmomwklVEttinAabuD9sOBA=;
        b=CRUd24vdaquFFABtDPgjNp4YrRKUqpwpMQhBa/O2QVcoLrUyGPhBcIjgRp0NV7wL1b
         TuKqg8woNodQ3WLKW/fM07uWO/UNOHzESVg5hIUpACp1Fw9NxjP0+Qi6ujrJo3Y284xE
         mABwNh/xAvel4iyMJFJjcIE7vq7P/A9u/5scLFu6ODRSFdAf5SIXoXfoaU3tdxiwrOt3
         SVIv2/FSVGN20ghvqz7a5xPLvsHNVZtNecMMV9cDwVzlXTo7Jpwk/FlhGVbpYUDzfOTw
         i5UTKlICt+cIyOepiNuqcoumMZyge1p1Pkvls6nV7+sqVteOa4GZapWMQDHWWMPoB/6g
         2EYQ==
X-Gm-Message-State: AO0yUKXBpFUOIPYKCWki62u3RXCN/mSJIkfjC8LPZ7kSsQqEeKGqTtV2
        fxZ5xsiqDUYlIaL1DubjvhI=
X-Google-Smtp-Source: AK7set/RUqBTBeV/yU9zsjz0aIFeQDXaxhcxS1U1HhVGNjTbrunqnCc/ovm023bTQM5GQIHAoS4BXA==
X-Received: by 2002:a05:6e02:1686:b0:314:17d4:e9f6 with SMTP id f6-20020a056e02168600b0031417d4e9f6mr8899744ila.6.1677949372272;
        Sat, 04 Mar 2023 09:02:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n12-20020a02a90c000000b0039df8e7af39sm1754864jam.41.2023.03.04.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:02:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:02:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 06/34] watchdog: ath79: Convert to platform remove
 callback returning void
Message-ID: <a4e454b4-39fa-438e-b850-71d58797667c@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-7-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:48PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/ath79_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
> index 0f18f06a21b6..b7b705060438 100644
> --- a/drivers/watchdog/ath79_wdt.c
> +++ b/drivers/watchdog/ath79_wdt.c
> @@ -296,11 +296,10 @@ static int ath79_wdt_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static int ath79_wdt_remove(struct platform_device *pdev)
> +static void ath79_wdt_remove(struct platform_device *pdev)
>  {
>  	misc_deregister(&ath79_wdt_miscdev);
>  	clk_disable_unprepare(wdt_clk);
> -	return 0;
>  }
>  
>  static void ath79_wdt_shutdown(struct platform_device *pdev)
> @@ -318,7 +317,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
>  
>  static struct platform_driver ath79_wdt_driver = {
>  	.probe		= ath79_wdt_probe,
> -	.remove		= ath79_wdt_remove,
> +	.remove_new	= ath79_wdt_remove,
>  	.shutdown	= ath79_wdt_shutdown,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> -- 
> 2.39.1
> 
