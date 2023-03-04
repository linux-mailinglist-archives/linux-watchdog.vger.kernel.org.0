Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05916AAB69
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjCDRHF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRHE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:07:04 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108201E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:07:03 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id 76so2302481iou.9
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aW6yufqcCxhYZUj/Qy9131kSwbXuQfPBuFOObKbo4ss=;
        b=ah7N1CJCwVlr43Dqog6ynqs/92G0J+uefq5T0TDcCNqOkiHVvIX+jZ7fZ+1z7302Ow
         0TqnubexssxTp8fRMNm4p9rF2NceQiK5TSpBVi8B+1VDlyYvV0Ne8znSmLojn3nU7r7D
         /1E9SMqk6LDUEorsRmj9lUdjwKVm6DPeKhWtDt39Jr9Xi7zOSI2glkp12ODX9KZW70Nl
         Q+QYjpcAZ0t5hGhdR5uJFrW86V0pqGgQs5L5wCUKXipyg4e8kvGBlAGloREpZNebqL65
         8LOY/eDWFheem+oH1TmcbQiDgGDVpyHOuZe6L+FdRHSW0whCRh7DxUbOfhFsBGfD3Kn3
         PiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aW6yufqcCxhYZUj/Qy9131kSwbXuQfPBuFOObKbo4ss=;
        b=I8GFyPcs8gjySXAa2KIGpvfqEtYHor47ljH0FBRGgdb0pY638KpmdeaMa6E3p0bYkI
         I9oLxrthNg8+aTZAqcJ3NQU9vrSU/N6U5LvMpcGic31XXMy63kRDk4XGI4cumQxCm8ht
         +Z8jRaPHV0of/Xd9gI6TMj38iAWGsAPeTzJfz9hiOuHHMvEl8uQZ+oImF+LANXdCxWZ0
         RLoBKsp80/FQtnHu8b0EVUtdz4d4fqyb51Q8EIt4JmsnqaUoNuRpvWPFL5rpr+0jxMJC
         pPpFXQoToTeYWigI97C/3k+RjEaIe+OrY239lpW7+XzobFn2s37y5iD5uOap7u14qXcN
         jYoA==
X-Gm-Message-State: AO0yUKUCyydRrNJUDVjmwazlt2tGcwA2gFQco1haDfoqEkR5bBCpryUu
        7CWBuuMgTDSVpnS7Cp3AJwkNhhYQxjI=
X-Google-Smtp-Source: AK7set/Cu0XFILlkQuVW/n5NlOm6sqE+t93eJKoQXh079qaSKW2fyTo/PB+AUP583jpE92BhReiU/w==
X-Received: by 2002:a5d:8e13:0:b0:717:df30:e56c with SMTP id e19-20020a5d8e13000000b00717df30e56cmr3942161iod.2.1677949622467;
        Sat, 04 Mar 2023 09:07:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d8411000000b00743672fee2asm1706199ion.35.2023.03.04.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:07:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:07:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 13/34] watchdog: geodewdt: Convert to platform remove
 callback returning void
Message-ID: <5c9b899b-79d0-42c2-8bad-406bd853bccb@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-14-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-14-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:55PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/geodewdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
> index 0b699c783d57..5186c37ad451 100644
> --- a/drivers/watchdog/geodewdt.c
> +++ b/drivers/watchdog/geodewdt.c
> @@ -238,10 +238,9 @@ static int __init geodewdt_probe(struct platform_device *dev)
>  	return ret;
>  }
>  
> -static int geodewdt_remove(struct platform_device *dev)
> +static void geodewdt_remove(struct platform_device *dev)
>  {
>  	misc_deregister(&geodewdt_miscdev);
> -	return 0;
>  }
>  
>  static void geodewdt_shutdown(struct platform_device *dev)
> @@ -250,7 +249,7 @@ static void geodewdt_shutdown(struct platform_device *dev)
>  }
>  
>  static struct platform_driver geodewdt_driver = {
> -	.remove		= geodewdt_remove,
> +	.remove_new	= geodewdt_remove,
>  	.shutdown	= geodewdt_shutdown,
>  	.driver		= {
>  		.name	= DRV_NAME,
> -- 
> 2.39.1
> 
