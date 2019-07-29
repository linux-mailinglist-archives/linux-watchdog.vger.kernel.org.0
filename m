Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 798C178FB4
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 17:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388155AbfG2PqL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 11:46:11 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38076 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfG2PqL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 11:46:11 -0400
Received: by mail-qt1-f195.google.com with SMTP id n11so60070790qtl.5;
        Mon, 29 Jul 2019 08:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MdHXLZwaqbOv7T3Hj3y1o9Z8ZEiEvQ/Zlrs0AB1LjQo=;
        b=sSeFAiX1pgVg9+ZwXyykpBaxJp7ObRvjXWvh6ma3Cec/RY3epQUq7APGuZ3EP9PIhB
         Tk9H+9Ptyo3SbmpRPII/mtUQz4I90Nm6BqtLtimsLq+3Sv2RoY+TaSpu/tEjcrSjn8zW
         I5CLPiOTU5Eb1UzyqvSooFdIuv1LlKNp47/na0Wi8kP/Uqb8iWk89A8hAzAQ6W+mqVxh
         d1O6s051fsr8OA0hwwmQj7YyogEhd9Sz1ET7M9sBLqLBfoxkVId/LDmHG9hde7i/MGx2
         pyI2yVKvtP3Ezo6c1+MJEcI6JvCXzY+JKPoT3ivFSoCQPu/lO22dPPrFEx08G7ohZcqD
         6m2w==
X-Gm-Message-State: APjAAAXYTvCpabrl4ZhqACqNs70WdNoFWQ8pRkGy64AzEVJ0SkC4RNob
        DK17gcEzLLoappAZGLRBpfbm6b+sFBlC7BmEhOI=
X-Google-Smtp-Source: APXvYqw/cgcq+yELqIxSSobC3ksc1GJZ0AXgiz/NIbvMz4AkwGr0gHwZI//W5CKPZAtnvTrcbOFyZ+FH8T2J6P7vEGY=
X-Received: by 2002:a0c:b88e:: with SMTP id y14mr77156754qvf.93.1564415170331;
 Mon, 29 Jul 2019 08:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190415202501.941196-1-arnd@arndb.de> <2424c672-e3fb-4c32-4c24-fafc59d03a96@uclinux.org>
 <CACRpkdaJ+2bub_nDp9=5b4kyKjWDnOGKscWg3KsEVixDpk8rzA@mail.gmail.com>
 <20190503170613.GA1783@roeck-us.net> <d8d81aca-722d-8b5f-cd5f-30cc3e4e407b@kernel.org>
 <CAK8P3a0StV==jMq1L9k91qEsvRD1Cw2FB1V25wr1AQqzmjsTVw@mail.gmail.com> <2bc41895-d4f9-896c-0726-0b2862fcbf25@kernel.org>
In-Reply-To: <2bc41895-d4f9-896c-0726-0b2862fcbf25@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 29 Jul 2019 17:45:53 +0200
Message-ID: <CAK8P3a19W73-NSdrTbG4NcVw1nYPV+K78kRbeZ8CwMUjnXhTzQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: ks8695: watchdog: stop using mach/*.h
To:     Greg Ungerer <gerg@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
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

On Mon, Jul 29, 2019 at 2:53 PM Greg Ungerer <gerg@kernel.org> wrote:
> On 23/7/19 12:44 am, Arnd Bergmann wrote:
> > On Sat, May 4, 2019 at 4:27 PM Greg Ungerer <gerg@kernel.org> wrote:
> >> On 4/5/19 3:06 am, Guenter Roeck wrote:
> >>> On Fri, May 03, 2019 at 08:16:05AM +0100, Linus Walleij wrote:
> >>>> With IXP4xx, Gemini and EP93xx we have found active users and
> >>>> companies selling the chips and reference designs and even
> >>>> recommending it for new products (!) at times.  If this is not the
> >>>> case with KS8695 and no hobbyists are willing to submit it
> >>>> to OpenWrt and modernize it to use device tree I think it should be
> >>>> deleted from the kernel.
> >>>>
> >>>
> >>> That may be the best approach if indeed no one is using it,
> >>> much less maintaining it.
> >>
> >> Well, I for one don't really use it any more. So I don't have a lot
> >> of motivation to maintain it any longer.
> >
> > I came across my patches while rebasing my backlog to 5.3-rc1.
> >
> > Should I save the (very small) trouble of sending them out again
> > and just remove the platform then?
>
> At this time I have no issue with removing it.

Ok, let's do that then.

For reference, this is what I think we should do for the
remaining ARM9 based platforms that never gained multiplatform
support, as time permits:

netx: is now removed
ks8695: remove next
w90x900: probably remove, need to confirm with last known users
davinci: almost multiplatform now, should be done in 5.4
ep93xx: convert to common-clk, generic-irq, then enable multiplatform
 (linusw is on it)
omap1: convert to common-clk, change pcmcia driver to common
  I/O space method, use dma_pfn_offset for virt_to_bus, add ugly
  hacks for cpu_is_omap*() and omap_readl(), then enable multiplatform
  (arnd has started this)
lpc32xx: clean up header files so we can build last 6 drivers
  independently, then move to multiplatform, probably after 5.4
  I have patches for this somewhere.
s3c24xx: change 18 drivers that still use mach/* headers, get
  creative about mach-bast ISA I/O space

        Arnd
