Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CB945EFFF
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 15:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377668AbhKZOlG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 09:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377828AbhKZOjG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 09:39:06 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB14C0619DE;
        Fri, 26 Nov 2021 06:03:25 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w1so39517069edc.6;
        Fri, 26 Nov 2021 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBMGUDVxwKtvGxZl8Me4y2JzyAcn1+e3Ny5rJgr5yXo=;
        b=GTvJ+9xGy0b+U9k5O+gjafXYaURTKxwOjBRV82D0mrG4fmhpjqkJSx/m14EMsuLBgy
         xWVBppUlJvyRIaID1UHB4qCw45EEeWY9CCKPtgqH9FdbfKkJtGDh6W1ABKhsk5XD9pG/
         +CjLOF5PlKRtNZRKinhuNaVP30boQ/ZRARpSE1QPYN9zVtMnS/w623fEPkugwgbQldmE
         jea4JICn6QFcOiaFxxMscNlSfR2QwHtKNlg9pgCvFUnDSKn7yed6m2E11K3p39RuS9Xg
         CHPr2DXhgFfZ3e31K5VY+ZJgzhVN9LqkDXg0Ml1z2gi/wwtWz7JhqmZm35kR60tNaN2X
         h7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBMGUDVxwKtvGxZl8Me4y2JzyAcn1+e3Ny5rJgr5yXo=;
        b=BdNSk8VU/2NiaiI06caXgd0DWFMzX1jkhKQ/gvXxiWjAzRh2CGm9QIHKzvD9Rc2e43
         g2bxXKaoaT+tEHLJK6+PBXihMXZlPHRT6BQq5YA2AJI8VgREUBQXhhC5t4ce9SkcPmU0
         V0ol9ZiHqgyo5kIOuO/0vBg4udHj30SYNHNhh9ywFOqTdkiParGwXzRqTcnYPX2ndFdK
         wXKGk1i/wc+ajArPVLv5JGFo/JIVxfexa/KeDahcFqp9OD2AcvfkwRU2yNpuusAAfjC5
         /A7gY6HYz9EPnmBp8ya+Nsq+Fcw/KZOryLSkYUvtPA1wsM3hZXHMhbeZjCQbWOEQVMMo
         cEpg==
X-Gm-Message-State: AOAM533hyHwYRt/arfNneOPdwyEQKQ9+GHIb13WPUpYbTug6wjxOah0g
        FxcXjBgFbmTbpfifs832OkUH0PAZYt9+EDrUzEY=
X-Google-Smtp-Source: ABdhPJwQcvfywxLUOt/7eTZuUFffT9ho18Gm9PwKOl+HSnZEPb47vv8qfxiuT32OkPVQ9/VpvEuQO9pn+dI3MI5yF/U=
X-Received: by 2002:a50:d741:: with SMTP id i1mr47189263edj.37.1637935404131;
 Fri, 26 Nov 2021 06:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com> <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20211126142827.78d2348d@md1za8fc.ad001.siemens.net>
In-Reply-To: <20211126142827.78d2348d@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 16:02:48 +0200
Message-ID: <CAHp75VeX89T7t=Q7-q56sndbfRyuPDEUjSMsMFo4sS8cb9AAmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 26, 2021 at 3:28 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Tue, 30 Mar 2021 14:04:35 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > <henning.schild@siemens.com> wrote:

...

> > > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > > +       { }
> > > +};
> >
> > It seems to me like poking GPIO controller registers directly. This
> > is not good. The question still remains: Can we simply register a
> > GPIO (pin control) driver and use an LED GPIO driver with an
> > additional board file that instantiates it?
>
> The short answer for v4 will be "No we can not!". The pinctrl drivers
> do not currently probe on any of the devices and attempts to fix that
> have failed or gut stuck. I tried to help out where i could and waited
> for a long time.

I see, unfortunately I have stuck with some other (more important
tasks) and can't fulfil this, but I still consider it's no go for
driver poking pin control registers directly. Lemme see if I can
prioritize this for next week.

> Now my take is to turn the order around. We go in like that and will
> happily switch to pinctrl if that ever comes up on the machines.
> Meaning P2SB series on top of this, no more delays please.

I don't want to slip bad code into the kernel where we can avoid that.

> We do use request_region so have a mutex in place. Meaning we really
> only touch GPIO while pinctrl does not!

I haven't got this. On Intel SoCs GPIO is a part of pin control
registers. You can't touch GPIO without touching pin control.

> I see no issue here, waited for a long time and now expect to be
> allowed to get merged first.

Okay, I have these questions / asks so far:
1) Can firmware be fixed in order to provide an ACPI table for the pin
control devices?
2) Can you share firmware (BIOS ROM file I suppose) that I may flash
on an Apollo Lake machine and see if I can reproduce the issue?
3) As may be a last resort, can you share (remotely) or even send to
us the device in question to try?

-- 
With Best Regards,
Andy Shevchenko
