Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678E9440448
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 22:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhJ2UrW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 16:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhJ2UrW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 16:47:22 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533E2C061570
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 13:44:53 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id e10so20426045uab.3
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 13:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=khwee+o4BIEXlURemAxOIdbb1MWFYFtT0vHvBw+Nksk=;
        b=fYHPHD1cpSxD1HuX6GBkp650+K5AQeXGHiyXjEqXajyjaNdVOFxAbt7T8l21wpClyT
         J9di4Hv7YTgnZOlpN+ge3ymXROyrvAYtful4TOmblnfCk2B+IIEkWDnz6VgcS9qa1l7L
         Dl9ReFkbVhSU9XPojwjYSjv3yjv/v6N8YlmivGXQ7bRXChw4p4Hgl7vZBrmB93+NT+T/
         dfZhvGyp2jhkBPbxdue5NLMG1+IsB0zMbQK5ymHqv4HkDbbK2Gy8PCPGATnCcTfslSIK
         0nAECJPlasKxAvdil6RETd4qYR+eq9EJdQRW74O8g+2KL5/pHVgpi5ZQtDT3TuQ4cJ7G
         oTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=khwee+o4BIEXlURemAxOIdbb1MWFYFtT0vHvBw+Nksk=;
        b=h/rsNUH9oE0qsMs4CTaeLvc5NZmAWsTW7uXmsy32RO6Ee56rkfr+9OBEwUlor63cZn
         qyBencEU9mY7utQDK4zOHg2QsJ4cbohAQDBxIk+CfGsPzwZWBQmK5ZbdNpvsmLBuWzUJ
         Zr07n8AMTq48bFGZIIW97VTYjHNE94eHeY+Sr2nJJ3hREi44lgVnrTnG7aMpzvAwylhu
         ieLTSFz4TGD+xBRQeKUyHKQ6DmPv6ZGqRDAQ+4kPk/qoQmzd0XmzGBdpPRkNAa8W2M3P
         s9lg2pCgBJO65XGN2L+L+c6fUs9BHZLDnTwXFE55T9oOom6abxLdpXE0RTiN5LweUO2I
         ttWA==
X-Gm-Message-State: AOAM530xxzZJynCNOTGd/U+ecsWL0zYKRaWdZmb4854m1g1K+03l1Uj9
        eqFZidcdUd4VV5u+F7kPAqRft7FL/6xzrE19njf18A==
X-Google-Smtp-Source: ABdhPJw3mDqd696wBkxMTGZ2S5RsKu9UN9jviWzgRv7mo5KIhIFNWcJZjahUk6mPGJocTM+tXQPlbXOHE/f6tlVxbjg=
X-Received: by 2002:a67:1781:: with SMTP id 123mr15453627vsx.1.1635540292507;
 Fri, 29 Oct 2021 13:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-5-semen.protsenko@linaro.org> <e69282af-738b-e56e-026a-1e3adcec6a51@roeck-us.net>
In-Reply-To: <e69282af-738b-e56e-026a-1e3adcec6a51@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 29 Oct 2021 23:44:40 +0300
Message-ID: <CAPLW+4nn522iRbPViTybhN8=-pQBaQPCiAQAufzBHgnEMW3HmA@mail.gmail.com>
Subject: Re: [PATCH 4/7] watchdog: s3c2410: Add support for WDT counter enable
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
> > On new Exynos chips (like Exynos850) WDT counter must be enabled to make
> > WDT functional. It's done via CLUSTERx_NONCPU_OUT register, in
> > CNT_EN_WDT bit. Add infrastructure needed to enable that counter.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >   drivers/watchdog/s3c2410_wdt.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index 7c163a257d3c..a5ef7171a90e 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -97,12 +97,16 @@ struct s3c2410_wdt;
> >    * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
> >    * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
> >    * reset.
> > + * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
> > + * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
> >    * @quirks: A bitfield of quirks.
> >    * @disable_auto_reset: If set, this function will be called to disable
> >    * automatic setting the WDT as a reset reason in RST_STAT on CPU reset; uses
> >    * disable_reg field.
> >    * @mask_reset: If set, this function will be called to mask WDT reset request;
> >    * uses mask_reset_reg and mask_bit fields.
> > + * @enable_counter: If set, this function will be called to enable WDT counter;
> > + * uses cnt_en_reg and cnt_en_bit fields.
> >    */
> >
> >   struct s3c2410_wdt_variant {
> > @@ -111,9 +115,12 @@ struct s3c2410_wdt_variant {
> >       int mask_bit;
> >       int rst_stat_reg;
> >       int rst_stat_bit;
> > +     int cnt_en_reg;
> > +     int cnt_en_bit;
> >       u32 quirks;
> >       int (*disable_auto_reset)(struct s3c2410_wdt *wdt, bool mask);
> >       int (*mask_reset)(struct s3c2410_wdt *wdt, bool mask);
> > +     int (*enable_counter)(struct s3c2410_wdt *wdt, bool mask);
>
> Unless there are different enable functions in the future,
> the function is unnecessary. This can be handled as feature bit.
>

Thanks for review. I've reworked all patches to use quirk bits instead
of callbacks. Will send v2 soon.

> >   };
> >
> >   struct s3c2410_wdt {
> > @@ -132,6 +139,7 @@ struct s3c2410_wdt {
> >
> >   static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> >   static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> > +static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en);
> >
> >   static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
> >       .quirks = 0
> > @@ -246,6 +254,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> >       return ret;
> >   }
> >
> > +static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
> > +{
> > +     const u32 mask_val = 1 << wdt->drv_data->cnt_en_bit;
>
> BIT()
>
> > +     const u32 val = en ? mask_val : 0;
> > +     int ret;
> > +
> > +     ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
> > +                              mask_val, val);
> > +     if (ret < 0)
> > +             dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
> > +
> > +     return ret;
> > +}
> > +
> >   static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> >   {
> >       int ret;
> > @@ -262,6 +284,12 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> >                       return ret;
> >       }
> >
> > +     if (wdt->drv_data->enable_counter) {
> > +             ret = wdt->drv_data->enable_counter(wdt, en);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> >       return 0;
> >   }
> >
> >
>
