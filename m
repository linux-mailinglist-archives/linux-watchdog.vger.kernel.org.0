Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D844A6AAB7F
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjCDRNR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjCDRNQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:13:16 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454C059D3
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:13:15 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id p13so3836121ilp.11
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRfWsh0sVK5WvkFiPoeVcMixeumACB/AR5Av6Jpy/yk=;
        b=K1PZgEfhf7Km/BNf3KiNmNAvtOSoEHsQnJJ4bH5J7UX69kDoqKA0WDNVKtv8IZzgd4
         rea4Rubbi+pMMMLhG4Lzq5ApP6EVA+12F3ohKJwQhXLLJwgmFwM31igRKFQNe1rZn9gU
         K19mS7SuJOSOErg+QDg04khd8Urif53dtMaIdaB8rJ/69yTvuqAoYABHtwIOS7TkFh/7
         LBaU7BAM5X3wri9od0ehD/L67fngmtWAhzVAwBnY97mZ95vBWjhcVK833/zxl1ImleS3
         /TyHD8O2UFGFwKK/6MDptQxVDcCeCtXskmsssNigZLD1p3dHUMg9In+5+gjm9s+3bThz
         Jlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRfWsh0sVK5WvkFiPoeVcMixeumACB/AR5Av6Jpy/yk=;
        b=V58vLPnfozCgX+q0OuafHNbWvp0bdUFyfGvsOleUwwoCDXTYY/KcFboibA0O6lwXEh
         3L3Xiz7MeAu4j22W6gaw9MU5JfDIOgOrTuhhUAr7WIpNEmnJolVUDoyKsYCb/v/daQEy
         bD2rSlbQew/lbMUrngQ8SV/vACGTn+KVCz6a/T3PVN1M1z9FsD9ifTmsUu2DW79bNnEf
         aFgckRRXFd1lXDbm/75v9gBvjeDPuFSIuocg3UvT++gnbBfYxSL5/M3eTD+4eLECGjMj
         MetMV3hTLBmuOD530tYQUM7rjs0B4JRWJTy1eMFYhqyuK0tyDjGQQYlxpteshrdQSwu+
         DB7A==
X-Gm-Message-State: AO0yUKUJPTTPJz5k5wMBSVO4XVAfjHomtF5InBBeWhYIroGdQ+foQV1M
        Jd/LN9mOCBsXyYAcLV78j9gmJL/WKd0=
X-Google-Smtp-Source: AK7set86bPVAu9Urh8l6YG6soYkuIA9FWWBC7YH9kJ12ZackTRdMch3b7sw62tMCMnwRvDe9ujeikQ==
X-Received: by 2002:a05:6e02:1d8f:b0:317:c80f:b416 with SMTP id h15-20020a056e021d8f00b00317c80fb416mr5508367ila.20.1677949994653;
        Sat, 04 Mar 2023 09:13:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j9-20020a02cb09000000b003a47dd62351sm1724314jap.144.2023.03.04.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:13:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:13:13 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 30/34] watchdog: sch311x: Convert to platform remove
 callback returning void
Message-ID: <7e37f9ab-32cc-48e3-896d-b9906ad9f5b0@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-31-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-31-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:12PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/sch311x_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
> index d8b77fe10eba..409d49880170 100644
> --- a/drivers/watchdog/sch311x_wdt.c
> +++ b/drivers/watchdog/sch311x_wdt.c
> @@ -425,7 +425,7 @@ static int sch311x_wdt_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static int sch311x_wdt_remove(struct platform_device *pdev)
> +static void sch311x_wdt_remove(struct platform_device *pdev)
>  {
>  	/* Stop the timer before we leave */
>  	if (!nowayout)
> @@ -436,7 +436,6 @@ static int sch311x_wdt_remove(struct platform_device *pdev)
>  	release_region(sch311x_wdt_data.runtime_reg + WDT_TIME_OUT, 4);
>  	release_region(sch311x_wdt_data.runtime_reg + GP60, 1);
>  	sch311x_wdt_data.runtime_reg = 0;
> -	return 0;
>  }
>  
>  static void sch311x_wdt_shutdown(struct platform_device *dev)
> @@ -447,7 +446,7 @@ static void sch311x_wdt_shutdown(struct platform_device *dev)
>  
>  static struct platform_driver sch311x_wdt_driver = {
>  	.probe		= sch311x_wdt_probe,
> -	.remove		= sch311x_wdt_remove,
> +	.remove_new	= sch311x_wdt_remove,
>  	.shutdown	= sch311x_wdt_shutdown,
>  	.driver		= {
>  		.name = DRV_NAME,
> -- 
> 2.39.1
> 
