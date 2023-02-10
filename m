Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B710F692281
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Feb 2023 16:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjBJPnr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Feb 2023 10:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjBJPnp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Feb 2023 10:43:45 -0500
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61125FDA;
        Fri, 10 Feb 2023 07:43:43 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-16dcb07b805so598022fac.0;
        Fri, 10 Feb 2023 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X15WkfAllK4QnYioovuov5odntKZjuq/k4FJqkuDZqk=;
        b=ltkm6kdzR3STq207DiPKMQy0T66g9jT6+iHXjwkqo9bZI4up/jmkq4T/qPjQ6+mYqz
         0Bghy68EJoF9l9lkOO9c0OywBqC9K2xt94AFCvnLKAHN42v9G7PajK+waEcyEUE+cYVM
         LpX5YPyiC1wiQIfxyiaJp5iFoQ9cYciFBPxR3XwZMNod5NUOy9aWYq9T0MCFv8OQgKwP
         PCOP6J3kQVrjSwWgpW9Kdsk0dFxt1aIfyTlsKQfwz1UutptVpt8oDVbao8G93s++zLFb
         Q6PMeSj+Jee8TtxNuG5a+nAOox0AQMto4XYGK5t576efkjyRWxnEhrdAwp8XlS2w+Sxz
         enyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X15WkfAllK4QnYioovuov5odntKZjuq/k4FJqkuDZqk=;
        b=AcAVavIR4gXozcvhLi41tjkqy1DSEdohfJu7PHkVF7JZujJPPuzh+tlpthGp7qU0Sb
         huNYIWkqkn2sXvQDFmRyJucDnXQYFOM0SqWCL3h8tcVzF7fDuaWxEiOHyuOomP++Pz+E
         yMJ8RBXNfizm+BTbf/g22pGSzEhqpKcV+tRa+6JLGk1jC4Z2JsjRqYTQgO/V6uaLNgxQ
         BSrwwEMn77Yk+iUR/wPG/zEFCfau54cF/Gr78z5wYI9lU9/yOvJc6Berl+kUzixR6R6g
         5202thBPZecQprCZRy7FyaZ1CmGVn8umCheSfNu1MZ9FxAb7FnFntBvY26WMfwEJXJW/
         JHEw==
X-Gm-Message-State: AO0yUKVZtj/hHRNbv+vLRcppV4CvYibNcJRgdCbC67QkuxielHJW5vaq
        Pd0QjC3oydk53HEMP9/GoM4jGUb7gJ5ea/RNrfw=
X-Google-Smtp-Source: AK7set+ukf4zVIwGVKKNG40441UZDPKvyBOCSkGofagHjn2q4QkWk3XzghaJ5mTqytpWqNtiHeW0in5YJoJcBC/118o=
X-Received: by 2002:a05:6870:9615:b0:169:fabf:b222 with SMTP id
 d21-20020a056870961500b00169fabfb222mr1935644oaq.83.1676043823008; Fri, 10
 Feb 2023 07:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20230210121735.639089-1-sergio.paracuellos@gmail.com>
 <20230210121735.639089-4-sergio.paracuellos@gmail.com> <b586fd0f-f5b3-6fd1-3cce-2809e5476bf5@roeck-us.net>
In-Reply-To: <b586fd0f-f5b3-6fd1-3cce-2809e5476bf5@roeck-us.net>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 10 Feb 2023 16:43:31 +0100
Message-ID: <CAMhs-H_wbsRNvA6JWuUEamxb3+BtDCzj8aR6v3T0K1DCczfZgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] watchdog: mt7621-wdt: avoid static global declarations
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, arinc.unal@arinc9.com,
        tsbogend@alpha.franken.de, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

Thanks for reviewing this.

