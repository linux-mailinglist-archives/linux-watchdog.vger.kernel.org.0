Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893561F46A4
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jun 2020 20:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgFISwq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jun 2020 14:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389016AbgFISwh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jun 2020 14:52:37 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AA0C08C5C4
        for <linux-watchdog@vger.kernel.org>; Tue,  9 Jun 2020 11:52:35 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d128so4213786wmc.1
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jun 2020 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Rx+KqvmtdByLRiHw7ISbnHgkCLyaMrdXIypQJ9D83NM=;
        b=ArNCp5jy8xw0o8QYdJ3Qz1qQoc5OchvaEoyPj/G3Qwd05C7R7/XwhufiBSsQAM3dmM
         o0o0yks+I4S6jJDHffPGL+45DtgPleewkT66ldWqf86ww/dLeMP4ZtCohqmksRgJPz/3
         cg7JbiDfz+XazkwnFo3bl4Qh1Pgcd7l+MUv645Vmj6YkhES6S5IX42bQhMaCpXAnhpFH
         8d43uufA2OACUuQ9lwM1TydKIO0QRdLKkPIMNd8j9lf3nKqYCXvC8ZnBgxtwxqH3Js7M
         lE2iXBVCw2E3+yLybw5nLs2eUzHLcDA9pV66llGAGFA074R7HHjv9OaEJR6iGCSCMiKi
         Vjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Rx+KqvmtdByLRiHw7ISbnHgkCLyaMrdXIypQJ9D83NM=;
        b=rzJZcaXD/EsmysszawZZvylX3eHdg08a/7PBoZF6t8X/1f0z3e3jf+RrJjkKSc2cF7
         JzJPx6HhcinREwhsOEpfd/+gEuY9Ku8KlRmZ5epI12qICcSb2lKGQPS5hvzF2zYACA5r
         7gneL0JEYlkd+eAcMDrm7wepWHB9CfMBmTMtEPA2EL+UQS86Rt/7dMC6wVg3vJZZGlC0
         MMO1sKmI+PqM7nw4vkUppQGAp1TUJ+lhFK8yoy7+j/QmYhch3yY0p68d3s4QIeSMYAh8
         U5lvziaG4HeIKeKA9vZ78CT53d/POIm1wqj6MiCpVcacaQjV/iayGXbZOC9cAg/kgtql
         pG+Q==
X-Gm-Message-State: AOAM530oRUZGK1h+4SVBrjkEvGEtIneCres8yNDfMfKpB1dkWrTxj9DJ
        ddLcIITWxEEdS15kfl9Pro8ffw==
X-Google-Smtp-Source: ABdhPJwpZZ7S4GqJFNik24T6FJp5nAop3BUokybQq1cMXdlH57TCJy3rpjeZBHUZlWR02zEPG6whnQ==
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr5692273wmr.26.1591728754296;
        Tue, 09 Jun 2020 11:52:34 -0700 (PDT)
Received: from dell ([2.27.167.101])
        by smtp.gmail.com with ESMTPSA id b185sm4390216wmd.3.2020.06.09.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 11:52:33 -0700 (PDT)
Date:   Tue, 9 Jun 2020 19:52:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 02/11] mfd: Add support for Kontron sl28cpld
 management controller
Message-ID: <20200609185231.GO4106@dell>
References: <20200604211039.12689-1-michael@walle.cc>
 <20200604211039.12689-3-michael@walle.cc>
 <20200605065709.GD3714@dell>
 <20200605105026.GC5413@sirena.org.uk>
 <c5632bfab3956265e90fc2fb6c0b3cae@walle.cc>
 <20200606114645.GB2055@sirena.org.uk>
 <dc052a5c77171014ecc465b1da8b7ef8@walle.cc>
 <20200608082827.GB3567@dell>
 <20200609165401.GB1019634@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200609165401.GB1019634@bogus>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 09 Jun 2020, Rob Herring wrote:

> On Mon, Jun 08, 2020 at 09:28:27AM +0100, Lee Jones wrote:
> > Rob, something for you below.
> > 
> > On Sat, 06 Jun 2020, Michael Walle wrote:
> > > Am 2020-06-06 13:46, schrieb Mark Brown:
> > > > On Fri, Jun 05, 2020 at 10:07:36PM +0200, Michael Walle wrote:
> > > > > Am 2020-06-05 12:50, schrieb Mark Brown:
> > > > 
> > > > > > I have no idea what you are thinking of when you say "simple-regmap" so
> > > > > > it is difficult to comment.
> > > > 
> > > > > I guess, Lee is suggesting to be able to create a regmap instance via
> > > > > device tree (and populate its child nodes?). Like
> > > > >   compatible = "syscon", "simple-mfd";
> > > > > but for any regmap, not just MMIO.
> > 
> > Bingo!
> > 
> > > > I don't understand why this would be anything separate to
> > > > simple-mfd.
> > > 
> > > Don't just simple-mfd tells the of core, to probe the children this
> > > node? Where does the regmap then come from?
> > 
> > Right.  I'm suggesting a means to extrapolate complex shared and
> > sometimes intertwined batches of register sets to be consumed by
> > multiple (sub-)devices spanning different subsystems.
> > 
> > Actually scrap that.  The most common case I see is a single Regmap
> > covering all child-devices.  It would be great if there was a way in
> > which we could make an assumption that the entire register address
> > space for a 'tagged' (MFD) device is to be shared (via Regmap) between
> > each of the devices described by its child-nodes.  Probably by picking
> > up on the 'simple-mfd' compatible string in the first instance.
> > 
> > Rob, is the above something you would contemplate?
> 
> No. I'd like to just kill off syscon and simple-mfd really. Those are 
> just hints meaning a specific compatible is still needed, but I see them 
> all the time alone (or combined like above). 'syscon' just serves to 
> create a regmap. This could be accomplished just with a list of 
> compatibles to register a regmap for. That might be a longish list, but 
> wanting a regmap is really a kernel implementation detail and decision.

Exactly.  Syscon is a real tangible thing and Regmap is a Linux
subsystem.  So swapping out the former for the latter sounds like the
opposite of what you'd want to do.

> > > MFD core can
> > > match a device tree node today; but only one per unique compatible
> > > string. So what should I use to differentiate the different
> > > subdevices?
> > 
> > Right.  I have been aware of this issue.  The only suitable solution
> > to this would be to match on 'reg'.
> > 
> > FYI: I plan to fix this.
> > 
> > If your register map needs to change, then I suggest that this is
> > either a new device or at least a different version of the device and
> > would also have to be represented as different (sub-)mfd_cell.
> 
> The same register set at a different offset is the same (sub)device.

See below.

> > > Rob suggested the internal offset, which I did here.
> > 
> > FWIW, I don't like this idea.  DTs should not have to be modified
> > (either in the first instance or subsequently) or specifically
> > designed to patch inadequacies in any given OS.
> 
> My understanding is there can be differing combinations or number of 
> instances of sub devices for this device. That's when having DT sub 
> devices makes sense. If the h/w changes, then the DT should change.

This is the same point I was making above.

> Multiple instances of devices require an address to identify them and we 
> don't make up numbering if we can avoid it. The earlier revisions just 
> had made up indices for addresses.

Right.  Which I'm against.

Placing "internal offsets" into the 'reg' property is a hack.

The issue is, if we need to configure the devices differently, then
how do we identify them in order to ensure the correct OF node pointer
is allocated to the correct platform device?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
