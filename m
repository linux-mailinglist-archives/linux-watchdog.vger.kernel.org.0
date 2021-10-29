Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F6644030E
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 21:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhJ2T0W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 15:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2T0V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 15:26:21 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F368EC061714
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 12:23:52 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id v3so19958294uam.10
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EkiIsmNvZJCnsv/Q3CrXNMfSBQ+jZnjjk3DHLmC31KA=;
        b=w+2lZXlomimzxiJggD5BOx3968TbKGRsxAxBh+ijDhza4ym/asZD46MmE/uotG9FXo
         usXJlT8eIyMEtdz13HUeHVJ+QEO1x+XUKNpm+B0amcHxBUKkDKKeRZ3/7RuA8vV0uuim
         IVTMSXMW7etRvLFAtcQQi3C9g9rXmQTzW9E2+0xjcb5FRxwlOHYfdNP4Lf/6pzJu6nUa
         XvRygmgMqP+/vwBdudYD0CBO+GX7OMPgPivcJ7G0AZ3EVt++TzzhcCQ74yVV5UbKRFTN
         63YrjSdbBTzRsyZNJXMi4waWZBAooMnWv1/IPKuFBJVzWgx8z5+hozXkQlkZMzAC4nzc
         oMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EkiIsmNvZJCnsv/Q3CrXNMfSBQ+jZnjjk3DHLmC31KA=;
        b=jUD0pD32QbY0RcgSNAuTzCdhFNQm1l5mIvZXJNC/HI4WzaOUoexzh8Zo+KTIM+lJvM
         OVFWCftxcd5yrtqz7S4noL/tqmZWaDiE+r717Q3JJYG2wq6NT/PUOZ9C0h+ZdUUjyVBc
         tEMIzKocF7UrBBLCQLI/+EFUDYSnhUuROSzidH5PLIfLpJCK5pEWcm4HT6JDoFO8S0zX
         wovrfv49bZAZJo+zBD41vou3iVmlIysf8yYd+nTVingq5R8mQjYp4chuCFrHOjL+aYzw
         9xhxRIIHu45zbj0RfeAIi70hV4XEA8pOdb1R3tYWP4zsk7uhj55lPCXm4/jeCnJAtllr
         xOtA==
X-Gm-Message-State: AOAM5303cPVQwxfocp90bkA1EexOb/DE9AJ0womwqVbfgSE8xR/FLmTa
        i0E+rhJsxYwAT6xLj5zRq9oZRxxDJRNF/ilw1omtWA==
X-Google-Smtp-Source: ABdhPJwkG3i15KQWlLjtNkP1kmVbj44Jza/56zTBehqD3V98+Js0vFMNXaFWEaZAag4sUOqXZTwgBhydr/km74bkL0c=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr15237251vsh.30.1635535431934;
 Fri, 29 Oct 2021 12:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-4-semen.protsenko@linaro.org> <b9c33def-6b12-1e5a-4449-b1e0869a0e3a@roeck-us.net>
In-Reply-To: <b9c33def-6b12-1e5a-4449-b1e0869a0e3a@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 29 Oct 2021 22:23:39 +0300
Message-ID: <CAPLW+4nToQ7+sQxZjswKtY-b-7=KeHCfyz5RPKT9iaEhnOsNow@mail.gmail.com>
Subject: Re: [PATCH 3/7] watchdog: s3c2410: Make reset disable optional
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 29 Oct 2021 at 03:16, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/28/21 11:35 AM, Sam Protsenko wrote:
> > Not all SoCs have AUTOMATIC_WDT_RESET_DISABLE register, examples are
> > Exynos850 and Exynos9. On such chips reset disable register shouldn't be
> > accessed. Provide a way to avoid handling that register. This is done by
> > introducing separate callbacks to driver data structure: one for reset
> > disable register, and one for mask reset register. Now those callbacks
> > can be checked and called only when those were set in driver data.
> >
> > This commit doesn't bring any functional change to existing devices, but
> > merely provides an infrastructure for upcoming chips support.
> >
>
> That doesn't explain why the callbacks are needed instead of additional
> feature flags.
>

Ok, I'll rework this patch using quirks, don't have a strong
preference on this one. That's actually how I did that on my first
attempt. Guess I just like "callbacks way" more, matter of taste :)
But we already have quirks for that, so yeah, probably makes sense to
use those for consistency.

