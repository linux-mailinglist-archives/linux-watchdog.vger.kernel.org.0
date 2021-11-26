Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1901D45F32A
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 18:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhKZRyJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 12:54:09 -0500
Received: from goliath.siemens.de ([192.35.17.28]:49337 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhKZRwJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 12:52:09 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AQHmYhL009364
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 18:48:34 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQHmW4n003945;
        Fri, 26 Nov 2021 18:48:32 +0100
Date:   Fri, 26 Nov 2021 18:48:31 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>
Subject: Re: [PATCH v4 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20211126184831.5d2a3787@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VcD0FQuG_AToNkVHHD9e6WV6=18P4U0cSi0qzD3FL=ssw@mail.gmail.com>
References: <20211126141027.16161-1-henning.schild@siemens.com>
        <20211126141027.16161-3-henning.schild@siemens.com>
        <CAHp75VcD0FQuG_AToNkVHHD9e6WV6=18P4U0cSi0qzD3FL=ssw@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 26 Nov 2021 17:02:00 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Fri, Nov 26, 2021 at 4:10 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> ...
> 
> > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > +       { }
> > +};  
> 
> Like I said, this is not okay.
> 
> Why can't you simply enable the pinctrl driver and use it?

What do you mean with enable (=m, =y)? The kernel has it built in ...
but it does not come up because it does not find an ACPI table entry
nor a p2sb PCI device.

When with enable you mean ... repair the pinctrl drivers with your
patches, i am afraid i am not qualified and hardly responsible. It is
not "simple" for me. I will test and switch to pinctrl .... but here i
am tired of waiting and pushing/asking to turn the order of patches
around.

Or can i trigger the pinctrl driver to probe from my init/probe?

Henning
