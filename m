Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CCA45478A
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237748AbhKQNjo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhKQNjk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:39:40 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0E0C061570;
        Wed, 17 Nov 2021 05:36:41 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t19so6509133oij.1;
        Wed, 17 Nov 2021 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ei0HJjsaYGjyBLzHqXvQdCVL15i+HbAkWIZgtxGwu9g=;
        b=DLCtjlfKRr6PG4nYIMrwlMt4Ys8dkHaNgIJiBQkjYFv7C6W+CfE/FdHMsuyzYms529
         eLUqVeQ5glfzaLtf6rCW7DSlnrR1sltPzIRJul+rrYnTFmK491+WkwkWsbpQuRKsS6p9
         6JWWNBvS+nRp5Lp/LVbEBRt5kEQs61fd68+4eAWGxO20s0yLn230od5n1PhtsGmE8btW
         x2W1LmxHFnGUCG3Meo0BVEaT0LCioLFfTfv594p2HdOkelF05yf6ON5cT3ETmgym9DFn
         7Ly5Qzf/ulFJtMGzyr7T1gLVGAThO8H6XMTNmwHE9gEHoVuA1/8BtKRSr1bvdfj9C0ND
         yu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Ei0HJjsaYGjyBLzHqXvQdCVL15i+HbAkWIZgtxGwu9g=;
        b=oPYgrgdW9myjrER++u1hSanzAeUSqzqXFlHotBx0HP8YRjVRj1M//3zJez5ldW02Yb
         TL2oCm8BEwoBi2GcIjSZDSV1Ha6R18SK8TPbFhWeY95rO6/Bbw4DEwW/EihrOVeRVD2Y
         TY+r5ueKPWdp7ZH9xZgaTnjKnASs1xou1+xZWFI7hRxMMTWECXow2lRuq+sOqjb0HNSr
         jfdsaA+wBYAzuCRpJDzeMNx06w9ZvhJr+oP70gf7PpELunKKZ3njPJgITqBr5iBTvH1F
         Z6RGDCHXN0e2eHMD/ssLDmZuqXaRach4XGNGjOPBJkA6cHR1fQNXuKvhEkZwZZUtswA3
         H4nw==
X-Gm-Message-State: AOAM532jc+KIvlcSnKgxXcmmrMUJrXT0LxL+ZUrcjtmClpiv+9qEGuMb
        K2Xls7FLg38sz2hR72Ast7NxkK6IHNM=
X-Google-Smtp-Source: ABdhPJwYMevmhHJW4T4Vft0vFhgLnQaGg8GspYA1+pQL06t+IYXwBdQItB7k3NA+2AUP8G4pntQgvw==
X-Received: by 2002:aca:1c07:: with SMTP id c7mr50369213oic.133.1637156200951;
        Wed, 17 Nov 2021 05:36:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 2sm4605433oih.34.2021.11.17.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:36:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:36:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/12] watchdog: s3c2410: Cleanup PMU related code
