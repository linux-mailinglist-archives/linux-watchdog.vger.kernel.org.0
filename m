Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9D44473B3
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 17:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhKGQU0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 11:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbhKGQU0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 11:20:26 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448F5C061764
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 08:17:43 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id l43so26953741uad.4
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 08:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t7xMZVtk+GkT0Ad4djTgQGpUumW4/C6aQ//HAOY+M7k=;
        b=qrkjoAs/fBxtAbYnZ//tjZPnT865qxaXGGjpBa7hi1+l9eLVjSIWrRmjwdU/2DcuaB
         q1YPZQ2oFH9noFXS+zwtLwvw2axnbvQX6qvnJZEKI9dyBnavLeCiHcjw8GoQaXDLZ6ko
         9/wD3aeoF8dYn8I3uKK2ujmCWzan2rnu691QND6pGPy3D6sotevEesRcDz0nxubKRi9D
         +7PHD5XDQtKCGyaWHzarny+eELcTJ30JcDhmVu/bLlDouLtMXa6tqhJ8M+cA5ejVqkqV
         gp+S5w1xNbvpL771+OZJSI6uj2gzJ8wGvjZEOvyqUOj8Pk2AKGviDFGkDBo3KSt3EYR3
         HluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t7xMZVtk+GkT0Ad4djTgQGpUumW4/C6aQ//HAOY+M7k=;
        b=Jea38Mi2jrpO6XZRK3qj/kKuRJqXN7jDMhdDFV3E2GMwYsEpIGr+3x4+ArH44nf8AS
         dyb6ivyoFksnQlani7GDAh+UDEYw+JnUP8u15escTST0ojfNDKg60t4A/7Tc12Rq3A63
         Ga+NjdKsUr45B8JivqcDdNgbLbAdxpa90Udw8a384p2cvcW4kQT/qxbZm+sMRvUVvyVy
         28ErdX1t8qxSHC2iSSp5uJ0pO+HYinCHM9zx12WetfuPiffO5HLp3v3IjzREfeeoNswW
         e7uk+nNI01R+KGQKlgnBWMNbIRF/4Ly4O8DTDFKW6aeHjGb/ZL8zHujhCniVWDmwli/f
         HXsQ==
X-Gm-Message-State: AOAM531nmGu5Rmp/yULR59yQ4AVM1Rq0n4Bo/6m+Mhq6aqR6Xa6tQcg5
        UtAUrsn7XWD0xhZuBcYJT1hHNYvFC7DPAR4cXP1wafZ4Qs9L6g==
X-Google-Smtp-Source: ABdhPJx9na6KgzgTa2a6Fl9rs1m4BaQVX93gFlqN9bcazVXIDAqBdVq9aYvXAF1znhsfu3tBctfOm+DOY0FYNuYX+Us=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr93223469vsh.30.1636301861809;
 Sun, 07 Nov 2021 08:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-13-semen.protsenko@linaro.org> <02e4cd1f-47bf-9bc7-b46c-b6c30943c0b7@canonical.com>
