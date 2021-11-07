Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BF9447398
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 16:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbhKGP6w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 10:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbhKGP6v (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 10:58:51 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B486AC061764
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 07:56:08 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id s13so11329153uaj.11
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 07:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dUrUhWqyLP8WM0V+cyk5RPHoq6Vsv356iF7D4jd0LU=;
        b=xNk/aFt0nlcqfGZxa8z1NMcoEYaLROEd+q1T/FZqP8iBh8+WMl8V3jM5fojORNqxhu
         1pgnYN4goukUI4a/FSQjo7BeC9x2RWrbj1JB86Lb2QHVKBYLfF3K/YnkzDX8zJjtrVi0
         CcUwiQ6E+cwI05POa6Qs3OFBoktCVX50dFqFjcmiJ52vilzQclJTC8+D4ipjkWDtLmIb
         4k3G8v+O+3HidI58DG5Fh3DWeVimo/9fZeLg/er4lO0LL8VN+4H/mlTCXsYXbAb7PQJ4
         bq/5tPTwc5ErPhCwK0kMMUunr2XNBZgVwJBUK7WoqbFEE8Tb2MFuS0Fn7/gSyqUseAKh
         smpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dUrUhWqyLP8WM0V+cyk5RPHoq6Vsv356iF7D4jd0LU=;
        b=ySATfN+pqrjWQMFBs6SoIJnILzoIZByH8beCIAKVajiHEat25Sq+pk1+UI+qxUISh7
         FDlXsSYu1U7OAJvqhSvlHsn1db91lBW6BewVwo1D69QlQKvct8QOfJNQlhBEJcHDlBy4
         xr+pDdeQe48ko4/xVQCLoSvVbnnk2ECmfbDjKA3+3XCdYADZQzd8TFqGmlliMeL8GdpW
         X6glHIyU2rwzWkPmBkipLyBftqNJYIghqrfsWOremhA+E9f0XrD4In9J17bm4MglwIYH
         5mjGX2zEjKH/vP9IGmUYneAhg0f/vnth5MLGqEntpjb/urerZIpnQ/EsbAGuIFGmi45k
         78nQ==
X-Gm-Message-State: AOAM532/5B7NCzNqiJxpPpVELMzxdpp5ihFEaTWXsv6wXWMKS9LR2vRS
        BGykY3NxPrWnEwwJ265v8Bxc69p/YpWLgFP0WEgMtA==
X-Google-Smtp-Source: ABdhPJzo5QcHxd8IjUSEcK55pKPecD8oqKbgP6kh4igUzaB6PKwet/IuC8W9IKNKc8TprL33kRlD8HcGyWbv2oRRvos=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr93028958vsh.30.1636300567660;
 Sun, 07 Nov 2021 07:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-11-semen.protsenko@linaro.org> <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
In-Reply-To: <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 7 Nov 2021 17:55:55 +0200
Message-ID: <CAPLW+4mhD+k03S1cR-AdNk4etPiK=wsCoR4+o39gDe==XdoY8w@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
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

On Tue, 2 Nov 2021 at 12:15, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 31/10/2021 13:22, Sam Protsenko wrote:
> > Right now all devices supported in the driver have the single clock: it
> > acts simultaneously as a bus clock (providing register interface
> > clocking) and source clock (driving watchdog counter). Some newer Exynos
> > chips, like Exynos850, have two separate clocks for that. In that case
> > two clocks will be passed to the driver from the resource provider, e.g.
> > Device Tree. Provide necessary infrastructure to support that case:
> >   - use source clock's rate for all timer related calculations
> >   - use bus clock to gate/ungate the register interface
> >
> > All devices that use the single clock are kept intact: if only one clock
> > is passed from Device Tree, it will be used for both purposes as before.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >   - Reworded commit message to be more formal
> >   - Used separate "has_src_clk" trait to tell if source clock is present
> >   - Renamed clock variables to match their purpose
> >   - Removed caching source clock rate, obtaining it in place each time instead
> >   - Renamed err labels for more consistency
> >
> >  drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index fdb1a1e9bd04..c733917c5470 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
> >
> >  struct s3c2410_wdt {
> >       struct device           *dev;
> > -     struct clk              *clock;
> > +     struct clk              *bus_clk; /* for register interface (PCLK) */
> > +     struct clk              *src_clk; /* for WDT counter */
> > +     bool                    has_src_clk;
>
> Why do you need the has_src_clk value? If clk_get() fails, just store
> there NULL and clk API will handle it.
>

I've added that 'has_src_clk' field for somewhat different reason.

1. As we discussed earlier, in case when src_clk is not present, I do
'src_clk = bus_clk' in v2. This way I don't have to check if src_clk
is NULL every time and use bus_clk to get rate. If I set src_clk =
NULL, I'll have to add selector code, which wouldn't be so elegant,
and contradicts what we've discussed.
2. On the other hand, I don't want to enable bus_clk twice in case
when src_clk is not present, that just doesn't feel right (user would
see incorrect refcount value in DebugFS, etc). And if "clk_src =
bus_clk', and I haven't enabled it second time, then I shouldn't try
to disable it second time, right?

The only way I can see to accomplish (1) and (2) together, is to use
that 'has_src_clk' flag. For me it still looks better than enabling
bus_clk twice, or checking if clk_src is NULL every time we need to
get clock rate. Please let me know if you still have a strong opinion
on this one.

> Best regards,
> Krzysztof
