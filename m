Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B5644096E
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Oct 2021 16:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhJ3OPC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Oct 2021 10:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhJ3OPB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Oct 2021 10:15:01 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A603BC061764
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 07:12:31 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id d128so5422153vkf.11
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kpQ4wcqWDco9KEWxIAvor31Yr5kfqXocG7YvRzlhiR8=;
        b=DaZwNt1WOaxYkoaqxrYpP8w5dVGsP+iXrZEmlyyBRcZJlqf/aTlVy+WX4FNXNpWgI/
         6QuTzMa1gJapN2AX3V9XsznBf5MlO5NsSh/X3aNINGiUDzV+eXT7V8Z4O1BjDDp2p/0v
         NxKglTS6IA3EYESKj2w45Ra+GP+6AbL8jRl+ZivlAczg4mr6+C06XAWXCr7sANZqitI+
         QSXcV+Ogiajmy3n1mSCn9JXLSi8vHShTJxZztKEMi+Jg21MNmRb6zZWCRGrLqcJ98yIz
         R6vUSnxGUUWdp7krp3JURfbpksp4peyqRwDbPJt/uuYJZL8K+bDAoc4uOeTthW8Veqs6
         OT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpQ4wcqWDco9KEWxIAvor31Yr5kfqXocG7YvRzlhiR8=;
        b=J5eLfQEJGBl6SQ/EjgJELwDjiwnOO3nGZLDg8fK8I8o4AUr+Yp0ZLTCj8jq10ui64q
         f5HVZvx0Vqonh0TWNqLylI8A9GoHbtjJ9zspKjIn0qwl8zohsrb+kIuqC5LVm6caaQYk
         wQe3xP3+fbS77+mggVotYRMi30FRNtVxpFJL+2eke/NSVMTjrGdI5iaG8dJel+JCZrl9
         R25EWhgQ6E0/x3+LKCAceqMd86NgK+qib6T7YMkt6q7A6DalYxDC651SkD6YDLiX1sDU
         J1Rmqxw+X2+X2iN1wo60nT4XSZaN9H4Y88LLKfAwxF2X7Wo97aQtSnNZ6lf3x5Z82V96
         5Onw==
X-Gm-Message-State: AOAM5331Smi6VQCpMIEtppcamSHguQl9rE+aV0xGWEZz6N43NGVSLPQV
        WhKOqTBTT+XgGK92MWWnTmUjWeYsmEXAS2we1AgD4lq8hY/0dH3h
X-Google-Smtp-Source: ABdhPJxe/kwW5iZXwvnOZ7nxHWFEiYg6SdeSZCqwpLBJXkvvw7fi7LIEvty1l0+agNc9xw8rdSpGzSLFV2zjpReMnjA=
X-Received: by 2002:a1f:7246:: with SMTP id n67mr18299671vkc.15.1635603150672;
 Sat, 30 Oct 2021 07:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-6-semen.protsenko@linaro.org> <76ca9492-3829-6d3b-580c-983bc8409b1f@canonical.com>
In-Reply-To: <76ca9492-3829-6d3b-580c-983bc8409b1f@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 30 Oct 2021 17:12:18 +0300
Message-ID: <CAPLW+4mxE7MGH3_=xJXC1bh2iDWRLXzTorc8N=jDqG-KHT3O=Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] watchdog: s3c2410: Introduce separate source clock
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 29 Oct 2021 at 11:18, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 28/10/2021 20:35, Sam Protsenko wrote:
> > Some Exynos chips (like Exynos850) have dedicated source clock. That
> > clock is provided from device tree as "watchdog_src" clock. In such
> > case, "watchdog" clock is just a peripheral clock used for register
> > interface. If "watchdog_src" is present, use its rate instead of
> > "watchdog" for all timer related calculations.
>
> Please explain what is this source clock and remove the reference to
> devicetree. Instead describe rather real HW. It's confusing now to have
> one clock called watchdog and one watchdog source.
>
> The source clock is the actual clock driving watchdog and it's counter,
> right? Then let's document it and rename the variables to match reality
> - one is pclk (or apb?) and second is counter or source?
>

Done, will be present in v2.

> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 33 +++++++++++++++++++++++++++------
> >  1 file changed, 27 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index a5ef7171a90e..bfc5872ca497 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -126,6 +126,8 @@ struct s3c2410_wdt_variant {
> >  struct s3c2410_wdt {
> >       struct device           *dev;
> >       struct clk              *clock;
> > +     struct clk              *clock_src;
> > +     unsigned long           freq_src;
> >       void __iomem            *reg_base;
> >       unsigned int            count;
> >       spinlock_t              lock;
> > @@ -213,10 +215,8 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
> >
> >  /* functions */
> >
> > -static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
> > +static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
> >  {
> > -     unsigned long freq = clk_get_rate(clock);
> > -
> >       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> >                                      / S3C2410_WTCON_MAXDIV);
> >  }
> > @@ -364,7 +364,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
> >                                   unsigned int timeout)
> >  {
> >       struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> > -     unsigned long freq = clk_get_rate(wdt->clock);
> > +     unsigned long freq = wdt->freq_src;
>
> This does not look good. You are using fixed frequency (from probe).
>

Ok, will avoid caching this value in v2.

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
> >   err_cpufreq:
> >       s3c2410wdt_cpufreq_deregister(wdt);
> >
> > + err_clk_src:
> > +     if (!IS_ERR(wdt->clock_src))
> > +             clk_disable_unprepare(wdt->clock_src);
>
> No. Errors in getting source clock should not be ignored, so you should
> never store here ERR. You could store NULL. If() is anyway not needed in
> both cases.
>
> You can simplify all this and take pclk twice if src clock is missing.
> Or assign src=pclk...
>

Hmm, I don't want to take the same clock twice. It'll increase its
refcount twice, which might be confusing in some cases. I guess I'll
rework it to be like this in v2:
  - add "has_src_clk" bool field to struct wdt
  - if "watchdog_src" is provided: set has_src_clk "true"
  - if "watchdog_src" is not provided: set has_src_clk "false"
(default BSS val) and assign src=pclk
  - only enable/disable src clock when has_src_clk is "true"

That simplifies clock using, fixes stored pointer value, and avoids
taking the clock twice, all at the same time. Hope that way is fine
with you.

> > +
> >   err_clk:
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
>
> Best regards,
> Krzysztof
