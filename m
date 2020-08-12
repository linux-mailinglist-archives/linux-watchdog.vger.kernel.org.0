Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB85F242749
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 11:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgHLJPG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 05:15:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60651 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgHLJPF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 05:15:05 -0400
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N49Yn-1knPDq0gc5-01020t; Wed, 12 Aug 2020 11:15:03 +0200
Received: by mail-qv1-f44.google.com with SMTP id b2so683847qvp.9;
        Wed, 12 Aug 2020 02:15:02 -0700 (PDT)
X-Gm-Message-State: AOAM532uwtt0KfQ8eMASY0ruVWWgJb0K0BmMTFRlZzRGZQ67MdwDu4PW
        pdoHDw4GohXQRwVEQRVaM9NJWkcWW09HONaOWCU=
X-Google-Smtp-Source: ABdhPJx0VdO25VsXrKJTGh++kO4RzTD7ABEGX3vxwAEv4hRe86n9s2x2EuFs5/Fm/ZiIRZ9shvLmiOvKZowrNIwmt2A=
X-Received: by 2002:ad4:44e5:: with SMTP id p5mr5592821qvt.197.1597223701843;
 Wed, 12 Aug 2020 02:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org> <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
In-Reply-To: <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 12 Aug 2020 11:14:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
Message-ID: <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
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
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
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
X-Provags-ID: V03:K1:bTDtJI1lkKkLvgsIHRpW0ziEP8zpHuLUYZ7SCV7CWDb0QxoD296
 NDdAfDIk8grOWNJr2ySjYHegmKgJuUgb2o/U9UWi6oBle997lCfw5E8r2BCzIRnBvIILa2i
 /auQ0xMRDZJumI0NRAyowADabdngizQKolsLaXYJiv18nb+TI9PNB3FgOMSF3F8YGDz9zqj
 2RIyZEUzuh1qz87OO0UZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qTeOd2VnZz0=:I3Y6DTZUjvmV44dOocq9k9
 lQryWn0PqQ3kDhTthk/FFhhnE2GuVsh+hJP4jyoOGFexkP5xPiSZ6elmY5aSsloMGdUWB2Wt4
 8vsCZpRg346I6WRR683y/dOCMmzN5Qx1snUHlthWUaT5rgDDDV2VYYU/1Z2rIQI453dd+MLZk
 RFQGV5Pa/T61PWy2Rqj7Q+br/wW419+pJae0Q4W7/L6G9mlbp5Gv6maXTWbQ0Q64LIgIp+aj5
 aX8q355XZQxPvNPLoCoKTZ0+3NzGyd/NbC5InBNVFDsVcF/qtsBWElMnB9XHVDMsxYIbGtLsx
 i7Xdh/TcRa3/Gdn85iJ0DiIorYkmac6xqa4oqXDFShkMmlybnwqJh52lv+61ZkGlThJzBB6c/
 2H+p3xsv9dx07pTNqEHLBTF3x6hNwCsfayVa9LAYrca80r5neuC5PGttscvdOAhUFNMGT/lZJ
 Oxhu9GzVTx8HGasmPBx9RGYeVKT+Fm5nr8zgzA7WBc7hLAyhhOqMKPOVmoboJVp/wd6BwiTmw
 AnT6D3q76IRI0KjEqZWn8ZfjYuclswA8Dd4BFKwiv/DrxpHW8lQVrYRAdOd7QzWdqSqN8ZXHj
 3Sy7fSqjD9T+sgxRrKR66cATjMtv1iFeklH5QmEIzKnFX3vbPRha/r16EjEG3RYnEGtBQBrRC
 +fq9yVrA1gqq9UW6iC6dqGWB0Z6jeiRjGUfPCW4BQgCqylSudgOJ2a6Akmploy37qf/p3NQB7
 MhX/HADQHvthTwbv5GaZCrajPvYCCyDkwvcZiH+danDQzjbkHXtIWcjAtMmJcDchhhVZGY4Pr
 Nmlj6EtNODw2apz26ei/kNhnMJ46uyb4aVITnVJVpXyjNOXfxkr1kY3vYQ+/l29ewvkX6RWp3
 JcRf9Drf4ZDIsbmpvHrWvDlyLKgSNsF0ppFAA94nsvWm50iDwFxQuz5EChjU5y2Ai09BxyWsv
 6cSv0UOeRZYMLZFfCn7XSsKeSoag/C5UnLhS2QGtd16vrai4GVTNR
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 12, 2020 at 9:59 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Krzysztof Kozlowski (2020-08-04 12:26:54)
> > The s3c_camif_gpio_put() declaration in
> > include/media/drv-intf/s3c_camif.h header was different than definition.
> > Fixing this allows to include that header to also fix the W=1 compile
> > warnings:
> >
> >     arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous prototype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
> >        28 | int s3c_camif_gpio_get(void)
> >     arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous prototype for 's3c_camif_gpio_put' [-Wmissing-prototypes]
> >        56 | void s3c_camif_gpio_put(void)
>
> Maybe it should have been void all along?

It seems there have never been any callers and the entire file
can just be removed, with the rest of that platform_data header
file moved to drivers/media/platform/s3c-camif/.

     Arnd
