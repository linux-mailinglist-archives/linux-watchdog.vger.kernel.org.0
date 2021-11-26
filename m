Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FEF45F01B
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 15:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377811AbhKZOuG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 09:50:06 -0500
Received: from goliath.siemens.de ([192.35.17.28]:38507 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345231AbhKZOsG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 09:48:06 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AQEiT7E011393
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 15:44:29 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQEiRhZ027622;
        Fri, 26 Nov 2021 15:44:28 +0100
Date:   Fri, 26 Nov 2021 15:44:27 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20211126154427.41bf024e@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VeX89T7t=Q7-q56sndbfRyuPDEUjSMsMFo4sS8cb9AAmw@mail.gmail.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-3-henning.schild@siemens.com>
        <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
        <20211126142827.78d2348d@md1za8fc.ad001.siemens.net>
        <CAHp75VeX89T7t=Q7-q56sndbfRyuPDEUjSMsMFo4sS8cb9AAmw@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 26 Nov 2021 16:02:48 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Fri, Nov 26, 2021 at 3:28 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> > Am Tue, 30 Mar 2021 14:04:35 +0300
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:  
> > > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > > <henning.schild@siemens.com> wrote:  
> 
> ...
> 
> > > > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > > > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > > > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > > > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > > > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > > > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > > > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > > > +       { }
> > > > +};  
> > >
> > > It seems to me like poking GPIO controller registers directly.
> > > This is not good. The question still remains: Can we simply
> > > register a GPIO (pin control) driver and use an LED GPIO driver
> > > with an additional board file that instantiates it?  
> >
> > The short answer for v4 will be "No we can not!". The pinctrl
> > drivers do not currently probe on any of the devices and attempts
> > to fix that have failed or gut stuck. I tried to help out where i
> > could and waited for a long time.  
> 
> I see, unfortunately I have stuck with some other (more important
> tasks) and can't fulfil this, but I still consider it's no go for
> driver poking pin control registers directly. Lemme see if I can
> prioritize this for next week.

I just sent v4. And am sick of waiting on you. Sorry to be that clear
here. I want that order changed! If you still end up being fast,
perfect. But i want to be faster!

> > Now my take is to turn the order around. We go in like that and will
> > happily switch to pinctrl if that ever comes up on the machines.
> > Meaning P2SB series on top of this, no more delays please.  
> 
> I don't want to slip bad code into the kernel where we can avoid that.

It is not bad code! That is unfair to say. It can be improved on and
that is what we have a FIXME line for. The worst code is code that is
not there ... devices without drivers!
That is bad, not i minor poke of parts of a resource no other driver
claimed!

> > We do use request_region so have a mutex in place. Meaning we really
> > only touch GPIO while pinctrl does not!  
> 
> I haven't got this. On Intel SoCs GPIO is a part of pin control
> registers. You can't touch GPIO without touching pin control.

i meant pin control, if it ever did probe it would reserve the region
and push our hack out, or the other way around ... no conflict!
To get both we just need a simple patch and switch to pinctrl, just
notify me once your stuff is ready and i will write that patch.
 
> > I see no issue here, waited for a long time and now expect to be
> > allowed to get merged first.  
> 
> Okay, I have these questions / asks so far:
> 1) Can firmware be fixed in order to provide an ACPI table for the pin
> control devices?

No. The firmware will only receive security but no feature updates ...

> 2) Can you share firmware (BIOS ROM file I suppose) that I may flash
> on an Apollo Lake machine and see if I can reproduce the issue?

I do not have access. But all you need is a firware with no ACPI entry
and P2SB hidden. Or simply patch out the two probe paths ;). 

> 3) As may be a last resort, can you share (remotely) or even send to
> us the device in question to try?

We are talking about multiple devices. Not just that one apollo lake on
which your patches kind of worked.

But showed some weirdness which could really become a problem if
someone decided to add an ACPI entry ..

It pin 42 name could be 
GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 42
or
GPIO_LOOKUP_IDX("INT3452:01", 42

I guess that conflict will have to be dealt with before your can switch
to probing pinctrl drivers based on cpu model and not only ACPI/P2SB any
longer.

regards,
Henning
