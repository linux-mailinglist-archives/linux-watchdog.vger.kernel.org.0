Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F8B30361C
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jan 2021 07:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbhAZGAz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jan 2021 01:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbhAYMwc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jan 2021 07:52:32 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508DAC06174A;
        Mon, 25 Jan 2021 03:14:32 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n10so8642162pgl.10;
        Mon, 25 Jan 2021 03:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9MDoopSGxeIubZb9Ea5LNLoohJkL55ZuklY1qkGjioU=;
        b=iFFQQNLIH8MeXeoZLF35XxFr2GVK2LCMT3a4uiBuoHqqbm9KtIR4zQZYXg4sfhyesW
         jtV/vSntKpIvP/smVSbomec5khjwVUZU4Mpcm+4FZTFOgdWs+rmqm34sPP7o/a2l6p/K
         wtR2pctmfNg4G291SUyJCUAUwgUAbPSYygbJi8AdJlefjCZc8FURUe7JSAn0bAV45Gr9
         cYhn/iG9xMUZ/JrTpqIrGRcqgvtVzIP74C4TmzNi/HDoMCIJJsRZrRk444X3VDW5mxmc
         lOZ0K35lHeR6rrDAe1yzNEhNxCDYa7zcTcjRSQAaNVfIThfpWPpk9jmatRbOm6c/EGYw
         kv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9MDoopSGxeIubZb9Ea5LNLoohJkL55ZuklY1qkGjioU=;
        b=INMYUsIQg80amPlfd8AbrfCCzDRhBXx8I2nEh+hE6wjApe2gdVES907ykeMOCCZmuN
         XBBfMLHquCiX+QWQNpYx7RZOom26ke9ya8rh6kliDeHgq65TGv0MhEd7LD0wGlnhBYKM
         BB1pwn7bAT6iQtQo4Ie7EOXr/pmg8rh1s8e87IC+qX05TRdR2hHmPQjnyeosKOH9hbqx
         2r6FrBZ1lTIjvT0eopt65+chw+1Go4P2azt/pprGV34gzYiqfr7DOgIJsf/rRJiHvW91
         BFJZeRVEqk8HxcIkByPzwShjSL7cSU+ywNRhhxs/vGN4DC/FWXdEZMAtfdUEDkBTNqUx
         EBsQ==
X-Gm-Message-State: AOAM533Lu95BOSvMjz5IHynWksx6SFYAsrWHAyE24m7LwsT9nyQ5Ksx+
        qnYaX1RTF3wFyYR+jvldsU7xhTLIWpzpdcGKhOk=
X-Google-Smtp-Source: ABdhPJxPDgHNGzm1GRMIOIFpOTFAZ61OrN5NxCMaDSCzBn3T2cC8EqRcPHVvzIcACKgf5V7tfixFPHZ16YluF9PhPvc=
X-Received: by 2002:a63:fc56:: with SMTP id r22mr122244pgk.203.1611573271723;
 Mon, 25 Jan 2021 03:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com> <YArtsQSQsGdfNlBI@smile.fi.intel.com>
 <YArzAvcZXfv8DaI4@smile.fi.intel.com> <4ba64643-9254-055d-49a0-55104b8669d8@redhat.com>
 <1d57c7b0-9ef4-3306-1566-2b99f40d92d1@roeck-us.net> <eeda93c6-04cb-a775-7d79-b29a53c6a138@redhat.com>
In-Reply-To: <eeda93c6-04cb-a775-7d79-b29a53c6a138@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 13:15:21 +0200
Message-ID: <CAHp75VdE4LSHTKLuZ6x744224N2AvbMU0JeMmTWoqeEHDj7=2A@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jan 23, 2021 at 2:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/23/21 1:27 AM, Guenter Roeck wrote:
> > On 1/22/21 1:04 PM, Hans de Goede wrote:
> >> On 1/22/21 4:45 PM, Andy Shevchenko wrote:
> >>> On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
> >>>> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:

> >>>>> What is the plan for merging this series ?
> >>>>>
> >>>>> It touches files under:
> >>>>> arch/x86
> >>>>> drivers/watchdog
> >>>>> drivers/platform/x86
> >>>>>
> >>>>> It is probably best if the entire series is merged through a single
> >>>>> tree. I don't expect this to cause any conflicts with current / upcoming
> >>>>> changes under drivers/platform/x86, so I'm fine with this being merged
> >>>>> through another tree.
> >>>>>
> >>>>> Or if I can get an ack for that from the x86 and watchdog maintainers
> >>>>> I can merge the entire series through the pdx86 tree.
> >>>>
> >>>> For time being I'm collecting tags and comments.
> >>>> As of today this series is independent per se, but other (later) clean up
> >>>> patches may rely on this.
> >>>>
> >>>> One strategy can be providing an immutable branch for anybody who wants it and
> >>>> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
> >>>> are more patches touching other stuff, though independently, in this matters).
> >>>
> >>> Yes, I think one more time and guess the best is:
> >>>  - get tags from x86 / watchdog
> >>>  - get tag from RTC
> >>>  - collect everything in PDx86 immutable branch
> >>
> >> Ok, that works for me. I assume that it is best for the other subsystems
> >> if I create an immutable branch for this based on 5.11-rc1
> >> (and then merge that into pdx86/for-next) ?
> >>
> >> Guenter, I believe you have already reviewed all the watchdog changes,
> >> are you ok with me creating an immutable branch for the entire series
> >> and then sending you a pull-req for that ?
> >
> > Wim handles watchdog pull requests,

Wim, can you Ack the watchdog changes?

> Ah, sorry I was under the impression you would do that because you were
> doing the reviews (which I'm sure Wim appreciates).
>
> > and he usually creates a branch
> > for Linus to pull from either during or shortly before a commit window.
> > Also, I don't immediately see why the watchdog tree should carry the other
> > patches of this series, immutable or not; I would not expect a dependency
> > against those.
> >
> > Anyway, I am fine if the the wdt driver removal is submitted through some
> > other branch.
>
> Hmm, looking at the code again it indeed seems that patch 1/5 + 2/5 could
> be simply merged through the watchdog tree, as they don't appear to
> have any interdependencies with the arch/x86 and drivers/platform/x86
> changes.  Andy ?

The first patch is a dependency to the later (that are not published yet).
I was considering gathering all dependent patches in immutable
branches and doing in three parts / phases.

I can prepare a branch with a first batch (with Acks from respective
maintainers) and send a PR to you.
Would it work?

-- 
With Best Regards,
Andy Shevchenko
