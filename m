Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AB9242CBB
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 17:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgHLP67 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 11:58:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60446 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgHLP66 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 11:58:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200812155855euoutp017c2cebb2ab12c9ee88d784fe12077d9b~qkIjs7Cm-0035500355euoutp01E
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Aug 2020 15:58:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200812155855euoutp017c2cebb2ab12c9ee88d784fe12077d9b~qkIjs7Cm-0035500355euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597247935;
        bh=OPQOjjjY5rjXPOYBc8QIPVqRWDhlxbGkmhq677nsDb8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ri2VqpspmVxx8R0nxAAeqJhan5/y3pZjeDji3CgygGmH0koTAFnuqDmCNDekO6UdG
         U2qCW23G6ffpqCHeVqEhlZRcxRZIAcFYqS5PogH1s3QnNB8BGzCnzxAR69cwwsBSBf
         yRnlucAUh9w/TmZbl1OroC0YszdMUrgzlkw2eyxQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200812155855eucas1p2f96c225469ee4ef1e7ba58f8948eb62d~qkIjMQTj41501015010eucas1p28;
        Wed, 12 Aug 2020 15:58:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A0.7A.06318.EB1143F5; Wed, 12
        Aug 2020 16:58:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200812155854eucas1p2e0da43507dbe97850c5f08e1057b005e~qkIi0buT61215212152eucas1p27;
        Wed, 12 Aug 2020 15:58:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200812155854eusmtrp1f5bcbbb82c6f153700667b9f477c220e~qkIize8vU0570705707eusmtrp1v;
        Wed, 12 Aug 2020 15:58:54 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-5b-5f3411be780c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 7B.C6.06017.EB1143F5; Wed, 12
        Aug 2020 16:58:54 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200812155852eusmtip1689c2db100dd9fd0448a752fe129c3ab~qkIhPRxbW1597215972eusmtip1g;
        Wed, 12 Aug 2020 15:58:52 +0000 (GMT)
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
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
Message-ID: <828b3dd5-31f0-0414-e6ea-7629b063e8ce@samsung.com>
Date:   Wed, 12 Aug 2020 17:58:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812133109.GA15697@pi3>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTm7N67e5VW1/XhmwbBKKggbWnw0hcVBbcgiIKKouxWN5XUYmt9
        QWT2Yc1ltjJr2bRPcyzTzVxZbTWqYcuWRdNMZ+GkTE1MQ1KnuV0j/z3nec55n/McXoaQO6VR
        THLaPkGVxqcopOFkxas/b2fbI+IT5nwrWoDL/G7AAf0rGnfe0QGu7flG4XPNbQT2eEppXJ3R
        TmNLs5fCXTofhS977BKs9fopXFdip7Ez9ylg//U3EtxfcYzE91400tgYuEfhmtcrcHeng8KD
        3jIS9+prSGxtuCrFmS2tBDZVDgA+0TAPN7cOEvir7qp0STRnNpqB++CtIbj+Pj1wnXUnae6m
        uxa4cyXdFPfI0EhzFtMZKVdsNlOc9dZRLi9/CDhr23eCe9SbTnPZ5SbgPO25JPfcrlwj3xS+
        cKeQkrxfUMUu3haedKfrPLVXG3mw3GOl08Ep10IYg9h41JxhAy2EM3L2LqCLDh8RFORsD6DP
        pawodAO6drpNogUmNPHGtk7kiwD5Cmy0WHQBMhVlk8Hp8Wwyyuy4D0E8gZ2JagO9VLCJYN8x
        qLTpUkiQskp09mV2CMvYxShgPCMNOpDsdFRQPy5IT2S3ogeujxKxJQJVXfGH3g8bfvNysT7E
        E2wkqvcXjOCpyNaRTwS9EJsZhnou+UHMuRxZrjsIEY9HP1zltIinIPcFHSkOHAeke/yZFosc
        QE2uwpHpBajhbV9oO2LY+n5lrEgvRS5XDiWeZSyq64gQlxiL9BV5hEjL0OlTI6eehvpNeRIR
        R6Es/xCZAwrDqGiGUXEMo+IY/vsWAmmCSEGjTk0U1HFpwoEYNZ+q1qQlxuzYk2qB4Z/tHnT9
        fgj2ge1OYBlQjJHl9MUlyCl+v/pQqhMQQygmyJZVu7fKZTv5Q4cF1Z4ElSZFUDshmiEVkbK4
        G61b5Gwiv0/YLQh7BdU/VcKERaXDE2PMRsdms/WII6bjoa/alt64buD1zx9ti3bHTr65Omlj
        dlZ75Qr/U5+uqSbz7kpD4MR8VtE1blL8C/3cDVZL2bMnXzSfLs4+2uLNmiHs0kTUv++LrlpP
        K+MGSle9nH87/8FQ7MT+ytbvxiqen16S++FC/S/JmOIMquU2tXbXkiplhoJUJ/HKWYRKzf8F
        Z9Obp9UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3fO2TlWo+NJ8cXowgGRgs4607nXMIluvNGHgupLpTb0oJJz
        trN1+5LdMIe5XEi2alaW0PJSm2gXmrVKK5VhxbTQIrZuWIlUmPe2LPDbj//z//HwwMMQ3Csq
        nskvNEumQn0Br5xNdky29y/3RidnrWit4dGtUAdAE/Y2Gg3WlgHU8/MThWzBAQL5/Tdp1HX0
        K43cwQCFhsreUqjK71UgayBEod4GL418lfcBCl3uVKCx5iMkqn/cTyPnRD2Fup+vRz8GWyk0
        GbhFomF7N4k8feeVqOTDFwK57o4DdLxPi4JfJgn0vuy8cvUCXOesA/hloJvAY6N2gAd7T9C4
        pqMHYFvDDwrfcfTT2O0qVeLrdXUU9lw9jM9emALYM/CZwHeGi2lc3uQC2P+1ksQPveIWboeQ
        ZjJazNKSPKNsXsXvFJFGEFORoElOFcQkXcZKjZZXp6flSAX5+ySTOn23kFc7VEEVWeMONPk9
        dDHwcVbAMJBNhp0tW61gNsOx1wB0PuhTTufxsPo4bwVRYZwPxwNW5XRnEMCqt71EZDCfzYcl
        3xpBhGPYpbBnYpiKlAi2l4GXzzT+MypI+PPKMTrSUrIiPPWk/K+hYtPhhLP07zaSTYDVb+ZF
        4lg2EwZPTRHTlWj47FyIjHBUeEHVdbsiwgSbCMedL4hpjoNvQtX/8sWw5dsF4jTgHDN0xwzF
        MUNxzFAuAdIFYiSLbMg1yBpB1htkS2GukG00uEH4o5rbRppuA+v3rT7AMoCfqzo9mpTFUfp9
        8kGDD0CG4GNUa7o6MjlVjv7gIclkzDJZCiTZB7Th2yqI+NhsY/g/C81ZolbUoVRRl6RLSkF8
        nOok+3AXx+bqzdIeSSqSTP89BRMVXwy8NrzxQVrRjejW37H7N3I7/bUrR4jJ0txE7eHN7ywu
        hsybw6tztH1LXjdOLXLfy09YcGSd4vv2A8a13VXbamb9qvSUd2V8vL+p6OmWREEs0ejGHo0M
        XNwPzbZgQky9vbzTHTrmN2Yu/FQiqIObbKPte1OCG5yvG86tT1HPcd3O4Ek5Ty8uI0yy/g8L
        Ds11ZwMAAA==
