Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1499545A765
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Nov 2021 17:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237948AbhKWQUX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Nov 2021 11:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbhKWQUW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Nov 2021 11:20:22 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BE4C06173E
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Nov 2021 08:17:14 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id p2so44780260uad.11
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Nov 2021 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3xyaSgl/R2rfASy0hLkRgTLZYF9qqzspj1P/qGTw/A=;
        b=oNdm32E82aeMR6zFfONUZcIkPdlDLw/vyd/R2pq1Yk6QkorOqZ/Jz/eRSWjxqifWxJ
         +9WntL2kIVAEK5wJ+abLKm6XhvZn95IhKRM3JgDDRHj0njmfdk9sAf10kICAAgv4AOVH
         /aUl8nqRzCwxsXTijOHQT5Sonkxf5TxzA1SJUWd4RKtQFVQHS6SEwWH2V3imNyXRAzh0
         d1FnhUd/xW4najAc4PAmqJXB5fB4VdtRu4VISP50Owus4BR8hf2t94YR6gRXgnOxD2Xs
         L6LsnXMZIe7yf+dhozrcw/YnzMsntI6ktmHAJaEqfjqUQNsM5Z7mBkyvxtoYoJkOOT2s
         qaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3xyaSgl/R2rfASy0hLkRgTLZYF9qqzspj1P/qGTw/A=;
        b=weBYtlV55UF/WZp1TywCEjhLB5UljK35XmieFladHntPFw6vcno8jE2WB3W4+3Bevj
         pJcTAwJNcgKhppuA+qNpBlogbly5OUefABPaHbQxz34h6duLYjh3OaQK986Vrp7Oq5k2
         839ynPFr5Q36L0h1Qg0XCnSDQmlMTikk4jDMAcBR7Bif5wUVHJNUzwnD/Ubuu+qYWRhq
         yctTcB2dM6M0iN2FaZ+gXxl9Gj/BrL1F5+tK6+bmWvBOVS8WPdKGor+kpX08C0964v7n
         CVfb+S/tIeTfGnUD5X1O3SXRqkd/zcN62CQ47IaBs6o5PgmE3uy82cuN0FeZuKDZgbSe
         eYIQ==
X-Gm-Message-State: AOAM531uPv1P3lYWcxXe9VliHf+8G6Z3JyMr002OxHs3U6St4kS0/uFq
        H7OX9BSai95eSA2keZ91OJqMu39EzbfRUWRRaXoY4w==
X-Google-Smtp-Source: ABdhPJzRJel79zkAH2Nq6bS6tK0ThDecQScTsE+/NjE9dR9ryBYLXHd0RvKYqHtW8CGBK34IBacQhZRfdrryobuRw2E=
X-Received: by 2002:a9f:2431:: with SMTP id 46mr10233049uaq.114.1637684233073;
 Tue, 23 Nov 2021 08:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
 <20211121165647.26706-10-semen.protsenko@linaro.org> <20211123160623.GB2326185@roeck-us.net>