On Fri, Feb 10, 2023 at 4:00 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/10/23 04:17, Sergio Paracuellos wrote:
> > Instead of using static global definitions in driver code, refactor code
> > introducing a new watchdog driver data structure and use it along the
> > code.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >   drivers/watchdog/mt7621_wdt.c | 104 ++++++++++++++++++++++------------
> >   1 file changed, 67 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
> > index a8aa3522c..f1c702971 100644
> > --- a/drivers/watchdog/mt7621_wdt.c
> > +++ b/drivers/watchdog/mt7621_wdt.c
> > @@ -31,8 +31,11 @@
> >   #define TMR1CTL_RESTART                     BIT(9)
> >   #define TMR1CTL_PRESCALE_SHIFT              16
> >
> > -static void __iomem *mt7621_wdt_base;
> > -static struct reset_control *mt7621_wdt_reset;
> > +struct mt7621_wdt_data {
> > +     void __iomem *base;
> > +     struct reset_control *rst;
> > +     struct watchdog_device wdt;
> > +};
> >
> >   static bool nowayout = WATCHDOG_NOWAYOUT;
> >   module_param(nowayout, bool, 0);
> > @@ -40,27 +43,31 @@ MODULE_PARM_DESC(nowayout,
> >                "Watchdog cannot be stopped once started (default="
> >                __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> >
> > -static inline void rt_wdt_w32(unsigned reg, u32 val)
> > +static inline void rt_wdt_w32(void __iomem *base, unsigned reg, u32 val)
> >   {
> > -     iowrite32(val, mt7621_wdt_base + reg);
> > +     iowrite32(val, base + reg);
> >   }
> >
> > -static inline u32 rt_wdt_r32(unsigned reg)
> > +static inline u32 rt_wdt_r32(void __iomem *base, unsigned reg)
> >   {
> > -     return ioread32(mt7621_wdt_base + reg);
> > +     return ioread32(base + reg);
> >   }
> >
> >   static int mt7621_wdt_ping(struct watchdog_device *w)
> >   {
> > -     rt_wdt_w32(TIMER_REG_TMRSTAT, TMR1CTL_RESTART);
> > +     struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> > +
> > +     rt_wdt_w32(drvdata->base, TIMER_REG_TMRSTAT, TMR1CTL_RESTART);
> >
> >       return 0;
> >   }
> >
> >   static int mt7621_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
> >   {
> > +     struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> > +
> >       w->timeout = t;
> > -     rt_wdt_w32(TIMER_REG_TMR1LOAD, t * 1000);
> > +     rt_wdt_w32(drvdata->base, TIMER_REG_TMR1LOAD, t * 1000);
> >       mt7621_wdt_ping(w);
> >
> >       return 0;
> > @@ -68,29 +75,31 @@ static int mt7621_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
> >
> >   static int mt7621_wdt_start(struct watchdog_device *w)
> >   {
> > +     struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> >       u32 t;
> >
> >       /* set the prescaler to 1ms == 1000us */
> > -     rt_wdt_w32(TIMER_REG_TMR1CTL, 1000 << TMR1CTL_PRESCALE_SHIFT);
> > +     rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, 1000 << TMR1CTL_PRESCALE_SHIFT);
> >
> >       mt7621_wdt_set_timeout(w, w->timeout);
> >
> > -     t = rt_wdt_r32(TIMER_REG_TMR1CTL);
> > +     t = rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL);
> >       t |= TMR1CTL_ENABLE;
> > -     rt_wdt_w32(TIMER_REG_TMR1CTL, t);
> > +     rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, t);
> >
> >       return 0;
> >   }
> >
> >   static int mt7621_wdt_stop(struct watchdog_device *w)
> >   {
> > +     struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> >       u32 t;
> >
> >       mt7621_wdt_ping(w);
> >
> > -     t = rt_wdt_r32(TIMER_REG_TMR1CTL);
> > +     t = rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL);
> >       t &= ~TMR1CTL_ENABLE;
> > -     rt_wdt_w32(TIMER_REG_TMR1CTL, t);
> > +     rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, t);
> >
> >       return 0;
> >   }
> > @@ -105,7 +114,9 @@ static int mt7621_wdt_bootcause(void)
> >
> >   static int mt7621_wdt_is_running(struct watchdog_device *w)
> >   {
> > -     return !!(rt_wdt_r32(TIMER_REG_TMR1CTL) & TMR1CTL_ENABLE);
> > +     struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> > +
> > +     return !!(rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL) & TMR1CTL_ENABLE);
> >   }
> >
> >   static const struct watchdog_info mt7621_wdt_info = {
> > @@ -121,30 +132,39 @@ static const struct watchdog_ops mt7621_wdt_ops = {
> >       .set_timeout = mt7621_wdt_set_timeout,
> >   };
> >
> > -static struct watchdog_device mt7621_wdt_dev = {
> > -     .info = &mt7621_wdt_info,
> > -     .ops = &mt7621_wdt_ops,
> > -     .min_timeout = 1,
> > -     .max_timeout = 0xfffful / 1000,
> > -};
> > -
> >   static int mt7621_wdt_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> > -     mt7621_wdt_base = devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(mt7621_wdt_base))
> > -             return PTR_ERR(mt7621_wdt_base);
> > +     struct watchdog_device *mt7621_wdt;
> > +     struct mt7621_wdt_data *drvdata;
> > +     int err;
> > +
> > +     drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +     if (!drvdata)
> > +             return -ENOMEM;
> > +
> > +     drvdata->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(drvdata->base))
> > +             return PTR_ERR(drvdata->base);
> >
> > -     mt7621_wdt_reset = devm_reset_control_get_exclusive(dev, NULL);
> > -     if (!IS_ERR(mt7621_wdt_reset))
> > -             reset_control_deassert(mt7621_wdt_reset);
> > +     drvdata->rst = devm_reset_control_get_exclusive(dev, NULL);
> > +     if (!IS_ERR(drvdata->rst))
> > +             reset_control_deassert(drvdata->rst);
> >
> > -     mt7621_wdt_dev.bootstatus = mt7621_wdt_bootcause();
> > +     mt7621_wdt = &drvdata->wdt;
> > +     mt7621_wdt->info = &mt7621_wdt_info;
> > +     mt7621_wdt->ops = &mt7621_wdt_ops;
> > +     mt7621_wdt->min_timeout = 1;
> > +     mt7621_wdt->max_timeout = 0xfffful / 1000;
> > +     mt7621_wdt->parent = dev;
> >
> > -     watchdog_init_timeout(&mt7621_wdt_dev, mt7621_wdt_dev.max_timeout,
> > -                           dev);
> > -     watchdog_set_nowayout(&mt7621_wdt_dev, nowayout);
> > -     if (mt7621_wdt_is_running(&mt7621_wdt_dev)) {
> > +     mt7621_wdt->bootstatus = mt7621_wdt_bootcause();
> > +
> > +     watchdog_init_timeout(mt7621_wdt, mt7621_wdt->max_timeout, dev);
>
> FWIW, setting ->timeout would have been sufficient. watchdog_init_timeout()
> is only really valuable if there is a module parameter, or if the timeout
> is set from devicetree. That won't work here, though, because the passed
> value takes precedence. Changing that would change functionality and thus would
> have to be done in a separate patch, I just wanted to mention it.

Thanks for letting me know. By now I only want to maintain the current
functionality and if it really makes sense I will send functionality
changes in new series after this one is applied.

>
> > +     watchdog_set_nowayout(mt7621_wdt, nowayout);
> > +     watchdog_set_drvdata(mt7621_wdt, drvdata);
> > +
> > +     if (mt7621_wdt_is_running(mt7621_wdt)) {
> >               /*
> >                * Make sure to apply timeout from watchdog core, taking
> >                * the prescaler of this driver here into account (the
> > @@ -154,17 +174,27 @@ static int mt7621_wdt_probe(struct platform_device *pdev)
> >                * we first disable the watchdog, set the new prescaler
> >                * and timeout, and then re-enable the watchdog.
> >                */
> > -             mt7621_wdt_stop(&mt7621_wdt_dev);
> > -             mt7621_wdt_start(&mt7621_wdt_dev);
> > -             set_bit(WDOG_HW_RUNNING, &mt7621_wdt_dev.status);
> > +             mt7621_wdt_stop(mt7621_wdt);
> > +             mt7621_wdt_start(mt7621_wdt);
> > +             set_bit(WDOG_HW_RUNNING, &mt7621_wdt->status);
> > +     }
> > +
> > +     err = devm_watchdog_register_device(dev, &drvdata->wdt);
> > +     if (err) {
> > +             dev_err(dev, "Error registering watchdog device\n");
> > +             return err;
> >       }
>
> This is a functional change. If you want to add an error message,
> do it in a separate patch and provide a rationale for it.

True, will drop this error message in v3 to maintain current
functionality without any extra changes.

>
> >
> > -     return devm_watchdog_register_device(dev, &mt7621_wdt_dev);
> > +     platform_set_drvdata(pdev, drvdata);
> > +
> > +     return 0;
> >   }
> >
> >   static void mt7621_wdt_shutdown(struct platform_device *pdev)
> >   {
> > -     mt7621_wdt_stop(&mt7621_wdt_dev);
> > +     struct mt7621_wdt_data *drvdata = platform_get_drvdata(pdev);
> > +
> > +     mt7621_wdt_stop(&drvdata->wdt);
> >   }
>
> Also FWIW, we have watchdog_stop_on_reboot() for that purpose.
> Changing that would be a separate patch, though.

Thanks. As I have just said above, let's focus only on maintaining
current functionality in this series.

>
> >   static const struct of_device_id mt7621_wdt_match[] = {
>

Thanks,
    Sergio Paracuellos
