Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5F945A725
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Nov 2021 17:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238679AbhKWQJi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Nov 2021 11:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhKWQJe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Nov 2021 11:09:34 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A37FC061574;
        Tue, 23 Nov 2021 08:06:26 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso34387074otj.11;
        Tue, 23 Nov 2021 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vAxK6Y+Cod7NmIj6QYzBXdZK4P975yec98Q38J8gwlw=;
        b=L+Xf97b+FlXoosqGGnjL4lplPxXVL9hzypOdZ5rjyqFGBB5CICsvcHp3wlJpxRd23C
         S+LG6EcrzV1u9ahIbHoNUHwSwTQLbnginwJXkwJpCvGgqfQOp5b0tazT8af8le/Rs7wJ
         IVnAfAjxhvO0H9nTSCjATiFZMQvQ699bK3Q7RVcoxBjFjXxmHtd4BhtVkDe2hRGtEcnY
         C0jBv1Cy+s5xjTTDvgdlzcgC6OWVp/s4+WfxVwBXDhmTlGojYW0ZWhyaXI40XTMGMDAf
         PhjbDSkNy7TLp310zwkpmyOswqdcNCKt/dR8cgcQoGaYlBhxbYZAYgn6+DwyM0KDN47p
         s/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=vAxK6Y+Cod7NmIj6QYzBXdZK4P975yec98Q38J8gwlw=;
        b=KL9CUJ6ysdmuUWOsqCitZ+COYV+5bN1LbWUd3s6F5Fon7HihM7Ud/5asff+63QI4wh
         Hf+Ze8+O36gLzbxQbYxVcCcgAe71vGTFjuKXO1V/Vvy2jxPsBrmIc6AHmvb1bFgZY0Vf
         iUmix+fbe4HfLIjQbcpFm8xFWueitu/TusYQwiYvna4kZ8VRbnUVYqw5g2PJzS8MQumv
         wKZRLsVPc8YaBndZp7Vm6JkRWcvxKE3RawwDIaH1evXfAZgzVy6UHApAHqLk+e4W1xLS
         QjxH1LsXW8638ZLzbHxrvRYa32YoWNgIWo+GQmNjMdBj2u6Yotebm5/16GhQ02OVwTL6
         rB/A==
X-Gm-Message-State: AOAM531fo1dSMEhJeGScdkwh5iqzQfjqe9eXQ8/fgsaXhOQtk/FhPv0q
        clIhcr3nhAa5a3eAuSb9dPM=
X-Google-Smtp-Source: ABdhPJz5L0B0IMgSY31z5m/jlRDjDec5X9EfNAlKuFCCJvniwwZRahAgfUOGNQSTOBrNhQ3HhhcOPg==
X-Received: by 2002:a05:6830:1447:: with SMTP id w7mr5387792otp.199.1637683585731;
        Tue, 23 Nov 2021 08:06:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u40sm2787005oiw.56.2021.11.23.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:06:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 23 Nov 2021 08:06:23 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 09/12] watchdog: s3c2410: Cleanup PMU related code
Message-ID: <20211123160623.GB2326185@roeck-us.net>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
 <20211121165647.26706-10-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211121165647.26706-10-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 21, 2021 at 06:56:44PM +0200, Sam Protsenko wrote:
> Now that PMU enablement code was extended for new Exynos SoCs, it
> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
> grouping and style changes, to make it look good again. While at it, add
> quirks documentation as well.
> 
> No functional change, just a refactoring commit.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Changes in v4:
>   - Added R-b tag by Guenter Roeck
> 
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

0-day complains:

drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead

It doesn't seem to like the idea of documented bit masks. Not really sure
what to do here. I am inclined to ignore it, but I don't want to get flooded
by 0-day complaints until I retire either. Any idea ?

Guenter

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
