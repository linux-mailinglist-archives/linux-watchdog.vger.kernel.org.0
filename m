Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F57746023A
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Nov 2021 23:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356462AbhK0W5n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Nov 2021 17:57:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhK0Wzm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Nov 2021 17:55:42 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9E3C06175F
        for <linux-watchdog@vger.kernel.org>; Sat, 27 Nov 2021 14:52:27 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id f7so8344831vkf.10
        for <linux-watchdog@vger.kernel.org>; Sat, 27 Nov 2021 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4wKJvOm8IruyroN8j9RTFJDd7z3mS6WOaJr8ElWGXdw=;
        b=Gpc/Tot8h/tACoorWTPoGhgDwTASg5Nv07pRuK6SU1Y8YmFsWQOJBuMS+DgQogHDeJ
         wVIUvCLWdAf/ZXU4WP0Ql3DLM9I5np4y9+PyC0chdPBeHjl0bxVmxTQpSUBJPpDufXvI
         BI7Ah+rpsxwyQJ57cY8FM328TJg+3C5ZSIwiy9JI9441AlDaZlaIVc2lMs9Yw0JDGmZJ
         iTgvvZzidQGQRRVNJxRPd2AccXO9NFV7waJgxnD1k8McOnGbvmIRX24tRRfUKz60KN7P
         m777NgJ1q6XF3uJuhQItEujt6qVOyy8mhEAP5QinJRucUl28ydMJuxOcrm/I721Hva9S
         /lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4wKJvOm8IruyroN8j9RTFJDd7z3mS6WOaJr8ElWGXdw=;
        b=y9UG7C9ySLeOl8whs6QPT0JwEmMHswzOAle9RYzM664Fno36LQv+BIadZeKYh+rWNf
         vsQrb/H3KIu7/ekJz3/olJJkaI9yn0PekSLmE3oICwOxVWl7TnceXTVI7CwRG4Clizgd
         /iUEuIxTZiabM+pVJV+fKkdqE3V3nb2ZjM0hkLldmjYscC++LFrMco3kqwj+/em5Wgrg
         d/mY3tY6hTrzLrVN0x/24GfD9kx2etXMkk17+GJcJ1o+qpAG+rlZox9z827FoAxDjYHa
         +U7r6iABTdeZflMXszJ6Wa60GOIpAfp/TOgjygnaowe21J4IzdGpzV18W7BwpP2MUnNd
         gEQA==
X-Gm-Message-State: AOAM532KinwSya3MyhYh4bkoEqEub0a8osEYVsMkeaRLlghQ6yh+6TmE
        kZag0vYrgyMMdtM5ai/pq/NzQK0Sk0KOViM9PLh/Bg==
X-Google-Smtp-Source: ABdhPJzBx6s4kT6UW5GnAJ/cyWC3ddYe1EFU9hgXoP+J1aTVtzPkD/PM20iP+06Hq5oCgnfK2B75MovoEurNR+HgS94=
X-Received: by 2002:a1f:a08c:: with SMTP id j134mr23928437vke.35.1638053546496;
 Sat, 27 Nov 2021 14:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
 <20211121165647.26706-10-semen.protsenko@linaro.org> <20211123160623.GB2326185@roeck-us.net>
 <CAPLW+4mwhH5C6zSxWDboNucZPvt2c=F7Qaa9V_XJHbJzbFNL3w@mail.gmail.com>
 <c16afd75-f54c-6c2b-7f61-1f1c7a4b3c46@roeck-us.net> <CAPLW+4kmUqg=2vYOiWfMhQFqFw1sh0Eo6Yqv8nPEbV_0MObn5A@mail.gmail.com>
