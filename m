Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4411046D2
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 00:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfKTXFW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 18:05:22 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33516 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKTXFW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 18:05:22 -0500
Received: by mail-pg1-f194.google.com with SMTP id h27so519637pgn.0;
        Wed, 20 Nov 2019 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fEgMaaNTaJm+nq3mUM5KWnkaiG88YnYcMDwaJlNqGkg=;
        b=azQfCFwwF8GVZ9jpeCJY3J1noNcX3dGd0/oZlG5/VXBUkcoDXl6Du5SbDlLEYrdhKt
         EIkzPFhkJzWH/2owPB3EhKHz5gGJwfUIQnQ2KjfK8h4+6VEGQu5K/pzgWZT5FfYmV96A
         oHiWDyV5MqLC7Uxzp51YH75V4psRVwmN7FXz/j5wjlhyV8p8T60MfwjlavUwY0FHPFaS
         cKbWR8eQ/jBThc/uYlVHRgDOsIKcGgDhafCgg6wkZfsoSe1+wor4ZfRgw6IXbP5KU1Vy
         AiQh1VIu9ImzSrPM257+VuWBrDbTCHRaAJymuBTd/snulCHyOLGlKmFyDB+GL/jJQSWo
         2h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fEgMaaNTaJm+nq3mUM5KWnkaiG88YnYcMDwaJlNqGkg=;
        b=hlpSg21BKo1was/ra2+aELQuhzDer2UMcs6mkYjQLcXtutMKWUIgDBATDXS7ieNB9p
         B53Tn9jJX7ZFa8PWoNWmLD3BzVH9x+DkPqt42dhyXdU8IxrBLr10TaIirmcwu+3h3ipa
         /VQFzN9g+OKrwo8H4mzl7r8hbPKbn8U/DZjaPYwMcMlhKhNzd4HClB0Qa7jsszcMjavd
         5DZaKL+9eMD3YXN9HDYXZkck0b7puc3aCe7+YwDrmZgM89y4kISEikqdtynBovjieuya
         DDa7BXckxlOZUjRoPfokrnWy+SGawHTftgYGfKIUr/LWtCQAZ603Q/t7G9Ak4EvEkjgx
         dGXA==
X-Gm-Message-State: APjAAAVYYon65iPSPkyxFT6MiQwX+SV9AjhjRwxbHLFpK4qtZnNfuuIL
        BDh7JJlexxA/n1nXZkbqdTWVzfjz
X-Google-Smtp-Source: APXvYqyeatjOE8ZdhjhAL3RTT2QES7GZMa28Dzq4gMY+w98XHvox0r2Nx00d0c3Yn3oC3AM0xnhCTw==
X-Received: by 2002:a65:67c1:: with SMTP id b1mr5985171pgs.149.1574291121185;
        Wed, 20 Nov 2019 15:05:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f7sm452075pfa.150.2019.11.20.15.05.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 15:05:20 -0800 (PST)
Date:   Wed, 20 Nov 2019 15:05:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lennert Buytenhek <kernel@wantstofly.org>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
Message-ID: <20191120230518.GA28840@roeck-us.net>
References: <20191118220432.1611-1-labbott@redhat.com>
 <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
 <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net>
 <20191120100341.GK25745@shell.armlinux.org.uk>
 <CAK8P3a2N+aDgFz75dFJy3Me9FPdyDSyPaa29FngLjfXX3MzfvA@mail.gmail.com>
 <20191120103054.GM25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120103054.GM25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 20, 2019 at 10:30:54AM +0000, Russell King - ARM Linux admin wrote:
> On Wed, Nov 20, 2019 at 11:15:01AM +0100, Arnd Bergmann wrote:
> > On Wed, Nov 20, 2019 at 11:03 AM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > > On Tue, Nov 19, 2019 at 06:29:09AM -0800, Guenter Roeck wrote:
> > > > On 11/19/19 1:40 AM, Arnd Bergmann wrote:
> > > > > On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > On 11/18/19 2:04 PM, Laura Abbott wrote:
> > > >
> > > > Good point, especially since apparently no one cared for five years.
> > >
> > > Doesn't mean that there aren't interested parties.  I still have
> > > IOP32x hardware running here in the form of a N2100 (my firewall)
> > > and it seems that I never noticed this option disappearing until
> > > now...
> > 
> > It's not that it was ever there for IOP32x: the driver was introduced in 2007
> > and was available for IOP32x but failed to compile for it until 2014 when
> > I sent the patch to disable the driver in all configurations that
> > failed to build.
> 
> Well:
> 
> systems/n2100/boot/config-3.11.5+:CONFIG_IOP_WATCHDOG=m
> systems/n2100/boot/config-3.12.6+:CONFIG_IOP_WATCHDOG=m
> systems/n2100/boot/config-3.9.5+:CONFIG_IOP_WATCHDOG=m
> 
> -rw-rw-r-- 1 rmk rmk 5284 Dec 30  2013 systems/n2100/lib/modules/3.12.6+/kernel/drivers/watchdog/iop_wdt.ko
> -rw-rw-r-- 1 rmk rmk 5276 Dec 20  2013 systems/n2100/lib/modules/3.9.5+/kernel/drivers/watchdog/iop_wdt.ko
> 
> It seems I've been carrying a patch to comment out the troublesome code:
> 
> -       write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> +//     write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> 
> in my stable tree since 2015.

Do you have plans to update that kernel to mainline ?
If yes, a patch to make the driver (and I guess everything else that broke
since 3.12) work would be helpful.

Thanks,
Guenter
