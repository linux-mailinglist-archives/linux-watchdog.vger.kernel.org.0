Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C574161179
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Feb 2020 12:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgBQLzr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Feb 2020 06:55:47 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35635 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgBQLzr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Feb 2020 06:55:47 -0500
Received: by mail-qt1-f195.google.com with SMTP id n17so11804066qtv.2
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Feb 2020 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lY87+KOEZ6dGuNkZONRFyrPUlCbu+gnrKXQE8dlGuE4=;
        b=W3P0OcO2TvK2z/0LRMWHw4+JB1JA4XDZks9OBu2hNQT0Q2fQEKktTQQsjT6ePg+9T+
         +ZgTVszIjaKtSk1VRvlhNfK/vj4JTKYDNTs7uz8h5qgddPvOVhoix4UcFUc15Mxm54q/
         XCi0HTe9cUTOYMnmdLrJDyXXS8STOWkT6EINE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lY87+KOEZ6dGuNkZONRFyrPUlCbu+gnrKXQE8dlGuE4=;
        b=kUkreprd6jpyddxFtpEy2nsbQvn40qlG+9zvT8HozcMuiU1lIr0ODg320QaPN89cGs
         j8fk0WP5scH5iqzpjmbf9/3oVn7zqg7nkbOCH7cnI59Ie/D20QkqKMBNv15WORtP0axE
         MfNJfVacHaG5gG30yAeqgGSY9uZJ8EUDvDGyKroZ7tx6ubP6lYRnuUO8m6v3NV7BAIH3
         TBXoCgEBnum4iV8jKQL9mA42SgBviwuQWP5JCnYXmfPJ1u0U3t/Nkw+NJNTb5H+zCSsi
         ktbyoymca+mpuUAOB3ZJjTw7dqIeyfB7dSYt4IoZTZk7XG/8u4igDO/QbTOLfzcbdVdj
         hrxg==
X-Gm-Message-State: APjAAAWUAlZGfv5gfXFneizoTcO5fxjKof1h0gonqvZOagLXR3+vWuQa
        liy3cZyeY//HE1ixBgdatPszxSF7zisM1Mp05iWb+Q==
X-Google-Smtp-Source: APXvYqxXaOqF5RRBCXB80/95e7xeSGrR7pmCNocEcu0xOUXI3fgjJxuQ9h/mlMMoIKtHtT+m3VHnkUsDG4t42Tr1goI=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr12871326qtb.278.1581940546729;
 Mon, 17 Feb 2020 03:55:46 -0800 (PST)
MIME-Version: 1.0
References: <77c1e557-4941-3806-2933-6c3583576390@infradead.org> <20200203174937.GA18628@roeck-us.net>
In-Reply-To: <20200203174937.GA18628@roeck-us.net>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 17 Feb 2020 19:55:36 +0800
Message-ID: <CANMq1KB28PZhrh4VKurN+oXrQx4xdM31sfk82_j09CQa5Ek8mA@mail.gmail.com>
Subject: Re: [PATCH -next] watchdog: fix mtk_wdt.c RESET_CONTROLLER build error
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 4, 2020 at 1:49 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Feb 03, 2020 at 08:10:29AM -0800, Randy Dunlap wrote:
> > From: Randy Dunlap <rdunlap@infradead.org>
> >
> > Fix build error when CONFIG_RESET_CONTROLLER is not set by
> > selecting RESET_CONTROLLER.
> >
> > ld: drivers/watchdog/mtk_wdt.o: in function `mtk_wdt_probe':
> > mtk_wdt.c:(.text+0x3ec): undefined reference to `devm_reset_controller_register'
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-watchdog@vger.kernel.org
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Wim: Can you please help pick this patch? This seems necessary.

I'd also add this to the commit message:
Fixes: c254e103082b74e ("watchdog: mtk_wdt: mt8183: Add reset controller")

Thanks!


> > ---
> >  drivers/watchdog/Kconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- linux-next-20200203.orig/drivers/watchdog/Kconfig
> > +++ linux-next-20200203/drivers/watchdog/Kconfig
> > @@ -841,6 +841,7 @@ config MEDIATEK_WATCHDOG
> >       tristate "Mediatek SoCs watchdog support"
> >       depends on ARCH_MEDIATEK || COMPILE_TEST
> >       select WATCHDOG_CORE
> > +     select RESET_CONTROLLER
> >       help
> >         Say Y here to include support for the watchdog timer
> >         in Mediatek SoCs.
> >
> >
