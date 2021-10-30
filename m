Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2021D4408C2
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Oct 2021 14:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhJ3MmG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Oct 2021 08:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbhJ3MmG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Oct 2021 08:42:06 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5486DC061764
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 05:39:36 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id o64so5897825vke.5
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6BWVd5QSBtmNHqdFIHqNMkh8yS32RlgmgzQWHgLjOEU=;
        b=BIk7S5Jt5fOttx6WIIVZ4XVMO+4ht7jw3rzpyd4mZD3HIIQ4wH0lVisbqbM3rkraxb
         0adAQWNStbetUIcfOku+EpFTBMsVEmmcy1b9LG5yb4lIzUVuws6f42N8bAuDAEOC7inL
         3l1fPSPvos+CgQHtAk4yMbCtCoU5f/j9XEUBl26Y+IbRScrzjsbbz2ZLibAcUjddbHJ8
         qSA5y/wyG/2p/B2QiAr/LlnZCx4iyv2eSbFHQRrUuVxAg6rVKwsIUw3FOekNySMUFSdo
         /TDJprrbF8h9CDe5e3uE1dVq48gNGcS1MhON9R9tmo9dcDuXfS11SQtJdAL/Z35SjRtV
         RCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6BWVd5QSBtmNHqdFIHqNMkh8yS32RlgmgzQWHgLjOEU=;
        b=MYbEkmenhBZfu5sbSl1wWfhq9WJLB+0AYBOyfuXupTAyoh3PC9wWByrWz2J1a931r3
         u0nynNPpuJe5ZFmN8w8+uXxyQxqkhHc2mg9WVSCEsn+FZU2wUxn+Nhi68v8P7u+k206q
         vFL4LjW79G4UTHVe4y7DeVyLQ/C+Mpgo24THtDKuKeku9qkpklDYk7pyhipkd8i2Pq82
         U+CWoaeVwystdE8J/jgR4eAyENiOM20YPNnTrzJpR2X/6H49XhZ2ZyPxD3fNFdaVJaS1
         faewkG7PBpqV56oyRPTjJaCBSEwD+QCLct5yEavbuShBgH0nVDXJYQmtR9rV/5qsXEkZ
         dB6w==
X-Gm-Message-State: AOAM531DzkWBylfd2d4Y/2IUB1zoW8Y6MWvds3pua92sk0QfEm2O63Rd
        7oLOlO6uaqM6STSffc8TMPbNGA2N7yCzf26hNUgpMg==
X-Google-Smtp-Source: ABdhPJz6tsNOjN5h6qxnvEq0t7Wd/uAi4kksAnKEO7rGE848rRZEP/NXJiVLxio4ezKk5aHVO15OqAgSNrAeSen2Pq0=
X-Received: by 2002:a05:6122:da0:: with SMTP id bc32mr17945585vkb.4.1635597575199;
 Sat, 30 Oct 2021 05:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-6-semen.protsenko@linaro.org> <51128b74-de5d-1758-282b-1d4c5250a38d@roeck-us.net>
In-Reply-To: <51128b74-de5d-1758-282b-1d4c5250a38d@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 30 Oct 2021 15:39:23 +0300
Message-ID: <CAPLW+4mnAV0yHdYFtosYfS2jcAUa4qvScvmohBKvqTBHz-5CFQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] watchdog: s3c2410: Introduce separate source clock
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

On Fri, 29 Oct 2021 at 03:21, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/28/21 11:35 AM, Sam Protsenko wrote:
> > Some Exynos chips (like Exynos850) have dedicated source clock. That
> > clock is provided from device tree as "watchdog_src" clock. In such
> > case, "watchdog" clock is just a peripheral clock used for register
> > interface. If "watchdog_src" is present, use its rate instead of
> > "watchdog" for all timer related calculations.
> >
>
> If the "watchdog_src" clock is present, is "watchdog" clock still needed ?
> Please state that explicitly, since it is kind of unusual.
>

Done, I've reworded the commit message. Will send v2 soon, thanks.

> Guenter
>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >   drivers/watchdog/s3c2410_wdt.c | 33 +++++++++++++++++++++++++++------
> >   1 file changed, 27 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index a5ef7171a90e..bfc5872ca497 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -126,6 +126,8 @@ struct s3c2410_wdt_variant {
> >   struct s3c2410_wdt {
> >       struct device           *dev;
> >       struct clk              *clock;
> > +     struct clk              *clock_src;
> > +     unsigned long           freq_src;
> >       void __iomem            *reg_base;
> >       unsigned int            count;
> >       spinlock_t              lock;
> > @@ -213,10 +215,8 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
> >
> >   /* functions */
> >
> > -static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
> > +static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
> >   {
> > -     unsigned long freq = clk_get_rate(clock);
> > -
> >       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> >                                      / S3C2410_WTCON_MAXDIV);
> >   }
> > @@ -364,7 +364,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
> >                                   unsigned int timeout)
> >   {
> >       struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> > -     unsigned long freq = clk_get_rate(wdt->clock);
> > +     unsigned long freq = wdt->freq_src;
> >       unsigned int count;
> >       unsigned int divisor = 1;
> >       unsigned long wtcon;
> > @@ -627,13 +627,27 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > +     /* "watchdog_src" clock is optional; if it's not present -- just skip */
> > +     wdt->clock_src = devm_clk_get(dev, "watchdog_src");
> > +     if (!IS_ERR(wdt->clock_src)) {
> > +             ret = clk_prepare_enable(wdt->clock_src);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to enable source clock\n");
> > +                     ret = PTR_ERR(wdt->clock_src);
> > +                     goto err_clk;
> > +             }
> > +             wdt->freq_src = clk_get_rate(wdt->clock_src);
> > +     } else {
> > +             wdt->freq_src = clk_get_rate(wdt->clock);
> > +     }
> > +
> >       wdt->wdt_device.min_timeout = 1;
> > -     wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
> > +     wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->freq_src);
> >
> >       ret = s3c2410wdt_cpufreq_register(wdt);
> >       if (ret < 0) {
> >               dev_err(dev, "failed to register cpufreq\n");
> > -             goto err_clk;
> > +             goto err_clk_src;
> >       }
> >
> >       watchdog_set_drvdata(&wdt->wdt_device, wdt);
> > @@ -707,6 +721,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >    err_cpufreq:
> >       s3c2410wdt_cpufreq_deregister(wdt);
> >
> > + err_clk_src:
> > +     if (!IS_ERR(wdt->clock_src))
> > +             clk_disable_unprepare(wdt->clock_src);
> > +
> >    err_clk:
> >       clk_disable_unprepare(wdt->clock);
> >
> > @@ -727,6 +745,9 @@ static int s3c2410wdt_remove(struct platform_device *dev)
> >
> >       s3c2410wdt_cpufreq_deregister(wdt);
> >
> > +     if (!IS_ERR(wdt->clock_src))
> > +             clk_disable_unprepare(wdt->clock_src);
> > +
> >       clk_disable_unprepare(wdt->clock);
> >
> >       return 0;
> >
>
