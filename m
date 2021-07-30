Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB963DB105
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 04:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhG3CJd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 22:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhG3CJc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 22:09:32 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F4EC061765;
        Thu, 29 Jul 2021 19:09:29 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id j18so4841124ile.8;
        Thu, 29 Jul 2021 19:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QxqMJC3Xkqptbj7jiRiylO7ezNGtuGhPY6uv3BBuL78=;
        b=Jy0WFDHB6TL+JzlXeZXGXRMT7sdxQrYste3cn8VKqMSFq+kxnrxRRAD+SGc8OKsdke
         XOP37UxKq3EsGTyW7WUShQqV9O1He0NEChIsoHn+0z9l8uTG+gMsgPahC40iY0kK6L5u
         AB2EvyI7D9SHeYTT8jQR4juJz9R8PBp3IMyxCjVhHE8gfwP9h1D/SOLPtHkoRGM+/jjD
         kB8lFmecbjTVvSeUBrogOCfYzxObRqtMUguuHu0l90i4MxsbywU3wjH7V8MPLEK8z1W0
         e3ga0GO4H8t+SQuHWJ/4uSy0dJpKvBxD/ZUh0C3KaLrPMbYj/Aicl2AEUMFpooL7t4fv
         5jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QxqMJC3Xkqptbj7jiRiylO7ezNGtuGhPY6uv3BBuL78=;
        b=Su8d8qp349RV7LCpAIi7Jk6ETJPlChdA0BBdL0KfULmOXzjPH7GuNkTmPIiyi/jGGH
         XcIX3ww/OjN1JGSRCxqL1+r/kmuoCCHVva9XhC/ZiQkkjH0iiLtHiIoxKzlLaG8NIKZk
         pN3D5Ip8fSobmZD/Q2tuif/9DOa+jOKRVA7gwT/9lqtWgOkqufabC1e72kuOTxtcmwoa
         i/Bx/x5bQ+1Lx/fFhMEooDG5z5gF7acb+fEfK3WaBGXAE0gfp9BI+D4b/dutk5OmJP1N
         xCY+1tJBAY8/TvcVgZCqKbbm/EousiECd5mKffrSacf1nur7a/6xo2b5gd6KPvK/q5Dn
         BAeA==
X-Gm-Message-State: AOAM530YKzMVUlj0y+kgHhD8I5LWVbnxLa1hERdkKnXBqbJmIqLXhXkv
        P0/+6zOO6ugpgve8lPOJQS725TQ5E5nNGUPB4oQ=
X-Google-Smtp-Source: ABdhPJzBsShOhxk9cSEtPV39lcj3OF5ThN73CmwlEzrAlKuHBCBHYgy/yo68wnLdLMeHRgPd1aZFJu4g/uMN4LjH3ys=
X-Received: by 2002:a05:6e02:d09:: with SMTP id g9mr144092ilj.153.1627610968479;
 Thu, 29 Jul 2021 19:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210729072308.1908904-1-art@khadas.com> <20210729072308.1908904-4-art@khadas.com>
 <024cd37a-39a0-d43b-9a2f-cec43eb3b9e8@roeck-us.net>
In-Reply-To: <024cd37a-39a0-d43b-9a2f-cec43eb3b9e8@roeck-us.net>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Fri, 30 Jul 2021 10:09:17 +0800
Message-ID: <CAKaHn9+EE+ZLeL1fmhU7j9AKsZ63H7MaJokhT_jnVGAvsLr9gw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, wim@linux-watchdog.org,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
        Gouwa Wang <gouwa@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Yes i totally agree with you , i will rewrite this patches again
properly and explain more detail about why need remove
watchdog_stop_on_reboot

i have check already other watchdog sources / half of them have
watchdog_stop_on_reboot another half dont have it , and i think both
have some reasons

> I'll be happy tolisten to input from others.

Same will be happy.

Our situation very simple - meson platform still have some hardware
drivers problems for some configuration which can freeze device on
shutdown/reboot stage and i hope better to have some reboot warranty

> some reboots take longer than the watchdog timeout.
I have check this situation to - our drivers shutdown stage its about
1 sec default watchdog timeout 30 sec i think its enough - cant see
any problem
anybody can use watchdog.stop_on_reboot=1 if need freeze identification.

Artem

On Thu, Jul 29, 2021 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/29/21 12:23 AM, Artem Lapkin wrote:
> > Remove watchdog_stop_on_reboot()
> >
>
> This warrants a much longer explanation to even be considered.
> Your explanation/reasoning needs to be here. Others won't have
> the benefit of reading the summary e-mail, even more so since
> you declined to number and sequence the series.
>
> Personally' I don't find it acceptable, but I'll be happy to
> listen to input from others. Such changes should be based on
> real problems, not on personal opinions. If we accept this patch,
> someone else might come in later reverting it with the personal
> opinion that some reboots take longer than the watchdog timeout.
>
> Guenter
>
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
> >   drivers/watchdog/meson_gxbb_wdt.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 3f3866878..cafc6cdc0 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >
> >       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >
> > -     watchdog_stop_on_reboot(&data->wdt_dev);
> >       return devm_watchdog_register_device(dev, &data->wdt_dev);
> >   }
> >
> >
>
