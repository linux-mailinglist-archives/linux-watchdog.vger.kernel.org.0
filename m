Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6577445F395
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 19:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbhKZSRr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 13:17:47 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:59450 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229929AbhKZSPp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 13:15:45 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQIC5RD019147
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 19:12:05 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQIC4ie019339;
        Fri, 26 Nov 2021 19:12:04 +0100
Date:   Fri, 26 Nov 2021 19:12:03 +0100
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
Subject: Re: [PATCH v4 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20211126191203.663e0d90@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VcD0FQuG_AToNkVHHD9e6WV6=18P4U0cSi0qzD3FL=ssw@mail.gmail.com>
References: <20211126141027.16161-1-henning.schild@siemens.com>
        <20211126141027.16161-3-henning.schild@siemens.com>
        <CAHp75VcD0FQuG_AToNkVHHD9e6WV6=18P4U0cSi0qzD3FL=ssw@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 26 Nov 2021 17:02:00 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Fri, Nov 26, 2021 at 4:10 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> ...
> 
> > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > +       { }
> > +};  
> 
> Like I said, this is not okay.
> 
> Why can't you simply enable the pinctrl driver and use it?

I propose we set up a call, that might help clearing up the situation.
If you agree please send me an email and possibly propose a time-slot.
I would take it from there and send you a meeting link.

regards,
Henning

> 
> 

