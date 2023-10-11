Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CC27C5771
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjJKOwH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 10:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjJKOwG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 10:52:06 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE02392;
        Wed, 11 Oct 2023 07:52:04 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4527d7f7305so2749454137.1;
        Wed, 11 Oct 2023 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697035924; x=1697640724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kdo4qhWlIRmDaeCi2uar2wRMcEsNfqZk4v7ev8TFiv0=;
        b=RSmPcrza0nBwf+jc/xs4xjC/slH0ko6XtVKZxtgZO6lrSN+RzJIGzWIy5yQgGj/8vK
         /uL7MoDc6ipQT0wMyB0X7DbmFHJDE8T+HahQQu4hr7Xo8Uce6jRbU94oPgN7PgGyJ1ZU
         jBxio4I1QdlZ/+BwR8M2PRhVoBDfiYNZkd00XuprtA6G6JvwBWAYmv3AwTEjd1Q1Ccxy
         UrIhg2KsOZtsqWVbEgyAxRld2pSv0piehYYQiTehpNGICLjXJYyXQJNd1OwRiDSRUoVD
         YKHC8AtWnSLLe9Gy3razvEgg7oe70pAG3VbqEIf/OrnQVkvTKQvrQ61W8AWxUysNe7a2
         +5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697035924; x=1697640724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kdo4qhWlIRmDaeCi2uar2wRMcEsNfqZk4v7ev8TFiv0=;
        b=YNFAzTQakO8a8fP2zgrjgFfARt6/uxwfMyVx71gdIPh3i5xmFk6qbvLBhCVIa37nFr
         wDRrOJ1bgm3v2sqsjd8oAn8NzgrPyK6zCGQi7agbhJvyISj9rULhyT5gcFKX8e+9CAMw
         hMRMmBu3wBxwu3kJVQThXTMlp4wm/7ofV/A5QSuIqus8mP6XEDMyIlCrtSFs02mpMaep
         /vcoYtHDkQ32KyISyOdFNv3YyMFfiP8OoL8Ir3wOsFC8YaBoKfx0atN0ZwtSPKXYC6w/
         uUlCZqGnwABWGImKXzZZ9hU2uzX06bwRczRC5oe3BUMmjpDO1zHWEl9Byp+WH9mqc+sD
         YXFA==
X-Gm-Message-State: AOJu0YxF1fB3dPfM/aIUH8XCGZWUvM2dJtxmlWRooy5g6/9EJkPkkZcx
        HhwUBswD0T/FPWiofhpnICw=
X-Google-Smtp-Source: AGHT+IHG29T7/O4BSxJZzGqKLVLqqEz0CaUDezQ3/K7ESKljASt/VPwo+SOLo9PesRmFJ3w8IGv0HQ==
X-Received: by 2002:a67:b40b:0:b0:452:74b1:63d7 with SMTP id x11-20020a67b40b000000b0045274b163d7mr20463027vsl.6.1697035924035;
        Wed, 11 Oct 2023 07:52:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e18-20020a67e192000000b00439320b7c23sm3224149vsl.22.2023.10.11.07.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 07:52:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Oct 2023 07:52:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] wdog: imx7ulp: Enable wdog int_en bit for watchdog
 any reset
Message-ID: <37b3eae6-a70c-4adb-b841-b6145d540c09@roeck-us.net>
References: <20231010081909.2899101-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010081909.2899101-1-ping.bai@nxp.com>
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

On Tue, Oct 10, 2023 at 04:19:07PM +0800, Jacky Bai wrote:
> The wdog INT_EN bit in CS register should be set to '1' to trigger
> WDOG_ANY external reset on i.MX93.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index c703586c6e5f..b21d7a74a42d 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -23,6 +23,7 @@
>  #define LPO_CLK_SHIFT		8
>  #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
>  #define WDOG_CS_EN		BIT(7)
> +#define WDOG_CS_INT_EN		BIT(6)
>  #define WDOG_CS_UPDATE		BIT(5)
>  #define WDOG_CS_WAIT		BIT(1)
>  #define WDOG_CS_STOP		BIT(0)
> @@ -62,6 +63,7 @@ struct imx7ulp_wdt_device {
>  	void __iomem *base;
>  	struct clk *clk;
>  	bool post_rcs_wait;
> +	bool ext_reset;
>  	const struct imx_wdt_hw_feature *hw;
>  };
>  
> @@ -285,6 +287,9 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout
>  	if (wdt->hw->prescaler_enable)
>  		val |= WDOG_CS_PRES;
>  
> +	if (wdt->ext_reset)
> +		val |= WDOG_CS_INT_EN;
> +
>  	do {
>  		ret = _imx7ulp_wdt_init(wdt, timeout, val);
>  		toval = readl(wdt->base + WDOG_TOVAL);
> @@ -321,6 +326,9 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>  		return PTR_ERR(imx7ulp_wdt->clk);
>  	}
>  
> +	/* The WDOG may need to do external reset through dedicated pin */
> +	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
> +
>  	imx7ulp_wdt->post_rcs_wait = true;
>  	if (of_device_is_compatible(dev->of_node,
>  				    "fsl,imx8ulp-wdt")) {
> -- 
> 2.34.1
> 
