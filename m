Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E0432C89E
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 02:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241836AbhCDAvk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 19:51:40 -0500
Received: from gecko.sbs.de ([194.138.37.40]:36180 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1838579AbhCCTBG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Mar 2021 14:01:06 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 123IxwIh025455
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 3 Mar 2021 19:59:58 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.36.86])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 123InvaB000593;
        Wed, 3 Mar 2021 19:49:57 +0100
Date:   Wed, 3 Mar 2021 19:49:56 +0100
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
Message-ID: <20210303194956.5b36a73c@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210303174040.GA3305@amd>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-3-henning.schild@siemens.com>
        <20210302205452.GA32573@duo.ucw.cz>
        <20210303183714.62c0f06f@md1za8fc.ad001.siemens.net>
        <20210303174040.GA3305@amd>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Wed, 3 Mar 2021 18:40:40 +0100
schrieb Pavel Machek <pavel@ucw.cz>:

> Hi!
> 
> > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > index 2a698df9da57..c15e1e3c5958 100644
> > > > --- a/drivers/leds/Makefile
> > > > +++ b/drivers/leds/Makefile
> > > > @@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)
> > > > 	+= leds-turris-omnia.o
> > > > obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
> > > > obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
> > > > obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> > > > +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=
> > > > simatic-ipc-leds.o    
> > > 
> > > Let's put this into drivers/leds/simple. You'll have to create
> > > it.  
> > 
> > Can you please go into detail why? We plan to add more devices in
> > the future, which might in fact make this a little less simple. But
> > we can discuss that when the time is right and start with simple.  
> 
> There's already way too many drivers in the directory, and your driver
> is very different from drivers for camera flash (for example).

Understood, the whole Makefile Kconfig thingy?

Henning

> Best regards,
> 								Pavel

