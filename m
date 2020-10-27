Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D5829A795
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Oct 2020 10:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394695AbgJ0JRj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Oct 2020 05:17:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45118 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390503AbgJ0JRj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Oct 2020 05:17:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id e17so970002wru.12;
        Tue, 27 Oct 2020 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KnJoJgk84FwLk/ANyG7dQFanuIJ2r/lfRIWtEAhvPa4=;
        b=ujnM88ueWDajGmHeeT5G7HpaOgXoDvx+qDaU6FkBUQay6RhNQnKKhCFk6Wx1jMAlTW
         gZSIpD/CVojtMtIa2W/8W0DCvEL2J5QYfcnfzQm2p7rA7Hc89o98eq+i9wi2AfwCFnEa
         Ygv0J62U/Tv1dk52NxcLfxOQwnl6+gHGEds1CPYfuOPOv02hRF0P+E9DnXVqsQGYYeMs
         hWOzxQDesGDEvQOO43ah4CUB08SJqsp2+I9tWtZnRO4LdkiZpXE+nDzPw3PVpUTHGsIk
         pOtaM33FroDZohGx9BSrMw1ZmEkPGHxvtiP+55WT7ve3+MPpQIyw5H+FvWmjajUJJMuv
         3QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KnJoJgk84FwLk/ANyG7dQFanuIJ2r/lfRIWtEAhvPa4=;
        b=qpAOQTaqwz4cUb02rwOgRE2ytACRz9mZgtjYENcBUJIp4otnJuv8nmskPo9r1uWcUF
         vQtWWdpzxURA7vLBRCmepZMdzzzvT2rsFyyvliHrTs+4qwaU687NlwycOFOFR5eQfWM0
         COXPu8IpSpo1sq1WzP80K3hsW78AcJ66baaSvZ57HqSJl0oxecCllV5GTS3BZUeoht87
         NUvZOyHNSd0uZYz41Q5QlkXFDBW5c8ZlflpKXSkpRFgwPfnDpglNZbMxhcPYw8kumOBM
         fzwghGQRzS5Y9m5ywuEvkIBXLqPEe8F510AEwEdyEjhnOAFM5z0R+vy3o6frmYSozzGw
         jyYg==
X-Gm-Message-State: AOAM530Ypz5tTMj6DbDJDTdIr0ZHljDwV1kesfIAt+ctTQrhK3N3Cifp
        9sdmHtlvHvmpkHKV06TQmGIwcyIjyMOfj+gsPb0=
X-Google-Smtp-Source: ABdhPJzq/lbXlgJ69fxGubIR+kiwS/oAssL+fVrC+BMgwBznGUE3f3AzJtl9CYxKXZCPOJS+NsfMIgEEZtYJJMJs1q8=
X-Received: by 2002:adf:82ab:: with SMTP id 40mr1592860wrc.420.1603790257100;
 Tue, 27 Oct 2020 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201026080919.28413-1-zhang.lyra@gmail.com> <20201026080919.28413-4-zhang.lyra@gmail.com>
 <e1d01b18-44c1-0285-62bc-48d7c19e1bdb@roeck-us.net>
In-Reply-To: <e1d01b18-44c1-0285-62bc-48d7c19e1bdb@roeck-us.net>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 27 Oct 2020 17:17:00 +0800
Message-ID: <CAAfSe-sfwh42R1QyBfg+ZdLOiGsm8apAmoX4Cs27x682r2z_hw@mail.gmail.com>
Subject: Re: [PATCH 3/3] watchdog: sprd: check busy bit before kick watchdog
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>, jingchao.ye@unisoc.com,
        xiaoqing.wu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 26 Oct 2020 at 22:44, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/26/20 1:09 AM, Chunyan Zhang wrote:
> > From: Lingling Xu <ling_ling.xu@unisoc.com>
> >
> > As the specification described, checking busy bit must be done before kick
> > watchdog.
> >
>
> That is a key functional change: So far the code checked if a value
> was accepted after loading it. That is no longer the case. Effectively,
> with this change, the _next_ operation will now check if the previous
> operation was accepted. Is this intentional ?

Yes, the busy bit indicates whether the previous operation is done, so
we have to make sure the last loading completed (the busy bit is not
set) before new loading.

The spec says that this bit is set after a new loading, and would last
2 or 3 RTC clock cycles.

>
> Also, does this really solve a problem, or is it just an optimization ?
> By checking for busy prior to an operation instead of after it the only
> real difference is that the busy check will most likely succeed immediately
> because enough time has passed since the last write.
>
> Ultimately it is your call how you want to handle this, but I think the
> impact should be spelled out.

Ok, I will add more details in the commit message.

Many thanks for the review!

Chunyan

>
> Guenter
>
> > Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> > Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> >  drivers/watchdog/sprd_wdt.c | 27 ++++++++++++++-------------
> >  1 file changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> > index 4f2a8c6d6485..14071c66ff49 100644
> > --- a/drivers/watchdog/sprd_wdt.c
> > +++ b/drivers/watchdog/sprd_wdt.c
> > @@ -108,20 +108,8 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
> >       u32 tmr_step = timeout * SPRD_WDT_CNT_STEP;
> >       u32 prtmr_step = pretimeout * SPRD_WDT_CNT_STEP;
> >
> > -     sprd_wdt_unlock(wdt->base);
> > -     writel_relaxed((tmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> > -                   SPRD_WDT_LOW_VALUE_MASK, wdt->base + SPRD_WDT_LOAD_HIGH);
> > -     writel_relaxed((tmr_step & SPRD_WDT_LOW_VALUE_MASK),
> > -                    wdt->base + SPRD_WDT_LOAD_LOW);
> > -     writel_relaxed((prtmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> > -                     SPRD_WDT_LOW_VALUE_MASK,
> > -                    wdt->base + SPRD_WDT_IRQ_LOAD_HIGH);
> > -     writel_relaxed(prtmr_step & SPRD_WDT_LOW_VALUE_MASK,
> > -                    wdt->base + SPRD_WDT_IRQ_LOAD_LOW);
> > -     sprd_wdt_lock(wdt->base);
> > -
> >       /*
> > -      * Waiting the load value operation done,
> > +      * Waiting the last load value operation done,
> >        * it needs two or three RTC clock cycles.
> >        */
> >       do {
> > @@ -134,6 +122,19 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
> >
> >       if (delay_cnt >= SPRD_WDT_LOAD_TIMEOUT)
> >               return -EBUSY;
> > +
> > +     sprd_wdt_unlock(wdt->base);
> > +     writel_relaxed((tmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> > +                   SPRD_WDT_LOW_VALUE_MASK, wdt->base + SPRD_WDT_LOAD_HIGH);
> > +     writel_relaxed((tmr_step & SPRD_WDT_LOW_VALUE_MASK),
> > +                    wdt->base + SPRD_WDT_LOAD_LOW);
> > +     writel_relaxed((prtmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
> > +                     SPRD_WDT_LOW_VALUE_MASK,
> > +                    wdt->base + SPRD_WDT_IRQ_LOAD_HIGH);
> > +     writel_relaxed(prtmr_step & SPRD_WDT_LOW_VALUE_MASK,
> > +                    wdt->base + SPRD_WDT_IRQ_LOAD_LOW);
> > +     sprd_wdt_lock(wdt->base);
> > +
> >       return 0;
> >  }
> >
> >
>
