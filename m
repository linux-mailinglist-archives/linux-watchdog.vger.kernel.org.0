Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90B425EEC3
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Sep 2020 17:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgIFPmx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Sep 2020 11:42:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729077AbgIFPmA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Sep 2020 11:42:00 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC587208B3;
        Sun,  6 Sep 2020 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599406920;
        bh=r/gOQLwi0vjxIzoJJal9o3e2qU4i0aOboXzVPzBsSr8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LDXst8xQux98fgwS+DCPPihpnc/EIEY5qjXq28Z6Q+CGRBgcseA42lQoMei/yn6wl
         7o3dnsXl8KCvWfXAyW6DQN8eWLud2lv08WmDva8Ob3vXhLaa5IAihtkKAgQoSAAx5o
         w9KubcmigtPzKB26MfUkK97aI+LYQYGo4cwv/I4U=
Received: by mail-ed1-f54.google.com with SMTP id t16so5493912edw.7;
        Sun, 06 Sep 2020 08:41:59 -0700 (PDT)
X-Gm-Message-State: AOAM532nFJQzpVqxCCzLyHyNjM00mgT4uKzwyTV38z3lHJtLKn5tqrbt
        H0Xk0c8UukToWbW8LN5pcwBz9UUslDOmK+KRoic=
X-Google-Smtp-Source: ABdhPJxIynhvt9FPtCkCknmoZlm54k/a28/XHX67a2orq3+WSH0hrY9/KZ8SKA/AvmUK58YzhTnGp1wjkPUSp+tg52g=
X-Received: by 2002:a05:6402:ca7:: with SMTP id cn7mr17583253edb.143.1599406918482;
 Sun, 06 Sep 2020 08:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org> <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com> <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
 <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com> <20200812133109.GA15697@pi3>
 <30eb6355-0749-8268-c87a-f389dc4b4f1b@free.fr>
In-Reply-To: <30eb6355-0749-8268-c87a-f389dc4b4f1b@free.fr>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Sun, 6 Sep 2020 17:41:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcrhv=1FKE+9RxuYtCb9ZbmMcLt2N0p5pf_sUTimE5Jtw@mail.gmail.com>
Message-ID: <CAJKOXPcrhv=1FKE+9RxuYtCb9ZbmMcLt2N0p5pf_sUTimE5Jtw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] ARM: s3c24xx: camif: include header with
 prototypes and unify declaration
To:     Cedric Roux <sed@free.fr>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 27 Aug 2020 at 22:51, Cedric Roux <sed@free.fr> wrote:
>
> On 8/12/20 3:31 PM, Krzysztof Kozlowski wrote:
> > Or even more important - is it worth to spend effort and time on this?
> > If there is no single production system using recent Linux kernel, the
> > answer should be negative...
>
> Well, I have a server running on mini2440 with a not-too-young
> but not-too-old kernel. I don't have much time to test recent
> kernels though so I guess that doesn't count.

Actually good to hear. It counts a little bit :)

Best regards,
Krzysztof
