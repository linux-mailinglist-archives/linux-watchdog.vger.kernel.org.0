Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539FD33B2EE
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 13:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCOMlk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 08:41:40 -0400
Received: from gecko.sbs.de ([194.138.37.40]:40361 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229588AbhCOMlO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 08:41:14 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12FCeq9G000457
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 13:40:53 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12FCeqwf001749;
        Mon, 15 Mar 2021 13:40:52 +0100
Date:   Mon, 15 Mar 2021 13:40:50 +0100
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
Message-ID: <20210315134037.7f8529e7@md1za8fc.ad001.siemens.net>
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

You asked about a picture before, so here is one example

https://support.industry.siemens.com/cs/document/67235073/simatic-ipc427d?dti=0&pnid=16756&lc=en-WW

page 19 shows how the box looks like
page 135 it what the implementation is based on

Externally human visible are 3 "lights", which can be off, red, green,
yellow. Internally every single "light" has two leds and yellow is a
mix when red and green are on.
Unfortunately hw does not allow all 4 states for all 3 lights. Some
boxes implement "yellow" mixing in hw.

That is why the same name is used with two colors.

maybe those LEDs qualify for multi-color? 

"status" was the best name i found in the dt-bindings header

i guess i can be creative with the names and take ie "status", "fault",
and "indicator"

i will also drop that prefix "simatic-ipc" that was inspired by
"tpacpi", or should it be "platform:<color>:<name>"?

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

