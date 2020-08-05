Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E11C23C2E7
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Aug 2020 03:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHEBLI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 21:11:08 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:29223 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgHEBLI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 21:11:08 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200805011102epoutp049f944f0cc1cc697fffe2100db01e59b1~oOgVu00Mx1854518545epoutp04F
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Aug 2020 01:11:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200805011102epoutp049f944f0cc1cc697fffe2100db01e59b1~oOgVu00Mx1854518545epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596589862;
        bh=KbCNbDMefhUKUbaajNsecum/XHQG4c5fyXLbqxhiJ5o=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=PkyKC3jBH4e6rISn6xyBG+EC2Ct7cix9j6XueUCQhlqe7q1dRCPpnBvZh9P/kr2tU
         Fw1Pkzoa6uDW8AZ3pm4+P9iKYZiIiPjOuNtGosB4yhrUvwkp3FTQTKR8EkrxNs/3ee
         0XSQ16sydzGRtMxD0ojlyGhTOI3JZHo0PdQuTKdg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200805011101epcas1p134440b8ec7af625f204b01561337fc4f~oOgUDj0by1284812848epcas1p1h;
        Wed,  5 Aug 2020 01:11:01 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4BLtq64hQ8zMqYm6; Wed,  5 Aug
        2020 01:10:58 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        85.87.28578.2270A2F5; Wed,  5 Aug 2020 10:10:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200805011056epcas1p3bf9fd741d56d48ac5768a6a5e90da1ff~oOgQCGJYH0168901689epcas1p3T;
        Wed,  5 Aug 2020 01:10:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200805011056epsmtrp20e45b5cbcf7fadd254d3f86828ae5cd7~oOgQA7Fg90232902329epsmtrp2R;
        Wed,  5 Aug 2020 01:10:56 +0000 (GMT)
X-AuditID: b6c32a39-8c9ff70000006fa2-5f-5f2a0722e5a7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        6B.A8.08303.0270A2F5; Wed,  5 Aug 2020 10:10:56 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200805011056epsmtip2170aeeb40ed95d556a30fc7c39949768~oOgPrgvw20930009300epsmtip2D;
        Wed,  5 Aug 2020 01:10:56 +0000 (GMT)
