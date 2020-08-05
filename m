Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0970A23C2EA
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Aug 2020 03:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgHEBL6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 21:11:58 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:29564 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgHEBL6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 21:11:58 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200805011154epoutp019df587c32144778ae2bc8251847247d1~oOhFWRoUg0461804618epoutp01g
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Aug 2020 01:11:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200805011154epoutp019df587c32144778ae2bc8251847247d1~oOhFWRoUg0461804618epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596589914;
        bh=hDLYzYfHbnyglVwlnkBmFuPskO6P5tYXJ7M1u0PeIXo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=BMraRx/koVyuiOvq6Ya9jMvIjeSs10CDnJJTwvAifGfN3Gza4Qzr8p7QBYPKU53CL
         /mbnXSI8XWGad/aFUu0FRxgPwAnBP/jynOjqeAVPxdxUG+ftJT8GEYAA0gvqOvSuHu
         EUmY5ldoAQEfGFTpGx1vXpmGcGqiomntHKIAVjwA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200805011153epcas1p3c9c9588625f9051da5137e7eb0b34283~oOhEjUNWj1187411874epcas1p3h;
        Wed,  5 Aug 2020 01:11:53 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4BLtr66V0yzMqYkg; Wed,  5 Aug
        2020 01:11:50 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.86.29173.6570A2F5; Wed,  5 Aug 2020 10:11:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200805011150epcas1p3c35e7509c0e954e4cf056cb868abc059~oOhCCk31b0916809168epcas1p3x;
        Wed,  5 Aug 2020 01:11:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200805011150epsmtrp1940caf1b8a475442ba0b51692e7b5167~oOhCBjPwC1575015750epsmtrp1D;
        Wed,  5 Aug 2020 01:11:50 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-a7-5f2a07566447
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7C.C8.08303.6570A2F5; Wed,  5 Aug 2020 10:11:50 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200805011150epsmtip1a3f2f782c70cdbf0719e17880ec76e67~oOhBshqsw0131801318epsmtip1O;
        Wed,  5 Aug 2020 01:11:50 +0000 (GMT)
