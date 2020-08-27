Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ED5255032
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Aug 2020 22:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0UwF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 Aug 2020 16:52:05 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:35916 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgH0UwF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 Aug 2020 16:52:05 -0400
Received: from [IPv6:2a01:cb1d:6eb:3100:ad4:cff:fee2:7ba1] (unknown [IPv6:2a01:cb1d:6eb:3100:ad4:cff:fee2:7ba1])
        (Authenticated sender: sed)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id DAD4519F61F;
        Thu, 27 Aug 2020 22:50:30 +0200 (CEST)
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
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
        Lihua Yao <ylhuajnu@outlook.com>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
 <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
 <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
 <20200812133109.GA15697@pi3>
From:   Cedric Roux <sed@free.fr>
Message-ID: <30eb6355-0749-8268-c87a-f389dc4b4f1b@free.fr>
Date:   Thu, 27 Aug 2020 22:52:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812133109.GA15697@pi3>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/12/20 3:31 PM, Krzysztof Kozlowski wrote:
> Or even more important - is it worth to spend effort and time on this?
> If there is no single production system using recent Linux kernel, the
> answer should be negative...

Well, I have a server running on mini2440 with a not-too-young
but not-too-old kernel. I don't have much time to test recent
kernels though so I guess that doesn't count.
