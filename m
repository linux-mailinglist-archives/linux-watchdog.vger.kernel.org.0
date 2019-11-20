Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0721810372B
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 11:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfKTKBt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 05:01:49 -0500
Received: from hmm.wantstofly.org ([138.201.34.84]:46068 "EHLO
        mail.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKTKBt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 05:01:49 -0500
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 05:01:48 EST
Received: by mail.wantstofly.org (Postfix, from userid 1000)
        id 43FB77F2C7; Wed, 20 Nov 2019 11:56:02 +0200 (EET)
Date:   Wed, 20 Nov 2019 11:56:02 +0200
From:   Lennert Buytenhek <kernel@wantstofly.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
Message-ID: <20191120095602.GQ1166@wantstofly.org>
References: <20191118220432.1611-1-labbott@redhat.com>
 <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Nov 19, 2019 at 10:40:04AM +0100, Arnd Bergmann wrote:

> > > Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
> > > removed support for some old platforms. Given this driver depends on
> > > a now removed platform, just remove the driver.
> > >
> > > Signed-off-by: Laura Abbott <labbott@redhat.com>
> > > ---
> > > Found this while reviewing config options. Not sure if this was kept
> > > around for other reasons or just missed.
> > > ---
> > >   drivers/watchdog/Kconfig   |  16 ---
> > >   drivers/watchdog/Makefile  |   1 -
> > >   drivers/watchdog/iop_wdt.c | 249 -------------------------------------
> > >   3 files changed, 266 deletions(-)
> > >   delete mode 100644 drivers/watchdog/iop_wdt.c
> > >
> > > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > > index 58e7c100b6ad..fef9078a44b6 100644
> > > --- a/drivers/watchdog/Kconfig
> > > +++ b/drivers/watchdog/Kconfig
> > > @@ -554,22 +554,6 @@ config PNX4008_WATCHDOG
> > >
> > >         Say N if you are unsure.
> > >
> > > -config IOP_WATCHDOG
> > > -     tristate "IOP Watchdog"
> > > -     depends on ARCH_IOP13XX
> > > -     select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
> >
> > This is a bit confusing, but it suggests that the watchdog may also work
> > with ARCH_IOP32X, which is still supported. I don't know anything about
> > those architectures, but I hesitate to have the driver removed unless
> > we have confirmation that it won't work with ARCH_IOP32X.
> > Maybe the dependency needs to be updated instead ?
> 
> See commit ec2e32ca661e ("watchdog: iop_wdt only builds for
> mach-iop13xx") from 2014: the watdog hardware exists on iop32x
> but the driver only successfully built on iop13xx, which is now gone.
> 
> Adding Russell (who said he still uses iop32x hardware) and Lennert
> (who is still listed in the MAINTAINERS file, but previously said he
> does not use it any more) to Cc.

I haven't worked on ARM-related things for a long time now.  I'll be
happy to hand over maintainership to someone else, or to orphan the
platform(s) entirely.


> If neither of them see a reason to keep the driver, I'd say we can
> remove it.

I don't see a reason (to keep it).


Cheers,
Lennert
