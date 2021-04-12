Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA63935CC2E
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Apr 2021 18:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244198AbhDLQ1e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Apr 2021 12:27:34 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:33074 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244256AbhDLQZb (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Apr 2021 12:25:31 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13CGOrbd017425
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 18:24:53 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.41.180])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 13CGHbNR028068;
        Mon, 12 Apr 2021 18:17:37 +0200
Date:   Mon, 12 Apr 2021 18:17:36 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
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
Message-ID: <20210412181736.6b18f667@md1za8fc.ad001.siemens.net>
In-Reply-To: <610b566d-10a8-fa6b-145d-db7a453f97cf@roeck-us.net>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-4-henning.schild@siemens.com>
        <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
        <20210412173531.4140e461@md1za8fc.ad001.siemens.net>
        <610b566d-10a8-fa6b-145d-db7a453f97cf@roeck-us.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 12 Apr 2021 09:06:10 -0700
schrieb Guenter Roeck <linux@roeck-us.net>:

> On 4/12/21 8:35 AM, Henning Schild wrote:
> > Am Thu, 1 Apr 2021 18:15:41 +0200
> > schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
> >   
> >> On 29.03.21 19:49, Henning Schild wrote:
> >>
> >> Hi,
> >>  
> >>> This driver adds initial support for several devices from Siemens.
> >>> It is based on a platform driver introduced in an earlier commit.
> >>>    
> >>
> >> Where does the wdt actually come from ?
> >>
> >> Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a
> >> pretty usual case.
> >>
> >> Or some external chip ?
> >>
> >> The code smells a bit like two entirely different wdt's that just
> >> have some similarities. If that's the case, I'd rather split it
> >> into two separate drivers and let the parent driver (board file)
> >> instantiate the correct one.  
> > 
> > In fact they are the same watchdog device. The only difference is
> > the "secondary enable" which controls whether the watchdog causes a
> > reboot or just raises an alarm. The alarm feature is not even
> > implemented in the given driver, we just enable that secondary
> > enable regardless. 
> 
> Confusing statement; I can't parse "we just enable that secondary
> enable regardless". What secondary enable do you enable ?
>
> The code says "set safe_en_n so we are not just WDIOF_ALARMONLY",
> which suggests that it disables the alarm feature, and does make
> sense.

Yes go with the second statement. But the alarm is the default after
boot, and turning it off needs to be done with p2sb gpio on the 427.
 
> > In one range of devices (227E) that second enable is part of a
> > pio-based control register. On the other range (427E) it
> > unfortunately is a P2SB gpio, which gets us right into the
> > discussion we have around the LEDs.
> > With that i have my doubts that two drivers would be the way to go,
> > most likely not. 
> >   
> 
> Reading the code again, I agree. Still, you'll need to sort out how
> to determine if the watchdog or the LED driver should be enabled,
> and how to access the gpio port. The GPIO pin detection and use
> for 427E is a bit awkward.

Yes it is awkward, and that is exactly the discussion happening for the
LEDs. Using generic GPIO code, the mail was more to Andy as i am hoping
he might help me connect the dots here. On the other hand i wanted wdt
discussions in the wdt thread, and not talk about that one gpio-pin in
the LED thread.

regards,
Henning

> Thanks,
> Guenter
> 
> > Only that i have no clue which pinctrl driver should be used here.
> > My guess is "sunrisepoint" because the CPUs are "SkyLake" i.e.
> > i5-6442EQ, i3-6102E
> > And "grep INT344B /sys/firmware/acpi/tables/DSDT" matches. I booted
> > a kernel patched with the series from Andy but the
> > "pinctrl-sunrisepoint" does not seem to even claim the memory.
> > Still trying to understand how to make use of these pinctrl drivers
> > they are in place but i lack example users (drivers). If they
> > should be available in sysfs, i might be looking at the wrong place
> > ... /sys/class/gpio/ does not list anything
> > 
> > regards,
> > Henning
> > 
> > 
> >   
> >>
> >> --mtx
> >>  
> >   
> 

