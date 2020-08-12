Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8AD242A19
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 15:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgHLNLr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 09:11:47 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52772 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgHLNLq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 09:11:46 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200812131144euoutp02bc649a5a262eb257ed184a2c47b11790~qh2lcaFyv2357723577euoutp02M
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Aug 2020 13:11:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200812131144euoutp02bc649a5a262eb257ed184a2c47b11790~qh2lcaFyv2357723577euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597237904;
        bh=PokaBIPWOJxSuIMEJIZ7IgGf7rjk5z6WYaxEcxqcK5g=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=uaKlMmQD2379CNOcbtOOBNTu2QKqekqZJnemjUCMeAh0M9Sf0pTmK2gs5DZErYwYB
         7NfatUSciFc0UXRfbhDLXmXt3DqbzNq4rXlEJFWgrlTaZsTy9XVnODDlmYzs9I7g9W
         uI8g0hfRXPN/Igkn6Fb1Aisksdxdt0/W5zbNJCSo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200812131143eucas1p23655073adcfe3970743ac2ab1d604e7c~qh2k517Ts1886018860eucas1p2Y;
        Wed, 12 Aug 2020 13:11:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 75.73.06318.F8AE33F5; Wed, 12
        Aug 2020 14:11:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200812131143eucas1p2927d17920837183f222c2c5b3b8aac03~qh2khSdFj2499724997eucas1p2O;
        Wed, 12 Aug 2020 13:11:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200812131143eusmtrp18796d8a168e57b8d730b77f4d7f17aa9~qh2kgT6pC2515425154eusmtrp1J;
        Wed, 12 Aug 2020 13:11:43 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-d3-5f33ea8febbc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 19.12.06017.F8AE33F5; Wed, 12
        Aug 2020 14:11:43 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200812131141eusmtip15b8444b27aee49db1a159e0263ea9a70~qh2jEGBB90994809948eusmtip1d;
        Wed, 12 Aug 2020 13:11:41 +0000 (GMT)
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Arnd Bergmann <arnd@arndb.de>
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
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
Date:   Wed, 12 Aug 2020 15:11:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGPb339l4ai9erC2/ATG00ZosiDJecRCU6R3LiHwZj/MOZwbp5
        g0RatKU6TBZBpyiWj4FYLAT5cH40fBUQBbMiFe22gg0xYlW6ZWvHAOkqKwYEBWnvzPjvd97n
        efK+T3I4SrDLo7l0bZao06ozVHIF3f7gtWtD0WhCatyYPQ5bfU6E35Y8YHHgqhHhJxN/M7jI
        +4LCLlczi/tOjrG4xTvA4HHjbwwud9lkOH/Ax2B3o43F9rKfEPbV9MrwTHsujRt6PCyuetvA
        4P5fk3Aw0MXg2QErjSdL+mncOlghx3l/jVDY0vkG4e8HP8XekVkK/2GskG+LIfVV9Yg8Guin
        yMx0CSIB92mW1DmfIFLUGGRIh9nDkhbLOTm5UV/PkNYrJ4ipcg6R1hfDFOmYzGFJYZsFEddY
        GU26bfHJwheKLQfEjPSjom5j4leKg4Vd2w4PRX4btMfkoIrF+SiCA34TDJaZmHyk4AT+OoI/
        S3uYkCDwEwgCjk2SEETw86Ny5n2iLmeUloRrCGz3J+TSYxzBZG4BFXIt49Mhz9+EQrycXw1l
        w0NUyETxzzgYrnCGBTkfDwX3C8Os5BPh3yG3LMQ0vxb6yufC/AGfAjcdj2WSZyn8cslHhziC
        3w295f5wluKj4JnvskzilXDLXxleBnxeBFhrxpF09+dwr7aKlngZjDraWIlXgLPUSEuBUwiM
        d56z0qMYwe+O6v/Sm2Hw4fR8UW5+xUfQ1LlRGm8Hh6OYCY2BjwS3f6l0RCSUtJsoaayEs2cE
        yb0GZiwmmcTRcN43RxcjlXlBNfOCOuYFdcz/761GtAVFiQa9Jk3UJ2jFY7F6tUZv0KbFfpOp
        aUHzP9s563h1G9nefG1HPIdUi5XVP3ySKjDqo/psjR0BR6mWKz/rc6YIygPq7OOiLjNVZ8gQ
        9XYUw9GqKGVC7ciXAp+mzhIPieJhUfdelXER0Tno5v7nzbpFi16tS07et7lbc2SL5954INj9
        Xar8dceh3E7lutLYSR/TYFjbPD11aquVbjh+cVU2EXaVJrlNL6vXr0j32KMMP177Z1/biaeZ
        3rHTe2/0dZm0e/xbWwumEhVBa+Ndv9azoy6zZUdvXWXahfU7a7xZRJ208sO7U3HHepbsV9H6
        g+r4jymdXv0OSMDgb9UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA03Sa0hTYRzHcZ6dc7ZZro5z5pO+sBYSFB07W+bjJZEiOkWQFfSiizrypJLb
        bGdaFpSZoS7vpNlmU7GiTC0vmEYqrjLKZJiwpJxhLst0jVSw8tbcCHz35eH3efHAX4iJBwg/
        YZJKy2pUimQpfxXeu/jauq3whzx2e0P/OtRo6wVooaRHgBz38wD6MPONQIWjExgym58IUF/m
        pAA1jVoI9CtvmEDl5k4e0llsBBps6BQgU2kHQLbqdzw013oVR/UvrQJkXKgnUP/bvWja0UWg
        RUsjjmZL+nHUPGTgo+yv4xiqfTYPUNZQMBodX8TQSJ6BH+XP1BnrADNg6ceYub8lgHEMXhcw
        Nb0fAFPYME0w7XqrgGmqzeUzD+vqCKb57hXmVsUSYJonvmNM+2yGgCloqQWMebIUZ7o76Wjx
        cSpCo07VshsS1Zx2l/QEjWQUHYoo2Y5QipaHnAqTBUuDIiPi2eSkNFYTFBlHJRZ0RaWMrbkw
        bfLPAAZPHfAQQnIHrMn4gS+3mLwH4IsZSgeEznc/WJkldU+84bxFx9eBVc6JA8Ccm4OuvTeZ
        BLPtj8FyS8iNsPT7GLY8wsgvQjgwMgvcogODmc1FLsEnaZj/qsAlRGQknBob5C03TgbCvvIl
        V/uQMXA0fwlzb7zgm9s2l/UgD8N35XaXxcjNcN74HnO3L/xoq+S5OwA+tVdgRUCsX8H1K4h+
        BdGvIFUArwUSNpVTJig5GcUplFyqKoE6rVY2AedBtfb8aWkDup9HTYAUAqmnqKpYFismFGlc
        utIEoBCTSkS7+3pjxKJ4RfpFVqOO1aQms5wJBDs/V4z5+ZxWO89TpY2lg+kQFEqHyEPkO5HU
        V5RDdp8UkwkKLXuWZVNYzX/HE3r4ZQD22x6RUm+2Pqz8+mWoJflBwLXuemoq8YD/c3ULF7j6
        cumprPdnvLsM6702HZDjjyQDd8IOapM0dondut8YEBbtVVOhqoh/Vtamng1vqMqNS4s/wh85
        Wnb/0KLHsaHxmbe8W7+LjeeHt37uSDN6VocbUi7FRN+wHNtXfe5To6zHsVaKc4kKegum4RT/
        AL22A/hmAwAA
