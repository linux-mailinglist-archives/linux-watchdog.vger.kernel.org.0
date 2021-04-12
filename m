Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FD735CA5B
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Apr 2021 17:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243087AbhDLPrQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Apr 2021 11:47:16 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:54248 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243040AbhDLPrQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Apr 2021 11:47:16 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13CFkQqf031101
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 17:46:26 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.41.180])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13CFZWJi006717;
        Mon, 12 Apr 2021 17:35:32 +0200
Date:   Mon, 12 Apr 2021 17:35:31 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
Message-ID: <20210412173531.4140e461@md1za8fc.ad001.siemens.net>
In-Reply-To: <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
References: <20210329174928.18816-1-henning.schild@siemens.com>
        <20210329174928.18816-4-henning.schild@siemens.com>
        <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Thu, 1 Apr 2021 18:15:41 +0200
schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:

> On 29.03.21 19:49, Henning Schild wrote:
> 
> Hi,
> 
> > This driver adds initial support for several devices from Siemens.
> > It is based on a platform driver introduced in an earlier commit.  
> 
> Where does the wdt actually come from ?
> 
> Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a pretty 
> usual case.
> 
> Or some external chip ?
> 
> The code smells a bit like two entirely different wdt's that just have
> some similarities. If that's the case, I'd rather split it into two
> separate drivers and let the parent driver (board file) instantiate
> the correct one.

In fact they are the same watchdog device. The only difference is the
"secondary enable" which controls whether the watchdog causes a reboot
or just raises an alarm. The alarm feature is not even implemented in
the given driver, we just enable that secondary enable regardless.

In one range of devices (227E) that second enable is part of a
pio-based control register. On the other range (427E) it unfortunately
is a P2SB gpio, which gets us right into the discussion we have around
the LEDs.
With that i have my doubts that two drivers would be the way to go,
most likely not. 

Only that i have no clue which pinctrl driver should be used here. My
guess is "sunrisepoint" because the CPUs are "SkyLake" i.e. i5-6442EQ,
i3-6102E
And "grep INT344B /sys/firmware/acpi/tables/DSDT" matches. I booted a
kernel patched with the series from Andy but the "pinctrl-sunrisepoint"
does not seem to even claim the memory. Still trying to understand how
to make use of these pinctrl drivers they are in place but i lack
example users (drivers). If they should be available in sysfs, i might
be looking at the wrong place ... /sys/class/gpio/ does not list
anything

regards,
Henning



> 
> --mtx
> 

