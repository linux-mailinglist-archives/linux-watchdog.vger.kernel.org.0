Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385EF45F2FB
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 18:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237598AbhKZReE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 12:34:04 -0500
Received: from goliath.siemens.de ([192.35.17.28]:45424 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhKZRcD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 12:32:03 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AQHSQYB026747
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 18:28:26 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQHSOI7006916;
        Fri, 26 Nov 2021 18:28:24 +0100
Date:   Fri, 26 Nov 2021 18:28:23 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
Subject: Re: [PATCH v4 0/4] add device drivers for Siemens Industrial PCs
Message-ID: <20211126182823.5046ccce@md1za8fc.ad001.siemens.net>
In-Reply-To: <a1a6c43d-401c-19f1-9773-696402974f6b@roeck-us.net>
References: <20211126141027.16161-1-henning.schild@siemens.com>
        <20211126163410.2806de5f@md1za8fc.ad001.siemens.net>
        <a1a6c43d-401c-19f1-9773-696402974f6b@roeck-us.net>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 26 Nov 2021 08:02:11 -0800
schrieb Guenter Roeck <linux@roeck-us.net>:

> On 11/26/21 7:34 AM, Henning Schild wrote:
> > Hi all,
> > 
> > in p3 not too much was left open so i hope this might be the last
> > and might be quick.
> > 
> > The two points that have been open where:
> >   1 wish to split wdt driver into two
> >   2 wish to use pinctrl for LEDs/WDT
> > 
> > 1 was ignored for now. We can split later when we add more devices.
> > It remains unclear if splitting is the way to go when more devices
> > come.  
> 
> The code is already quite messy, in part because memory regions are
> declared locally and not passed through the parent device as they
> should.

Oh is it, can you please be more precise when being so "harsh". The
parent driver is just a detector which devices in which variant are
available on a given box. It does not drive and should not claim
resources i guess. 

> I don't see how splitting the driver into multiple drivers
> would improve the situation.

In fact that already is a split i would say.

> The platform code claims to be inspired by the lpc_ich driver. 

Only the P2SB bit, getting the memory base of the pinctrl memory.

> Maybe it should take a real example from that
> and pass version or variant specific details through platform data
> instead of maintaining it in the watchdog driver.

It does that ... or i misunderstand you. The driver from p1 can find
these three watchdog types
SIMATIC_IPC_DEVICE_NONE
SIMATIC_IPC_DEVICE_227E
SIMATIC_IPC_DEVICE_427E

Which one to use is determined in the platform driver that will 
platform_device_register_data(NULL, KBUILD_MODNAME "_wdt" ...
&platform_data)

So we tell the watchdog driver about a watchdog and tell it which one
...

If we ever split we could 
   register(KBUILD_MODNAME "_wdt_227e"
 or 
   register(KBUILD_MODNAME "_wdt_427e"

with no platform data needed anymore.

But as i said, i do not want to split just yet. Just want to defend
that code when someone calls it "pretty messy" so late in the process.

Henning

> Guenter

