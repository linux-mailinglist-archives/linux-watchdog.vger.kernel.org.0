Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8803A32EFFE
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 17:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhCEQZm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 11:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhCEQZm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 11:25:42 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C153C061574;
        Fri,  5 Mar 2021 08:25:42 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id t25so1721689pga.2;
        Fri, 05 Mar 2021 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upifgrQ9E4kGN/e2cx0WwVgQ4xC6hqDkjNV0N6jUaXs=;
        b=EVswQ0A62WtNDXdelqzM85RAfmpnjRjyTyWA0hHM5/pYo+QTjSExG2dQ5Q6F4DUwXz
         BaK506t3dzRO7RRJQf0hTm+wtxX0lQsvGrBSNeGLAcQChlauOAF+PGb4bSCArqHonCsW
         dM4PIxYJGoQUfu2HLGDMpVlfmQgN62syRH31SSzU2A1LORU7mIMO/9bPEJ2v/0Jx019D
         jZ7iuyYNAQiUFHX5BRzMC5T2O5NPJid8PI3nsJnR5A3A6TtEoDmakzuW6X/C7E1KU+sN
         /oN2gSDc+kAWW9/qQGYinjiBkvl9Ub2tdg4HId/NkYT2D1WpWCfujgiHQKzUrYqbZntK
         c72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upifgrQ9E4kGN/e2cx0WwVgQ4xC6hqDkjNV0N6jUaXs=;
        b=O1OEPTG8k5c4aWzLSdjUaTkd6sX5DS0XUijrk+3MEn0s+TWQp72dvoe9Sb+y15+4Rz
         XEH440vjfkrLKbX+EoOagzAo8rQYTdbyZ7/p0KIiAIZ4WOZOAIdd5VloAiT87NnVwYo8
         AgUIbGQpu2bgex3HJdpvF8YHj5YDn6lKMwyqYZpSyBs4xcsqNb+KFmpgyjdf3CyJpgwg
         es5DoLM7Qh7wwOHL4iNk25ArZiho3jRFyUUbxRw5gDWn9ZW0WVABJuILSUPFex/8QLia
         7//aUlBtNi5ypsMeJ8KpO7nM/Wg/i0MbgzxtqXnZDdr1BrNJjfbDrTJMaPP/yryOBcds
         qp1Q==
X-Gm-Message-State: AOAM532od/CGzW6Ye23qn75f2uDs3oIGfeJUAP4P8dtYODG4foz9Lu4j
        lSxn3BYKV36LxGSNW7b7oAmIWXhiK7i2fKjmm/E=
X-Google-Smtp-Source: ABdhPJy6AcaKIHSM7Kt43me4BYef8AzeOlGX7rsRuRoK82gnKJTqp/dN3jLlPuh3Czjr3w2F3tOQI1ap1OtQ/gWHHLM=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr9189837pgq.203.1614961541653;
 Fri, 05 Mar 2021 08:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com> <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <ec54b2ba-3eb2-0981-e409-4d8f9d3e45c1@redhat.com>
In-Reply-To: <ec54b2ba-3eb2-0981-e409-4d8f9d3e45c1@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 18:25:25 +0200
Message-ID: <CAHp75Vd+mXRw0gKi4TzCPDn1XqJkTjHNWCLht0674=BpMjjg+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 5, 2021 at 6:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 3/5/21 4:42 PM, Andy Shevchenko wrote:
> > On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 3/4/21 11:11 AM, Andy Shevchenko wrote:
> >>> On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
> >>> <henning.schild@siemens.com> wrote:

...

> >>> Oy vey! I know what this is and let's do it differently. I have some
> >>> (relatively old) patch series I can send you privately for testing.
> >>
> >> This bit stood out the most to me too, it would be good if we can this fixed
> >> in some cleaner work. So I'm curious how things will look with Andy's work
> >> integrated.
> >>
> >> Also I don't think this should be exported. Instead this (or its replacement)
> >> should be used to get the address for an IOMEM resource to add the platform
> >> devices when they are instantiated. Then the platform-dev drivers can just
> >> use the regular functions to get their resources instead of relying on this
> >> module.
> >
> > I have published a WIP branch [1]. I have no means to test (I don't
> > know what hardware at hand I can use right now), but I made it compile
> > after 4 years of gathering dust...
>
> So I took a quick look at the following 2 commits:

(One of the latter commits moves the code to drivers/pci/pci-p2sb.c,
do you think it's better like that? The idea is to deduplicate
__pci_bus_read_base() call)

> "platform/x86: p2sb: New Primary to Sideband bridge support library"
> "mfd: lpc_ich: Switch to generic p2sb_bar()"
>
> And this looks good to me, although compared to the code from this
> patch-set you are missing the pci_lock_rescan_remove(); and
> pci_unlock_rescan_remove(); calls.

Oh, indeed.

> > Feel free to give any kind of comments or share your ideas on how it
> > can be improved (the above idea on IOMEM resource is interesting, but
> > devices are PCI, not sure how this can be done).
>
> The code added by this patch introduces a register_platform_devices()
> function which creates a bunch of platform-devices; and then the
> device-drivers for those call simatic_ipc_get_membase0() to get their
> base-address.

Sounds like an MFD approach...

> My suggestion was to instead put the  simatic_ipc_get_membase0() call
> inside the code instantiating the platform devices and to add the
> base-address for that pdev as IOMEM resource to the instantiated
> platform-devices.
>
> I hope this helps to clarify what I was trying to say.

Yes, thanks!

-- 
With Best Regards,
Andy Shevchenko