In-Reply-To: <20211123160623.GB2326185@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 23 Nov 2021 18:17:01 +0200
Message-ID: <CAPLW+4mwhH5C6zSxWDboNucZPvt2c=F7Qaa9V_XJHbJzbFNL3w@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] watchdog: s3c2410: Cleanup PMU related code
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 23 Nov 2021 at 18:06, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sun, Nov 21, 2021 at 06:56:44PM +0200, Sam Protsenko wrote:
> > Now that PMU enablement code was extended for new Exynos SoCs, it
> > doesn't look very cohesive and consistent anymore. Do a bit of renaming,
> > grouping and style changes, to make it look good again. While at it, add
> > quirks documentation as well.
> >
> > No functional change, just a refactoring commit.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > Changes in v4:
> >   - Added R-b tag by Guenter Roeck
> >
> > Changes in v3:
> >   - Added quirks documentation
> >   - Added R-b tag by Krzysztof Kozlowski
> >
> > Changes in v2:
> >   - (none): it's a new patch
> >
> >  drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
> >  1 file changed, 58 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index ec341c876225..f211be8bf976 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -56,17 +56,51 @@
> >  #define EXYNOS5_RST_STAT_REG_OFFSET          0x0404
> >  #define EXYNOS5_WDT_DISABLE_REG_OFFSET               0x0408
> >  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET    0x040c
> > -#define QUIRK_HAS_PMU_CONFIG                 (1 << 0)
> > -#define QUIRK_HAS_RST_STAT                   (1 << 1)
> > -#define QUIRK_HAS_WTCLRINT_REG                       (1 << 2)
> > +
> > +/**
>
> 0-day complains:
>
> drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead
>
> It doesn't seem to like the idea of documented bit masks. Not really sure
> what to do here. I am inclined to ignore it, but I don't want to get flooded
> by 0-day complaints until I retire either. Any idea ?
>

Seems like 0-day thinks this kernel-doc comment is for the first
define only, and thus the comment has wrong format, or something like
that. I tried to follow the same style as GFP_KERNEL and others are
documented.

Anyway, if you don't like 0-day complaints, can you please just
replace kernel-doc comment (/**) with regular comment (/*), by
removing one asterisk in the patch? Or I can re-send the patch
correspondingly -- then just let me know.

> Guenter
>
> > + * Quirk flags for different Samsung watchdog IP-cores.
> > + *
> > + * This driver supports multiple Samsung SoCs, each of which might have
> > + * different set of registers and features supported. As watchdog block
> > + * sometimes requires modifying PMU registers for proper functioning, register
> > + * differences in both watchdog and PMU IP-cores should be accounted for. Quirk
> > + * flags described below serve the purpose of telling the driver about mentioned
> > + * SoC traits, and can be specified in driver data for each particular supported
> > + * device.
> > + *
> > + * %QUIRK_HAS_WTCLRINT_REG: Watchdog block has WTCLRINT register. It's used to
> > + * clear the interrupt once the interrupt service routine is complete. It's
> > + * write-only, writing any values to this register clears the interrupt, but
> > + * reading is not permitted.
> > + *
> > + * %QUIRK_HAS_PMU_MASK_RESET: PMU block has the register for disabling/enabling
> > + * WDT reset request. On old SoCs it's usually called MASK_WDT_RESET_REQUEST,
> > + * new SoCs have CLUSTERx_NONCPU_INT_EN register, which 'mask_bit' value is
> > + * inverted compared to the former one.
> > + *
> > + * %QUIRK_HAS_PMU_RST_STAT: PMU block has RST_STAT (reset status) register,
> > + * which contains bits indicating the reason for most recent CPU reset. If
> > + * present, driver will use this register to check if previous reboot was due to
> > + * watchdog timer reset.
> > + *
> > + * %QUIRK_HAS_PMU_AUTO_DISABLE: PMU block has AUTOMATIC_WDT_RESET_DISABLE
> > + * register. If 'mask_bit' bit is set, PMU will disable WDT reset when
> > + * corresponding processor is in reset state.
> > + *
> > + * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
> > + * with "watchdog counter enable" bit. That bit should be set to make watchdog
> > + * counter running.
> > + */
> > +#define QUIRK_HAS_WTCLRINT_REG                       (1 << 0)
> > +#define QUIRK_HAS_PMU_MASK_RESET             (1 << 1)
> > +#define QUIRK_HAS_PMU_RST_STAT                       (1 << 2)
> >  #define QUIRK_HAS_PMU_AUTO_DISABLE           (1 << 3)
> >  #define QUIRK_HAS_PMU_CNT_EN                 (1 << 4)
> >
> >  /* These quirks require that we have a PMU register map */
> > -#define QUIRKS_HAVE_PMUREG                   (QUIRK_HAS_PMU_CONFIG | \
> > -                                              QUIRK_HAS_RST_STAT | \
> > -                                              QUIRK_HAS_PMU_AUTO_DISABLE | \
> > -                                              QUIRK_HAS_PMU_CNT_EN)
> > +#define QUIRKS_HAVE_PMUREG \
> > +     (QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_RST_STAT | \
> > +      QUIRK_HAS_PMU_AUTO_DISABLE | QUIRK_HAS_PMU_CNT_EN)
> >
> >  static bool nowayout = WATCHDOG_NOWAYOUT;
> >  static int tmr_margin;
> > @@ -146,8 +180,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
> >       .mask_bit = 20,
> >       .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> >       .rst_stat_bit = 20,
> > -     .quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> > -               | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
> > +     .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> > +               QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
> >  };
> >
> >  static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> > @@ -156,8 +190,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> >       .mask_bit = 0,
> >       .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> >       .rst_stat_bit = 9,
> > -     .quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> > -               | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
> > +     .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> > +               QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
> >  };
> >
> >  static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> > @@ -166,8 +200,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> >       .mask_bit = 23,
> >       .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> >       .rst_stat_bit = 23,     /* A57 WDTRESET */
> > -     .quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
> > -               | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
> > +     .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> > +               QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
> >  };
> >
> >  static const struct of_device_id s3c2410_wdt_match[] = {
> > @@ -253,24 +287,24 @@ static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
> >       return ret;
> >  }
> >
> > -static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
> > +static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> >  {
> >       int ret;
> >
> >       if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
> > -             ret = s3c2410wdt_disable_wdt_reset(wdt, mask);
> > +             ret = s3c2410wdt_disable_wdt_reset(wdt, !en);
> >               if (ret < 0)
> >                       return ret;
> >       }
> >
> > -     if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG) {
> > -             ret = s3c2410wdt_mask_wdt_reset(wdt, mask);
> > +     if (wdt->drv_data->quirks & QUIRK_HAS_PMU_MASK_RESET) {
> > +             ret = s3c2410wdt_mask_wdt_reset(wdt, !en);
> >               if (ret < 0)
> >                       return ret;
> >       }
> >
> >       if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
> > -             ret = s3c2410wdt_enable_counter(wdt, !mask);
> > +             ret = s3c2410wdt_enable_counter(wdt, en);
> >               if (ret < 0)
> >                       return ret;
> >       }
> > @@ -531,7 +565,7 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
> >       unsigned int rst_stat;
> >       int ret;
> >
> > -     if (!(wdt->drv_data->quirks & QUIRK_HAS_RST_STAT))
> > +     if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_RST_STAT))
> >               return 0;
> >
> >       ret = regmap_read(wdt->pmureg, wdt->drv_data->rst_stat_reg, &rst_stat);
> > @@ -672,7 +706,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto err_cpufreq;
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> > +     ret = s3c2410wdt_enable(wdt, true);
> >       if (ret < 0)
> >               goto err_unregister;
> >
> > @@ -707,7 +741,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
> >       int ret;
> >       struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> > +     ret = s3c2410wdt_enable(wdt, false);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -724,8 +758,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
> >  {
> >       struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
> >
> > -     s3c2410wdt_mask_and_disable_reset(wdt, true);
> > -
> > +     s3c2410wdt_enable(wdt, false);
> >       s3c2410wdt_stop(&wdt->wdt_device);
> >  }
> >
> > @@ -740,7 +773,7 @@ static int s3c2410wdt_suspend(struct device *dev)
> >       wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
> >       wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> > +     ret = s3c2410wdt_enable(wdt, false);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -760,7 +793,7 @@ static int s3c2410wdt_resume(struct device *dev)
> >       writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
> >       writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
> >
> > -     ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> > +     ret = s3c2410wdt_enable(wdt, true);
> >       if (ret < 0)
> >               return ret;
> >
> > --
> > 2.30.2
> >
