Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0ED834E749
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Mar 2021 14:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhC3MP7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Mar 2021 08:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbhC3MPd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Mar 2021 08:15:33 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFC0C061574;
        Tue, 30 Mar 2021 05:15:33 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id p12so6937684pgj.10;
        Tue, 30 Mar 2021 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQL2oYFkG5vd+itMq4+E4VOAEnKIdQPKP6y6SbyqzVU=;
        b=TYBQIVu8VRUdehT+Bv32TVbEb1GzNKohXeDDCWikLat3CPfvcJjENxP3cMSoG9umxY
         5bfqf4/jHihULOio899alfoClGf+3rvm16+5SPIaz3WPfbX/nTSZ21Us9DDT1v1SV8x/
         s0cYXSfno8zyT4Q3D615EAoJRohr57ciLJ6EUV40kqpaPIAkNu/trNtGz5n4t61nvTzk
         45g5+7uy4haJkBYypZuKq5lRfA60uwPXexOOb0sdK7v9nvpPg87bBGIt9DRM7O4hqyeW
         1QfaHdUSDGDHeKNa9i8wKZTKzwVCycdayeDMPv9NTlTqZtb/CqoWW4KYHTzhp6Tr+XX7
         I4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQL2oYFkG5vd+itMq4+E4VOAEnKIdQPKP6y6SbyqzVU=;
        b=jsg0NpE5V8oAUDzpfJdsTphcTLY+DIzJzUSdS5KRsU4xrfNYqj6fWUSL9IGiVIIzFR
         SFpdDG3KH3k6aZYB6xIGKqSpsSP0FDnWYTBAqlyG7HmT/ZqOM1tQzpXh9eqf9GsG66Pg
         StnhyVlATLx305WAR/rGhzpy1TaNLHwNEx8CVpPw4AXOhqudXmJTuLPin47cT1rHMwS/
         LRBl6pwX3cZc9r8OQOx7KKQAPaVV7LcaBiCK2EjMCD1kvnTKgEhLOX9wc4HE+LdLZUb3
         JSgy8qEKs6Q6Y8BXsabUDuQaovck9hZRTeCtcGzARCFG401f6WbJUvrsOLNa+MygGpwj
         mO5Q==
X-Gm-Message-State: AOAM531XzHU6PjNsQKlozfGad2CEM3N26jSHsLPnpTBOOAX0sI26yJU5
        TZRg1nAdXqg3MezFS0pZBSkqcllcfewVS6NhEmbXWQxms0CNmg==
X-Google-Smtp-Source: ABdhPJz3dEMFP32aKfZjn59VWZyAyepiuQxSv9MTs4A3gDqQvVakpNjf5jW7q3Nnphy1cpFB1PW+fke5XcyG41FdhdU=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr30125371pff.73.1617106532719; Tue, 30
 Mar 2021 05:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com> <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20210330135808.373c3308@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210330135808.373c3308@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 15:15:16 +0300
Message-ID: <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 2:58 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Tue, 30 Mar 2021 14:04:35 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > <henning.schild@siemens.com> wrote:
> > >
> > > This driver adds initial support for several devices from Siemens.
> > > It is based on a platform driver introduced in an earlier commit.
> >
> > ...
> >
> > > +#define SIMATIC_IPC_LED_PORT_BASE      0x404E
> >
> > > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > > +       {1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
> > > +       {1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
> > > +       {1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
> > > +       {1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
> > > +       {1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
> > > +       {1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
> > > +       { }
> > > +};
> >
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
> I wrote about that in reply to the cover letter. My view is still that
> it would be an abstraction with only one user, just causing work and
> likely not ending up as generic as it might eventually have to be.
>
> The region is reserved, not sure what the problem with the "poking" is.


> Maybe i do not understand all the benefits of such a split at this
> point in time. At the moment i only see work with hardly any benefit,
> not just work for me but also for maintainers. I sure do not mean to be
> ignorant. Maybe you go into details and convince me or we wait for other
> peoples opinions on how to proceed, maybe there is a second user that i
> am not aware of?
> Until i am convinced otherwise i will try to argue that a
> single-user-abstraction is needless work/code, and should be done only
> when actually needed.

I have just read your messages (there is a cover letter and additional
email which was sent lately).

I would like to know what the CPU model number on that board is. Than
we can continue to see what possibilities we have here.

-- 
With Best Regards,
Andy Shevchenko
