Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A369440A4B
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Oct 2021 18:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhJ3RC0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Oct 2021 13:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhJ3RCZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Oct 2021 13:02:25 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5A6C061714
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 09:59:55 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id e5so23995821uam.11
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l/0UUkqf6KFkNkf6dBZ0pEkCS7X6LutBL6LgNXt9kNw=;
        b=COYcjMZHo2AhOT7Qmebs1O2714sucGcw4oOFWAZd04mujHCpsr49AG3HZtjw7Im4lg
         ePKoBnjK9WgnzD/v5lNJMx61C/iclRy9VF3dc8XjgNfIEOeaMPRkrQ3RdG7oTsbcL0q9
         qBJlNogLLIxUKBwUJZw5zUIGd9KoXRjJlKKLKHRVjGetr89QqXKZ6Mz75aHEqIWtSKVP
         mqvnOV4YEnoasMfw2yTM4pF3va7X9XaC1HbVOM/jn4DaZk7Iqcooo7Io0KcxKU8RbrsD
         sNLPWVQMO0Yx7KIVpU40dbfdaxXTs0re1gHao8v4RsL/SFjGvnuIw9G/XT4iJngYCfxs
         h/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l/0UUkqf6KFkNkf6dBZ0pEkCS7X6LutBL6LgNXt9kNw=;
        b=v6c7ph+jnzv9Nyw+Ze4EeH+2TtlovhgdMEKXRTQPc3avlbgxAI9UlznFVy4q1hPf00
         RpttEHAe5hDZfAxQ/o850dv5PPOYfN0w6Y+FM01N8/5DTCSSI+VQTff7sOzJ3W9Vneqh
         zCJz6Y5vYrFsxh+WDbpuCG7CDw3TJx8csDSS4rdx6z/fivH95pj3z2ecsdlv5WSY/u6g
         Mbp+0GNpNWGjM6kJbOdMFP2ZDBitHiw+7WgZlLaevQP0dr/J4E4BwfRjTDC8QVVpWFoJ
         Tn1J0IGeL+NMEcxnvWeneWh7LOVoC6Rn5pcmf7Avrfwx68NMX+MZ0TEwHPWyLHAyjn36
         uYeA==
X-Gm-Message-State: AOAM530sJwOQXW3AejUwo79wiMKCnF4OwWOlxSeTfZTKrz/0c0YnRKq1
        FYxCBstEZEOEpo1ahSuKQMI1DD/3GF5Jh2LtlMP3iw==
X-Google-Smtp-Source: ABdhPJwgB0TnW1VjXBlaMl6cHb/t+9CrkGOL3PBxBmLXFG83NcAttneComJazLR0qQ/0pGpbtjvvvjluJNY70x4qme8=
X-Received: by 2002:a05:6102:3ece:: with SMTP id n14mr1827009vsv.55.1635613194472;
 Sat, 30 Oct 2021 09:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-8-semen.protsenko@linaro.org> <1ad6b625-4388-bc78-e258-eae0b9357b96@roeck-us.net>
 <CAPLW+4kphtac24fcpVUENAMUAdHp2fkzJ0N_r_63Soq6R2VZBg@mail.gmail.com> <7c9a8dd4-7607-55a2-3d65-a445fa246667@roeck-us.net>
In-Reply-To: <7c9a8dd4-7607-55a2-3d65-a445fa246667@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 30 Oct 2021 19:59:42 +0300
Message-ID: <CAPLW+4kTANfSaw5g=rnJUJTMcT_J1Z8ju09kzmAPE70U_8KWDQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] watchdog: s3c2410: Let kernel kick watchdog
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, 30 Oct 2021 at 18:14, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/30/21 7:29 AM, Sam Protsenko wrote:
> > On Fri, 29 Oct 2021 at 03:30, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 10/28/21 11:35 AM, Sam Protsenko wrote:
> >>> When "tmr_atboot" module param is set, the watchdog is started in
> >>> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
> >>> watchdog core driver know it's running. This way wathcdog core can kick
> >>> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
> >>> enabled), until user space takes control.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>>    drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
> >>>    1 file changed, 15 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> >>> index ca082b1226e3..9af014ff1468 100644
> >>> --- a/drivers/watchdog/s3c2410_wdt.c
> >>> +++ b/drivers/watchdog/s3c2410_wdt.c
> >>> @@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >>>        wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
> >>>        wdt->wdt_device.parent = dev;
> >>>
> >>> +     /*
> >>> +      * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
> >>> +      * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> >>> +      *
> >>> +      * If we're not enabling the watchdog, then ensure it is disabled if it
> >>> +      * has been left running from the bootloader or other source.
> >>> +      */
> >>> +     if (tmr_atboot && started == 0) {
> >>> +             dev_info(dev, "starting watchdog timer\n");
> >>> +             s3c2410wdt_start(&wdt->wdt_device);
> >>> +             set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
> >>> +     } else if (!tmr_atboot) {
> >>> +             s3c2410wdt_stop(&wdt->wdt_device);
> >>> +     }
> >>> +
> >>
> >> This doesn't cover the case where the watchdog is already enabled by the BIOS.
> >> In that case, WDOG_HW_RUNNING won't be set, and the watchdog will time out
> >> if the userspace handler is not loaded fast enough. The code should consistently
> >> set WDOG_HW_RUNNING if the watchdog is running.
> >>
> >
> > As I understand, in the case when bootloader started the watchdog, the
> > driver just stops it. You can see it in the code you replied to.
> >
> >      } else if (!tmr_atboot) {
> >              s3c2410wdt_stop(&wdt->wdt_device);
> >
> > In other words, having "tmr_atboot" module param makes it irrelevant
> > whether bootloader enabled WDT or no.
> >
>
> Sure, but I am concerned about "if (tmr_atboot && started)", which doesn't
> set WDOG_HW_RUNNING with your current code, and I was looking for something
> like
>
>         if (tmr_atboot) {
>                 if (!started) {
>                         dev_info(dev, "starting watchdog timer\n");
>                         s3c2410wdt_start(&wdt->wdt_device);
>                 }
>                 set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
>         } else {
>                 s3c2410wdt_stop(&wdt->wdt_device);
>         }
>

Wow, I really overlooked that case. Nice catch! Not having '} else {'
section is vicious...

Though if started != 0, it means s3c2410wdt_set_heartbeat() failed to
set wdd->timeout, and without that the watchdog core won't be able to
calculate correctly ping interval in watchdog_next_keepalive(), and
WDOG_HW_RUNNING bit won't do much good, right? So I'll probably just
call s3c2410wdt_stop() in that case, to be on the safe side.

Also this 'started' variable name is misleading, I'll convert it to
"bool timeout_ok" while at it.

> Guenter
