Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF2104725
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 00:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKTX5H (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 18:57:07 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:47792 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfKTX5H (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 18:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rVrcm+vGryDzHFHQYS1sIVHlCESdbJWeaU7PTAJmwO8=; b=UGPy71TXhXTr9R8IhDM9bmS30
        KAtfZ8J77FM8WXDV5BZqpI/28NwIgO4/F13taLeU88VJWiETWOyvorNyrOIceCpFLhYD6f0w9z9GE
        ObILdGQKmQQ426rZOG4L5UQVHr02i+HMn+7U7O5x/8k0W3TV2ngM8iX8RWm+oowey6Y+TljwY3cj2
        KU2ifshPGCnXNP0AFVy1r8nYu2U94xxLVvlTO4p3QHJ+lutZWhXFt97Tp56WOHdsHBFuGFH1eCklU
        7s6o5flADCC06MTAWE0IvvAVzs3i2g+soYoO6Gb74klmbcYQtLV65p4WBZYIoy5JSLqveQdUANLyK
        iV0Bl5Z2g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42382)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iXZqC-0002zW-4s; Wed, 20 Nov 2019 23:56:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iXZq8-00029m-Pf; Wed, 20 Nov 2019 23:56:52 +0000
Date:   Wed, 20 Nov 2019 23:56:52 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lennert Buytenhek <kernel@wantstofly.org>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
Message-ID: <20191120235652.GW25745@shell.armlinux.org.uk>
References: <20191118220432.1611-1-labbott@redhat.com>
 <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
 <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net>
 <20191120100341.GK25745@shell.armlinux.org.uk>
 <CAK8P3a2N+aDgFz75dFJy3Me9FPdyDSyPaa29FngLjfXX3MzfvA@mail.gmail.com>
 <20191120103054.GM25745@shell.armlinux.org.uk>
 <20191120230518.GA28840@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120230518.GA28840@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 20, 2019 at 03:05:18PM -0800, Guenter Roeck wrote:
> On Wed, Nov 20, 2019 at 10:30:54AM +0000, Russell King - ARM Linux admin wrote:
> > On Wed, Nov 20, 2019 at 11:15:01AM +0100, Arnd Bergmann wrote:
> > > On Wed, Nov 20, 2019 at 11:03 AM Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > > On Tue, Nov 19, 2019 at 06:29:09AM -0800, Guenter Roeck wrote:
> > > > > On 11/19/19 1:40 AM, Arnd Bergmann wrote:
> > > > > > On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > > On 11/18/19 2:04 PM, Laura Abbott wrote:
> > > > >
> > > > > Good point, especially since apparently no one cared for five years.
> > > >
> > > > Doesn't mean that there aren't interested parties.  I still have
> > > > IOP32x hardware running here in the form of a N2100 (my firewall)
> > > > and it seems that I never noticed this option disappearing until
> > > > now...
> > > 
> > > It's not that it was ever there for IOP32x: the driver was introduced in 2007
> > > and was available for IOP32x but failed to compile for it until 2014 when
> > > I sent the patch to disable the driver in all configurations that
> > > failed to build.
> > 
> > Well:
> > 
> > systems/n2100/boot/config-3.11.5+:CONFIG_IOP_WATCHDOG=m
> > systems/n2100/boot/config-3.12.6+:CONFIG_IOP_WATCHDOG=m
> > systems/n2100/boot/config-3.9.5+:CONFIG_IOP_WATCHDOG=m
> > 
> > -rw-rw-r-- 1 rmk rmk 5284 Dec 30  2013 systems/n2100/lib/modules/3.12.6+/kernel/drivers/watchdog/iop_wdt.ko
> > -rw-rw-r-- 1 rmk rmk 5276 Dec 20  2013 systems/n2100/lib/modules/3.9.5+/kernel/drivers/watchdog/iop_wdt.ko
> > 
> > It seems I've been carrying a patch to comment out the troublesome code:
> > 
> > -       write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> > +//     write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> > 
> > in my stable tree since 2015.
> 
> Do you have plans to update that kernel to mainline ?
> If yes, a patch to make the driver (and I guess everything else that broke
> since 3.12) work would be helpful.

It's a currently running 4.19.xx stable kernel, but as a result of the
patch to the Kconfig file, without the watchdog which I hadn't realised
until I saw this thread.  Is that mainline enough?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
