Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B61C6AAB7B
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjCDRMU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCDRMT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:12:19 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659E213510
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:12:18 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id k9so3334844ilu.13
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06LAqYJriJjfDRNbXw2CZIFjSTrDwVVzg8Bc7UpjYVo=;
        b=QORelBh8VolOFXGyUGO2Jk9+FwGmQhI5hBOmRm+dYkYmRMgbbKH6E5RB1P4xSscnwl
         YjXGggELYEfpGEFLr1AWeuu2PXdJGNy5EcEyi4souu0lUfqwMyM7VEFqYA+eLWOFC2aK
         sNJBWg+LWG+vBHd3PQyaBT1W/KRO8blQFcV+z8l2VdcrySWpCtmUISj3zC585YTCCc9P
         mP0RMF4Dkn5U19tESF54sVMKgFV38n6V2qHBvbU9TzF9DQELMLbRCU6rwpuST+C2QDIa
         OqEdhOGQSmljNV5Ft4lzpKP0/gIJpyoJNEkzPAEdAzhT59PDOjIGJBqT3g/NYRIPlq6J
         /Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06LAqYJriJjfDRNbXw2CZIFjSTrDwVVzg8Bc7UpjYVo=;
        b=jO37+fqKIcCP4JSg7BiJv99Zoup++j8qAfySmX5bg1LsXQgxp0m7mnsIAG3coErWsM
         IG27PQELnaj9wzDVlgMduILQL8sbSSuA1P3Yc4XmD6VoiWtobEX2s3lLHiuIZOmv42d8
         Z+6BGS+7zg1wvbP6G5oIwJtAgdQEuENc7LlYJDn7SyLBjbQlSdSYm0EStp0G8Rl3yNXb
         hTrPnLwXFlYdKMv4p4Jdwg8Tw/rK1naIT0baYxOVG06qYprN1ePpHykb0syeqcMnYVcn
         h4UdueI1xCcVj0FBnr1rgZdS75MFvLVjcFEJmm/quJPsXTjtSEHvCDV7f8B3SMr1/4oH
         JpxQ==
X-Gm-Message-State: AO0yUKXZPjErHCJ7Iel2hPHO4A1lsAPoYrdpw0u7Cc322HiuRKJJ1YdS
        9bey+S6DFwrkJ7rQhhaIs/w=
X-Google-Smtp-Source: AK7set8H+AbVh5sKWry+cJPY8/6qA2vURWLDCeB6Fzc+z9zyZpVEfak5NQHeA2LgqeuqPjZJni2bUw==
X-Received: by 2002:a92:ca4c:0:b0:314:54:4e5c with SMTP id q12-20020a92ca4c000000b0031400544e5cmr5850519ilo.8.1677949937786;
        Sat, 04 Mar 2023 09:12:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j9-20020a02cb09000000b003a47dd62351sm1723710jap.144.2023.03.04.09.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:12:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:12:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 27/34] watchdog: rti: Convert to platform remove callback
 returning void
Message-ID: <24ac36fb-22c2-4190-9c8f-e66d6805f1ca@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-28-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-28-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:09PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/rti_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 6e9253761fc1..ce8f18e93aa9 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -304,15 +304,13 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int rti_wdt_remove(struct platform_device *pdev)
> +static void rti_wdt_remove(struct platform_device *pdev)
>  {
>  	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
>  
>  	watchdog_unregister_device(&wdt->wdd);
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id rti_wdt_of_match[] = {
> @@ -327,7 +325,7 @@ static struct platform_driver rti_wdt_driver = {
>  		.of_match_table = rti_wdt_of_match,
>  	},
>  	.probe = rti_wdt_probe,
> -	.remove = rti_wdt_remove,
> +	.remove_new = rti_wdt_remove,
>  };
>  
>  module_platform_driver(rti_wdt_driver);
> -- 
> 2.39.1
> 
