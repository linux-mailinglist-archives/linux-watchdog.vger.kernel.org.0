Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795D378748C
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Aug 2023 17:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242057AbjHXPsI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Aug 2023 11:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242316AbjHXPr6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Aug 2023 11:47:58 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6312A1B0
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 08:47:56 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68becf931bfso15684b3a.0
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692892076; x=1693496876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvEkwOqtYD9A2sYDTTI0nP3b1hT5wGWsndiIx/7I3j0=;
        b=ijR/n48FoWYRJQgqi9l5rtgOgMCsZfDDWWfqKjGtflIdtCVk3DA91iooUs4U20PVhj
         3AuEzyUltZLnOEKt+5aCx08fVSHW178Fkl7m9aZbQ+07H3B4N09K0VdQ+e07R5f5+TFs
         LrypebYvQ/BENxcfnmkcq/XbxQVViqG49zSEmZASV+VVYkc8XU8PnDd3uoqmF5j9Cq6J
         oiMdzZs+uAq9qi8We81L/jXwoim5bidoF2lXy2gh24dwlioQ48SchK+vWAzCpjZEfkqG
         SLl1+k46aviAdnkTsHRZ+2HXwcPFU2Qp+Vo6XiXtonuk4PhPgE8OewciMaIW9NwzRtIS
         1hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692892076; x=1693496876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvEkwOqtYD9A2sYDTTI0nP3b1hT5wGWsndiIx/7I3j0=;
        b=HaBUCXfCLgkTipeRKJdxlfmgt/urIPWGpX6zZxq5OOc+yrmnBt+5mIAZIIaMkIh+f7
         5T+73Abgb7c0sl/8YS9w60R9T4kA+89Z9pVvlUbf8UBl1z+fLhH/hM+DFYCHta9nephM
         NlP+OHP5r159Mla3P9UuV1XAEb+iGTW+d7Isod3lM85LAqbp5whIZBioIhHIEaZ9Ibzn
         TKKWA7SA4S19ZsQgvUtx0ibynhL1ZuIG4aoKySr1XnHGMbeZHTCpW6X+tlSaKaWGzu2K
         1r9o8lkdklAEzoo3EnMZkqB/5Oy3teTO4aW4sRAFTx1cbm7MJouDbmx0BlUEn01253xt
         JR0A==
X-Gm-Message-State: AOJu0YyK4Ys848fqXGX1vTnmyBRwABlsVVM9VEJkWK3gVWMAGh7ZKvKP
        P7bLwJUCXmjcSaVSY2eYs/E=
X-Google-Smtp-Source: AGHT+IEudPL1tmf4+Gv8h9mQtx3b+tpZvzarDBss7NzuVD3GUUroikqQQZ48eb9h7MfUdFozA67lJQ==
X-Received: by 2002:a05:6a21:7883:b0:135:110c:c6dd with SMTP id bf3-20020a056a21788300b00135110cc6ddmr16266115pzc.53.1692892075881;
        Thu, 24 Aug 2023 08:47:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902d2ce00b001bde77f3d0esm13018685plc.117.2023.08.24.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 08:47:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Aug 2023 08:47:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@tuxon.dev, xt.hu@cqplus1.com
Subject: Re: [PATCH -next 3/3] watchdog: sunplus: Use the
 devm_clk_get_enabled() helper function
Message-ID: <9eeaf334-a2f0-4fdb-8594-9e41f2e5b3d2@roeck-us.net>
References: <20230824135514.2661364-2-ruanjinjie@huawei.com>
 <20230824135514.2661364-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824135514.2661364-4-ruanjinjie@huawei.com>
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

On Thu, Aug 24, 2023 at 09:55:14PM +0800, Jinjie Ruan wrote:
> watchdog: ath79_wdt: Use the devm_clk_get_enabled() helper function
> 
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sunplus_wdt.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
> index e2d8c532bcb1..9d3ca848e8b6 100644
> --- a/drivers/watchdog/sunplus_wdt.c
> +++ b/drivers/watchdog/sunplus_wdt.c
> @@ -136,11 +136,6 @@ static const struct watchdog_ops sp_wdt_ops = {
>  	.restart	= sp_wdt_restart,
>  };
>  
> -static void sp_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static void sp_reset_control_assert(void *data)
>  {
>  	reset_control_assert(data);
> @@ -156,17 +151,9 @@ static int sp_wdt_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(priv->clk))
> -		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clock\n");
> -
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> -
> -	ret = devm_add_action_or_reset(dev, sp_clk_disable_unprepare, priv->clk);
> -	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
>  
>  	/* The timer and watchdog shared the STC reset */
>  	priv->rstc = devm_reset_control_get_shared(dev, NULL);
> -- 
> 2.34.1
> 
