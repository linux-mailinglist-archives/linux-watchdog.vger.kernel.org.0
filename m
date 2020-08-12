Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FCB242EB1
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 20:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHLStk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 14:49:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60961 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgHLStk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 14:49:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200812184937euoutp02deea291e20cbc16c0cd2a2730ac97b05~qmdmU0nhT2767127671euoutp02a
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Aug 2020 18:49:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200812184937euoutp02deea291e20cbc16c0cd2a2730ac97b05~qmdmU0nhT2767127671euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597258177;
        bh=s3ZHCEzw9q2HR8CaGE1flMYvKuALZpBvcp7A5ytX9wg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=CXLJ2wn2tAaKhU6qzh039Q6gKstyZ/XtRe6Uwxgyp5cKKXolrBOXi74j8aC6MdO88
         kthRe8K8Ab6aKkt/MrBblwunZmHXoiqEt/1OlXxKGtpMElXTjMpTf1RkXJvty0CDZ5
         sAEcZNumxtSbpzYyQ4BXXLTJFxjbqSx6Hy1jzKXE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200812184936eucas1p1327b48495e28f400f22281c85890397e~qmdlQqpVw2581225812eucas1p1Z;
        Wed, 12 Aug 2020 18:49:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 4A.82.05997.0C9343F5; Wed, 12
        Aug 2020 19:49:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200812184935eucas1p2e8bf2589f1b82161237144d48e6ef374~qmdkCi-hb2980129801eucas1p2q;
        Wed, 12 Aug 2020 18:49:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200812184935eusmtrp11d352cc340aac680aaecd17a9a7fcfa0~qmdkBqlIo1774417744eusmtrp1s;
        Wed, 12 Aug 2020 18:49:35 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-a1-5f3439c04221
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 96.1D.06017.FB9343F5; Wed, 12
        Aug 2020 19:49:35 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200812184933eusmtip13e8e059aeb5b035461182d7779562369~qmdiZj2x70951409514eusmtip1c;
        Wed, 12 Aug 2020 18:49:33 +0000 (GMT)
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
Message-ID: <c8a36f33-74d7-96d7-b297-3488874604ad@samsung.com>
Date:   Wed, 12 Aug 2020 20:49:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812171329.GA3420@kozik-lap>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0yTVxjO6XeFWP2oGN4UN03jXNgyKt5yvMSImXpiiC4u/lkyWdEvQAQk
        raDoD6uiMKhYa5CtJYqbOO1KVWAomFVs0KpFKyEW1GKjFDfESgwYAi0w2o9t/Hve55L3fU4O
        TynaWCWfnbdP1OZpclRsLN10b/TxV62rlqcvGX6txNcDboTHTfc4PHjJgHDX8F8MPtU7QGGP
        5xqHHx19x+H6Xi+DPxheMvgnj0OGy7wBBnfbHRx2Vv6JcOBCuwyHmo7QuK6th8PnxusY3PFw
        Ix4avM3gCe91Go+YOmjc4LOwuKSvn8LWljDCxb4VuLd/gsKvDBZ2fSKxnbMh0untoEhozITI
        YPdxjvzq7kLklH2IIc3mHo7UW39kyRWbjSENFw+TqupJRBoG/qZI84ieIxWNVkQ87yppcseR
        8o3iu9i1u8Wc7EJRq173Q2yWoczJ5VdSB173DCA9csvKUAwPwnLoqi2my1AsrxAuI7h9v52S
        hmEExb+HOGkYQuAKNv4XGRhtnxZ+Q3DB5p/Of0BgDryKuuYK2VASvIoiOF5Igq7xESZiooQn
        PFzzn40KrJACJ+9WRLFcWAcf7ZZomBY+g962GjqC5wk74Q/XU5nkiYMHPwemeJ6PEZIhPLow
        QlNCAjwPnJdJeAHcCFZHO4BQHgMlpXZWOvtr6Ktu4SQ8F966GqfxfHCfMdBS4BgCw60XnDQY
        EfhdNUhyrQHf4zE2spmaqnO1RS3RqeByGZkIDcJs6A7GSUfMBlNTFSXRcig9oZDciyBkrZp+
        RSWUByZpI1KZZzQzz6hjnlHH/P/eGkRbUYJYoMvNFHVL88T9yTpNrq4gLzN5197cejT1t90T
        ruGbqCWc4UQCj1Sz5MaxZekKRlOoK8p1IuApVbx8wyP3ToV8t6booKjdm64tyBF1TpTI06oE
        +bJf+r9XCJmafeIeUcwXtf+qMj5GqUfflqeJ+ozVVZs9qxduzzc5TgdH1XVCee3k59qnGYXG
        ogMpfbIKdZK29dNjG3zmHR3G+2r32BO7v6Z1Tqo+tTnwiaVRtSVpVfy44469eWOn0uR727ne
        vjWRCVXGbZvFhqliY9qhLP/B0k21X94KH/dWPLCkLX5PnUl/82zlyR3kporWZWlSvqC0Os0/
        +2K9mtcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe/bcu3utFrer0YNCyYWQgmbXl/bYi0j0ciHo9ZuVa+hNJedk
        d/b6IYvCuiw1RaxpVvSGY2pqWEqZLtNqC1vKlHBBbWW5SqJi2KblHIHffpzz/x3OgUNDdoiM
        pfMLTaKxUFfAKecTjul+z+onaSnaNa/LCNzicwA8VdlH4Yk7ZoCHf42RuNzrh3hg4B6FX535
        SuFWr5vEP8zvSHx5oEuBZbePxCNNXRS2Vz8G2HfDqcDB9tMEbuz1ULh+qpHErpdb8M+JJySe
        drcQOFDpInDbaK0Sl378ArG1MwTw2dFU7P0yDfF7c60yI06w1duAMOh2QSH4pxIIEyPnKOGm
        YxgI5U0/SaHD4qGEVusFpdBgs5FC261TQk3dXyC0+T9DoSNQQgll961AGPhaTQg9XfwuNlO9
        wWgoNonxeQbJtJHbx+MkNZ+G1UkpaWo+WXNgXVIql5i+IUcsyD8iGhPTD6rzzLKdKqqGxz54
        /KAEOBQyiKIRk4L8k05KBvNplrkN0GNXGZABPdOIRdfOcpFMNAq5ZWWYWWYCIOfDBWGOZvJR
        6bdmEOYYZiUangqQ4TmQGaHRjapmZWToOIGG3wwS4ZSS4dHFZ2WzhopJR7+bame3IJgVyNt7
        fTazhMlC3ot/YSSzGL244iPCC0UxahSajA+XIZOAQvVvYISXore+a4oIL0cPvtXBCsBa5tiW
        OYpljmKZo1wHhBXEiMWSPlcvJaklnV4qLsxVZxv0rWDmo9r7Ju8/BPL3vXbA0IBbqKr4k6xl
        Sd0R6bjeDhANuRjVpleOLFaVozt+QjQatMbiAlGyg9SZ2y7B2CXZhpn/LDRp+VReg9N4TbIm
        eS3mlqrOMz37WSZXZxIPi2KRaPzvKeio2BJgrr3AjTfvPnc3mGIa3/FLszkUPOZ8XrXtlpJf
        ERwam7eL7vJltNmWOZy72bEPrB3GXZXlmk+PptqLtm92rR/tbgycyPjuOdpb9/K0VN1yMq85
        Z9G9hNfroXZVdOZIXFbnjtKtO2t0K7OfrnvbkBg4lN+t6g/6A2KCtWdPP10a5AgpT8evgkZJ
        9w8p+097ZwMAAA==
X-CMS-MailID: 20200812184935eucas1p2e8bf2589f1b82161237144d48e6ef374
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
        <828b3dd5-31f0-0414-e6ea-7629b063e8ce@samsung.com>
        <20200812171329.GA3420@kozik-lap>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12.08.2020 19:13, Krzysztof Kozlowski wrote:
> I'll start then with S3C camif driver. :) I guess
> drivers/media/platform/s3c-camif/ still should be left?

No, if you want to remove the driver then this whole directory
should be removed. The driver also supports the S3C6410 CAMIF
but there is no s3c6410-camif devices instantiated in 
arch/arm/mach-s3c64xx either.

-- 
Regards,
Sylwester
