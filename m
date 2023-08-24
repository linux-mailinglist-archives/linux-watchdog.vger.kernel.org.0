Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300FA78748B
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Aug 2023 17:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240139AbjHXPsI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Aug 2023 11:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbjHXPrf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Aug 2023 11:47:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CC71B0
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 08:47:33 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf3a2f4528so317865ad.2
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 08:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692892053; x=1693496853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZbTbqyifHo2Xj3dUKGjyERhp4JxSGRWM0eDzA5cKGM=;
        b=VcBQKhxzxcW83w0laF1iqFe057uW9fMHDNhNi0Z85sO19URITmW5hxJHTamyiRGR6k
         sLxnVLQ3Zfm7qWQ0trm+ScHXZXATdHVJyW2sNLeEj+N36j+34IGlX9vx2mrH1vB/UEO7
         4w1SfOFDdT57Uxr0YmcYzD/2JY5vJx+l7A6qku5DxLnz2BvR8CwlBIKdZ4HXE3E9y4qG
         z3tMiaD3bBlGji7H7HsiKWfbIv0oSN7kEONqYNXvImNHzcwD8/Y0G4XDkUwnu21Eo28U
         oK4X2w1T+HKU0tsrfsNwr5iPL7WHG9Q/VOuuN/LoWRJlumup17Dd79qr1WHNMzu/8Im/
         atVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692892053; x=1693496853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZbTbqyifHo2Xj3dUKGjyERhp4JxSGRWM0eDzA5cKGM=;
        b=H4rTAmYuxudh7unPkA0yyqTGwvUkl6Gvi7rvWmX8hx8A/lCfK9isjWaDiNAxjRK4YO
         nSFe5T7dUenjf9IndSd6oY72O+2N8gHx3B7UoBfcHra66NI3BFSXxcLVgxYZeaGChABE
         exwGyxnEf469x5QJmawnX0EU4CPPZ/Qo1ngO1Gserv1dydYsSDdak2F+fxfQkruBEmEj
         IgF9bdF4BtPKPca9ckDMuC9snmske1NZ4nz69Yd1urF8PwfXbvmR/6OyUPgPKg7xeynG
         sEP49cTNY773aMeg20qkDtlb/6j39qkq9H5FlKu3I+2bTB4LPDvIAC7L+Ro1M64HW9Ux
         8QVA==
X-Gm-Message-State: AOJu0YyYhozQCmZ9PaPonQbrDsEVLGHFSzyst/2lplIB//U1vIUzghma
        OMd2bofZEuodAvRGEgXxL6I=
X-Google-Smtp-Source: AGHT+IGLhOphwr08/SQGJgr42yJ9hEeJJNhQvvfOSo4aDv5fc9YWWSio3eH8tw1k4O2rijw6/efOzA==
X-Received: by 2002:a17:902:e881:b0:1b9:e091:8037 with SMTP id w1-20020a170902e88100b001b9e0918037mr19651380plg.30.1692892052820;
        Thu, 24 Aug 2023 08:47:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b001b895336435sm12897631plk.21.2023.08.24.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 08:47:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Aug 2023 08:47:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@tuxon.dev, xt.hu@cqplus1.com
Subject: Re: [PATCH -next 2/3] watchdog: ath79_wdt: Use the
 devm_clk_get_enabled() helper function
Message-ID: <e4a24e37-e82d-4332-828d-eed45d2c00ed@roeck-us.net>
References: <20230824135514.2661364-2-ruanjinjie@huawei.com>
 <20230824135514.2661364-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824135514.2661364-3-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 24, 2023 at 09:55:13PM +0800, Jinjie Ruan wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ath79_wdt.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
> index b7b705060438..e5cc30622b12 100644
> --- a/drivers/watchdog/ath79_wdt.c
> +++ b/drivers/watchdog/ath79_wdt.c
> @@ -257,19 +257,13 @@ static int ath79_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt_base))
>  		return PTR_ERR(wdt_base);
>  
> -	wdt_clk = devm_clk_get(&pdev->dev, "wdt");
> +	wdt_clk = devm_clk_get_enabled(&pdev->dev, "wdt");
>  	if (IS_ERR(wdt_clk))
>  		return PTR_ERR(wdt_clk);
>  
> -	err = clk_prepare_enable(wdt_clk);
> -	if (err)
> -		return err;
> -
>  	wdt_freq = clk_get_rate(wdt_clk);
> -	if (!wdt_freq) {
> -		err = -EINVAL;
> -		goto err_clk_disable;
> -	}
> +	if (!wdt_freq)
> +		return -EINVAL;
>  
>  	max_timeout = (0xfffffffful / wdt_freq);
>  	if (timeout < 1 || timeout > max_timeout) {
> @@ -286,20 +280,15 @@ static int ath79_wdt_probe(struct platform_device *pdev)
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"unable to register misc device, err=%d\n", err);
> -		goto err_clk_disable;
> +		return err;
>  	}
>  
>  	return 0;
> -
> -err_clk_disable:
> -	clk_disable_unprepare(wdt_clk);
> -	return err;
>  }
>  
>  static void ath79_wdt_remove(struct platform_device *pdev)
>  {
>  	misc_deregister(&ath79_wdt_miscdev);
> -	clk_disable_unprepare(wdt_clk);
>  }
>  
>  static void ath79_wdt_shutdown(struct platform_device *pdev)
> -- 
> 2.34.1
> 