X-CMS-MailID: 20200812155854eucas1p2e0da43507dbe97850c5f08e1057b005e
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
        <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
        <20200812133109.GA15697@pi3>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12.08.2020 15:31, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2020 at 03:11:41PM +0200, Sylwester Nawrocki wrote:
>> On 12.08.2020 13:28, Arnd Bergmann wrote:
>>> On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
>>> <s.nawrocki@samsung.com> wrote:
>>>> On 12.08.2020 11:14, Arnd Bergmann wrote:

>>> I see two board files (and no DT) instantiate the camif device:
>>> NexVision Nexcoder 2440 and the FriendlyARM mini2440.
>>>
>>> Can you say whether the camif on those would actually work
>>> at all without your patch? If not, we know that there are no
>>> users of that driver and could either drop it completely or move
>>> it to staging for a release or two.
>>
>> Without additional patches the camif will not work, the driver 
>> needs an instance of struct s3c_camif_plat_data which specifies
>> what image sensor is attached.
>>
>> I think we can drop the driver, together with the s3c_camif_device
>> platform device definitions. It can always be added again if anyone
>> ever needs it or converts the platform to DT.
> 
> Since the header was in /include/media I assumed there might be some
> user-space tools using it. But if it is not the case, I'll drop the code
> then.

That's a kernel internal header, only for board files, it should really 
have been added to include/linux/platform_data.
  
>> IMO all non-DT code in arch/arm/mach-s3c24xx is a candidate for
>> removal, it just adds to the maintenance effort and I seriously
>> doubt there are now any users of it.
> 
> That is quite tricky... I really do not know whether there are any real
> world users of S3C24xx and S3C64xx platforms. Evalkits are mostly not
> available for buying so I do not expect new designs. However still
> existing ones might be somewhere... Few years ago, back in Samsung, I
> mentioned removing them. That time I think Marek or you Sylwester, said
> that there are industrial applications using S3C24xx. I believe, why
> not. The trouble is - how to find such users? How to get in touch for
> testing or at least for bug reports if something is broken?

I believe if there any such applications of the S3C24XX SoCs still existing 
somewhere their long term support doesn't include updating to new kernels. 
I used to keep a running S3C2440 SoC based board just for the purpose of
testing patches touching the common code, but I stopped it, I think it is
not worth to waste time and health on it any more. For example support for 
the OSELAS.BSP-Pengutronix-Mini2440 BSP I used for tests ended 5 years ago
[1].

> Or even more important - is it worth to spend effort and time on this?
> If there is no single production system using recent Linux kernel, the
> answer should be negative...

I suspect nobody cares about that code (non-DT s3c24xx) any more for other
than sentimental reasons.

[1] https://git.pengutronix.de/cgit/OSELAS.BSP-Pengutronix-Mini2440

-- 
Regards,
Sylwester

