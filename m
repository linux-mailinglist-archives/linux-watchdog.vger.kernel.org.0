Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32066AAB65
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCDRF4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRFz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:05:55 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593F31E2B1
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:05:54 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id l2so3842678ilg.7
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GsSNdOiIaWldi4X8xY8YO6RRIOKq34OAK+AX1GjqSYA=;
        b=Oa8pD5tuVs7wIMoGhCuGM6S6OJRWYngWvbX3nIf0HrIYOmezBBbeOhdiRkdUIn4YO5
         DQomv5SZWuK2ovM42rR4zGugRqvAUUfpQusDuTItB+WaR5Oy854x4SdoUk4lSHwKHALy
         zZBjM6wl9FXL4G73ezrOc/U8Hut6MxRWHwd3d6lKqJ+o89O3RD608NFHbUOlRuOve4BL
         SCdkF/ZZLQ1up26G+Rgj0tFmnJp8IJAQycHk/Zn3EChBOl+fsO0nGXbS6nsSjFLCBkZg
         dCsvoX0KU3kSFeTrb6RAp9wzWglffyg6jodq1/qjDV1d7WjoiI+DESIsZgFRnwcFxAEw
         zz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GsSNdOiIaWldi4X8xY8YO6RRIOKq34OAK+AX1GjqSYA=;
        b=pZia2AlY7LHqV7FHi024V2BY3ebGD4jKt7fuTBC26KOAxxW6wyKU85I8Uep+7nIz2Y
         eEOeBxnKKxvDJKx8CJs0t6lgYnQAXpDns7lagyLBeDXDvjukTDJwAlT4ga3tGUG5kPk7
         GNy9JG8DPiCASwgebnfLqLZCdC4Ei1EhdXlSs0fmaEfNfTiEIDrRTJ40xBDXbwnDdTVT
         nl7BnNS6moqDwboWCT7KOGEk7MNcO7sK5pxpMi06M6rRFbRSPU9y/MZLyPQijrVITEp1
         2XGWcXgFD3cdTV25X6PnHDhZYuq32dERC9W89vbgcKWLirF9PB5oSMLbk7KS4xTr3dqO
         Alhw==
X-Gm-Message-State: AO0yUKVy2td9SsAe5bjDd6xZAaVCSQZBQFSVKKcGopCIB/CWCAjLrfrt
        5ZUpZcm2PSedvJaZ8usxmvH5+xLEE00=
X-Google-Smtp-Source: AK7set/66kUcQKfMoreQyjWg1mvEHEbncDHtxSWWU+RlwSJnbydkCIQI20dZC/Hl/vcSyvS5i+/6Ag==
X-Received: by 2002:a05:6e02:178f:b0:311:e48:d64a with SMTP id y15-20020a056e02178f00b003110e48d64amr5570034ilu.17.1677949553734;
        Sat, 04 Mar 2023 09:05:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8-20020a056638062800b003c4fb4bcd4dsm1715329jar.125.2023.03.04.09.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:05:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:05:52 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 10/34] watchdog: cpwd: Convert to platform remove
 callback returning void
Message-ID: <5bbf3bb1-f02b-47c8-ab01-a2ccdc6aa714@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-11-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-11-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:52PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/cpwd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
> index 1eafe0b4d71c..47250f9b68c7 100644
> --- a/drivers/watchdog/cpwd.c
> +++ b/drivers/watchdog/cpwd.c
> @@ -614,7 +614,7 @@ static int cpwd_probe(struct platform_device *op)
>  	return err;
>  }
>  
> -static int cpwd_remove(struct platform_device *op)
> +static void cpwd_remove(struct platform_device *op)
>  {
>  	struct cpwd *p = platform_get_drvdata(op);
>  	int i;
> @@ -638,8 +638,6 @@ static int cpwd_remove(struct platform_device *op)
>  	of_iounmap(&op->resource[0], p->regs, 4 * WD_TIMER_REGSZ);
>  
>  	cpwd_device = NULL;
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id cpwd_match[] = {
> @@ -656,7 +654,7 @@ static struct platform_driver cpwd_driver = {
>  		.of_match_table = cpwd_match,
>  	},
>  	.probe		= cpwd_probe,
> -	.remove		= cpwd_remove,
> +	.remove_new	= cpwd_remove,
>  };
>  
>  module_platform_driver(cpwd_driver);
> -- 
> 2.39.1
> 
