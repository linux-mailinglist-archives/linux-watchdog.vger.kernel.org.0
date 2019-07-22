Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6377E70293
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 16:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfGVOoY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 10:44:24 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42849 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfGVOoY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 10:44:24 -0400
Received: by mail-qt1-f193.google.com with SMTP id h18so38753716qtm.9;
        Mon, 22 Jul 2019 07:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81AiTjgcr+8mwqG5ADbTHsr21uDJPCLJa70/ct/bcjM=;
        b=QYBXb4+hRgH21kAiS56bAy9YCv5+0zP4yDqWq2zGSAYPK8zwCuvT8fO9QdkqvjQz+g
         hRiQeaUQkvK+u1qxhXNGPYRzLYMEL87413nZ3FOXqSQZGcI6oB+YMnK/YhHje0eQ/FHY
         /JoIL7XhxZTafwciB97TT9FwQ9kmlBQSD4jdX+9L/mO0BMYrPTZ1CeLvmqaacPLn5w4j
         BuUbw3ZHMEY8syqQBZ+FOlComyxBbA6qcjX7YTaiHRx4G9sqmKy5IYjuwkbCe8RWef4p
         Y/PbmYRY+XoYym9AD/elvvg6vg7+h7vxYktQM0meF17NC55XY6WK5tsHZEwC3tH/KFQG
         Svtg==
X-Gm-Message-State: APjAAAX9WXh50RteF9wuXcS8ykAlNXjMtD+B/vhednu5xBMdQqKg8O0b
        1GGcnFw2SRvrzg9qmk+aWjJ8gJ90C47uRfNoBEk=
X-Google-Smtp-Source: APXvYqxaPxahPpsd+f/e2N1hLvn+NlsWWWq9cW2deYXM49rjFloV4WlsOLyToo2CiUPq30T5CLiBuUUzmLDJwt9ja4w=
X-Received: by 2002:aed:3363:: with SMTP id u90mr50010402qtd.7.1563806663345;
 Mon, 22 Jul 2019 07:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190415202501.941196-1-arnd@arndb.de> <2424c672-e3fb-4c32-4c24-fafc59d03a96@uclinux.org>
 <CACRpkdaJ+2bub_nDp9=5b4kyKjWDnOGKscWg3KsEVixDpk8rzA@mail.gmail.com>
 <20190503170613.GA1783@roeck-us.net> <d8d81aca-722d-8b5f-cd5f-30cc3e4e407b@kernel.org>
In-Reply-To: <d8d81aca-722d-8b5f-cd5f-30cc3e4e407b@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 22 Jul 2019 16:44:06 +0200
Message-ID: <CAK8P3a0StV==jMq1L9k91qEsvRD1Cw2FB1V25wr1AQqzmjsTVw@mail.gmail.com>
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

On Sat, May 4, 2019 at 4:27 PM Greg Ungerer <gerg@kernel.org> wrote:
> On 4/5/19 3:06 am, Guenter Roeck wrote:
> > On Fri, May 03, 2019 at 08:16:05AM +0100, Linus Walleij wrote:
> >> On Fri, May 3, 2019 at 8:02 AM Greg Ungerer <gerg@uclinux.org> wrote:
> >>> Ultimately though I am left wondering if the ks8695 support in the
> >>> kernel is useful to anyone the way it is at the moment. With a minimal
> >>> kernel configuration I can boot up to a shell - but the system is
> >>> really unreliable if you try to interactively use it. I don't think
> >>> it is the hardware - it seems to run reliably with the old code
> >>> it has running from flash on it. I am only testing the new kernel,
> >>> running with the existing user space root filesystem on it (which
> >>> dates from 2004 :-)
> >>
> >> Personally I think it is a bad sign that this subarch and boards do
> >> not have active OpenWrt support, they are routers after all (right?)
> >> and any active use of networking equipment should use a recent
> >> userspace as well, given all the security bugs that popped up over
> >> the years.

Looking around on the internet, I found that Micrel at some point
had their own openwrt fork for ks8695, but I can't find a copy
any more, as the micrel.com domain is no longer used after the
acquisition by Microchip.

https://wikidevi.com/wiki/Micrel has a list of devices based on
ks8695, and it seems that most of these are rather memory
limited, which is a problem for recent openwrt builds.

Only two of the 17 listed devices have the absolute minimum of 4MB
flash and 32MB RAM for openwrt, two more have 8/32 and one
or two have 4/64, but all these configurations are too limited for the
web U/I now.

> >> With IXP4xx, Gemini and EP93xx we have found active users and
> >> companies selling the chips and reference designs and even
> >> recommending it for new products (!) at times.  If this is not the
> >> case with KS8695 and no hobbyists are willing to submit it
> >> to OpenWrt and modernize it to use device tree I think it should be
> >> deleted from the kernel.
> >>
> >
> > That may be the best approach if indeed no one is using it,
> > much less maintaining it.
>
> Well, I for one don't really use it any more. So I don't have a lot
> of motivation to maintain it any longer.

I came across my patches while rebasing my backlog to 5.3-rc1.

Should I save the (very small) trouble of sending them out again
and just remove the platform then?

      Arnd
