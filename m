Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71EF459114
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Nov 2021 16:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239037AbhKVPRy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Nov 2021 10:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238381AbhKVPRy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Nov 2021 10:17:54 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0506C061574
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Nov 2021 07:14:47 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id l24so37320309uak.2
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Nov 2021 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=poS5/ZkkPxvtzD22F0lVSI3r9e0b9RG+7VJETyoPoIg=;
        b=TywNwI4xVcUHaTxzzNsfna40gripLivuJ7MFTK83mECnSR4WEvMLG4GGh/WxqLhgSQ
         iVNbugZvKmwY34OT7zb+LLIevaJIMtjOXZbQLsVQEV72+tmu2G3E/x2v7aIrcu318Pnh
         LKurfoWikwicl+phNM17yy1abyVKwWOmz56eASAScq5NSXcZfZBkmDcT5MgqIofw0dA2
         knCYy+4qh1KV15oU/bG3fVjj3zwQY/ZZ3cNevac5AT+TzKwCBKYg1J2NOwpGK53yZmKk
         0Hj/314aubMIvQhOxEjydfa9oKJPmY20KcwEz/WGVLtg1aHKb2EZ4+9tpfDK7vSt9C1Q
         1tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=poS5/ZkkPxvtzD22F0lVSI3r9e0b9RG+7VJETyoPoIg=;
        b=0EvHyV43VxYJ+DdDPtamaoBgeHLYKMCN0XOxNJIODB3bJhKjBut+CIU4sOmVjP/n1z
         xTVtKy3+kG6QXq1/tKIcM4EaudH+YTgvUxv7o+gOHtRBoguY0F2BEPSy8ABbahcUcFFM
         Ts1Ny3k6vqskgsbc9esjUoDbwKAXbYEyg1PxqSKIRdZA6gi2JTkyVTSXYpxxv9HmnmJ3
         DGYh91Icryhk1wUHN2Vu0UH3iI48wkvybPVXjaAOp2xL2gee5qUu9GfY4ggUNZFQJWUl
         KbFlrFu9EBF7bn6FBxUA+88PMQ1PksoXFcId7Sj9iIGlIaoknEP6y+RuWPhOnfnxF3zW
         ImtQ==
X-Gm-Message-State: AOAM533ruyGOUIAqLtj3F5//NZ0a4/slgwsR35t1IrldrvOkMxB5WrGA
        m4V3FjxoqQGEWEnDD9TBGYzOy35YEF3Efs4xGo3Ipg==
X-Google-Smtp-Source: ABdhPJw1wNxRm9yPXD1GQ+f/A1NtWJ2Stf4A605YHIA5GbkNnFK9OsunsY4bFzRgCO2pMCIgmqkZo9kmM3qJVwwLmhY=
X-Received: by 2002:a05:6102:4192:: with SMTP id cd18mr132128250vsb.35.1637594086878;
 Mon, 22 Nov 2021 07:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20211121165647.26706-1-semen.protsenko@linaro.org> <20211121165647.26706-13-semen.protsenko@linaro.org>
In-Reply-To: <20211121165647.26706-13-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 22 Nov 2021 17:14:35 +0200
Message-ID: <CAPLW+4myd2JDEKmv+E1HsxK_yNaLC+iUWSo99+Lqujof3MGpCg@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] watchdog: s3c2410: Add Exynos850 support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 21 Nov 2021 at 18:57, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
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
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---

Hi Guenter,

I've resent the whole series, but I can see you already applied my
previous series to your watchdog-next branch. So this patch is the
only one that actually changed in the whole series (with fixes for
0-day warning).

> Changes in v4:
>   - Fixed build error when CONFIG_OF is disabled (found by 0-day):
>     added #ifdef CONFIG_OF guard in s3c2410_get_wdt_drv_data()
>   - Added R-b tag by Guenter Roeck
>
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
>  drivers/watchdog/s3c2410_wdt.c | 64 +++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 96aa5d9c6ed4..115a6fe7da57 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -56,6 +56,13 @@
>  #define EXYNOS5_RST_STAT_REG_OFFSET            0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET         0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET      0x040c
> +#define EXYNOS850_CLUSTER0_NONCPU_OUT          0x1220
> +#define EXYNOS850_CLUSTER0_NONCPU_INT_EN       0x1244
> +#define EXYNOS850_CLUSTER1_NONCPU_OUT          0x1620
> +#define EXYNOS850_CLUSTER1_NONCPU_INT_EN       0x1644
> +
> +#define EXYNOS850_CLUSTER0_WDTRESET_BIT                24
> +#define EXYNOS850_CLUSTER1_WDTRESET_BIT                23
>
>  /**
>   * Quirk flags for different Samsung watchdog IP-cores.
> @@ -205,6 +212,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>
> +static const struct s3c2410_wdt_variant drv_data_exynos850_cl0 = {
> +       .mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> +       .cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
> +       .cnt_en_bit = 7,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
> +       .mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT,
> +       .cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT,
> +       .cnt_en_bit = 7,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>         { .compatible = "samsung,s3c2410-wdt",
>           .data = &drv_data_s3c2410 },
> @@ -216,6 +247,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>           .data = &drv_data_exynos5420 },
>         { .compatible = "samsung,exynos7-wdt",
>           .data = &drv_data_exynos7 },
> +       { .compatible = "samsung,exynos850-wdt",
> +         .data = &drv_data_exynos850_cl0 },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -587,14 +620,40 @@ static inline const struct s3c2410_wdt_variant *
>  s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  {
>         const struct s3c2410_wdt_variant *variant;
> +       struct device *dev = &pdev->dev;
>
> -       variant = of_device_get_match_data(&pdev->dev);
> +       variant = of_device_get_match_data(dev);
>         if (!variant) {
>                 /* Device matched by platform_device_id */
>                 variant = (struct s3c2410_wdt_variant *)
>                            platform_get_device_id(pdev)->driver_data;
>         }
>
> +#ifdef CONFIG_OF
> +       /* Choose Exynos850 driver data w.r.t. cluster index */
> +       if (variant == &drv_data_exynos850_cl0) {
> +               u32 index;
> +               int err;
> +
> +               err = of_property_read_u32(dev->of_node,
> +                                          "samsung,cluster-index", &index);
> +               if (err) {
> +                       dev_err(dev, "failed to get cluster index\n");
> +                       return NULL;
> +               }
> +
> +               switch (index) {
> +               case 0:
> +                       return &drv_data_exynos850_cl0;
> +               case 1:
> +                       return &drv_data_exynos850_cl1;
> +               default:
> +                       dev_err(dev, "wrong cluster index: %u\n", index);
> +                       return NULL;
> +               }
> +       }
> +#endif
> +
>         return variant;
>  }
>
> @@ -615,6 +674,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>         wdt->wdt_device = s3c2410_wdd;
>
>         wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
> +       if (!wdt->drv_data)
> +               return -EINVAL;
> +
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
>                 wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
>                                                 "samsung,syscon-phandle");
> --
> 2.30.2
>
