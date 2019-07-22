Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B509270A6C
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 22:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbfGVUN0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 16:13:26 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43127 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732524AbfGVUN0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 16:13:26 -0400
Received: by mail-io1-f67.google.com with SMTP id k20so76781883ios.10
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jul 2019 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7l2Wn+FJ2BG0j9D1JF5TbgHPijVR0AsIZvIp2BLcK5g=;
        b=Da2jcKUDozDPsXerQ0RRbZ0Kiy8fI8o4wDzBSauzAKL2ZDmDxnbuy57mb8AJZBI3Rj
         UdTbSFpfOT8v/ncvU5jBApagtN/BgoEM5N8WV5Yh2POwDGHjoYOSysWJEbDGyKGyfKkb
         BkpcRHyIo+/mU3nI8r658R5M3v18lRbVET3vE6PBKb/9usAwEp/IzE45DhfJJrip9uG1
         I+7rvOP/0gtgv/BYXgwc5GWRYDCtyKdZAASvnnLIgmAXtEw0zVwgGpxeKv1WVRXY73SG
         Opniqmwjov6YdZyINl32tlYFrbgGgCI4MX25cuAxXXnAkNaj/IoFJijL8IDSZxcC9KXl
         g65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7l2Wn+FJ2BG0j9D1JF5TbgHPijVR0AsIZvIp2BLcK5g=;
        b=DLORrBoQy0zjWW+P7wD9aHF0B0Gp7TwweZpUG1DxY7MCJYYboQzungecKEGyXesuYU
         jt3oDuwYgMOUiAhxpNXvKxHr9artlUD/vfQFglWT+/zQHw+2SCb/OmmDocxF/T3E5PCP
         c5DrGlfBGm0oBR36gIwu7e6wE0UnDjTUL7rUwd1qYYFBj30BniQpXstKIDv3LzGWUln4
         bxpYvsRssmtDny4scMRglzAuuMjBNzEr0hCoUzGeeGpAvwNnvY3r8hHQumsLYJa5fiKM
         TPtYG42/3EKo5sr7NyX+0i6JL8KOV+ibuyrtLrIv1fjKh1+kiOvsDZY5NQxmD/U6PaSE
         F+sw==
X-Gm-Message-State: APjAAAWRbvTYX+ffzQPnbsSdRmkTDR+x64nHy1UlUwvFsn+BLCp5Ecv8
        uR8Jw8NoxfqqbPuhSUARqFZhQMWadJ2YWT3NwyA=
X-Google-Smtp-Source: APXvYqyiAVhxu4nXny5pvNFjsFJ+z38F8yOUB1vGVezA4DDforKOQu16+Eoz95HvdgDnQBbS1HWonhdzq+Y9/TyPPXs=
X-Received: by 2002:a02:6a22:: with SMTP id l34mr76706311jac.126.1563826405473;
 Mon, 22 Jul 2019 13:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190415202501.941196-1-arnd@arndb.de> <2424c672-e3fb-4c32-4c24-fafc59d03a96@uclinux.org>
 <CACRpkdaJ+2bub_nDp9=5b4kyKjWDnOGKscWg3KsEVixDpk8rzA@mail.gmail.com>
 <20190503170613.GA1783@roeck-us.net> <d8d81aca-722d-8b5f-cd5f-30cc3e4e407b@kernel.org>
 <CAK8P3a0StV==jMq1L9k91qEsvRD1Cw2FB1V25wr1AQqzmjsTVw@mail.gmail.com>
In-Reply-To: <CAK8P3a0StV==jMq1L9k91qEsvRD1Cw2FB1V25wr1AQqzmjsTVw@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 22 Jul 2019 13:13:14 -0700
Message-ID: <CAOesGMjFgR3CWcVF__=nvhHzMsdBDriPJTLX6pqq4PHMDS_OxQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: ks8695: watchdog: stop using mach/*.h
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Ungerer <gerg@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        arm-soc <arm@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 7:44 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, May 4, 2019 at 4:27 PM Greg Ungerer <gerg@kernel.org> wrote:
> > On 4/5/19 3:06 am, Guenter Roeck wrote:
> > > On Fri, May 03, 2019 at 08:16:05AM +0100, Linus Walleij wrote:
> > >> On Fri, May 3, 2019 at 8:02 AM Greg Ungerer <gerg@uclinux.org> wrote:
> > >>> Ultimately though I am left wondering if the ks8695 support in the
> > >>> kernel is useful to anyone the way it is at the moment. With a minimal
> > >>> kernel configuration I can boot up to a shell - but the system is
> > >>> really unreliable if you try to interactively use it. I don't think
> > >>> it is the hardware - it seems to run reliably with the old code
> > >>> it has running from flash on it. I am only testing the new kernel,
> > >>> running with the existing user space root filesystem on it (which
> > >>> dates from 2004 :-)
> > >>
> > >> Personally I think it is a bad sign that this subarch and boards do
> > >> not have active OpenWrt support, they are routers after all (right?)
> > >> and any active use of networking equipment should use a recent
> > >> userspace as well, given all the security bugs that popped up over
> > >> the years.
>
> Looking around on the internet, I found that Micrel at some point
> had their own openwrt fork for ks8695, but I can't find a copy
> any more, as the micrel.com domain is no longer used after the
> acquisition by Microchip.
>
> https://wikidevi.com/wiki/Micrel has a list of devices based on
> ks8695, and it seems that most of these are rather memory
> limited, which is a problem for recent openwrt builds.
>
> Only two of the 17 listed devices have the absolute minimum of 4MB
> flash and 32MB RAM for openwrt, two more have 8/32 and one
> or two have 4/64, but all these configurations are too limited for the
> web U/I now.
>
> > >> With IXP4xx, Gemini and EP93xx we have found active users and
> > >> companies selling the chips and reference designs and even
> > >> recommending it for new products (!) at times.  If this is not the
> > >> case with KS8695 and no hobbyists are willing to submit it
> > >> to OpenWrt and modernize it to use device tree I think it should be
> > >> deleted from the kernel.
> > >>
> > >
> > > That may be the best approach if indeed no one is using it,
> > > much less maintaining it.
> >
> > Well, I for one don't really use it any more. So I don't have a lot
> > of motivation to maintain it any longer.
>
> I came across my patches while rebasing my backlog to 5.3-rc1.
>
> Should I save the (very small) trouble of sending them out again
> and just remove the platform then?

Given the lack of response/interest from users, I'm OK with removing it.

If someone shows up wanting support, we'll have a good opportunity to
discuss testing/modernization involving someone actively using the
hardware.


-Olof
