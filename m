Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1BB303241
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jan 2021 03:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbhAYNwj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Jan 2021 08:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbhAYNwJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jan 2021 08:52:09 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AE7C06174A;
        Mon, 25 Jan 2021 05:51:20 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id z21so8939383pgj.4;
        Mon, 25 Jan 2021 05:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWUF9sk6aAtbCcNvEafq7sz3OWsvQ496bVTDX1JAh1k=;
        b=A+ZwgBJV3zw5DaExWioh221t3IGyNlFttWc0FjTmOIlVqgcm0chiXZQReo3L4bmdxm
         qDrqoH1iQAzGfmkzNC0+GaDVJURAuSMIfng2QzOWPiy32D2lhtx33iz/8LWxhYLdgueI
         MGcnq6cNIRyL+7g2h+jA/lLb553Ma97swsDJLA7xntRrJnJ6Y4ovCD/FaEPKfm8Ome6B
         EwlXkRfqV2fxlmdLG89NR+Rzp9Or6MPw+36LINyLlEXqjSFLXiyQbKKHibeOrsMKj7JI
         Q50nCiL+gl9lR7F0US4nmz1UxZLbIC7JSACJY7a6kyC2ml+ujEoaGtAeX2n3uRF+oHpz
         7JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWUF9sk6aAtbCcNvEafq7sz3OWsvQ496bVTDX1JAh1k=;
        b=NJ7IoJaFgaikC0h9zvhx27U9JHbJ+e9Bk/sgWURDo4f4B60mgvR4+WH5ccPuPpjTgL
         NU6Hv7/6+gTAlO0F3dbJoSSD1LVHmlW3zHGryzN1vejUKAoUpJ7oLPp4ANWv37ROlKSu
         XNqpcXE0G0leFAb0Fj5YFHhCOL+zBsd5HiDoUi62hbN3mcWxX8zGI8HTBVnDSUbSXs7D
         mBEOAUip7grkGLEQInOV4+EGEMZcaBQLPL12carcjZpXK2biyPzRO1BCUWtQzDTaDYOH
         o95MZPWzfvYS7Kkl1BDP3S/jwKVbNnPBQ78ZEfvedJria+fJjxklS5m4XOZMaxEjmUri
         r+Zg==
X-Gm-Message-State: AOAM531qSUXnEBqw93VfGqwnPotPTbic8peSE3ZsnuGnrwOLlxmnew+v
        FW1pTHdwGFOHQgoiclXA7wr6ncLX868dC11hRXU=
X-Google-Smtp-Source: ABdhPJwU9lv/HgEGcXXuj0s6UuwnBTFZexvbrX1j/qcytvzWrZZHV9FVThMAvDbc+POWReXaAQg2cjYw0jcKu3eXl/o=
X-Received: by 2002:a63:e50:: with SMTP id 16mr748649pgo.74.1611582679385;
 Mon, 25 Jan 2021 05:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com> <YArtsQSQsGdfNlBI@smile.fi.intel.com>
 <YArzAvcZXfv8DaI4@smile.fi.intel.com> <4ba64643-9254-055d-49a0-55104b8669d8@redhat.com>
 <1d57c7b0-9ef4-3306-1566-2b99f40d92d1@roeck-us.net> <eeda93c6-04cb-a775-7d79-b29a53c6a138@redhat.com>
 <CAHp75VdE4LSHTKLuZ6x744224N2AvbMU0JeMmTWoqeEHDj7=2A@mail.gmail.com> <f89f2650-73aa-337d-5219-141cd1a2ba32@redhat.com>
In-Reply-To: <f89f2650-73aa-337d-5219-141cd1a2ba32@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 15:52:08 +0200
Message-ID: <CAHp75VcKwmOm2QyWtwBBkGTHp8cHEsxXi+nznbjOoUEBdd_aOw@mail.gmail.com>
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

