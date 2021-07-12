Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E487A3C6031
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jul 2021 18:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbhGLQPC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Jul 2021 12:15:02 -0400
Received: from thoth.sbs.de ([192.35.17.2]:45663 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhGLQPC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Jul 2021 12:15:02 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 16CGBjpl020872
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Jul 2021 18:11:45 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.0.120])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 16CGBjgr006558;
        Mon, 12 Jul 2021 18:11:45 +0200
Date:   Mon, 12 Jul 2021 18:11:43 +0200
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
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>
Subject: Re: [PATCH v3 0/4] add device drivers for Siemens Industrial PCs
Message-ID: <20210712181143.4e03ba9b@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VfvVD20pZng_BG-ptZiYo9VBfHFe2OABo8VmtYcarfcSw@mail.gmail.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <857d6cd4-839d-c42a-0aa7-8d45243981ee@redhat.com>
        <20210712133543.074aad80@md1za8fc.ad001.siemens.net>
        <CAHp75VfvVD20pZng_BG-ptZiYo9VBfHFe2OABo8VmtYcarfcSw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 12 Jul 2021 15:09:04 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Mon, Jul 12, 2021 at 2:35 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > This series is basically stuck because people rightfully want me to
> > use the GPIO subsystem for the LEDs and the watchdog bits that are
> > connected to GPIO.
> >
> > Problem is that the GPIO subsystem does not initialize on the
> > machines in question. It is a combination of hidden P2SB and
> > missing ACPI table entries. The GPIO subsystem (intel pinctrl)
> > needs either P2SB or ACPI do come up ...
> >
> > Andy proposed some patches for initializing the intel pinctrl stuff
> > for one of the machines by falling back to SoC detection in case
> > there is no ACPI or visible P2SB. While that works it would need to
> > be done for any Intel SoC to be consistent and discussions seem to
> > go nowhere.
> >
> > I would be willing to port over to "intel pintctl" and help with
> > testing, but not so much with actual coding. Andy is that moving at
> > all?
> >
> > Since my drivers do reserve the mmio regions properly and the intel
> > pinctrl will never come up anyways, i do not see a conflict merging
> > my proposed drivers in the current codebase. The wish to use the
> > pinctrl infrastructure can not be fulfilled if that infra is not in
> > place. Once intel pinctrl works, we can change those drivers to
> > work with that.
> >
> > I do not want to take shortcuts ... but also do not want to get
> > stuck here. So maybe one way to serialize the merge is to allow my
> > changes like proposed and rebase on intel pinctrl once that
> > subsystem actually initializes on these machines. We could even
> > have two code paths ... if region can not be reserved, try gpio ...
> > or the other way around.  
> 
> Bjorn suggested exercising the IORESOURCE_PCI_FIXED on top of the
> early PCI quirk that unhides P2SB for the entire run time. But I have
> had no time to actually patch the kernel this way. Have tried the
> proposed approach on your side?

Unhiding the P2SB (even if permanent and fixed) alone will not trigger
pinctrl to initialize. One would still need something along the lines
of "mfd: lpc_ich: Add support for pinctrl in non-ACPI system" for all
SoCs.

I guess it could be an improvement to your series, but i honestly do
not see all fitting together too soon. Since your p2sb series still
initializes the GPIO with two different names (depending on whether it
was PCI or ACPI) and only for one SoC, while this series would need two
... and a consistent solution many more.

Henning


