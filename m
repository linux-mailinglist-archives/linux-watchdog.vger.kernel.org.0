Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEF145EF27
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 14:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbhKZNeF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 08:34:05 -0500
Received: from david.siemens.de ([192.35.17.14]:41811 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349533AbhKZNcE (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 08:32:04 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AQDSSOu018897
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 14:28:28 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQDSSej007519;
        Fri, 26 Nov 2021 14:28:28 +0100
Date:   Fri, 26 Nov 2021 14:28:27 +0100
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
Subject: Re: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20211126142827.78d2348d@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-3-henning.schild@siemens.com>
        <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Tue, 30 Mar 2021 14:04:35 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> ...
> 
> > +#define SIMATIC_IPC_LED_PORT_BASE      0x404E  
> 
> > +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> > +       {1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
> > +       {1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
> > +       {1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
> > +       {1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
> > +       {1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
> > +       {1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
> > +       { }
> > +};  
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
> It seems to me like poking GPIO controller registers directly. This
> is not good. The question still remains: Can we simply register a
> GPIO (pin control) driver and use an LED GPIO driver with an
> additional board file that instantiates it?

The short answer for v4 will be "No we can not!". The pinctrl drivers
do not currently probe on any of the devices and attempts to fix that
have failed or gut stuck. I tried to help out where i could and waited
for a long time.

Now my take is to turn the order around. We go in like that and will
happily switch to pinctrl if that ever comes up on the machines.
Meaning P2SB series on top of this, no more delays please.
We do use request_region so have a mutex in place. Meaning we really
only touch GPIO while pinctrl does not!
I see no issue here, waited for a long time and now expect to be
allowed to get merged first.

Henning
