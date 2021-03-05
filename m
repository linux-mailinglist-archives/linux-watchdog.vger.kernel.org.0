Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8004B32F039
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 17:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhCEQlx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Mar 2021 11:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhCEQlj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Mar 2021 11:41:39 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44766C061574;
        Fri,  5 Mar 2021 08:41:39 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b15so2193681pjb.0;
        Fri, 05 Mar 2021 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IGCBvAo+uncfEo5reNL7gjROP3yfb11IwGCMA+HSQLA=;
        b=OZmNTpS60CpZUAarGLD/aFcc324aTOAPj4whv92YyP9FqDA/ODrd+KxWmHUsmnSZIC
         ESYKtYjrciSKhk/ySQ7WeQfOlpihpyvZNLWgBRGZ7fQKDeIQaJin2U6SOhpRfnoJk/me
         oxN27ReR6SFWE0gwlXYnJWzWjRx39SwBs+g4sC1OguWq3tGJ1qICovMRME+rozZoKjd6
         Am3H8UOEPJwQouKmAk/fkGXuUWGFEadrHBaAcMpEeN04gHI6Y8FrAMsnSdyxOQb2NHvY
         H6rtT+riZQsjfHntllPYCq6pqXh0O8nULD8EANJN+ayS3/DFdvs3j8zM9tOFLgD3TYGI
         J1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGCBvAo+uncfEo5reNL7gjROP3yfb11IwGCMA+HSQLA=;
        b=q2E02HcPcIGq8c0QfYkX9/3mTIZQAMsUNk7c4etPxA1PNZlEHjn0R7bH21XpTu3z9x
         XqSC/HMbhaya2uN4q/uYZ550DOwU7ksdc1WUAJOC+MQ6EbahI5YETT1wSzVQtx6mjzgr
         20GqrP14RvvBQYnbpuLJnrEuLFYPwSCL/eu3SEU4O5j2BlkD+WBxeocBLlLFfpkAREuv
         KyNPOZ92sZEdmTVy7BDnGTlFZscmhiU+HmDwesxruxwIpYvGcOqkHDIpfnD2aDEqdWvD
         6PzsRZKMpROL1GYryKKYPpOjMpF5iHmLt1U+PDNpWmWVLXnVuifTYk4+BunIpdvbH/iv
         MRKw==
X-Gm-Message-State: AOAM531/TugThaeAnR9AXhfELp1dvuN6C/Mo5ySNCH3kkLp1rFgRD/3G
        dw00YyZH3IWvKov7OqXlIjJ0jcJ5ToVES7nAoFxdwakBDIQz3w==
X-Google-Smtp-Source: ABdhPJyhI3HErYUQqpwFWH7EJiYjv8SyynRiJ7QdLf82o4ncwbM88lI0AahBHNoRurXO9Q2nIB085tPCpJ/LqrYTF0w=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr11559646pjx.181.1614962498852;
 Fri, 05 Mar 2021 08:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com> <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <ec54b2ba-3eb2-0981-e409-4d8f9d3e45c1@redhat.com> <CAHp75Vd+mXRw0gKi4TzCPDn1XqJkTjHNWCLht0674=BpMjjg+g@mail.gmail.com>
In-Reply-To: <CAHp75Vd+mXRw0gKi4TzCPDn1XqJkTjHNWCLht0674=BpMjjg+g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 18:41:22 +0200
Message-ID: <CAHp75VcC5OVDceizzCeZ48FwP=TKccermS6UtV1zd6tSD0OP8Q@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 6:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Mar 5, 2021 at 6:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 3/5/21 4:42 PM, Andy Shevchenko wrote:

...

> > So I took a quick look at the following 2 commits:
>
> (One of the latter commits moves the code to drivers/pci/pci-p2sb.c,
> do you think it's better like that? The idea is to deduplicate
> __pci_bus_read_base() call)
>
> > "platform/x86: p2sb: New Primary to Sideband bridge support library"
> > "mfd: lpc_ich: Switch to generic p2sb_bar()"
> >
> > And this looks good to me, although compared to the code from this
> > patch-set you are missing the pci_lock_rescan_remove(); and
> > pci_unlock_rescan_remove(); calls.
>
> Oh, indeed.

Correction here, I'm using pci_bus_sem in the latest version.

-- 
With Best Regards,
Andy Shevchenko
