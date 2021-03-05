Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B0732F051
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 17:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhCEQrQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 11:47:16 -0500
Received: from gecko.sbs.de ([194.138.37.40]:35650 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231336AbhCEQrF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 11:47:05 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 125GkeRd017153
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 5 Mar 2021 17:46:40 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.40.210])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 125GVcIA025393;
        Fri, 5 Mar 2021 17:31:38 +0100
Date:   Fri, 5 Mar 2021 17:31:38 +0100
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
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
Message-ID: <20210305173138.63080717@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VfR+jOsikZMQDOVx4ZGmU84VitckQVQnwNJfpQbCCt-Rg@mail.gmail.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-2-henning.schild@siemens.com>
        <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
        <20210304204242.08b4c064@md1za8fc.ad001.siemens.net>
        <CAHp75VfR+jOsikZMQDOVx4ZGmU84VitckQVQnwNJfpQbCCt-Rg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 5 Mar 2021 17:46:08 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Mar 4, 2021 at 9:52 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> > Am Thu, 4 Mar 2021 12:11:12 +0200
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:  
> > > On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
> > > <henning.schild@siemens.com> wrote:  
> 
> ...
> 
> > > Check for the rest of the series as well (basically this is the
> > > rule of thumb to recheck entire code for the comment you have got
> > > at any single place of it).  
> >
> > For some code Gerd is the author, and i am the co-Author. We even
> > have Jan in the mix at places. At least in copyright headers.
> >
> > I will remain the committer for the three of us. And since i do not
> > know exactly what the problem is i will add only my Signed-off to
> > avoid confusion.
> >
> > Please speak up it that would be wrong as well and point me to the
> > docs i missed. Or tell me how it should be done.  
> 
> Then make sure that you have From line with the Author (`git commit
> --amend --author="..."`) and add your Co-developed-by tag.
> 
> ...
> 
> > > > +       int i;
> > > > +       u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
> > > > +       u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;  
> > >
> > > Reversed xmas tree order?  
> >
> > I do not get this, it is almost easter egg order time. Please
> > explain.  
> 
> Longer lines
> usually go
> first.

Henning

see
i

> See above :-)
> 

