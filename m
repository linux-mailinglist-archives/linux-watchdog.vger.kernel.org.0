Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAB0447504
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 19:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbhKGSyf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 13:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbhKGSyf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 13:54:35 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABBCC061714
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 10:51:52 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id e10so27462118uab.3
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=unKo15JzTOTFaWesFvijrWxvCyjo4F82rqmN0Z0VB08=;
        b=EGPJwh6J+kr9X4pqliRLLDnvsjAufLqMhCfMsL1tt0vh0JjP0U6LeXXGxXUR1nT+Lr
         UdKRhGMej2TR+7cOfQZOO1tqUltNVYuvxhmNuCdy2dn5t3+oP7bdKWjdYKBoqukscVSq
         1SRH8c8WthZYefrriBk4pEvVpWyEYZLhRCtvDqpakfsaRPlUrAUaNIFozbGbg5rFFDqO
         GJ2Z2XlUm6ar+AfzRnPLLriNS++hfmnFYE+ckuuUFyXx7pt/Xzn5Kv8Gg4wrQdFelLTV
         3UthEI6FLjqhudMLMzF9rH48gUycDFY7zTw8ZCPcyS/ghwnoabTeAQ+/zdHhTWh9KVLW
         vTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unKo15JzTOTFaWesFvijrWxvCyjo4F82rqmN0Z0VB08=;
        b=CbsMwYMOx1kif9+KRbFlEnFrbyy2KXNZFXdRyByIqx9rFZDxORYfqLMaO2Ra/ocZhj
         IiBf4s+tdWOZkmP5ZlBoHU9JeHEua+jmB41EVSoDOYb4OXuxJPE9075SQ8umh3slYW0L
         8ZXXBbMRl7q5F4iuCF8AEzfUNx59qW7vMeuFxUklxocH6UuV1TN3TY/mBRyZ7/mCPsdT
         b07UTlq0vz4d/bjrDbWlj/CqLIeKH3Fit2UZRCC018/buaE+BhTvSEt9sNbaDoagscbN
         RWcunp4kGaWEJmknupgGeUFMbTo+Z/9TOcIjLvx96XDUB9W/d0ywYjFgOU9CCC6co982
         Wn5g==
X-Gm-Message-State: AOAM532Q3KpQD47Y+RksqWYhfwgSy1L1joaWoODcrgmBy0n6YpIZLHxl
        AkEZ6YwdEBEDnaIFaateb6QfHiHOEcTolLaeFKO16A==
X-Google-Smtp-Source: ABdhPJwqqi2DMaQIyZ7z2Ia6zXGDLQ21h1fqUJv0Ss86GFoLUFdkILfjNO5w/IJ3jA9aW5deaTVuJ2mwxgmTqs8YiBM=
X-Received: by 2002:ab0:6002:: with SMTP id j2mr69495801ual.9.1636311111532;
 Sun, 07 Nov 2021 10:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-11-semen.protsenko@linaro.org> <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
 <CAPLW+4mhD+k03S1cR-AdNk4etPiK=wsCoR4+o39gDe==XdoY8w@mail.gmail.com> <b65c74f3-0735-7b8b-888a-3b14aee55a4f@roeck-us.net>
In-Reply-To: <b65c74f3-0735-7b8b-888a-3b14aee55a4f@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 7 Nov 2021 20:51:39 +0200
Message-ID: <CAPLW+4=_dk50ESva1RwN3a9gtT2tJn2WT=m5C8Q9c1VTdemJxQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 7 Nov 2021 at 18:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/7/21 7:55 AM, Sam Protsenko wrote:
> > On Tue, 2 Nov 2021 at 12:15, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 31/10/2021 13:22, Sam Protsenko wrote:
> >>> Right now all devices supported in the driver have the single clock: it
> >>> acts simultaneously as a bus clock (providing register interface
> >>> clocking) and source clock (driving watchdog counter). Some newer Exynos
> >>> chips, like Exynos850, have two separate clocks for that. In that case
> >>> two clocks will be passed to the driver from the resource provider, e.g.
> >>> Device Tree. Provide necessary infrastructure to support that case:
> >>>    - use source clock's rate for all timer related calculations
> >>>    - use bus clock to gate/ungate the register interface
> >>>
> >>> All devices that use the single clock are kept intact: if only one clock
> >>> is passed from Device Tree, it will be used for both purposes as before.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>> Changes in v2:
> >>>    - Reworded commit message to be more formal
> >>>    - Used separate "has_src_clk" trait to tell if source clock is present
> >>>    - Renamed clock variables to match their purpose
> >>>    - Removed caching source clock rate, obtaining it in place each time instead
> >>>    - Renamed err labels for more consistency
> >>>
> >>>   drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
> >>>   1 file changed, 39 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> >>> index fdb1a1e9bd04..c733917c5470 100644
> >>> --- a/drivers/watchdog/s3c2410_wdt.c
> >>> +++ b/drivers/watchdog/s3c2410_wdt.c
> >>> @@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
> >>>
> >>>   struct s3c2410_wdt {
> >>>        struct device           *dev;
> >>> -     struct clk              *clock;
> >>> +     struct clk              *bus_clk; /* for register interface (PCLK) */
> >>> +     struct clk              *src_clk; /* for WDT counter */
> >>> +     bool                    has_src_clk;
> >>
> >> Why do you need the has_src_clk value? If clk_get() fails, just store
> >> there NULL and clk API will handle it.
> >>
> >
> > I've added that 'has_src_clk' field for somewhat different reason.
> >
> > 1. As we discussed earlier, in case when src_clk is not present, I do
> > 'src_clk = bus_clk' in v2. This way I don't have to check if src_clk
> > is NULL every time and use bus_clk to get rate. If I set src_clk =
> > NULL, I'll have to add selector code, which wouldn't be so elegant,
> > and contradicts what we've discussed.
> > 2. On the other hand, I don't want to enable bus_clk twice in case
> > when src_clk is not present, that just doesn't feel right (user would
> > see incorrect refcount value in DebugFS, etc). And if "clk_src =
> > bus_clk', and I haven't enabled it second time, then I shouldn't try
> > to disable it second time, right?
> >
> > The only way I can see to accomplish (1) and (2) together, is to use
> > that 'has_src_clk' flag. For me it still looks better than enabling
> > bus_clk twice, or checking if clk_src is NULL every time we need to
> > get clock rate. Please let me know if you still have a strong opinion
> > on this one.
> >
>
> This is odd. Why do you need to get the clock rate more than once,
> instead of getting it once and storing it locally ? If the clock rate
> can change, the watchdog timeout would be unpredictable.
>

For this particular driver it seems to be needed though. The driver
tracks CPU freq change and tries to adjust timeout w.r.t. new clock
frequency, as implemented in s3c2410wdt_cpufreq_*() functions. I don't
really want to touch that functionality in my series, my goal here is
to add Exynos850 support in the first place. But yeah, I did some
analysis, and it seems like 25 out of 35 watchdog drivers (that call
clk_get_rate()) just store the rate in probe.

> Guenter
