Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7AF32EF3B
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 16:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhCEPnM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 10:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhCEPm7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 10:42:59 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55F1C061574;
        Fri,  5 Mar 2021 07:42:58 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n10so1636638pgl.10;
        Fri, 05 Mar 2021 07:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSHLnWcInXS8d/+eWfNq/rovaytTvgGUCx8rTCABjwo=;
        b=Q6cgOd9+PW95fgOSIwh3v6mB4AGEa0B6tlhZkhDOtd/OmNsg74KZspH7gvqeGDjYE9
         MpVwE+QJANvJa7A2RIMrgJLHQj7vPjl6/GMuEi0dFXtC034wCS/XfYATmBeCbJHsfjbO
         pRLf4eWX+sLzStsZc8F3EP1T70ekXpcltegkXp6+c9y4s0nU3GBRsHxGpbzEvr+gXRwP
         VDrXEWyUty9q9b3RL7EG03thM0nn/fFfr6mCpz+zKwQIsO2/8zMSZB7DJg1MY1WWi8KR
         x8kii1WcPZTw1TiusGkGz2WuFx19GZEDAVcm7GGTH54BoPf4cxuEjmfnKqTPUUwy4GLw
         kWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSHLnWcInXS8d/+eWfNq/rovaytTvgGUCx8rTCABjwo=;
        b=X20yiKD3JdTZFwUkyQnrQCyxoWKkNpknHiCAJsQx7LKl3dMp9Znl3bFK7L5V9xaIUo
         AINRTNQTOqziIcwSU/I28SHgztUmmxTp7D2a4oO/4sOJdtTFW1WvUviFYuV84EtMcG6P
         pK3tHJdTq3kuuvccZwwFPKkmHjytUNI2GQFnmITvoTjVMpaA5mY8AgCC7qeVdanel8XV
         ePmL/zPWb1feI/r5sEh5bHGcrbs6t6qO5v9kEmhoAn7AwNoi9pEYglwEU5IzRgUPX75p
         xCNBOOSHZrYb242i7JFe7m0at7H5fZAV5ReXUh0X6fYwYubZNyI7tGroQEnuIjRYTseW
         RCPQ==
X-Gm-Message-State: AOAM531EFs+frRRxeab2xcIXl8q4gmoDOXdzh+ZWERh0QtmPVtYHohBG
        anpyPI/0ULksZ3bVwy1Ee1pM73xJb2u+1qTQjAM=
X-Google-Smtp-Source: ABdhPJzEvDuqfGXpMPv9yZMTt2z8O48JoGtdBK7b7CnHZg9VTPk5oEI/NHffyzF5Ll6hZdh+jgkY0GZ9mS9DzK3mPDo=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr9008742pgq.203.1614958978437;
 Fri, 05 Mar 2021 07:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
In-Reply-To: <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 17:42:42 +0200
Message-ID: <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
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

On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 3/4/21 11:11 AM, Andy Shevchenko wrote:
> > On Thu, Mar 4, 2021 at 8:36 AM Henning Schild
> > <henning.schild@siemens.com> wrote:

...

> >> +u32 simatic_ipc_get_membase0(unsigned int p2sb)
> >> +{
> >> +       u32 bar0 = 0;
> >
> >> +#ifdef CONFIG_PCI
> >
> > It's ugly besides the fact that you have a dependency.
> >
> >> +       struct pci_bus *bus;
> >
> > Missed blank line.
> >
> >> +       /*
> >> +        * The GPIO memory is bar0 of the hidden P2SB device. Unhide the device
> >> +        * to have a quick look at it, before we hide it again.
> >> +        * Also grab the pci rescan lock so that device does not get discovered
> >> +        * and remapped while it is visible.
> >> +        * This code is inspired by drivers/mfd/lpc_ich.c
> >> +        */
> >> +       bus = pci_find_bus(0, 0);
> >> +       pci_lock_rescan_remove();
> >> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
> >> +       pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
> >> +
> >> +       bar0 &= ~0xf;
> >> +       pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
> >> +       pci_unlock_rescan_remove();
> >> +#endif /* CONFIG_PCI */
> >> +       return bar0;
> >> +}
> >> +EXPORT_SYMBOL(simatic_ipc_get_membase0);
> >
> > Oy vey! I know what this is and let's do it differently. I have some
> > (relatively old) patch series I can send you privately for testing.
>
> This bit stood out the most to me too, it would be good if we can this fixed
> in some cleaner work. So I'm curious how things will look with Andy's work
> integrated.
>
> Also I don't think this should be exported. Instead this (or its replacement)
> should be used to get the address for an IOMEM resource to add the platform
> devices when they are instantiated. Then the platform-dev drivers can just
> use the regular functions to get their resources instead of relying on this
> module.

I have published a WIP branch [1]. I have no means to test (I don't
know what hardware at hand I can use right now), but I made it compile
after 4 years of gathering dust...
Feel free to give any kind of comments or share your ideas on how it
can be improved (the above idea on IOMEM resource is interesting, but
devices are PCI, not sure how this can be done).

[1]: https://gitlab.com/andy-shev/next/-/tree/p2sb

-- 
With Best Regards,
Andy Shevchenko
