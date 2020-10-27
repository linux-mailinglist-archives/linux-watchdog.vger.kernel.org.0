Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0747D29A7F6
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Oct 2020 10:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895681AbgJ0Jeo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Oct 2020 05:34:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35359 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409431AbgJ0Jeo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Oct 2020 05:34:44 -0400
Received: by mail-wm1-f68.google.com with SMTP id h22so695667wmb.0;
        Tue, 27 Oct 2020 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1O6ReDftOPLuv+rKw4ASKdk+lBtaUq2pZDF0lCYQsaY=;
        b=pNbiUAvuBMXmcIWQBwkpHxeGJ6lfMPyMfSjHPJBk7lnMR6fn907w/4tPUp92smmO+c
         OtboQXGXVo8oSyZKaoE+ONYfHMlVL+rwTLqvqIc+fkrLR55oDG2ez59rbAAPuG12YJkB
         zf0hOvoeLkIcctIsXOnKkbHOGSxU2I7LAyTh+sgdSLgGfgDmx3aQi3IzB9IVBhlqPVbO
         CejlAdz0eXH8AN6WJh130ZeUqOv9N+dAHR80tqPGfUjF8hTeKkVhHS2XqDz5YwwWoDo+
         lupNzOQj57cr88XXDchbhOUc2TF2dx+ixHS81WyEmlPIu/WHXc4Ga9S/bCj0cyNAsZ8b
         lR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1O6ReDftOPLuv+rKw4ASKdk+lBtaUq2pZDF0lCYQsaY=;
        b=D9dyBaACcZto7Hgh8ti/bVvALrKrKKoQMAxFLQqv8ZWYH7oLQrLgABCun45hUW1/yH
         /y+EUsvrLwFTvG66Jm2B4sHi1RPn4uHyzqtDShMGLokhH0H0IsDDjE6XNsygmV/gZ8UM
         MA98vzXzcZdbRzoHXRjrEUpE+OapjvFtwzWf6l7obGJ9hbJYEd2366LSiWBBCNJMX0cj
         8F3ksC7EQVfvHPDzR5jk+E0C3/nrUTTBEoiT5aQCYGoveoXnxTyxsbMvXi/9VrCSgSir
         R621vwOA/lqoGq/x3T8ddfYBJ42F++Yus9rqmGc6wZtn72Nu6q7g42ys+JZZg8zlMxxJ
         OIbw==
X-Gm-Message-State: AOAM532ChuGn+pKWkw0C22T7b1BS54e+R1RoglXd4CzE9MOqr1jd7M9J
        Js/113u+RXQYZzQ2hpSjZWVMPMBsJafliqDyD97dAwpI6pz5Dg==
X-Google-Smtp-Source: ABdhPJwopd/345MJxBCHQ2u3UoN/KSlAOVDjSs698J3nx/jmQOOY9DR3A4NMAMdWhEs5uVQncfbwYD9szUXfHf3SFI0=
X-Received: by 2002:a05:600c:2252:: with SMTP id a18mr1614048wmm.166.1603791282238;
 Tue, 27 Oct 2020 02:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201026080919.28413-1-zhang.lyra@gmail.com> <20201026080919.28413-2-zhang.lyra@gmail.com>
 <2691dbe4-0bff-fdb4-0871-60b491d740a4@roeck-us.net>
In-Reply-To: <2691dbe4-0bff-fdb4-0871-60b491d740a4@roeck-us.net>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 27 Oct 2020 17:34:06 +0800
Message-ID: <CAAfSe-shio68k9twUbCxT7WuvSQ1H2U83xqs4P95nF5Ys_J_Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] watchdog: sprd: should not disable watchdog in resume
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 26 Oct 2020 at 22:27, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/26/20 1:09 AM, Chunyan Zhang wrote:
> > From: Lingling Xu <ling_ling.xu@unisoc.com>
> >
> > Don't disable watchdog in resume process, otherwise system would crash
> > once kick watchdog.
> >
>
> This is a bit misleading: It is only disabled if the attempt to start it
> has failed. Was this observed in practice ? If so, it might make sense
> to identify and fix the underlying problem instead of trying to work
> around it (or is this addressed with the second patch of the series ?)

Yes, I think the root cause of this problem was like what I explained
in the 3rd patch in this series.
Lingling found there was something wrong in sprd_wdt_pm_resume() when
debugging that issue, then we had this patch.

>
> Anyway, the patch itself is fine.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Chunyan

>
> Thanks,
> Guenter
>
> > Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> > Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> >  drivers/watchdog/sprd_wdt.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> > index 65cb55f3916f..f3c90b4afead 100644
> > --- a/drivers/watchdog/sprd_wdt.c
> > +++ b/drivers/watchdog/sprd_wdt.c
> > @@ -345,15 +345,10 @@ static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
> >       if (ret)
> >               return ret;
> >
> > -     if (watchdog_active(&wdt->wdd)) {
> > +     if (watchdog_active(&wdt->wdd))
> >               ret = sprd_wdt_start(&wdt->wdd);
> > -             if (ret) {
> > -                     sprd_wdt_disable(wdt);
> > -                     return ret;
> > -             }
> > -     }
> >
> > -     return 0;
> > +     return ret;
> >  }
> >
> >  static const struct dev_pm_ops sprd_wdt_pm_ops = {
> >
>
