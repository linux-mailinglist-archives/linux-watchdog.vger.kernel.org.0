Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC795E94A3
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Sep 2022 19:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbiIYRFU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Sep 2022 13:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiIYRFK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Sep 2022 13:05:10 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6691A065;
        Sun, 25 Sep 2022 10:05:03 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d11so4296599pll.8;
        Sun, 25 Sep 2022 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=/GAMoSeO1gQHIXQ3JMUiACgImT+OyNQhBWDO/uPTvmw=;
        b=W14yyeWBZlbYLov1jv/HTNGwquB22AhD0e0KQQZ5oELBXA+gcRXLut4CxPaa8cwpL6
         QLmcVvQEzdUKpxcEfsJvcEzAEQlaaO47LgoKOTmbqBkaKPChjWiNUhAVA5sXPbqnWpiy
         eWACNKFjytDgf5eYaWfpWlOvSJrD4G6TC3JI6e15998O+wIqeILTybEjlAleG/xL5FLp
         Esj8JTbu7TD8UZhvrIcPKnvAUrxwcQ+pVZZOAnbPN9yCyx2k0JcQ2kf21RH4NMmbdvBc
         R/QehD2m+q35mFSgfYJoTWSjldtXtIblX8HGg+D1u4epvos3XsQNnjt3vL5HKVX1fs3F
         i9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/GAMoSeO1gQHIXQ3JMUiACgImT+OyNQhBWDO/uPTvmw=;
        b=B0YisSW3kx9Y8Mjs4e4meMag9LKD5fhtX89lfI/jfotwykoMlHcGj2KJA4DRc/Ctzw
         uSlPsFns0E/lIolC4FIUIClmE4Hm+H2vd1AfbaxEDGELrzwgror3YiwQ6mlstRZHXwvE
         +c9ine6uilBYQUBcOTB2WdcTDFdQzu800zO3oiwLWbk3IZwRODz7CuGpu2kO/MnQ7GFq
         AuAVwwH9/dwlvJOWmWO11aX/UEMjnpZ6gy1uzPi+zf37zClnkseUe96qZrFiZaM9vt9T
         0ahKx5ui5qorQ/9xB9b9OhAedMGxqSqg99veUdEuA9VX1BUhge4tu34bYr2YPVr00QZ5
         JAoA==
X-Gm-Message-State: ACrzQf0hhbOOi35mHD3sd1flHYjGM7Y8l6d0S3bCwHXTn26F6uTlkk5a
        zsQAXq5W4T2w54gvHCg8mCM=
X-Google-Smtp-Source: AMsMyM7V9ts1goNHjYCerjjlxMMcu7ySK4fe8i0/OoPRsmT4RTxJAKt/R3B1yYScVon+zw1BVvUSSw==
X-Received: by 2002:a17:90b:384b:b0:200:3215:878b with SMTP id nl11-20020a17090b384b00b002003215878bmr20371220pjb.176.1664125502463;
        Sun, 25 Sep 2022 10:05:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v9-20020aa799c9000000b00540d03f522fsm10274151pfi.66.2022.09.25.10.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 10:05:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Sep 2022 10:05:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] watchdog: s3c2410_wdt: support exynosautov9 watchdog
Message-ID: <20220925170500.GA1761695@roeck-us.net>
References: <20220520121750.71473-1-chanho61.park@samsung.com>
 <CGME20220520121722epcas2p25b1d7b12db6030b490f191c2ae3e9f9d@epcas2p2.samsung.com>
 <20220520121750.71473-3-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520121750.71473-3-chanho61.park@samsung.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 20, 2022 at 09:17:48PM +0900, Chanho Park wrote:
> Like exynos850, exynosautov9 SoC also has two cpu watchdogs.
> Unfortunately, some configurations are slightly different so we need to
> add samsung,exynosautov9-wdt and separate drv data for those watchdogs.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 41 ++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 6db22f2e3a4f..0dbb3ec9c29c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -60,9 +60,13 @@
>  #define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
>  #define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
>  #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
> +#define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
> +#define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
>  
>  #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
>  #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
> +#define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
> +#define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
>  
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
> @@ -236,6 +240,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>  
> +static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
> +	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
> +	.mask_reset_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
> @@ -249,6 +277,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos7 },
>  	{ .compatible = "samsung,exynos850-wdt",
>  	  .data = &drv_data_exynos850_cl0 },
> +	{ .compatible = "samsung,exynosautov9-wdt",
> +	  .data = &drv_data_exynosautov9_cl0 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -630,8 +660,9 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  	}
>  
>  #ifdef CONFIG_OF
> -	/* Choose Exynos850 driver data w.r.t. cluster index */
> -	if (variant == &drv_data_exynos850_cl0) {
> +	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
> +	if (variant == &drv_data_exynos850_cl0 ||
> +	    variant == &drv_data_exynosautov9_cl0) {
>  		u32 index;
>  		int err;
>  
> @@ -644,9 +675,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  
>  		switch (index) {
>  		case 0:
> -			return &drv_data_exynos850_cl0;
> +			return variant;
>  		case 1:
> -			return &drv_data_exynos850_cl1;
> +			return (variant == &drv_data_exynos850_cl0) ?
> +				&drv_data_exynos850_cl1 :
> +				&drv_data_exynosautov9_cl1;
>  		default:
>  			dev_err(dev, "wrong cluster index: %u\n", index);
>  			return NULL;
