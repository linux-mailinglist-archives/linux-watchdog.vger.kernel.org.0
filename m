Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2BC440B73
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Oct 2021 21:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhJ3T2K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Oct 2021 15:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhJ3T2J (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Oct 2021 15:28:09 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3210C061570
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 12:25:38 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id v20so24498175uaj.9
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Oct 2021 12:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=339YdMyvVlDQzR8qX4adflLjle+i81v+0067miTPm1A=;
        b=mlopcJSMuv/TwW2eeNNhbqVn+nWVcVCFBP7c7SKby7EOWQEJ22+cniUdI5MMoozh4A
         JdHWCFCt61kBs2L8iDz/iFyCZJA9VoJgZz9/3hd85oERXB9AiwekDUcpzKueXxLPHGeZ
         G4zJC5mDv8H3+YaeM6RqiGI281IopVjSV6HklZ2ivxugcUmbw8tzV7Q/3ndiy7B79YwU
         7sAWwk5fTMgcs/ZjzWLnQAwh2PGq/LrDu1AyAMVY/yslMUZN6vA66yKHYff6JVgnv1+N
         qnADt1ZgxFpH7BGcu8kk194YbwifwrgmaCAkzCUi+rBweHCXwbm9Q9eY4TsUMg0ivLTR
         SYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=339YdMyvVlDQzR8qX4adflLjle+i81v+0067miTPm1A=;
        b=mGUYDMXAVgs2w+jS8pg361K7B/IM/8RptHmWqYJzcvgLjcZ8KMyXrvGQlao7YiD8s/
         2m0ufQ4pTZgCra1Q2FsIgTK15V0Irr5gLITJqAsLZO252pKtO8WY/UWvvrhgjPTr5ING
         uLi4syAzSQ7O8IMyCPtYQqlFPYcCfsaYDb79PZ7fTQBINofWSPmHVmkF3p19Z1C30seI
         AxNQEj04iXn/0O3MlPbf5UUlf/7V7LoWb135PYk3jbW6D7kDh5liENyKDnmfpmbYUC3o
         ExqXQ2IeP04ww1aV8K1a+5SJcuaVYLFAm3xTEPQAI5KE9w7NmXuk2l/3hydTMVVNkWcT
         9Pcg==
X-Gm-Message-State: AOAM5339ivUrvRLEPtP3wdOfRd7H4YRxsAIZVb90uVCptTLfw4d7K8Tj
        y2Ht7KLTbN0g3w97Saog+kQVoWNN8eXdr7dZI+r1ow==
X-Google-Smtp-Source: ABdhPJyFqdbXGPdxZ+9SomWA4bSCJ4RbHSRY8COcLw1K8qg6dICkUgpDvyeiNab2g+uE9/e36w8DQGJ9EyaaaD+IE/8=
X-Received: by 2002:a05:6102:3ece:: with SMTP id n14mr2627951vsv.55.1635621937941;
 Sat, 30 Oct 2021 12:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-8-semen.protsenko@linaro.org> <1ad6b625-4388-bc78-e258-eae0b9357b96@roeck-us.net>
 <CAPLW+4kphtac24fcpVUENAMUAdHp2fkzJ0N_r_63Soq6R2VZBg@mail.gmail.com>
 <7c9a8dd4-7607-55a2-3d65-a445fa246667@roeck-us.net> <CAPLW+4kTANfSaw5g=rnJUJTMcT_J1Z8ju09kzmAPE70U_8KWDQ@mail.gmail.com>
 <d07b0269-acff-b267-b90a-732502978712@roeck-us.net>
In-Reply-To: <d07b0269-acff-b267-b90a-732502978712@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 30 Oct 2021 22:25:25 +0300
Message-ID: <CAPLW+4kRLtP-esSeNOwJFDpW8puoA3mNPbZWi-tcRz6tjmiQDQ@mail.gmail.com>
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

On Sat, 30 Oct 2021 at 20:47, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/30/21 9:59 AM, Sam Protsenko wrote:
> > On Sat, 30 Oct 2021 at 18:14, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 10/30/21 7:29 AM, Sam Protsenko wrote:
> >>> On Fri, 29 Oct 2021 at 03:30, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>
> >>>> On 10/28/21 11:35 AM, Sam Protsenko wrote:
> >>>>> When "tmr_atboot" module param is set, the watchdog is started in
> >>>>> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
> >>>>> watchdog core driver know it's running. This way wathcdog core can kick
> >>>>> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
> >>>>> enabled), until user space takes control.
> >>>>>
> >>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>>>> ---
> >>>>>     drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
> >>>>>     1 file changed, 15 insertions(+), 11 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> >>>>> index ca082b1226e3..9af014ff1468 100644
> >>>>> --- a/drivers/watchdog/s3c2410_wdt.c
> >>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
> >>>>> @@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
> >>>>>         wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
> >>>>>         wdt->wdt_device.parent = dev;
> >>>>>
> >>>>> +     /*
> >>>>> +      * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
> >>>>> +      * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> >>>>> +      *
> >>>>> +      * If we're not enabling the watchdog, then ensure it is disabled if it
> >>>>> +      * has been left running from the bootloader or other source.
> >>>>> +      */
> >>>>> +     if (tmr_atboot && started == 0) {
> >>>>> +             dev_info(dev, "starting watchdog timer\n");
> >>>>> +             s3c2410wdt_start(&wdt->wdt_device);
> >>>>> +             set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
> >>>>> +     } else if (!tmr_atboot) {
> >>>>> +             s3c2410wdt_stop(&wdt->wdt_device);
> >>>>> +     }
> >>>>> +
> >>>>
> >>>> This doesn't cover the case where the watchdog is already enabled by the BIOS.
> >>>> In that case, WDOG_HW_RUNNING won't be set, and the watchdog will time out
> >>>> if the userspace handler is not loaded fast enough. The code should consistently
> >>>> set WDOG_HW_RUNNING if the watchdog is running.
> >>>>
> >>>
> >>> As I understand, in the case when bootloader started the watchdog, the
> >>> driver just stops it. You can see it in the code you replied to.
> >>>
> >>>       } else if (!tmr_atboot) {
> >>>               s3c2410wdt_stop(&wdt->wdt_device);
> >>>
> >>> In other words, having "tmr_atboot" module param makes it irrelevant
> >>> whether bootloader enabled WDT or no.
> >>>
> >>
> >> Sure, but I am concerned about "if (tmr_atboot && started)", which doesn't
> >> set WDOG_HW_RUNNING with your current code, and I was looking for something
> >> like
> >>
> >>          if (tmr_atboot) {
> >>                  if (!started) {
> >>                          dev_info(dev, "starting watchdog timer\n");
> >>                          s3c2410wdt_start(&wdt->wdt_device);
> >>                  }
> >>                  set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
> >>          } else {
> >>                  s3c2410wdt_stop(&wdt->wdt_device);
> >>          }
> >>
> >
> > Wow, I really overlooked that case. Nice catch! Not having '} else {'
> > section is vicious...
> >
> > Though if started != 0, it means s3c2410wdt_set_heartbeat() failed to
> > set wdd->timeout, and without that the watchdog core won't be able to
> > calculate correctly ping interval in watchdog_next_keepalive(), and
> > WDOG_HW_RUNNING bit won't do much good, right? So I'll probably just
> > call s3c2410wdt_stop() in that case, to be on the safe side.
> >
> > Also this 'started' variable name is misleading, I'll convert it to
> > "bool timeout_ok" while at it.
> >
>
> This driver is a mess :-(. "started" true means that the driver doesn't
> work as currently written because there is no known valid timeout. In
> reality, s3c2410wdt_set_heartbeat() should in that case select a valid
> timeout and set it. On top of that, a timeout value out of range should
> never be passed to it in the first place. The check for "if (timeout < 1)"
> is, in that context, pointless. The range check should happen in
> s3c2410wdt_max_timeout(). If that range check is invalid, ie if
> s3c2410wdt_set_heartbeat() fails even though the timeout is in the range
> of 1 ..s3c2410wdt_max_timeout(), s3c2410wdt_max_timeout() is buggy.
>
> The simplest fix (kludge/hack) might be to fail driver installation if
> s3c2410wdt_set_heartbeat() fails.
>

Thanks for suggesting that. I'll send that change along in v2.

> Guenter
