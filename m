Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A8D33C13F
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 17:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhCOQJi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 12:09:38 -0400
Received: from gecko.sbs.de ([194.138.37.40]:49021 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhCOQJV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 12:09:21 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12FG8s4Q018596
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 17:08:54 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12FG8sXg007739;
        Mon, 15 Mar 2021 17:08:54 +0100
Date:   Mon, 15 Mar 2021 17:08:52 +0100
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
Subject: Re: [PATCH v2 0/4] add device drivers for Siemens Industrial PCs
Message-ID: <20210315170852.578f557f@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75Vfu1PoN6bH4ew99Ct9JS=d9KSXtM0EXV_T7VF211TW-Yg@mail.gmail.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <CAHp75Vfu1PoN6bH4ew99Ct9JS=d9KSXtM0EXV_T7VF211TW-Yg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

Thanks Andy. I will need to read through your comments and existing
code. Are you saying there already is a GPIO driver that i should
rather hook into ... given there is and will not be WDAT any time soon?
Can you please point it out to me, the driver and maybe an example.

If you are suggesting to write a generic GPIO driver, i would probably
say that this can hopefully wait until we have a second user and need
that level of abstraction.

regards,
Henning

> --
> With Best Regards,
> Andy Shevchenko

