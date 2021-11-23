Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A331645B036
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 00:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbhKWXdp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Nov 2021 18:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhKWXdo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Nov 2021 18:33:44 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095F7C06173E
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Nov 2021 15:30:36 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id j14so1189321uan.10
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Nov 2021 15:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uH2JEgWqlojJT+gIT9qwTADRtilTdk+WNcpN0oAZvQ=;
        b=TbsN1JEoVY3coBHtA1QUvJt29+ocfTE4puD82o8SA8CpuYfpew5eojbhBQF0udbQos
         Ycw5YJSOSkhuDBvAra8mhEJyNReY33YhLiETQEfGpk/VGlDX6FG9jcgI6d9uhqyMdU6j
         eAM0mbcFOyFgBfLUOWE9V8f/vpQ2NrEU+iwSRaWzUSV9Af6jZ7393a768iA4pPyXiAFJ
         wi9KRy9lj63AhPHgksco4Qnhm/SConqZrP55CAxZ8vyBYeB0bNaOcCjN90SgWnHzQSFX
         FuEt2erenHe+XJOziuPoMAlmIZFNFNt8RuDpb5qYpZpTuSANmV2jDRaGEus/VY7aOLIA
         FmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uH2JEgWqlojJT+gIT9qwTADRtilTdk+WNcpN0oAZvQ=;
        b=D/ewF+E7wdb+BWJxWUrBo7MyQVIyoQLkfYC1Ny4lHMYuasHlLtemzavMrbfdYg6qKZ
         u8xZ5HlUTT0Lp1T7AuTdLypgzzUgn64GaIQwfRRfwNxcWN6mICu7+au+JcphYdZbWEF+
         +xl3HMzY798gG45ylxRaTVcLOtcZEv7taU2m6Fu5KYpDq9Wb0julRWN2p4mWmBeqMBFw
         enQQzfFrtvcadVhI4K7m3fsZ7m+/Wvs9rrFmiLYFSAbdw+y8OUPQ5ajyEaR8agSzIofX
         HrUHDmA9njXpiFzGDqJw4UOyHbCKLSW8P96LdP8CyCPyl79n54jLAmyNWj3cIGqjC+99
         M3ig==
X-Gm-Message-State: AOAM531gCNgUEMaao88sCTGgDd1JQ/V3syC5PF4PmU8TNLFE2KApXBbC
        Ib6a/rJb0qDzgoLWkTRIQQnvI1f728RGS0T52nHCTg==
X-Google-Smtp-Source: ABdhPJz1klqwCzocaTGDtjBLzJU441KZakT44KfwMrLKAtO8PAfpBMoKjJIcO/CPGTx2WiiCI5gOBsKRA8/VomglBtQ=
X-Received: by 2002:a9f:2431:: with SMTP id 46mr2194379uaq.114.1637710234844;
 Tue, 23 Nov 2021 15:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
 <20211121165647.26706-10-semen.protsenko@linaro.org> <20211123160623.GB2326185@roeck-us.net>
 <CAPLW+4mwhH5C6zSxWDboNucZPvt2c=F7Qaa9V_XJHbJzbFNL3w@mail.gmail.com> <c16afd75-f54c-6c2b-7f61-1f1c7a4b3c46@roeck-us.net>
In-Reply-To: <c16afd75-f54c-6c2b-7f61-1f1c7a4b3c46@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 24 Nov 2021 01:30:23 +0200
Message-ID: <CAPLW+4kmUqg=2vYOiWfMhQFqFw1sh0Eo6Yqv8nPEbV_0MObn5A@mail.gmail.com>
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

On Wed, 24 Nov 2021 at 00:33, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/23/21 8:17 AM, Sam Protsenko wrote:
> > On Tue, 23 Nov 2021 at 18:06, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Sun, Nov 21, 2021 at 06:56:44PM +0200, Sam Protsenko wrote:
> >>> Now that PMU enablement code was extended for new Exynos SoCs, it
> >>> doesn't look very cohesive and consistent anymore. Do a bit of renaming,
> >>> grouping and style changes, to make it look good again. While at it, add
> >>> quirks documentation as well.
> >>>
> >>> No functional change, just a refactoring commit.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >>> ---
> >>> Changes in v4:
> >>>    - Added R-b tag by Guenter Roeck
> >>>
> >>> Changes in v3:
> >>>    - Added quirks documentation
> >>>    - Added R-b tag by Krzysztof Kozlowski
> >>>
> >>> Changes in v2:
> >>>    - (none): it's a new patch
> >>>
> >>>   drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
> >>>   1 file changed, 58 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> >>> index ec341c876225..f211be8bf976 100644
> >>> --- a/drivers/watchdog/s3c2410_wdt.c
> >>> +++ b/drivers/watchdog/s3c2410_wdt.c
> >>> @@ -56,17 +56,51 @@
> >>>   #define EXYNOS5_RST_STAT_REG_OFFSET          0x0404
> >>>   #define EXYNOS5_WDT_DISABLE_REG_OFFSET               0x0408
> >>>   #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET    0x040c
> >>> -#define QUIRK_HAS_PMU_CONFIG                 (1 << 0)
> >>> -#define QUIRK_HAS_RST_STAT                   (1 << 1)
> >>> -#define QUIRK_HAS_WTCLRINT_REG                       (1 << 2)
> >>> +
> >>> +/**
> >>
> >> 0-day complains:
> >>
> >> drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead
> >>
> >> It doesn't seem to like the idea of documented bit masks. Not really sure
> >> what to do here. I am inclined to ignore it, but I don't want to get flooded
> >> by 0-day complaints until I retire either. Any idea ?
> >>
> >
> > Seems like 0-day thinks this kernel-doc comment is for the first
> > define only, and thus the comment has wrong format, or something like
> > that. I tried to follow the same style as GFP_KERNEL and others are
> > documented.
> >
> > Anyway, if you don't like 0-day complaints, can you please just
> > replace kernel-doc comment (/**) with regular comment (/*), by
> > removing one asterisk in the patch? Or I can re-send the patch
> > correspondingly -- then just let me know.
> >
>
> Oh, never mind. Let's just hope that 0-day stops complaining at some point.
>

Just sent v5 for this patch, fixing that 0-day warning properly. Found
info about it here: [1]. So to check that warning, apparently it's
enough to run "make W=n" build, or dry-run for kernel-doc script like
this:

    $ scripts/kernel-doc -v -none drivers/watchdog/s3c2410_wdt.c

Anyway, please take v4 series + v5 for this patch. Hope that'll be all
for 0-day swearing :)

[1] https://github.com/torvalds/linux/blob/master/Documentation/doc-guide/kernel-doc.rst

> Guenter