X-CMS-MailID: 20200812131143eucas1p2927d17920837183f222c2c5b3b8aac03
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200812091510eucas1p15944eb26bb496e20b9fadd609063a490
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200812091510eucas1p15944eb26bb496e20b9fadd609063a490
References: <20200804192654.12783-1-krzk@kernel.org>
        <20200804192654.12783-14-krzk@kernel.org>
        <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
        <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
        <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
        <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
        <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12.08.2020 13:28, Arnd Bergmann wrote:
> On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> On 12.08.2020 11:14, Arnd Bergmann wrote:
>>>
>>> It seems there have never been any callers and the entire file
>>> can just be removed, with the rest of that platform_data header
>>> file moved to drivers/media/platform/s3c-camif/.
>>
>> Yes, it seems that patch never made it to mainline:
>> https://protect2.fireeye.com/v1/url?k=abe5f73a-f6293cfe-abe47c75-0cc47a314e9a-7fafe832d055d852&q=1&e=2596ffb6-c4cb-492a-8c6f-a0e261567842&u=https%3A%2F%2Fgit.linuxtv.org%2Fsnawrocki%2Fmedia.git%2Fcommit%2F%3Fh%3Dtesting%2Fs3c-camif%26id%3D355cbf835aff2aabf78390931cbbaa608af77967
> 
> I suppose it would still apply if anyone was interested, but I see your
> point.
> 
>> I doubt there are still users of camera on the s3c2440 boards
>> with current mainline kernels, if any at all, there are much
>> better HW alternatives right now.
> 
> I see two board files (and no DT) instantiate the camif device:
> NexVision Nexcoder 2440 and the FriendlyARM mini2440.
> 
> Can you say whether the camif on those would actually work
> at all without your patch? If not, we know that there are no
> users of that driver and could either drop it completely or move
> it to staging for a release or two.

Without additional patches the camif will not work, the driver 
needs an instance of struct s3c_camif_plat_data which specifies
what image sensor is attached.

I think we can drop the driver, together with the s3c_camif_device
platform device definitions. It can always be added again if anyone
ever needs it or converts the platform to DT.

IMO all non-DT code in arch/arm/mach-s3c24xx is a candidate for
removal, it just adds to the maintenance effort and I seriously
doubt there are now any users of it.

-- 
Regards,
Sylwester
