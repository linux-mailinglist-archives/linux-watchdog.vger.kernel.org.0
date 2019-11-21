Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2329710479B
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 01:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfKUAge (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 19:36:34 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44919 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfKUAge (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 19:36:34 -0500
Received: by mail-pf1-f193.google.com with SMTP id q26so669104pfn.11;
        Wed, 20 Nov 2019 16:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=smBw2eSn7Wp6DrTkKu9yGmpFd55bs+SJ4cWsLvwYGXE=;
        b=ryg+BN4y7EBIVMsofGNAq5juHnPPshbmSN1na0SOHB2c8Mhdix1jEoG/26zGLqY2LF
         yERmeUFFkY874jEZPjrXdbbaokgCgWe2flqYt64wJaeAkpQcIIA6CkS6OYTun1h5H8Bd
         wY8U5GgirFmA8w4xzqIKTkE1VTdSvhvvES7BF9nYvbW8r7itusBgfT8nrgVMEZp/1a1p
         KwhIXXqJYibgXK61dVCBNwLq+8HMk86KUiyJ7sL1dOwOWTUdpaV6xUUhba/lmujVjlkY
         78Krz6DDYDKXuv1XYT68RnnsJSHlpIN/6vmMqChLHeVJ2GTz0CzFzxVWOUxraZEjz1hg
         sWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=smBw2eSn7Wp6DrTkKu9yGmpFd55bs+SJ4cWsLvwYGXE=;
        b=KyFJI1j/O1aWVhBEE4D7S2gu8lfno8/tC/iscNwm/3RwlyZrTKY8no57Tpj7AAUMWI
         nO6Ia53vrBpZBxjdICnqQqnebLjUqgwVmLKakCpRcbUK1jyMXI5G+CDNTdGTGyCMr9rB
         tsZESFg7j1Q+dArLq5Fkxf93TUBb31DQDa/jVd6Z/PfzxpFyjcKzkdpkKBBNcVIxiwhz
         6JLFfQOPX87EEOHrhe94L2LRTQGbfiK+cA4WT5557yrCuH6qBxTnBubYWVEVWx2T/Hm0
         CJBCAJ9JpMDJgKpZN7Y4uFFfFxr0kCTx33zyEdsNEE3Z+8fxYxGgFRO0+CCIT81JB01P
         NTYQ==
X-Gm-Message-State: APjAAAU3VZQXz7yU3JTEE/6Y6lTrUhxhZw7gTa3BSVIosifEfZCjYcD7
        qEMyYW5Uo9XHX0/lLXUOhYQ=
X-Google-Smtp-Source: APXvYqwggVMXLJ0YMoRGcJX+V0U2VVPPBgEBy+EYa20Y3sfv68nS805W6coHI3CeMdeYxB4DXP4zTg==
X-Received: by 2002:a63:33ca:: with SMTP id z193mr5871639pgz.83.1574296593382;
        Wed, 20 Nov 2019 16:36:33 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r24sm410551pgu.36.2019.11.20.16.36.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 16:36:32 -0800 (PST)
Date:   Wed, 20 Nov 2019 16:36:30 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lennert Buytenhek <kernel@wantstofly.org>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
Message-ID: <20191121003630.GA1530@roeck-us.net>
References: <20191118220432.1611-1-labbott@redhat.com>
 <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
 <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net>
 <20191120100341.GK25745@shell.armlinux.org.uk>
 <CAK8P3a2N+aDgFz75dFJy3Me9FPdyDSyPaa29FngLjfXX3MzfvA@mail.gmail.com>
 <20191120103054.GM25745@shell.armlinux.org.uk>
 <20191120230518.GA28840@roeck-us.net>
 <20191120235652.GW25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120235652.GW25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 20, 2019 at 11:56:52PM +0000, Russell King - ARM Linux admin wrote:
> On Wed, Nov 20, 2019 at 03:05:18PM -0800, Guenter Roeck wrote:
> > On Wed, Nov 20, 2019 at 10:30:54AM +0000, Russell King - ARM Linux admin wrote:
> > > On Wed, Nov 20, 2019 at 11:15:01AM +0100, Arnd Bergmann wrote:
> > > > On Wed, Nov 20, 2019 at 11:03 AM Russell King - ARM Linux admin
> > > > <linux@armlinux.org.uk> wrote:
> > > > > On Tue, Nov 19, 2019 at 06:29:09AM -0800, Guenter Roeck wrote:
> > > > > > On 11/19/19 1:40 AM, Arnd Bergmann wrote:
> > > > > > > On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > > > On 11/18/19 2:04 PM, Laura Abbott wrote:
> > > > > >
> > > > > > Good point, especially since apparently no one cared for five years.
> > > > >
> > > > > Doesn't mean that there aren't interested parties.  I still have
> > > > > IOP32x hardware running here in the form of a N2100 (my firewall)
> > > > > and it seems that I never noticed this option disappearing until
> > > > > now...
> > > > 
> > > > It's not that it was ever there for IOP32x: the driver was introduced in 2007
> > > > and was available for IOP32x but failed to compile for it until 2014 when
> > > > I sent the patch to disable the driver in all configurations that
> > > > failed to build.
> > > 
> > > Well:
> > > 
> > > systems/n2100/boot/config-3.11.5+:CONFIG_IOP_WATCHDOG=m
> > > systems/n2100/boot/config-3.12.6+:CONFIG_IOP_WATCHDOG=m
> > > systems/n2100/boot/config-3.9.5+:CONFIG_IOP_WATCHDOG=m
> > > 
> > > -rw-rw-r-- 1 rmk rmk 5284 Dec 30  2013 systems/n2100/lib/modules/3.12.6+/kernel/drivers/watchdog/iop_wdt.ko
> > > -rw-rw-r-- 1 rmk rmk 5276 Dec 20  2013 systems/n2100/lib/modules/3.9.5+/kernel/drivers/watchdog/iop_wdt.ko
> > > 
> > > It seems I've been carrying a patch to comment out the troublesome code:
> > > 
> > > -       write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> > > +//     write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> > > 
> > > in my stable tree since 2015.
> > 
> > Do you have plans to update that kernel to mainline ?
> > If yes, a patch to make the driver (and I guess everything else that broke
> > since 3.12) work would be helpful.
> 
> It's a currently running 4.19.xx stable kernel, but as a result of the
> patch to the Kconfig file, without the watchdog which I hadn't realised
> until I saw this thread.  Is that mainline enough?
> 
Yes. Can you send me a patch with the above fix and the necessary Kconfig
change ?

Thanks,
Guenter
