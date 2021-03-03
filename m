Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC04D32C8A4
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 02:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbhCDAvj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 19:51:39 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:40675 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1379569AbhCCNaX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Mar 2021 08:30:23 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 123DBEi5032384
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 3 Mar 2021 14:11:14 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.44.113])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 123DBDdd020542;
        Wed, 3 Mar 2021 14:11:13 +0100
Date:   Wed, 3 Mar 2021 14:11:12 +0100
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
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Message-ID: <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210302205452.GA32573@duo.ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-3-henning.schild@siemens.com>
        <20210302205452.GA32573@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Pavel,

thanks for looking into this.

Am Tue, 2 Mar 2021 21:54:52 +0100
schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
> 
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> Ok.
> 
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 2a698df9da57..c15e1e3c5958 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+=
> > leds-turris-omnia.o obj-$(CONFIG_LEDS_WM831X_STATUS)	+=
> > leds-wm831x-status.o obj-$(CONFIG_LEDS_WM8350)		+=
> > leds-wm8350.o obj-$(CONFIG_LEDS_WRAP)			+=
> > leds-wrap.o +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=
> > simatic-ipc-leds.o  
> 
> Let's put this into drivers/leds/simple. You'll have to create it.

Ok will do

> > + *
> > + * This program is free software; you can redistribute it and/or
> > modify
> > + * it under the terms of the GNU General Public License version 2
> > as
> > + * published by the Free Software Foundation.
> > + */  
> 
> Remove?

Sure, was found in wdt as well. Thx

> > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > +	{1 << 15, "simatic-ipc:green:run-stop"},
> > +	{1 << 7,  "simatic-ipc:yellow:run-stop"},
> > +	{1 << 14, "simatic-ipc:red:error"},
> > +	{1 << 6,  "simatic-ipc:yellow:error"},
> > +	{1 << 13, "simatic-ipc:red:maint"},
> > +	{1 << 5,  "simatic-ipc:yellow:maint"},
> > +	{0, ""},
> > +};  
> 
> Please use names consistent with other systems, this is user
> visible. If you have two-color power led, it should be
> :green:power... See include/dt-bindings/leds/common.h .

Well we wanted to pick names that are printed on the devices and would
like to stick to those. Has been a discussion ...
Can we have symlinks to have multiple names per LED?

How strong would you feel about us using our names?

> Please avoid // comments in the code.

Ok

> > +module_init(simatic_ipc_led_init_module);
> > +module_exit(simatic_ipc_led_exit_module);  
> 
> No need for such verbosity for functions that are static.
> 
> > +MODULE_LICENSE("GPL");  
> 
> GPL v2?

Will do.

Stay tuned for v2.

regards,
Henning


> Best regards,
> 								Pavel
> 

