Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7B23A9CCF
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jun 2021 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhFPOBp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Jun 2021 10:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbhFPOBo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Jun 2021 10:01:44 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36ED7C061574
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Jun 2021 06:59:35 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id x6so1579116qvx.4
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Jun 2021 06:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QvTscpdtSME1zV++0MyBEAQ2RjASk3pBKLKm6ayPws4=;
        b=qukkYzbGBwvPyl927hREHi0xY6LXwNYfufoai+v0kddN+dKsee5WLPtX3pP42FJiA3
         KfCwb6PeCt/KchPWeRw3b9lTs3KT62HFaQ4TjGqHD+7hyRXXyMwwDAHiusXlp98fcrsQ
         RgtWA1oaQe41CuZZQSl0wil2t3WPcC5e05Xo/ck74I8SuxfwM2kZgbJE1VtSagn3HPDw
         Wlo3SpxKgIJIoJ8mDvooYsL1zkPV/IJwaUD+uuMaf1DEendUkjv8kKA59chDA1xWxAr7
         jNqmC2Zfwf9OX0M49722N54VJZlpj7ZaHYjD/N4F6WCdiU+0cOs6V4km7BVPLx7dZaio
         6N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QvTscpdtSME1zV++0MyBEAQ2RjASk3pBKLKm6ayPws4=;
        b=EqAYfUoeY4xY2RFIpsegoRSdBGxBzZ28XQVypsxjlE4NeCEi2s68na9SLbnPJPT1Cy
         o3OcdUC5BZ21UgORrcwQXySS+G0MALSDmQTNac4XPddIXDaGUkgQD56zsQbdrdcYgQ6W
         PwPnkQfBcyUWkBCUz/RxK17rBVx+lKzz0Za0CHI045DG3aKsn3Yx1WYdLGl7yeIxs/UH
         nzXKxeKUyPCPVKpikzFWoVgpbo+U9m1Qnt4i5sOMLMOjaYsI/bQcspunjKbw56Nk1S5b
         9s1lrXaQX76H2XLf1WppjbI2lsJUq5zTjb77rZGOCNYTNNTgbqlf0aRgilI+TawsHbca
         m0CA==
X-Gm-Message-State: AOAM533ex3WCSSVifeypmqSDCNAk2PcWHyD+OWcxEtKnNCqXkl32ZBW+
        cBZtnOgU1uF2RXhPcYv7GlhF2MmaBfhnmhPHahp+YsZ9Vcw=
X-Google-Smtp-Source: ABdhPJwoQynC4K5L9lstAHzUHxhDOkpNlpy3ScLRAXogEJRDeiwMs/ngDax65rzow6AoBBLs0xl0UZDndFVNMH1CqpE=
X-Received: by 2002:a05:6214:20c4:: with SMTP id 4mr147960qve.1.1623851974357;
 Wed, 16 Jun 2021 06:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
 <20210615123904.2568052-2-grzegorz.jaszczyk@linaro.org> <20210615141803.GA957871@roeck-us.net>
In-Reply-To: <20210615141803.GA957871@roeck-us.net>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 16 Jun 2021 15:59:23 +0200
Message-ID: <CAMxfBF7EZRaCcrCYmY1RkWytWWHiH7xATfzKO68Hqtf3M--L_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] watchdog: introduce watchdog_dev_suspend/resume
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 15 Jun 2021 at 16:18, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jun 15, 2021 at 02:39:03PM +0200, Grzegorz Jaszczyk wrote:
> > The watchdog drivers often disable wdog clock during suspend and then
> > enable it again during resume. Nevertheless the ping worker is still
> > running and can issue low-level ping while the wdog clock is disabled
> > causing the system hang. To prevent such condition introduce
> > watchdog_dev_suspend/resume which can be used by any wdog driver and
> > actually cancel ping worker during suspend and restore it back, if
> > needed, during resume.
> >
>
> I'll have to look into this further, but I don't think this is the correct
> solution. Most likely the watchdog core needs to have its own independent
> suspend/resule functions and suspend the high resolution timer on
> suspend and restore it on resume. This may require an additional flag
> to be set by drivers to indicate that the timer should be stopped on
> suspend.

That makes sense - thank you for your suggestion. I think I could
register a pm notifier in the watchdog core when the new e.g.
WDOG_STOP_PING_ON_SUSPEND status flag will be set by the driver and
actually call watchdog_dev_suspend/resume from the notifier callback.
Please let me know if you see any other issue with this solution, if
not I will post v2.

Thank you in advance,
Grzegorz




>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> >  drivers/watchdog/watchdog_dev.c | 49 +++++++++++++++++++++++++++++++++
> >  include/linux/watchdog.h        |  2 ++
> >  2 files changed, 51 insertions(+)
> >
> > diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> > index 2946f3a63110..3feca1567281 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -1219,6 +1219,55 @@ void __exit watchdog_dev_exit(void)
> >       kthread_destroy_worker(watchdog_kworker);
> >  }
> >
> > +int watchdog_dev_suspend(struct watchdog_device *wdd)
> > +{
> > +     struct watchdog_core_data *wd_data = wdd->wd_data;
> > +     int ret;
> > +
> > +     if (!wdd->wd_data)
> > +             return -ENODEV;
> > +
> > +     /* ping for the last time before suspend */
> > +     mutex_lock(&wd_data->lock);
> > +     if (watchdog_worker_should_ping(wd_data))
> > +             ret = __watchdog_ping(wd_data->wdd);
> > +     mutex_unlock(&wd_data->lock);
> > +
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * make sure that watchdog worker will not kick in when the wdog is
> > +      * suspended
> > +      */
> > +     hrtimer_cancel(&wd_data->timer);
> > +     kthread_cancel_work_sync(&wd_data->work);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(watchdog_dev_suspend);
> > +
> > +int watchdog_dev_resume(struct watchdog_device *wdd)
> > +{
> > +     struct watchdog_core_data *wd_data = wdd->wd_data;
> > +     int ret;
> > +
> > +     if (!wdd->wd_data)
> > +             return -ENODEV;
> > +
> > +     /*
> > +      * __watchdog_ping will also retrigger hrtimer and therefore restore the
> > +      * ping worker if needed.
> > +      */
> > +     mutex_lock(&wd_data->lock);
> > +     if (watchdog_worker_should_ping(wd_data))
> > +             ret = __watchdog_ping(wd_data->wdd);
> > +     mutex_unlock(&wd_data->lock);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(watchdog_dev_resume);
> > +
> >  module_param(handle_boot_enabled, bool, 0444);
> >  MODULE_PARM_DESC(handle_boot_enabled,
> >       "Watchdog core auto-updates boot enabled watchdogs before userspace takes over (default="
> > diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> > index 9b19e6bb68b5..febfde3b1ff6 100644
> > --- a/include/linux/watchdog.h
> > +++ b/include/linux/watchdog.h
> > @@ -209,6 +209,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
> >                                 unsigned int timeout_parm, struct device *dev);
> >  extern int watchdog_register_device(struct watchdog_device *);
> >  extern void watchdog_unregister_device(struct watchdog_device *);
> > +int watchdog_dev_suspend(struct watchdog_device *wdd);
> > +int watchdog_dev_resume(struct watchdog_device *wdd);
> >
> >  int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
> >
> > --
> > 2.29.0
> >
