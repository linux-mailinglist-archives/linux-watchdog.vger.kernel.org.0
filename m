Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA802325C0
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 22:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgG2UBr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 16:01:47 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60099 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgG2UBq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 16:01:46 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M27ix-1k2o4n3dMn-002TvV; Wed, 29 Jul 2020 22:01:45 +0200
Received: by mail-qv1-f45.google.com with SMTP id t6so6541682qvw.1;
        Wed, 29 Jul 2020 13:01:44 -0700 (PDT)
X-Gm-Message-State: AOAM532aeUg+92QPOwCYMfTp2hqcolJ7rsGt6aQu8w/CQyUkGBfiteA/
        wePMQjV6OcpKkjLPbcHGW55lmJBdvNHrDpspJN0=
X-Google-Smtp-Source: ABdhPJy0Ua6F8cJWKsPP2p9baaRfve0Dq+caOpEYZQuW5KpGIU4VwtaO5Yvv8AbCmTFZHyZTlC3sodaIaAmZei/ujVY=
X-Received: by 2002:ad4:450e:: with SMTP id k14mr3013292qvu.211.1596052903435;
 Wed, 29 Jul 2020 13:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-1-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 29 Jul 2020 22:01:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
Message-ID: <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: samsung: Cleanup of various S3C bits
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com,
        linux-clk <linux-clk@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Q8A7xviGqc7Fth6WK20wIRqSW7CFaj23ClHH9Hs3328Q502L4qu
 8Ygrz3T6QN2Mi6qOyEh2QodvgrqhOX5YoN8QXW9nenBsW85gWWwm0nNnE52I6tmS2LsAyAe
 XG2DSr2tmzebrlTy8D+EBGQVIynWUG4Zgl0gZ6WzzOh5KenTv2R4u9qznuyaiUsrJbLu5P2
 BErqnU8o1MBGlml/5DI4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PJkfMKESGco=:wppo13eJj9pHLnh4I61X5y
 mHS5aPCWr9C8kt6qvrmEQlq/hhUl0JntuIRl4ooGTKFuTYeFQbBJWEpBRnxVX4AuCrtYxfuTt
 qaUieAG+L2Lh8eOO46mGL51oME3a/Pt3cYq3S4ClGHdewhKF4jjDM/yCrMXHWSL7GW43AgFZ4
 hG9dQ/2fSzKU6+uI71ILcEySFtKXBu0bkrvriAZNmTHK3GBBaB+0XelHJNqM8pvnztorppTnw
 0dhOO1mEDODMYARlcs3xrkDUonRphgTg6brzfqjFY4UeIfa6in9JnB8C6klm27Jkhgl1zFxkH
 sPbbB8kT0k8i4liJWdlNDBZfW+y6J3VQiOgccZjFRTMMUbVVVNfPD638EoF7nNXHNaAOZzHda
 GBwvDXiF0fba23BfBQaA6OtkbEUVTWtw66TgrMpc6QohFO+cbBYqc7K5/CLP4OO5c3DjE1AGT
 xr6rg2ANTr99ExHHbaMnpO+hH6H1qLYItwLHtU5U8RLuC2fLCfde6P652ohLwrA8+hLN2JzRl
 KLIl+qt9pXYfh3Hu8wTbVzLERGeVEWWf5Gdrtfji5w/pL2tEi48xEzb5ZZL06GTbDGTeg+5jc
 Aaefa5mu6FDDHBp0iPRrsUV//W4F8Qv+5fQ8nAfacEmDom38fw7CWaa5TQ0m6ireWXhqwBSTF
 x62Hue/weQn9q9xcjJMcXhQ9iYHsexsRSGdF8dar9onYy03J2z8mxMf3JcC6UZw62Cu0T5SdQ
 UJlF2rSzo1FB5i12XR9FCmfvqL2vGlWu3bWNl/QO5Bpl9vR5+vy2GAheydCO3RnHoKC+6UZgu
 +ZfOpCRTSrBEz4BRpDMzF+x3IHta5ATPzPlj/Qu6//tqmUDc2Hx8IJzVHwC/j9kegC7CcLzKN
 w2qbdry6GCcM8hYnAMz/q9dNgEge/uAgdqf+ltVaSCy+hZUrX90hOGOcFXePcFcs/U6AYpRU8
 8PymUBLLXFrG/QLIl854GkUpGv4qgIRtA9AG0MIKYx4PhXMvMlZYv
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 6:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Hi,
>
> I tried to cleanup few warnings in S3C machine code which lead to
> finding some bigger issues.
>
> Patches touch mostly the ARM Samsung machine code except patch #1 (clk)
> and #5 (watchdog).  They are independent from each other, except
> some conflicting lines.
>
> The last three patches would welcome some testing... as I did not
> perform such (lack of S3C hardware).

I have an older series that I mean to repost. Please have a look at
the s3c-multiplatform branch of
git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git

The patches in there need to be rebased on a newer kernel, which
should be easy, but they will conflict with your work. If there is
anything in there you can easily pick up into your series, please
do so.

       Arnd
