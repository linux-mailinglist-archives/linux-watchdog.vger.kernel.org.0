Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC61735142A
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Apr 2021 13:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbhDALFO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Apr 2021 07:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbhDALFI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Apr 2021 07:05:08 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99026C0613E6;
        Thu,  1 Apr 2021 04:05:08 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id gb6so985729pjb.0;
        Thu, 01 Apr 2021 04:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrUEeBItpHwXb2zkwPEmfBcEOiKyaLjDCMMacKHkExg=;
        b=FqJiPe3UqWPf36sK5sraHSf7KF9T8xUT8laNp2UNhGPFabncaZIfBO+QStJcFVcbeJ
         /cqYXtLhrgPgT6U0LS4K8axmKw7oPISXBt/35JipmWhazY86szZEE1VRZ+ehq/hCojhm
         QoLeCWobfXnVKrOiT9DgeuijP4RxX89qlCAbJ1nz8Y12fZJ4P7VVnjuQPggPtdvnamTG
         yUZw/flnno1dCZaMaFerd9nIDk1++p8A9n38OcrsTR0sUBlt10lIZhkM+HsL/IqSbh1I
         QliFMaiFPqdC8kmqooOcmbhvEOeqCtyKkC4IwEgmNA3SAt2+VXy/c3wA+JyII3vI85hl
         scWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrUEeBItpHwXb2zkwPEmfBcEOiKyaLjDCMMacKHkExg=;
        b=rFqNXBmui+AONMiAqHnSFwqzk1NsjSk5ozZSusFG2z0dKMLiBIWC8cqNgKf7Za3qJo
         9k7vcWESO5S7cUAo8RZf5XBgPIcsVud6eAgcFvLD/EdkEZuwlOMOHW4SCdQep5PEV79e
         XwQqrWy+Yqnh9+ssPYr1v3WsDAr+xYoI4ZBvUU8DpCr1ZS/ePLgIZB5Q6HZ/0d2LiW2E
         6eHyVdtU0nzZak3SG2yULuS6fStesCWWY6Bj+wTl6rPlpkzWRO47ZagR43OIggJMJ1Dd
         2s6P29iFi+/7tbzBoeFcqqXMiV66AlEpHht4Kx5lFKqB6QbsmwfnMpdOpV+iQ8sAj/J6
         KPpw==
X-Gm-Message-State: AOAM532Oc6dUwjudPMIHJQhrq7CJl9NtMUz+Lihgsd5WSNcmsHxO+9Xy
        DImtN2J27VtxsVaN6A7iBa/yfo4Uq0QkS0VF29g=
X-Google-Smtp-Source: ABdhPJyHjtADObihZXxEJ9xmXmS8A6qv6dA+h925u9DoXHtafhKY2y+djom7gruzHp422cEn1GInwkwHkccNnaGKFrk=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr7560833plb.21.1617275108048; Thu, 01 Apr
 2021 04:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com> <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20210330135808.373c3308@md1za8fc.ad001.siemens.net> <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
 <20210330143011.0e8ae4a0@md1za8fc.ad001.siemens.net> <CAHp75VceCsuANZpib6HXJvxgMdJhmr8KPTZgThxKvXq6Yotymg@mail.gmail.com>
 <20210330172305.67b6e050@md1za8fc.ad001.siemens.net> <CAHp75VcSwW42_oQDpxn34gN7+aJNmB=HdJUbaWsYkBokYAHkSA@mail.gmail.com>
 <20210401124415.3c9321c0@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210401124415.3c9321c0@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Apr 2021 14:04:51 +0300
Message-ID: <CAHp75VcU-7-BVum4xuuQcG7NZZc9xXOoXYpfSBUwwPr6iZLWGg@mail.gmail.com>
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

