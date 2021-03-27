Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE5234B5D8
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Mar 2021 10:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhC0J51 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Mar 2021 05:57:27 -0400
Received: from gecko.sbs.de ([194.138.37.40]:49708 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231420AbhC0J50 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Mar 2021 05:57:26 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12R9uxXA017438
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 10:57:00 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.2.82])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12R9ux11004549;
        Sat, 27 Mar 2021 10:56:59 +0100
Date:   Sat, 27 Mar 2021 10:56:56 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20210327105645.0632b6e4@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210315111915.GA14857@duo.ucw.cz>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-3-henning.schild@siemens.com>
        <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
        <20210315111915.GA14857@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 15 Mar 2021 12:19:15 +0100
schrieb Pavel Machek <pavel@ucw.cz>:

> > > +       struct led_classdev cdev;
> > > +};
> > > +
> > > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > > +       {1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1" },
> > > +       {1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1"
> > > },
> > > +       {1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
> > > +       {1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2"
> > > },
> > > +       {1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
> > > +       {1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3"
> > > },  
> > 
> > Can you use BIT() macro here? And can it be sorted by the bit
> > order?  
> 
> There's nothing wrong with << and this order is fine.
> 
> But I still don't like the naming. simantic-ipc: prefix is
> useless. Having 6 status leds is not good, either.

With some of my questions still not being answered i will probably
remove that prefix entirely, not even use "platform:".

And i might stick with 6x "status". Since that allows reflecting the
labels on the machines, while using "above functions if you can"

regards,
Henning

> > > +       struct simatic_ipc_led *led =
> > > +               container_of(led_cd, struct simatic_ipc_led,
> > > cdev);  
> > 
> > One line?  
> 
> 80 columns. It is fine as it is.
> 
> Best regards,
> 
> 								Pavel

