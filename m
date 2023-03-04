Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21516AAB6A
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCDRHc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRHb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:07:31 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870241E5C2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:07:30 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id b5so2340187iow.0
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w7YXgsZetDDlu36Avj8ot1a3yOcFDvksfLNZO1n9AGs=;
        b=RRBWuVq3fTIc5Vmcb+FBxylNQ2wv+U9Lo7Wz8mVxp8VlZBVtY9qj4mkZMobZgkdMCg
         HCAKg8YZwtpI95QYQU3qsLNUdrrcyrDZNQ2+v64FYhiq7ga15R0ASJzE9SSMIeW4g42M
         A8XPAt62zvcckYqbmjV9D4gwTwt73eqLOuddO74DLVbXhCYpodLg6NQSdIjt/RtowdSx
         bRzBOf59e7e3fals3XFs9XUh5qidf3VLdZ7+MwFWInAIDTMn12IngNAe0xjh7pKA8bw8
         uONfDXc7AnUJS3QBVrXXn8ag/GESMW98pS1ORlcTbHqe0oMAZYfi/LpSq5m/UObgeK3p
         /3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7YXgsZetDDlu36Avj8ot1a3yOcFDvksfLNZO1n9AGs=;
        b=20pLN3QeOXz0xasLP7K5GVLO8tXSKgUkpoNzpLlRbGrMDF3QAL0zpuLr/m3WoNu+yw
         Vpr0aPdM7aK2gAG99ZCpp9JXSBjZ9qIrN5272mG9MXemMs20l+NxIe/BsUme7XDrBoKg
         e164pr0yA78HEdkGjJreKPENcRunuIO+kyJFUOjmhYwlOrxZgTlKymC25/wszPYhQYn4
         MmTUXG+kKFQa6rq5yfZ84sHWTdNzX5SjxVyZOKA+OrxGc68/N9CH3CMYW778Dx4NmJqI
         /+sUMPtHawEjueyDtcmsNjVE/bDlaucU6/P/ZvvplAORjBCi7tdHbWVugmIpyc1g1KHE
         +wjQ==
X-Gm-Message-State: AO0yUKUtwaIB6gnMC420Kz7Otn6y/+4puffIzxziJK6Du9iPTnnHPd07
        uKzQJFcfH8aiOJ42F1nNr9s=
X-Google-Smtp-Source: AK7set8tY53bv+TGvpYRGWojAqtqm/tAA4LDqfxRVGfBC4sHmsCbwZbODejXNaXfUG6VFHfIhF9Crw==
X-Received: by 2002:a6b:e60d:0:b0:74c:ecb4:6e83 with SMTP id g13-20020a6be60d000000b0074cecb46e83mr3361249ioh.11.1677949649955;
        Sat, 04 Mar 2023 09:07:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x20-20020a6bda14000000b00745a82f892bsm1677990iob.15.2023.03.04.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:07:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:07:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 14/34] watchdog: ib700wdt: Convert to platform remove
 callback returning void
Message-ID: <50e01ff0-dce7-4de1-9509-e76e3c68609b@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-15-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-15-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:56PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/ib700wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/ib700wdt.c b/drivers/watchdog/ib700wdt.c
> index a0ddedc362fc..39ea97009abd 100644
> --- a/drivers/watchdog/ib700wdt.c
> +++ b/drivers/watchdog/ib700wdt.c
> @@ -316,14 +316,13 @@ static int __init ibwdt_probe(struct platform_device *dev)
>  	return res;
>  }
>  
> -static int ibwdt_remove(struct platform_device *dev)
> +static void ibwdt_remove(struct platform_device *dev)
>  {
>  	misc_deregister(&ibwdt_miscdev);
>  	release_region(WDT_START, 1);
>  #if WDT_START != WDT_STOP
>  	release_region(WDT_STOP, 1);
>  #endif
> -	return 0;
>  }
>  
>  static void ibwdt_shutdown(struct platform_device *dev)
> @@ -333,7 +332,7 @@ static void ibwdt_shutdown(struct platform_device *dev)
>  }
>  
>  static struct platform_driver ibwdt_driver = {
> -	.remove		= ibwdt_remove,
> +	.remove_new	= ibwdt_remove,
>  	.shutdown	= ibwdt_shutdown,
>  	.driver		= {
>  		.name	= DRV_NAME,
> -- 
> 2.39.1
> 
