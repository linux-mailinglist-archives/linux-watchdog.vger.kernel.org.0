Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B1434E78D
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Mar 2021 14:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbhC3MgJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Mar 2021 08:36:09 -0400
Received: from gecko.sbs.de ([194.138.37.40]:51469 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231574AbhC3Mfh (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Mar 2021 08:35:37 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12UCZDt4014325
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Mar 2021 14:35:13 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.2.166])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12UCUC4i018161;
        Tue, 30 Mar 2021 14:30:12 +0200
Date:   Tue, 30 Mar 2021 14:30:11 +0200
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
Message-ID: <20210330143011.0e8ae4a0@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-3-henning.schild@siemens.com>
        <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
        <20210330135808.373c3308@md1za8fc.ad001.siemens.net>
        <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Tue, 30 Mar 2021 15:15:16 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Tue, Mar 30, 2021 at 2:58 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> > Am Tue, 30 Mar 2021 14:04:35 +0300
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:  
> > > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > > <henning.schild@siemens.com> wrote:  
> > > >
> > > > This driver adds initial support for several devices from
> > > > Siemens. It is based on a platform driver introduced in an
> > > > earlier commit.  
> > >
> > > ...
> > >  
> > > > +#define SIMATIC_IPC_LED_PORT_BASE      0x404E  
> > >  
> > > > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > > > +       {1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
> > > > +       {1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
> > > > +       {1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
> > > > +       {1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
> > > > +       {1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
> > > > +       {1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
> > > > +       { }
> > > > +};  
> > >  
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
> > I wrote about that in reply to the cover letter. My view is still
> > that it would be an abstraction with only one user, just causing
> > work and likely not ending up as generic as it might eventually
> > have to be.
> >
> > The region is reserved, not sure what the problem with the "poking"
> > is.  
> 
> 
> > Maybe i do not understand all the benefits of such a split at this
> > point in time. At the moment i only see work with hardly any
> > benefit, not just work for me but also for maintainers. I sure do
> > not mean to be ignorant. Maybe you go into details and convince me
> > or we wait for other peoples opinions on how to proceed, maybe
> > there is a second user that i am not aware of?
> > Until i am convinced otherwise i will try to argue that a
> > single-user-abstraction is needless work/code, and should be done
> > only when actually needed.  
> 
> I have just read your messages (there is a cover letter and additional
> email which was sent lately).
> 
> I would like to know what the CPU model number on that board is. Than
> we can continue to see what possibilities we have here.

I guess we are talking about the one that uses memory mapped, that is
called an "IPC127E" and seems to have either Intel Atom E3940 or E3930
which seems to be Apollo Lake.

Henning