> Guenter
>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >   drivers/watchdog/s3c2410_wdt.c | 81 ++++++++++++++++++++++++----------
> >   1 file changed, 58 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index 2395f353e52d..7c163a257d3c 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -83,6 +83,8 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> >                       __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> >   MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to reboot (default 0)");
> >
> > +struct s3c2410_wdt;
> > +
> >   /**
> >    * struct s3c2410_wdt_variant - Per-variant config data
> >    *
> > @@ -96,6 +98,11 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
> >    * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
> >    * reset.
> >    * @quirks: A bitfield of quirks.
> > + * @disable_auto_reset: If set, this function will be called to disable
> > + * automatic setting the WDT as a reset reason in RST_STAT on CPU reset; uses
> > + * disable_reg field.
> > + * @mask_reset: If set, this function will be called to mask WDT reset request;
> > + * uses mask_reset_reg and mask_bit fields.
> >    */
> >
> >   struct s3c2410_wdt_variant {
> > @@ -105,6 +112,8 @@ struct s3c2410_wdt_variant {
> >       int rst_stat_reg;
> >       int rst_stat_bit;
> >       u32 quirks;
> > +     int (*disable_auto_reset)(struct s3c2410_wdt *wdt, bool mask);
> > +     int (*mask_reset)(struct s3c2410_wdt *wdt, bool mask);
> >   };
> >
> >   struct s3c2410_wdt {
> > @@ -121,6 +130,9 @@ struct s3c2410_wdt {
> >       struct regmap *pmureg;
> >   };
> >
> > +static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> > +static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> > +
> >   static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
> >       .quirks = 0
> >   };
> > @@ -138,6 +150,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
> >       .rst_stat_bit = 20,
> >       .quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> >                 | QUIRK_HAS_WTCLRINT_REG,
> > +     .disable_auto_reset = s3c2410wdt_disable_wdt_reset,
> > +     .mask_reset = s3c2410wdt_mask_wdt_reset,
> >   };
> >
> >   static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> > @@ -148,6 +162,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> >       .rst_stat_bit = 9,
> >       .quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> >                 | QUIRK_HAS_WTCLRINT_REG,
> > +     .disable_auto_reset = s3c2410wdt_disable_wdt_reset,
> > +     .mask_reset = s3c2410wdt_mask_wdt_reset,
> >   };
> >
> >   static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> > @@ -158,6 +174,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> >       .rst_stat_bit = 23,     /* A57 WDTRESET */
> >       .quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> >                 | QUIRK_HAS_WTCLRINT_REG,
> > +     .disable_auto_reset = s3c2410wdt_disable_wdt_reset,
> > +     .mask_reset = s3c2410wdt_mask_wdt_reset,
> >   };
> >
> >   static const struct of_device_id s3c2410_wdt_match[] = {
> > @@ -200,35 +218,53 @@ static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
> >       return container_of(nb, struct s3c2410_wdt, freq_transition);
> >   }
> >
> > -static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
> > +static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> >   {
> > +     const u32 mask_val = 1 << wdt->drv_data->mask_bit;
> > +     const u32 val = mask ? mask_val : 0;
> >       int ret;
> > -     u32 mask_val = 1 << wdt->drv_data->mask_bit;
> > -     u32 val = 0;
> >
> > -     /* No need to do anything if no PMU CONFIG needed */
> > -     if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG))
> > -             return 0;
> > +     ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->disable_reg,
> > +                              mask_val, val);
> > +     if (ret < 0)
> > +             dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
> >
> > -     if (mask)
> > -             val = mask_val;
> > +     return ret;
> > +}
> >
> > -     ret = regmap_update_bits(wdt->pmureg,
> > -                     wdt->drv_data->disable_reg,
> > -                     mask_val, val);
> > -     if (ret < 0)
> > -             goto error;
> > +static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> > +{
> > +     const u32 mask_val = 1 << wdt->drv_data->mask_bit;
> > +     const u32 val = mask ? mask_val : 0;
> > +     int ret;
> >
> > -     ret = regmap_update_bits(wdt->pmureg,
> > -                     wdt->drv_data->mask_reset_reg,
> > -                     mask_val, val);
> > - error:
> > +     ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
> > +                              mask_val, val);
> >       if (ret < 0)
> >               dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
> >
> >       return ret;
> >   }
> >
> > +static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> > +{
> > +     int ret;
> > +
> > +     if (wdt->drv_data->disable_auto_reset) {
> > +             ret = wdt->drv_data->disable_auto_reset(wdt, !en);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     if (wdt->drv_data->mask_reset) {
> > +             ret = wdt->drv_data->mask_reset(wdt, !en);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
> >   {
> >       struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> > @@ -609,7 +645,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto err_cpufreq;
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> > +     ret = s3c2410wdt_enable(wdt, true);
> >       if (ret < 0)
> >               goto err_unregister;
> >
> > @@ -655,7 +691,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
> >       int ret;
> >       struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> > +     ret = s3c2410wdt_enable(wdt, false);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -672,8 +708,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
> >   {
> >       struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
> >
> > -     s3c2410wdt_mask_and_disable_reset(wdt, true);
> > -
> > +     s3c2410wdt_enable(wdt, false);
> >       s3c2410wdt_stop(&wdt->wdt_device);
> >   }
> >
> > @@ -688,7 +723,7 @@ static int s3c2410wdt_suspend(struct device *dev)
> >       wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
> >       wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> > +     ret = s3c2410wdt_enable(wdt, false);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -708,7 +743,7 @@ static int s3c2410wdt_resume(struct device *dev)
> >       writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
> >       writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> > +     ret = s3c2410wdt_enable(wdt, true);
> >       if (ret < 0)
> >               return ret;
> >
> >
>
