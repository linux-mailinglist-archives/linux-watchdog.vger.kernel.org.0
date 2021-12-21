Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC26347BF22
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Dec 2021 12:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237285AbhLULwq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Dec 2021 06:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbhLULwp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Dec 2021 06:52:45 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C5DC061574
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Dec 2021 03:52:45 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id s1so8016088vks.9
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Dec 2021 03:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9RoT72BkBIwDwAqtN8oe2VpaBLgcQ2O6BxOPWBuqRYM=;
        b=Yaff6L0eowfZslFghL3L0+DSTeNFoBmFMyApwJyzayzgA7+4NG91znPZ8pvPKMPZY8
         mu0DpDMVdeV6j1djFlTZqXp4Rt+AR6H1i1t7KrUvwBOLNiPhNgv5OlrfNznOyJHmCz7q
         e7/g2RjmmNtbQeSqujQkpiuRxM2k4nnnEkDT3ViwMWseLPa9E/KbJo55C8nV88B1x7Ib
         ZHGAfPJg9GUyXqz+nH65c8Q6UklGkuIpw5v+xz4TxfH3wwIBx1lXLAPD9bdJROAPu4Zz
         RokA57qtUAmwzErikWxiAKT4OMZApacbiufUJ2n9uLSc43raXjhS7vXZZxAGYK4WlgLu
         kMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9RoT72BkBIwDwAqtN8oe2VpaBLgcQ2O6BxOPWBuqRYM=;
        b=AvWC15KJXSp5pZlo3Miq1AWA1Yil29B2s7tZy4p9Mem2QrHNI9ZZgh7INiPp4gOHf+
         3HZD+Uk1N2sTPTENT+PH25qFvqqUqj//bJnos+t5gzvnuZS8/MCxeBoCTVOC8MbuTkMh
         1Y+k5tJKXQ25L7Mn67h/7iNF2bYcpi6FqYDtkXtGchvlWe5A+perXjB5PZmDBjiXMeu7
         09iM8pq2A9ukMVUQUOBnx8LpjktQ8likutDQrgL2BRs7BhRrymfGiNUSi1nS/ygCZvoR
         6jJEJci36qm4szB2L/w9YAvWtdMrSkuJZlZqPs7m7pHn5AfO42aVI+ZDmuoMZKdhS5g0
         MTAw==
X-Gm-Message-State: AOAM532opBjjEcu7fbloVv+2aw1mZFu4PzA8tAikAeWjdj1GHH07foYP
        AvsF+i6JOk7d9RLMEtvmsL8aN2XJCveO6NtHjy26cQ==
X-Google-Smtp-Source: ABdhPJzfJLWi8OE0M+qbh0Zh3HwMupQUSZ4SkQChlcipU8aJyfmojpU7ziGddb3G0oouhjO/Wu14CkPZXBjT4JAEjXY=
X-Received: by 2002:a1f:a08c:: with SMTP id j134mr917542vke.35.1640087564344;
 Tue, 21 Dec 2021 03:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20211212170247.30646-1-semen.protsenko@linaro.org>
 <b618ff5b-ee41-2c29-5074-24fd4d0f0933@canonical.com> <CAPLW+4=wcWv4P_M8kQDjB=QfT5N+mFKm0mUdSDjGSgLg=pRGSw@mail.gmail.com>
 <4ad8719c-1476-3226-e426-a171b46ca568@roeck-us.net>
In-Reply-To: <4ad8719c-1476-3226-e426-a171b46ca568@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 21 Dec 2021 13:52:32 +0200
Message-ID: <CAPLW+4=ZoBqhLpNPiknTjqMXK5wJtOJtn4=99_kvaC3DBb_eqQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: s3c2410: Fix getting the optional clock
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 20 Dec 2021 at 23:08, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/20/21 7:15 AM, Sam Protsenko wrote:
> > On Sun, 12 Dec 2021 at 19:50, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 12/12/2021 18:02, Sam Protsenko wrote:
> >>> "watchdog_src" clock is optional and may not be present for some SoCs
> >>> supported by this driver. Nevertheless, in case the clock is provided
> >>> but some error happens during its getting, that error should be handled
> >>> properly. Use devm_clk_get_optional() API for that. Also report possible
> >>> errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> >>> clock provider is not ready by the time WDT probe function is executed).
> >>>
> >>> Fixes: a4f3dc8d5fbc ("watchdog: s3c2410: Support separate source clock")
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>>   drivers/watchdog/s3c2410_wdt.c | 22 ++++++++++++----------
> >>>   1 file changed, 12 insertions(+), 10 deletions(-)
> >>>
> >>
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>
> >
> > Hi Guenter,
> >
> > If there are no outstanding concerns, can you please apply this one?
> > Would be nice to see it in v5.17 if that's possible.
> >
>
> I added the patch to my watchdog-next tree, but Wim handles all pull
> requests.
>

Thanks, Guenter! Do I need to take any other actions, or Wim is going
to take patches from your tree? I just checked [1] (master branch),
and I can't see my patches there yet.

[1] git://www.linux-watchdog.org/linux-watchdog-next.git

> Thanks,
> Guenter
>
>