On Mon, Jan 25, 2021 at 1:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/25/21 12:15 PM, Andy Shevchenko wrote:
> > On Sat, Jan 23, 2021 at 2:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 1/23/21 1:27 AM, Guenter Roeck wrote:
> >>> On 1/22/21 1:04 PM, Hans de Goede wrote:
> >>>> On 1/22/21 4:45 PM, Andy Shevchenko wrote:
> >>>>> On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
> >>>>>> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
> >
> >>>>>>> What is the plan for merging this series ?
> >>>>>>>
> >>>>>>> It touches files under:
> >>>>>>> arch/x86
> >>>>>>> drivers/watchdog
> >>>>>>> drivers/platform/x86
> >>>>>>>
> >>>>>>> It is probably best if the entire series is merged through a single
> >>>>>>> tree. I don't expect this to cause any conflicts with current / upcoming
> >>>>>>> changes under drivers/platform/x86, so I'm fine with this being merged
> >>>>>>> through another tree.
> >>>>>>>
> >>>>>>> Or if I can get an ack for that from the x86 and watchdog maintainers
> >>>>>>> I can merge the entire series through the pdx86 tree.
> >>>>>>
> >>>>>> For time being I'm collecting tags and comments.
> >>>>>> As of today this series is independent per se, but other (later) clean up
> >>>>>> patches may rely on this.
> >>>>>>
> >>>>>> One strategy can be providing an immutable branch for anybody who wants it and
> >>>>>> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
> >>>>>> are more patches touching other stuff, though independently, in this matters).
> >>>>>
> >>>>> Yes, I think one more time and guess the best is:
> >>>>>  - get tags from x86 / watchdog
> >>>>>  - get tag from RTC
> >>>>>  - collect everything in PDx86 immutable branch
> >>>>
> >>>> Ok, that works for me. I assume that it is best for the other subsystems
> >>>> if I create an immutable branch for this based on 5.11-rc1
> >>>> (and then merge that into pdx86/for-next) ?
> >>>>
> >>>> Guenter, I believe you have already reviewed all the watchdog changes,
> >>>> are you ok with me creating an immutable branch for the entire series
> >>>> and then sending you a pull-req for that ?
> >>>
> >>> Wim handles watchdog pull requests,
> >
> > Wim, can you Ack the watchdog changes?

Ah, I missed the fact that Guenter *is* one of the WDT maintainers, so
we are fine here.

> >> Ah, sorry I was under the impression you would do that because you were
> >> doing the reviews (which I'm sure Wim appreciates).
> >>
> >>> and he usually creates a branch
> >>> for Linus to pull from either during or shortly before a commit window.
> >>> Also, I don't immediately see why the watchdog tree should carry the other
> >>> patches of this series, immutable or not; I would not expect a dependency
> >>> against those.
> >>>
> >>> Anyway, I am fine if the the wdt driver removal is submitted through some
> >>> other branch.
> >>
> >> Hmm, looking at the code again it indeed seems that patch 1/5 + 2/5 could
> >> be simply merged through the watchdog tree, as they don't appear to
> >> have any interdependencies with the arch/x86 and drivers/platform/x86
> >> changes.  Andy ?
> >
> > The first patch is a dependency to the later (that are not published yet).
> > I was considering gathering all dependent patches in immutable
> > branches and doing in three parts / phases.
> >
> > I can prepare a branch with a first batch (with Acks from respective
> > maintainers) and send a PR to you.
> > Would it work?
>
> I guess you would then publish this as an immutable branch yourself and
> send a PR to all involved subsys-maintainers ?

Right, I may do this.

> You have commit rights to the pdx86/platform-drivers-x86 git repo if
> I'm not mistaken, so you could publish the immutable branch there if
> you want.
>
> That actually sounds like a good plan to me, assuming the other maintainers
> are ok with it too.

Oki-doki, lemme do this way then. Thanks!

Taking into account above (Guenter had given his tags) I will prepare
an immutable branch  and create a tag with current stuff and will send
it to appropriate subsystems, including PDx86.
Tell me if I need to do something differently.

-- 
With Best Regards,
Andy Shevchenko
