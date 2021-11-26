Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B7D45F0AB
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 16:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbhKZPbL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 10:31:11 -0500
Received: from thoth.sbs.de ([192.35.17.2]:40409 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344954AbhKZP3L (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 10:29:11 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AQFPYhY005209
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Nov 2021 16:25:34 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.47.90])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQFPXnP025738;
        Fri, 26 Nov 2021 16:25:33 +0100
Date:   Fri, 26 Nov 2021 16:25:32 +0100
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
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>,
        Michael Haener <michael.haener@siemens.com>
Subject: Re: [PATCH v4 4/4] platform/x86: pmc_atom: improve critclk_systems
 matching for Siemens PCs
Message-ID: <20211126162532.1cd42766@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75Vf6x4-AYPPEMf7qXTi-RF92mdUn6rhghBpJ5avQAjYRzA@mail.gmail.com>
References: <20211126141027.16161-1-henning.schild@siemens.com>
        <20211126141027.16161-5-henning.schild@siemens.com>
        <CAHp75Vf6x4-AYPPEMf7qXTi-RF92mdUn6rhghBpJ5avQAjYRzA@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 26 Nov 2021 16:51:00 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Fri, Nov 26, 2021 at 4:10 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > Siemens industrial PCs unfortunately can not always be properly
> > identified the way we used to. An earlier commit introduced code
> > that allows proper identification without looking at DMI strings
> > that could differ based on product branding.
> > Switch over to that proper way and revert commits that used to
> > collect the machines based on unstable strings.  
> 
> Usually we start a series with fixes, but I guess it's fine here since
> this can be taken separately, right?
> 
> ...

It can not be taken because it needs p1 to work. And p1 is mainly here
for p2 and p3 really. Splitting the patches up into

p1.1
p4
p1.2
p2
p3

would be possible but a lot of work for just that ordering topic i
guess.

> > +#include <linux/platform_data/x86/simatic-ipc.h>  
> 
> Seems not.  Question is then, what Fixes tags would  mean in this
> case?
> 

Which of the several tags confuses you? Maybe i just need to drop a few.

the original problem is
Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
which introduced the need for several quirks
Fixes: e8796c6c69d1 ("platform/x86: pmc_atom: Add Siemens CONNECT...")
Fixes: f110d252ae79 ("platform/x86: pmc_atom: Add Siemens SIMATIC...")
Fixes: ad0d315b4d4e ("platform/x86: pmc_atom: Add Siemens SIMATIC...")
These quirks use unstable dmi information. Unstable because the
DMI_PRODUCT_VERSION can be branded. Yes weird ... we do not allow new
ACPI entries but do allow custom dmi ...
p1 introduces the use of stable dmi and p4 brings that into the quirk
table ... fixing all the quirks based on customizable
DMI_PRODUCT_VERSION

Henning