In-Reply-To: <CAPLW+4kmUqg=2vYOiWfMhQFqFw1sh0Eo6Yqv8nPEbV_0MObn5A@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 28 Nov 2021 00:52:15 +0200
Message-ID: <CAPLW+4=pqZMry-O6_XT=V5AeZ+FfUwZLVp_=QjqudDrbxbZrCg@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] watchdog: s3c2410: Cleanup PMU related code
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 24 Nov 2021 at 01:30, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> On Wed, 24 Nov 2021 at 00:33, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 11/23/21 8:17 AM, Sam Protsenko wrote:
> > > On Tue, 23 Nov 2021 at 18:06, Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> On Sun, Nov 21, 2021 at 06:56:44PM +0200, Sam Protsenko wrote:
> > >>> Now that PMU enablement code was extended for new Exynos SoCs, it
> > >>> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
> > >>> grouping and style changes, to make it look good again. While at it, add
> > >>> quirks documentation as well.
> > >>>
> > >>> No functional change, just a refactoring commit.
> > >>>
> > >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > >>> ---
> > >>> Changes in v4:
> > >>>    - Added R-b tag by Guenter Roeck
> > >>>
> > >>> Changes in v3:
> > >>>    - Added quirks documentation
> > >>>    - Added R-b tag by Krzysztof Kozlowski
> > >>>
> > >>> Changes in v2:
> > >>>    - (none): it's a new patch
> > >>>
> > >>>   drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
> > >>>   1 file changed, 58 insertions(+), 25 deletions(-)
> > >>>
> > >>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > >>> index ec341c876225..f211be8bf976 100644
> > >>> --- a/drivers/watchdog/s3c2410_wdt.c
> > >>> +++ b/drivers/watchdog/s3c2410_wdt.c
> > >>> @@ -56,17 +56,51 @@
> > >>>   #define EXYNOS5_RST_STAT_REG_OFFSET          0x0404
> > >>>   #define EXYNOS5_WDT_DISABLE_REG_OFFSET               0x0408
> > >>>   #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET    0x040c
> > >>> -#define QUIRK_HAS_PMU_CONFIG                 (1 << 0)
> > >>> -#define QUIRK_HAS_RST_STAT                   (1 << 1)
> > >>> -#define QUIRK_HAS_WTCLRINT_REG                       (1 << 2)
> > >>> +
> > >>> +/**
> > >>
> > >> 0-day complains:
> > >>
> > >> drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead
> > >>
> > >> It doesn't seem to like the idea of documented bit masks. Not really sure
> > >> what to do here. I am inclined to ignore it, but I don't want to get flooded
> > >> by 0-day complaints until I retire either. Any idea ?
> > >>
> > >
> > > Seems like 0-day thinks this kernel-doc comment is for the first
> > > define only, and thus the comment has wrong format, or something like
> > > that. I tried to follow the same style as GFP_KERNEL and others are
> > > documented.
> > >
> > > Anyway, if you don't like 0-day complaints, can you please just
> > > replace kernel-doc comment (/**) with regular comment (/*), by
> > > removing one asterisk in the patch? Or I can re-send the patch
> > > correspondingly -- then just let me know.
> > >
> >
> > Oh, never mind. Let's just hope that 0-day stops complaining at some point.
> >
>
> Just sent v5 for this patch, fixing that 0-day warning properly. Found
> info about it here: [1]. So to check that warning, apparently it's
> enough to run "make W=n" build, or dry-run for kernel-doc script like
> this:
>
>     $ scripts/kernel-doc -v -none drivers/watchdog/s3c2410_wdt.c
>
> Anyway, please take v4 series + v5 for this patch. Hope that'll be all
> for 0-day swearing :)
>
> [1] https://github.com/torvalds/linux/blob/master/Documentation/doc-guide/kernel-doc.rst
>

Hi Guenter,

Can you please take this patch:

    [PATCH v4 12/12] watchdog: s3c2410: Add Exynos850 support

and replace "Cleanup PMU related code" patch you already applied with this one:

    [PATCH v5] watchdog: s3c2410: Cleanup PMU related code

I can see you already took most of WDT patches I sent, but those two
seem to be missing.

Also, I can't see my patches (which are already present in your
"watchdog-next" branch) in linux-next/master. Is that expected, or I'm
missing something?

Thanks!

> > Guenter
