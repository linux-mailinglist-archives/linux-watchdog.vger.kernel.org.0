Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C31242856
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 12:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgHLKqn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 06:46:43 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46811 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgHLKqm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 06:46:42 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200812104640euoutp01a3c9ccd0ec519facacaec0f50f9a1494~qf37cChwn2467524675euoutp012
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Aug 2020 10:46:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200812104640euoutp01a3c9ccd0ec519facacaec0f50f9a1494~qf37cChwn2467524675euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597229200;
        bh=CsBCtLcYbcMt47AadkgmhR+L6hFqUG74SoYdTAMzHZc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=E2zTZtRKwbc1AK/UlWC8QrGouY501V78PuLlC0qB3PQTiV5s99IFHoE4ImM0a0DgS
         9rAuJ0D2rgFtgH7TUuIeAnkhOJKWbzgClUEWyPwp6+FjWsF4HdNuQcpwS5RILO26JZ
         O3l2smPddCT9Y9CSustN6f8X/SDpeiFKOTMjZzlg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200812104640eucas1p185b2b1cbeeb865904bab52bd6a1251ee~qf368W0ns1075310753eucas1p1E;
        Wed, 12 Aug 2020 10:46:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 41.5C.05997.098C33F5; Wed, 12
        Aug 2020 11:46:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200812104639eucas1p172975669f4a1f783258b9dc88111cd24~qf36i-UmO1076710767eucas1p17;
        Wed, 12 Aug 2020 10:46:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200812104639eusmtrp225e9de21fc5469ce59100b5ac7bfb94e~qf36h2XEj0678006780eusmtrp2s;
        Wed, 12 Aug 2020 10:46:39 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-98-5f33c890715c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.8D.06017.F88C33F5; Wed, 12
        Aug 2020 11:46:39 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200812104637eusmtip21789a276f3fc4fb6e5ffc47fd03682f2~qf347B5Ca1720017200eusmtip2E;
        Wed, 12 Aug 2020 10:46:37 +0000 (GMT)
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>
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
Message-ID: <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
Date:   Wed, 12 Aug 2020 12:46:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0yTZxTG8/b9blQrrxXDEdyWNd62ZTh0Ju/iwiaZ2fvPkuFMvCSKnX4D
        NgrYgk5nIiqOrWOATRy1aovUeGkQ5FYuCzU0StkYNGxymYLG0WVjwAiCc4rQ8flpxn+/85zn
        5DwnORLWtwgxUlpGtmzOMKYbBC3nbX3U+Xpx29rkN8ZbOVoVakd02tYq0rELBYj2Tv7B06LB
        YUyDwasi7Tg6ItLqwR6ejhfc4ak96NNQa0+Ip30VPpH6TzYjGjr3k4ZOeY9w9Mr1AZE6p6/w
        tOvHjXRi7BpPZ3qqOPrQ1sXRmv7TAs3/fQhTT9MTRPP619HBoRlM7xWcFt6NZeXOcsR+6enC
        bOqxDbGxvuMic7f3IlZUMcGzRseAyKo9Xwvscnk5z2rOH2YlZ8KI1Qz/iVnjw1yRFdZ6EAuO
        nORYiy/+Q/127dt75PS0fbJ5dcIubWqJW8hyaz//1d6Ic1FQsqIICcibMDJaxCusJ5cQVM58
        ovIkgr/rt1qRdpYnENy0uvjnAw3f+TVq4yKCMmuVoBbjCP694cWKaxFJg/zRSqRwFEmER8PH
        ecWESb0EvgsDgtIQSDx8e6Nw1iRJOpIAzT+vU2SOLIdA77hG4cVkJ9QFup+yjiyEH06FOIUj
        SBI0lV1+qmMSDbdCrmf8EtSPnsHKLiBFEWCfuofV2O9BxVmvqPIi+CtQ+4yXQrjRpVEHjiEo
        +P62qBbFCO4GSpHqWg/9nY8FJSkmr0Bl02pV3gCBQDGvyEAWQN/oQjXEArB5S7Aq6+CrL/Wq
        exlMeUo0KsfAN6EwV4wMjjmnOeac45hzjuP/vaWI86BoOcdiSpEtazLk/XEWo8mSk5EStzvT
        VI1mH7t9JjDZgJqefOxHREKG+brSE2uS9bxxn+WAyY9AwoYoXWJH+069bo/xwEHZnJlszkmX
        LX4UK3GGaN3asqEdepJizJY/k+Us2fy8q5EiYnLRkZXUm+g0uQz+W5HDx7SrfrMNZCYMta2k
        9rht/Xs7Eru3dJfdPJH0gW7D0e2HYmq31b1zLdz2aU6Ue/cO5/TLBnvkg3k+a0N+6v3Cg9dR
        nev22X/y8mpY0v23mOPFoPmjzOaW9/cviV+ataLzwRebXwsvjt3oHtu0fAV+YTNxZm+KXGLg
        LKnG+Fex2WL8D+2i3H/UAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUgTYRyAeXd3u1NanWvWiwXFYQlBq5stX8Wkbw4iKCz6bh3ucpJzcTcr
        K2tFZg3LjzBtii6tUDMrtQ+NLFdZZrK0mvZhES76UFtRZOZHeVngfw+/3/Pw8sKPwtRPiSAq
        LsEqiAl8PKP0x5uG7r+emf4g1DC7vyIYXfY2ATSY1UAi37k0gNq+vydQemcXhtzuSyRqPthN
        ospOD4G+pr0mUK67ToHsHi+B2ivqSOTKvgmQ9/QjBeq/egBHF+52kKhg8AKBWh4uQd98twg0
        5LmMo96sFhxVvcpTotR3HzFUVjsA0KFXetT5cQhDb9PylPMnceUF5YB74mnBuP5fWYDztaeQ
        XHFTG+DSK74RXI2jg+Qqy44qudLycoKrOrOfy8n/Dbiqrg8YV9NrI7nj1WWAc3dn41x9HbtC
        vV4bKVoSrcJUk0WyzmM2sEinZcORVjcnXMuGhm2K0OmZWVGRRiE+bocgzoraojXlFCu3F/vv
        ep5bg9mAm7IDPwrSc+D1ky6FHfhTavosgD9Kigg7oIYXQbDwEDPijIcDHrtyxPEB2NDxhpQX
        4+k4mNpzEcisoRfCvq4UQpYw+hYFf+Y0kiNFvQIOljiVsqWkWXjs3nEgv6Cio+DNVr08xulp
        8H7bV4XMgfRm2HnsNyazig6Ajae8uMx+9EpYW1T618HoEDhQ0IqN8ET4wlv4bz4FXuvJxzKA
        2jEqd4xKHKMSx6jECfAyoBESJXOsWdJpJd4sJSbEamMs5kowfFFXG/qqrwP752gXoCnAjFE5
        M3UGNcHvkJLMLgApjNGoFjY3bVarjHzSbkG0GMTEeEFyAf3w5zKxoMAYy/B9JlgNrJ4NQ+Fs
        WGhY6FzETFQdoes3qulY3ipsE4Ttgvi/U1B+QTbQvPeSaH58oHG66XBkb3R1cobfW2mx+4bz
        cGDpsmRLiHPrvpTlmqKDvXMLn/VETA5eZ5xabMtKb0gde+Vltk8xLRLtP5E3zhRhLLkNdV8+
        RfF3jXcWVO1LlgpbdjL8WrHvZZLLdoXWLDLlr2qdsNq3dE97SEi3bbLhQV/AuXv159cwuGTi
        2RmYKPF/AMmIa/tnAwAA
