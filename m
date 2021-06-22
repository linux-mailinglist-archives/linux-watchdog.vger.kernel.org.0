Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063293B0358
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 13:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFVLzs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 07:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFVLzs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 07:55:48 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00927C061574;
        Tue, 22 Jun 2021 04:53:32 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id k5so4551221ilv.8;
        Tue, 22 Jun 2021 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aEO6IsSb/vSQr97ckfCz5XZnU7Vfp5IGu1nUSLuT5l4=;
        b=RvthV7XkZyLt3MdCSxQARYM/1IxDbMDd52DXZoNCb8myUKUX2HdJDMmj8ajmImESE+
         1YhiPL7AkmUy9+cBVfun0eIl1owNe2aPEEEMINQAkV/wn2VNgqp/sK86ySxe3xwpHREk
         yXwonpUnHvIGiVOijHM/Ns8B1Tpq7AbuS/ZAvy+QyxD97NPr2DBZZamMBTTFvhLyehfw
         PnmgP0tLyMQ3YO67sn8pxq4f3nvYw/+OhecRAOZdDVmERQZkPBuYFjosGBsK0/8eVIpL
         a2TIDp6j8FX6XAf7BpLZ+bUJup8HX7d6/ysP7xhCu/oCENW4U/Vpr9UgIdyHMVpiZESP
         rE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEO6IsSb/vSQr97ckfCz5XZnU7Vfp5IGu1nUSLuT5l4=;
        b=iGQFirNFSAYkt+4rZZ+2sAlr85eM+uBO4HUPAbMW50Sxxi9hqhLrUqlk3pQNnsnKBM
         xT81rODcxHnKW1oM7Fj3JnlcJDccwyWvucF/5jt57ILVPKXjk0yRZGwYfNMBmpmtkKua
         /+sN7Yl6NlWVaeFyhIBNELVeEY+OVIgj1H2YawUEJFVf2NiucHD6+3VMrMk58UD9Jd2+
         Y7P6UxTm98CyQ0BvxESwfQH484BVR+sJwTRyDa4c7f4+u4lTTUK7dfRw1dzBDCpMN3NF
         /B0XzXSL96kmNtHaA9bg0qAFBYI8k5li6THc1Ez2odrCqppTGSh0FoMQeTsX34ApRVnf
         hhcA==
X-Gm-Message-State: AOAM530Whe3SjUptdc7CoFXy4JKuz7I3LPxphaWfE1ScJcJdQl5NOOtd
        S3jiEljbvvx1ALCAm6FMGokTvoPICf3mp5G3ifQ=
X-Google-Smtp-Source: ABdhPJzeeyDHHT1XJPI850M+JNrR7YAXKf3+LUFD9db7XL/PT7RSo6wi5mgvgSt1imENq+oFdTPc7FRVNKKaO43oYBg=
X-Received: by 2002:a92:7b0f:: with SMTP id w15mr2458228ilc.150.1624362812494;
 Tue, 22 Jun 2021 04:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210622095639.1280774-1-art@khadas.com> <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
In-Reply-To: <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Tue, 22 Jun 2021 19:53:21 +0800
Message-ID: <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-kernel@vger.kernel.org, Artem Lapkin <art@khadas.com>,
        Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> Neil
> Can you split the patch in 4 distinct changes ?

yes  no problem i can try to do it tomorrow !
maybe somebody have other ideas, suggestion, comments ...


On Tue, Jun 22, 2021 at 7:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Art,
>
> On 22/06/2021 11:56, Artem Lapkin wrote:
> > Improve meson_gxbb_wdt watchdog driver
> > 1) added module param timeout and nowayout same as other modules
> > 2) print watchdog driver start status
> > 3) add watchdog_stop_on_unregister
> > 4) remove watchdog_stop_on_reboot ( still can be activated by
> > watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
> > becouse we can get reboot waranty for abnormal situations on shutdown stage
>
> Can you split the patch in 4 distinct changes ?
>
> Neil
>
> >
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
> >  drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 5a9ca10fbcfa..15c889932c13 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
> >       struct clk *clk;
> >  };
> >
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +static unsigned int timeout = DEFAULT_TIMEOUT;
> > +
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> > +                     __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +module_param(timeout, uint, 0);
> > +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> > +                     __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> > +
> >  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
> >  {
> >       struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
> > @@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >       data->wdt_dev.ops = &meson_gxbb_wdt_ops;
> >       data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
> >       data->wdt_dev.min_timeout = 1;
> > -     data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> > +     data->wdt_dev.timeout = timeout;
> >       watchdog_set_drvdata(&data->wdt_dev, data);
> >
> >       /* Setup with 1ms timebase */
> > @@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >
> >       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >
> > -     watchdog_stop_on_reboot(&data->wdt_dev);
> > +     watchdog_set_nowayout(&data->wdt_dev, nowayout);
> > +     watchdog_stop_on_unregister(&data->wdt_dev);
> > +
> > +     dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
> > +             data->wdt_dev.timeout, nowayout);
> > +
> >       return devm_watchdog_register_device(dev, &data->wdt_dev);
> >  }
> >
> >
>