Subject: Re: [PATCH v2 01/13] clk: samsung: s3c64xx: declare
 s3c64xx_clk_init() in shared header
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
Message-ID: <0fe2b0fc-6a41-3063-a407-5568e3bf28af@samsung.com>
Date:   Wed, 5 Aug 2020 10:22:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200804192654.12783-2-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTP19sXRPRSFD+7ZcM7zUaVRynFDwTiAri7aCbZ2BYaZ+3gDgjQ
        dr2UiCMDnPISRFgYUJ4KzgjIEBgTBjSCjjHADpGXEZG0bLwqKoM6EBilmvHf75zvd87v/M6X
        w8V4tRw+N0IeQ6nksiiCbc1s7HB0cSI4Aqlr7T8EumHoBmgl5zcOmvsxA6As/QyGdLpaDuo9
        M8tBdfpBFnqW8YiF8nVtDJQ+aGCh4Zo2DmrPbQXIcKmHgZYbk5jo+u1RDipZuc5CfX8EoPk5
        LQt1zKaw0OrgDSYy5fQxUf3DQjZKmZjCUGXzS4DOPhQj/dQqhsYzCtmH3iCrS6oB2T/Yh5HL
        SzmAnBs+xyHLu4cAmVUzzyKbNKMcsq4yjU1eq65mkfUVCWRe0Rog62cmMbLJlMghLzRUAlI3
        m8skb7UJA3mSSO9wShZKqRwoeYgiNEIe5kMc+UTqJxV7uAqdhJ7oAOEgl0VTPoT/0UCnwxFR
        6+shHGJlUer1VKCMpgkXX2+VQh1DOYQr6BgfglKGRik9lc60LJpWy8OcQxTRXkJXVzfxOvFk
        ZPhY8TJHmWF9qiA1D0sEJk46sOJC3B12jv/KSgfWXB5+E8DZtX6GJXgO4KO7f7MtwTyAf02c
        YbwuGTOuMs2YhzcDmF+mspDmALx6P2e9L5drh38JjUMJ5vx2fIANCy4XAXOA4Z0AjhZOsszV
        bFwAtZPDbDPehu+GAy/0wIxtcF/YlDm6gZn4Hpg5cg8z4x34Z7Cr8ewrji3sKjBsTGGFi2Hz
        2NoGxvCd8IGhlGHBb8NfjEWYWRjii1awQpvENk8HcX9Y852rxY0dnO5seLUMPpx/0sq24G/g
        ta7bbEttKoAN2j9ZlgcR1F75nmHug+GO8KdmF0t6N2xaLgYW3a3wyUIGyyJlA1OTeRbKO7D/
        8eirJe6C5Slp7IuA0Gxyo9nkQLPJgeZ/sTLArAT2lJKODqNooVK8+bfrwMbpCDxvgjzjU+d2
        wOCCdgC5GLHd5tn8u1KeTags7jSlUkhV6iiKbgfi9f1mY/wdIYr125PHSIViN5FIhNyFHmKh
        kNhpM/7AQcrDw2QxVCRFKSnV6zoG14qfyMiUuAsFPS3vi2aOVQfvUfUuHYi1H8m8sLCQ77t6
        /vefj+7ty1NP9d87NxEfEFQwfuWLsLGCt9wP9lBEYNXIZGzyiQ+Pv0g/aJd2NX5tOtjVKzn7
        sBe+slgliTPdqgz2G+V1lIQcjyBUFaZdn/qeLJdUhGwJGnp52cV2YKb0vPrfx0bdhLi0K9da
        8qZg5U7GfUH24r6qr/gt72XtD4iyTdPHJRlNxjunTeIx/2NLddi+LaLy9unE6NyU5/Ofc1dO
        5DOHezW0W9DkD18nPN27LSl08YNTHhId7XeI2ef7kf0lfbf3fklrC98wEl5cdfHuWqS/NoFW
        bz0ii9cG5HzrOFMW+LE/waTDZUIBpqJl/wHhKKhdwwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUyTVxiGd95vmjS8FA1HcdHVD7QGpDrNwSG6r+QIf2RGZ9SAdbwDMlq6
        VqYuMVbDgrAKGwmgbUUUQmZTmUCD0ihq2ZjOTei6tXWCTFqkDGplDYOJVC3NEv5dee77ep7z
        43CkxEgv5gpVhwSNSlEkZURUR7d0afIyVpabese/GrX67gE0W93DomCzHqAq7xiJenuvsOjX
        k+MsavO6aDShf0SjM71dBKpw+Wjkaelikb3mBkC+C78QaKbjBIUu/zDAovrZyzRy/PwhCgVv
        0qh7vIxGYVcrhaaqHRRq7zcyqGx4lERm2wuASvs3Iu9omESP9UZmWyK21FsAdrocJJ55Xg1w
        0PMVixvvuQGuagnRuNMwwOI2czmDL1ksNG5vOo7rTC8Bbh/zk7hzSsfiSqsZ4N7xGgrf7pLv
        kOwVpecJRYVfCJp1GQdEBYPnZli1XnTk7Kk6Ugem2AoQw0H+bTgYCFMVQMRJ+GsATjdcJKPB
        Iljr+PE1c685HnZ3a6OdAIAnRmxEZB7PH4QB9/HIfAH/kIF9egcdcUn+LoAjntio0A5grd9L
        RQKGl8Gbfg8T4Vj+LfjHtBdEWMxnwM7TA3NM8Svg6Qe/zT1iIb8bdjZ5iWgnDt4965vbE8Nv
        hLbBl1T0WBJ8UR/tk3wC/NN3nojyUng1YCK/AfGGebphnmKYpxjmKQ2AMoNFglqrzFdq5er1
        KuFwilah1Jao8lM+KVa2gbn/I5NdA9fNz1LsgOCAHUCOlC4QT4SSciXiPMXRLwVNca6mpEjQ
        2kEiR0kTxJOGCzkSPl9xSPhMENSC5v+U4GIW6wiTKXDq+8drTPvLnq1dX3cjxb3PH7t1PLzy
        mLFnuzrN9HxTFnb2Fet3ZSsFxqXfZFdtcP5DJtlqsjr+Kxn6907fyuDkFvbb9K2lmz0L74/S
        Es9FiTXO7W5ODDm3D3LkjpOr4qq3lQ3pLEMPD5SLvk4vra38q7L/WKBl7fmnzbM1G1ot1qs9
        9gRT3QfOn/as+8i3N/Pc7QbzsonUW13h2eTvCu9bs62N+JLbvzzZsWLn3yVL3ojLes+vm2n8
        3d9mG55+9+Ni7tPQ5xl6XZPCuXySyct8ZJTkpL1ZQOQclGcPc0np3idXgu83pmb66sVn8BP5
        OyPX95se5A2Vj+UOZ6QlV0kpbYFCLiM1WsUrNx22L64DAAA=
X-CMS-MailID: 20200805011056epcas1p3bf9fd741d56d48ac5768a6a5e90da1ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200804192731epcas1p2612b16d6fa53bb30fdd289bfd835f3d8
References: <20200804192654.12783-1-krzk@kernel.org>
        <CGME20200804192731epcas1p2612b16d6fa53bb30fdd289bfd835f3d8@epcas1p2.samsung.com>
        <20200804192654.12783-2-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Krzysztof,

On 8/5/20 4:26 AM, Krzysztof Kozlowski wrote:
> The s3c64xx_clk_init() is defined and used by the clk-s3c64xx driver and
> also used in the mach-s3c64xx machine code.  Move the declaration to a
> header to fix W=1 build warning:
> 
>     drivers/clk/samsung/clk-s3c64xx.c:391:13: warning: no previous prototype for 's3c64xx_clk_init' [-Wmissing-prototypes]
>       391 | void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> ---
> 
> Changes since v1:
> 1. Drop __init from header (as suggested by Stephen),
> 2. Add necessary header and forward declaration (as suggested by
>    Stephen),
> 3. Add review tag.
> ---
>  MAINTAINERS                       |  1 +
>  arch/arm/mach-s3c64xx/common.c    |  1 +
>  arch/arm/mach-s3c64xx/common.h    |  2 --
>  drivers/clk/samsung/clk-s3c64xx.c |  1 +
>  include/linux/clk/samsung.h       | 24 ++++++++++++++++++++++++
>  5 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/clk/samsung.h
> 

(snip)

Looks good to me. Thanks.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
