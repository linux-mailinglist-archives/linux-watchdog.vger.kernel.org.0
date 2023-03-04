Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247BB6AAB80
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjCDRN3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCDRN3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:13:29 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0545DE079
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:13:28 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id bf15so2314596iob.7
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677950007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sf0XJYuAec+WAiaR5fCeH9Umvwr2pFJIeGRweOWS/Kc=;
        b=X5ry44p5DYrfyGFU9jLmO5U5SaVm8YkTT7mJGPFZuiYmDmLKz2HaNO92F5gvlIu1Jo
         S7mpoEx5OtX78JSqDWA80jO0uxHdAkNUN+xAYoouJvYV9xClMfqNPtlZ1VBgvP1BiYM2
         exDT1xCleXi7GY9Wwf6HA9De4u80YyTZr7nyFjVx7IIKyBxF8y0lAlmOrYZa+JWQHkUD
         s3fzCYeTyVjO84E1p6tv3sQpK5smCrAfLLbTjxVdl2dh7Npp6bts2LKpYxdqf4omOzR3
         9bN+HFCnuwcmNV6/o/gGETkPftiyjftYnGGQnTDG7Whzk/55hkfnOPSm+8B0USdqcFVq
         t06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677950007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sf0XJYuAec+WAiaR5fCeH9Umvwr2pFJIeGRweOWS/Kc=;
        b=OK/8Ejqprodp5T52b8Ke0Of0ZXOLvbm5YEHEd+oWzIiJpN3gKY5k6BbZwdOzhS0DSM
         8U542XrxBH65myb9/zjeXok7H3vasmR3myrm/2HR0SxKaK+Wmh2D3QP27uGCzB8hz253
         QXLJUZ1uqHCEtsrfUZGvYefIIr0YRzcYZamKjopaCQjhySUeadUst/JdtkNhJROxrVFh
         oLHFYWI/1oML510r4FcYPUoo1ZLTjyaUo05C9eU42utdUyvT2FxVDnrQSrw3ro4Kya3R
         R+k+qKtEECz9RRiWTRy8Wf3mkGj2kP65jHtFpheNkTtPokLeSHhfNRjawT9qbME14PBL
         GDhg==
X-Gm-Message-State: AO0yUKUmJnGKJbuiteEe2OX/hd74I7xi3yRzQUS0bSHWfzbQ10hv5Dkj
        LLVMPKCGQeIypzkQCBcg4w8=
X-Google-Smtp-Source: AK7set+Uxuszcp/kOrsvToa67sdFCZu70ibCJoOEQ71PNpDFPF6/pzKGl4LFcgjgUgN9u6w2hxkBqw==
X-Received: by 2002:a5d:8459:0:b0:74d:ad9:d4f9 with SMTP id w25-20020a5d8459000000b0074d0ad9d4f9mr6698388ior.10.1677950007373;
        Sat, 04 Mar 2023 09:13:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x25-20020a02ac99000000b003b443977af0sm1696678jan.7.2023.03.04.09.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:13:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:13:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 31/34] watchdog: shwdt: Convert to platform remove
 callback returning void
Message-ID: <4f423d4d-68dc-43c4-9ad2-995589577258@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-32-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-32-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:13PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/shwdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
> index f55533e0e045..10f1fba78ec2 100644
> --- a/drivers/watchdog/shwdt.c
> +++ b/drivers/watchdog/shwdt.c
> @@ -279,13 +279,11 @@ static int sh_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int sh_wdt_remove(struct platform_device *pdev)
> +static void sh_wdt_remove(struct platform_device *pdev)
>  {
>  	watchdog_unregister_device(&sh_wdt_dev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static void sh_wdt_shutdown(struct platform_device *pdev)
> @@ -299,7 +297,7 @@ static struct platform_driver sh_wdt_driver = {
>  	},
>  
>  	.probe		= sh_wdt_probe,
> -	.remove		= sh_wdt_remove,
> +	.remove_new	= sh_wdt_remove,
>  	.shutdown	= sh_wdt_shutdown,
>  };
>  
> -- 
> 2.39.1
> 
