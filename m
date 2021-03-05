Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A640332F057
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 17:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhCEQsW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 11:48:22 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:47406 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231329AbhCEQrv (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 11:47:51 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 125GlO4Z017045
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 5 Mar 2021 17:47:24 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.40.210])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 125GgNrS002611;
        Fri, 5 Mar 2021 17:42:24 +0100
Date:   Fri, 5 Mar 2021 17:42:23 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
Message-ID: <20210305174223.11537d42@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-2-henning.schild@siemens.com>
        <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
        <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
        <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 5 Mar 2021 17:42:42 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com>
> wrote:
> > On 3/4/21 11:11 AM, Andy Shevchenko wrote:  
> > > On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
> > > <henning.schild@siemens.com> wrote:  
> 
> ...
> 
> > >> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
> > >> +{
> > >> +       u32 bar0 = 0;  
> > >  
> > >> +#ifdef CONFIG_PCI  
> > >
> > > It's ugly besides the fact that you have a dependency.
> > >  
> > >> +       struct pci_bus *bus;  
> > >
> > > Missed blank line.
> > >  
> > >> +       /*
> > >> +        * The GPIO memory is bar0 of the hidden P2SB device.
> > >> Unhide the device
> > >> +        * to have a quick look at it, before we hide it again.
> > >> +        * Also grab the pci rescan lock so that device does not
> > >> get discovered
> > >> +        * and remapped while it is visible.
> > >> +        * This code is inspired by drivers/mfd/lpc_ich.c
> > >> +        */
> > >> +       bus = pci_find_bus(0, 0);
> > >> +       pci_lock_rescan_remove();
> > >> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
> > >> +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0,
> > >> &bar0); +
> > >> +       bar0 &= ~0xf;
> > >> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
> > >> +       pci_unlock_rescan_remove();
> > >> +#endif /* CONFIG_PCI */
> > >> +       return bar0;
> > >> +}
> > >> +EXPORT_SYMBOL(simatic_ipc_get_membase0);  
> > >
> > > Oy vey! I know what this is and let's do it differently. I have
> > > some (relatively old) patch series I can send you privately for
> > > testing.  
> >
> > This bit stood out the most to me too, it would be good if we can
> > this fixed in some cleaner work. So I'm curious how things will
> > look with Andy's work integrated.
> >
> > Also I don't think this should be exported. Instead this (or its
> > replacement) should be used to get the address for an IOMEM
> > resource to add the platform devices when they are instantiated.
> > Then the platform-dev drivers can just use the regular functions to
> > get their resources instead of relying on this module.  
> 
> I have published a WIP branch [1]. I have no means to test (I don't
> know what hardware at hand I can use right now), but I made it compile
> after 4 years of gathering dust...
> Feel free to give any kind of comments or share your ideas on how it
> can be improved (the above idea on IOMEM resource is interesting, but
> devices are PCI, not sure how this can be done).
> 
> [1]: https://gitlab.com/andy-shev/next/-/tree/p2sb

That is a little weird, might be a good idea to RFC reply to the cover
letter of this one. To allow review and discussion in a central place.

Henning
