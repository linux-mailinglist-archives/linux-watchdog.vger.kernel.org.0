Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CFD32FACB
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Mar 2021 14:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhCFNMD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 6 Mar 2021 08:12:03 -0500
Received: from gecko.sbs.de ([194.138.37.40]:46327 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhCFNMD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 6 Mar 2021 08:12:03 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 126DBZYo010323
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 6 Mar 2021 14:11:35 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.40.205])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 126D6XWf023339;
        Sat, 6 Mar 2021 14:06:33 +0100
Date:   Sat, 6 Mar 2021 14:06:33 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        "Hans de Goede" <hdegoede@redhat.com>
Subject: Re: [PATCH 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Message-ID: <20210306140633.57f28b05@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210306135453.6dc186d2@md1za8fc.ad001.siemens.net>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-3-henning.schild@siemens.com>
        <20210302205452.GA32573@duo.ucw.cz>
        <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
        <20210303193134.GB8720@amd>
        <20210303214810.511ad65a@md1za8fc.ad001.siemens.net>
        <20210303215615.64e45720@md1za8fc.ad001.siemens.net>
        <20210305192555.34f7ea0f@md1za8fc.ad001.siemens.net>
        <20210306135453.6dc186d2@md1za8fc.ad001.siemens.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Sat, 6 Mar 2021 13:54:53 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> Am Fri, 5 Mar 2021 19:25:55 +0100
> schrieb Henning Schild <henning.schild@siemens.com>:
> 
> > Am Wed, 3 Mar 2021 21:56:15 +0100
> > schrieb Henning Schild <henning.schild@siemens.com>:
> >   
> > > Am Wed, 3 Mar 2021 21:48:21 +0100
> > > schrieb Henning Schild <henning.schild@siemens.com>:
> > >     
> > > > Am Wed, 3 Mar 2021 20:31:34 +0100
> > > > schrieb Pavel Machek <pavel@ucw.cz>:
> > > >       
> > > > > Hi!
> > > > >         
> > > > > > > > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > > > > > > > +	{1 << 15, "simatic-ipc:green:run-stop"},
> > > > > > > > +	{1 << 7,  "simatic-ipc:yellow:run-stop"},
> > > > > > > > +	{1 << 14, "simatic-ipc:red:error"},
> > > > > > > > +	{1 << 6,  "simatic-ipc:yellow:error"},
> > > > > > > > +	{1 << 13, "simatic-ipc:red:maint"},
> > > > > > > > +	{1 << 5,  "simatic-ipc:yellow:maint"},
> > > > > > > > +	{0, ""},
> > > > > > > > +};            
> > > > > > > 
> > > > > > > Please use names consistent with other systems, this is
> > > > > > > user visible. If you have two-color power led, it should
> > > > > > > be :green:power... See include/dt-bindings/leds/common.h .
> > > > > > >      
> > > > > > 
> > > > > > Well we wanted to pick names that are printed on the devices
> > > > > > and would like to stick to those. Has been a discussion ...
> > > > > > Can we have symlinks to have multiple names per LED?
> > > > > >   
> > > > > 
> > > > > No symlinks. We plan to have command line tool to manipulate
> > > > > LEDs, aliases might be possible there.        
> > > > 
> > > > Sounds like a future plan. sysfs and "cat" "echo" are mighty
> > > > tools and "everything is a file" is the best idea ever. So i
> > > > would say any aliasing should live in the kernel, but that is
> > > > just me. Tools will just get out of sync, be missing in busybox
> > > > or a random yocto ... or whichever distro you like.
> > > > On the other hand you have "complexity should be userland" ... i
> > > > do not have the answer.      
> > > 
> > > My personal horror would be systemd-ledd or some dracut snipet for
> > > initrd. But that would be a generic led class discussion ... that
> > > tool.
> > >     
> > > > > > How strong would you feel about us using our names?
> > > > > >  
> > > > > 
> > > > > Strongly. :-)        
> > > > 
> > > > OK, will try to find a match where possible.       
> > > 
> > > Do we happen to have a description of the existing names, to find
> > > a fit for ours? In the header you pointed out i only found names
> > > without "meaning"    
> > 
> > I had a closer look at the several LED_FUNCTION_ while i could
> > probably find a match for the names we had in mind ...
> > 
> > -       {1 << 14, "simatic-ipc:red:error"},
> > +       {1 << 14, "simatic-ipc:red:" LED_FUNCTION_FAULT },
> > 
> > I still do not understand what those mean. Going over the kernel
> > sources many have only one single grep-hit in the tree.
> > LED_FUNCTION_ not having a single one in drivers/leds
> > Others are found in one dts and in that header ... 2 hits in the
> > tree, maybe i should add my favorite strings ;)
> > 
> > LED_FUNCTION_FLASH vs LED_FUNCTION_TORCH ...? Sound like timing, not
> > function.
> > 
> > Let us say i match the three "error", "run-stop", "maint" to
> > LED_FUNCTION_*
> > 
> > I would have a really hard time finding matches for other LEDs i did
> > not even propose. One example being disks ... many of them, would i
> > be allowed to 
> > 
> > LED_FUNCTION_DISK "0"
> > LED_FUNCTION_DISK "1"
> > ...
> > 
> > they would all have the same colors.
> > 
> > Maybe you explain the idea behind choosing only from that namespace?
> > My guess would be high-level software being able to toggle leds
> > totally indep of the device it runs on. Such software would have to
> > do some really nasty directory listing, name parsing, dealing with
> > multiple hits. Does such generic software already exist, maybe that
> > would help me understand my "mapping problems" ?
> > 
> > The current class encodes, color, function and name into "name".
> > 
> > Maybe i am all wrong and should go for
> > 
> > {1 << 14, "simatic-ipc-error:red:" LED_FUNCTION_STATUS }
> > {1 << 15, "simatic-ipc-run-stop:green:" LED_FUNCTION_STATUS}
> > {...    , "simatic-ipc-hdd0:red:" LED_FUNCTION_DISK }
> > {...    , "simatic-ipc-hdd1:red:" LED_FUNCTION_DISK }
> > 
> > so appending my wanted name to the name before the first :, and use
> > functions i "understand" after the second :  
> 
> Found the docs and the check script. It has been a while since i read
> those docs.
> 
> But that script fails on bus=platform
> 
> quick workaround would be
> 
>         fi
> +elif [ "$bus" = "platform" ]; then
> +       true
>  else
>         echo "Unknown device type."
>         exit 1
> 
> But i guess it would be nice to get some sort of platform information,
> device vendor etc.
> 
> I see two options for pattern i could choose
> 
> "green:" LED_FUNCTION_STATUS "-0"
> -> platform bus patch needed, no plaform information  
> 
> simatic-ipc:green:" LED_FUNCTION_STATUS "-0"
> -> platform bus patch needed, will fail with "Unknown devicename"  
> 
> Without further advice i will choose the second for v2. That is also
> what i.e. "tpacpi" on my laptop looks like.
> 
> I would also be happy to include a fix to that script. My suggestion
> would be to allow bus=platform, in which case a "devicename" will be
> required and is allowed to have any value.

Furthermore it might be good to catch that in the led core instead of
that script. Maybe warn() on dev registration when function/color/name
seem off. Could later become "return -EINVAL"

Henning

> regards,
> Henning
> 
> > regards,
> > Henning
> > 
> >   
> > > regards,
> > > Henning
> > >     
> > > >       
> > > > > Do you have a picture how the leds look like?        
> > > > 
> > > > I could even find chassis photos in our internal review but that
> > > > would be too much.
> > > > 
> > > > Our idea is probably the same as yours. We want the same names
> > > > across all devices. But we struggle with colors because on some
> > > > boxes we have red+green, while other offer yellow ...
> > > > implemented in HW and messing with red+green in some cases.
> > > > 
> > > > But so far we only looked at Siemens devices and thought we
> > > > could get our own "namespace".
> > > > 
> > > > To be honest i could not even tell how our names map on the
> > > > known ones, but we will do our best to find a match. They all
> > > > are "high-level" so "power" and other basic things are not
> > > > exposed.
> > > > 
> > > > regards,
> > > > Henning
> > > >        
> > > > > Best regards,
> > > > > 							Pavel
> > > > >      
> > > >       
> > >     
> >   
> 

