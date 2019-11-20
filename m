Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CFD10372E
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 11:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbfKTKDz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 05:03:55 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:37936 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKTKDy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 05:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=N4okNq91vSD3Nw9+ESonOug3n4UNsPalZDY4dcBnWUc=; b=s22lhr/yHhIPSIbjDa7RUyeX3
        tPMbHwQjt4RdsTCO03fuBIqHS+VnwZGgxZDKF8UuFb0dKK022FF+PnBOCBBMghofWzqv9TWy1CWL6
        h728N1mx/RRZPTBgGmCafNgUAd0ZyyKMAuvqTmvd2HExTZsjHjI7G7srEh1hWeG2DKjF0YZUql3mb
        XBG6zN4QUqQRjcYZjCswMAZR/yz4u98ou9z6wiNB+JwBBa6cstu5S9VezUyAd5tONq7ieNEGI7Gnq
        jrqN+kiBi8ixeu7Mjzi+4EjV2JDUnvm0oB/22TFge0Z+KIGCJ1WqrNLjYMCCEqURf6g+8lEU51LS3
        Qne7+vS8g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42124)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iXMpr-0007ax-L2; Wed, 20 Nov 2019 10:03:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iXMpp-0001d0-KT; Wed, 20 Nov 2019 10:03:41 +0000
Date:   Wed, 20 Nov 2019 10:03:41 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lennert Buytenhek <kernel@wantstofly.org>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
Message-ID: <20191120100341.GK25745@shell.armlinux.org.uk>
References: <20191118220432.1611-1-labbott@redhat.com>
 <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
 <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Nov 19, 2019 at 06:29:09AM -0800, Guenter Roeck wrote:
> On 11/19/19 1:40 AM, Arnd Bergmann wrote:
> > On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > 
> > > On 11/18/19 2:04 PM, Laura Abbott wrote:
> > > > 
> > > > Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
> > > > removed support for some old platforms. Given this driver depends on
> > > > a now removed platform, just remove the driver.
> > > > 
> > > > Signed-off-by: Laura Abbott <labbott@redhat.com>
> > > > ---
> > > > Found this while reviewing config options. Not sure if this was kept
> > > > around for other reasons or just missed.
> > > > ---
> > > >    drivers/watchdog/Kconfig   |  16 ---
> > > >    drivers/watchdog/Makefile  |   1 -
> > > >    drivers/watchdog/iop_wdt.c | 249 -------------------------------------
> > > >    3 files changed, 266 deletions(-)
> > > >    delete mode 100644 drivers/watchdog/iop_wdt.c
> > > > 
> > > > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > > > index 58e7c100b6ad..fef9078a44b6 100644
> > > > --- a/drivers/watchdog/Kconfig
> > > > +++ b/drivers/watchdog/Kconfig
> > > > @@ -554,22 +554,6 @@ config PNX4008_WATCHDOG
> > > > 
> > > >          Say N if you are unsure.
> > > > 
> > > > -config IOP_WATCHDOG
> > > > -     tristate "IOP Watchdog"
> > > > -     depends on ARCH_IOP13XX
> > > > -     select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
> > > 
> > > This is a bit confusing, but it suggests that the watchdog may also work
> > > with ARCH_IOP32X, which is still supported. I don't know anything about
> > > those architectures, but I hesitate to have the driver removed unless
> > > we have confirmation that it won't work with ARCH_IOP32X.
> > > Maybe the dependency needs to be updated instead ?
> > 
> > See commit ec2e32ca661e ("watchdog: iop_wdt only builds for
> > mach-iop13xx") from 2014: the watdog hardware exists on iop32x
> > but the driver only successfully built on iop13xx, which is now gone.
> > 
> > Adding Russell (who said he still uses iop32x hardware) and Lennert
> > (who is still listed in the MAINTAINERS file, but previously said he
> > does not use it any more) to Cc. If neither of them see a reason to
> > keep the driver, I'd say we can remove it.
> > 
> > It seems unlikely that anyone wants to revive the driver if they have
> > not done it yet, and if they want to do it later, it is barely harder to revert
> > the removal than to fix the compile-time problem.
> > 
> 
> Good point, especially since apparently no one cared for five years.

Doesn't mean that there aren't interested parties.  I still have
IOP32x hardware running here in the form of a N2100 (my firewall)
and it seems that I never noticed this option disappearing until
now...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