Message-ID: <20211117133639.GI2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-10-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-10-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:40PM +0200, Sam Protsenko wrote:
> Now that PMU enablement code was extended for new Exynos SoCs, it
> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
> grouping and style changes, to make it look good again. While at it, add
> quirks documentation as well.
> 
> No functional change, just a refactoring commit.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added quirks documentation
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
>  1 file changed, 58 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index ec341c876225..f211be8bf976 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -56,17 +56,51 @@
>  #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
> -#define QUIRK_HAS_PMU_CONFIG			(1 << 0)
> -#define QUIRK_HAS_RST_STAT			(1 << 1)
> -#define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
> +
> +/**
> + * Quirk flags for different Samsung watchdog IP-cores.
> + *
> + * This driver supports multiple Samsung SoCs, each of which might have
> + * different set of registers and features supported. As watchdog block
> + * sometimes requires modifying PMU registers for proper functioning, register
> + * differences in both watchdog and PMU IP-cores should be accounted for. Quirk
> + * flags described below serve the purpose of telling the driver about mentioned
> + * SoC traits, and can be specified in driver data for each particular supported
> + * device.
> + *
> + * %QUIRK_HAS_WTCLRINT_REG: Watchdog block has WTCLRINT register. It's used to
> + * clear the interrupt once the interrupt service routine is complete. It's
> + * write-only, writing any values to this register clears the interrupt, but
> + * reading is not permitted.
> + *
> + * %QUIRK_HAS_PMU_MASK_RESET: PMU block has the register for disabling/enabling
> + * WDT reset request. On old SoCs it's usually called MASK_WDT_RESET_REQUEST,
> + * new SoCs have CLUSTERx_NONCPU_INT_EN register, which 'mask_bit' value is
> + * inverted compared to the former one.
> + *
> + * %QUIRK_HAS_PMU_RST_STAT: PMU block has RST_STAT (reset status) register,
> + * which contains bits indicating the reason for most recent CPU reset. If
> + * present, driver will use this register to check if previous reboot was due to
> + * watchdog timer reset.
> + *
> + * %QUIRK_HAS_PMU_AUTO_DISABLE: PMU block has AUTOMATIC_WDT_RESET_DISABLE
> + * register. If 'mask_bit' bit is set, PMU will disable WDT reset when
> + * corresponding processor is in reset state.
> + *
> + * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
> + * with "watchdog counter enable" bit. That bit should be set to make watchdog
> + * counter running.
> + */
> +#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
> +#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
> +#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
>  
>  /* These quirks require that we have a PMU register map */
> -#define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
> -						 QUIRK_HAS_RST_STAT | \
> -						 QUIRK_HAS_PMU_AUTO_DISABLE | \
> -						 QUIRK_HAS_PMU_CNT_EN)
> +#define QUIRKS_HAVE_PMUREG \
> +	(QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_RST_STAT | \
> +	 QUIRK_HAS_PMU_AUTO_DISABLE | QUIRK_HAS_PMU_CNT_EN)
>  
>  static bool nowayout	= WATCHDOG_NOWAYOUT;
>  static int tmr_margin;
> @@ -146,8 +180,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
>  	.mask_bit = 20,
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 20,
> -	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> @@ -156,8 +190,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>  	.mask_bit = 0,
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 9,
> -	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> @@ -166,8 +200,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  	.mask_bit = 23,
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 23,	/* A57 WDTRESET */
> -	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct of_device_id s3c2410_wdt_match[] = {
> @@ -253,24 +287,24 @@ static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
>  	return ret;
>  }
>  
> -static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
> +static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>  {
>  	int ret;
>  
>  	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
> -		ret = s3c2410wdt_disable_wdt_reset(wdt, mask);
> +		ret = s3c2410wdt_disable_wdt_reset(wdt, !en);
>  		if (ret < 0)
>  			return ret;
>  	}
>  
> -	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG) {
> -		ret = s3c2410wdt_mask_wdt_reset(wdt, mask);
> +	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_MASK_RESET) {
> +		ret = s3c2410wdt_mask_wdt_reset(wdt, !en);
>  		if (ret < 0)
>  			return ret;
>  	}
>  
>  	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
> -		ret = s3c2410wdt_enable_counter(wdt, !mask);
> +		ret = s3c2410wdt_enable_counter(wdt, en);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -531,7 +565,7 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
>  	unsigned int rst_stat;
>  	int ret;
>  
> -	if (!(wdt->drv_data->quirks & QUIRK_HAS_RST_STAT))
> +	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_RST_STAT))
>  		return 0;
>  
>  	ret = regmap_read(wdt->pmureg, wdt->drv_data->rst_stat_reg, &rst_stat);
> @@ -672,7 +706,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cpufreq;
>  
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> +	ret = s3c2410wdt_enable(wdt, true);
>  	if (ret < 0)
>  		goto err_unregister;
>  
> @@ -707,7 +741,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>  	int ret;
>  	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
>  
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> +	ret = s3c2410wdt_enable(wdt, false);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -724,8 +758,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
>  {
>  	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
>  
> -	s3c2410wdt_mask_and_disable_reset(wdt, true);
> -
> +	s3c2410wdt_enable(wdt, false);
>  	s3c2410wdt_stop(&wdt->wdt_device);
>  }
>  
> @@ -740,7 +773,7 @@ static int s3c2410wdt_suspend(struct device *dev)
>  	wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
>  	wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
>  
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> +	ret = s3c2410wdt_enable(wdt, false);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -760,7 +793,7 @@ static int s3c2410wdt_resume(struct device *dev)
>  	writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
>  	writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
>  
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> +	ret = s3c2410wdt_enable(wdt, true);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.30.2
> 
