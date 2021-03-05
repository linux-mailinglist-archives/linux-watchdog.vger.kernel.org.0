Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8EC32F054
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 17:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhCEQrt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 11:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbhCEQrW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 11:47:22 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C087C061574;
        Fri,  5 Mar 2021 08:47:22 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id z7so1686566plk.7;
        Fri, 05 Mar 2021 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k5xqbrsDkEYC8468nekBoK7XfIXAxgMNfVZRCXqVWVE=;
        b=trg3WbAajekfPYGSpCrsc1TK/6aPLzlfwVN3ZUg1PWg+q3i8HxsdQ9oZPe7QAdWOrH
         PjMzrRFkIB7Y5mu2dNkOHMUuTY1bT9ehxeuFkgmg5JJRI/v6D5DJPbqBQTtKJQ55HFli
         NaPwcqHA00eeusp9FNDf4N7OQDo3CeqQut+9AzvzAbyGAYl/+sk+TNfxD4LlsdRhTsd1
         Jc9sarM3DB5WkbykqBaJ3pmr6cQ18DPLVHVUkWti5slRKPF/L8cF2W4dL1B8L7j2GYNN
         U7QqFEXxsWLpP/V4E9tFd1j6YgxOIyIFKAMkHt9aggm/j2sUB6T80Ut3SNNZPnyhL2g0
         QW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k5xqbrsDkEYC8468nekBoK7XfIXAxgMNfVZRCXqVWVE=;
        b=NA5t+Kzet+q1vZ5SzF+r7+IlIzr1a87g5FlfhvMleS12dVATnvOBwecDk/cKqRICCb
         TLqJaBwOLVztjDXMR0MH8YWm4XdJ23INxZZ0HrRNuKSLhlAz49w2vLDZVG59FHRU4fbn
         DnTDlhMfJTJi//9pc3oY8QIUbv2T7R5ZOsUN9RSJ3BI8OfY3ptj3mCSQ+qQKxAKS1tIa
         07pZ0ZDnxGFZVf/Bvo2pqdTi+7NT+hafmaJQ06mJfJp4DJVyKsQ7d9ktfFoBAlnaY/HP
         n1cRwVNGUNWZz80G8AZdjzKfCIcDu8INTil+Z19Gc7Wutx6T4zLohRLnZQ/uzcPQr4/u
         I/sQ==
X-Gm-Message-State: AOAM533uUElgZjPzFeiTIcfNDWZK47cwaZgbMHJXfjeVp/7ALmqswhkt
        PCoi+2VDy0DHzVCu5BfBThRzhC3MOVkBt7UeEB0=
X-Google-Smtp-Source: ABdhPJwgaUohwbkjc+nknm3CkL9koiPRiol+mI4GtcsKavRlkB6OXrKElaN/9YshQZftZNjYYJvApDL9/M4M83FHO10=
X-Received: by 2002:a17:902:d2c1:b029:e5:ccfe:1e93 with SMTP id
 n1-20020a170902d2c1b02900e5ccfe1e93mr9384438plc.0.1614962842042; Fri, 05 Mar
 2021 08:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com> <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <ec54b2ba-3eb2-0981-e409-4d8f9d3e45c1@redhat.com> <CAHp75Vd+mXRw0gKi4TzCPDn1XqJkTjHNWCLht0674=BpMjjg+g@mail.gmail.com>
 <CAHp75VcC5OVDceizzCeZ48FwP=TKccermS6UtV1zd6tSD0OP8Q@mail.gmail.com>
In-Reply-To: <CAHp75VcC5OVDceizzCeZ48FwP=TKccermS6UtV1zd6tSD0OP8Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 18:47:05 +0200
Message-ID: <CAHp75Venef8C+njLAOskjhm=XZg=SApQ3SQM398tTVWZDXfkFQ@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 6:41 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Mar 5, 2021 at 6:25 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Mar 5, 2021 at 6:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 3/5/21 4:42 PM, Andy Shevchenko wrote:
>
> ...
>
> > > So I took a quick look at the following 2 commits:
> >
> > (One of the latter commits moves the code to drivers/pci/pci-p2sb.c,
> > do you think it's better like that? The idea is to deduplicate
> > __pci_bus_read_base() call)
> >
> > > "platform/x86: p2sb: New Primary to Sideband bridge support library"
> > > "mfd: lpc_ich: Switch to generic p2sb_bar()"
> > >
> > > And this looks good to me, although compared to the code from this
> > > patch-set you are missing the pci_lock_rescan_remove(); and
> > > pci_unlock_rescan_remove(); calls.
> >
> > Oh, indeed.
>
> Correction here, I'm using pci_bus_sem in the latest version.

Okay, it seems that semaphore is not what I need and PCI rescan lock
is what is mandatory to take here.


-- 
With Best Regards,
Andy Shevchenko
