Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193971008E8
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 17:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfKRQKS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 11:10:18 -0500
Received: from da1vs02.rockwellcollins.com ([205.175.227.29]:45065 "EHLO
        da1vs02.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726216AbfKRQKS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 11:10:18 -0500
IronPort-SDR: xr6ug5pwvcIGNDd9Rq2fDW1jsexLMu4UiVDwNW3MFM7jtjR7gi9RxCOQGs2tQ4W9uO1DfoNni0
 VEsVtKzb1pn9TI8+tPDg7n3buZOK5n6pzv9WolwGArrR29BA6kKHtIAzN1BfTBfgBZm9wLWKmH
 a5qd6Ofx6rQjVptBtwqsYY53g60MgyAjfSrpn8/vqJC5ERr60YUOCZ0ZQoMPJ/RPKLHPxn11qC
 h1c/c9KMxBm9DZPlyxwrbivFpY37nA4Ko0yZq+53wLTAFFNSG6N+GqAxoat2nTaWPzZufzxfOK
 dT0=
X-RC-All-From: , 205.175.227.20, No hostname, brandon.maier@rockwellcollins.com,
 Brandon Maier <brandon.maier@rockwellcollins.com>, , 
X-RC-Attachments: , ,
X-RC-RemoteIP: 205.175.227.20
X-RC-RemoteHost: No hostname
X-RC-IP-Hostname: da1ip02.rockwellcollins.com
X-RC-IP-MID: 145878273
X-RC-IP-Group: GOOGLE_RELAYED
X-RC-IP-Policy: $GOOGLE_RELAYED
X-RC-IP-SBRS: None
Received: from unknown (HELO mail-ot1-f71.google.com) ([205.175.227.20])
  by da1vs02.rockwellcollins.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 10:10:17 -0600
Received: by mail-ot1-f71.google.com with SMTP id l1so10352795otr.2
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Nov 2019 08:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wqvIDi6NVGph+i8qaNW0sCE80+k+osqzqQjfO0g0mDY=;
        b=NieDNRud6vhyhdzv97z0VOTCxazYwBwGvSHNrtSp0KrMPHrjOPd5xaKVMc7X6oxBEw
         zZDBULcOz8bnL/aG8oO7gkL1PkvtBAKeeDnL10FvnAnwnhhfonpuCkxfazkBf38NhhX/
         7r8h05hwODHvzoOh3trLZaIILVyb7N+8fNPchqU305lUYvllx9oJ742cxFbE6o+XKK1P
         +IGlJ3sR/UDCYcYpNJxaiX97e8HSW97PZFZ9xN2vUTHG1FyMSKToMl40JTLUxCl15u1A
         QNQl9w/pJIX2NLD/pL37QezAUXMyq3rtDdQSiEEA5i9mVdyRypGOQDjtXsPIC/6K6X5Y
         ZRGQ==
X-Gm-Message-State: APjAAAWx3P8uLbzG+ZHu8gve2JVuvzpiKNr3SyoBMSxeqB0V6gvCPcDI
        S4PkQe4PhyoZK9zp2YzWjp26vmQnFnUNsXGOyC3dMST/Ts68a23LclwukYeppEtbevlT4DskeDB
        k4m7F8Aziqrn+KjfFWsDaM4VMoks16Xdms85116RbPFUjO2rF2Y0pHmUN/27k5w==
X-Received: by 2002:aca:4a0e:: with SMTP id x14mr20092993oia.123.1574093416977;
        Mon, 18 Nov 2019 08:10:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMkKmjHPQZKea3Dc016wnQZwygZUFpEYeN4NGjL7toao7Zfrkv6hTlKkHStqWaG6X6GS+kS1ULmEUcCsL7n2g=
X-Received: by 2002:aca:4a0e:: with SMTP id x14mr20092958oia.123.1574093416557;
 Mon, 18 Nov 2019 08:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20191117200325.142419-1-brandon.maier@rockwellcollins.com>
 <6e9a6f3b-0723-ac59-b859-f8b7b75d39a9@roeck-us.net> <CA+fik53-RrzN1Q-Y+6hgtFyjharyMOLAy9w6gn0bfsUN=AwEUA@mail.gmail.com>
 <0338087a-07cf-5673-7c3b-5d1211f359e2@roeck-us.net>
In-Reply-To: <0338087a-07cf-5673-7c3b-5d1211f359e2@roeck-us.net>
From:   Brandon Maier <brandon.maier@rockwellcollins.com>
Date:   Mon, 18 Nov 2019 10:10:05 -0600
Message-ID: <CA+fik51ni5y1K_ZDa1PdZ1873sN5eKrhFQP+xNU=JQft+0Yxwg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] watchdog: omap: Fix early_enable to start watchdogd
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 17, 2019 at 6:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/17/19 2:19 PM, Brandon Maier wrote:
> > On Sun, Nov 17, 2019 at 3:44 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 11/17/19 12:03 PM, Brandon Maier wrote:
> >>> When the 'early_enable' module_param is enabled, Linux's watchdogd
> >>> thread does not start, causing the watchdog to eventually fire.
> >>>
> >>
> >> What does early_enable have to do with watchdogd ?
> >
> > The early_enable doesn't directly control the watchdogd, it only
> > controls starting the watchdog. The problem is that, if the watchdog
> > is started, we need the watchdogd to ping the watchdog. It watchdogd
> > is not running, then the watchdog will trip and reset the system.
> >
> >> Why would watchdogd not start if this flag is set ?
> >
> > watchdog_register_device() checks this flag, and only enables the
> > watchdogd if it's set. See following:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__elixir.bootlin.com_linux_latest_source_drivers_watchdog_watchdog-5Fdev.c-23L1031&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=bIwUnEkCqKFQQ0RVQaaY0gBWY7SIAhmiWLyMS82_mSU&m=xNCU_zPoNl2ll56Vs7usphsCSGx4KDrV83ykbUzBHig&s=kiZuvwneuc7XR_vqsiab4GnglNk6j9xk6Njy5nluF1o&e=
> >
> >>
> >> The purpose of early_enable in this driver, as I understand it,
> >> was to force watchdogd to start within the timeout period. So
> >> it does exactly what it is supposed to be doing.
> >
> > I'm not sure what you're referring to by "timeout period". But
> > early_enable does force the watchdog to start during module insertion,
> > that works correctly. The issue is that the driver doesn't tell the
> > watchdog core to launch the watchdogd.
> >
>
> If you refer to the kernel "watchdogd", that is not of interest here.
> _Userspace_ is supposed to start a watchdog daemon if early_enable
> is set. If userspace doesn't do that, it is a userspace problem,
> not a kernel problem.
>
> The whole point of early_enable is to force _userspace_ to start its watchdog
> daemon. Your proposed patch would defeat that by pinging the watchdog in the
> kernel, and it would keep doing so forever even if userspace hangs completely.
> This would be just wrong.