Subject: Re: [PATCH v2 02/13] clk: samsung: s3c24xx: declare
 s3c24xx_common_clk_init() in shared header
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <47fafd62-15fc-3542-30dd-610738b6c848@samsung.com>
Date:   Wed, 5 Aug 2020 10:23:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200804192654.12783-3-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1CTdRzuu3fbuyHTl/nrG9o5Jtax4secgy8I6iV1rwd23FlcWcdc8AYc
        sO02trTOgJ3ID6fkgGpjEoqU0LD4qZBAAeYR1kJ+CAKeNDQIaA1SCBDaGF789zyfz/Pc5/t8
        vvdhYdwq3JOVKEullDJpMp/pRq9v8/H3jcYFkoDMwQBUNdoJ0FP9TziyfaUDKM86gSGL5Tsc
        /aKdxFG1tY+B7Lr7DPSFpZmGcvtGGaj/ajOOWgubABq9eJuGFuoz6KiyfRhHxU8rGajr59fQ
        jK2Fgdomsxhoqa+Kjmb1XXRUM1TERFkPxzFU0bgI0KkhMbKOL2FoRFfEPLCNNBebAdnd14WR
        C/N6QNr6M3GytPMuIPOuzjDIBuMwTlZX5DDJcrOZQdZcTiM/Ny0DsmZiDCMbZtNx8lxtBSAt
        k4V08sdmYRT3aFJoAiWNo5Q8ShYrj0uUxYfxI45IDkrEgQFCX2EwCuLzZNIUKowfHhnl+3pi
        smM9fJ5Gmqx2lKKkKhXff1+oUq5OpXgJclVqGJ9SxCUrghV+KmmKSi2L94uVp4QIAwJ2ix3C
        Y0kJN0zLuKLY/bj5QTVIBzq3XMBmQWIPbOiZYuQCNxaXuA5g9uQFpotMA3jbYqa5yAyAhtxi
        /JllUG9ZbTQCePNODeYiNgDzTGdoTtVGIhF22CtXGpuIXiY0XDIBJ8GIWwAOF40xnComIYAt
        Y/1MJ95AeMHeOatDxGJxiH3QYIXOMp3who8WO1dGbyaiYUf9KeDEHMIDdhhG6U45mxDDgkxf
        ZxkjtsJ7o1/SXHgHvDZlWnkDJJ6w4eBCE8MVIRy2dNsxF94I/7xVuxrNE47nnV7FH8Pyjnam
        y5wNYG3Lb6tmEWwpy6c5B2OED/y20d9V9oINCxeAa/B6+NdjHcMpgQQHZp/muiQ7YfeDYZoL
        Pw9Ls3KYnwK+cU0a45oIxjURjP8PKwH0CrCFUqhS4imVUCFa+93VYOV2BEHXwWdTf/u1AhoL
        tALIwvibOPaZlyRcTpz0xEeUUi5RqpMpVSsQO/Z7HvPcHCt3HJ8sVSIU7xaJRGiPMFAsFPK3
        ckbu8SRcIl6aSiVRlIJSPvPRWGzPdJo0/KzHo6OLdUvp89Tiq2dIQQib91h5uYBVZgqOKL2x
        tGv7QIR4RHslZK4JvI/FgDrd2O/tO84lHiwpKVQZlO2fePd9715zPixt2etQ9pX4nl1l2pKE
        7JiCt6O/md5/gubx6yD7lekjHmrK01ugdKdF9KcFvvPugM9hZDSX0rekTfTkaO/aNPaR5g/+
        yNC/7BX51jZD5YjY4wWfur2apJgm29ed+T+oTlIW0f43YtvWiTVPdpycuXgoQxN3fCiy6MWl
        53At3vthQdmbMpvbw1m6uvLaeHq+NVRRvt08mcLsMF2y3Vynf+/O4fsHTBs8jbmauaB/1x8b
        kO3VT/wj1O60+83z6aoEqVCAKVXS/wAqdk7WxAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTZxSH8/be23tpbLwrEF5oZNIYNKUwMXa+JAaJi9m7xDiDCVE/0DZ4
        RxEopRVlJg4wM2DTwNKIfwqCKGNYC0K7qJ0I0qqRgtZCxAZBne0AIwwJIbhRyyzNEr49Ob/f
        k3M+HIYQmakEpkBzjNNpVEUSvoC85ZIkpubQUsXW1uo41B0YBOiT6RGN5tqMANX53xPI4+mi
        0ZPTMzSy+UcpNG98RaGLnl4eMowGKOTr7KWRs/4eQIGWIR5avlVFoo4HEzRq+tRBIa97D1qY
        66OQa6aaQqHRbhItmbwkso838FH1X+8IZPkjCNDP43Lkfxci0J/GBn6WGFubrACPjHoJvPyv
        CeA53xkaXxt8AXBd5wKFHeYJGtssZ/n4utVKYXtrBb7QuAKw/f00gR1LlTSu/d0CsGemnsT9
        ven7RYcFO49wRQXHOd1XmUqBuqdxhdY2rSu3vrGBSmAUGEAUA9nt8KXJwzMAASNi7wBY91uI
        jgTx8Lz3IWEAzGeOhi6XPtKZBdD+NATCnWi2AA7MdxDhIIZ9yYfPjF4qHBDsAIBTvvURww7g
        m/Yafjjgs1LYN+1b5fVsEnz+0Q/CG4RsJrzkh+ExyW6Ck8HB1SNi2RzoaPXzwixkv4ADlwJk
        uB7FyuG5M6mRVZthsGmYiHAcHAs08yL8Jbw920j8AqLNa2zzGsW8RjGvUa4A0gLiOa2+OL9Y
        n67dpuFOpOlVxfoyTX5aXkmxDay+j1R6B/RYPqQ5AY8BTgAZQhIjnF/YrBAJj6h+PMnpShS6
        siJO7wRihpTECRfNLbkiNl91jCvkOC2n+z/lMVEJlbx7U/fLhSmp6sBNWf2QRlz9iBKXXi5c
        pxzebZfHJ5JVdzd2jMQ6r556hXctBvPUBkw93rNJLUsSna/KKO1qC2Yppjd86wFCt3apQZ7R
        KW1/siS7PxNVb08/+myveUG7szn79o5YmSl0bmPKSnmFMsvdn5w9fmgs5+jyYr+hG0hqbSrl
        lFh7LTf24NdZPzywPV2R7/Mr2wQ1gUNbS8cOvB5r/uDbb0shbvyqOPUaTyb/3f7im7sOx41m
        93BuWaaod+K7fcHsYHKMe1dee1LPhZySoYdc4j8jFbN9tVe+x30fT2R0/cScrBHkPg4MXswQ
        TxbVvE3YffWgk3EV+hpkWySkXq1KlxI6veo/0h8kMq0DAAA=
X-CMS-MailID: 20200805011150epcas1p3c35e7509c0e954e4cf056cb868abc059
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200804192736epcas1p1d2d70d7481631154e5efa66acf5e7f2f
References: <20200804192654.12783-1-krzk@kernel.org>
        <CGME20200804192736epcas1p1d2d70d7481631154e5efa66acf5e7f2f@epcas1p1.samsung.com>
        <20200804192654.12783-3-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Krzysztof,

On 8/5/20 4:26 AM, Krzysztof Kozlowski wrote:
> The s3c2410_common_clk_init() and others are defined and used by the
> clk-s3c24xx driver and also used in the mach-s3c24xx machine code.  Move
> the declaration to a header to fix W=1 build warnings:
> 
>     drivers/clk/samsung/clk-s3c2410.c:320:13: warning: no previous prototype for 's3c2410_common_clk_init' [-Wmissing-prototypes]
>       320 | void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
>     drivers/clk/samsung/clk-s3c2412.c:205:13: warning: no previous prototype for 's3c2412_common_clk_init' [-Wmissing-prototypes]
>       205 | void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
>     drivers/clk/samsung/clk-s3c2443.c:341:13: warning: no previous prototype for 's3c2443_common_clk_init' [-Wmissing-prototypes]
>       341 | void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm/mach-s3c24xx/common.c    |  1 +
>  arch/arm/mach-s3c24xx/common.h    | 15 ---------------
>  drivers/clk/samsung/clk-s3c2410.c |  1 +
>  drivers/clk/samsung/clk-s3c2412.c |  1 +
>  drivers/clk/samsung/clk-s3c2443.c |  1 +
>  include/linux/clk/samsung.h       | 32 +++++++++++++++++++++++++++++++
>  6 files changed, 36 insertions(+), 15 deletions(-)

(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
