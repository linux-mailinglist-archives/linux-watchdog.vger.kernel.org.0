Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA97B45F063
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 16:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377973AbhKZPPg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 10:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344509AbhKZPNg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 10:13:36 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C95C06175A;
        Fri, 26 Nov 2021 07:00:31 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r11so40105678edd.9;
        Fri, 26 Nov 2021 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=50hXXSJ/Bn2TowX+VBnx72Gqe053RSFFfuTClPYwJAA=;
        b=NjbqM5Cks6YZBIQfBGqE0zlmyNfk4bltTn5ZPtxW2K4NttJo0YgQc9JTT/8KBUeMjJ
         ktyiqYiVHQjVWhm7su1AXpWu9Ne1/39rbT9RN4TIOVTeRKEn0FzKWQcly/b+3D/tzvb9
         ijzTnKPP5ELU5laCCatS8+YQcDZoB2QIs6j9g+jFFfBtQVWnogHUH9eA9ymDWYwUZcj6
         ADXl66QTBKcr/xnFOAtV9RS+y3Jt1BU24R+MNdN+r2XBQ+L122swiKgtEBv8QCrTGlAf
         kIlcZuSfUSDpj0NrT4DcMsWCTuWLTZg5ZwqFiADlXdzlQUJlkkETPRMiuqQRzjnpiSTf
         F11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=50hXXSJ/Bn2TowX+VBnx72Gqe053RSFFfuTClPYwJAA=;
        b=ZcixVsAUU+PXanYgkSx/L+MyKfy3svdmWIav22NwSnzBg3y02KM9AmKmeJO62DN3N8
         eYfSFSCNxM8VQ3sT1VaSpEjPx3fqaASggylx0TldV2UuMeeCmqc/YM+0j7RfFE9M37jD
         i7bd9M01Xbognh5Zy9/9A58DXmyPZ4ow04EcWjyC72alPY3PZaU95JDaWJX59sGCe+nk
         6G+5ucBPbgndVST9DUbwAgIWS4eYG3VHuPZyqcEwrdqP5NRBMJEpULzezaanhhx6GgQa
         ERW0RUK1wIMYL5GS6OjEFaSZunMPj/ICV2vArbE43+x5yQ1ZclPaa/gWIIiwshzS8x5f
         TIVw==
X-Gm-Message-State: AOAM531aZXl2D3ShskkPD9FktZZHYFVOrBfXznPGyJJ4hNG7cckshpuj
        e3XtMKp5oz69ZY7/EKaKVp9GIMZJbsW+IKLmSU8=
X-Google-Smtp-Source: ABdhPJz9Zi/JX2OqKJSouxPiqAttoVrJL0698pUbrKssQq8xvW98Kj+7x7P+TTs0Y1hoXkg10lYejrYTsLkdmszJmeU=
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr38604674ejq.567.1637938830024;
 Fri, 26 Nov 2021 07:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com> <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20211126142827.78d2348d@md1za8fc.ad001.siemens.net> <CAHp75VeX89T7t=Q7-q56sndbfRyuPDEUjSMsMFo4sS8cb9AAmw@mail.gmail.com>
 <20211126154427.41bf024e@md1za8fc.ad001.siemens.net>
In-Reply-To: <20211126154427.41bf024e@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 16:59:54 +0200
Message-ID: <CAHp75Ve+2HXNP0R-45a9Zkspf4TLTdr2xApHr8ww=BOtp=P4HQ@mail.gmail.com>
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

On Fri, Nov 26, 2021 at 4:44 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Fri, 26 Nov 2021 16:02:48 +0200
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Fri, Nov 26, 2021 at 3:28 PM Henning Schild
> > <henning.schild@siemens.com> wrote:
> > > Am Tue, 30 Mar 2021 14:04:35 +0300
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > > > <henning.schild@siemens.com> wrote:

...

> > > > > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > > > > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > > > > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > > > > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > > > > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > > > > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > > > > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > > > > +       { }
> > > > > +};
> > > >
> > > > It seems to me like poking GPIO controller registers directly.
> > > > This is not good. The question still remains: Can we simply
> > > > register a GPIO (pin control) driver and use an LED GPIO driver
> > > > with an additional board file that instantiates it?
> > >
> > > The short answer for v4 will be "No we can not!". The pinctrl
> > > drivers do not currently probe on any of the devices and attempts
> > > to fix that have failed or gut stuck. I tried to help out where i
> > > could and waited for a long time.
> >
> > I see, unfortunately I have stuck with some other (more important
> > tasks) and can't fulfil this, but I still consider it's no go for
> > driver poking pin control registers directly. Lemme see if I can
> > prioritize this for next week.
>
> I just sent v4. And am sick of waiting on you. Sorry to be that clear
> here. I want that order changed! If you still end up being fast,
> perfect. But i want to be faster!

It's good that you are honest, honesty is what we missed a lot!

> > > Now my take is to turn the order around. We go in like that and will
> > > happily switch to pinctrl if that ever comes up on the machines.
> > > Meaning P2SB series on top of this, no more delays please.
> >
> > I don't want to slip bad code into the kernel where we can avoid that.
>
> It is not bad code! That is unfair to say. It can be improved on and
> that is what we have a FIXME line for. The worst code is code that is
> not there ... devices without drivers!

Okay, that's how you interpret the term "bad". Probably I had to use
something else to explain that it's racy with the very same case if
one adds an ACPI support to it.

> That is bad, not i minor poke of parts of a resource no other driver
> claimed!
>
> > > We do use request_region so have a mutex in place. Meaning we really
> > > only touch GPIO while pinctrl does not!
> >
> > I haven't got this. On Intel SoCs GPIO is a part of pin control
> > registers. You can't touch GPIO without touching pin control.
>
> i meant pin control, if it ever did probe it would reserve the region
> and push our hack out, or the other way around ... no conflict!
> To get both we just need a simple patch and switch to pinctrl, just
> notify me once your stuff is ready and i will write that patch.

While thinking more on it, the quickest solution here is to do a P2SB
game based on DMI strings in the board code for the platform
(somewhere under PDx86).

> > > I see no issue here, waited for a long time and now expect to be
> > > allowed to get merged first.
> >
> > Okay, I have these questions / asks so far:
> > 1) Can firmware be fixed in order to provide an ACPI table for the pin
> > control devices?
>
> No. The firmware will only receive security but no feature updates ...
>
> > 2) Can you share firmware (BIOS ROM file I suppose) that I may flash
> > on an Apollo Lake machine and see if I can reproduce the issue?
>
> I do not have access. But all you need is a firware with no ACPI entry
> and P2SB hidden. Or simply patch out the two probe paths ;).

Yes, probably that will work.

> > 3) As may be a last resort, can you share (remotely) or even send to
> > us the device in question to try?
>
> We are talking about multiple devices. Not just that one apollo lake on
> which your patches kind of worked.
>
> But showed some weirdness which could really become a problem if
> someone decided to add an ACPI entry ..

Then it should have different DMI strings or so, it won't be the
_same_ platform anymore.

> It pin 42 name could be
> GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 42
> or
> GPIO_LOOKUP_IDX("INT3452:01", 42

> I guess that conflict will have to be dealt with before your can switch
> to probing pinctrl drivers based on cpu model and not only ACPI/P2SB any
> longer.

Not gonna happen.

-- 
With Best Regards,
Andy Shevchenko
