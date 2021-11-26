Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A156345EF03
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 14:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243309AbhKZNYQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 08:24:16 -0500
Received: from gecko.sbs.de ([194.138.37.40]:53534 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232058AbhKZNWQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 08:22:16 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQDIGi1027289
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 14:18:16 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQDIF6d021653;
        Fri, 26 Nov 2021 14:18:15 +0100
Date:   Fri, 26 Nov 2021 14:18:14 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
Message-ID: <20211126141814.044c27ec@md1za8fc.ad001.siemens.net>
In-Reply-To: <e36d8b9f-42a1-0d8c-a4cc-f497acd155fe@roeck-us.net>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-4-henning.schild@siemens.com>
        <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
        <20210406165247.78791bf7@md1za8fc.ad001.siemens.net>
        <CAHp75VcOw0WD8s9ZP=-N5Gesmfx0UEkV5s7SSwDwCzYDYoVuPg@mail.gmail.com>
        <e36d8b9f-42a1-0d8c-a4cc-f497acd155fe@roeck-us.net>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Wed, 7 Apr 2021 05:17:12 -0700
schrieb Guenter Roeck <linux@roeck-us.net>:

> On 4/7/21 1:53 AM, Andy Shevchenko wrote:
> > On Tue, Apr 6, 2021 at 5:56 PM Henning Schild
> > <henning.schild@siemens.com> wrote:  
> >>
> >> Am Thu, 1 Apr 2021 18:15:41 +0200
> >> schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
> >>  
> >>> On 29.03.21 19:49, Henning Schild wrote:
> >>>
> >>> Hi,
> >>>  
> >>>> This driver adds initial support for several devices from
> >>>> Siemens. It is based on a platform driver introduced in an
> >>>> earlier commit.  
> >>>
> >>> Where does the wdt actually come from ?
> >>>
> >>> Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a
> >>> pretty usual case.
> >>>
> >>> Or some external chip ?  
> >>
> >> I guess external chip, but again we are talking about multiple
> >> machines. And the manuals i read so far do not go into that sort of
> >> detail. In fact on some of the machines you will have two
> >> watchdogs, one from the SoC and that "special" one.
> >> That has several reasons, probably not too important here. The HW
> >> guys are adding another wd not just for fun, and it would be nice
> >> to have a driver.
> >>  
> >>> The code smells a bit like two entirely different wdt's that just
> >>> have some similarities. If that's the case, I'd rather split it
> >>> into two separate drivers and let the parent driver (board file)
> >>> instantiate the correct one.  
> >>
> >> Yes, it is two. Just like for the LEDs. One version PIO-based
> >> another version gpio/p2sb/mmio based.  
> > 
> > I tend to agree with Enrico that this should be two separate
> > drivers. 
> 
> Agreed.
> 
> Guenter

I will ignore the wish for a split in v4. Reason is that it would cause
a lot of duplication are spreading code over many files. like i.e. a
-common.c

Internally we have that driver in fact already support a few more
machines, which could call a split at some point. Or could also upset
people of the many CONFIG_ knobs and files as we keep pushing machine
support forward in the upstream drivers.

But i would like to discuss that in patch qs coming after a merge and
not split (maybe not yet).

Also splitting wdt and having leds in one file would be inconsistent.
So when there will be a split it should be on both ends. But please
allow me to postpone that.

regards,
Henning

> >> In fact the latter should very likely be based on that gpio pinctl,
> >> whether it really needs to be a separate driver will have to be
> >> seen. There are probably pros and cons for both options.  
> > 
> >   
> 