The kernel watchdogd is what I care about here. The kernel has a
Kconfig option, CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED[1]. If this
setting is enabled, then the kernel is supposed to ping the watchdog
until userspace takes over. This is what other watchdog drivers do,
and is what this patch is trying to fix. What you're describing is the
behaviour if that config is disabled. That is unrelated to
early_enable, early_enable only controls if the driver is enabled
during initialization.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/Kconfig#L50

>
> Guenter
>
> > This change is based off many of the other watchdog drivers. They also
> > set the WDOG_HW_RUNNING flag if the watchdog is running. The only
> > significant difference is that those drivers don't typically have an
> > early_enable, they just detect if the watchdog was already running
> > before insertion. But the end result is the same, the watchdog is
> > running and will trigger if watchdogd isn't.
> >
> >>
> >> Guenter
> >>
> >>> For the watchdogd to be started, the WDOG_HW_RUNNING flag must be set
> >>> before watchdog_register_device().
> >>>
> >>> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> >>> ---
> >>>    drivers/watchdog/omap_wdt.c | 10 ++++++----
> >>>    1 file changed, 6 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> >>> index 9b91882fe3c4..ecc8592c00a5 100644
> >>> --- a/drivers/watchdog/omap_wdt.c
> >>> +++ b/drivers/watchdog/omap_wdt.c
> >>> @@ -268,8 +268,13 @@ static int omap_wdt_probe(struct platform_device *pdev)
> >>>                        wdev->wdog.bootstatus = WDIOF_CARDRESET;
> >>>        }
> >>>
> >>> -     if (!early_enable)
> >>> +     if (!early_enable) {
> >>>                omap_wdt_disable(wdev);
> >>> +             clear_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> >>> +     } else {
> >>> +             omap_wdt_start(&wdev->wdog);
> >>> +             set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> >>> +     }
> >>>
> >>>        ret = watchdog_register_device(&wdev->wdog);
> >>>        if (ret) {
> >>> @@ -281,9 +286,6 @@ static int omap_wdt_probe(struct platform_device *pdev)
> >>>                readl_relaxed(wdev->base + OMAP_WATCHDOG_REV) & 0xFF,
> >>>                wdev->wdog.timeout);
> >>>
> >>> -     if (early_enable)
> >>> -             omap_wdt_start(&wdev->wdog);
> >>> -
> >>>        pm_runtime_put(wdev->dev);
> >>>
> >>>        return 0;
> >>>
> >>
> >
> > Brandon
> >
>
