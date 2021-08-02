Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB653DD31E
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Aug 2021 11:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhHBJlo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Aug 2021 05:41:44 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:57572 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231625AbhHBJlo (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Aug 2021 05:41:44 -0400
X-Greylist: delayed 1155 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Aug 2021 05:41:42 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1729LkuU019819
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Aug 2021 11:21:46 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.0.59])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1729Ljod022415;
        Mon, 2 Aug 2021 11:21:45 +0200
Date:   Mon, 2 Aug 2021 11:21:42 +0200
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
        Pavel Machek <pavel@ucw.cz>,
        "Farooq, Muhammad Hamza" <hamza.farooq@siemens.com>
Subject: Re: [PATCH v2 0/4] add device drivers for Siemens Industrial PCs
Message-ID: <20210802112142.065b46a5@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75Vfu1PoN6bH4ew99Ct9JS=d9KSXtM0EXV_T7VF211TW-Yg@mail.gmail.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <CAHp75Vfu1PoN6bH4ew99Ct9JS=d9KSXtM0EXV_T7VF211TW-Yg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 15 Mar 2021 12:55:13 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Mon, Mar 15, 2021 at 12:12 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > changes since v1:
> >
> > - fixed lots of style issues found in v1
> >   - (debug) printing
> >   - header ordering
> > - fixed license issues GPLv2 and SPDX in all files
> > - module_platform_driver instead of __init __exit
> > - wdt simplifications cleanup
> > - lots of fixes in wdt driver, all that was found in v1
> > - fixed dmi length in dmi helper
> > - changed LED names to allowed ones
> > - move led driver to simple/
> > - switched pmc_atom to dmi callback with global variable
> >
> > --
> >
> > This series adds support for watchdogs and leds of several x86
> > devices from Siemens.
> >
> > It is structured with a platform driver that mainly does
> > identification of the machines. It might trigger loading of the
> > actual device drivers by attaching devices to the platform bus.
> >
> > The identification is vendor specific, parsing a special binary DMI
> > entry. The implementation of that platform identification is
> > applied on pmc_atom clock quirks in the final patch.
> >
> > It is all structured in a way that we can easily add more devices
> > and more platform drivers later. Internally we have some more code
> > for hardware monitoring, more leds, watchdogs etc. This will follow
> > some day.  
> 
> Thanks for an update!
> 
> I did review more thoughtfully the series and realized that you can
> avoid that P2SB thingy and may the approach be much cleaner if you
> register the real GPIO driver and convert your LEDs to be a GPIO LEDs.
> Then you won't need any custom code for it (except some board file, or
> what would be better to file _DSD in your ACPI tables.

For the next generation of these machines i managed to involve the BIOS
guys. Goal would be to describe as much as possible in a generic and
standard way in ACPI, to reduce cost on driver dev and maint in the
long run. Hopefully across OSs.

The first thing we wanted to look into is LEDs. The way they can be
described for leds-gpio does not seem to be standard but at least seems
generic. At the same time we contemplated whether to model the LEDs
using the multicolor class.

One thing that seems to speak against using multicolor seems to be
missing ACPI "support", while regular LEDs can be described in ACPI, it
does not seem like multicolor can. Or did we miss something?

regards,
Henning

> --
> With Best Regards,
> Andy Shevchenko