X-CMS-MailID: 20200812104639eucas1p172975669f4a1f783258b9dc88111cd24
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
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12.08.2020 11:14, Arnd Bergmann wrote:
> On Wed, Aug 12, 2020 at 9:59 AM Stephen Boyd <sboyd@kernel.org> wrote:
>> Quoting Krzysztof Kozlowski (2020-08-04 12:26:54)
>>> The s3c_camif_gpio_put() declaration in
>>> include/media/drv-intf/s3c_camif.h header was different than definition.
>>> Fixing this allows to include that header to also fix the W=1 compile
>>> warnings:
>>>
>>>     arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous prototype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
>>>        28 | int s3c_camif_gpio_get(void)
>>>     arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous prototype for 's3c_camif_gpio_put' [-Wmissing-prototypes]
>>>        56 | void s3c_camif_gpio_put(void)
>>
>> Maybe it should have been void all along?
> 
> It seems there have never been any callers and the entire file
> can just be removed, with the rest of that platform_data header
> file moved to drivers/media/platform/s3c-camif/.

Yes, it seems that patch never made it to mainline:
https://git.linuxtv.org/snawrocki/media.git/commit/?h=testing/s3c-camif&id=355cbf835aff2aabf78390931cbbaa608af77967

I doubt there are still users of camera on the s3c2440 boards
with current mainline kernels, if any at all, there are much
better HW alternatives right now.