In-Reply-To: <02e4cd1f-47bf-9bc7-b46c-b6c30943c0b7@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 7 Nov 2021 18:17:29 +0200
Message-ID: <CAPLW+4=HZytu3Cxsea_HjrR2FzAVd0uEVZvqp9pT4xB=WqhKUQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] watchdog: s3c2410: Add Exynos850 support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 2 Nov 2021 at 12:27, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 31/10/2021 13:22, Sam Protsenko wrote:
> > Exynos850 is a bit different from SoCs already supported in WDT driver:
> >   - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
> >     always 0; .disable_auto_reset callback is not set for that reason
> >   - MASK_WDT_RESET_REQUEST register is replaced with
> >     CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
> >     reset interrupt it's now enabled with the same value; .mask_reset
> >     callback is reused for that functionality though
> >   - To make WDT functional, WDT counter needs to be enabled in
> >     CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
> >     callback
> >
> > Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> > instance. Different PMU registers and bits are used for each cluster. So
> > driver data is now modified in probe, adding needed info depending on
> > cluster index passed from device tree.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >   - Used single compatible for Exynos850, populating missing driver data in
> >     probe
> >   - Added "index" property to specify CPU cluster index
> >
> >  drivers/watchdog/s3c2410_wdt.c | 68 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 66 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index 8fdda2ede1c3..457b725c30ac 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -56,6 +56,14 @@
> >  #define EXYNOS5_RST_STAT_REG_OFFSET          0x0404
> >  #define EXYNOS5_WDT_DISABLE_REG_OFFSET               0x0408
> >  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET    0x040c
> > +#define EXYNOS850_CLUSTER0_NONCPU_OUT                0x1220
> > +#define EXYNOS850_CLUSTER0_NONCPU_INT_EN     0x1244
> > +#define EXYNOS850_CLUSTER1_NONCPU_OUT                0x1620
> > +#define EXYNOS850_CLUSTER1_NONCPU_INT_EN     0x1644
> > +
> > +#define EXYNOS850_CLUSTER0_WDTRESET_BIT              24
> > +#define EXYNOS850_CLUSTER1_WDTRESET_BIT              23
> > +
> >  #define QUIRK_HAS_WTCLRINT_REG                       (1 << 0)
> >  #define QUIRK_HAS_PMU_MASK_RESET             (1 << 1)
> >  #define QUIRK_HAS_PMU_RST_STAT                       (1 << 2)
> > @@ -171,6 +179,21 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> >                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
> >  };
> >
> > +static const struct s3c2410_wdt_variant drv_data_exynos850 = {
> > +     /*
> > +      * Next fields will be set in probe(), based on cluster index:
> > +      *   - .mask_reset_reg
> > +      *   - .rst_stat_bit
> > +      *   - .cnt_en_reg
> > +      */
> > +     .mask_reset_inv = true,
> > +     .mask_bit = 2,
> > +     .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> > +     .cnt_en_bit = 7,
> > +     .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> > +               QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> > +};
> > +
> >  static const struct of_device_id s3c2410_wdt_match[] = {
> >       { .compatible = "samsung,s3c2410-wdt",
> >         .data = &drv_data_s3c2410 },
> > @@ -182,6 +205,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
> >         .data = &drv_data_exynos5420 },
> >       { .compatible = "samsung,exynos7-wdt",
> >         .data = &drv_data_exynos7 },
> > +     { .compatible = "samsung,exynos850-wdt",
> > +       .data = &drv_data_exynos850 },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> > @@ -548,15 +573,51 @@ static inline const struct s3c2410_wdt_variant *
> >  s3c2410_get_wdt_drv_data(struct platform_device *pdev)
> >  {
> >       const struct s3c2410_wdt_variant *variant;
> > +     struct s3c2410_wdt_variant *data;
> > +     struct device *dev = &pdev->dev;
> >
> > -     variant = of_device_get_match_data(&pdev->dev);
> > +     variant = of_device_get_match_data(dev);
> >       if (!variant) {
> >               /* Device matched by platform_device_id */
> >               variant = (struct s3c2410_wdt_variant *)
> >                          platform_get_device_id(pdev)->driver_data;
> >       }
> >
> > -     return variant;
> > +     /* Have to copy driver data over to keep its const qualifier intact */
> > +     data = devm_kmemdup(dev, variant, sizeof(*variant), GFP_KERNEL);
> > +     if (!data)
> > +             return NULL;
> > +
> > +     /* Populate missing fields for Exynos850 w.r.t. cluster index */
> > +     if (variant == &drv_data_exynos850) {
> > +             u32 index;
> > +             int err;
>
> Another approach is to:
> 1. Define two variants for Exynos850 (s3c2410_wdt_variants), kind of
> like before,
> 2. if (variant == &drv_data_exynos850)
> a. Read the index
> b. If index is 0, return first variant,
> c. If index is 1, return the second variant,
> d. Else - NULL.
>
> This way you won't need to copy the memory on the fly, just use
> different const data. Benefits: less memory allocations, entire drvdata
> set in one place (so nicely visible), drvdata populated safely via const.
>

That's definitely better. Not sure how I missed that. Anyway, thanks
for review. Will send v3 soon, addressing all your comments (except
the one about src_clk in PATCH 10/12 -- need to discuss it further, I
guess).

> > +
> > +             err = of_property_read_u32(dev->of_node, "samsung,index",
> > +                                        &index);
> > +             if (err) {
> > +                     dev_err(dev, "failed to get cluster index\n");
> > +                     return NULL;
> > +             }
> > +
> > +             switch (index) {
> > +             case 0:
> > +                     data->mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN;
> > +                     data->rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT;
> > +                     data->cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT;
> > +                     break;
> > +             case 1:
> > +                     data->mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN;
> > +                     data->rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT;
> > +                     data->cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT;
> > +                     break;
> > +             default:
> > +                     dev_err(dev, "wrong cluster index: %u\n", index);
> > +                     return NULL;
> > +             }
> > +     }
> > +
> > +     return data;
> >  }
> >
> >  static int s3c2410wdt_probe(struct platform_device *pdev)
> > @@ -576,6 +637,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >       wdt->wdt_device = s3c2410_wdd;
> >
> >       wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
> > +     if (!wdt->drv_data)
> > +             return -EINVAL;
> > +
> >       if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> >               wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
> >                                               "samsung,syscon-phandle");
> >
>
>
> Best regards,
> Krzysztof
