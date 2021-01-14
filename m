Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB4B2F5E3E
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Jan 2021 11:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbhANKBH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Jan 2021 05:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbhANKAw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Jan 2021 05:00:52 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABC2C061574
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Jan 2021 02:00:04 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i63so3979201wma.4
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Jan 2021 02:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tBwa88PnnPvfhT0zH6tlnPzclZk+pRp4GKUcHZy06XI=;
        b=e9JuoVN+Nnag+M9i1dhhZZaRlfAIEXr26DCtH0AmzSg0X3ojyQGj8gegdZCJ193L/J
         NFo/NBnzJFJmZfyN4enk1A8cGu+5TsiAKJ0Zh5QlhSJaXPkNWtKGDUD/eRAEUerhXzec
         +0hJT5sVyCb/uVhCw6LeAfJwfS0gGdupMFtlU5xIDxUYtWbAtmG/QXpZwqp9twojxU7G
         vZZNoNFbohh6MKyYItrO0Fd6J7cnmyh4w+GT7zGieXJ1DbzJWQvX71mZpQOgGKfuzSUs
         c2NHWBEHGUJAUTjRyCVzL5xiz4QhnJ4LmsIqbhS3kb5MSur3YfSJUFyTr61WvFeRqxIS
         NuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tBwa88PnnPvfhT0zH6tlnPzclZk+pRp4GKUcHZy06XI=;
        b=bg9Ejz7sXjChXMh2jPGwb/yhMcwuhaDShIpnvfi420mPLIuOxZCu9ArNBiUYYHyNRw
         ii0RhnsWTihdZHfSj1RN8FDu1CmZa4vUc9u5B8bpKSdKgZMcBmQQDK8RAL8OxTcfKzdX
         I2R+kTMGoc+GjU3BeWSJphVAipSfP+i983DslzUccF7IuLzgLw2vm/Lz3awCMCDDBQgt
         CZFDhNgepfLmjBhjdPj9TypM9xTUKsn6Zx/fpseIdt+bpzrx6tphZT4lK5OcNHmpJMPV
         4P9Y/gYdEQQUFbZR6GyxPlUFwiFodaEp5ram1/rm8bMHXYJSVoIQ1LIENfab2Rv69dsw
         2dKg==
X-Gm-Message-State: AOAM5323hTkAVnCUbKaWLCBgU+j/xuzfPAU+Od6byNIA4OmrUHfyGTFe
        Km8enbW4wD3CUv3MYhlX+lDL0A==
X-Google-Smtp-Source: ABdhPJyk2adzO4fbhrQWuLvpfNMZB423i0gszJ6UsC/u6WDRGhxg6/UyNDYvRObCwC4ii13oPYhy+A==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr3237151wmj.40.1610618403029;
        Thu, 14 Jan 2021 02:00:03 -0800 (PST)
Received: from dell ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id i18sm9012903wrp.74.2021.01.14.02.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 02:00:02 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:00:00 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <20210114100000.GK3975472@dell>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
 <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
 <20201127083242.GK2455276@dell>
 <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
 <20201202125723.GK4801@dell>
 <3bab8bd8c69a878f849a07dd9ea35bfac2006da2.camel@fi.rohmeurope.com>
 <c2949e981014c049571df355501f2af65b3954de.camel@fi.rohmeurope.com>
 <8a6373aa33aa19d850d3802d6579e66b97c8d325.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a6373aa33aa19d850d3802d6579e66b97c8d325.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 29 Dec 2020, Vaittinen, Matti wrote:

