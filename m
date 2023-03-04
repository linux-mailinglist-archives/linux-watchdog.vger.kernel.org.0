Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0B46AAB81
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjCDRNt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCDRNs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:13:48 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5801E079
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:13:44 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id x10so3831716ill.12
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677950024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nRZ9QeXBrJgMOYATMLE2st06nd/bf43ZRWWK4Ja/HgE=;
        b=QzfANKD8SXV+WMZ5nvUfWPiqsADX+WagY+yEqsUMXE4GPXzj0bwZ2NybFwxfPp0S/5
         Nu/eaEpoPKwyD5rcH+n4PIL24KWflU5ttQooBJS0NyVoSpUDaEko0/oLBVXjY6XLzFgG
         0rUUacGmpi8x25J5m873IQoNPYnAzNaLNqfY4Rvx6+5I3t5Ffo5DbDbOMx9e/WnubrgH
         7OLDI8gTBuwHVZf1G5PYB8UikwYUtMz3Y8ELnMWb+h8y7bwdS5h9u1oYOG0QECqEE1nk
         TKH28INLAWzoBUg4xu2w6P/ac4Z3Vc9jHVloB6/3o6wXLDE7awRTbrt3Ph0SC3kW8kEG
         58nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677950024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRZ9QeXBrJgMOYATMLE2st06nd/bf43ZRWWK4Ja/HgE=;
        b=2MQAQFO36ZE/fIGABmFTDKjWsUj837gUFFhnz/wrp9AC5FefrTJokZzmEDXhP09I9w
         PUdJe6/H6qZRdcdEsYH2tCn+xh4QQmhuHS6VcH/N9WThOVqRlfchjuXDFv6Arc7K10AM
         d/8kdFAztvs7+WrUoje4JKcfgIaCzKb1a2XDxG3Lz4ZKSgbBP/2M5q1tnwKR6EeFZyFy
         woVdvdU94OfpOBvi4GUBO5lM/P6kHFD3wvhjtTfZTMfUeF1njyWIrN+1d3nizaM7W8EG
         c86R4Q9eleVDFMzTYj5enlB5cS28XNkmZpIce0CvSe/3G90Qun8p7QXxeEykt9L0Ck9x
         o0fw==
X-Gm-Message-State: AO0yUKVlvFWJkE0DXgSelumqeF4Qmp0OkLB/yq3jRY305snyUwgCAs67
        MDys2A92n90Jx/LHhr/FZd0jQ7lO7OA=
X-Google-Smtp-Source: AK7set/c0iMpWC6BUAeTklZI8zXU+1sD20nw1CRsaR2MUe6sQLgniE9QgOBXbCXj91/ipRaUUZBV3Q==
X-Received: by 2002:a05:6e02:1609:b0:317:98d4:acef with SMTP id t9-20020a056e02160900b0031798d4acefmr5329351ilu.11.1677950024248;
        Sat, 04 Mar 2023 09:13:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y6-20020a02a386000000b003c50e23ef4esm1683521jak.74.2023.03.04.09.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:13:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:13:42 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 32/34] watchdog: st_lpc: Convert to platform remove
 callback returning void
Message-ID: <ce7e73ba-011a-4d08-9ad0-b5556c5b383b@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-33-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-33-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:14PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/st_lpc_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
> index 39abecdb9dd1..d2aa43c00221 100644
> --- a/drivers/watchdog/st_lpc_wdt.c
> +++ b/drivers/watchdog/st_lpc_wdt.c
> @@ -239,13 +239,11 @@ static int st_wdog_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int st_wdog_remove(struct platform_device *pdev)
> +static void st_wdog_remove(struct platform_device *pdev)
>  {
>  	struct st_wdog *st_wdog = watchdog_get_drvdata(&st_wdog_dev);
>  
>  	st_wdog_setup(st_wdog, false);
> -
> -	return 0;
>  }
>  
>  static int st_wdog_suspend(struct device *dev)
> @@ -295,7 +293,7 @@ static struct platform_driver st_wdog_driver = {
>  		.of_match_table = st_wdog_match,
>  	},
>  	.probe = st_wdog_probe,
> -	.remove = st_wdog_remove,
> +	.remove_new = st_wdog_remove,
>  };
>  module_platform_driver(st_wdog_driver);
>  
> -- 
> 2.39.1
> 
