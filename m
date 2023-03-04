Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2487B6AAB7C
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCDRMz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCDRMy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:12:54 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A9813510;
        Sat,  4 Mar 2023 09:12:51 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id q6so2320927iot.2;
        Sat, 04 Mar 2023 09:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UryvMwiYfarXTxD7q5J/j1SGEKtkERnpleJCFf4cbUM=;
        b=MsqEIDgv6MRLJ8bkdeVVfSLYhzSizuNGvIkZNGtQom4nKnZUiBiyypvAOHUOHQ8OHw
         yLxenG4tqjfqo2nHIxIbx8hn8diwFitKQdrd2Llr7Umhc4VYeI4DDilbt+m25mxsOFjJ
         QD9wijHwAJwyYyYF437w+FFuwbASGWipaoLp6JdPAGsleV8JF0he8Nm1K9ON2xoFayOE
         ytuo7HRkSinf7W7iUMaMD1k8Jdkui4tPc/MZkX0M5l2dQooSBKf2gvUw2LwnZRAGbIDB
         Vm+G6L2fefVOsRCTf5JzD5sGFsrraPprxBxYJ2S5QlOV0rm7PhK3wKejfLPY9EQEvYSm
         7yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UryvMwiYfarXTxD7q5J/j1SGEKtkERnpleJCFf4cbUM=;
        b=kvSU9o+OkwBMBV0wT8b2AFd2uJOPCyR1nZiNMMSTpkCh21Ary7JYfJ/xMHPshQOY66
         C0zZfEVi4xJfqDuZbXrvGwC4/czz0FjA+1qmaEE0UleI3zZ6OVFgNgyB+coqZsXpmxBc
         YXa9KqngdyEhqe3+z0TlNogpleIBdmQ5bUnsQ4mMCWgC06LuEl0gYjVfu5VO5iYEWm56
         xtEHGmzzcciCQxjHw5OjyfjSajteIrbFkuVuJNQtzXReySPsbVqWZpR60UrZzqGZmerz
         3VfdV1OmX2QpQrSh4TW3WIKbMaoNpn0MWkbjhov+n0yaFEYfhy3krcwp16C5ZVKBQ0ia
         cEeg==
X-Gm-Message-State: AO0yUKXsa4wQP1+ho3GloJUJX+sGirPuvDGgsGTjWPxZNZZfyN1jlKis
        cZei4EaIP/DmwhyRB2kcpq44BDBMQb4=
X-Google-Smtp-Source: AK7set/xDy/AuYp6zyGYVReYoQ6yCkfrFMKdlA5DJkWiF0II8VEQtqcmvjzN/Z1wIR7jlJwSQakI9w==
X-Received: by 2002:a5e:860a:0:b0:744:cd00:854f with SMTP id z10-20020a5e860a000000b00744cd00854fmr4018721ioj.17.1677949971079;
        Sat, 04 Mar 2023 09:12:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f5-20020a056e020c6500b0031593c8861asm1510914ilj.50.2023.03.04.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:12:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:12:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 28/34] watchdog: s3c2410: Convert to platform remove
 callback returning void
Message-ID: <3b0b717b-9509-491f-aa83-bf57e868c2dd@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-29-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-29-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:10PM +0100, Uwe Kleine-König wrote:
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

Should no longer be necessary with the two patches I sent a short
time ago.

Guenter

> ---
>  drivers/watchdog/s3c2410_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index cf104a844a43..d1f408913843 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -775,7 +775,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int s3c2410wdt_remove(struct platform_device *dev)
> +static void s3c2410wdt_remove(struct platform_device *dev)
>  {
>  	int ret;
>  	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
> @@ -789,8 +789,6 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>  
>  	clk_disable_unprepare(wdt->src_clk);
>  	clk_disable_unprepare(wdt->bus_clk);
> -
> -	return 0;
>  }
>  
>  static void s3c2410wdt_shutdown(struct platform_device *dev)
> @@ -845,7 +843,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
>  
>  static struct platform_driver s3c2410wdt_driver = {
>  	.probe		= s3c2410wdt_probe,
> -	.remove		= s3c2410wdt_remove,
> +	.remove_new	= s3c2410wdt_remove,
>  	.shutdown	= s3c2410wdt_shutdown,
>  	.id_table	= s3c2410_wdt_ids,
>  	.driver		= {
> -- 
> 2.39.1
> 
