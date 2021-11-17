Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A348454781
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhKQNjR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhKQNjQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:39:16 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7FDC061570;
        Wed, 17 Nov 2021 05:36:18 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so4737889ote.8;
        Wed, 17 Nov 2021 05:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2IBhExtYp4Hy42e0i22Xd5NGarh7C+0z6BdvYwRWta8=;
        b=GddbRakSRfUBAqmcZXaPz45lqLOOWAWRxBb9zcM0tIJ43nWuIL0OWh5XvRx36A8FjI
         h7b2oBuDDBVRQjUV+FRv7U6xi0+lgBztHz4wD52qe15FFV+JhdgoJxNhT+L83iZBhAKO
         xzLLO8piz7Nprb7sWWCrfRGvqJDSLHSrGgCNDABIcP8fpvOCgh44PgTg+XnZxV6TpaCE
         yDgAR5Iay3VJ36jAS7jhfgsJcTvkcry2HzeBOgBQgRZIqF6oF1RZLr4LBRXwZvuqwBBL
         ACVBKGhV1S9fq6El22WhinQopo87e8Yw+z2Y8JX5T/wexfhjFRBKo0qaT50dlo8THmvZ
         d11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2IBhExtYp4Hy42e0i22Xd5NGarh7C+0z6BdvYwRWta8=;
        b=qv/fHOCx2yT62G0AmZjG9zUVDOyZL5DlE6Dopn2RoZFjn3QxUhQg1rimSYEPmbxx0p
         B350HWfz8LtWxnUvueiJ52HLJoi5XykApyHLQuLj4spWf4+bbuE475f+9ywzbewzVu6L
         rFnUtZe0hPqM3ZuiKk1kLDKuRypbLBZlhW69EatVs67WxkbUWq4/tkmRSYDI7GERiLJh
         ufzM6flRnUHbO2seJqgIqj+ecYI4/qYl0N7t+zUBrNU25gE182cRswwAlskLurt2UPVM
         AoWpO/Cgot/WEkuFXcYh9huI8nfajvMIYxnbtiEeiKO7anO8Je+axqJI9kZbSG7eDejh
         7wOA==
X-Gm-Message-State: AOAM530Kg8QkMxCehlAFAIPljNlVZ9kMyHxV08/PwMw70ueRxV22I8E7
        Y5vqJGhAZ3p2vOp6q6Zameo=
X-Google-Smtp-Source: ABdhPJxRiUMF+aVlza1d2hdGQ3qOf+86z+flBTUO09O9TKSCAMqEkjNCKOy8ZW/4UxOqUAcwg/ihVg==
X-Received: by 2002:a9d:7f91:: with SMTP id t17mr13200074otp.197.1637156177589;
        Wed, 17 Nov 2021 05:36:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l9sm3691978oom.4.2021.11.17.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:36:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:36:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 08/12] watchdog: s3c2410: Add support for WDT counter
 enable register
Message-ID: <20211117133614.GH2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-9-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-9-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:39PM +0200, Sam Protsenko wrote:
> On new Exynos chips (e.g. Exynos850) new CLUSTERx_NONCPU_OUT register is
> introduced, where CNT_EN_WDT bit must be enabled to make watchdog
> counter running. Add corresponding quirk and proper infrastructure to
> handle that register if the quirk is set.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - Used quirks instead of callbacks for all added PMU registers
>   - Used BIT() macro
>   - Extracted cleanup code to separate patch to minimize changes and
>     ease the review and porting
> 
>  drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 2a61b6ea5602..ec341c876225 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -60,11 +60,13 @@
>  #define QUIRK_HAS_RST_STAT			(1 << 1)
>  #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
> +#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
>  						 QUIRK_HAS_RST_STAT | \
> -						 QUIRK_HAS_PMU_AUTO_DISABLE)
> +						 QUIRK_HAS_PMU_AUTO_DISABLE | \
> +						 QUIRK_HAS_PMU_CNT_EN)
>  
>  static bool nowayout	= WATCHDOG_NOWAYOUT;
>  static int tmr_margin;
> @@ -98,6 +100,8 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
>   * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
>   * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
>   * reset.
> + * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
> + * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
>   * @quirks: A bitfield of quirks.
>   */
>  
> @@ -108,6 +112,8 @@ struct s3c2410_wdt_variant {
>  	int mask_bit;
>  	int rst_stat_reg;
>  	int rst_stat_bit;
> +	int cnt_en_reg;
> +	int cnt_en_bit;
>  	u32 quirks;
>  };
>  
> @@ -233,6 +239,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
>  	return ret;
>  }
>  
> +static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
> +{
> +	const u32 mask_val = BIT(wdt->drv_data->cnt_en_bit);
> +	const u32 val = en ? mask_val : 0;
> +	int ret;
> +
> +	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
> +				 mask_val, val);
> +	if (ret < 0)
> +		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
> +
> +	return ret;
> +}
> +
>  static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
>  {
>  	int ret;
> @@ -249,6 +269,12 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
>  			return ret;
>  	}
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
> +		ret = s3c2410wdt_enable_counter(wdt, !mask);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 