> Hello Again peeps,
> 
> On Thu, 2020-12-17 at 12:04 +0200, Matti Vaittinen wrote:
> > On Wed, 2020-12-02 at 15:32 +0200, Matti Vaittinen wrote:
> > > Hello Lee,
> > > 
> > > On Wed, 2020-12-02 at 12:57 +0000, Lee Jones wrote:
> > > > On Fri, 27 Nov 2020, Vaittinen, Matti wrote:
> > > > 
> > > > > Hello Lee,
> > > > > 
> > > > > On Fri, 2020-11-27 at 08:32 +0000, Lee Jones wrote:
> > > > > > On Mon, 23 Nov 2020, Matti Vaittinen wrote:
> > > > > > 
> > > > > > > Add core support for ROHM BD9576MUF and BD9573MUF PMICs
> > > > > > > which
> > > > > > > are
> > > > > > > mainly used to power the R-Car series processors.
> > > > > > > 
> > > > > > > Signed-off-by: Matti Vaittinen <
> > > > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > > > ---
> > > > > > >  drivers/mfd/Kconfig              |  11 ++++
> > > > > > >  drivers/mfd/Makefile             |   1 +
> > > > > > >  drivers/mfd/rohm-bd9576.c        | 108
> > > > > > > +++++++++++++++++++++++++++++++
> > > > > > >  include/linux/mfd/rohm-bd957x.h  |  59 +++++++++++++++++
> > > > > > >  include/linux/mfd/rohm-generic.h |   2 +
> > > > > > >  5 files changed, 181 insertions(+)
> > > > > > >  create mode 100644 drivers/mfd/rohm-bd9576.c
> > > > > > >  create mode 100644 include/linux/mfd/rohm-bd957x.h
> > > > > > 
> > > > > > Looks like a possible candidate for "simple-mfd-i2c".
> > > > > > 
> > > > > > Could you look into that please?
> > > > > > 
> > > > > I must admit I didn't know about "simple-mfd-i2c". Good thing
> > > > > to
> > > > > know
> > > > > when working with simple devices :) Is this a new thing?
> > > > 
> > > > Yes, it's new.
> > > > 
> > > > > I am unsure I understand the idea fully. Should users put all
> > > > > the
> > > > > different regamp configs in this file and just add the device
> > > > > IDs
> > > > > with
> > > > > pointer to correct config? (BD9576 and BD9573 need volatile
> > > > > ranges).
> > > > > Also, does this mean each sub-device should have own node and
> > > > > own
> > > > > compatible in DT to get correctly load and probed? I guess this
> > > > > would
> > > > > need a buy-in from Rob too then.
> > > > 
> > > > You should describe the H/W in DT.
> > > 
> > > Yes. And it is described. But I've occasionally received request
> > > from
> > > DT guys to add some properties directly to MFD node and not to add
> > > own
> > > sub-node. This is what is done for example with the BD71837/47
> > > clocks
> > > -
> > > there is no own node for clk - the clk properties are placed
> > > directly
> > > in MFD node (as was requested by Stephen and Rob back then - I
> > > originally had own node for clk). I really have no clear view on
> > > when
> > > things warrant for own subnode and when they don't - but as far as
> > > I
> > > can see using simple-mfd-i2c forces one to always have a sub-node /
> > > device. Even just a empty node with nothing but the compatible even
> > > if
> > > device does not need stuff from DT? Anyways, I think this is nice
> > > addition for simple drivers.
> > > 
> > > > > By the way - for uneducated eyes like mine this does not look
> > > > > like
> > > > > it
> > > > > has much to do with MFD as a device - here MFD reminds me of a
> > > > > simple-
> > > > > bus on top of I2C.
> > > > 
> > > > This is for MFD devices where the parent does little more than
> > > > create
> > > > a shared address space for child devices to operate on - like
> > > > yours.
> > > > 
> > > > > Anyways, the BD9576 and BD9573 both have a few interrupts for
> > > > > OVD/UVD
> > > > > conditions and I am expecting that I will be asked to provide
> > > > > the
> > > > > regulator notifiers for those. Reason why I omitted the IRQs
> > > > > for
> > > > > now is
> > > > > that the HW is designed to keep the IRQ asserted for whole
> > > > > error
> > > > > duration so some delayed ack mechanism would be needed. I would
> > > > > like to
> > > > > keep the door open for adding IRQs to MFD core.
> > > > 
> > > > You mean to add an IRQ Domain?
> > > 
> > > Yes. I planned to use regmap-irq and create irq chip in MFD when
> > > the
> > > over / under voltage / temperature - notifications or watchdog IRQs
> > > are
> > > needed. 
> > 
> > I am sorry if I have missed your reply. The ROHM email had redirected
> > almost all patch emails to spam + I am not sure if some mails are
> > dropping :(
> > 
> > (I am considering moving to gmail - but I'd rather keep all mails in
> > one system and I can't transfer work mail traffic to gmail... I
> > wonder
> > how others are managing the mails - which mail system you are using?)
> > 
> > I think this series is now pending the decision how to proceed with
> > MFD
> > part. If you still want me to start with "simple-mfd-i2c", then I
> > would
> > appreciate if you pointed me how you would like to see the regmap
> > configs added. Although I am quite positive this (eventually) ends up
> > being more than what simple-mfd-i2c is intended for (because at some
> > point people want to add the use of the interrupts).
> 
> Looking at this topic again. I kind of understand the idea of combining
> bunch of MFD drivers into one file. Many of the ROHM PMIC MFD drivers
> do provide same functionality. Regmap configs, regmap IRQ and MFD
> cells. Some do also probe the device. So having own file for each IC is
> likely to not scale well when more devices are supported (and I do hope
> this will be the case also with the ROHM ICs).
> 
> What bugs me with the simple-mfd-i2c here is:
> 1. Requiring to have own compatibles for sub-devices (regulator and
> WDG) to get them properly probed. (3 compatibles for 1 IC).
> 2. Requiring to have own DT node for WDG.
> 3. Supporting differences between BD9576 and BD9573 by having 6
> compatibles for 2 ICs.
> 4. Adding interrupt support.

Linux sees each of these functions as separate devices which are
handled in different ways by isolated subsystems.  So yes, they each
require their own compatible string regardless of whether they share
the same physical piece of silicon or not.

> So ... How do you see adding BD9576/BD9573 MFD stuff in BD9571/(BD9574)
> MFD driver? The data structures (regmap configs, MFD cells, regmap IRQ
> portion when added) will be different but the functions and maybe
> engineers looking at these may be common.
> 
> Is it just plain confusing to add core structures for technically
> different ICs in same file - or is it way to avoid duplicating same
> code in many files? I can try adding the BD9576/BD9573 to the BD9571
> core - or I can do resend this as is (rebased on 5.11). I can also hack
> this to be kicked by simple-mfd-i2c (although I have these strong
> objections) - but I bet it will in the long run just lead to a sub-
> optimal solution. When the BD9576/BD9573 logic blocks are re-used in
> some "non simple" designs and re-using the sub-drivers is needed and/or
> when IRQs are needed.
> 
> (BTW - I am currently working with BD71815/BD71817 - and after this
> discussion I will add these in BD71828/BD71878 MFD core. I had created
> new MFD file for them but this discussion has been a nice kick to the
> better direction for me)

Everything will be a trade-off.

There will either be superflouous files or inflexible code.

You have to make the right decision for the driver and the subsystem.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
