Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4171134A556
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Mar 2021 11:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCZKL1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Mar 2021 06:11:27 -0400
Received: from gecko.sbs.de ([194.138.37.40]:41451 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230018AbhCZKLO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Mar 2021 06:11:14 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12QAAk4r016071
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Mar 2021 11:10:46 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.32.17])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12Q9tiJp011837;
        Fri, 26 Mar 2021 10:55:45 +0100
Date:   Fri, 26 Mar 2021 10:55:42 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
Message-ID: <20210326105542.10122edd@md1za8fc.ad001.siemens.net>
In-Reply-To: <420f0e08-bec8-f85a-d9af-b9900072df66@redhat.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-2-henning.schild@siemens.com>
        <CAHp75VdXDcTfNL9QRQ5XE-zVLHacfMKHUxhse3=dAfJbOJdObQ@mail.gmail.com>
        <20210317201311.70528fd4@md1za8fc.ad001.siemens.net>
        <92080a68-9029-3103-9240-65c92d17bf16@redhat.com>
        <6c7d165d-1332-2039-0af3-9875b482894b@metux.net>
        <420f0e08-bec8-f85a-d9af-b9900072df66@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Thu, 18 Mar 2021 12:45:01 +0100
schrieb Hans de Goede <hdegoede@redhat.com>:

> Hi,
> 
> On 3/18/21 12:30 PM, Enrico Weigelt, metux IT consult wrote:
> > On 17.03.21 21:03, Hans de Goede wrote:
> > 
> > Hi,
> >   
> >>> It just identifies the box and tells subsequent drivers which one
> >>> it is, which watchdog and LED path to take. Moving the knowledge
> >>> of which box has which LED/watchdog into the respective drivers
> >>> seems to be the better way to go.
> >>>
> >>> So we would end up with a LED and a watchdog driver both
> >>> MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");  
> > 
> > Uh, isn't that a bit too broad ? This basically implies that Siemens
> > will never produce boards with different configurations.  
> 
> There is a further check done in probe() based on some Siemens
> specific DMI table entries.
> 
> >>> and doing the identification with the inline dmi from that header,
> >>> doing p2sb with the support to come ... possibly a
> >>> "//TODO\ninline" in the meantime.
> >>>
> >>> So no "main platform" driver anymore, but still central platform
> >>> headers.
> >>>
> >>> Not sure how this sounds, but i think making that change should be
> >>> possible. And that is what i will try and go for in v3.  
> >>
> >> Dropping the main drivers/platform/x86 driver sounds good to me,
> >> I was already wondering a bit about its function since it just
> >> instantiates devs to which the other ones bind to then instantiate
> >> more devs (in the LED case).  
> > 
> > hmm, IMHO that depends on whether the individual sub-devices can be
> > more generic than just that specific machine. (@Hanning: could you
> > tell us more about that ?).
> > 
> > Another question is how they're actually probed .. only dmi or maybe
> > also pci dev ? (i've seen some refs to pci stuff in the led driver,
> > but missed the other code thats called here).
> > 
> > IMHO, if the whole thing lives on some PCI device (which can be
> > probed via pci ID), and that device has the knowledge, where the
> > LED registers actually are (eg. based on device ID, pci mmio
> > mapping, ...) then there should be some parent driver that
> > instantiates the led devices (and possibly other board specific
> > stuff). That would be a clear separation, modularization. In that
> > case, maybe this LED driver could even be replaced by some really
> > generic "register-based-LED" driver, which just needs to be fed
> > with some parameters like register ranges, bitmasks, etc.
> > 
> > OTOH, if everything can be derived entirely from DMI match, w/o
> > things like pci mappings involved (IOW: behaves like directly wired
> > to the cpu's mem/io bus, no other "intelligent" bus involved), and
> > it's all really board specific logic (no generic led or gpio
> > controllers involved), then it might be better to have entirely
> > separate drivers.  

In fact it does dmi and not "common" but unfortunately vendor-specific.
On top it does pci, so it might be fair to call it "intelligent" and
keep it.

> FWIW I'm fine with either solution, and if we go the "parent driver"
> route I'm happy to have that driver sit in drivers/platform/x86
> (once all the discussions surrounding this are resolved).
> 
> My reply was because I noticed that the Led driver seemed to sort of
> also act as a parent driver (last time I looked) and instantiated
> a bunch of stuff, so then we have 2 parent(ish) drivers. If things
> stay that way then having 2 levels of parent drivers seems a bit too
> much to me, esp. if it can all be done cleanly in e.g. the LED driver.

One "leds" driver doing multiple leds seems to be a common pattern. So
that "1 parent N children" maybe does not count as parentish.

> But as said I'm fine either way as long as the code is reasonably
> clean and dealing with this sort of platform specific warts happens
> a lot in drivers/platform/x86 .

I thought about it again and also prefer the "parent driver" idea as it
is. That parent identifies the machine and depending on it, causes
device drivers to be loaded. At the moment LED and watchdog, but with
nvram, hwmon to come.

I will stick with "platform" instead of "mfd" because it is really a
machine having multiple devices. Not a device having multiple functions.

regards,
Henning

> Regards,
> 
> Hans
> 

