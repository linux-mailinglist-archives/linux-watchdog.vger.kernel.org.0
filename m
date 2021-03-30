Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B104C34E7A9
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Mar 2021 14:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhC3Mmk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Mar 2021 08:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbhC3MmK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Mar 2021 08:42:10 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641DDC061574;
        Tue, 30 Mar 2021 05:42:10 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso9394615pji.3;
        Tue, 30 Mar 2021 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48tUu54cByxZHo/3axsPb6lFroueR0ATEX9TwKibhQM=;
        b=nmk4/47mAoZRN6qc0DYjBUtF2T2BdmmK5vP/PLO1Ql7xZDDttcocYTERJWcu5Awvgd
         rtRoIezc7VmNBUPm6kMJciEiOx8eAUPYv6B93nBCpCM1uAeq6HWHMZLZxGPdFqRd7KEj
         Nx4Z+lrWBqoz1alpTo5oYRuJx70lEHCc3eUPKfVUg12kpqKz7t9Uors+dPS6js7kq7+b
         jjvuxQy51Ys2EGYfLkY2T/uuN63OF8nGP7QkWH0IVfjKdTxA0ymqRjPLUhT969j4N4K5
         vJP5IjCclkXr18egR8q0cHHe8zW/Op1ozYZ641uBpfpbBZfcmzTc1Ibi3JyOobXPZMfZ
         fW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48tUu54cByxZHo/3axsPb6lFroueR0ATEX9TwKibhQM=;
        b=UycrMEYP77FdxjypR90/38vKMqFj7dpMyM2CL9y/scQd1/TCK2Q4G1V7NmFY3Ux2p9
         EOHB6VTFJ/UGKfXKVk2jaNldr8OtRYuhbm5n0oMLPKzFDty2bRdxiSeXvEVhZzV88cnl
         35/lJFHECOLJpii0RYspWiVCHpHT57zQ2CE8TOXsnhj0A/KFmNdTsHXIyYQGyQLdvV0G
         ss9rlAMCals68nLrctoMv8Ba2AT2bjK4JSOqcFcbfzPjRjM1BNJST0auK1NISkRF2QLB
         o6OvdBj9mcZMmost5dSlftSQe3l5jZZPnm+pDEisE7SldfGQfPv91nnWJZttGeSurDQ2
         e8Og==
X-Gm-Message-State: AOAM532W4DIGLv2BQPr4QYqSgiS3RIjoW0mLiloRf8EtoVSN8DKK4ryD
        CzmkQiCEsKtsUy1zh1O1Wsi0Y9ryxjMvqjEYRYZBBvXtXBBnKyQm
X-Google-Smtp-Source: ABdhPJxqccrN/RIign4IMW4LMZUmK33dcsoq2xGOJlRGeopU16QDRQUYLMXXyJaZ2gLFgMTxBir84hi5ovZVnAP9Czw=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr4306008pjb.129.1617108129895;
 Tue, 30 Mar 2021 05:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com> <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20210330135808.373c3308@md1za8fc.ad001.siemens.net> <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
 <20210330143011.0e8ae4a0@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210330143011.0e8ae4a0@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 15:41:53 +0300
Message-ID: <CAHp75VceCsuANZpib6HXJvxgMdJhmr8KPTZgThxKvXq6Yotymg@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 3:35 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Tue, 30 Mar 2021 15:15:16 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Tue, Mar 30, 2021 at 2:58 PM Henning Schild
> > <henning.schild@siemens.com> wrote:
> > > Am Tue, 30 Mar 2021 14:04:35 +0300
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > > > <henning.schild@siemens.com> wrote:

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
> > > I wrote about that in reply to the cover letter. My view is still
> > > that it would be an abstraction with only one user, just causing
> > > work and likely not ending up as generic as it might eventually
> > > have to be.
> > >
> > > The region is reserved, not sure what the problem with the "poking"
> > > is.
> >
> >
> > > Maybe i do not understand all the benefits of such a split at this
> > > point in time. At the moment i only see work with hardly any
> > > benefit, not just work for me but also for maintainers. I sure do
> > > not mean to be ignorant. Maybe you go into details and convince me
> > > or we wait for other peoples opinions on how to proceed, maybe
> > > there is a second user that i am not aware of?
> > > Until i am convinced otherwise i will try to argue that a
> > > single-user-abstraction is needless work/code, and should be done
> > > only when actually needed.
> >
> > I have just read your messages (there is a cover letter and additional
> > email which was sent lately).
> >
> > I would like to know what the CPU model number on that board is. Than
> > we can continue to see what possibilities we have here.
>
> I guess we are talking about the one that uses memory mapped, that is
> called an "IPC127E" and seems to have either Intel Atom E3940 or E3930
> which seems to be Apollo Lake.

Yep. And now the question, in my patch series you should have got the
apollolake-pinctrl driver loaded (if not, we have to investigate why
it's not being instantiated). This will give you a read GPIO driver.
So, you may use regular LED GPIO on top of it
(https://elixir.bootlin.com/linux/latest/source/drivers/leds/leds-gpio.c).
I would like to understand why it can't be achieved.

-- 
With Best Regards,
Andy Shevchenko
