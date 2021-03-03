Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A9D32C8A0
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 02:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242356AbhCDAvo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 19:51:44 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:36707 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377458AbhCCVC2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Mar 2021 16:02:28 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 123L1LfG026717
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 3 Mar 2021 22:01:21 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.36.86])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 123KuKU6014282;
        Wed, 3 Mar 2021 21:56:20 +0100
Date:   Wed, 3 Mar 2021 21:56:15 +0100
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
Message-ID: <20210303215615.64e45720@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210303214810.511ad65a@md1za8fc.ad001.siemens.net>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-3-henning.schild@siemens.com>
        <20210302205452.GA32573@duo.ucw.cz>
        <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
        <20210303193134.GB8720@amd>
        <20210303214810.511ad65a@md1za8fc.ad001.siemens.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Wed, 3 Mar 2021 21:48:21 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> Am Wed, 3 Mar 2021 20:31:34 +0100
> schrieb Pavel Machek <pavel@ucw.cz>:
> 
> > Hi!
> >   
> > > > > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > > > > +	{1 << 15, "simatic-ipc:green:run-stop"},
> > > > > +	{1 << 7,  "simatic-ipc:yellow:run-stop"},
> > > > > +	{1 << 14, "simatic-ipc:red:error"},
> > > > > +	{1 << 6,  "simatic-ipc:yellow:error"},
> > > > > +	{1 << 13, "simatic-ipc:red:maint"},
> > > > > +	{1 << 5,  "simatic-ipc:yellow:maint"},
> > > > > +	{0, ""},
> > > > > +};      
> > > > 
> > > > Please use names consistent with other systems, this is user
> > > > visible. If you have two-color power led, it should be
> > > > :green:power... See include/dt-bindings/leds/common.h .    
> > > 
> > > Well we wanted to pick names that are printed on the devices and
> > > would like to stick to those. Has been a discussion ...
> > > Can we have symlinks to have multiple names per LED?    
> > 
> > No symlinks. We plan to have command line tool to manipulate LEDs,
> > aliases might be possible there.  
> 
> Sounds like a future plan. sysfs and "cat" "echo" are mighty tools and
> "everything is a file" is the best idea ever. So i would say any
> aliasing should live in the kernel, but that is just me. Tools will
> just get out of sync, be missing in busybox or a random yocto ... or
> whichever distro you like.
> On the other hand you have "complexity should be userland" ... i do
> not have the answer.

My personal horror would be systemd-ledd or some dracut snipet for
initrd. But that would be a generic led class discussion ... that tool.

> > > How strong would you feel about us using our names?    
> > 
> > Strongly. :-)  
> 
> OK, will try to find a match where possible. 

Do we happen to have a description of the existing names, to find a fit
for ours? In the header you pointed out i only found names without
"meaning"

regards,
Henning

> 
> > Do you have a picture how the leds look like?  
> 
> I could even find chassis photos in our internal review but that would
> be too much.
> 
> Our idea is probably the same as yours. We want the same names across
> all devices. But we struggle with colors because on some boxes we have
> red+green, while other offer yellow ... implemented in HW and messing
> with red+green in some cases.
> 
> But so far we only looked at Siemens devices and thought we could get
> our own "namespace".
> 
> To be honest i could not even tell how our names map on the known
> ones, but we will do our best to find a match. They all are
> "high-level" so "power" and other basic things are not exposed.
> 
> regards,
> Henning
>  
> > Best regards,
> > 							Pavel  
> 

