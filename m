Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DB02428A8
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 13:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgHLL2z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 07:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39803 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgHLL2y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 07:28:54 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLzeb-1kN4o136Y5-00HzPW; Wed, 12 Aug 2020 13:28:52 +0200
Received: by mail-qt1-f170.google.com with SMTP id o22so1127966qtt.13;
        Wed, 12 Aug 2020 04:28:52 -0700 (PDT)
X-Gm-Message-State: AOAM531AkD4/0SayogMk90hrDyOlkL9n8c4b64soJbT5S3a1qLWmHG/m
        IYvV+PJEgv5C7QxchBD1kn9srofSiSMizNVGqf8=
X-Google-Smtp-Source: ABdhPJxsW8KvhXUS1ojoIaqN362ISA/JDUik1npds+V9z2Z/6a42INf5aMjjkxMPeXquVPo4e7r0h6AJVgmGkNoG4Tw=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr5752270qtd.18.1597231731435;
 Wed, 12 Aug 2020 04:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org> <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com> <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
In-Reply-To: <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 12 Aug 2020 13:28:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
Message-ID: <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        patches@opensource.cirrus.com,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2C/lhlOU3R2lkBbParLcFu4HTCZmdLUHTi3gkwxRTTYn4h+FnJw
 ezp9uvaYSpdsqf/cwkshQq32GCk8qrX26af3HGamFCEFfhUzXLETkoCXm2/4/Z+lZ1x/vi4
 cS6woBG4E5rpy6FEr90UlnDwI6fvIxvFXda/d3/GAV7ORck5VKk4Y+3bwmLjdA7gUpyGReZ
 ouz1QWSh3nwK9W2vlgoYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YY5ax/N2kRs=:dL4ZaISW56P3jQkQRTrGSb
 ZIIicumDg7fpoDKvbKFrbVkrm+v9+l5TI1kxINFI0Yhu87iqnQQ9ARixHZt2poF0zLooRZHls
 Rq2uFWr4Qckeq6c7AU+uoOJP7g71bvGDCCAVDCKGkGuOmvWovR7DJJRdWt4pdAaTeZ/pvuHe3
 sGwIXL5U+d5Vi80rY/vfxE+ZDOPWdqyHri7L4UYiACtpKTxy4inHzklxXjG6b5FYi+JIZw40j
 6peAEHbpSyDUa+E7LbtJapLg2mXyhsofKB6eiHTQImggrFyAKSbZzlHeofN7DzEEbf62PiP7I
 nmdI9+UqhY0E6kyyDjLNEmN6OLDXX1lGiyrl9+SaNgQKJvOra8I/Wo2hnrLzzZX473xzJWtYu
 YeWsB80Ga5IdRqEBPPp57dP8Zr3FZCZSvfhge5BbFuerBxEOKNa+YU+OVCpy/WGpeP102VB8b
 rncYSJDyfkCPWIPeufO9W/fQZIw9zARfi1eVCzzEG3QpfdMZb0M/rTd7NmS0KlzS/XYaETnVQ
 Rczlo85V2naNkZ5roTAPiiurQWbdykC0bA6Vlxrt6FtQ/DDm0dmmACkoeeUVwkr+SX6yT1xxa
 07LL6N0CLx7gpsB3Sqz1CRdWtjNk7ZZ75MiUgeeEYvuQ99j3qz8JYbR/gKktg5KvBhaPRMEyK
 iGr50JkotdeF/3fBk09vexA8tV/DXTMbvJY9vysf6fhHTILX9kgibgab+tx3iGsvlSFrYwYXb
 qHJojb0NOcnAEkT4C3Cf4Y4VRn6EdPlvC7JzdYVVOUyqwRKyh7EuQA8wmxlLOjVDG/QyW+Id+
 xEcgbiQhK5Djs6M8pLZhJp2LJq38ECS+FdW+l1v+gVCCVawC/NxrvghQb+tv9ucd3VJnFGbrN
 h+/GFsM7KYEF1awB2RWLWbLAQOYam8LynA+C1NOFxLIGAF77vW0WiDQoYLQCoIGo79tuo5d4u
 skhRnA6nY+TnbQgl6fEHP26E95WRdy3DUFZDFoW8YpFQIt0v3/aVB
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 12.08.2020 11:14, Arnd Bergmann wrote:
> >
> > It seems there have never been any callers and the entire file
> > can just be removed, with the rest of that platform_data header
> > file moved to drivers/media/platform/s3c-camif/.
>
> Yes, it seems that patch never made it to mainline:
> https://git.linuxtv.org/snawrocki/media.git/commit/?h=testing/s3c-camif&id=355cbf835aff2aabf78390931cbbaa608af77967

I suppose it would still apply if anyone was interested, but I see your
point.

> I doubt there are still users of camera on the s3c2440 boards
> with current mainline kernels, if any at all, there are much
> better HW alternatives right now.

I see two board files (and no DT) instantiate the camif device:
NexVision Nexcoder 2440 and the FriendlyARM mini2440.

Can you say whether the camif on those would actually work
at all without your patch? If not, we know that there are no
users of that driver and could either drop it completely or move
it to staging for a release or two.

     Arnd
