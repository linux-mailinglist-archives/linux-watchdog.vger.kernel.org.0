Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1946AAB5E
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCDRC1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCDRC0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:02:26 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25ED31E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:02:26 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id r4so3856330ila.2
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HzJ185MSJn9twzK+H+FcESy+mris9atqUOHhC0aSnA=;
        b=AXPIMa9JdFka0VOuI9vPEA8XHEBJRwFlPTvXC+nSCdtctb+xpxpHbNyresnwcTMm6q
         W/uzooujSbDY24MhwSRn1fKedrt/xyAMIMbhZYGn1kqEVqwdOjNRf4G8Qxy9zHcyyN+v
         /F7ID3mBDkez86Mstr4OCRzh3Us7cgPifQdBQh9jMw70CwNyrGFp4feiFcgpS0iNgb0E
         GOAws8rNrbtYL3ccw8VjTPNYEUmfIGk9hW+LynxKveNtGtjJDa1s15RJTumqosYupUZu
         744+dz0UOR88vsZHax0CD81rMLx6u7FcTBoE/BLP0s6wOPyQUKLLKnWMzvi5S9htu/6r
         duiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HzJ185MSJn9twzK+H+FcESy+mris9atqUOHhC0aSnA=;
        b=AGPy9ZUnnEBzDw6Ane0X3yrt8bNrzXg5EszQ2/oa0wRZn6QLn/QV7IosX43eY4w0ss
         FLO460d4bDrfJ1vDd9zq/DLGK5S9WwBIYmMvri+Ch9srqheBD6w3FeIwpW4a/2w4rCMJ
         +gV0/XXd+35hBSoZ8sDLmGW/t0ewy0JMLNlamQ+GL7axMu/ZEUFdx+nxQtAeb4WYfd3g
         vv3hye/9abMraNEilYWMzPsTU3O3LhDCr/yegsN0cWx3SMUx+NW5nS8I52pEAZ/x+VW+
         vJ+qvWXc/3RorCtDi3/3JCLBwhIU5o2Y0vHCA2bOvDxVWnTlLj14QCushypwNOwfDTt8
         gIoQ==
X-Gm-Message-State: AO0yUKU+zKBkfH3NI/7LA76Ilzji5KAWgOWKZFelo3Hlz2iFWnOiUFF2
        HOyYb3gNkv4O/7/R4cQVkaY=
X-Google-Smtp-Source: AK7set8sCGxGMEYgc6XJiOvtpwCIS8GdtKAYcUia3pA7jJjzwC/DgCPnC0x60YoItbqd5DrpseZ7XA==
X-Received: by 2002:a05:6e02:2199:b0:315:9749:7a0e with SMTP id j25-20020a056e02219900b0031597497a0emr5462303ila.23.1677949345547;
        Sat, 04 Mar 2023 09:02:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a5-20020a056638018500b003ebb74da18fsm1630705jaq.151.2023.03.04.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:02:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:02:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 04/34] watchdog: ar7: Convert to platform remove callback
 returning void
Message-ID: <05b324ea-368d-4e72-8c13-729311d27fef@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-5-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:46PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/ar7_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
> index 743e171d97a3..cdcaeb0961ac 100644
> --- a/drivers/watchdog/ar7_wdt.c
> +++ b/drivers/watchdog/ar7_wdt.c
> @@ -290,12 +290,11 @@ static int ar7_wdt_probe(struct platform_device *pdev)
>  	return rc;
>  }
>  
> -static int ar7_wdt_remove(struct platform_device *pdev)
> +static void ar7_wdt_remove(struct platform_device *pdev)
>  {
>  	misc_deregister(&ar7_wdt_miscdev);
>  	clk_put(vbus_clk);
>  	vbus_clk = NULL;
> -	return 0;
>  }
>  
>  static void ar7_wdt_shutdown(struct platform_device *pdev)
> @@ -306,7 +305,7 @@ static void ar7_wdt_shutdown(struct platform_device *pdev)
>  
>  static struct platform_driver ar7_wdt_driver = {
>  	.probe = ar7_wdt_probe,
> -	.remove = ar7_wdt_remove,
> +	.remove_new = ar7_wdt_remove,
>  	.shutdown = ar7_wdt_shutdown,
>  	.driver = {
>  		.name = "ar7_wdt",
> -- 
> 2.39.1
> 
