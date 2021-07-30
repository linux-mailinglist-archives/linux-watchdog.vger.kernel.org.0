Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB973DB3F1
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 08:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbhG3GxI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 02:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhG3GxH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 02:53:07 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53FDC061765;
        Thu, 29 Jul 2021 23:53:03 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id r5so8356822ilc.13;
        Thu, 29 Jul 2021 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j6IF2835VrIHwDYkTgZV/+UoCjQH2G1E3gkSxTW7I4w=;
        b=K8mj6p+ayOG673+GlZiXV/IYCS1RDMIdPmDN71kg7b/4hCa4ztjyAcw1g/VrEPbHVN
         sva4/ol5hrLN8kJ/VYsfP9v1Cl3LcYvhdg6uY6C821zlozKRO33c9Y3D7fK0O6lJbsT0
         wSJ60IykQ6HGfBPAszYFiQ8t7ysXukJMWsu4so228rtzlj1Evu0eMjrMFnNj0vikup/y
         u6xdEAXSfea46EmaaRLT82Yw3SeK1DDA2AGf86vQEFP7Gqdbp3hBCmAZvhjzYVfRzX/J
         nRxOCqjAzl5OuiB1Z3qPRKcrvIGAzyUWHZH/LESWGcjHyKi0s+UMr30geOc2k0s7qBZt
         QQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j6IF2835VrIHwDYkTgZV/+UoCjQH2G1E3gkSxTW7I4w=;
        b=FFRYaj269Er3mNDFSq7n1ugheCwuubGcUodBQG9U4U3UwiSxjjjTgxl1N6oSQimJD6
         KZ1hqNIvb702Bg3enDaYOUcV7jTWZAjp1+ZTrlf8Aq9SXM/wC7cuI+7k6MqUUpWP0bTL
         wOfNBi+WxCtgEBRxGcIaABdOOwGJdVLjCMFJe1V1JASRvCZCvx08t7P6GEAWTu+Qo5Hw
         Ev/3TdvF0NZTPAE3bifvPCnk6N+2l7KFU/KWNiZxDLuYaAcj345R5DFbBlLrXmiBgGVn
         mZNi5xaxPG8pAJhRcTND6gq9dhe5DqFDML9bzWQ00L3n+nsbIvSpQmRCFKquhN0xQV+w
         CC5w==
X-Gm-Message-State: AOAM5325QIlv1lQf2EFZLYOMagtXhRIRFPqxGTdpfmyMP/ayKM8AyI7M
        gGextEIhxI8J3a/iYr8AE5gxPjLef6AAcAvPEI4=
X-Google-Smtp-Source: ABdhPJzj4gqNEOi1QeT0MXntI3totaMLSia+EA4wE+PYYt0Fc0LmOB2npBvlj4Pe0hYU2ZzQVHS8mscsCIZZ5BftD3c=
X-Received: by 2002:a05:6e02:d09:: with SMTP id g9mr72441ilj.153.1627627983180;
 Thu, 29 Jul 2021 23:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com> <20210730041355.2810397-4-art@khadas.com>
 <20210730045857.GC2110311@roeck-us.net>
In-Reply-To: <20210730045857.GC2110311@roeck-us.net>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Fri, 30 Jul 2021 14:52:51 +0800
Message-ID: <CAKaHn9LjZUFJu9+6B3nEZkAXGeAPkXTNcToRnvtSJjEXBJULKw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
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

Thank you very much for the helpful and detailed comments

Artem

On Fri, Jul 30, 2021 at 12:59 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jul 30, 2021 at 12:13:55PM +0800, Artem Lapkin wrote:
> > Remove watchdog_stop_on_reboot()
> >
> > Meson platform still have some hardware drivers problems for some
> > configurations which can freeze device on shutdown/reboot stage and i
> > think better to have reboot warranty by default.
> >
> > I feel that it is important to keep the watchdog running during the
> > reboot sequence, in the event that an abnormal driver freezes the reboot
> > process.
> >
> > This is my personal opinion and I hope the driver authors will agree
> > with my proposal, or just ignore this commit if not.
> >
> > https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> >
>
> A much better description would be something like
>
> "The Meson platform still has some hardware drivers problems for some
>  configurations which can freeze devices on shutdown/reboot.
>  Remove watchdog_stop_on_reboot() to catch this situation and ensure
>  that the reboot happens anyway.
>  Users who still want to stop the watchdog on reboot can still do so
>  using the watchdog.stop_on_reboot=1 module parameter.
>  "
>
> That leaves the personal opinion out of the picture and provides both
> a rationale for the change and an alternative for people who want
> to stop the watchdog on reboot anyway.
>
> > Signed-off-by: Artem Lapkin <art@khadas.com>
>
> As mentioned, I'd still like to get an opinion from the driver
> author and/or some other users of this platform. However, I'll
> accept the patch with the above description change if I don't get
> additional feedback.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/watchdog/meson_gxbb_wdt.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 945f5e65db57..d3c9e2f6e63b 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >
> >       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >
> > -     watchdog_stop_on_reboot(&data->wdt_dev);
> >       return devm_watchdog_register_device(dev, &data->wdt_dev);
> >  }
> >
> > --
> > 2.25.1
> >
