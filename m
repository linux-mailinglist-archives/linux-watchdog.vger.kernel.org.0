Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97830454774
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbhKQNiZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237694AbhKQNiO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:38:14 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A18C061764;
        Wed, 17 Nov 2021 05:35:15 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bk14so6447711oib.7;
        Wed, 17 Nov 2021 05:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aVDZIcr7fF1z1ykv537SPhhfh854jzuPBtFPuNE6ZN0=;
        b=Xw0bWhYzAFtfnVVADz1GK7cuCuWIlQQqhdMcPDXOjqOh1Sx98eXVbcdr+LHT95Zi92
         EfwawklG0XGItYLc8itDF0+Un+cGkVylUUYyZhB3jRB9QyIccei5ysBBvWgzvOZs7pNa
         5Ecr9v9wdUBD0ywjjGzIisH3IEvsZ/h0UJoiijlBOjmGPhGP1xKlWCS16tMMbU5UkgjI
         rShOLidXnDHYRJD6JvC1mkUGQSFcU6gbyIqFw5vz0kz/gFAyGdJ/hnL5MPHB9SAxKa/Q
         lcm+NDr58U+1bPp4EfVSNNajLsncPDyGK0QaKwJX2A3jdx5YeLuZTmyCRRC9JDgfXQzX
         MJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=aVDZIcr7fF1z1ykv537SPhhfh854jzuPBtFPuNE6ZN0=;
        b=z5uqVswGvRkGg2aTSKA4ps66FDhFAx8ZW1MfR9o59SJz7mADCb9OWUd7umAWhhtnft
         rXbaN+5SeMVNT9+Ll8du/fic/qeXcMgI0zqOWOB3BCHK0J7fiKryweD/DsFCGKMhl71U
         5c7dYKviel1wK3x3obf7DH82xZAdEKmaH9WhZDohTva/GflyGO+BdQi7bQqMB0wEqQb+
         AgQ239lPk77Zc3pBubbnj/TQyTaJZL9ZeSIVWy8eGk74LvR4qyV/OLRpSJ1Kj1XzT5Rn
         tDptNs6uYmvQPZPO5zMNb37LSAjcAux+DT/ZUhmc28L9pfXBo3j7I3rWzlVL7Inqhxqf
         5ByQ==
X-Gm-Message-State: AOAM533K2V1HsWgcwYlICYmRmo2GdB9m9/+x7uWKO0mxo5B4EO1zZ3lu
        jOjOJxqQ2tdUQ2hGmH/paF8=
X-Google-Smtp-Source: ABdhPJyVIw6SVmiq3WI5qngdLxC92RrnJRlOL0GrsLzn63Wu4pYUqK0N2qUYOUfhiaSc4SzoEEdf8A==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr14201371oia.102.1637156114554;
        Wed, 17 Nov 2021 05:35:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bh12sm5126103oib.25.2021.11.17.05.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:35:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:35:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 05/12] watchdog: s3c2410: Make reset disable register
 optional
Message-ID: <20211117133512.GE2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-6-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-6-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:36PM +0200, Sam Protsenko wrote:
> On new Exynos chips (e.g. Exynos850 and Exynos9) the
> AUTOMATIC_WDT_RESET_DISABLE register was removed, and its value can be
> thought of as "always 0x0". Add correspondig quirk bit, so that the
> driver can omit accessing it if it's not present.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Aligned arguments with opening parentheses
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - Used quirks instead of callbacks for all added PMU registers
>   - Used BIT() macro
>   - Extracted splitting the s3c2410wdt_mask_and_disable_reset() function
>     to separate patch
>   - Extracted cleanup code to separate patch to minimize changes and
>     ease the review and porting
> 
>  drivers/watchdog/s3c2410_wdt.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0845c05034a1..2cc4923a98a5 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -59,10 +59,12 @@
>  #define QUIRK_HAS_PMU_CONFIG			(1 << 0)
>  #define QUIRK_HAS_RST_STAT			(1 << 1)
>  #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
> +#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
> -						 QUIRK_HAS_RST_STAT)
> +						 QUIRK_HAS_RST_STAT | \
> +						 QUIRK_HAS_PMU_AUTO_DISABLE)
>  
>  static bool nowayout	= WATCHDOG_NOWAYOUT;
>  static int tmr_margin;
> @@ -137,7 +139,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 20,
>  	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG,
> +		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> @@ -147,7 +149,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 9,
>  	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG,
> +		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> @@ -157,7 +159,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>  	.rst_stat_bit = 23,	/* A57 WDTRESET */
>  	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> -		  | QUIRK_HAS_WTCLRINT_REG,
> +		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
>  static const struct of_device_id s3c2410_wdt_match[] = {
> @@ -213,11 +215,13 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
>  	if (mask)
>  		val = mask_val;
>  
> -	ret = regmap_update_bits(wdt->pmureg,
> -			wdt->drv_data->disable_reg,
> -			mask_val, val);
> -	if (ret < 0)
> -		goto error;
> +	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
> +		ret = regmap_update_bits(wdt->pmureg,
> +					 wdt->drv_data->disable_reg, mask_val,
> +					 val);
> +		if (ret < 0)
> +			goto error;
> +	}
>  
>  	ret = regmap_update_bits(wdt->pmureg,
>  			wdt->drv_data->mask_reset_reg,
> -- 
> 2.30.2
> 