On Thu, Apr 1, 2021 at 1:44 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Am Wed, 31 Mar 2021 18:40:23 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
>
> > On Tue, Mar 30, 2021 at 6:33 PM Henning Schild
> > <henning.schild@siemens.com> wrote:
> > > Am Tue, 30 Mar 2021 15:41:53 +0300
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > On Tue, Mar 30, 2021 at 3:35 PM Henning Schild
> > > > <henning.schild@siemens.com> wrote:
> > > > > Am Tue, 30 Mar 2021 15:15:16 +0300
> > > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > > > On Tue, Mar 30, 2021 at 2:58 PM Henning Schild
> > > > > > <henning.schild@siemens.com> wrote:
> > > > > > > Am Tue, 30 Mar 2021 14:04:35 +0300
> > > > > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > > > > > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > > > > > > > <henning.schild@siemens.com> wrote:
> > > >
> > > > > > > > > +static struct simatic_ipc_led simatic_ipc_leds_mem[] =
> > > > > > > > > {
> > > > > > > > > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS
> > > > > > > > > "-1"},
> > > > > > > > > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS
> > > > > > > > > "-1"},
> > > > > > > > > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS
> > > > > > > > > "-2"},
> > > > > > > > > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS
> > > > > > > > > "-2"},
> > > > > > > > > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS
> > > > > > > > > "-3"},
> > > > > > > > > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS
> > > > > > > > > "-3"},
> > > > > > > > > +       { }
> > > > > > > > > +};
> > > > > > > >
> > > > > > > > It seems to me like poking GPIO controller registers
> > > > > > > > directly. This is not good. The question still remains:
> > > > > > > > Can we simply register a GPIO (pin control) driver and
> > > > > > > > use an LED GPIO driver with an additional board file that
> > > > > > > > instantiates it?
> > > > > > >
> > > > > > > I wrote about that in reply to the cover letter. My view is
> > > > > > > still that it would be an abstraction with only one user,
> > > > > > > just causing work and likely not ending up as generic as it
> > > > > > > might eventually have to be.
> > > > > > >
> > > > > > > The region is reserved, not sure what the problem with the
> > > > > > > "poking" is.
> > > > > >
> > > > > >
> > > > > > > Maybe i do not understand all the benefits of such a split
> > > > > > > at this point in time. At the moment i only see work with
> > > > > > > hardly any benefit, not just work for me but also for
> > > > > > > maintainers. I sure do not mean to be ignorant. Maybe you
> > > > > > > go into details and convince me or we wait for other
> > > > > > > peoples opinions on how to proceed, maybe there is a second
> > > > > > > user that i am not aware of? Until i am convinced otherwise
> > > > > > > i will try to argue that a single-user-abstraction is
> > > > > > > needless work/code, and should be done only when actually
> > > > > > > needed.
> > > > > >
> > > > > > I have just read your messages (there is a cover letter and
> > > > > > additional email which was sent lately).
> > > > > >
> > > > > > I would like to know what the CPU model number on that board
> > > > > > is. Than we can continue to see what possibilities we have
> > > > > > here.
> > > > >
> > > > > I guess we are talking about the one that uses memory mapped,
> > > > > that is called an "IPC127E" and seems to have either Intel Atom
> > > > > E3940 or E3930 which seems to be Apollo Lake.
> > > >
> > > > Yep. And now the question, in my patch series you should have got
> > > > the apollolake-pinctrl driver loaded (if not, we have to
> > > > investigate why it's not being instantiated). This will give you
> > > > a read GPIO driver.
> > >
> > > Ok, so there is the existing driver i asked about several times.
> > > Thanks for pointing it out.
> >
> > If you remember, I asked you about the chip twice :-)
> > I assumed that we were talking about Apollo Lake and that's why I
> > insisted that the driver is in the kernel source tree.
>
> Sorry, maybe i did not get the context of your question and which of
> the machines you asked about. Now it is clear i guess.
>
> >
> > > > So, you may use regular LED GPIO on top of it
> > > > (https://elixir.bootlin.com/linux/latest/source/drivers/leds/leds-gpio.c).
> > > > I would like to understand why it can't be achieved.
> > >
> > > Will have a look. Unfortunately this one box is missing in my
> > > personal collection, but let us assume that one can be converted to
> > > that existing driver.
> >
> > OK!
> >
> > > I guess that will still mean the PIO-based part of the LED driver
> > > will have to stay as is.
> >
> > Probably yes. I haven't looked into that part and I have no idea
> > what's going on on that platform(s).
> >
>
> Which i guess means the series can be reviewed as if the mmio bits for
> that apollo lake would not be in it, maybe i will even send a version
> without that one box. We have others in the "backlog" might as well
> delay that one if it helps sorting out a base-line.

It depends on the role of P2SB in this case.
Shouldn't you drop that completely out from this series?

Otherwise we have to understand what to do with it.
It seems the best approach can be to expose the P2SB device to Linux,
but we have to answer to Bjorn's request about region reservations.


-- 
With Best Regards,
Andy Shevchenko
