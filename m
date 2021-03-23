Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565B434669F
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Mar 2021 18:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhCWRpv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Mar 2021 13:45:51 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:43918 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230510AbhCWRpi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Mar 2021 13:45:38 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NHj4K6020428
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 18:45:04 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.18.164])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12NHj2Dc032073;
        Tue, 23 Mar 2021 18:45:03 +0100
Date:   Tue, 23 Mar 2021 18:45:01 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux LED Subsystem" <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20210323184501.39c81a97@md1za8fc.ad001.siemens.net>
In-Reply-To: <1819093001.11427.1616071258857@seven.thorsis.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-3-henning.schild@siemens.com>
        <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
        <e2c6bec5-1f8e-c69a-9219-5c0a9f63ba56@metux.net>
        <1819093001.11427.1616071258857@seven.thorsis.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Thu, 18 Mar 2021 13:40:58 +0100
schrieb Alexander Dahl <ada@thorsis.com>:

> Hei hei,
> 
> > Enrico Weigelt, metux IT consult <lkml@metux.net> hat am 18.03.2021
> > 11:27 geschrieben:
> > 
> >  
> > On 15.03.21 11:48, Andy Shevchenko wrote:
> > 
> > Hi,
> >   
> > > I have a question, why we can't provide a GPIO driver which is
> > > already in the kernel and, with use of the patch series I sent,
> > > to convert this all magic to GPIO LEDs as it's done for all
> > > normal cases?  
> > 
> > Do we alread have a generic led driver that for cases that just
> > set/clear bits in some mem/io location ? If not, that would be
> > really great to have.  
> 
> Yes, there is. Look out for compatible "register-bit-led" in device
> tree. That's from driver in drivers/leds/leds-syscon.c and you can
> use it inside a syscon node in dts.
> 
> It assumes one bit per LED.

Sorry guys, i am lost here. Is there a driver i can base mine on, if so
which one? Maybe you can point me to a good example that is
conceptually similar.

As i already wrote in the reviews of v1, the ACPI tables will not
change on the machines in question. So there is a need for a driver.
Either one like i did propose or maybe something that patches ACPI or
loads device-tree snippets, again please point me to good examples.

We are talking about x86-only here.

Henning 

> Greets
> Alex

