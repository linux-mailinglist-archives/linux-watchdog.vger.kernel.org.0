Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA771454797
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237801AbhKQNk6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237773AbhKQNk6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:40:58 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08313C061570;
        Wed, 17 Nov 2021 05:38:00 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so4774844otl.3;
        Wed, 17 Nov 2021 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Jk5JCFsIFWl2sySSKhWSLQ0MwixWIqkQO7z4AFIadg=;
        b=oGn7Hmg7q1jQqPb1vHJiCoYKD3s+eAfxhkSmPjD2YX6B7uTLWGp902oNVuV9IYmHZ1
         Zvh8lUUR9O4ubahJHNFJaSYpIGX8otwM+/TFlZKdwM2OTmmai8gIVS4RxqpG0QJ2Olzy
         V4AysWp7A35C20SNJpKyhcFKmr1HTD6yM+AbzrQlUuJJUtRUOlWJwd+lwkpKgYf5SpB1
         3gEYtLEeOXGrhWXO/ygQ7bGAz+Jm8LRLiRk7JyRuMW2G/bDH7A7zTdhMYHeLb5suWuVK
         eCTyoItm+VzBlIAWU8xsxLZM3Hf/L2gvKtMPLamUX46UTN4sebqIkd4z39OIh4icNtQy
         V+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+Jk5JCFsIFWl2sySSKhWSLQ0MwixWIqkQO7z4AFIadg=;
        b=MnpoDg66xfGM/eBoBfculXHInZrgwaqhrNpM3MSThVfB/Q7dXcbd+IBuZzqafVVYg8
         wb0H+JAMT/7ydR4T/slnKJbXOxxt+YI9mqq8cNyP+GGfPp2qkyVGUZZa/5g3DPJuuqhJ
         LXr2YDOGPTHA/cD4x45eGdTESrWYiob4e2J1cN8ch9GEzKoOBOjEKX9NVmGbEvRDa7VO
         Besguwtqax42nEL7wdN+7TX7xF0jCCkuWqQiK3xJos8WQ5HA1B5utuA9eJmwLolWmjt/
         rVMvwRTsi56aI/mevwbnFNgXHy5//DLtaLvIh+/bw3oYc8L966IY3hrhRa15797pxp6y
         psjQ==
X-Gm-Message-State: AOAM531iTf70DP4H/GKxvyJOXfZGUEHOwrhZVhSognmatbGCrZaKt6Nw
        NBnPk/N/tsiWvjYi2OI6Wi0=
X-Google-Smtp-Source: ABdhPJzk9xXT4CRTEWRKrUrCpIrdcwgB7W01tUG/FTb05rzFoExBdTzI0bdcjQ8MMz6zPQA+35SFhg==
X-Received: by 2002:a05:6830:3499:: with SMTP id c25mr14207167otu.206.1637156279368;
        Wed, 17 Nov 2021 05:37:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9sm668940oog.43.2021.11.17.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:37:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:37:57 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 12/12] watchdog: s3c2410: Add Exynos850 support
Message-ID: <20211117133757.GL2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-13-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-13-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:43PM +0200, Sam Protsenko wrote:
> Exynos850 is a bit different from SoCs already supported in WDT driver:
>   - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
>     always 0; .disable_auto_reset callback is not set for that reason
>   - MASK_WDT_RESET_REQUEST register is replaced with
>     CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
>     reset interrupt it's now enabled with the same value; .mask_reset
>     callback is reused for that functionality though
>   - To make WDT functional, WDT counter needs to be enabled in
>     CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
>     callback
> 
> Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> instance. Different PMU registers and bits are used for each cluster. So
> driver data is now modified in probe, adding needed info depending on
> cluster index passed from device tree.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Renamed "samsung,index" property to more descriptive
>     "samsung,cluster-index"
>   - Used pre-defined and completely set driver data for cluster0 and
>     cluster1
> 
> Changes in v2:
>   - Used single compatible for Exynos850, populating missing driver data
>     in probe
>   - Added "index" property to specify CPU cluster index
> 
>  drivers/watchdog/s3c2410_wdt.c | 62 +++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 96aa5d9c6ed4..1456201f27de 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -56,6 +56,13 @@
>  #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
> +#define EXYNOS850_CLUSTER0_NONCPU_OUT		0x1220
> +#define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
> +#define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
> +#define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
> +
> +#define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
> +#define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
>  
>  /**
>   * Quirk flags for different Samsung watchdog IP-cores.
> @@ -205,6 +212,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
> +static const struct s3c2410_wdt_variant drv_data_exynos850_cl0 = {
> +	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
> +	.mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
> @@ -216,6 +247,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos5420 },
>  	{ .compatible = "samsung,exynos7-wdt",
>  	  .data = &drv_data_exynos7 },
> +	{ .compatible = "samsung,exynos850-wdt",
> +	  .data = &drv_data_exynos850_cl0 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -587,14 +620,38 @@ static inline const struct s3c2410_wdt_variant *
>  s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  {
>  	const struct s3c2410_wdt_variant *variant;
> +	struct device *dev = &pdev->dev;
>  
> -	variant = of_device_get_match_data(&pdev->dev);
> +	variant = of_device_get_match_data(dev);
>  	if (!variant) {
>  		/* Device matched by platform_device_id */
>  		variant = (struct s3c2410_wdt_variant *)
>  			   platform_get_device_id(pdev)->driver_data;
>  	}
>  
> +	/* Choose Exynos850 driver data w.r.t. cluster index */
> +	if (variant == &drv_data_exynos850_cl0) {
> +		u32 index;
> +		int err;
> +
> +		err = of_property_read_u32(dev->of_node,
> +					   "samsung,cluster-index", &index);
> +		if (err) {
> +			dev_err(dev, "failed to get cluster index\n");
> +			return NULL;
> +		}
> +
> +		switch (index) {
> +		case 0:
> +			return &drv_data_exynos850_cl0;
> +		case 1:
> +			return &drv_data_exynos850_cl1;
> +		default:
> +			dev_err(dev, "wrong cluster index: %u\n", index);
> +			return NULL;
> +		}
> +	}
> +
>  	return variant;
>  }
>  
> @@ -615,6 +672,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device = s3c2410_wdd;
>  
>  	wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
> +	if (!wdt->drv_data)
> +		return -EINVAL;
> +
>  	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
>  		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						"samsung,syscon-phandle");
> -- 
> 2.30.2
> 
